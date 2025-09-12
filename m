Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28A5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNs2h9oqVJ2U55pyNU2xzrbkzs9MTq1sjEL+cOU6gkc=; b=dFiTpPC9b6oLr0iH0hnS0YjFKc
	6Q0oQ7/njQ54C2J9tED0c1BvkEPjVGBLVaBZ+mBawCItXxxllClMcRegzK/ytQUg7zkC26XrDRprT
	HCxCWxaLHtuRoeVdqvXJlq3A/TWVDL1+lqMjb+4a/FIv/LsTpecdly4wSbUqFJl9Mu3MqAHNP3Ek0
	YLydbxurn6ahpO9eUarxrzhLZcy6BTy6X5tVLBd4y4FduBVfH0UWjpbjZ3/wJgzqhNHkYdOunZqHZ
	V6BVnNQg7BsC+4PWwBCC79c+PqNc9QQrQjORnqibGepMyNyIqzaG3a6bKeBk0ebb22xJOU93Ez2Mf
	Augo+fCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Ql-0000000A98R-28xu;
	Fri, 12 Sep 2025 15:11:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Qj-0000000A95q-3Y00
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 15:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CNs2h9oqVJ2U55pyNU2xzrbkzs9MTq1sjEL+cOU6gkc=; b=G7p/qpaXD64Tcy1287hb7BpwC5
	g+vBcMTvvx+8mnvHrwUBEirOTeMC1oRgOLt1Vi0CrKQKIvWzgg0DXhXEyXbrNVAC4rCwLwjPm05KA
	6vge1rj2K2M8R/5zHGFUXLBxTmxCP340b8T3yDvXzpWOd97rV2VBcHfXty6Ts5ez2oLFPVT2vhguO
	nXOOTN+4HFoZalKiw8/ItpXysMslABUPUVfOOghH9olpaoyYtc3/Go4fxINkxPe1aXlbg2S2OSSNw
	Y8SjDejJXAMv/W4lfgNKLOGS48P2YaIekmK2ZepA4OfTnQj/YL46MjeMU2pRL5/mICfM3BB4/6KmL
	k4AdnWsA==;
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Qg-00000006NaG-2FTh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:11:16 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-71d71bcab6fso18134667b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689873; x=1758294673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNs2h9oqVJ2U55pyNU2xzrbkzs9MTq1sjEL+cOU6gkc=;
        b=isV2eB0xRTWyq3g58c7bwmo1z+lgdV9ox16qaHpWBN/09m99Sq0TCeKIB8HmcFTGmi
         MDuRNaMpRR+UtZJ6y1/nYwkMDYt+wyVvB9z37kGbqpBn95MYUsIsvWKXIavCb0JeXAom
         NpPqXXsHjbohHNt/ShizwJsYNZ545PE4hmZS80Y6q1GtbdsazH0sNwGdEBBVNI4iW3NK
         40qNNI77J09CpYRdYENRFmNBvHxkGvp+rY8IG9HYwyx08XE6HkfvFrIf0PaGkGcQxoA2
         7vUBpCqIjjLbgunRqOxU1ws6SfTwPu+Eb1RM1tPbiO/y9Wlx3PSBenrktUpdYp6nAovp
         taWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689873; x=1758294673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNs2h9oqVJ2U55pyNU2xzrbkzs9MTq1sjEL+cOU6gkc=;
        b=dAd0EJGy8D6RTXYOjKP3Vhg6i6IDctoKfcPA2T6M8DHldVGE4DS3E0P5EaoUuw5JZ5
         nv+uQH4QM4rUtUP7+uF0eqV9rYlGVN51vGFXcICMJx2QdV+uT7TeYJY2ydCoZaXDUJm+
         VAU8hiHrUMDWXO63ZYWG2n73+h1lh4pxHDVs9X+/ccpZyuwiI37iLivQq0Wlc8sT4M6D
         gCAKaeku7ng5QzROVa8e7DK5HdVW7NVEcKZkMAL/gsj++fzoGJZe2T6yqhM2gYgiw/cL
         U89VWMjMCeXEWuH12GpCbiInr74uAXsP1v7Wx+jI/geEkUNoOF2bi6UhB4s+EUHrZc/N
         lqLg==
X-Forwarded-Encrypted: i=1; AJvYcCWzkSIJP4LYVygBNEKyih1ij0hTggmRAS8F+kVJJPsrAATkM95k1gK/3Yt3e0HD/4WgRNfCCpglFlRcmBMeac98@lists.infradead.org
X-Gm-Message-State: AOJu0YxWmlglfeql4ig1YyCG8TjTxJyQC2wFhSiDl7ZwqsjUidM2jbty
	1l6RBn9HNM4lE43cI9CmcIRIEJXvOzsdID7dApR1MTzk+ORPrCuJdAVVG3meApsMfVU=
X-Gm-Gg: ASbGnctkM9XeZsjgSK2oH9+/9JKwocJFKmU0l4Bh8ncieVpyqqHK6fo5QLfNA20nYKR
	KqAMmxN+xc0hQJpuYWYGLkojMrQeDJMknLoyWrQlQPVaabcfqekNPCnpJRR4SLwLPfqgdMly59r
	uFXQA25rmAaQFuifnUvmzqMCPCYQ/JMY1Xzu7D50Tf3Ia/6aItsjXpmw6qsM9BzymKK/suvqMUy
	nnQl5LgFz4JuqtjbFDAlYBOnunaVKDGTLsk7aJmv74jaZs76tBqN0OShuUwA8NiW+B4li8PDj0C
	pth/ULRTQwswXpE8QCqw9/vvEs9gbuLb3oexGsKK9MKlqIwIF5efvAosVUFVbdLsXoHNhkc8f8u
	m126USQdwsjj6gDYjSzZq+heZKXl3WjjMkg==
X-Google-Smtp-Source: AGHT+IEpiP8vlE6JAkelU9ryV0aqgK+NNUoCmR9E9pT/XsbUls6aw+6SDhLPMx2e7d1wIx+kCxhExw==
X-Received: by 2002:a05:690c:4a0a:b0:71c:1754:2696 with SMTP id 00721157ae682-730659ba7ecmr33141997b3.36.1757689872581;
        Fri, 12 Sep 2025 08:11:12 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:11:12 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 16/16] dt-bindings: Add Google Kinfo
Date: Fri, 12 Sep 2025 18:08:55 +0300
Message-ID: <20250912150855.2901211-17-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_161114_765320_E46A08AD 
X-CRM114-Status: GOOD (  14.36  )
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

Add documentation for Google Kinfo kmemdump backend driver.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 .../bindings/misc/google,kinfo.yaml           | 36 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/google,kinfo.yaml

diff --git a/Documentation/devicetree/bindings/misc/google,kinfo.yaml b/Documentation/devicetree/bindings/misc/google,kinfo.yaml
new file mode 100644
index 000000000000..b1e4fac43586
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/google,kinfo.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/google,kinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pixel Kinfo debug driver
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@linaro.org>
+
+description:
+  The Google Pixel Kinfo debug driver uses a supplied reserved memory area
+  to save debugging information on the running kernel.
+
+properties:
+  compatible:
+    items:
+      - const: google,kinfo
+
+  memory-region:
+    maxItems: 1
+    description: Reference to the reserved-memory for the data
+
+required:
+  - compatible
+  - memory-region
+
+additionalProperties: true
+
+examples:
+  - |
+    debug-kinfo {
+        compatible = "google,debug-kinfo";
+        memory-region = <&debug_kinfo_reserved>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 65d9e5db46a9..6a846c51db04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13821,6 +13821,7 @@ F:	mm/kmemdump/kmemdump_coreimage.c
 KMEMDUMP KINFO BACKEND DRIVER
 M:	Eugen Hristev <eugen.hristev@linaro.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/misc/google,kinfo.yaml
 F:	mm/kmemdump/kinfo.c
 
 KMEMDUMP QCOM MINIDUMP BACKEND DRIVER
-- 
2.43.0


