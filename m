Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFC5C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KosYoYa/Yui4KxcRI6UFcy+899fUvX8OKnJDp/I9j2M=; b=YysM+I/ESM0ASXY8eAvII0Mrld
	ra0v9nrFjfbE7oZMIuXdhBOi2TaxKCBy+yhAKKV6jl2p2Buy0RcgYzYN5XOxByACmb7sHcnnU6RTP
	bN3G00P+hGC7iHf2y8H+oXzJFUCh4nfEC1NUexUZOz0CsIZ6chLpUgczG1Q5SZpYGAnmS8BHboAdB
	wXeQ5Ms+e9lHsi3UjMS5DOj+I04JS9llODUfO5shKWxuuq8GvllPm6rPLyim1K9oS7BvL7fwB0XTE
	yGwriFafNWpMu9p3+fpdTdZAuUhpr0S+JH+3Bnz4VNA8eCSwXQO5sodQHJDFDmceO7lVgUaKCp3K7
	py1y6gEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woT5W-00000003z83-0yle;
	Mon, 27 Jul 2026 21:42:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woT5V-00000003z7r-10yb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 21:42:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A2D560A5E;
	Mon, 27 Jul 2026 21:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C7C1F00A3A;
	Mon, 27 Jul 2026 21:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785188535;
	bh=KosYoYa/Yui4KxcRI6UFcy+899fUvX8OKnJDp/I9j2M=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=K2FSgm4b6sV/L6HXP4hpubIH3BQ4EWynqLn6o9MHR36H3JnsL4IEJMviPrVn897CK
	 QGF1qYyiixqW5X0ozsGzWpjNubqY7KIGIMRkZaQYruAOZIPVdSh0UWx9OH/zIRnOWD
	 ZV2o3Zn8m4ShthzkF3lzUcnXKSyKLbIC8YgFhdOPajyQlc34+fbyovXdr6qnSHatcu
	 p+OG6bi3eMktzKVVmB7aDxxFkHS8exTAWlD0bn0YtTAZsJSD2TdBgBdcixWqQQyq6N
	 pydjXIR9pjROGZVoPMy1nTYV1PnueLnJPq80I94ZttvVc9IyPNg5s2C6ExVbF9EPnm
	 IXsVEk7KuqQmw==
Date: Mon, 27 Jul 2026 16:42:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>,
	Leonardo Costa <leoreis.costa@gmail.com>,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v4] PCI: imx6: Fix i.MX6Q/DL boot hang caused by improper
 PHY power sequencing
Message-ID: <20260727214214.GA1265909@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722071030.2504711-1-hongxing.zhu@oss.nxp.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 22, 2026 at 03:10:30PM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> introduced a boot hang on i.MX6Q/DL variants by reordering the
> initialization sequence, which exposed a critical PHY power control issue.
> 
> Root cause:
> Before commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators"),
> the sequence was:
>   1. imx_pcie_assert_core_reset() - asserts TEST_PD, asserts REF_CLK_EN
>   2. imx_pcie_clk_enable() - clears TEST_PD, asserts REF_CLK_EN
>   3. Link training starts with TEST_PD properly cleared ✓
> 
> After commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators"),
> the sequence became:
>   1. imx_pcie_clk_enable() - clears TEST_PD, asserts REF_CLK_EN
>   2. imx_pcie_assert_core_reset() - re-asserts TEST_PD, asserts REF_CLK_EN
>   3. imx_pcie_deassert_core_reset() - does NOT clear TEST_PD
>   4. Link training starts with TEST_PD still asserted ✗
> 
> The reordering caused TEST_PD to be cleared prematurely in clk_enable(),
> then re-asserted by assert_core_reset(), and never cleared again before
> link training, resulting in the boot hang.

I intend to apply this patch for v7.2, but I have a separate question
about why the link training failure causes a boot *hang*, not just a
boot where we couldn't enumerate any PCIe devices.  It seems like the
link training should time out, and we could emit a message (if
desired) and continue without the PCIe controller.

