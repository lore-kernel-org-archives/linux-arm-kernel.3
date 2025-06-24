Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E34EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VnpSnkfgkUADh3xBII6BavGc953e/khu2q4B6DDX498=; b=T1DLSdKfKLHAg4Oxq4MAc7UvFj
	F8wlz8CP1RWQym6CFc7nm1/oFlLYqcdbDYqE22e0MG+be6tgR2tZ+GO8AxL+BVyPPfpUPZcH6c/gI
	Ml7orx5+KrpaI9L7qAYPPWj+wBOB5PqAAEVnM8HD6LVzI+xwK0Uw/DtYa5iCLDbTHaOlIlq+nxrI7
	GoW+j7ZsWLX59k82my4RG/6jUwWrPciFzmrC5OVzDMXYbWylPPt5XOJguahfrEoQdeq5oF/QyBem4
	/GuuEBYbVRiA1/QO6TP6Wb8D4nyQNEURM8Id9Di9opIlh1z8ONgKCQ8vOIFoWI4f3TunC7gTp6b77
	IVIqZrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAsh-00000006q8M-0TtP;
	Tue, 24 Jun 2025 21:08:39 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8Bv-00000006UW8-1vpb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:16:21 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so893245666b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750788977; x=1751393777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VnpSnkfgkUADh3xBII6BavGc953e/khu2q4B6DDX498=;
        b=BxH8oTFHaMHmbkpv/VsmsAWOpNHsMHo1GB3kbHhceVZXc6QrhPnxZoZOZ8HW/0a8t4
         LdMulxpNPnH5l+9KD+RHFA6ig9ZWb9RY5CJaNZaSgAHxrHSWXy919cYbDdpLBHbE0NZj
         dXVxPKGRLLtQtUlB+f7PApmuQXVkrnM/P6VH9yncGVro6dXAw4AJC2MOAeUs/rIyGHzF
         /AhlBkeYm25scVF162u1/gAMOySnsZd5RxTxkWTRu7c3tJVGMs7sZfZBSWP9TMe664Lm
         CkZTjohHFxqQxKEfKV9AK7SnG0Dp0Yxa1+w5zkjbrCfN7rLFC7Yr6mE0LO7iYmLXmZEk
         kQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788977; x=1751393777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnpSnkfgkUADh3xBII6BavGc953e/khu2q4B6DDX498=;
        b=FBbek8Fe1EzaNX6z3T+KgNRNwAtHKwoXbPLj7OoPNRZQSDfRlDScnk2z7iJplIsu9I
         XTKhmKRLizspi1od0WBpKv+l30kuCTc12rfaApmQ9PXhljtd+hNhzyfv36ijJi4lLxXh
         /9DQiAniQPJwkfemU9mLjvOWZlm8TRbQmv2sWCTZfoMm6NBlUbFhEiLCA7FbF4myl7Be
         FRO8rVx6Z8WOT7Csp3q9dXpAtZVs51Qbv6bJtDBMvajIFiK5Uio2U9a5IkeLvPaiCH6d
         RUfHJxPbeuY7NKJJS989lniU3omdygdCmi3RLmtF8QZCQqwe+VFRty85eVQBQqPvXSSV
         FRHg==
X-Forwarded-Encrypted: i=1; AJvYcCV8dYOHp0O5K/kHX+qmp7/GI9c1yWf6mkJE5cHpFJf49h+/CcH+vOtJ4PvgDsiW27qP6+At4C0mHN9ueMr8wczE@lists.infradead.org
X-Gm-Message-State: AOJu0YyjcDr8I19U//QfODM0jJtAzoDHmkklfVI4L1COdHqIvoPlhKVV
	xztfG7Kv6v+LOlujS4VFUqeuF7jfsCkNGBQtQXqQA4YKkKwpZn8wh4uAycEgcyAFDQ8=
X-Gm-Gg: ASbGncvHqvpTktGaTFvy0VdRMt9NxgQE3Xov8k+qOkRehkS09LAjZMDcvgjIQRzlXOL
	umbA945eGnbrdrt/4o0ytTetw0oFGzaHOHiBJJfGvN5javL9DdtPrGb8fuVTYGukrIY94kA0nE0
	5pi1NTHj7hapkSZM63IrQn0FgtHhINwws74buoanI+//Ha3hLyl5ZYEYQSGabxO1fk9Rek3gHa6
	MNPEtruvHF4pdx99QO7o7fIoPfjyrkhTBS0/AKwxo3QzyL04KqcCvHBWsjcisZqjyu9uyI2TK1i
	CMl56fvTptZGUxrhnxoS3ZK4vlrTvTfqQ3qep79p4BZc5aYrWUIhCXRuw4ta3dlGQkc=
X-Google-Smtp-Source: AGHT+IETySV/NwwqbbDLqMU7Mh5iub1oxToadv0ZxFROQaZJtAgApSrTnuto7oLvvORtd6L1Dbo99A==
X-Received: by 2002:a17:906:c314:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-ae0beb0531fmr22317666b.51.1750788977207;
        Tue, 24 Jun 2025 11:16:17 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae053ecbda9sm905954066b.48.2025.06.24.11.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:16:16 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Zapolskiy <vz@mleia.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/8] pwm: Drop local locking in several drivers
Date: Tue, 24 Jun 2025 20:15:36 +0200
Message-ID: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=S8bWVrtohU804TFCIPr4aot/z07tET4jFwVUKYqLlZ0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoWutKdlfvI7KIzHJ+KN9OasXDBe9Ets/iGGJT3 I980PyuD9GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFrrSgAKCRCPgPtYfRL+ ThL9B/wNCs36L/ISd4BA7zNBxQj5xBfjauGisVwporrJNf6qsKCwNrXQzidhknNvp946kr9gTj/ 3GZpj2d+UbQZ3AVgOMPIGsP4KkUomd8bCzxxuV8vCYvqB3oaXo4u7MUMI0/Y6JSmjh9RdLL2nz4 svG2I8ba2XHL8nWHRPNDbvQEPjsDTkU4/z536VcFjQXP1gSTOa/+Yh1JnyezwiP1gcGOBLeUj3P guQ2ykm0AKCku7biNbXTJzIkI1Mzz8P3Tso4jJGZ6a7mquAzUpmue2SbYP1gMV/nm416ULVDwW3 gxd2zphLoM96KFKamXLTbVyKW7sNAeHWRXFVNMiUH+EJF2Kx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_111619_772967_0064B79E 
X-CRM114-Status: UNSURE (   8.20  )
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

Hello,

some time ago the pwm core implemented additional locking to protect
lowlevel driver callbacks against driver removal. A side effect is that
.apply() and .get_state() are serialized. This allows to drop some
locking that is now superfluous due to the core's locking.

I identified a few drivers that are affected; these are cleaned up
accordingly here.

Best regards
Uwe

Uwe Kleine-König (8):
  pwm: atmel: Drop driver local locking
  pwm: clps711x: Drop driver local locking
  pwm: fsl-ftm: Drop driver local locking
  pwm: lpc18xx-sct: Drop driver local locking
  pwm: microchip-core: Drop driver local locking
  pwm: sti: Drop driver local locking
  pwm: sun4i: Drop driver local locking
  pwm: twl-led: Drop driver local locking

 drivers/pwm/pwm-atmel.c          | 12 --------
 drivers/pwm/pwm-clps711x.c       |  8 ------
 drivers/pwm/pwm-fsl-ftm.c        | 28 +++++-------------
 drivers/pwm/pwm-lpc18xx-sct.c    | 14 ---------
 drivers/pwm/pwm-microchip-core.c | 17 +----------
 drivers/pwm/pwm-sti.c            | 23 ++++-----------
 drivers/pwm/pwm-sun4i.c          | 10 -------
 drivers/pwm/pwm-twl-led.c        | 49 +++++---------------------------
 8 files changed, 21 insertions(+), 140 deletions(-)

base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
-- 
2.49.0


