Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4014CC6B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJ7/NhnH54F9thvi/u3AYl774UiiZhmgOKclyQGISL4=; b=hnfXKie/ZrCHvVa292qTGrMXbf
	xgU8r6xAnG1RQF9PiYDnTuA2ZNGB0yuC29zZb41nVlMQh4XRzdcJNmhBPXRSQ0TjlLaMCnsNu2HNs
	P5XICuKfzVE3Nbwli06fT6EBZ+40LL9l+T0iOBBPfFyt8qpAnSLTPOzjjNb9MbNH6q4kgHzTY8Mt9
	vUKDmgBSEFGulW0+cq8OTrkdVhBNtDgGG+xkSdfQe7Ff8I1aNmHNQJRT9bi752NH6RlujlfAxVEEg
	cIrEtTzQqNe/H46oT5F7TY+eFde2i99xlwwlvzXkShCCHmFsLUt6Zn8/o8Aygx4UMGsxoGV/CoYG1
	g1kuTbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH37m-0000000G6gZ-1E3w;
	Wed, 14 Oct 2026 17:50:46 +0000
Received: from mail-pj2-x06.google.com ([2607:f8b0:4864:39::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH37e-0000000G6eb-35Ao
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 17:50:41 +0000
Received: by mail-pj2-x06.google.com with SMTP id 98e67ed59e1d1-3964e7720afso2160050a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000238; x=1792605038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJ7/NhnH54F9thvi/u3AYl774UiiZhmgOKclyQGISL4=;
        b=shavUA4gnjkUONIgMAHt1/1y4UXBMZsGDFw7soal6pO2e5HJ+X1cflVXMNKgu2AEME
         HvOXNT5qfMs90wlivPVRSeqhO0PfMkBSTk5JrCdNFl8Gd60aGsrXq3sq/icvhVNaWwIo
         wH+TvFLYKlqy1sx8tZT2Plug/9Rev1YXxEdcSXkM+BZJ3+Q/HmI7nO4Wc8vBAonre2px
         73BagJaLJi/ohNBGCZ5/BpqaETOhJ8FUtytmXLIZt0jeQ4pIhQyPlP/D1roAJaTkka7k
         lU1K6NXKl2zLgPM3dFT0KfC2Y4O/QHQuuoFli42P4Mu7e5OdymgP6ygmCK9w8hu1mQKN
         bcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000238; x=1792605038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJ7/NhnH54F9thvi/u3AYl774UiiZhmgOKclyQGISL4=;
        b=jSeQ/v2a95/CNU/A9gYBjKw+m2URY/7RKZJd1Z9veIkud/p7YoYpDiYtfRU0VPHb1/
         vf/krt3AAgaVBnfuNKUwk0iiTzQ7S8Q8L4s/WjSyD15IUnthwiT2AuV/oypkXqugqddC
         FQzpeEzZde3HOmCe3ppGaiK97dCwtt2CZ8aIY95EUdONIRKCNklFzZyuSdGaTRIuRZKQ
         6IfaaWna1rLBTCyxAE3S5frnUaCgWKHmhf3V0gV04zwO1jGWLqfLAMTy1VTzEIBcupiD
         iUp2cyAkkJeR2iPUAx4ItweacWvC8pRADG6W8X19PU2ElseHIT9zpGC9OqeqKuCopu2V
         hesQ==
X-Forwarded-Encrypted: i=1; AKwUvBynd2YQ1tIC2g1mZxj9JkUkDG5dYZ9XnZHaesQPIQOnizqRBOqpOxuMYVJYqMzRIr/UCl3xOpbj8vt3FQukhzhw@lists.infradead.org
X-Gm-Message-State: AFq9FYIlTOR4v97pN0Sxrnv5WbHVv042ZDiWjHaP/igIcZRpuWQI4ouQ
	jjm2eUM3NP56bCHPWN92BChhgb0azD//vNvgguqFgFCwdNK3cynqnAmaEmc0qmJBSQ417zdvkRQ
	=
X-Gm-Gg: AYBFou0IGycHAIn/mM4fX05kEX/qP3epM+VmNy9keiDjLl5kL/691tdEh8OBywgDETP
	+UuF/OWY/j6u9RMSqKy4ffASuHHFfUZkwwRw1EkcMy7h+H1n+LC9k7T79vh5PrgK8sSdkqM0MXE
	zKfwRX3aqkkdJppx4GF+UDAOp/iqeHCK6mC+VqQdwZKIVMguNpIuNAssmBfnGJz61x6dGQIZvST
	Ys/9qFwMXKBLGFXQ5nO0sK6bRx5aJXLqW/TkdzbAVF7O21qbOVvh/jWXAGsHbUDAVHxtRjl1CGT
	Rx61yG02HaeR1Zq8PuFB51bR/8Mi/mNN/CwYBUZsc+qZtkMV6Am/WOl9DwYTQsMnftLMFHlmqC7
	UplJrxrlvID1PyMBQAHO9kbHhoNSiN0MiBmvnU5qEbovwf8w3lgBziespVJzu20A6co1OxIPEnO
	5wLcjOwFsIAMGlyT0GgphR60BPFGQh9B8urSGr57Q+26SjdKZ3saYM6R0NmUxEI4Lb0+rC3ym35
	jTm2HDj2A+yLG72wh9/
X-Received: by 2002:a17:90b:35c2:b0:3ac:7c4d:8be1 with SMTP id 98e67ed59e1d1-3ac7c4d91d4mr1626449a91.62.1792000237533;
        Wed, 14 Oct 2026 10:50:37 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([156.231.115.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm403009a91.13.2026.10.14.10.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:50:36 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add ALINX vendor prefix
Date: Thu, 15 Oct 2026 01:50:18 +0800
Message-ID: <20261014175020.62907-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175020.62907-1-cyan2254650260@gmail.com>
References: <20261014175020.62907-1-cyan2254650260@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_105040_675081_063CADB0 
X-CRM114-Status: UNSURE (   9.90  )
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

Add vendor prefix for ALINX (Xinyi Electronic Technology (Shanghai)
Co., Ltd.).

Link: https://www.alinx.com/
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
  - Update author and submission email to cyan2254650260@gmail.com
  - Fix transliteration of legal company name to "Xinyi Electronic Technology
    (Shanghai) Co., Ltd. (ALINX)" (Conor Dooley)
  - Add website Link in commit message (Conor Dooley)
  - Collect Conor's Acked-by

Changes in v2:
  - Use 'alinx' instead of 'ebdee' (Krzysztof Kozlowski)

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..26d5ef6d7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -90,6 +90,8 @@ patternProperties:
     description: AlgolTek, Inc.
   "^alientek,.*":
     description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
+  "^alinx,.*":
+    description: Xinyi Electronic Technology (Shanghai) Co., Ltd. (ALINX)
   "^allegro,.*":
     description: Allegro DVT
   "^allegromicro,.*":
-- 
2.56.0


