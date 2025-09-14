Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435F5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vsQY4Dw+NKWkDueuyiKs+vcdnaBKygRmkUmRr7JUuk=; b=WAFGRRjEJcVTlLcGpkTzEE/X1l
	oPOfqIzeaqpUKX+L4LFu7UpbghtHlXu7ZCWtjkA2G4kCmhg9LBt/C3d/KC1xZr6UwCr0Bmb8PIuB7
	hzj1VlHWxiKYuwQC4b29vV5AqdSBw9XO5WkRTWM2FcTPc7trStLT/cTyCagTmO+5q/jJ+I4vaZUlg
	+CfGGesigYGbbrhZXvtJ9QBjQ0Fe7Ae8dwQdrQsR87CBz3M9nxbi56j7nQgSRfGuY/1ufLuzfO/qf
	EdTDnmLP+ni/0oM3Wkqq0rF3jfa3Wb95hmlzWIUdF1trSW1rKOKDefEvP6lqxHacGnpwqfb5G5g3y
	fU19sNVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxkvf-00000000xEE-0Wgm;
	Sun, 14 Sep 2025 11:29:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxkvX-00000000xBu-1Fo8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 11:29:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3e957ca53d1so527977f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 04:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757849390; x=1758454190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vsQY4Dw+NKWkDueuyiKs+vcdnaBKygRmkUmRr7JUuk=;
        b=QNKc119yNP76bwa8jAA/qND0zSGlEW7d4S9r9veoAChqh+cggzfYQtOBwVU5fmIIGb
         zPAsllARF7OW7K6vH3WlzrOAAHqiTrS3mLQaHPJXiBWmdA37hnHl5vcBcvhg4OfPLHUX
         wHG7Dc7AN/u0G8W74wC+WLfuULIKKzrhD5ZXm33qRlOCuqbrJ40w/NA/7sQWC5Q8QGF+
         U1oYDutZOHhWERpv4zTunCceX3JfSPx08ccjWm9DdWnyo8APFcYmUlFSv2G6LF9njDf/
         J29BKliqOEEkeyNryukvPxjchXqtMetyHVh7CkAeyn6MKrz2eAc2fDXWgmNCiuIS73xp
         JVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757849390; x=1758454190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vsQY4Dw+NKWkDueuyiKs+vcdnaBKygRmkUmRr7JUuk=;
        b=goFKxnM3Vd3M10RmzQUu6UtH/kA7oPIVRG8Rwe5D+LTuSLl/wPTPTNlZ36HnR0xA0P
         lHdI1t4IslXbOapvHjTofFgSGGXG37pGQjVL/75tdHb+lIo7V1vW/A+w1C7I+o2qgwpQ
         N6wB90A2lfsetaXmSFw7y5c/2zA5g2yLmXkDlg/Ar6vGc4Akq/B1+tNSVK20UGU6qdwu
         Q6kMnR83B7f1ONrmjyNcCZ2nXwgBTxqCeev1/7uppkYD0H2YWPUZTmx7wGTiVqItT6eT
         SzfKgllwX3QClYrvjRxUqa7PYGOjob8auCgplAvWiQn2dzExior3vpxxLkJtSwZl0JE3
         G6lA==
X-Forwarded-Encrypted: i=1; AJvYcCX00hSm7pdvl+m3KUxVfBpyYhbdkD68QdEwy7/+OoJZpv327z331gALtPhL33I7ZvlnzUMio42eac4jxuShBL+E@lists.infradead.org
X-Gm-Message-State: AOJu0YyE7ATGs0Ti+yh765J4ycYF9vspvBraSzpdeHwo6LITgM7n4q7Z
	MVj8mMgzn2AIIIHhMmW0LhUdvKHek0W0u0qKM9tVvFZqre6WerXdk7YC
X-Gm-Gg: ASbGnctKWPes4CZ59ah38s+nJByytHw7mq02+OMRlUutAQE3VEWnKfs2Di5d9EOl2se
	6u8G1ZbXgfmUIu9Y1Ac6jZGq5c12gj2Oz7bXxAvMZHia3E2+TyFlALl4M8Ytd2vBiy3e0jtk0dx
	Oep9ohUJZh0g5JgGAt5Te2HUCqD83jCnPD8pqC53xtWwuIa481s6oubafoNdImA9za8B/pTRk43
	ogoQEjj6kxu1DDL3ZSO8l/qd2/sjzs8vP9Ct+5699OAfM4+pFkPJORXtHDvEvNrqlYiS8oa8v1l
	euMsRPqBLOe8whEkZTShnQMRvGVyy8r0Z5DsLqnRWMkpRJj4NUTBI99M8MSXDKwYOoLy/O1qXSj
	3xgc307H4+pWe1IuxGTxFqINbZjItwea3V9UIXB7OReAliYGHdwmebuG+WhgOsvkB0V8Zw+rmsg
	==
X-Google-Smtp-Source: AGHT+IG7cUFQKEKzCWjaXCRFkeDZbrdH3vz4KY4We/ahlJdKQNXRJ0ZP4meSLxgeXXNpvydWJj/Jiw==
X-Received: by 2002:a05:6000:2584:b0:3e7:5edd:ce07 with SMTP id ffacd0b85a97d-3e7659f3bc0mr9180559f8f.40.1757849389608;
        Sun, 14 Sep 2025 04:29:49 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8346defd3sm6591268f8f.1.2025.09.14.04.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:29:49 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] soc: samsung: exynos-chipid: add exynos8890 SoC support
Date: Sun, 14 Sep 2025 14:29:42 +0300
Message-ID: <20250914112942.2604194-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_042951_340919_CCF9532B 
X-CRM114-Status: GOOD (  11.17  )
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

Add exynos8890 information to soc_ids tables. This SoC product id
is "0xE8890000".

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index c86f1058c..02466f916 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -57,6 +57,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
 	{ "EXYNOS7870", 0xE7870000 },
+	{ "EXYNOS8890", 0xE8890000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS2200", 0xE9925000 },
 	{ "EXYNOS7885", 0xE7885000 },
-- 
2.43.0


