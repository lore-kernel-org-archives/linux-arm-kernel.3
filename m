Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40860C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCgbja/gOTY6PAB9qzS6fOz3VhDsGQwTh8VHxpGStNo=; b=cWgy8MsA9Tu+RfZFf5u9PYUl/3
	Gdx11Hz+bNDHiYLYILDW7uC8M6OQF23rU3GuR370abKzIio6rduZRi8/NOI1gC9GFSe8ZAl/Wq4Jc
	3liA2Q2ak9Zo7obmBRvQu5sW/Ny5GUdHUfxefclGPaFWJEhsTTv0fIXlvU3Hj6h8pcgy0vhQdSLWd
	4R3vztYn1yzZ7JzmMAi8fCcyiFjwut8ktCoJ58YNKLsh8birQvoK8TiFSzpatxHLEA8zcp1OZOkL2
	8MIFuvJf6/bbpZqzwwtmLoAHeqc1YJS8nbd7ssOqOGGHCQUToaUSLVWs7xg/bbz8yrYHm3/jHod5C
	0QMSqjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueW1q-00000004YoP-0YRq;
	Wed, 23 Jul 2025 09:44:50 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVPN-00000004SQG-2SMH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 09:05:07 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-606a269d440so1108226a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 02:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753261504; x=1753866304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCgbja/gOTY6PAB9qzS6fOz3VhDsGQwTh8VHxpGStNo=;
        b=Vx1g+BQSrPxiEyNMg4TOBCDVsjoCR43k3Jz7sPWkfszaLNN7xZHZwxL+V2EtOTK/dR
         JQPcs6Qbmbl/Z5MKwHA3wC1q85wcJuwyiARnshYv4HqXhR9c0EYQaUJOjwbBnmrknoXZ
         bMaxGwBUdDbK87BfFJOML366++wAamUUBDLVAgu9dr8vcIDbptQr6VF4H78iNCuHfxvi
         XJC8i/3HSWrtZkG8e6JJLZQPejJUAwl6YaX4nhlt0JAJYMrwkeC2gi2Fvux3hPnMm4l4
         D5KH5q25jmYWCSXO7kDHUFNiRY6QRg0YuZMTiYOVtz+RlaQGkVoj9d3leoZtWwfCl6Q7
         AGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753261504; x=1753866304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCgbja/gOTY6PAB9qzS6fOz3VhDsGQwTh8VHxpGStNo=;
        b=dwWYccBaec1bQIJ+n5w9r35xilANOt+mYsnv6NDQ1qfSChZ+wgq8C3pOx6KyNYeYMv
         fBrIRAx9Fl4dh3HLynaSumeNlPgKlfVfYvf+v2FJCfbQ3ntIhadlwdnJEyaFc3s9VS+U
         ncZQErS4jIfr1ltPSv8hS069AAPPP4ETpKjlISor2ucrQmZPzJtu1fILmW6hYP+twtuR
         dpg6Du2U+o+9fcovySqyuwpAeLA1Kh6BNVtSSq695TOas3QbGs5UaWbRebxh1ryuhsWo
         WYIsBnGAfYQ1b5GIsOqFEQUlrwoCmGyoWLbjZdA0okaWRX7l8JqJulL5gnycwJ2g6ID8
         ZlMw==
X-Forwarded-Encrypted: i=1; AJvYcCVCnRwLJJqR1nVXYwOGrSIcEV/AKU1vTV8HBh1Flfp6ITqweYJBrSEFftqloVXwcrt3k5kNXyZ6xPpfa2RfiHtZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwYkFukcCQYt8w5gYpcygFe0lnMQYLQSAGswEXML3qzn7KTnbyK
	EyQ/NGRQoqnBsG9A11PVrK1zRq1lJg2jB0OPCv3CfJcoH9Ex6SFEy6tpLWwVLJPtPd0=
X-Gm-Gg: ASbGnctW5IXAxPv+RcPezw1QQGZDFXm1RAJbCMqDVWW93Wih6OBd5H55MBo1JwvwCF3
	nnAP6zFrc9kY0nJraz2BqyZar9PvVNXzIufjYatbRR5jO3cDvqqAam3K1aU3DzIBlJFEpWKWb59
	2pe00mMcRiPOf0LmBSBuvoKYxjTEP4Rgs6sUSsuhBMmwNzp26GsN7Itsjep5d25eILR3L3wCnz0
	HFwNSFmhDMtjFqZRv2lM+X5YD2jbcnqcpriWqoREDIyM4AiAPB4Fb9OWzLREWNOO9LYeVWTzbFm
	RnKIW1NrHjZXeHcFyn9+JfqZ8kLfELQFzuuEJTfMKTc6u31F+4/RzxPbLZC1UGL4p87A9KaLqRb
	J9dkQLsgMuSxnKxi/FKcGKXMzAPgXZ17v
X-Google-Smtp-Source: AGHT+IGDvi6weUHt1zBLFFABHti+LtpFg4sB/fcxjNLis7RjEwnRTt3JzWNz/nbQdoKPmX82/bVYRA==
X-Received: by 2002:a17:907:a07:b0:ade:9b52:4d84 with SMTP id a640c23a62f3a-af2f9171be3mr83211566b.15.1753261503791;
        Wed, 23 Jul 2025 02:05:03 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af22f6fa6afsm208165466b.120.2025.07.23.02.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:05:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: dts late for v6.17, part two
Date: Wed, 23 Jul 2025 11:04:56 +0200
Message-ID: <20250723090455.25295-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250723090455.25295-3-krzysztof.kozlowski@linaro.org>
References: <20250723090455.25295-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=k3GjnkVYrP1B4aQik37L6qakXOv0eTA+cuGhbBu9yp4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBogKW4P0UvirWoR64QHVT8sGAC5b3VZtif/zjju
 Tcgt15OsOCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaICluAAKCRDBN2bmhouD
 1/8/D/9g5Op+GBYMMSso3IjQEbVlUOXL50H08DRw5IhgOD8/JEC2MB9HI9A27GE+SOvvAuMn95N
 yAiQz2hEVZVBMhZRjSMvA/GgGL68YsFXodGDzrrohbVaQBX1Tt8O8pNZQg0un1MdSGlQk+xmEEz
 VAydxdgmYXNjp7x0DPiOKXgmUTtCBF2SI7l2gDJxZXbHeqx4J88M4eKos3AsLn/UPhiqOSbtOf/
 Vf/1i3bnQvPYiUYb/j+RJsA8O0Z1VsrZn+S81zDu+YmShmJ5K3hXRBPyhhFNvFiDSkEfAcfzh16
 ZhNgr+hH3eLnEBurn/mVIK3C86dvHdYHRRabzt907PbYvYewMqEHyciTIikc77zvJFcemeaKIn7
 NdTymOl0yn1JpbBmqQp3sz77KNHp872fGEBnPjNSW2GcrSERXkEYCjMi4MFD4QqTw/91G7z9AAv
 7jnvOxIoBDk3osWnb2TMCZgTgCm9pKnCyWsBfnm2KrgNVzAknGozS9iMV454DIR2b5Q+QiCltVb
 6/ZrFsnOuREufeR9O9esdGUlIh4T0uEawlYXyPN7/El2KsAWBhWLa3CxYFlBR6KF7p9Lmp9UQzi
 4YSy9Fs/jY70dFp+NG1E5y9nbX1sxvpyRYn0aCzBg+v3p2TqaMgjD/i43Z53S1X86c9er7h6DJg 1IkmyPCm1CfKkZw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_020505_624689_E686C198 
X-CRM114-Status: UNSURE (   8.49  )
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

Hi,

On top of previous pull request. Late pull with minor things.

Best regards,
Krzysztof


The following changes since commit 49a27c6c392dec46c826ee586f7ec8973acaeed7:

  arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount (2025-07-05 10:23:36 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.17-2

for you to fetch changes up to 8e5bf103b3ada972ea890ae6aa2118ff9b8c321c:

  arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to Exynos entry (2025-07-15 11:03:41 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.17, part two

Tesla FSD and Google GS101 DTS are handled via Samsung SoC tree, so the
clean dtbs_check rule applies there as well - mention this in their
maintainer entries.

Also, include Tesla FSD DTS patterns in Samsung SoC tree to document how
the patches actually travel.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: tesla/google: MAINTAINERS: Reference "SoC clean" maintainer profile
      arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to Exynos entry

 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

