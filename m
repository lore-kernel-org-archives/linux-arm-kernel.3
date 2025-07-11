Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC64C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NH82M7Wpg8q915gzukGl/UR0qvoygGIK5SM365nsKWY=; b=uOOvC/fB3TWpo3zW7Wf510F/EM
	6P3Q2PoXI4rOLvL8H3uSjkKhnAF6BqZhOPWVqxKHD/VoNcMao/AQvFZhlciRTfHcmDPepHxHWLHaK
	YA0nyGj6z/Ov7yiXgzontytrjPwTMqK1A7Ltfbl7o1OrFT1E5mBrkP4MreiIemDRGkUB1UpwMwXVY
	uBOu09Q8LWQe7N2McOsDskc8LLDV5sxTKlscCBSqIANM+kDEEC7tUwf9oXNLPSy7d/PM6kgxP1xYk
	bHGbXjNEBtRm+uouDdL+3adQRPlZjDIjmUl9iu91Plwt70dax4bYP1KJu31DJLl1jv99KDMaYLo8x
	N8XvFgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGd5-0000000FI4X-0tzh;
	Fri, 11 Jul 2025 16:29:43 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFtW-0000000FAyV-1hOI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 15:42:39 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-742c7a52e97so2085103b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 08:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752248557; x=1752853357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NH82M7Wpg8q915gzukGl/UR0qvoygGIK5SM365nsKWY=;
        b=FVnEmXOHGPcjWnsL0hd0kxXuPZAABcM39AFJRcAOSU2lYanEBce08TfAkFo9BWMlpp
         4v1BVs4ZJ1KCASSoURhQIZOk54YCt6txtM0Wj7Vnnob6SICGjl8ARpryJexj7omSjSm7
         jjwelSF6v3v5AlvaKhFJPL03JYS9U1gONW4Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752248557; x=1752853357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NH82M7Wpg8q915gzukGl/UR0qvoygGIK5SM365nsKWY=;
        b=R07i06qQRnUG0JeZLSd738KLLA+Y4VxZfgFeQ1iXGQ4cs6fH7L+eaQwlmeDmeSuABc
         HASH2c+yuiVe2RUTjSC+D79/wi9B2z578iKaGSvGxvq4fc5BEdflp4/+u3bcPjzjAidD
         wh0Sx9fhhftgdPChPJOblikQH2FhnFBTP5hMZ3SMZ8cRNVbUzi3Lu35+cESqvgwWJRen
         ye3MndDOOA+elAimohWI3U6rzEz4ZfTjGnTlF/4jpnJNt1T5nk3Q6BvqMeR6MTjRX87b
         0NlRnuGfTSRYGX18IoR6mZwOcmtGcdnvcLCokpaUJdnp1PX1qxNWf3TnGze1CQ/EqjXS
         UHBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqsXFAfc8mlsXkRoKsSC5/9wGo4HY/ysnGPO1I8FCJJXdfJt1PqCPzeIfngAToYFtjpuVNoFxUwX68n+uWoHuD@lists.infradead.org
X-Gm-Message-State: AOJu0YzR5ks1R2z8UKtqTQ4VJylM5mhImsqUhjzM4bS8AnszdBuRASb4
	IMgeWtOjSIgpqaXgf1VEbsYTCZ2z5f2Lu5lYGCzsuyOEcSo9nWENMReHnKkGSWZT/w==
X-Gm-Gg: ASbGncvTcUe2vFEp2rdNUCPQyLuKXnF27biUXkpvU7ldmv+WBfYVaubb0l3OIp/u6vQ
	0OsOBFBsVxM3aySXzD9LRnMYXdpUVuP5vqOqET6uZkkwXMM3nOYQcPUm1WQfhfvkbOgvRKa1Ffd
	6KDc9BeZmfRO0UvzRIGLzbUhgoS31U5FoxciyN5d5mPEJWdSCRbSHaSbK643h191m0w/e8rYBq5
	sd7KIO4FHEWtNt+xlHYdIIf5kZX8P2nFWUUa1orzWIXbXksJy/JeVu1IIwSwpzMf8QU2Xc8cih9
	Fd9jEWgSTE4wLPtWWVZQtJy++u+NMcy90Y/6Mjjg/mjbqxzqY21bzdQ5ZTN8nfMQ8nEMn4JLmL3
	8Tf7i94KE+fBRNdW222cJVIgfm/Ji00wvt1cIs2U+Cu9lCEDgli/VXfvHXQ==
X-Google-Smtp-Source: AGHT+IGikmpmpoiahS6C039EIM4FWOINmFiK6nKg81tKKKY6N2Q8zXv85yrb97AEzFO3cAhGLIqJ9g==
X-Received: by 2002:a05:6a21:48b:b0:22f:8484:5ac2 with SMTP id adf61e73a8af0-23120df88c2mr6194764637.38.1752248557400;
        Fri, 11 Jul 2025 08:42:37 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5ccesm5762420b3a.27.2025.07.11.08.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 08:42:36 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	kamal.dasu@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kdasu@broadcom.com>
Subject: [PATCH 1/4] dt-bindings: brcmstb-hwspinlock: support for hwspinlock
Date: Fri, 11 Jul 2025 11:42:18 -0400
Message-Id: <20250711154221.928164-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711154221.928164-1-kamal.dasu@broadcom.com>
References: <20250711154221.928164-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_084238_442236_891DFD4F 
X-CRM114-Status: GOOD (  12.40  )
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

From: Kamal Dasu <kdasu@broadcom.com>

Adding brcmstb_hwspinlock bindings.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
new file mode 100644
index 000000000000..b49ead166b1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom settop Hardware Spinlock
+
+maintainers:
+  - Kamal Dasu <kamal.dasu@broadcom.com>
+
+properties:
+  "#hwlock-cells":
+    const: 1
+
+  compatible:
+    const: brcm,brcmstb-hwspinlock
+
+  reg:
+    maxItems: 1
+
+required:
+  - "#hwlock-cells"
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    hwspinlock@8404038 {
+        compatible = "brcm,brcmstb-hwspinlock";
+        #hwlock-cells = <1>;
+        reg = <0x8404038 0x40>;
+    };
+
-- 
2.34.1


