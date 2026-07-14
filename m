Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CDCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+IqgTtLqmU06ykzHWgWeMa4tUKRNkCPwK4lvVGqOqU=; b=wJHUFqz+lQOt5TgQpxyuWIILVI
	+htpBmc6RXihhSrUURZsaBepAbWPF8UjTldBmYmPsPHc1U2oLbBqREnKXGQ+fX4c3+XlWBHzDoozV
	JVVCgdhv7IkoQidW2aJALMhM//t3b6oPnOqGstCBZn8FgZEWiTxuhiBnXVAGR2mTnHgc8gxB3jRE9
	KYalYndYKbWDmQ+/KrbX08ABjpXMQ3JMLZIiedOaY3EDXaElFJqjPKJwqZRmmjNOW92vOcROwjAcG
	8xOWug2P5C68CZcFDgSY3jIGJIz38Fu/1YioLn2f5ezE9081au2geel2cAHXQfHqrJcyMiPC68vOK
	gorEJCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcbn-0000000C06k-10nn;
	Tue, 14 Jul 2026 12:51:35 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcbk-0000000C05P-37M7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:51:33 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 627F01FF9F;
	Tue, 14 Jul 2026 14:51:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784033490;
	bh=F+IqgTtLqmU06ykzHWgWeMa4tUKRNkCPwK4lvVGqOqU=; h=From:To:Subject;
	b=LetjRNiAcPEps21BsKobVJxmo29ova7pxzA5T2h/MQphr4TZv3QvAK3ixEWinBPN5
	 jGlJ1muMpa3CSRWcKeP61tWn5jb3lz7ASa8j8geoYhY2w5DYeakKcKwo5kqIlSD+nS
	 VDQ/kfMZR/k8gZqIZ9A3InAadDL0WVa7OfebuMq7zItC7o5+fP4d8+PGePI/8FBUz2
	 9f183Hx1MzhU1t9iLAdE928d62/0Pz6cEmE4wFbV2Vu39y7HadnEiwHSOFdWcRPvfx
	 xQ1f4OVlDgqnVpelthMVZG1S4qdBQUXarV9NuytG6ga+EnM9sx7vG6oF0H8raPUMvk
	 TvwUMH6mRThDw==
Date: Tue, 14 Jul 2026 14:51:26 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: bhelgaas@google.com, hongxing.zhu@oss.nxp.com,
	linux-pci@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2] PCI: imx6: Fix i.MX6Q/DL boot hang by separating PHY
 power and reference clock control
Message-ID: <20260714125126.GA84291@francesco-nb>
References: <20260708035928.580236-1-hongxing.zhu@oss.nxp.com>
 <20260708035928.580236-2-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708035928.580236-2-hongxing.zhu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055132_946876_555352C9 
X-CRM114-Status: GOOD (  13.48  )
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

Hello,

On Wed, Jul 08, 2026 at 11:59:27AM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> introduced a boot hang on i.MX6Q/DL variants by changing the initialization
> sequence.
> 
> The issue stems from coupling PHY power (TEST_PD) and reference clock
> (REF_CLK_EN) control in imx6q_pcie_enable_ref_clk(). When these are
> managed together, the timing between PHY power-up and reference clock
> enablement cannot be properly controlled, leading to initialization
> failures.
> 
> Fix this by separating the two concerns:
> 
> - Move PHY power control (TEST_PD) to imx6q_pcie_core_reset() where it
>   logically belongs with reset operations. This ensures PHY power state
>   is managed as part of the core reset sequence.
> 
> - Update imx6qp_pcie_core_reset() to call imx6q_pcie_core_reset() for
>   shared PHY power management, avoiding code duplication.
> 
> - Make imx6q_pcie_enable_ref_clk() responsible only for reference clock
>   (REF_CLK_EN) control, simplifying its purpose.
> 
> - Remove the 10us delay workaround from imx6q_pcie_enable_ref_clk() as
>   proper sequencing is now handled by the core_reset functions.
> 
> This refactoring ensures PHY power is controlled during reset
> operations, fixing the boot hang while improving code maintainability.
> 
> Fixes: 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

What's the plan with this? 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
introduces a severe regression with boards not booting at all.

As of now we are not able to test anything, and our CI is completely
blind on any other issue that linux 7.2 might have introduced.

Is the plan to merge this, or to revert the commit? Any timeline?

Francesco



