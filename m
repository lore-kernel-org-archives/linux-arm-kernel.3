Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A552C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AnLds6lWEOgctovP8rZZIFlWYH7eclRkLDrgHTySwE=; b=1WD/VA6jNodk0xyVc5xtyra4NE
	qLtq0dPrzL8UgApN4Z1W2bUVR8sfXCCFQbzFg6GzdqoN3iZVJebE6pXH4+NG8a7XP8x4FYlgRZHAM
	Z+zbi5FYdtU3zZLRKab1RcY8a07C8QP8h5p28H0Ou/ptmyl6YxrjmCcsCbomNZV7nhQIerTU3aDXk
	5NoFHvkKjKvbEa+L/pD97dwHqjTYkjlP/ktlHsA2jrxkmH5myH++4h/MCXPHCAC6kw2pSOpVLgvgu
	bnC91Ky3bByAtfy0CwwMah55Zn+LM1k/+RdlxS2rI89gYy8ZuDnHjRcsAUI2iQS3A7ACTCoAgzVOX
	6sUOkN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFmm-0000000BqBx-0qRW;
	Thu, 06 Mar 2025 18:17:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFgi-0000000BomZ-21wh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 18:11:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so68030f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 10:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741284674; x=1741889474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AnLds6lWEOgctovP8rZZIFlWYH7eclRkLDrgHTySwE=;
        b=iBJxJP3Oj7+l7vu4nrRwdjJ47KL368sivU+D0CdeBqIQmrJoXaKl8PllFxbO5cx+KR
         0wYWFcGqLkYb5rDt9vkj5Fsnz/znFbi1GoXJm1GjHYZVUenIlnH089FU5nguKwU1pgbE
         SKBUoIvm2j3PfX0HHYRiRWIFMGr638jw94KoIzf3zd9RqNLgEJ4lC0b82qRuNb168jtF
         ryVnRkPdJZIv1Q+Xm2Oq49Xu4htF7QhAcMOGf+WjXYV3cG+vwPuhXk1ZGjlc5acYkX7g
         OC7utgW16+HNkCSAOTiJyxRu7jMBD9Ec9ZUgE21n0rJcHbEpzGnX0cSKaMWpp33/N6NQ
         VFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741284674; x=1741889474;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AnLds6lWEOgctovP8rZZIFlWYH7eclRkLDrgHTySwE=;
        b=i7MTe0lbMmZZrY/0WdCdvTEIePrrK+H5sLPP5Hx6K5jwW/aKii5WlmnoNiLJs75JgT
         VbCG11wLEHUFxKzr9Tn++5ALODR6faOqE2Kv4Kr9KjusuIf3nPX98GN6QLJXfqqEE1JN
         Jmhs2z743iKrrwLRJBRi9UrZiHVzkdEjL9ktr9kT3fMCWxgnYBhIVbzdja4smv/fIghR
         ZQqJYP3lJKrDg8d429PycflMfeoA7YR5BjWPcuj1ITQ8BRr8bWbGJpF88xvCLRJkIMkq
         9Giiph94zUU/pFIXunWtTopfOqcMbP1I1r2A96IuIx7akdOcp63reuxTwq31hZ6Bk1N0
         THeA==
X-Forwarded-Encrypted: i=1; AJvYcCXAV9vM/yIg8j7bbRDPOPDmn3N2J6gf5kNg7ejArNhBS0EBEVmpobfR3Hlf9eKkbUi499SUz0Ikj2RB7PkkkJxG@lists.infradead.org
X-Gm-Message-State: AOJu0YxkBzCuju83AfGWZ6eUMJyfFlU1ou2qbnlyR9+Opvpr80MkNstT
	aiTF6XIo3h555GLKDNeKrbCXynGRsF53vB15tr/VZdHOuJ2fJZhYDiLIGriP028=
X-Gm-Gg: ASbGncvhWNPwxxLSJNm769C2KntRQVMvuUgmK8oaEtSmiFB9cisFbuOhPyai2n7TBwE
	1PeMOb4xTT5ivG414pnrp8lvDtdpj81VNyYvxVLRqT22yJTXHn1HpNVmHH3uRfCjueIqpwZg180
	yUICTxqb5Rczi3JItSRJabbJ90N3ay0uMaOfWrOv4XD9FhoztpmbanoB75ezWLhYakNLDioydGk
	hgm5EZShv+fpCFSEgrJQzz3TGvPhSxYluOkrMj3YkulP2CyjVN4rXj5hbl9TwtOBjrJu2Ndl5aL
	qPNJBASkrJ0mzz6Z4ZmxAuyNYQtJ7S+1oRr1Ps4uh5AhvDwglVYoIR/KClSh
X-Google-Smtp-Source: AGHT+IFFRvwmZacRwHe9yk3mbn6KEKhfILWjskick/fV1fIsJkk5zhEz8ZiB5cRx3bewoTl4Sqa/eA==
X-Received: by 2002:a5d:6d8c:0:b0:38e:48a6:280f with SMTP id ffacd0b85a97d-39132d93f92mr48151f8f.9.1741284674274;
        Thu, 06 Mar 2025 10:11:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1027d3sm2716967f8f.83.2025.03.06.10.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 10:11:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250305211446.43772-1-arnd@kernel.org>
References: <20250305211446.43772-1-arnd@kernel.org>
Subject: Re: [PATCH] soc: samsung: include linux/array_size.h where needed
Message-Id: <174128467279.252750.12742713284242817976.b4-ty@linaro.org>
Date: Thu, 06 Mar 2025 19:11:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_101116_538095_52E8CB02 
X-CRM114-Status: UNSURE (   8.66  )
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


On Wed, 05 Mar 2025 22:14:02 +0100, Arnd Bergmann wrote:
> This does not necessarily get included through asm/io.h:
> 
> drivers/soc/samsung/exynos3250-pmu.c:120:18: error: use of undeclared identifier 'ARRAY_SIZE'
>   120 |         for (i = 0; i < ARRAY_SIZE(exynos3250_list_feed); i++) {
>       |                         ^
> drivers/soc/samsung/exynos5250-pmu.c:162:18: error: use of undeclared identifier 'ARRAY_SIZE'
>   162 |         for (i = 0; i < ARRAY_SIZE(exynos5_list_both_cnt_feed); i++) {
>       |                         ^
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: include linux/array_size.h where needed
      https://git.kernel.org/krzk/linux/c/4c57930f68d90e0d52c396d058cfa9ed8447a6c4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


