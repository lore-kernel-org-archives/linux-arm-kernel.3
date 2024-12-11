Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B11E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W2fBpF4DPgk8VjYpxJsEGAE8QpoFNbBTEEgsMSm8FzQ=; b=B35Nr7ILifufa1Bnw3rClqMtSU
	YccTuUaznCPZVTU3aoNSOIKQpSfBhCfyG36+qYXLf5NdzagNbUXrGcFwLKZ2LVAFGGMmZRH8wemUz
	tteeB+4dV9Wm0hEZUHh9euUMhVAyKHh8Sy8e33xf/hlrmO8G795L6qzdJ1U4l0TCq1/8CHd5PKWle
	93tfu5Mcqfld/pTFzIoKLbgDlyqTyzHBrMCnXFrSrlmag6GGt5NyLfCItM0FvjAkR5Zzvldd7hN94
	BimWrtvuOs9RJkXS3VQYx72b1+aqKNmtdv3xUF/krrZ/LUEgFE2U8rl+BxqzHe+OivG23slgX+w82
	qOaa4WpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKp9-0000000EgX0-3JK7;
	Wed, 11 Dec 2024 11:24:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKo4-0000000EgDm-4AWB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:23:06 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2165cb60719so24501855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916183; x=1734520983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2fBpF4DPgk8VjYpxJsEGAE8QpoFNbBTEEgsMSm8FzQ=;
        b=FSfvJV93vLOQNDhdDktHGBDaKk1m1fgZ6c6nrGa/of1L4lPrj6+hNFdCdWwAnpYKst
         p4BoaqalQuK3Zyafv0x20GmGyXKMlrNisSS5ATPbY9g0Ilvgs6OhKnW8yabDnZMbs06f
         SqWuE7wbBocNPqkKsM6THpEIJRkZo3I7t//OxEbAXP74s255HsKnngiG6Gt20jsOUP0D
         VsAGBap88Qp82d97BWhNtbldpqpLRnwhxh+iWjp/cywbq6cOHshHdzk206UkUkgAJpjK
         br81q6vChRcG3es/Wry2vn9DKnScRn9NKXp/oOhoUdKPD9pc3SJXZ2m4CeAAhvbkQynM
         1XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916183; x=1734520983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2fBpF4DPgk8VjYpxJsEGAE8QpoFNbBTEEgsMSm8FzQ=;
        b=TntPn5CQ6rR2PGKdVPzs7ycIwRL2w35JINZ/B+cRr0bd/Mxi4EmmRZLeuqVp9Xiqq4
         7oqsFABu5ItkErq2pzzoXLIQxpWcqJrHbMqwLn2cTr3BEV8gHuSLHPUyv6lWajEfBZyD
         3p4rjtl1Xj7zNH/czKSJJtIOLHHlsmbGUvBXSbCIE/3LgxT21gikqYjv9wBjWrc/jaTo
         Glf1NkRrr+MvZid6yBTWBaOnj3zq5scONj+0csY4HTeKVnPZO9wSdN3c9peVP8mRBhci
         4oTlWiIWKg3bSRUt+/7AZ6OMXbUfI0g2ivBJ1gyBlEgFK29TF6OCca/GFBA/2RF81Y4Y
         mEBw==
X-Forwarded-Encrypted: i=1; AJvYcCWGMTBlEeJMomeQXS38QrrxSoGqNLPOw7qSscxwcaifUizvmF2KLuqy1rAP4XPtRlgflmqHBdIV32DUo+qw8dR9@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwv/eG+MMNbDEXP3DmGSaMrZN6IrMJc1roPA5VNNM4UfDAX5n9
	K5UrA4am1bM0Pa3RESCJxQwWe8EHjSz2hya2C7OtFL2zYNNDe/gH
X-Gm-Gg: ASbGncsRQ+e40B8mAoQhmwgklAjSACTa7/qTwCuUXtIQ9nAAL0Hk+/jb+OFYneqsHOf
	E06P2pdmVkVnG++4Hby0+Db+tBjCVsXKDIPcMnI8Cdin9U1gapwJhT/tlOH7PSgnd78Jw5MEZF5
	z/jDUBdAVWA4aFCeCsFoIoNLjqaleber3uho2jAVBjdNqEooAB/1ziBw3c3Wi6wCtO39vK1G2DT
	ds/rmt30ycygRciJQz2Fp/MQSl2pcvuI6lwc0wiXGiFglAygpfYochBV7CQh0jsAD8R7w==
X-Google-Smtp-Source: AGHT+IFQ2IW9tilUc4WqlMVThxJsWeAViNnNodENYGpepZHa2B/aZBLf4geEEAiOuYgDZKDGadI7tA==
X-Received: by 2002:a17:902:cecc:b0:216:2b14:b625 with SMTP id d9443c01a7336-2177853690emr44032965ad.31.1733916183466;
        Wed, 11 Dec 2024 03:23:03 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:03 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/7] Apple A7-A11, T2 SoC cpufreq support
Date: Wed, 11 Dec 2024 19:19:27 +0800
Message-ID: <20241211112244.18393-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_032305_033237_A51795E0 
X-CRM114-Status: UNSURE (   7.96  )
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

This series add driver support for cpufreq Apple A7-A11, T2 SoCs.
Device Tree nodes will be included in another series.

Nick Chan

---

Hector Martin (1):
  cpufreq: apple-soc: Drop setting the PS2 field on M2+

Nick Chan (6):
  dt-bindings: cpufreq: apple,cluster-cpufreq: Add A7-A11, T2
    compatibles
  cpufreq: apple-soc: Allow per-SoC configuration of APPLE_DVFS_CMD_PS1
  cpufreq: apple-soc: Use 32-bit read for status register
  cpufreq: apple-soc: Increase cluster switch timeout to 400us
  cpufreq: apple-soc: Set fallback transition latency to
    APPLE_DVFS_TRANSITION_TIMEOUT
  cpufreq: apple-soc: Add Apple A7-A8X SoC cpufreq support

 .../cpufreq/apple,cluster-cpufreq.yaml        | 10 +++-
 drivers/cpufreq/apple-soc-cpufreq.c           | 56 +++++++++++++++----
 2 files changed, 54 insertions(+), 12 deletions(-)


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1


