Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAF4CAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 11:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kWbQjmWNj90FslbkuEkjvxEvCWQssax8cSBKQRPyJ0=; b=wbUPAR1PnuVcFmwHugMBztS0xm
	Nh0rHw4//LVUcmHv0nZy7IveyFPnREvLukAtJnxEQau4siBctGvUdnfBOCBVx0iHT2dQ3sPAxOczs
	S9vNw2nH5pN3CO6SXFMV2zHZ0TQSFzqQA5V6QyDsU9r+RIsBz37b5PO+GJEv+ifwXnG7sI1LEQA1t
	m8LFbO+kgxyWrZWZ5wrj9DwwuCi49lwK7Dpb2XxqXFRVy7BYMbIvuQOakuCrq1j06utI0ls/zUD8e
	2W5j/hQ47i3ySTA1U49cGtMG5ZKxFfEElQ9ft4Qvbfqz8eERxbozkno2xsWKeMeW9Oatkvo5C3OH1
	9yqDaMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxkvX-00000000xCW-29RP;
	Sun, 14 Sep 2025 11:29:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxkvV-00000000xBL-1giV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 11:29:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3e4b5aee522so1955915f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 04:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757849387; x=1758454187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kWbQjmWNj90FslbkuEkjvxEvCWQssax8cSBKQRPyJ0=;
        b=BvMuyVbXvFfZQ2fb7dmGjdMOu6dDvtiI57W/IKBmMCSNnCdJLyr+8bUIfAp5G6B9FM
         bmRtYgLLE7Fvf24QOLTI5mFf0RRTe9nfj6aje/efML5jnI4aYMwH/VpytTNrSqX1dskJ
         oD77zNaS0+R+Nh2qeF6noKMixzZgUxp2dU0gpSZYfrpcPesnoOIrXjyYU2vlPgsCaYEg
         XPq1+LBlJ7QYdMw1NfWBQHkVzM5xkQ0aVfbQGoxKJl7TOW3DaFPWna/QOXtWps3j0Tsi
         Pw/PjzK3cY8gBmBTwjHdxocU2O95gRBUcuGffDmLRqSvHENkIrb3DC9vy5WELrUgbwkg
         2xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757849388; x=1758454188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kWbQjmWNj90FslbkuEkjvxEvCWQssax8cSBKQRPyJ0=;
        b=vXaa7Jg8dEhbsY0Tlky0VL+uaHBA3i8z/WBNq8UdKKES5rzvIUtFCo58f8CHKv3vUK
         inwevpN03dbHEnC0HAR+uw1JXIC7J5Ld4SRAHW2zLiu6xAEhpVnxanjuSxyXy8s8MByL
         G+xSAMwQyxt+EGJUWn0Lg0NWosyf7ki6LXt/z1PdJjtuW/S0bUJ6vINBkmWVzLFGvkE1
         90CW8FfREck5Q3n89nODQlWhCAb+qOObh2K6Lyp5yhSd6mNM6OSoiPIZzFYEWGZTacb6
         3oTxBwletdMroN1RXVKncqO0g25PI1d9BSau5w77nnEnjH+0tonyBSUiPVec0bp5mhQc
         wIug==
X-Forwarded-Encrypted: i=1; AJvYcCVfqbwOs/lrbbmeXFWTxM2x8/+Qn8lE3/9unM0BS+UoDRdFrR4NPZKZC1NRkrviejACwMvL2CwWfMbX3IiHv6o8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy39VQOCnbfZweTRB58HZcC/V0m9jR+Yv5hG05mNc0ZoT5Zn1fF
	zu8+mntL86PW9IujBbzEPbND2/7fuAAoVcjapSFRhwVfjHrwnSR9WbRG
X-Gm-Gg: ASbGnctN/1GwvvY2hAX6elfU79KNbCmDigsHeO9FtzDnhQvL0WtlVvGJzQkaQdbtHMu
	gQQt/g1fOrWW+LqWo3WxIH5lt+5/xBenuGbYOaF/RDNJ0pR8fLYs0nqR5s6la9jsHZmU1kjxx3Z
	faLft45NAiF8MVqTH2HbGDO12O0L9oeKIkE9nyx65F0fV1roshbO6GG1XwDmfu4zabSrsVO8UY8
	Tiv7v4PjE69BsaBB0WkYqT6NE3tZ8WaZ9CwXAMYgMVRzLQahAblW8xU0mgfMVxLiuEPqcIK0XVy
	hZZ/oBw8fi0bfQtFtfm2fSy31zeBdCK0cY8J4/aoLP367kzZ306ZNT6oJ2eom7Gp0VUZO6cgpvl
	hQE2NVDPAfCv+7jJCgxgp66CQx5Q9HM51VhlXezt75M1aCJNcX0Yc4rNi1pKQH3ZQSHVZC7jjKw
	==
X-Google-Smtp-Source: AGHT+IG39OXL5GbVP5YXCrtcp7+pGbdpdEB59AacbRvXYzjADaHt3PlBFvUeX/cNMkHe4IVaRg1YkA==
X-Received: by 2002:a05:6000:2385:b0:3e2:4a3e:d3cf with SMTP id ffacd0b85a97d-3e7655940b6mr9199096f8f.5.1757849387391;
        Sun, 14 Sep 2025 04:29:47 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8346defd3sm6591268f8f.1.2025.09.14.04.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:29:46 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: soc: samsung: exynos-pmu: add exynos8890 compatible
Date: Sun, 14 Sep 2025 14:29:40 +0300
Message-ID: <20250914112942.2604194-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_042949_447106_AFE9E66E 
X-CRM114-Status: GOOD (  10.33  )
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

Add exynos8890-pmu compatible to the bindings documentation. Since
Samsung, as usual, reuses devices from older designs, use the
samsung,exynos7-pmu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156..be1441193 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,exynos2200-pmu
               - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
+              - samsung,exynos8890-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu
               - samsung,exynos990-pmu
-- 
2.43.0


