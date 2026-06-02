Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9BCCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 19:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uspwVvtiltCsqTff8wL3whaP7rrxXxnCkwg5ui4E/K8=; b=W+XK00xNO7FcT3w+ImvpdfVRns
	T0acxghPkxPSp3T2FYIcB0ZiH5ySS10Vd+MqGDl50Ry+yhbMCLCxWin7mbpLeUEZJ/z/69Jw0YIyi
	5CynwpZwU3+KoG8ycSLf+LtRS7sklfUPeorFhxGX1m1/bEGvQ1fWyzNTpSDzICWTxAu+2o961iMXa
	tVqsqZoEwFojHUCaycnRskvuTWfjgcmWhxmPwwhm4cRdFWDR+ObP/qr9IgkHkaRjTiqe9ktytiiH+
	o4buLkDknyHIWtRAKhzlPMhZSaom0Skn1lZgWHQeidVJc92FdyPnLEsoxe4vMbm25ked8mlCKAOAT
	Ox/j1zzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUV7J-0000000DiBm-0wMV;
	Tue, 02 Jun 2026 19:49:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUV7G-0000000DiB2-04ko
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 19:49:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso10729195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780429771; x=1781034571; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uspwVvtiltCsqTff8wL3whaP7rrxXxnCkwg5ui4E/K8=;
        b=FXkEQMmA9WTe9otsYux8jorG8qsSR7c18tsm42ELASJ6hGaM0bxLLia96AG76sFaQg
         9c2msu4NtvK7TUuMOc/drRvyFfViQtBZ1EpQhdQCt8VNfXf9iRJrUeDpO0jZpRiDHDNq
         Scr9b42hcVX82ocO+ZlqAggmp3pYXX5atN/mMIFWuDACWbAjN+d/ghQS8hgfWSM9Djl/
         9Get4+gwsduLdYrXu1BXk0YP7V+Hey/+da2rD941pdyu7x5/pfSBeHzBWSx9fkNwMWC5
         VvvjX++4rpYA2BdJfT+mWqmKj2yzafLabtMlMLNMef9JmqD1L2iBhn6IcC3NaODStzif
         mxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429771; x=1781034571;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uspwVvtiltCsqTff8wL3whaP7rrxXxnCkwg5ui4E/K8=;
        b=qidqzKORgKdYmQegdAC52PAYEO94crg0yj6slht+W05PNayDvhLXT3/qjm2MPhehAD
         cgczdo5k9udnST3OvJcDoM+h/nmNmBeHct+g7IF+k2kImHF6AFCy4pMRyIVSxmdCMUQj
         Mf8kK+nuXcnWh+B//f3f3PSTDLPYgRJMDmVeipVTQa1IlUYXoOjwlKpzSX9V36InzxPP
         umbfDJZk1E7tIX8P08wUhxIhEo7jArCEhNcqbBEYdqSog6S4BorrOOR9M6bn8GO2tKs1
         ptAA7WcWko7IrcV1YVv6HvuhNMSudN6disHVW0ktFRKsuIUl/Dl01vsyEfBDrVbJBA97
         m+Nw==
X-Forwarded-Encrypted: i=1; AFNElJ/5OFgnLCALF1FyAFP5UAaoKKRqfQuKfQ1K2A3NGAN+FJ5Midp1kTgs4REcihmzniv5Q+Q8pNKmBQxgudxyr1uL@lists.infradead.org
X-Gm-Message-State: AOJu0YzgmFXBne5orW1+T4+u1oagnLlTUzUcxGtFawIyQFni4YTIYL4H
	6Dj2WZ7vrpfobcfhzB9pnCN6zDEQaczCMyJU6ARSJ+E1RRE9e1MM+rvSHAJ5yWaSZhY=
X-Gm-Gg: Acq92OHeN/TgSY9QWBJZJHlXg8NdCuRKfNcPLe1gXcFwppv94f7j5RhuCAArnxFfqU2
	EpU2M/fJ2GeYCRa/neOb0anR43n0Q4KcAxxK7K1Rx13Q2fs5Qtngw6grF9fkZuLAHrj53UZ+Iq5
	jV4pZ/qemCRKjZteTMMYE+XuSnmPsYGnKuobg/n0xjM+7bw0ll6H+1pE9IayPhV8s5Y2XI8k/1Z
	r+166IerjvyCd8jfrcwei2yzbj9KCaz5YBeD+7yWBMgD1JtcwAud17+8I5Pd09i5cUnH7ieNan8
	iep2IyF9rGpVXuXYC7b4XiTJpxve9Zk/SBKWQ7RcgeyNY1f6cP1lehLRZB+GkI2G493y2stMjOv
	DjDeVj91KAa9dwfcsqruVim5xhezl0hw9z57MNfB4rgZE3t79437UTtiExt1zkXrYYfwTYoW2wK
	IG2UXqyAWnPe2JR6jhHKFsYSkqjMvMGUYbmLP7MdtfCwwDv7tEVTqC0A4TFRn46chdVMBtN1rI8
	sGaXHX+U3VEqIa6o4afMKPRTELJrovG/kk=
X-Received: by 2002:a05:600c:8b61:b0:490:b1b4:d437 with SMTP id 5b1f17b1804b1-490b5d3e1d5mr4934545e9.0.1780429771536;
        Tue, 02 Jun 2026 12:49:31 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b60f6d5asm3064455e9.0.2026.06.02.12.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 12:49:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 20:49:29 +0100
Message-Id: <DIYTOGU8I2DV.1GKZ59F7AJWTE@linaro.org>
Cc: <jyescas@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter
 Griffin" <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
X-Mailer: aerc 0.21.0
References: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
 <20260602-acpm-tmu-v7-2-8047dd54b0e9@linaro.org>
In-Reply-To: <20260602-acpm-tmu-v7-2-8047dd54b0e9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_124934_082520_2B5FE05F 
X-CRM114-Status: GOOD (  20.63  )
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

On Tue Jun 2, 2026 at 6:00 PM BST, Tudor Ambarus wrote:
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> Google GS101 (and Exynos850, autov920, etc.).
>
> The TMU on utilizes a hybrid management model shared between the
> Application Processor (AP) and the ACPM firmware. The driver maintains
> direct memory-mapped access to the TMU interrupt pending registers to
> identify thermal events, while delegating functional tasks - such as
> sensor initialization, threshold configuration, and temperature
> acquisition - to the ACPM firmware via the ACPM IPC protocol.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/thermal/samsung/Kconfig    |  19 ++
>  drivers/thermal/samsung/Makefile   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c | 618 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 639 insertions(+)
>
> diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kc=
onfig
> index f4eff5a41a84..383ae3f56cbb 100644
> --- a/drivers/thermal/samsung/Kconfig
> +++ b/drivers/thermal/samsung/Kconfig
> @@ -9,3 +9,22 @@ config EXYNOS_THERMAL
>  	  the TMU, reports temperature and handles cooling action if defined.
>  	  This driver uses the Exynos core thermal APIs and TMU configuration
>  	  data from the supported SoCs.
> +
> +config EXYNOS_ACPM_THERMAL
> +	tristate "Exynos ACPM thermal management unit driver"
> +	depends on THERMAL_OF
> +	depends on HAS_IOMEM
> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOC=
OL)
> +	default ARCH_EXYNOS
> +	help
> +	  Support for the Thermal Management Unit (TMU) on Samsung Exynos SoCs
> +	  (such as Google GS101 and Exynos850).

This driver doesn't support Exynos850. There is no initialisation sequence
and etc, moreover the next section is also not entirely correct for Exynos8=
50.
Not sure why it is mentioned here in such way.
(Not even mentioning that ACPM TMU part is not aligned for Exynos850)

> +	  The TMU on these platforms is managed through a hybrid architecture.
> +	  This driver handles direct register access for thermal interrupt stat=
us
> +	  monitoring and communicates with the Alive Clock and Power Manager
> +	  (ACPM) firmware via the ACPM IPC protocol for functional sensor contr=
ol
> +	  and configuration.

> +	  Select this if you want to monitor device temperature and enable
> +	  thermal mitigation on Samsung Exynos ACPM based devices.

[..]

BR,
Alexey

