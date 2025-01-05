Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973F2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngcCwmTO+RIG/baergO/2VLeRq3P88V5Zllx9oRRwrs=; b=QcRBfPCC8FGkdz9N1Rdguc6ywH
	SacsVT7VhEN0hofp0jXSVLgNCmSOCCZZLBxbfmNOos0XEql14JWfXL6EOKtifbV6Gz6zW/k5ZORmz
	JJorRfoG92YzG5FquBR/S7gBe6Wp17CSXELbYDOCOgbaQtIB5SMBZoO2p07f2OM4uAjlV/Z1T0c+I
	DEiyXQMXRJEZSCXW0DhG/m2wQ4JZAwGM26HAjg3aHe+Qfyem3N7lUcsZCVAyzrHB2QmI7AgSzYGK4
	o621W06fNYrwTEOgsPMrHvAaiZa6d+FvnqB5L0tRuzDYhX67HDwTl0+l2/yj5x4/YnoN8tTE/nfIk
	4G0+92Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVEa-0000000HFVQ-3jx9;
	Sun, 05 Jan 2025 18:20:20 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVA3-0000000HEwK-0o8Q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 18:15:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d84179ef26so21303550a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736100937; x=1736705737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngcCwmTO+RIG/baergO/2VLeRq3P88V5Zllx9oRRwrs=;
        b=X/IG+FGITeCXqLo/U4pAZxzM/5BVVKd3odL72pM0UODPyke8zDecTQpV1wGEfBffxR
         Xihz8G5k5U8ZTzMAf8yOtHNd8snjhJxHdhvqCLElywkn78M6IDSocihHJj3DjjkSJMeK
         fbQgxibvfDKqkXT8CLhKloUxxCIRBHed3Xudk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736100937; x=1736705737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngcCwmTO+RIG/baergO/2VLeRq3P88V5Zllx9oRRwrs=;
        b=UGyrqcS7cjKdkcdHGHnERHjIwfbdoCqecYGBQmqS3huJPlp9biENJ/6D5BhMoU3Fok
         pYWk0+Nv2nyhKn7eUdj7PnT3xy7H+JRaiFO+YPiSecvdY7h2J2/rrnJtZx9QUpYYx431
         oiO8X2m+HxQZdH7vX+trD0JiXTmT1XnnwISj3wy6sVxMHoaQPTRJbYHEcGgnZDh8uGf9
         fUIAjAx4ucbrBFANKjCFo0VrZrvcrqTb1DLXIFS91G6qXAeHxl/kl4mlxuJ45uFVPJ9I
         Qm6VZnecfE/VHXkdFeCREPh/bv1GzJVWnRLbTZd4g0IJrsJv6+a8df2ENb33PXIBRFzF
         OMGg==
X-Forwarded-Encrypted: i=1; AJvYcCX/lTbpRgYMhNgpgBkJIUDxvz95FxzV4kklZ4Xjqq2nmx5lKbab6Gf/065C71DBOmQBN/8KMKnqtT8Kkfexgt/k@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4SO0Q4JAmOv61LNavd4+g0x/0vg/JckubkjZTsum6ruG0NqBB
	1Kd9Vn3/T01jKCI2YmnnL/mLlzz1/uEQsCmA0Ik7yNYnyQrMDYIk9ZUCm0vqtN4=
X-Gm-Gg: ASbGncvHmmWZeBm8Ga63AsvKDaMYC5T7m9TfeZPOXBfVhfy/3XzzxoG82JUEV6/zvRu
	yx7M5CcnI/b7S7hEmUW5CHP6+JQQpy97kY1qyPuLm6/SwkssPgnpiZmlXqstLLQ2eXTqeKCAzh3
	4bcrmwbw8lQs78DzYojpKjFY4Kk3yHbQ/Y6cc1NfpTusI83uzkA+CQYI43dyU6Gnw97YpMmIJ3M
	YG2q3rUeiRKOsgz5znzS3AKGoR3L6bjci3x5HC5sUdeLljWhqB4qVp7hqUZb3sHVURm3WGnrwdy
	DhY+Mz8s1xjJUedSwiE45GY2DdgmZOuGDORuA7uFl4vyPMU4jPslq/ngAJRHqM9htcpF+2mRACl
	lYXPtqN38+pPlRNebhQ==
X-Google-Smtp-Source: AGHT+IHxEDK9nG2Mi+Pm0wOh++nf130PTCB6/hhMGClugIlI0HI6FjgJGvhFReNL/vJEU6H89u69cA==
X-Received: by 2002:a05:6402:4305:b0:5d0:e014:dee2 with SMTP id 4fb4d7f45d1cf-5d81de160f9mr56356151a12.27.1736100937450;
        Sun, 05 Jan 2025 10:15:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 10:15:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 3/6] dt-bindings: clock: stm32fx: update reference due to rename
Date: Sun,  5 Jan 2025 19:14:15 +0100
Message-ID: <20250105181525.1370822-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_101539_240507_A8600D17 
X-CRM114-Status: GOOD (  11.63  )
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

With the conversion of Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
to JSON schema, the reference to st,stm32-rcc.txt is now broken. Therefore,
let's fix it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 include/dt-bindings/clock/stm32fx-clock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
index e5dad050d518..b6ff9c68cb3f 100644
--- a/include/dt-bindings/clock/stm32fx-clock.h
+++ b/include/dt-bindings/clock/stm32fx-clock.h
@@ -10,7 +10,7 @@
  * List of clocks which are not derived from system clock (SYSCLOCK)
  *
  * The index of these clocks is the secondary index of DT bindings
- * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt)
+ * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml)
  *
  * e.g:
 	<assigned-clocks = <&rcc 1 CLK_LSE>;
-- 
2.43.0


