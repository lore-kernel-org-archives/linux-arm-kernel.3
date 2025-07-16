Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF92C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=; b=bAOf0tqqZG2ahHOFroWorLktzC
	1a6vbszrMR8MtO4Wbz8w4hzI/bcA3HzmOIftZhe4Ug6JNm23gIq6aYHY+8z5neozeWrxAW85231R+
	fQf/zfwz5s5dx7K5u0rYZxaIujXzgh9w6eSbNYihoIKcXP4bDyeXHI0ygwXqh68yKU8vNFtyUy4SG
	9KbaOSLLv9lmmwLUtFTauN14ViCxge7x55/E24Os2CIVCrBh5F1HueHY0bYqroRt7VqNTK6/5dW8e
	2zMY8lQK4LGKoCe914d6NjSzGEC523DKg9Vv3Mx2GLCk6JfX0qI6NYJIKJ/PaX3nnMFHVjboU1al+
	8//Uq4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8AF-00000008Y8X-3Bxs;
	Wed, 16 Jul 2025 19:51:39 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7qs-00000008Uom-2V1M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ae0e0271d82so37178466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694297; x=1753299097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=DrCdPZRWU6R++Gp4STw2dkQY8wPJaUDJPin9e0Cq05MJ4eDaLAtZ8dl8gYtc9n4pK/
         ShOJbH2r0n0BJ9FeY883hc/PtNaNu71r46ffJBpLELVMOQSgam7tXwJi4ayz6+kB8NJK
         Zaz2EEQvHAf9A5moPM+5md2HhykknvGvqmAsdM56EdcuRSo2NgeIIkXInyqDqBNUreZl
         3e+KFkhJ6krD6JHO4uFAr/oh/wxcOUJsXaLoZvDhF09BnZxclQOD/hFsJh855Eb/YhJE
         u4GfKc9aOZUaeXfp9pdWf1pOzoMAvaMaW5rAlgzC6qFWyDO7zg8iKdJqPYoy5+RTwLeu
         UKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694297; x=1753299097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=tFsyIyMRd0IqZeCgIZ3SI9oTds3q7GaZMa9eYxNcvrPeRwRCAGhmLyNj2JmH26lck7
         lDixS6tSclT06/bgW9J2OxxCEXkweh50cBgPWy3mFTWtF+3qb4UQk0X5s3zemYW0SFhq
         kxwKLxt0KWQCjd8bAms9xF5vx89sEEZKtCdRukphs3XOxI0JrgX08C5Wb8ZEFV82UHdC
         YHjtm9UNgwr3CI+w4Yy8GI7TnAzg7ghqa7DGuUvs3xpdjj5EQLonokSCP0KuK0YX8NrB
         qYyX4oDhjxe3WRCJ+mzK2SKAZI24KcxF1l8XdQuvTQqhOKcleCBHLCk4Nvn7M9fZ42Vt
         drWg==
X-Forwarded-Encrypted: i=1; AJvYcCURaaSDu75anELIyCghvQ4oCczuZ1QvEdQmjJbe/CPo5Cxfj3Wx/+eKr24FbsdEXxubykyHPi3tPfMDTgPYEVWJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2KjwLHvG0taxsPuJgfbDa+LARXdJ9MwFuIDhruOwneAXIzfIJ
	71+OlLzgGt91B1h1IYJ3SD4VV8yzwyCdEgSZhpkCNmKke6EGyCiStcZ3
X-Gm-Gg: ASbGncuQ8T13p4EWG8KYmJRbL6WUtoG9hWJbtAWMHsgDTp4T383RtGICzBuoCdJLJNh
	V0trYUxWN3dCuuTzkkc4+Q0WVgFtCQh5hmHqL9ZqTPjaeCzEHY8WrSH80+s5q+WpeVLJwTyOl41
	hl1CO9ikY9S9PvNuVSz3Q6pDAiyE5ttcLluD6iabxUY6xbe0fwfhi0jNVBNHazB9HzYQH/HPAY3
	WeWRCSGf0MiWcghz8kqZJXEmsKDLiMsf7HwvzgRlUmaPurL3erWHB9KFWTGeIP0io24h9dZGcFB
	aYTNe8Qo+Y/ZAnZ6BPN2ZdLOLejNNdGgBWV0lyLKYg7hV8MKgVV2E8Q1EpEuzbbfaITErNHvePu
	W7VyI8luMkUX7bSMtIzwdaOmnd8zCfLmP1FU=
X-Google-Smtp-Source: AGHT+IFHnGRB8Zbsb5skhelScTg8x+HOj/hT5XQA3F9WDpWtwluScncqS5TTowKEUi8eWz6u+e1Luw==
X-Received: by 2002:a17:907:1c15:b0:ae0:d201:a333 with SMTP id a640c23a62f3a-aec4fbea40fmr21957066b.30.1752694296855;
        Wed, 16 Jul 2025 12:31:36 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:36 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 07/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Wed, 16 Jul 2025 22:30:52 +0300
Message-ID: <20250716193111.942217-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123138_631938_F8879B04 
X-CRM114-Status: GOOD (  12.44  )
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd3..efdece2b33b96 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index e973b0a985815..3117345d0619c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14747,6 +14747,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.50.1


