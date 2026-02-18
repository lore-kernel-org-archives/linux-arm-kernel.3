Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9AFE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 18:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2HG7dMgFbjsQ2a9OaL1N2Qu53e+VsL6dqqrCn2unbo=; b=nsHMAKGLtXnk8LibyvPGBzvlX3
	qOlTascLDbfztZ8mfzqYWs/N2nvh9N+aEcxAohBMNKoeLagsAci+p7d8Pgz9mv1TmR/1QR3NL6Kka
	qQfZhain/1/8Zb0POIqmgq7tP16OUYG5tnpxDGpK/FxwxQ5v8eVOKwd6JGFnMbxxNOxg/rWu/2ksi
	XH/rrh5N399MunAdTWtJWa55ixaUqLOIn1yqHx2bfuhsHRGKGA20IZhh43rOtvyPcKZ7f1ecNiq4S
	1C7Xzv8e+c4BSRRq68ufI2WaxMiRAfgYJXjb50X5dIxz8Ki8iUBoKfAr87nIZoIVdxwT/mnfTvZAs
	C2stMIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmIn-0000000AFUg-1Xur;
	Wed, 18 Feb 2026 18:29:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmIk-0000000AFU4-1qpR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 18:29:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48372efa020so1080805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 10:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771439368; x=1772044168; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2HG7dMgFbjsQ2a9OaL1N2Qu53e+VsL6dqqrCn2unbo=;
        b=yl0GjSML2EHa10+55wjqFPSgUtC+kK2mvRtsDtIiCH9p0DMvBAXeC9WEz/lwEojn+g
         awv9YrhRy0WfCooPT7KgPbuQWEzNr3uOqp4HWTmE9UhCpEKtgWKSGPhjz+FCTQVvP+kl
         xjNMZsEGYLyCFRb7qI7uU4pU8A/+QEx9dP0qCFiWFwZQbVzBvSvbNM2k/bcFovPgNMVV
         T0Q4fWoTU+q7mkbHNVFGTWldHu8LFbZlIFApQvLbh9ZzAjIcmwAdexzy4V7wkJdubugY
         0X6zusf1GIv1f/vPFG6/84qOwKvZo6RNerUn2rgcr/+R1lYqp0xncz6cz7uZhU3sdShC
         8D5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771439368; x=1772044168;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2HG7dMgFbjsQ2a9OaL1N2Qu53e+VsL6dqqrCn2unbo=;
        b=XvNEgZ8MFIcD8hZFdmpgFKuTxIUuCeOpD/ilH9LCDMg87OIfpTsKIUH9bRlwjdBB6+
         cM4+agZhzVD5ng+PVMtN1vZz4Z/Ve/HIkwYcMYoYThqLy+USC8B1jSIxsQvpY7uwXskF
         iOCVQDRHiFeQ/o1cx+ZlHxqU2eJFkGcQc63n9B7f4+X5rOAnTpZL4X38r28ookCLTyQg
         MqFH/7V/WK2SoSpAB41LxGQy5ZSQ+clL6iCrI3g9MQRpAI7gK9pEPN+Uav38/azVsRQ9
         UoWcTsjefJ+zm/vSl6rI/eGPnb2jsBvDIECtqCQBY3msxnjyt1rcHaN50cPH0Fcy32wW
         px2g==
X-Forwarded-Encrypted: i=1; AJvYcCVS8YEtFwPivH21w0ubVHyGl0yCTNej4/zWp6Mk3ABFLja6Sp7E/TKlhlISvEsWPHO8d48QRB9wqieRCqtIF420@lists.infradead.org
X-Gm-Message-State: AOJu0YwLn4yqWh28o9Zak1/mymvhjcITUCDQtbhQZ+OGDXpjq75KhWy6
	Prmsv5VrPiztFLsWmQ2thfnKkpZQ4II6S3rwu9wWXMPSeQkKZ04zleZjCTepsa5LSqQ=
X-Gm-Gg: AZuq6aKfronRnp7nkaWpZ4j8Yw80odXxICCD/GCaVPRaFcdJjdM2rPbGieOUOwfH4fn
	kqXS+fbcsZVliKNN5nuc9xPeoIW8oq7JDkoNHW+bH1v1peKPieT6B65jZ/sNf1xg6rxiynZn84Y
	8yfNYWDGyeMPDA1tnraNHeuLFGjFIUBqPHNMoSmpYzrKaWo6LElm9/biF+aXWRjAxnJrpc2k00u
	SKl17lhLwuR2tpe1DeILO8LNAH7v4HNfH7mukHUOhKgJIGWq9GaimI+Y381kdmhFWvn7EwF9H2k
	I9HLm4Qip69OsRe6VGCrCGhB/YAFsGPFOSdYKGIsdSKo7iTq2/FZ54CJVbnHx3lzIRRx7oI9NTn
	x2cGKeoQvWPeX7B3zXQwt0McGyGez+0DukD97iG22C3PQo3eJ6l25JSch6BgbEQeO80wvXDIyDr
	SHJ6YC9uNyztb5XNLdFoBA8nRSg/T9v9ZVWGXuEqYgCIRJFkTFLL9/hZq19VD3MVdK8DmrZ4kb3
	2TPy+kCuWJlGN27xw==
X-Received: by 2002:a05:600c:46c9:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-48379bfd71cmr230436375e9.19.1771439367849;
        Wed, 18 Feb 2026 10:29:27 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:17bf:52bc:6ef0:a984])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837e565f5esm439288555e9.10.2026.02.18.10.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 10:29:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 18:29:26 +0000
Message-Id: <DGIAUIFPUHN8.35B5MNEUK1JW5@linaro.org>
Cc: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Bartlomiej Zolnierkiewicz" <bzolnier@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, "Zhang Rui" <rui.zhang@intel.com>,
 "Lukasz Luba" <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 "Anand Moon" <linux.amoon@gmail.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 0/7] Add initial Exynos850 support to the thermal
 driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mateusz Majewski" <m.majewski2@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <CGME20240911121149eucas1p29b9ccf99a545cfaa924b122cd8dd3183@eucas1p2.samsung.com> <20240911121136.1120026-1-m.majewski2@samsung.com>
In-Reply-To: <20240911121136.1120026-1-m.majewski2@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_102930_505941_7AD739B2 
X-CRM114-Status: GOOD (  18.71  )
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

Hi Mateusz,

On Wed Sep 11, 2024 at 1:11 PM BST, Mateusz Majewski wrote:
> This series adds initial Exynos850 support to the thermal driver
> together with its requirements (sanitize_temp_error fix, adding the new
> string to dt-bindings), while also cleaning up a bit (improving power
> management support and removing some outdated information from
> dt-bindings).
>
> Changelog:
>  v4:
>    - Cleaned up sanitize_temp_error a bit more
>    - Modified exynos_tmu_update_temp to match sanitize_temp_error
>  v3:
>    - Reworded the commit message of the dt-binding information removal
>      change
>  v2:
>    - Reimplemented to use the Exynos850 TMU clock: removed the patch to
>      make the clock optional and changed dt-bindings change accordingly
>    - Improved the Exynos850 implementation itself (style and one correct
>      register offset)
>    - Removed conditional compilation in favor of pm_sleep_ptr
>    - Shortened dt-bindings description
>
>
> Mateusz Majewski (7):
>   drivers/thermal/exynos: use DEFINE_SIMPLE_DEV_PM_OPS
>   drivers/thermal/exynos: use pm_sleep_ptr instead of conditional
>     compilation
>   drivers/thermal/exynos: improve sanitize_temp_error
>   drivers/thermal/exynos: reuse data->temp_mask in
>     exynos_tmu_update_temp
>   dt-bindings: thermal: samsung,exynos: add exynos850-tmu string
>   drivers/thermal/exynos: add initial Exynos850 support
>   dt-bindings: thermal: samsung,exynos: remove driver-specific
>     information
>
>  .../thermal/samsung,exynos-thermal.yaml       |   8 +-
>  drivers/thermal/samsung/exynos_tmu.c          | 237 +++++++++++++++---

I applied the whole series locally, it applies fine on 6.19 but I didn't
check linux-next; and tested it on Exynos850 E850-96 board with the
following DT node:

tmuctrl_0: tmu@10070000 {
	compatible =3D "samsung,exynos850-tmu";
	reg =3D <0x10070000 0x800>;
	interrupts =3D <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
	clocks =3D <&cmu_peri CLK_GOUT_BUSIF_TMU_PCLK>;
	clock-names =3D "tmu_apbif";
	#thermal-sensor-cells =3D <0>;
};

and thermal zones as you mentioned way back. It works just fine.
Temp goes up to 48 C with a loaded CPUs and settles at 36-37C when idle.

So for the whole series:
Tested-by: Alexey Klimov <alexey.klimov@linaro.org>

However, do you have plans to update it or re-submit?
Or any other plans working on it?

Thank you!
Best regards,
Alexey

