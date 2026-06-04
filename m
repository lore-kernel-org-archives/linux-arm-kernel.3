Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59624CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tr8tJV7XonRe9aqon2KQXf6etaodi+ES5SfBfdU6e68=; b=UP4bIIh4uL2ZknM/TJ7EXK1qoX
	apkY9KA200211kj7iiX0qqB8xAyGOxEV+WSDzbQUxbXogAcsMQkUdY8A3n3fWUfCKWYeHnvONOcmT
	eQsACteSs1eQfBJBZUfoBqZ0tFU5iQji8n+xhBlMqQOHfupl+aUf9bwkZi3+pRW0soTF1M1+5iUL0
	SC6ZXKNmzYZjrTpE58MNX8LybYPloq/BezHX4VRaeCQsyv9ZkGf/zo5PyotBmcUIcHG2seO52EhVQ
	jkkEBr34YK+a8PRrMzy9FrZAySuj6iRx4DV7dJY8K0WsWESNlI94xI2MIk5PL5lU0vd03INFJJLHF
	4t76zsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8Uj-0000000Gpdk-2Duj;
	Thu, 04 Jun 2026 13:52:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8Uh-0000000GpdD-0Qnt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:52:24 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45eedc94d37so401856f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780581141; x=1781185941; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tr8tJV7XonRe9aqon2KQXf6etaodi+ES5SfBfdU6e68=;
        b=QfinDZkhFjtzcsIR/VhqakV37J85c71/hhibWKY8U+PlR+NDWcAY/LmOyRcgzHGFVn
         9td8the9BYwrkKRCHydLK1dhRBWMDITsUtq333fUcol6zqsjV/HgpskWdQ99iKW5/NWz
         /jm7RuEZez5yW7tT9pvvze2m41C41To49oLWlnilFIYFRy80gRKxgOvNq8G1hRKA2Qky
         +q+nE0PVSoXRAkIu4JOzBvjW8W+DY6LW4U+wx+49f1p4lPGYnxjDU9310d6dRixMa/Y4
         iOweU6av3ROU/vfNloxSyew8mfyuYkU/5WIM20lTjI65qK5Xuj2ZcLsLegY4Ak6pRyy9
         zH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581141; x=1781185941;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tr8tJV7XonRe9aqon2KQXf6etaodi+ES5SfBfdU6e68=;
        b=Q0OtYe6XMxoefn1qShKTZrl/Bwe1jMGll5d9cQVSdjoAFIeZ4iwzxvDBZmAQHo0oBS
         cwtKpu4EjWQ84vNMQX+QgX+1IadoFwMgFGylw6AZv34QkVTlRNK2rAmn67wm7ffpml1R
         1MYE/RmUoGXvkyd7xVX3yaVYOodtOGQA12RseMgkwl4IGhtxWclLHU48U8fv4A8tX7Ow
         dlyziB0C2qIbjXLdTgEWmi77vw87d6sa26Ctc0FYXL/egJ1wmKY2xiX5/PFpC7HbJDNM
         AyU72w7iO8nEJ9/5Cf1jEj87AK8vzslGsAwPXnFeu3QQsn9NccLaXRGdHI8VZKWu+quX
         v+4g==
X-Forwarded-Encrypted: i=1; AFNElJ/zjWvMSKWPmcun5srt5zxZfXqts30MYCJhJhWTEfFguySC6VIqA7qLvoeV6WucASHtcNin3o04fw6h/pFgZRjM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8G37REtWbTbLsvM4W+wp880w0BMXkdSNks3USoBeJLQD9GXiB
	GF7YSFhbvetvOfn9tDRVQwJsB86aO/QMSF4KE9+Rdvj3ks37bf1jHuNEgNNfjtc0/iw=
X-Gm-Gg: Acq92OFyN2GHcuuOjBFJDTCryw9qXT+qUl9R/+QSyJ3NC4DTrbQ2PnPihRYhf2bK6QS
	FFCbSea8Tfo7aTf8l/w40+CpSfPcShZaoB1S4DhEMbuTF5mirX6BUvgUhbymNZh960rxqQ6orJF
	SyLZvafWGHvLp+0iTpl8yiTklvhqA1dicnjrjtb5WO53EuQstZzTsN7TDr4DacTRpTRxbMpeeQs
	yrlnce7EIgVUKBpgi91AKlOtRZ9bQMbPWd5l9+miRZSBapC9MPPrU6/oV2gv0YSjW36MH35xrOM
	WFdFUKJpwBf+Ugvwd7FZh2xiowRKW0BC+ibJZq2zYmBKCIVzA7Y5B4h8ndwcMEqWqM7j+AMcqII
	PpIHyPCJmQso3U8r5Ne/iRTpxfIvKzFrDW53m+OGMzPcN1bz4FzaextY30W4neR8606nVj5/GTU
	oG72XjUwhzMDt2JDb5a+FNCckAp6BbbRWYw+0Hs4iIkIhC6hnbt3IO9EmqiWJ70tFEhv3aTlvcD
	rSeMSkbqp0sWPH68814ZFe4
X-Received: by 2002:a05:600c:3596:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-490b5edd71amr146656455e9.24.1780581140625;
        Thu, 04 Jun 2026 06:52:20 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm27268044f8f.27.2026.06.04.06.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:52:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 14:52:19 +0100
Message-Id: <DJ0BC2X0G04D.18CIJDSEP0PVP@linaro.org>
Cc: <jyescas@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] thermal: samsung: Add Exynos ACPM TMU driver
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
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_065223_161692_AB6402D9 
X-CRM114-Status: GOOD (  11.62  )
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

On Wed Jun 3, 2026 at 2:00 PM BST, Tudor Ambarus wrote:
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> the Google GS101.
>
> The TMU on the GS101 utilizes a hybrid management model shared between
> the Application Processor (AP) and the ACPM firmware. The driver
> maintains direct memory-mapped access to the TMU interrupt pending
> registers to identify thermal events, while delegating functional
> tasks - such as sensor initialization, threshold configuration, and
> temperature acquisition, to the ACPM firmware via the ACPM IPC
> protocol.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

> ---
>  drivers/thermal/samsung/Kconfig    |  19 ++
>  drivers/thermal/samsung/Makefile   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c | 651 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 672 insertions(+)

[...]

Best regards,
Alexey

