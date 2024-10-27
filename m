Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CF1D13578
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXQ3JFixqQMniZyy7iOMgm7iy+AnZBSfPUlWOom5ehI=; b=CDFUh2i4+lYzN+WvBxXomd3c3T
	4kwymTYCQnpB/n2D4FSfTIUgP67Vs5Umjx1TisD417+dZYAjbyxBMsL9IVrhkOvowK4TEsaPtdDBQ
	czQ+LZ8uDEK+v0kEzPeE3YJQURQpnvVWxhSijrYEsQldfgAbol0VoUDjc2DnUKZ/7olcEEPTvIh4b
	umVZCSAOeXXYyPBX/H71zfXuYX4rYU9rJgT05lyPpEUNGLpMHM7D7mTGD+Ugz9ZvrX0R8ys0wW7yd
	5GF2kii5b5cBEctdpKUQJz9Mw8zffM8X9AWIZxB9RuHr0PFMhrDrX9mCS38SaMyRc5ZB0GcQ0gacI
	6WgzhBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59UN-00000008nKT-0LUu;
	Sun, 27 Oct 2024 20:03:52 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59Qf-00000008mQv-1FJN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 20:00:03 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d6716e200so594818f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 13:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059199; x=1730663999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXQ3JFixqQMniZyy7iOMgm7iy+AnZBSfPUlWOom5ehI=;
        b=F5hrvapZb0nvYAohtUF5GyU0vCEcFPXoNWTYsXtxsMvbLMfL0zNA4rIk5VgEgrwUuc
         BHAqUcSIfw/XxU00aM0Y5NM+p/AoKt8kuserl+GBC1Tly1vEH0sdF90qIRSD+PIg2/ut
         zsaySbn4yHCwFw3t9/vUOw97KUeMLyVNIj+vgVAjtSTfjwfWTmbSagh8ONrp5Pz5pxzq
         Qezxpbhtihwkw/XMoutn/TMVVE0uSZmcQMAMM0FSIFjIOayMjZydHvmWx3o5WaXH6JN7
         8+QIfAUyzzIuZ+l66D4VAVgtxRMHnqKp6Uye9jkh9MOfdpewyiZR5l/uTQmEgZwVrd3U
         DAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059199; x=1730663999;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXQ3JFixqQMniZyy7iOMgm7iy+AnZBSfPUlWOom5ehI=;
        b=ex4tiu97n1MR6pWf0py3LQuAQ3wzYquK+XiLLzcfXtRccKHWJ8kBBd5Rlt0JNyo9Dy
         qAfnXTJG3PcK7Q0rotRRB6a3ONa2oRjKBPM+va33Mc8pTFm2pZwolknAFnzg2eDktMZh
         5ubIrqsEKc8485dSVzEngVwAvOkHjGiFmPrUQQGUbBvZAC8JLTj2ToKzaeGmrMUL6E/S
         JNrSvY0DcQRbtL/xdo7e+/M758stG6AZXTFsDIXAPFw6Mo6T+dXZ7ZGG7lrZ9VBut7ET
         GqXWRl+/KNKw/6BZP8HaGKT+BoLf0ZvPIr7rsplDyzPnDCSOfx6bxJLEzQFB3CIEEkVq
         ctUA==
X-Forwarded-Encrypted: i=1; AJvYcCXozLpEQUnbsCEXGKjFx3Qz5cjrmajx0qzU1k7FlHoJ0YItW7/TT0aOUQQrHP7AOKypmzPc91ShcYkdu1ynDqYH@lists.infradead.org
X-Gm-Message-State: AOJu0YyIDjbD7sofZkMCoQAfRobpNeqfsQAZxcWzHmYyYhnViYqptKcI
	l7/78Ex062mWAMMF1N7EPv8SrkFYPvujxCDJ1RkkTfTV7DZDN/MH7YlFBrPiL40=
X-Google-Smtp-Source: AGHT+IHWYMRh8cuVfVF8iwP9DVlk7+oEketklRl5w2ZHB8KKIObI7IinPzRRTCdSjTV6SVsaYECqNQ==
X-Received: by 2002:a5d:5f48:0:b0:37c:df55:c1a5 with SMTP id ffacd0b85a97d-3806114314emr2142135f8f.6.1730059199317;
        Sun, 27 Oct 2024 12:59:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b6f838sm7506639f8f.83.2024.10.27.12.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 12:59:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Markuss Broks <markuss.broks@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
In-Reply-To: <20241026-exynos9810-v3-5-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-5-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 05/10] dt-bindings: soc: samsung:
 exynos-pmu: Add exynos9810 compatible
Message-Id: <173005919680.11546.9848851651562833256.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 20:59:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_130001_908998_44BEE585 
X-CRM114-Status: UNSURE (   8.23  )
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


On Sat, 26 Oct 2024 23:32:36 +0300, Markuss Broks wrote:
> Add compatible for Samsung Exynos9810 PMU to the schema.
> Like on other devices, it contains various registers related
> to power management and other vital to SoC functions.
> 
> 

Applied, thanks!

[05/10] dt-bindings: soc: samsung: exynos-pmu: Add exynos9810 compatible
        https://git.kernel.org/krzk/linux/c/4c745ade9f2ba0e2ce273b75293d0e9b995dbd74

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


