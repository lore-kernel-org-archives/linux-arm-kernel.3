Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98188D41D6F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NDuG/Ek6UwySU5b5S9VUet0r8r0uWRHJmv4yhmBVac=; b=F2w1I0PgUFqVUQaBkQX9n06SVr
	zB+P7hCFIdOUBzkXvsATE2RSZwcbeaopkht1RUulk+zI03KIi9rhK0+HmVcAErn4f13A7MYLxYbRq
	CcpGrxfnlui3SvVSIfH6Vg8IhAhcc2k9eruiZmHtL6I+BxfE0UGm7vRGeDN/HIn/tpUZpwyii5sp1
	sndv1thyR15lpUkFw/g/xvMPvYgQVUtUjDtfCfbHi0SeTtU+4XdDoRtcbd6et+/IdOcoVxbgeLfu/
	Xnma4OE3Vk5+Q5qsXpBB6mD8N++boon6tv7QwNHn0N4Zqh8sT9YQdgem7gR6LL194R6Kt7y4AWmXW
	XObFQ9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAn8e-00000002o9f-3FeE;
	Tue, 12 Nov 2024 09:24:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAn5e-00000002nbW-2RKU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1NDuG/Ek6UwySU5b5S9VUet0r8r0uWRHJmv4yhmBVac=; b=vICjfThpB44W/UUdv+m/03XqST
	kRqQU358wC2WI5j6oEd8cUW80bnT9aTrEjBnSdiEqtH9kn/nqh5uOjLmdrECxfhHGwxIKJRv2VjKA
	kJsiVla4+ogKtXR0sRTSMZOpq/9MZDHLtEa7ZyN1o52dpwrgQYqlFtoGndKN73UvlH9q6I04malso
	YD0niXMR5e9Eq8FUasGM64qwKva0Ng3OiLSGnfmSRbysk4YgIgPltJZqyVwdAdfLuSQIIOClBjyEN
	YJlpdPb3vaVmHC/F216LKeiYlWD01YisBirqDKOCCFCFXygPQYq4I9MIGEKy24RicEwfCEirNJinm
	PlBeVOlQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59910)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tAn5P-0003oM-2J;
	Tue, 12 Nov 2024 09:21:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tAn5M-0007LA-34;
	Tue, 12 Nov 2024 09:21:20 +0000
Date: Tue, 12 Nov 2024 09:21:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, salee@marvell.com,
	dingwei@marvell.com
Subject: Re: [PATCH 1/1] arm64: dts: marvell: mcbin: fix PCIe reset property
Message-ID: <ZzMeELwScAMdrkQ6@shell.armlinux.org.uk>
References: <20241112072049.765097-1-jpatel2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112072049.765097-1-jpatel2@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_012138_645429_8E6D4898 
X-CRM114-Status: GOOD (  17.88  )
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

On Mon, Nov 11, 2024 at 11:20:49PM -0800, Jenishkumar Maheshbhai Patel wrote:
> Set reset gpio to active high
> 
> Fixes: b83e1669adce ("arm64: dts: marvell: mcbin: add support for PCIe")
> 
> Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
> ---
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> index c864df9ec84d..a8c732a47360 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> @@ -181,7 +181,7 @@ &cp0_pcie0 {
>  	pinctrl-0 = <&cp0_pcie_pins>;
>  	num-lanes = <4>;
>  	num-viewport = <8>;
> -	reset-gpios = <&cp0_gpio2 20 GPIO_ACTIVE_LOW>;
> +	reset-gpios = <&cp0_gpio2 20 GPIO_ACTIVE_HIGH>;

Is this change due to switching the driver to use the reset controller?
If so, NAK to all the changes - DT files are meant to be forwards
compatible (older DT are supposed to work with newer kernels) and it
would seem this would break that rule.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

