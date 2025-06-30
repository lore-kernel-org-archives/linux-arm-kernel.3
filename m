Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B69C83000
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 06:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+ucKXlTGds2s7GThwxlN7FGLXCQFZmOc6TZ3BNHKTU=; b=DtW19YV1zzgTJJUbHlHyjYuhNG
	Ey4MHRfBYlWwpJ+aXiSnCnXJo/090UpZVhxOzYqm2UjMheM1qCKwajYxh1kNdCigW65E8oSgK9DEH
	7S3ui2fFYi0JyYOaXg81cGb189h+cBBwxwqpwM/VePc0j/Ns1XXagJVrZ9ccc6pvW5s6nj6fwhHOf
	oTlg2H10Xd/HtuFzlwFeR2PGF5r7kZ+ZkWHxFhFQ21nijXUl0+ZZbY6olj8VvIOsGtMv2pW8cmJ+s
	0ezhFVecOfk/VHyZrqtR/JecDRRhS8CvR+N60b2PViYdAiNpTNyghnXvfeX1uzUYlgw0sYOi+i471
	J5yOixCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8Tr-00000001ORM-0HRV;
	Mon, 30 Jun 2025 06:59:07 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8RX-00000001O8j-1OTq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 06:56:44 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6075ca6d617so682485a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 23:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751266601; x=1751871401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+ucKXlTGds2s7GThwxlN7FGLXCQFZmOc6TZ3BNHKTU=;
        b=ZqZ40M3x2SRDV8/VFlI7HkIan7brMWOsBvQOxhf8wzGVh2DnI/H5/YAq/NtADNKrkv
         VhPYtV57PnuudxGMiZ0+88QaG2L1+QgeSDKgFWTsqhQuqaX1aAZzH1kqgn70nhNXLk8y
         qE1Ymfo9HDaDY38tJ4JAgFT1JXR8xjP4o17bD9XKkwj09hwn4IDoN5pY0A2yP62ggKHp
         +9T7DrijV2J2rI372lHe1vBJ02MFWyHxc/aBMplvkC+cOCyq3r8Po209sZrDP83zBaF1
         jW0v7ZhrLSWsARTRrmATyMctZOMnJkUXbRs/OyxRkl3IAUV3EVHBUTQDcYymD1WHk/AJ
         IDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266601; x=1751871401;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+ucKXlTGds2s7GThwxlN7FGLXCQFZmOc6TZ3BNHKTU=;
        b=wMbmxLqGM9kT3C/c8zZz8RkvXw6KB5U8HQDvB+Hqva/68zV5XHWxi7yJx/BCTgZjBf
         zvNB6FUbPXHzhzTbpIQ2yHsYcJ0n4/z3vJOsgqTfi9ksposy6g52NAlbrxpg/xeOfZHn
         0ydTRmFEgkGIYOUiOY6SQlu87F0eThLAIQM8d+SQZfLxtN6G74FSKcDi7VLXGw/L/pZW
         zi223MUjXs9f5/PVtiW8K/0TIH4TFsQ+IpiNFoztxzJ0IVKai6KFVslDn68E+S5OjsjS
         +/xjObGjAVfOBSqxBqnRUaFRF07nTkySrBiWeYkOUFaK6YMgLMWfXW4K9ikixq+VrJC/
         hKtg==
X-Gm-Message-State: AOJu0YwKMhyYJ3TA5PXalFCTQLqwDBlOpYI+A0xkbb/EkD+r3i5SgTAn
	RT+iazvrMuNJ1MuDrO9rYTsfx0BaC61EY9/j+Vz7dYq7RiOM1/g3ZdofnZM/5+yo0tc=
X-Gm-Gg: ASbGnctrNXVUCx+Kq/duxFunKHla94vBhk/vlNWyf8ZDcH8Tpr8Afr9IwWNlUW0q4+y
	xea45oSTmjrflL8t+G0id+8NgE7AMU2a9vGYJUVl+s9nG5avTEhh5+A+LI7bERiW4ZTEmLgFn72
	RV/YBL/V4SzZLll8LQR7UfPI9lnrsFtjO/GCooi9Kevumg1UehpRyPF686mBkupXp0OzWkVMS2w
	HqmZGr6hAd0aeOGT3TtXwoDk9U/3xxtCxmV/xmG5PP0AiY7IN3d8Eb7avLNOmrkxhR8uKvu/Ozy
	VQi/PWH1vBjY7KEF1HO87Ew0qR/++gq4bKWctUrYM5VFdHOD4K+qYRC92pwRKHOPbqTKtb4hg2K
	n
X-Google-Smtp-Source: AGHT+IGU9xP+Go/413QUXOq1KbVbfMFxzQ8IwfNr4sg069oTmFb0gdttj33NjsLt9OC8dhZXTxaTLg==
X-Received: by 2002:a05:6402:1e94:b0:5ff:9994:92d3 with SMTP id 4fb4d7f45d1cf-60ca35c05b9mr2021686a12.2.1751266601314;
        Sun, 29 Jun 2025 23:56:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb118sm5368960a12.2.2025.06.29.23.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:56:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, kernel-team@android.com, 
 willmcvicker@google.com, stable@vger.kernel.org
In-Reply-To: <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
 <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: exynos: gs101: ufs: add
 dma-coherent property
Message-Id: <175126659939.23797.4726512180709761065.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 08:56:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_235643_380954_5D4A4271 
X-CRM114-Status: UNSURE (   9.59  )
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


On Fri, 14 Mar 2025 15:38:02 +0000, Peter Griffin wrote:
> ufs-exynos driver configures the sysreg shareability as
> cacheable for gs101 so we need to set the dma-coherent
> property so the descriptors are also allocated cacheable.
> 
> This fixes the UFS stability issues we have seen with
> the upstream UFS driver on gs101.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: exynos: gs101: ufs: add dma-coherent property
      https://git.kernel.org/krzk/linux/c/4292564c71cffd8094abcc52dd4840870d05cd30

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


