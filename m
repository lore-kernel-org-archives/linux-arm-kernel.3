Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B738C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 09:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhF6R6vwCAIFOORSKjXUEJg8tNapknbDuMgOuxMh77A=; b=xBJTq+3nfmkAh5gU44HoRrPs+S
	dIGNrDItcXZi/P7J3nR+Dv8v3oJdnd/HgONWuMq5VYmo3Td9GAFaKl/OXm21H/00OjW1qrg6H2ncR
	JAkWuzRwpRNS3INf2TiRDByJlYXREmSi/+7gI6vL4SdjtiHAHJigIRuQwaodqrMc5+W4LZc+xdZqC
	4loFIzaYGjRaYhiB71Mw0yPqSIenpOuVmbJ7ISjLaqO50gHQYhFZS9KFeK4VDi05HxJlDiRT6Bx3Y
	EWD8xSCNgaAbBk1pn54O0kRi1zz8Frte/i2H2F6H6OIf0zR1MEIuv7AdyK0/mCGSkdIp+mFfyZXP8
	OFa5d7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNLA-000000084MY-1QYO;
	Wed, 26 Mar 2025 09:46:28 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNJO-0000000842N-0EJv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 09:44:39 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso1603024a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 02:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742982276; x=1743587076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhF6R6vwCAIFOORSKjXUEJg8tNapknbDuMgOuxMh77A=;
        b=DJT+m7PYaD5fxVBO4nK2TAcyPek0S8vJ73/4t6ssjl3L40giveTD7fTjNuLvcgCUPm
         xaWAFNqEgJ12vAp7iITwHCHLZZXZP1vkOWQ/XSfFvo2zvrNJ7xIzwggyNwboP5tITBxl
         6ziGsZa2XIcfrXaagTkrkdMzDPuTFsjhj8E59bWdCXlS8QQZ/1KRJ0rtbtt/+v7o20Cf
         nZwfWOrsGuV/0K+P67NcSfzEEwz7+zDIRXGf8GdVVFP7QRH/2K6JCuEV9gPC04lb7gLK
         sOj/BLYZBszH0QBaW8VI42mN1yuIM+qdb3Dx1ItWSPCKMyEIzTxBK00zNXp79xegiQpN
         FpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742982276; x=1743587076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhF6R6vwCAIFOORSKjXUEJg8tNapknbDuMgOuxMh77A=;
        b=fkq8QZ09NBbfF4x0UF3ZRgdA65+3X/03WAN9mNNLNIJSzMaA3aDzGUapVpKW600StV
         AzOmXvZYLuziqqV+M/OyqDOnHXiTrTxOZKIORhbgf7xfEZRiXdERaGZYW9blMYLmBx15
         aPjxWHJ/PWFUWsIn3htUANc4B4gby9E5vIUt2zPlU2ce2/HZj45DDj4UA0ZtIIfGjcnH
         Wk5at9kV/+JC2omdCH54EGMwwbUzhoHd1TMd/WmKlFUoB1PgUsWqdPCjpfI5S3EdYJxh
         afA6nT0ZbPLyYCv5blH/7l4h4/vT7+ZBBJEKvCVQ4CRc4anYcVP4zSpz5iZrnbpWnSN1
         YPRA==
X-Forwarded-Encrypted: i=1; AJvYcCUwQZJDteFe6x4t2V4XJo6qK2YPZdSN7L/QJyH9uV5UKSh3fZMcFi6CYzQlavRegCJmQxeQwH3xJqcN2S8dmQSF@lists.infradead.org
X-Gm-Message-State: AOJu0YxN4H1awXxvyrM6gwVeuBEl4EWN796ydhxri9L1crmGaeF10ZbD
	Q9cmCxE6UjILEEn6N1+2lO3INniE7bduuTLHTfddGVEYMxUBKvjt
X-Gm-Gg: ASbGncuolD1CpdxPGtjaFABKXWIWT0pGDgUg72J7XvbFTmh3EmKpBImlENCieROwzM8
	xa3FUNwPOZedzyVFvQxSpYOnY2yfCy1KKBvtH/bJfkduZ24AE+6OHG7a4hhIdMzJnJW60F+SHwE
	Eri93jZTk5YYdAHz2iM/y5jWrbLnZzY4H9sdU2iFVqAYRYD2i7QFJJ9ONhESel+eWPsrcYLbTAj
	KMZZh2Rm3p1tSpWIA5enib/+rLzGU+xfMLIS5hLcQyZYMtH+CEz17Nro8tTV1h8LA0Ju0Lhe4j6
	7Unjs0aWx8/m94faeiYuMHRM/OO03nSAsjcLgFM7NtmKI5ak
X-Google-Smtp-Source: AGHT+IFYQXx/dczxe9yMk/xq+gCXEaSFfjBpLvbptmHL8QgCOEYYRcX3+bVaYHpFvj4ivFc8M3ACMg==
X-Received: by 2002:a05:6402:50d2:b0:5e4:99af:b7c with SMTP id 4fb4d7f45d1cf-5ebcd426f95mr15941899a12.9.1742982275987;
        Wed, 26 Mar 2025 02:44:35 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf84600sm9120488a12.19.2025.03.26.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:44:35 -0700 (PDT)
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
Subject: [PATCH v4 2/3] dt-bindings: arm: stm32: Document Ultratronik's Fly board DT binding
Date: Wed, 26 Mar 2025 10:44:26 +0100
Message-ID: <20250326094429.2397365-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326094429.2397365-1-goran.radni@gmail.com>
References: <20250326094429.2397365-1-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_024438_095468_53C746AF 
X-CRM114-Status: UNSURE (   8.98  )
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


