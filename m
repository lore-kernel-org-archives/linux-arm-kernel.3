Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D954C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kScCCH5B6HIlYQ8SpyD5iNsGwgWDsSmheszSBGTWPdk=; b=DD3g7f+zP5+i9AtCa8L4L9WIdb
	aCeKwApCbZPnQoWzcBb2W8A6PXM0oGQ+GDVLdFkZKNfJlMVGYjO2NnsBE1aH9kQqdK2GYh5JfCbiw
	ygmXKDTuWrEi4I0DLaGn9PQhXFtG7OnAuficRaoidXR4Jdn7Ol/ll9anyU/R9MMAuJFryWCMoJyEc
	VPecG9yn8znBqv/qVjjiDM65Xe2V2SYC5RJKInJ+cOqFX+8Z3RmwrF8gJAsaWMo94BZSObrs/2Ljw
	7C1mregJZA9LRxdfsJSA/3d2KgqjG1JwfPfRdxdWjyzoKIVPHm9+GiN4DIR0YDDQGFhGYlr4iQ32y
	62Gaui4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtpJ-0000000AREY-45jU;
	Wed, 18 Jun 2025 14:31:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpz3-00000009mDX-3Ysn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:25:35 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso635492f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750242332; x=1750847132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kScCCH5B6HIlYQ8SpyD5iNsGwgWDsSmheszSBGTWPdk=;
        b=toCFaFhRBXCIKLKlzLH4ZD8gDLauiUfa/fQjmAhJaEgWigCk2vwCY8tiYzJnNY11s0
         CI5WlTyB35aa/y9y0Ic17uX9yrdRAri3wW/qfP+WiqMW90fLu1fsWWmEKDF1jPTRpIOX
         nz4fPI5Frjkd6T0YmpYK7jSHNLUH4NHGkNuwyLG5xuKWMA16y1D1Mg3nCPbhbYZy0Jvt
         WkuOJ1GuEr4cEP1nIWJkJywSsuPmJKea9WC/h/ohadGroQBxYJu35FHaJoT0nedNkIBW
         irtSiZQHvtNWtlr6NkrifPon7/GhWvgo6YYY2U8VxEA9xtrDOPZx5OGbvBCg5sVNX3XF
         PrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242332; x=1750847132;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kScCCH5B6HIlYQ8SpyD5iNsGwgWDsSmheszSBGTWPdk=;
        b=l3XeDparIuJRBpcotnOA0XodSmFZlhX6Zz5RWONqAxL02L534sdh//GUdgR2v1Xd+2
         nIr5g7U/1hXsRsQdRGh29oVAff0HUcfDJjbrPl/6dW4NkgvZ0I6twLr4BBVIFv7V3ZNw
         6Y1LcNp3J/n5BwNybSgoSFxImUa6okELSlN7IiqnAWYpNnXfjvT1xlQf2hYu/oLdJgnX
         A8IQxt22AV5gRs9idd6+9sSQN8izZoX4loPFVQwr5qfauxf/tu7e/sY7tj1TFp9Z933L
         5BippfgbYWySdm2R7CdqUkA74ZSA9zgkobEJznqhx+ujjf3tnrzujPFhtlcy7diBynw2
         vndg==
X-Forwarded-Encrypted: i=1; AJvYcCVaH13ybZDfVlqdhJyw1+ZH8OrCRPMAzW7oIjXElMCCksT/xykIvHIOQCcit+Li7bbzNp1MQgDENVvaNFK3wxZL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxaxc8nNdGqoiGF30o3OD715qaRTL0+yh4cUQj7AUNVyMccpkqk
	V/HH0o9jOoy3lsgv5lE/Xf7lAmHVitcYAUEZtLpTR79/SsIqY37gZl2Sw36xsSrJRmc=
X-Gm-Gg: ASbGnctedUPByB5BsGLamV+bwRhXJp7UbbeLKKsTGhpYZljzC8OZVzgiQb7cI0pCI6e
	EEAUBc1hkPR4STMOCMRCE25XWmjE+KcMWmr9XnncKdVpkfmXdD5/VXewrUT9z1PftH13aiKj3il
	Fnm/D/ZyZCbwI/7Kx+bWw4Tn457GF2r+Yy9z+WN7bZvpssAje7ZdI1d2XwkaeXQb1wwjWGSDnSj
	9t/ahbazcak8KlpjcrHZZegflKxhA2QZIzDwfoLSHh0/V7UWMNEethwaeOLwq3S1PexVzrcKPlU
	XghNaIhgLoEoNjx3LMtJd0agnMVncbgC2mivgpCyKaMzeOhScCOmLPSuD/+KPfmz1tMBZfqmfNa
	xrRBOIoY=
X-Google-Smtp-Source: AGHT+IHBRUMdMxTk0qQ52qgdxfLoQ44QoZ7cH9BJYyT5RbkqGF33Qob2tRNXh5Ck86JRubBU174MNQ==
X-Received: by 2002:a05:600c:3545:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-4533cae6918mr59442205e9.8.1750242332303;
        Wed, 18 Jun 2025 03:25:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e256630sm208260265e9.29.2025.06.18.03.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 03:25:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Will Deacon <willdeacon@google.com>, 
 Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <20250611-gs101-cpuidle-v2-1-4fa811ec404d@linaro.org>
References: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
 <20250611-gs101-cpuidle-v2-1-4fa811ec404d@linaro.org>
Subject: Re: (subset) [PATCH v2 1/2] arm64: dts: exynos: gs101: Add
 'local-timer-stop' to cpuidle nodes
Message-Id: <175024233092.57697.11258654075985089157.b4-ty@linaro.org>
Date: Wed, 18 Jun 2025 12:25:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_032533_889592_9F528E05 
X-CRM114-Status: UNSURE (   8.55  )
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


On Wed, 11 Jun 2025 10:34:25 +0100, Peter Griffin wrote:
> In preparation for switching to the architected timer as the primary
> clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> property to indicate that an alternative clockevents device must be
> used for waking up from the "c2" idle state.
> 
> 

Applied, thanks!

[1/2] arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes
      https://git.kernel.org/krzk/linux/c/b649082312dd1a4c3989bbdb7c25eb711e9b1d94

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


