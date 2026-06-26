Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F60C43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 13:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwLoCPBMvnE4mFTZ0Iskkh0u0N7Zrq4pjwblbNDMp4g=; b=JlRoKj0iOJdpV88YS2syjDTVSZ
	Idg+S+mVAdqFqPQ3HKB4Fo0nxlhbXuROqWLQ0NwF+Hsi8ijHiAi+Kqi1s0wSWau5u8pErZogJpuMI
	tOnQ14iJ0OCPkaO6o27EYd7G2XYiy9GcnE7ySbVUZg+yBV6ClI+JKFbZcY37g9LxHJ35FiDXvclL3
	3rLLMcqJqSdRlVUQtInDO9J+CwdOZgYqzDzn3vLuHf8rI9kfZoX3lvBStLKm4LUwzdYX2O75DwXvR
	HHxGdrn3jpE7dzwndpw5QVDydcatVDtCIL6/148ZAlsgdPBjBuTln8oLoOEVD+Cj5uE6okoVwHck6
	MeNM84LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6Ue-0000000BMZa-15lf;
	Fri, 26 Jun 2026 13:21:16 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6Ub-0000000BMYg-3x0x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 13:21:15 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-39ad8dbe947so388031fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480071; x=1783084871; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PwLoCPBMvnE4mFTZ0Iskkh0u0N7Zrq4pjwblbNDMp4g=;
        b=SeI4bELlsJ79tx4QpglRJ+usuN3i2f8Kv/qwXr5SMsYXxqXMXDuagc7ZkWkC72b0n4
         HVNBg6QN2MhkH0CpTSCTIb+tDxdzZ66l3u6ZHE2drEKvl6LflnySgJ3ISbuyPde6xD8o
         ndKYCKULE8JucU2uZo8LVL5LLrEdElHlQh1/hqlVpMny7ZHIlXT+SvepmDaekW5GZ/KG
         ZyyeKTj9fA/NutUHIsyAmRYdsp1YkNtSamGyBC9ZzM5NCNpiACoKF1jnV0M8iZyiuHW4
         WwPy/aNVLhyC7qJxFUcG9t3Z7d6F6cbPuUabWc1Wb7WdlEf4JI5nB1XxEtnAd6EGhX4b
         ZbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480071; x=1783084871;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwLoCPBMvnE4mFTZ0Iskkh0u0N7Zrq4pjwblbNDMp4g=;
        b=gBduTiMq15RmCEtFQmpQCl8vUPVCT3WcCHm4894Pg3Kw+1mqdcyAQf+A1zdCsrGbyt
         FU2fnIKmeqdpNGLJPiyHvkIqvkUnvMjg3Ft7owo8Ru1reXsv9JkIJij4tjycpO3HFuea
         3z2b8Oh4aFb8oU8HundL3cMx4yVdvX7PDsk52oJBwCynEW9EmfStDtkV9E12xTtZHIHH
         N2SpX+2QSKir+7l8Evqb3GnDEo5tXtQeZAAHSQo8fnQDHaoC7Us0N78ztrkkxpjxcMIs
         iKJs21MxMoacXrmQfEO8HCHQfODI4KPtCIZ8V6+kLT1w/WdfprGpp1m+JKjq0GoEexbr
         LI6A==
X-Forwarded-Encrypted: i=1; AHgh+RpTw2zNU+p/DtjmMF1AHcfY/qsEet1fGno5SZE3UixBlu68s4KBWrv0gfVVSC9PKRwuuDeGwIEvVII3JYWxVael@lists.infradead.org
X-Gm-Message-State: AOJu0YzKMFKiDI4Yd+WhfFeLoDvZa2OGw0/VdxIo3CNFHqD0oFh1wMa7
	8ey470yp4mUPBtDxHgc8OEZTSoPguOiA6YCeutxnSogX/OOrPY6RMFzRALJ9OHwv4Xk=
X-Gm-Gg: AfdE7cl2umtX9j7wTF4LImjoUnUtS6v1bDbJgAWgLm+cwMzZr6xg1EMGnJW7ZW+xQpX
	ip1pNPs5b6g3KJMah7g8ZzAjJeZgJtI7rusMTYiTuVIDNpIBK6qZlRWTHpqkNkOsFil5AnZeDHC
	Q1IVS7y59qQHUC6CKCSV8AJIV8M7R4uVPkrehuNm7UuibF6ihGZT0k+E+pjbeydvzeJ53lucG4J
	FsfBRo5gWd2m+vNv0NVWBh7AtYkdVO9lkItgOgfq5TX00wSOmlWXtfjvkXL3DsD3odP2tIrE2HZ
	yUEggHkN3Wp4OZVqXA/x+L5fHf9C5yIZwb8XPt1shcsct36UGzvXSigV5SaZeErHCzBtJiMX5ee
	TKA8cgxtJ7SN1yhpjvKGKnJMrb9hq69HIsY67D87LidosOiUyI+is4ICUgDTn2W8KCwaCzVS31l
	S5ogXSKRYtNY5ncW9mfQPngcFClX3IWcq/fhMMxWqs/EML/UIDO2SvIkZ+o/nJ9hVffLEvwWwaL
	8q32w==
X-Received: by 2002:a05:6512:1252:b0:5a8:bd9c:a2e1 with SMTP id 2adb3069b0e04-5aea1f3c156mr1200847e87.2.1782480071016;
        Fri, 26 Jun 2026 06:21:11 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad695859b4sm3327909e87.72.2026.06.26.06.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:21:10 -0700 (PDT)
Message-ID: <d14af4aa-f791-4aac-9d49-ace834952257@linaro.org>
Date: Fri, 26 Jun 2026 16:21:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: media: Add macros for video interface
 devices
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_062114_012149_5B834253 
X-CRM114-Status: GOOD (  16.55  )
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

On 6/26/26 15:07, Kieran Bingham wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> defines macros corresponding to the orientation enumeration types from
> media/video-interface-devices.yaml.
> 
> This allows avoiding hardcoded constants in device tree sources.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   include/dt-bindings/media/video-interface-devices.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
> new file mode 100644
> index 000000000000..d2340b457292
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interface-devices.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +
> +#define MEDIA_ORIENTATION_FRONT		0
> +#define MEDIA_ORIENTATION_BACK		1
> +#define MEDIA_ORIENTATION_EXTERNAL	2
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

