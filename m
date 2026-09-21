Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BCDC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcGk9G8S000WArAMLwdOiTGHKXUA8vP6GMN4jNzx1Ic=; b=Oj/hk4eRydJ1VMFnC5cFLTj6SK
	4l+gnaHPCu862mCkIFbiC2DkUqQso3CPMOsV6jvGW0N85eT0BsmDfW8hbc/9M1E2E5gpw8c2IKpcq
	20qCMWbXZW0HVGyot2ZbuAdp1FI0w9OyBic9cO+FrSYUfehwKyyC7BPfoTQJINUYx1hXhTnMugUUf
	KbqXgA5VQ5dQf81HrsRUyfWaPx0x7JYTaQwdVFac8PjHKDpeIpgdPpoyKsIEGAXeVDOusrFGTSZoB
	L7CvjcHO2Qc7kkCOqF4UEKTtedLbkwWmeY5nxLMIk6iMSjL03raqW/KXCs1qIgF9Yy2/JSKGosGqx
	N2G/DSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bmT-00000001ocu-1prJ;
	Mon, 21 Sep 2026 11:01:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bm9-00000001oUD-1AsK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dcGk9G8S000WArAMLwdOiTGHKXUA8vP6GMN4jNzx1Ic=; b=e0BizMmNNd/Rn8imzVVY128Um6
	oxrr67H7Opwwgdcb8PtZKR3c15fyQ4gR+YcsJAd9lXzrxKR+2E0NHICubxMft2XyFIuLFaYcOycle
	RuDUbABAdgPUbl/RuUPLtRLQYAFlAql/Ce0xOzaaeMt0hprGDD9WfrnqXunZOSHZ1ON1mExrxm0m7
	z26u+OEpP+hRQ/uC+FRv+OlqXnL5wEQmMpthXMcaKwK5zciIN6/TGkcIpFldM6uPCFOnE0+QmnSS4
	hmArl/FMBJvVecVMcPaWzldempqBwBl5MUJc0EpdyIl3bdXQZGHSMiKDf7ZC1ItvXGVgogFijgI+4
	7bXXqziQ==;
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8bli-0000000CA3F-2lVd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:01:24 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49e635a6002so33149305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988464; x=1790593264; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcGk9G8S000WArAMLwdOiTGHKXUA8vP6GMN4jNzx1Ic=;
        b=fkVZh905EF5f/dX/3vgG/SYYRYwfCmvOUrdXeYL5QonP9rSUKCfjgDYqYU22p2kda4
         +r3H0l85lDT0K4RrvmcOJl5zaaej+uJdxMVWm2BXM39m+AjpKz75tsLFDaKJyo5SneGf
         uR7NrdUe494PPds6ryzD1TgK9oIqTB/Zi2JDibTf2LquyEpc4SawBK1z0IJWXNq3btoF
         u903cmCvRKYlgGavJUz/xvEGKefiuLbY/gYNsAguyAybS/yD8WcK1hD9zarxokCn5Uzv
         yqhE2C0HRFGTXL2AeO9jb1Ze2hLy4oqpBLWHkJwC2Km9/TjPzOgMT7M66A9BW0k5rgfp
         RyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988464; x=1790593264;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcGk9G8S000WArAMLwdOiTGHKXUA8vP6GMN4jNzx1Ic=;
        b=vMhaJNW2Mjn4sFgzUhUUzLlxzYxt4rmoEw5tm/p1bqeTStHw0kzZcvqg7aJIUzRKoh
         89p+jg4em2JNLqD8zzUK1Yh5CZv1quxiEnnCjTqCZw7hUNEiKZYILKhLt6P7DBScWJB8
         I5tRd04acPgXmq2qJKtadVdd6Vtjj+lGUiTxg3oyFO6r/xmfhErJuVty6hOLmgPiy4vY
         apYrTAJkbow4nh4LqV4vOKyDJltjk3KO/Bi8AG+KATclRvUsGWjbMcAf5sRbWvfn0OdU
         CGwbHc9miBHIiKIrfGnqKpgv+v6RJn955yOgdhHLKH0PuPKWPagmSH0BmsDLq2l1Oz4R
         7/VQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ2jN/RnAx/Snur49k8djnp/HH8y1FrU1o0StW4pCBWkj1WhcSLR/ncWvEJxyOlloSHsgeyx8VgU4U1HJ4qtAH@lists.infradead.org
X-Gm-Message-State: AFuF++nBnNAUCo6z3ZIVUbMVaAFgCGZiutplhCBOeL3FcvuEmNgdFttb
	zRX5wRXZ12sU0y1sFsM5QPfsbvkiYbwW7eGmMnjvOQJO2bQXbGRPX/yOHWAZiUETCBZAq4Qr00/
	FHM/W726d2UZVLTSKesaT1Q==
X-Received: from wmph41.prod.google.com ([2002:a05:600c:49a9:b0:49e:78cc:d29])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b82:b0:49f:ce72:dfe7 with SMTP id 5b1f17b1804b1-49fce72e040mr109082755e9.35.1789988464458;
 Mon, 21 Sep 2026 04:01:04 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:49 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-8-vdonnefort@google.com>
Subject: [PATCH v2 7/8] dt-bindings: reserved-memory: Add Arm FF-A lend pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_120107_209993_D40B190B 
X-CRM114-Status: GOOD (  13.62  )
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

Add bindings for the "arm,ffa-lend-pool" reserved-memory CMA pool.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../reserved-memory/arm,ffa-lend-pool.yaml    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml
new file mode 100644
index 000000000000..c02d36e1e418
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/arm,ffa-lend-pool.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm FF-A Memory Lend Pool
+
+maintainers:
+  - Vincent Donnefort <vdonnefort@google.com>
+
+description: |
+  When memory is lent to the Secure world via FF-A, CPU speculative accesses
+  from Non-Secure to the lent pages can still occur as long as it retains a
+  cacheable mapping to it.
+
+  Ideally, lent memory would be "no-map", but that would mean giving up MiBs of
+  useful memory. Instead, "arm,ffa-lend-pool" defines a reserved-memory CMA pool
+  to manage unmapping pages prior to lending and restoring them when reclaimed.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: arm,ffa-lend-pool
+
+  no-map: false
+
+required:
+  - compatible
+  - reusable
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    / {
+        compatible = "foo";
+        model = "foo";
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        reserved-memory {
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            ffa_lend: ffa-lend-pool {
+                compatible = "arm,ffa-lend-pool";
+                reusable;
+                size = <0x0 0x4000000>;
+            };
+        };
+    };
-- 
2.55.0.1082.g2b9226bbc0-goog


