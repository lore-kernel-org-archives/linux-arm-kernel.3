Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999A1CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=6RZSAqmHTk6SehAdO+Uvs0SISAtFsddmbBkamguNBdI=; b=TRg61UHo7Scrlq
	fwDyunM1rJnh2ErbNx/wvpX2MRpjY6QFFz57CnX6v66iCI7DrlXfPb9IX6+5Fu3l52YEhHpbvxElM
	KH0lPjrw6ojvVsVykuVsUp+TFabKgBxx5lHvF7zWa8ZhaYhUBz2ph33hpYI2m6j4LC0s0mQYmuZtb
	X2k8ztDzL7KR31R55YBqKYLuyaHyJzabVLUmAT9ubxiglKiBnYjeQkuF+yzZPL8QrB09T5EWvKnwN
	sYeowLnqTLBm+pvzal3mBljzV7GlDVnTPncV3F7IcURCivIX005F7P6ufC7Lk6JMocUPSUsKc4rn1
	CJKX9ZQZGN7ej9A4vJbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3hc-0000000G0ug-1V7n;
	Thu, 06 Nov 2025 17:23:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3ha-0000000G0uF-3n9K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 17:23:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11086618FF;
	Thu,  6 Nov 2025 17:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A333C19421;
	Thu,  6 Nov 2025 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762449793;
	bh=Gw5TYH30f99oo5GV+N2fvATCCzkEDos8mvZjTzd6Z1o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=DgBHopWbQvz5DFxCGmbgRetww5Af5HfRE44GSZZSbnwqAYR9vOj11uB+6AwWJXMeG
	 pySaPgAmNDjwgKVDaDHOG8AxZ2At0nLbP/aD7jTCOSjwjAwat/fMCvmfhDbYewfmjF
	 CYHeCJZasSERVwFyaClXKVeuuEQkYtvtrEgA4sUYDegmdJIVjFKXPgmGlCsmwk3Efh
	 ke32e3NnzgTNhwqDbwgQoasz4m331sLSlOZaXQRFuDyNum99nwBoaZaCcOIcWMLUuW
	 aTUKcd2MYaedHPbu3+M2tAOvOln/iQlp00SDs+zm+K94uG8PSgjSoySDjG+mfo0IjD
	 ypY8P5nb9rewA==
Date: Thu, 6 Nov 2025 11:23:12 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com,
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, cassel@kernel.org
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
Message-ID: <20251106172312.GA1931285@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022174309.1180931-4-vincent.guittot@linaro.org>
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

On Wed, Oct 22, 2025 at 07:43:08PM +0200, Vincent Guittot wrote:
> Add initial support of the PCIe controller for S32G Soc family. Only
> host mode is supported.

> +config PCIE_NXP_S32G
> +	tristate "NXP S32G PCIe controller (host mode)"
> +	depends on ARCH_S32 || COMPILE_TEST
> +	select PCIE_DW_HOST
> +	help
> +	  Enable support for the PCIe controller in NXP S32G based boards to
> +	  work in Host mode. The controller is based on DesignWare IP and
> +	  can work either as RC or EP. In order to enable host-specific
> +	  features PCIE_S32G must be selected.

Did you mean PCIE_NXP_S32G here?

PCIE_S32G itself doesn't appear in this series.

