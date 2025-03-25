Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E14C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYzJH+XUDBUF/N0lAmCHUaQA8dWYRxiMlRySq6cDUpo=; b=vXpLqoSZM4inuZCdZXUFPPPj0R
	6L57WBzBWBihXyIOrqWdYkgY9YbPXbZXj5xQ+6dqusLtTZpPtGukAYJHZiDmLbKyqilelVhU4Y5z9
	b0AoDib3QJ7gVwSapIbT17UqXdCsI4jptu94fh3XNlKOupRfWlJ6qv1gMk8wRyki11aa9tQSwsyMi
	e0GiWmizV7OcrqHyij0hIVgo2bGa9nNXQ07nXLyJpYsKzo/9Cxf2xy+FhVIKhxASCpyqvFYURhFkq
	5GQECy23H04XKpzZrb/7DzyC1YPK2THHziLmKSB7JtJoduzyj39/qLaiptDwZllVSxp9ZnnBTljFa
	2N035qqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx28O-00000005afs-0rL5;
	Tue, 25 Mar 2025 11:07:52 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx25A-00000005Zvk-0ogp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:04:33 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso8786589a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 04:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742900670; x=1743505470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYzJH+XUDBUF/N0lAmCHUaQA8dWYRxiMlRySq6cDUpo=;
        b=A8Zar4TA0KRe+zCE1XC6UqK7rSRiTA1LWN5v3fMR8mtwfebnGvmQow+YEkKVsRjxOD
         IyOmnOkUx/wLYhQh4+pS5qzxzX06KYIgeGMrXKgjDSW3oXy8BVR5EL96csBJhAIV085s
         aD9/Lqpotm6LKNX13vP5cHkdC4vZRe3u6c3HM24EiBxn0uNeIp8jXR7wc8mi57PB+mEP
         YJi37oOiat4nNmSz/H2QwOxBfH9CyOGNwv7rKcUZ81NZ2cjwH+obuAl6rvPgcUhPTkgK
         pTaNIBTi3mJoO4OhjhdacK8xw4kGIK6Z4XyBY2hGmZqDSGd8YyhMEtfHtPuBXxz+xe7S
         coxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900670; x=1743505470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYzJH+XUDBUF/N0lAmCHUaQA8dWYRxiMlRySq6cDUpo=;
        b=JRUICdh78AffK+2EOPGHg6EWJYfWmLT5H+PQ858jY7NwKFa996XpgYu6vaM/2jcDUa
         I0relY2fk5gNCJqIJk1kO0txd59ngKK/uRHaTW4rrXbxnkEeDBiT0G6JQU6rDbMsxKe0
         ynMxCaGgRSmVBe1vX7GEKAchq6o4D/WRQJHGCCTnUQHozPxP+sxiAOSnmPRjoKmqb1Gn
         bP0NVVVt13SPOIi3sx9VLAGoy732mE2WHjo3wdf0bKYQzBR7jvv1vUIib/ABfTIsCki4
         4uIEor7pPrCS1zpIMmJUlPe1BDV0obGizVrN+ZlMvuc6sS0g6xBhnt+bpyY2MrkwDBEa
         kZRw==
X-Forwarded-Encrypted: i=1; AJvYcCU+43pHdj+45YHb3tqkvXhUDLXN6JI22i+rrY3wnfduEYC/fMzdg525tOjXAX3PupgJIfNWp6auoUN7nkFz79Av@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9HIiLngWpdXAnUsjQbZbpKkLCkD+BAtN7vfhnlbKWBfP+aRkV
	HBOZ4QzuBxolbxqiDhiyg5YPU/K/y44moSVScXFFryOE3mGFsDtwZD/i9rX3
X-Gm-Gg: ASbGncvkCNAhxdF2gFnoGgd0V7awqtdVsiG7FLz/E7bp+GYoFk3OoftYA5mPiy3HfCz
	EPiJpb0QPfV/M57fbyphwY5D1/ubVaoKfqpicwJDQ41gbqFtBLL9Qb+wrx7n+yrw4oREBq2qwg0
	prgWwXAgfg4kFiiiWCTL+baiDh4U8PyU/QH8GantY1MnzH0BRThz5Oip8FXYvTL9pAdHeVq5hWN
	BfyzET/y/Kn48m+tazsKIkY7Yf5ONgFuD1t76Yxcd4WBALE7rJ3mjoKTuH4M9ZN/o2Odu4+XFyG
	60EdUbNyEPqUmFjyRbEagYtWj0Gs314hqCPrjXGAoXYxNbFlk8/xM8RBERPua7Feimtcavy3/55
	xpp6paYljySav23tc
X-Google-Smtp-Source: AGHT+IGjYBkqXYerys/mgiL5w0LGUgClKn/t3akwJFbuIP56/P4GUrbM+dD5ttple3vDwypq/KVE0w==
X-Received: by 2002:a05:6402:354e:b0:5e5:c0e7:f455 with SMTP id 4fb4d7f45d1cf-5ebcd42dd4cmr12337589a12.8.1742900669673;
        Tue, 25 Mar 2025 04:04:29 -0700 (PDT)
Received: from wslxew242.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf8cc99sm7556809a12.32.2025.03.25.04.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:04:29 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <gradenovic@ultratronik.de>,
	=?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: arm: stm32: Document Ultratronik's Fly board DT binding
Date: Tue, 25 Mar 2025 12:04:06 +0100
Message-ID: <20250325110409.2323611-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325110409.2323611-1-goran.radni@gmail.com>
References: <20250325110409.2323611-1-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_040432_241062_26EDA4E0 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Goran Rađenović <gradenovic@ultratronik.de>

This commit documents ultra-fly-sbc devicetree binding based on
STM32MP157 SoC.

Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index b6c56d4ce6b9..c1cb54ffb210 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -175,6 +175,11 @@ properties:
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


