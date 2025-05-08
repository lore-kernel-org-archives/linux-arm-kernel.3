Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE16C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=; b=L6RMV7xqzGz/AujNFqgtLAQMbD
	hmGfug+Ch9JPKCVtwbn9gXt1Lhe9r117YCfWzTBUrzlgsGoczlRjcJTc1uLRUSWXW6hUnTEpM7YmY
	gPRSy7jRZIvxKEULtjAc918zijhdAuIoyZwggO6B8fKl33coqlvYhxfvV9Hpf5CCk8nl3MD8/rOtD
	Cdl/Pz91rp90E/CTCrZFHbngXcQ3xibb1O+G6NCdUxq7o45CvT8ZEO2C1AzWiX4KW4bpQ7Wk790w7
	nsnJNImvWeTq8VRr9t9IcGIx/rPrnmP46JPyOB0dPslrvEzbfFxUj5LB7XJfv+tRk5nfOtR2spPX7
	A1ArSOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2x5-000000015gA-0kxk;
	Thu, 08 May 2025 15:14:23 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2OK-00000000xGI-2V0i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:38:29 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso1656526a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746715107; x=1747319907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
        b=kmJs4zEn1f54W+e5iq6SHdLh0RWGbeIkIgGPoLRGVdl+k0ZGtLCweXlaRJlxXzGomB
         Q46DmPwkqtD8/pZkb0iLCp8WBwyDgaRAbdYIMJQAcv+cwGkh0xqZkRrTTSIuEfjNO5ac
         nFaNRLAQlUH8McbMfY5096lcmX9Y0k42IziORJD7iQ3k9E0XNlWviBhR15DnmzKX57CW
         2Zq+sZ5Hr8weptnUJi1sWXu7FXHZvBwRO4fCV4k/6DOIjZ8EW9f8LKI9vqBHSnwlh0US
         j2KcRMDbuZf0Zwfm3CLZKFy7wYDlyZ5ydwv9b8r/MWPNLPTNhviGHLgCNXqP4yucbZDG
         Pp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715107; x=1747319907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
        b=gUS3agVJwJPJ6BJJtqpZzvwLu9z5zbWZNUbbmuzpJBhtzSYe9u7Rni4/TAjtf7N6Zu
         Pj+tq9N0DSDT0zyVJlK4wTcVh6i9E/o3ZGyllQYH20q2NgFwh1WxnxhhdEjGgA3nSc4u
         DPRg9BsW7l+PtfC5pK8DaYm8u8o8ecrhvLCTgZHsnGHprrBs8RYavedm7ffh50f7Oi4r
         ISSgXoCihWOAgSQ2jJQDcSl4eP8wHDGKIE/Qh+PJxfTCR914XVo9eZKyC+XI5f19lmOv
         xQsvVn8GJy+isR3fx+yeMmL2NNc6LR5sCnyu8SFwwufsyXgNDaPhrczuowi4Ulv4pqWg
         oekA==
X-Forwarded-Encrypted: i=1; AJvYcCUu2q+KcrsEwnCqhYOBdJU0VH00ozhbvMp2wp3AhwghCgdt2IGaMp8FkvhidaJjYZsfbCu2FsN6IxAVT3h9SEyg@lists.infradead.org
X-Gm-Message-State: AOJu0YxqH6G8dazjvToib6eXVAYRwjP+5W0UmQd0kAw3d8T/2W4JLz4Q
	zSta953t7nsT1TLpMROI3J739cymu/9EWfITaOOLZByXWdCK07/4
X-Gm-Gg: ASbGncvblbB4Rehe2KxSzK5JQTst5PdLhfgzNOPTnZwtnhCy9NyMPHbocT9Tk/nxJLA
	SDWqtbG+ZuJK8Q3kIbdHa26bJLxt7VKN0ujMR2XKilLoe2qHljh+4RBBK+pb1EymyAHAhJ8bOq/
	a1pTfiUfryFoRhRX1qU5W+gHR5KEZ8oK+/1xSju0ocB8BwSKHb0zdDBn7M4brRyWA9Ev8+fGuh0
	m+h1a/x2LJiuiW7dqgDgOwmHrQkNGvPL49DxOADKTt8GfvaKwYlC9pYkYKaWC4AxDmrXW88A8Gm
	pDsiKi3cWk2m8atDhM32wZmlIBlZEqhI5cBFklg8aLEa
X-Google-Smtp-Source: AGHT+IEl8W7Z48QojZSSlNyKzo/MwD2zC8/Fy87SvOdLzrwX/FLitnj/UnwE/86blYtfAsljSHA5MA==
X-Received: by 2002:a17:907:3e8d:b0:ac7:322c:fd0c with SMTP id a640c23a62f3a-ad1fe946c93mr353166166b.40.1746715106657;
        Thu, 08 May 2025 07:38:26 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1ed2f588csm334443166b.42.2025.05.08.07.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:38:26 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] dt-bindings: arm: stm32: Document Ultratronik's Fly board DT binding
Date: Thu,  8 May 2025 16:38:14 +0200
Message-ID: <20250508143818.2574558-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508143818.2574558-1-goran.radni@gmail.com>
References: <20250508143818.2574558-1-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_073828_631935_F6998C2D 
X-CRM114-Status: UNSURE (   9.18  )
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

This commit documents ultra-fly-sbc devicetree binding based on
STM32MP157 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 5fee2f38ff25..65c4dcdbdf1d 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -184,6 +184,11 @@ properties:
           - const: phytec,phycore-stm32mp157c-som
           - const: st,stm32mp157
 
+      - description: Ultratronik STM32MP1 SBC based Boards
+        items:
+          - const: ultratronik,stm32mp157c-ultra-fly-sbc
+          - const: st,stm32mp157
+
       - description: ST STM32MP257 based Boards
         items:
           - enum:
-- 
2.43.0


