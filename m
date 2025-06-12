Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490E5C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=; b=kSoKDZyDjkyjuPkHCHrk7Y7Up2
	MzEM+mW6O1Y4QjTm+GhDZ8QiqGosocvapjA1U/slHPcZ2jDNvPsdvjmRE7iQHAl+JC4qeV5VMCums
	k8lVCuR7xkVTreD/K9jwPVaYJTWjxgb7TRXduzjcY/6zaBbjEsq4BDKTdRRXocMXqyaEDCiSl7p3f
	qyWBdTnyAFpIx/+wmJBS+HMTBCl3sSRG5gxnTMhBzrM9K+MXNxJsolXKGY3Eqxz03mCYWJV0ABBSw
	VltM3rfd/haEbPtC01JnQ+NAAifztFYO8lVunIeC+sKF/Wf6X6JgB+5aHBj2Igu8sgCTTGU2kNW9J
	RSQrL5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnop-0000000EGNY-389K;
	Thu, 12 Jun 2025 19:42:35 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhyu-0000000DSSd-1gsX;
	Thu, 12 Jun 2025 13:28:37 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4530921461aso8271375e9.0;
        Thu, 12 Jun 2025 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734915; x=1750339715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=kCYp094ggz5utxLLvpRSbDM4jnaduCZYBvEYzD7dUXtCn3ZS0KT1Vslszm2ITEGO6y
         SCbLmAL+IAs8So72v0OSyhpuSYxBwS+/z3iES5ZzNGq3WlbjDv5G1/cmmYavfG/Kp2P6
         LAYWgyZAasvBr7XnQDUzaATzS6xArdNoIWsooJO+BIzN75iSmMhNUzQjX4y0S2HuM4C7
         TuXa8HprOjGGtAvkhxutbJTIbZ5OJmDe8mzgTOqZuNW2KNekkboYzAxuQZaFNgr9tc1h
         ictFicESJMOFk3CBtgdjtiFNynF5XPnJlcHP2Gfe+FzLhDwBwo1/Xwq+JtYXTOH+FV7t
         kPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734915; x=1750339715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=lpwEkzPGCtwzLkLt7ObYsQUa0COUO3Wgk76EWGjR5oVo7h+8IaSZifdU8YLjIiibdZ
         5t8n26WT6MSVWDO/X/RR/fmUb0Fj4zhHZ+WOccWRLQQRD0TRr8OB0MQJzj5j8S4pVjxh
         FIusYbIKjHd2WZucqDhk4dLlmso/+0KpxuywT0fa1D5T0mBjgaA4iLSz9sKJXTnrOO7k
         uCP8bAFoCT/xzjlgtiNBimcUFUJ7qOkBX8s/ecXxqLkg2okuEY9D8VVE5AHXkSNeWbl7
         UTOpCwpqPua+gJ+Cq17pWil9evkrJ5WVndKMO0IHSqkOepIFrpi7GaJRx2GyGzvydfXx
         gLBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7Ox9j/I08vDpEQHb9w0C0aFXHTcDbCZCh9hEMX5RI/mDkc4ikf1q64+wQP35ubSXC7E+jL6UPShhKg4k5QNFY@lists.infradead.org, AJvYcCWo8K//3/A4rxz65f3BJz72WAQvnujC8CKTAXy9pwtTLWnfafG9gATp/MUhIpk5E2Cq+RKXZm0JAbATWzM=@lists.infradead.org
X-Gm-Message-State: AOJu0YytOgmjQuWe7SFSeixiR8/Ga8UYy9RAwUbML+EUK0YDOnxsLJS3
	aF/AJvTNBqp2QT/+A0IrsjjUVSaoq+XdDnJTgAxCZVtaJ/4HwQgLI+55
X-Gm-Gg: ASbGncvM8IvQeOZloiB08YaOebzZsT+AaQQ6w4wpJKdslrf6xrLUg867ZHSO7xCJFhA
	C5IruueVaekVu5PDDcWsuQiyKoZTIMipGesouaZJGO/ExPEr/9cADrQ4myWyuP1B08hzzD6JJrW
	QfYTcaguBPyPV0RG2fJAeo8J4t5r/id0FBllYwlk8DK8lW6eJg+erDxQ/RhXwRAMST9jkOy+lC4
	AHH7Grx62aD7jugJA6qgarlhc25eFiIsdpNG1OHWpL1t1mlzy5scu54VFv2Qjvbw+xj7uyqmujx
	auMLBcbuJdd/qE3KJJOVpLDF3ABjwnoz6EDZX7Rc7fc5jscNDsBySxlXD4KbpkKUVMT6VKVVpZ0
	=
X-Google-Smtp-Source: AGHT+IFWiGNMBdTBUMs7+0ijX2pUaO7IssAxRo0dN8J+TZrkwdKUEWMff5QxI4+ITXCstzD5fkIxsw==
X-Received: by 2002:a5d:5f96:0:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a5586dc413mr6122966f8f.27.1749734914690;
        Thu, 12 Jun 2025 06:28:34 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:34 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Thu, 12 Jun 2025 15:28:09 +0200
Message-ID: <20250612132844.767216-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062836_441259_36466E6C 
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

Move sophgo.yaml from riscv into soc/sophgo so that it can be shared for
all SoCs containing ARM cores as well. This already applies to SG2002.

Add SG2000 SoC, Milk-V Duo Module 01 and Milk-V Module 01 EVB.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
similarity index 81%
rename from Documentation/devicetree/bindings/riscv/sophgo.yaml
rename to Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index b4c4d7a7d7ad..602c092b4ad5 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sophgo SoC-based boards
@@ -26,6 +26,11 @@ properties:
           - enum:
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
+      - items:
+          - enum:
+              - milkv,duo-module-01-evb
+          - const: milkv,duo-module-01
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.49.0


