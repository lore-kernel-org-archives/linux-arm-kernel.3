Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47141CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0A20oHPdwlwvYfXUnWJzAAzNbt9Wdmj/9G6WPspGzo=; b=LxAnH5FmbJRJt9OuFP8EN7wDNu
	mieqbEUEd08TNYjOujYtmAZkyBkzVS3Kv+gtqByhc9j13ni0xVMDdVs5oQ9v+XW6RbUxNwex0f5IF
	ASqMFv1BAudfJ4hXKL07e/audRCr3yjxYzfMcgl2MNsCcoQ3OjW9VB2Ipo1EDYGLnri8agxQqYW1N
	VJPvTpXygeYSvEeRuWHZCdNm+WgylZtRdqIyrAxah5C+gNMYwHhyeA7AtyimOmJgSbMvcLDTMl9j7
	1U6Vf0ShPO9eIAzdoPrL77BCkcMCHXWlG+6yKiSwmkhVaNhIz7zjY2ac0UU0HGwxDk9W2Ul3srfM/
	hcEhrQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWW6-00000002YRJ-3Fgc;
	Wed, 22 Oct 2025 10:56:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWW4-00000002YQw-2S6j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:56:29 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b3b27b50090so1243124366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 03:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761130586; x=1761735386; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0A20oHPdwlwvYfXUnWJzAAzNbt9Wdmj/9G6WPspGzo=;
        b=Z835fkinxGHZz0DDysOTgmfMRrI10mOKPtH68K3aA2/HG0wcIgDUnIu9VQB+IX2Ips
         Ov92d5CiCnflTDgxXldg0tERMs1vdKvESpP1K8o0vjOMBbQjKbLUQrGHJEV7eTuiI9C4
         Z945C4TF8Gi/k64oALRhaTmZV5zttRRDpJBLMHaSqV1+AdZnt0vmTFaRbqX+DsWmnJ1W
         UdD1D0VKrknAMVSfIy3VBd4xMFmrNGdhaqZW1y5eE9hWuzzexIOXbfZOub0anAlfxLcw
         i/p+r1oN1RCb1PqsH+iR8JxrfgKeNzL+r2LgkK8iUxpDUZCsSJdpNJfPI2YM5jZ2pAfl
         AjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761130586; x=1761735386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0A20oHPdwlwvYfXUnWJzAAzNbt9Wdmj/9G6WPspGzo=;
        b=GbfKmwp8O9yxVp/ZPDtCj4Z/+OGR2iuk+2QIuxhshGal2uLU+6yY7rJAYjGTK0AzEx
         5RK/POYIbbVIgkbFVdDIZc8pNMuJWl3yRTH/4bHz1g58xKCVhhApaAKP17eaf+j3KEIC
         0Tazlpk9iS9PCZhlTm3jpaMrwQ/Kgxf7Z6ueuHFyjsksA63n9QkkDCtPI6FrnJNFmbGx
         lHKPGgi6h5OXSS6jdLCeRFjz+C5mC7avzPYibj/uOpMZCSrsMLMT6bROB1AL/YjuwP+5
         51Kg64ljyGA4KVzv09vxPKQhxR2plIYZOURrD8+fSiUhoead49j74a1uA6GlMd3JGuiZ
         GzAw==
X-Forwarded-Encrypted: i=1; AJvYcCUqd9rSv+PPstcpbiZnGgzt+ZeYW8EYQjJT5A9ctl5W8vrmBGtYX7lIdFsWut9aj3hPlNYwFibkZ0nE6uYrX37T@lists.infradead.org
X-Gm-Message-State: AOJu0YxkwWCtYM4d5HeAuNbthsSH3F2xniGOH+WgknNInu/+hm5kaLO1
	VlWcdLFq1KNtvcqxd+kganzg67Wusug68oEJT26+9EP7ublpaIhej0Df
X-Gm-Gg: ASbGnctOPbjkLJFwefq+/nOIRzH8Utg2+AY9/rAvqVxPoM4IjE9Ea5u9WR+3bX69gfz
	E9LV91egjergaIK5MEAspftj9vlvDWdmqi5pT0YJJwqo/FbSY/hktXgtOvOB4noV+lpCpOSefge
	Ed7wH/3d7EUHWigbkleey9yeD6yX8ROi62QIEi7DhCTOx9yuNglGmE29fZxJt9rI9VOn2R5l87F
	ckzoxP2z/3CMthK6EEWZopW6sqK0rBt2hqK+M6Qtm63dfvlnnqqqtL0zh19Kfr8dkkTDVUMA08Z
	/c3CfVd1qOmq4L8EoC/lTH0m3lv/awJ+dkhuSRGpFG12IrnVgjmDUvMUOrYFw6sWI2czb53BdA8
	39AAsbw2aiLZnofrpafqGlEm4XlvZLtQ6RzSdWq2LuN/KaYNBGYtdF+ebGmFxhDfsv9QORVH2Vn
	eedw+B24RgTHTXMd478aTZpDij7wz7gHhKxAP4w9MSObIdD/CDQCWwWe/IpMneNjmow0I6/f0=
X-Google-Smtp-Source: AGHT+IEdGRi/hFagoGGgzKcGR3Q9DoSBThXuzMQp+xb2RQm2aipBLwQ9bktG/U+2WDFiA7eALZVStg==
X-Received: by 2002:a17:906:da09:b0:b6b:a82a:bbbc with SMTP id a640c23a62f3a-b6ba82acfb4mr887771466b.33.1761130585840;
        Wed, 22 Oct 2025 03:56:25 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-79-17-196-24.retail.telecomitalia.it. [79.17.196.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb526175sm1337364466b.56.2025.10.22.03.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:56:25 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:56:22 +0200
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ye.li@nxp.com, joy.zou@nxp.com
Subject: Re: [PATCH v7 3/3] arm64: dts: imx91: Add thermal-sensor and
 thermal-zone support
Message-ID: <aPi4VqxIF/hltDC5@alb3rt0-ThinkPad-P15-Gen-1>
References: <20251020-imx91tmu-v7-0-48d7d9f25055@nxp.com>
 <20251020-imx91tmu-v7-3-48d7d9f25055@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-imx91tmu-v7-3-48d7d9f25055@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_035628_658698_E02F5D52 
X-CRM114-Status: GOOD (  17.85  )
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

On Mon, Oct 20, 2025 at 03:00:42PM -0400, Frank Li wrote:
> Add thermal-sensor and thermal-zone support.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v7
> - new patch
> ---
>  arch/arm64/boot/dts/freescale/imx91.dtsi | 58 ++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
> index 4d8300b2a7bca33bd0613db9e79d2fba6b40c052..f075592bfc01f1eb94d2a2bd8eea907cc2aed090 100644
> --- a/arch/arm64/boot/dts/freescale/imx91.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> @@ -6,6 +6,54 @@
>  #include "imx91-pinfunc.h"
>  #include "imx91_93_common.dtsi"
>  
> +/{
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <2000>;
> +			thermal-sensors = <&tmu 0>;
> +
> +			trips {
> +				cpu_alert: cpu-alert {
> +					temperature = <80000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu_crit: cpu-crit {
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert>;
> +					cooling-device =
> +						<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +	};
> +};

Here you define cooling-maps with passive and critical trip points. 

I was trying test that by enabling CONFIG_THERMAL_EMULATION and setting
the emulated temp via 

echo 85000 > /sys/class/thermal/thermal_zone0/emul_temp

By checking with mhz (from lmbench Yocto recipe) command I was expecting that the 91 start
throttling but is not the case, Am I missing something?

Thanks,
Alberto

