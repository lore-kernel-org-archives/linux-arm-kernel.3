Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E9DCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8f1tLJiBq9vDN/PBOT5hp9SmKuGgL9XgSOhE6RPUfA=; b=oDYAUem5f2zbDP2kzHvg7tp4sr
	ap4rNQWCi0jpovdYR5wvERGv4MaV8Hs+5critAXDqVw9dYnR1S8ccxBTRkvUuu+GnujFhPlXAAqEn
	UEkYG2Kj7yjnE8LnMsFADTh4AjVETFL/8SsUXlqbICSq9mCj8envJaiHr3sQSBY4T/mQ87MhvaSMr
	W928cFC3J5UDrWUhbAHXzgRYskdw64Qyz556CuVpy1VaEgDRQy2gOyqYQ6Srl0PLToGaGOZ/hdAUC
	Cdwy8cqpKN44GZEI1s+6p7zWxnYpbhwN+Wb18qzj5/MJRCIJ13hEYezJWXiqOYbGdMuCN5k+8u28c
	tbtkmkeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0up-00000007ALC-18IJ;
	Wed, 30 Sep 2026 20:28:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0um-00000007AKp-1ybA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:28:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 518F51A1071;
	Wed, 30 Sep 2026 20:28:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 06B0260749;
	Wed, 30 Sep 2026 20:28:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4906C103284B8;
	Wed, 30 Sep 2026 22:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790800108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w8f1tLJiBq9vDN/PBOT5hp9SmKuGgL9XgSOhE6RPUfA=;
	b=1JO7n1Jjj6ESOL5u54mDWgDWIgm/CnxkBizLLLxDfmEjp1lGa/kxtXnH1LNfK+jjgb+ypI
	68A8rDUnMhndSXZ3LrEi3MgLBCn6rjVs64wnTGIYo4Bsqef8g+dFwuGUiNQz+sLuoZ1Xm+
	mNRDbXOYYsFnw95j5SgCYnNtW/ZCNfcSnd7AqbvuLlNZZ2qOa50y5TeVtosEuZ2duLmb9n
	VrEDWVM7ZnUSG57Hh8skU6KYxin1/4YnDlipFIa7WmoJqv8ypS568xHlEXIGqWW8Q4dfsU
	OvnSUf2MTx6CmpVmivbttI7cUyM1M5rIiXIIGk2ib2EliiXyKqigiY/QlBe8cw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Qingfang Deng <qingfang.deng@linux.dev>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Gabriel Rodriguez <lifehacksback@gmail.com>, Qingfang Deng
 <qingfang.deng@linux.dev>
Subject: Re: [PATCH] ARM: mvebu: fix Cortex-A9 errata selection for Armada 38x
In-Reply-To: <20260920040738.466563-1-qingfang.deng@linux.dev>
References: <20260920040738.466563-1-qingfang.deng@linux.dev>
Date: Wed, 30 Sep 2026 22:28:24 +0200
Message-ID: <87y0ci7ac7.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_132832_686772_EF6C49C7 
X-CRM114-Status: GOOD (  16.62  )
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

Hello Qingfang Deng,

> Armada 38x uses Cortex-A9 r4p1, but MACH_ARMADA_38X selects the
> workaround for erratum 720789, which was fixed in r2p0, and omits
> workarounds for errata that still affect r4p1.
>

I think that the very early version used r2p0.

The logs that I have from various Armada 38x show the CPU: ARMv7
Processor [414fc091] revision 1 (ARMv7). The value 414fc091 is the
MIDR. The MIDR indicates that the CPU is a CortexA9 at revision 4p1.=20

The logs that I checked are more than 10 years old. We can now safely
apply this change.

> Drop ARM_ERRATA_720789 and select ARM_ERRATA_754322 for faulty MMU
> translations following an ASID switch and ARM_ERRATA_764319 for
> unexpected undefined instruction exceptions when reading debug
> registers. Also select ARM_ERRATA_764369 when SMP is enabled to work
> around cache maintenance by MVA failing to reach other agents.
>
> The Cortex-A9 r4 Software Developers Errata Notice (ARM UAN 0009D)
> lists these errata in sections 2.3.3, 2.5.10 and 2.3.4, respectively.
>
> Link: https://documentation-service.arm.com/static/608118675e70d934bc69f1=
43
> Fixes: 9aa30f1c13d1 ("ARM: mvebu: add initial support for the Armada 380/=
385 SOCs")
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>

Applied on mvebu/arm

Thanks,

Gregory


> ---
>  arch/arm/mach-mvebu/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
> index 9f60a6fe0eaf..5203b5cfa457 100644
> --- a/arch/arm/mach-mvebu/Kconfig
> +++ b/arch/arm/mach-mvebu/Kconfig
> @@ -55,7 +55,9 @@ config MACH_ARMADA_375
>  config MACH_ARMADA_38X
>  	bool "Marvell Armada 380/385 boards"
>  	depends on ARCH_MULTI_V7
> -	select ARM_ERRATA_720789
> +	select ARM_ERRATA_754322
> +	select ARM_ERRATA_764319
> +	select ARM_ERRATA_764369 if SMP
>  	select PL310_ERRATA_753970
>  	select ARM_GIC
>  	select ARM_GLOBAL_TIMER
> --=20
> 2.43.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

