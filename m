Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF4ED58E4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA7ZHCoOg+iN91Yh0fD8Ot2D5G2O/zSpqiwS7NE95K0=; b=gIwTli+BLGfZAP6tZmrfG7XBNR
	dwM77R8nL3mHvlsqYf+cOiCNs6BVFdjfbjgby32cXghZHC/LAAsPbGZuo+V6TmtPNQRoS8NpGPmph
	wrLxk+FsPqlQvK+Zo9ph9iuTpQs1U5093JAdysfLumy1r4tp5FP4gNfMHpC76iPLhpOmubFaYqtAp
	6emkBuTrlvaPixA1BWOZLqgmRJxUhPK4WHqJ3YkYeMArCrEyYmpU6x0powu5Ad8iLiKTce6Mnbw60
	OSA4AN4pP9rUO7o/XrSHupENvOhissYBwxb2K37E6zAYWSyCcKsvJlrni9apnV4uyScL76nWGII1u
	8If5eN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgko-0000000GbVz-01PI;
	Wed, 04 Mar 2026 07:34:46 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgkm-0000000GbV7-0Rqs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:34:45 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2bded9bf7a7so4783610eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 23:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772609683; x=1773214483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA7ZHCoOg+iN91Yh0fD8Ot2D5G2O/zSpqiwS7NE95K0=;
        b=F0d4A6b4bg6lbljMxZf93CiiLM23n0TbOl9GDLF687MH00kXSqDrz7ocBLki0iZiIQ
         OuJ9HclsWcl5cfQXf0YIeFJADd8PgojKltlfnI7WddCMdCnK5mfRknY4YrzLCH5+B71v
         SaZFZrF2Igd4IkXSVq2OsH858yg3GxaCyfnUOgy0x+ytOyoM+SHskzYardhP8rKLE+cq
         gvHJwE4W/AemR34L5f44cDkwAu/wmL2QLECaeHA3a8gS7Zi8VFGW4GORCE614vs1K0he
         cTayZ4ppxSXXYK5uSPAny0v19cohu9eXdJd8gC86dXQpx1f7jB6mfXFgsAXIE4+Xf4kt
         FmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772609683; x=1773214483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA7ZHCoOg+iN91Yh0fD8Ot2D5G2O/zSpqiwS7NE95K0=;
        b=l3etKO7UFaTcgGKajnVPHt7fEmBsD1VSkK9t+5kFsRE/hxFOY6yzLCPVYM0OQ5RwuK
         CBeyWlASNC8giSoGntvp6aBTclewHhPufmhsZYArER7VRlbctLC+xS5/s51WnZ4x4Nh6
         qxKkBO/29vheQlRdD0nDn9uNQ4pvrZN2KwRP5xX/I73Sk5jZqNM//HPUVzbmS/9BjSQf
         6zDdPYiO2eW3w5l9DAg7TLVFJTD/rNIwF2zt3pZgPsXFMSlNhdHYO78WXlYOwVMFsiwb
         mZ32Sd4xPFFSrQ/PmXa8XO3pOgNBDGXrh89A1UuCDzhxHB/RxDHKmZmMdHmQaySA4uhA
         bSFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDVViMyAiWUK+rI5NmgKPPiglNp0wQGDAl8oawXSSC5XEJFC6bOFkwOAhMADHLE9od5tybxw/eo+SE0pN8zfDU@lists.infradead.org
X-Gm-Message-State: AOJu0YxD0OcJuM5Cc+HABh8l8LDBlE17UIXfvtjNo6yqPYPanO7f9fL+
	AOishLV6pvfaXkR5tVPII0w+aCJZLsKpDdl8BUdM0iT4Ke3QLTAjes9Z+lW9bZSA
X-Gm-Gg: ATEYQzzWjJOtHzGttVJAn+NW6noBngSYWG3fzUbSdfYtgnu2sBHr6kJbvHyuBnl9Y6m
	nW9SkZ8oTF6JpZSw7SP+KKWWV0OUKxGC0ns8JAxLYYUIzHsabj4Gf+vLWUKbF9uUsZuWdv0AJn2
	o0SbmWl0FP9kNzWASwxD03bVguxskqSkpTCgoaN9OjKeqFo9qKrIXM54OrEOaNIKEY8zNGloJQu
	lwa1PlIZXyCxNjYUnTLx0tYuPQmPNh4lOLohLwbwqljsPm6BYO/PCDy9p4/jEiyVEsgUexfmglt
	czHZoazGdEInwQJbCA2uFOLaQgbyg9lTuQDTqb2LFQiLpR60wDh37bFXqc2KuKodgbc0kzYE1w2
	STXgLFQ0yJrm0yQgGhrCIaVGubb6ZPPTaL9NPbNZ5d/ZvL8vt+yl0dBYkuMI4+6zCf96CxKWVAw
	xDsqd0kRr8bnNYdPEViB7K
X-Received: by 2002:a05:7300:ed13:b0:2be:2043:614b with SMTP id 5a478bee46e88-2be3105fe96mr348505eec.18.1772609683103;
        Tue, 03 Mar 2026 23:34:43 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2056acd1sm3457123eec.22.2026.03.03.23.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:34:42 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	andre.przywara@arm.com,
	Jun Yan <jerrysteve1101@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co., Ltd.
Date: Wed,  4 Mar 2026 15:34:28 +0800
Message-ID: <20260304073430.438835-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304073430.438835-1-jerrysteve1101@gmail.com>
References: <20260304073430.438835-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_233444_140414_161D9C20 
X-CRM114-Status: UNSURE (   9.38  )
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

Beijing Ultrapower Software Co., Ltd. is a company focusing on global
mobile games, ICT services, cloud computing, and artificial intelligence
solutions.

TaiqiCat A01 is a blockchain-based terminal product launched by UQSoft
(Beijing UQSoft Interactive Technology Co., Ltd.), a wholly-owned
subsidiary of Ultrapower. Its dedicated product homepage[1] was once
hosted on Ultrapower’s official website[2].

It should be noted that UQSoft's official website[3] is no longer
operational, and the company appears to have been discontinued.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn
[3] http://www.uqsoft.com

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..bb16ae90a4f6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1731,6 +1731,8 @@ patternProperties:
     description: Ufi Space Co., Ltd.
   "^ugoos,.*":
     description: Ugoos Industrial Co., Ltd.
+  "^ultrapower,.*":
+    description: Beijing Ultrapower Software Co., Ltd.
   "^uni-t,.*":
     description: Uni-Trend Technology (China) Co., Ltd.
   "^uniwest,.*":
-- 
2.53.0


