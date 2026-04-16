Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B41F8DFC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 21:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYKSSik4iHJGZXHi+q1kyedEjJZTQZpwWje/LXfezkA=; b=vwb4zUV+wIFImukGfpTc+KjWOb
	hYbflxtP4phjQUTxUi+ZF2s1qh7jEqKyFYe5ZhK3I7bfKiIYpFAQ4U3SQ/UP53wEFVnPVoIi35KEa
	iv4QJ6ocKG/uNSVrwW/HkNZckaxr6TYSQxkFSzJOlh0W4cXh0sgUEpe9/3sEwFhHxrnQ9c/igiFHy
	jS28QmYWoIKkZoaN3ZVRKAQtcwVaGBLil/fxBDSo+qZ20OCqHeJS2AFZilp7wzeb+Ym3gzvDqJ57c
	v2fsONhi5IgYw/bMH+ZbWbbUzM5gTr2wY/4BgO3KvnwZqKdfzTNG/kLRSnQGkJB3D54/yZTEtj48K
	LX9Rz6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDU5U-000000033l2-0KDw;
	Thu, 16 Apr 2026 21:17:24 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDU5Q-000000033kd-45gm;
	Thu, 16 Apr 2026 21:17:21 +0000
Message-ID: <e7a15679-07f8-49e3-8818-3d4005c085d3@infradead.org>
Date: Thu, 16 Apr 2026 14:17:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] ARM: zte: Add zx297520v3 platform support
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 soc@lists.linux.dev, linux-serial@vger.kernel.org
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
 <20260416-send-v4-1-e19d02b944ec@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260416-send-v4-1-e19d02b944ec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 4/16/26 1:19 PM, Stefan Dösinger wrote:
> diff --git a/arch/arm/mach-zte/Kconfig b/arch/arm/mach-zte/Kconfig
> new file mode 100644
> index 000000000000..24699256863b
> --- /dev/null
> +++ b/arch/arm/mach-zte/Kconfig
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0
> +menuconfig ARCH_ZTE
> +	bool "ZTE zx family"
> +	depends on ARCH_MULTI_V7
> +	help
> +	  Support for ZTE zx-based family of processors.
> +
> +if ARCH_ZTE
> +
> +config SOC_ZX297520V3
> +	default y if ARCH_ZTE
> +	bool "ZX297520v3"
> +	select ARM_GIC_V3
> +	select ARM_AMBA
> +	select HAVE_ARM_ARCH_TIMER
> +	select PM_GENERIC_DOMAINS if PM
> +	help
> +	  Support for ZTE zx297520v3 SoC. It a single core SoC used in cheap LTE to WiFi routers.

	                                  It is

> +	  These devices can be Identified by the occurrence of the string "zx297520v3" in the boot

	                       identified

> +	  output and /proc/cpuinfo of their stock firmware.
> +
> +	  Please read Documentation/arch/arm/zte/zx297520v3.rst on how to boot the kernel.

-- 
~Randy


