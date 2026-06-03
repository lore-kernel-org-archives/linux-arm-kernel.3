Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07C7CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX0a0jpNYBmGFxakN2CbC25kVRva7yDB8L+NCVPEiTs=; b=Gq0nBdKZxWapXC1hf/MH13umwn
	NkIqx2deSfyHz+YkcK9EDsJon5jH7p4vFf73z0Rintas+4tVxl15hLRcq7Z5yiBPjmogl87MSr3FP
	wP8oh4AqGRcBwKC0G/9eGtdmYyXMH5YC52pwic6LRS0kQ/vQgEYKk/oVFWmx/uSKKRvq0Igg2SKLI
	Fz4s/IceOYr7K7IisT3oZP0aSLUH92XVi9LI3HRbsZN3naNtny+9z8U0AMNI+czT2+XgkKzQthRzX
	HQGOnG9HjyLXx7aaGMPTNLWk0lOz0EBlsR4tWiP0eo+5hvEkgVSxc1urJ3/+rpf81amA/ycHwpnCc
	GAOdeQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUizq-0000000EpWx-2Jaf;
	Wed, 03 Jun 2026 10:38:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUizn-0000000EpWO-3zzH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:38:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso16583155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 03:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780483126; x=1781087926; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX0a0jpNYBmGFxakN2CbC25kVRva7yDB8L+NCVPEiTs=;
        b=ycP2Jo6eROlWZPN0m2YWwQAskoplRrStuGt+C/+PqhiKPlLYtM80hT9Yn8jU5uOSFf
         ObNQENI5A88Wf/96rdGpxGvaqvm0DDKtTqnRKrin4t38Y8NKlN1Y78bfMnR6EXNZR5FV
         eZ3QYOvfXPOM6XPHaPUzhEeRPQXVGhm+MQPFPy9BdYLCNEo34Jl6ntvlm42BUxJ5mhm1
         m1wkdllfTwbZDvAbRVkEIjGuWrbt06jm6PDCbHr60LsyQJK7wBtGMB6evIWd/gVfRQle
         BxZmq5rgr/BsoX9kyEb3XGqY7eqk/YcmjMsaxRVCk1Wc1uisBsTPtO3LJcwez6oSvmPS
         1SbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780483126; x=1781087926;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YX0a0jpNYBmGFxakN2CbC25kVRva7yDB8L+NCVPEiTs=;
        b=Q8VGOKSauSxN8pYJhtq8bx9IypeQdUObKuCUxV23EYLI996J0joXNxpfV+sW9QbIDQ
         yO+xfkgvtGgi0q6HgLpThUHqJWDFseMWNX/3GWJQ3uB7RJrQvRSZaVYnlfb7DBvOC2dO
         VFBqRSxOwf98OUX+tTPNBlcDgXtRlEjdQDS5YMOs904dytxTN/S/L8t4510muovvs5ST
         VMXvPCuB36CxpMmXI0dZemWEVCuE3WZ8WhOG9fbbK6J27fEu1aewWpHyR+lrnvObVRrm
         M2YqGU9jI13Y0mAPMNReGq8x3rBozr0sc6++rv6sGQIXjlAnmiFa+KTeaGjHZAgmjaKk
         QOiw==
X-Forwarded-Encrypted: i=1; AFNElJ+TnCa//6GB/zRQS6XV8cibZcX6wpFpzkXBclNQFaOGlcVsvcYr/1Cylr1NqQxDAmYmP1qRJQaTTLxSVEn9HG2+@lists.infradead.org
X-Gm-Message-State: AOJu0YypTaQOuKYWBsQBT0MEpG6rrBxIAKiySviRXCMe+nxDSKg3AKpS
	aVy4kJJKnOeRWsJsNhuf0Zp0UIfMVy1lUDz5LcxEZqWdtsB9zMe+Ntkr3CxQ6BtGxv1RTEQW+/y
	yYlgdcI0=
X-Gm-Gg: Acq92OFV5pDtbP00WxZi26VUvr782zmGyMF3P21Oe4jVEdVVb82W+KG5oWhiXj0p0fI
	LA3sGhUsvv0SxQOgAyGjiTSRIQcMvWTWR99yrOBTG1saySPThIWd9lgd6sXPHAqQJ7lh4BupOu1
	bI1vRt0oAmGAe+mjRHSI19P52VHPdgrYCN4onBAay3nw8EF39Wr4AW8Sx6ALj7wJr5AbJN+w4dD
	L1Cw0DxBKDVwhchMOY9GMWzvM4Uhf1ZFnn7Ucyz7Y3Yf/c1whhVmEqo2ctZyqPfi9+cfkQkCsFo
	mmINWx5MakDAUXPRK4rKaVX1Yy4CHHU+r6ZpZZiHdzrsfXmVwCI4xxcas31OiCwaAGAvGfNFORy
	WMlEMtA4Zo2MIICkyaBUYlocYGezefzmzx5cTI2W/lT5iXN3h1nHVlPhlMzrM7T0RbXm+yyAdXg
	Ay/aqGg/L3D0+mbVjPDt7m8K+88o/Q2b12/3Ry7DCaW25oElFv6//0IWEsNaGqno0yN3UWmXU2o
	/+nE42MvMKSiY1AVynMDaqNwyP/
X-Received: by 2002:a05:600c:3596:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-490b5edd71amr48759235e9.24.1780483125952;
        Wed, 03 Jun 2026 03:38:45 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9b1c:c9e0:4645:9af0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b616d6a9sm49891265e9.7.2026.06.03.03.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 03:38:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 11:38:43 +0100
Message-Id: <DIZCLBAOV4ZM.9SJGGMZONFB7@linaro.org>
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
Cc: <jyescas@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
 <20260602-acpm-tmu-v7-2-8047dd54b0e9@linaro.org>
 <DIYTOGU8I2DV.1GKZ59F7AJWTE@linaro.org>
 <c76c8f9b-bdd1-4006-aa28-735254f0409a@linaro.org>
In-Reply-To: <c76c8f9b-bdd1-4006-aa28-735254f0409a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_033848_013422_5CF2E15C 
X-CRM114-Status: GOOD (  10.06  )
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

On Wed Jun 3, 2026 at 10:26 AM BST, Tudor Ambarus wrote:
>
>
> On 6/2/26 10:49 PM, Alexey Klimov wrote:
>> On Tue Jun 2, 2026 at 6:00 PM BST, Tudor Ambarus wrote:
>>> Add driver for the Thermal Management Unit (TMU) managed via the Alive
>>> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
>>> Google GS101 (and Exynos850, autov920, etc.).
>>>
>>> The TMU on utilizes a hybrid management model shared between the

You might also want to correct this "The TMU on utilizes..". On
gs101-based I guess?

>>> Application Processor (AP) and the ACPM firmware. The driver maintains
>>> direct memory-mapped access to the TMU interrupt pending registers to
>>> identify thermal events, while delegating functional tasks - such as
>>> sensor initialization, threshold configuration, and temperature
>>> acquisition - to the ACPM firmware via the ACPM IPC protocol.
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---

Thanks,
Alexey


