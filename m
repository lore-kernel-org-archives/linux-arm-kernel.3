Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B36AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 10:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKBsYFS9v4iubTvWXqou78ADw4DmyfMOcWadZXgDRNA=; b=lHkRCXsQmM3zEftxChKByNsKbT
	xJrj4O/1KZ1cSqReT7fx+r7zpb5WA9twvE0rWiZoo3MkxNdUyKMAf0hq8bfRCwjZOhT0kfwKrsXgl
	+VPEBlT+uCxgYqzmYAV3AMBB8i5Wi1rFphSlROPymxddB3S86Ox3+zqu0TQQB+MefI8Qm6CXJa6xF
	Cao7zvZ2R7rJ8b0mP6q3OZcosOrkg3AqnY0IlvBOh9krajHwrwo8LBjl+9S9nUvKo+aMzSoty8YqH
	eKdgVsX2Z3IpgQMsBZ36OSwnoHJd9sF5oz6QG3VRHYnALxxnLH+dWjjfmuFn0FOV2zxd9o8JZ3znr
	bT3G4KyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPItz-0000000884q-2z8x;
	Sun, 22 Dec 2024 10:09:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPIsm-000000087wr-366a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 10:08:22 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d3c0bd1cc4so480096a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 02:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734862099; x=1735466899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKBsYFS9v4iubTvWXqou78ADw4DmyfMOcWadZXgDRNA=;
        b=zv5W16Qze2f2oWw1NTXi2SkDzatRTfzpgEFtg1AGgcuaNagmfNEu4OK6tvhpVcYaqP
         vzHgWmMhDhsoJ808owYw5o8zxQsGno2fYzyuGvP3IqXawBbH1hVvQn/Pyg/uiyDj95le
         JwBFesIm/GRF9aYjXBcR9B2u+95KiyN02M+rFTuBKp1R1LXouCwGAzDRJs65kiXQFUd+
         Zou3042ruJ3bydVnPhFssLmP8+2fYgDVpYpmTErprRFYFCfJxCZNNKKTrBiRFwsNCN3D
         TQZ+k21NENyQNSQIF0MF2GQpzKu83CaAnc7WqofmS6cEeV2cQLYdxpHh5aAudASKbELE
         ndfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734862099; x=1735466899;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKBsYFS9v4iubTvWXqou78ADw4DmyfMOcWadZXgDRNA=;
        b=CcERTxoQMNFe7izpMbpHuaRx6SsJyZKsRs45PqIgKDvihQWBZL49FfvIaMcdsYG3Od
         X+yseSp168se68QSO5HBcH27fBmBMekR2d6h2FUdT2t1z33IGRg1X5JQWVNL+zVqSBwv
         yJxPRFltz5pmINt7r716/1iengP73virURKjyR6pHcOfJDcyEKPxfTDOdEf1MD9SbjO3
         5H4BS77dhzYqlBo5LRWc78ddEUw+jbZy8ylDP/eSu3Z2V6dc8Kk/mzYDNGmT+CI566t/
         jEo6NXy7AMx04cS9s4aqAkba4y3GqhQsCXRfwU5pSz3+xIOGz4Z2AMBfSORFTNV7DTyO
         M3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCU+fZ5Ypsa+Z5zAkHFpxtGHYXEj5mDY52mrzcmuUpOrX6cimk52CC+jnpdyGL42kUn5bP2MdAoIPg8QG2L5K+Uo@lists.infradead.org
X-Gm-Message-State: AOJu0YxG0gL3EBGs2L8SJJBJgqoRlzmPuolWt3MJzelUce4QGpStGxhD
	pwATY+l9zDuz6bLgfSzh5PyonPkaPvZLJY2Q9QmlbKRW8ZeG6HIXoPZybbyw/bo=
X-Gm-Gg: ASbGncvNtsPu9zOTSIEf9khgDfORR6vJuehyldySE3p2mHKmu8hnC1fX1H/Z7ZpnCtE
	5dieFbWZ5Fg2RLgIFilJM2d3WZR8Vxo3WpgZ8nMXiUX1AXP/AzV23PQDkKz6jkcOgO+p09bXCmd
	e1BSKznHPekAlyeSamTPk4doH6+zGfsJgRSQyWB0x5lzmKwVWqNjxMOPnNWJ/QPKY9TT/+hulCT
	RNgsIskwqdKqjXhMa2kCHZCvZC/LCTZzW5PLI1DWb8Rv72diKc8FRjMFKiKIpGAGYOER4CvAlAu
	qlMFMXPxJqxl0PycdfjSj3ssxrnoGw==
X-Google-Smtp-Source: AGHT+IE54OW7NxT5X1sBmLNd/D0kS8uVGSQ68xoYttBlaJ2oUwzQEa9S1NxTmY5pBfaOMmcVqyxeVA==
X-Received: by 2002:a17:907:1c22:b0:aa6:8dd8:8152 with SMTP id a640c23a62f3a-aac33559ff6mr278592066b.10.1734862098635;
        Sun, 22 Dec 2024 02:08:18 -0800 (PST)
Received: from [127.0.1.1] (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015b53sm372279266b.163.2024.12.22.02.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 02:08:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org>
References: <20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-oriole: configure
 simple-framebuffer
Message-Id: <173486209717.9271.11039463162908346528.b4-ty@linaro.org>
Date: Sun, 22 Dec 2024 11:08:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_020820_849525_9877B5D7 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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


On Fri, 20 Dec 2024 10:32:50 +0000, André Draszik wrote:
> The bootloader configures the display hardware for a framebuffer at the
> given address, let's add a simple-framebuffer node here until we get a
> proper DRM driver.
> 
> This has several benefits since it's an OLED display:
> * energy consumption goes down significantly, as it changes from white
>   (as left by bootloader) to black (linux console), and we generally
>   don't run out of battery anymore when plugged into a USB port
> * less of a burn-in effect I assume
> * phone stays cooler due to reduced energy consumption by display
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
      https://git.kernel.org/krzk/linux/c/e32a7fc0b14564f9094f90053c74f500809ddf3c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


