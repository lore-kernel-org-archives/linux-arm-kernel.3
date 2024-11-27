Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAADD6D23D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 21:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8EVmq9yK79N3HwiRhmW5k5GKfVb5mMq7WA79LDiM8c=; b=hRoiwbnASTreCYWxRR4tp2KkQH
	6Yb5d9GAyE9PdjFcCjP5L9+eKna0Gfpp8B1k7O+E8SYgMHefUMiHdV7Vv7kE7ox5d0icBJ90VEma8
	y9QmDSlkpjRw3XXwZsAljIBe8tD2scNbvPJdVxV4Pzq4CI8I2NDK+38LhyE9vwZLXFv0r1Cv5ewFS
	sX4SjR2w2+5YeKEFQjeeXsTS7CEwWa/0QiCpSUvrOxShMMrWjbDBdNwzpEpFnMKD7uePz2D8g9nfw
	IpnENJcJDmDhIw82UWvoTki/jlbu4emmO0djtLotuMihlokF/qMzT0tvMo2HaoLZv8uKyWl9QdapX
	9Hp9EI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGPFd-0000000E62s-0hmc;
	Wed, 27 Nov 2024 21:07:09 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGPEe-0000000E5wV-27zM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 21:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=X8EVmq9yK79N3HwiRhmW5k5GKfVb5mMq7WA79LDiM8c=; b=fGJQCtlNLqTKDt2sl8pEl1CfLT
	JuLxmsMQvVRyKrmwmkkqPGfh3RXw7QDcQTr9DEoMzrQg+nzOiWaFby9hQST/WP7Yl2Mf4ayA74OYQ
	etNy4EkhAkTlhOygjBvOBouIoJRz30bcyjp8ASec7We1MZlkqPu8U2+wFMQpTP+wtBIi9rHeBHXrR
	t30Ly6UvbVLO4/r0h24DwW9E2zWCU1Mi3tglTbPB0pdp5NTTsRzo+nA73hp6MtkMk3LPqKwTKO/98
	SMVk2fwF/Hhn737OG8BfAfKbVNk+1aaucc5OktW9HO7Fx2Q/66YTtGmmuo6FjPiITA1QwU3IjZDlK
	2O8dWaWw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tGPEL-000IEN-IE; Wed, 27 Nov 2024 22:05:49 +0100
Received: from [87.49.45.24] (helo=localhost)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tGPEK-000I82-35;
	Wed, 27 Nov 2024 22:05:49 +0100
From: Esben Haabendal <esben@geanix.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org,  linux@armlinux.org.uk,  s.hauer@pengutronix.de,
  linus.walleij@linaro.org,  linux-arm-kernel@lists.infradead.org,
  imx@lists.linux.dev,  linux@roeck-us.net,  arnd@arndb.de,  Fabio Estevam
 <festevam@denx.de>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com> (Fabio Estevam's
	message of "Wed, 27 Nov 2024 16:06:05 -0300")
References: <20241127190605.1367157-1-festevam@gmail.com>
Date: Wed, 27 Nov 2024 22:05:48 +0100
Message-ID: <87ed2wfkur.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27470/Wed Nov 27 10:59:44 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_130608_550246_4F159078 
X-CRM114-Status: GOOD (  27.85  )
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

Fabio Estevam <festevam@gmail.com> writes:

> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
>
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
>
> Fix it by selecting CONFIG_PINCTRL as before.
>
> This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
> pinctrl"), but it is the less invasive fix for the boot regressions.
>
> The attempt to build Layerscape without pinctrl can still be explored
> later as suggested by Arnd:
>
> "Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards."

While that is possibly true in most cases, wouldn't it be possible to
use a kernel for an i.MX platform without having pinctrl support in the
kernel. If bootloader or something else before the running kernel have
setup pin functions properly.

By reverting the change, you will also make it impossible to do this
without patching the kernel.

But if not breaking existing defconfigs is more important than allowing
flexible configurations on the short term, then I guess that is how it
should go.

> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Reintroduce "select PINCTRL" as a minimal fix for 6.13-rc.
>
>  arch/arm/mach-imx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index e4fe059cd861..dc47b2312127 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -6,6 +6,7 @@ menuconfig ARCH_MXC
>  	select CLKSRC_IMX_GPT
>  	select GENERIC_IRQ_CHIP
>  	select GPIOLIB
> +	select PINCTRL
>  	select PM_OPP if PM
>  	select SOC_BUS
>  	select SRAM

Instead of doing this at top level ARCH_MXC level, it could also be done
at the SOC level.  Something like

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index e4fe059cd861..26d29dea1721 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -59,6 +59,7 @@ config SOC_IMX1
        bool "i.MX1 support"
        select CPU_ARM920T
        select MXC_AVIC
+       select PINCTRL
        help
          This enables support for Freescale i.MX1 processor

That way existing defconfigs should work as before, while SOC_LS1021A
builds would be able to leave out pinctrl.

Even thouh LS1021A is clearly officially a Layerscape SoC, I think the
reasons for it being placed in mach-imx is that the effort needed to not
do that is more than it might be worth.

/Esben

