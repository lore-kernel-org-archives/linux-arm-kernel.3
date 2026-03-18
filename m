Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2819B107760E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 19:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo0ZToIHOtReIqQmFtNomh9r/Dahbu+dh8b0PXJD3YI=; b=3PCfxl4ot4djSROanf0qPuGYKb
	HcmQfcBvilaLppkTGxQfRl4FtTPm2m40IMXX03o3tCyktUUaXlIix/kph2lRdjgduQEx3DETz5/lc
	IK9P8B82WtxZckTHeM2v27bhkYfj+BM9ZDM3q+572HFN0FF+LxWO6uyXP0jS+HY80dj/Ew+76iWpa
	j2uS6HfjOagcsrU3M3hiQ7IwcCEXYB3KXr6hieWDUzIAtKS9PppeWPSK7y0HMGIpn/jrto4XQYgQh
	UO3VoosBPF49Qq8DN7HyUf1CC6lvcDdpsm9F3f1mHxnMgmHLpGE3+5Vwv32HHAgfaTrhtiVTG2Zdv
	4abnkfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2whG-00000009F8A-0Zrx;
	Wed, 18 Mar 2026 19:36:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2whF-00000009F7t-0CzM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 19:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Jo0ZToIHOtReIqQmFtNomh9r/Dahbu+dh8b0PXJD3YI=; b=LbZFNwTGTyVTLrJ2XRr4cbBUcS
	nHjvqvISlnJ5xr47ZucQ4w0yxOiy7XAG1Dl7XMsl1kBGtebDmLClQtRkAfz5DiJWGqlfjzsvIOyPm
	hSNbON1O3vM3hLwqduxyBdeCEYHhdZwCfJW7HmjsGc08RG5gE7KAcOQK1ESEUseEV1UMVVHREiEue
	vXTqH3N0XCsPV6/cZJwLgIi3eQUGjvH97FchawPI/uSUs/bOmPM6bs3VfzaXMoB37k3MfZ3mN1OZc
	ZGg7KskiNvx5oiwQFI+/fpQRPz6O/+/UeYEJJ984OW9Ty1bgwkXw+a8d4ghsgUghp6pM5UoZ19+fk
	PIMP2cEw==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2whB-0000000C98q-3aow
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 19:36:47 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35a1230c60eso191281a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862603; x=1774467403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo0ZToIHOtReIqQmFtNomh9r/Dahbu+dh8b0PXJD3YI=;
        b=l11/j5qQZxobl9TXnEBM6frr0wEfs8RVRlg1MRXNzNbg6CVJI7Q1vHU1uKPu8VSviw
         E7v3jfdijrmxblvqpFNuHRypm3yYHVkJHLrk1nkZqdlYL7kFwGxejgAe93kEaBm9sz0i
         8HahRedEuHB8f3L9dQaK7qtY47a14L+YAB2T22QHNKL8UMHjSS/RYpQ9t5HJAq2hFEfk
         hxWA0RF5PZhF9ADBvB3q4tKgJpDwdI5CB+AsaTcGRc90wChfeo55yqg1AqhOfbazbfNh
         DoTBYPtJBP2s9hYnaRFltMwwW1Raejd+PdLCJxXxsYmsi+O85oWImRHmhY/M7mGGPCNX
         xndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862603; x=1774467403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jo0ZToIHOtReIqQmFtNomh9r/Dahbu+dh8b0PXJD3YI=;
        b=I4s3Z75/aWzdLY5PIjEkq40oNM2VkqNKvWoQ5j70ALGWJLUirfMBNE7C9sg3pzLvxa
         rYHW/eaec72LYpgPd2CCBamh7fpTZjyZDo4Z0S7G1bnNlfYB8NDYfXaWzHKV+CF62WIp
         VxPkKAODADSmb6xGJSEvxEw7adG454LcgGOQfKymvhDH0TbCo2CHBWWlCccz2yumTQUU
         aaTIvV4g7kGuc6yG6QGWDYjG14ZEVq5zJToObjHv8wZcuHMHOAj1SN/qFNtplZ23hPci
         0tJznuy16wjLjaUMeEseb5O5Z8v5sPuWldqwH5SaW270HmgCIBendaoc/jpsDKD1Ogpd
         R1FA==
X-Forwarded-Encrypted: i=1; AJvYcCWBArp90SgelGEi6VH/kTqhXas2SNXFrb1zWAYaCXfVk8xbFD8aGcqu41pIGRK900XgY7iCbc0xECul8jBq4D0m@lists.infradead.org
X-Gm-Message-State: AOJu0Ywya3lJusgloFFe8MTBr7ihl4v6FOsCwtDy/XuzNSOGLry+s3Ct
	mwg+vqH4fdRblzCikKJ3AHKXdmd0ZBrlgwRz83J0G9v5yqBwRoLevi1w
X-Gm-Gg: ATEYQzxND4LPG1pHkT24TsmDZkXD1q7UCjD5xuRde/lN3J9Plhu92JKQbpwHaBK3y6A
	/ljZWfvD+W9HRiUx7bTtB2ztpLgToXeZWG16RK8vS9ZP1B4bePM6hlOm2KqVmj98QavbGEKtKNk
	6XuxPPFyeZchlgHyaxDGQFm5z8T6CUG+9k8lxycjdMm7V5PG92rjh2R97Z1pIT/Xlh5CCz4/68x
	0KvL9we63A8D+iYQB20P8oSg+m4aOc0aC5POTFSIsYzLTrVB3xGjrXMgBLUurmmjne7mRrtSwxc
	o+sUD6F6xoCyA30vN/WR5O0FlJe+2v8Md96mBh4keOff97fADWTsSZnZkAUvK+z5NwGBv4gETM2
	q1uzU6F75wcT11Qgztttir/pVI7KPyabFEGoul4JQJgZpjnzWklJCnE+JmmpMI+A9dtyFXyJTxF
	o3P8qkpD7+jk6woOxX+Tn6EnnlkoVP8lJhgLdrymJv+NGREfwy7ts0T4KdcyVESTKRFJyWzxhDY
	8JIt4Mfy0USXpZm4BbQ9HpzGl8DDqBQssfuMIA=
X-Received: by 2002:a17:90b:288c:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-35bb9f11b2cmr3546557a91.23.1773862603302;
        Wed, 18 Mar 2026 12:36:43 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9ff59a4sm1521664a91.2.2026.03.18.12.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:36:42 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/3] dt-bindings: nvmem: add nuvoton,npcm750-otp
Date: Wed, 18 Mar 2026 19:35:36 +0000
Message-ID: <20260318193538.246853-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260318193538.246853-1-visitorckw@gmail.com>
References: <20260318193538.246853-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_193645_961468_25BA9257 
X-CRM114-Status: GOOD (  13.14  )
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

Add device tree bindings for the OTP memory controllers found on
Nuvoton NPCM7xx SoCs.

The NPCM7xx SoCs contain two independent OTP memory arrays:
- Key Storage (OTP1): used for cryptographic keys.
- Fuse Array (OTP2): used for hardware strapping, calibration data,
  and derivative definitions.

Each controller provides up to 1024 bytes of read-only storage.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../bindings/nvmem/nuvoton,npcm750-otp.yaml   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml b/Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
new file mode 100644
index 000000000000..45bcf72d7c78
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/nuvoton,npcm750-otp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM7xx OTP (One-Time Programmable) Memory
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-key-storage
+      - nuvoton,npcm750-fuse-array
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    otp@f0189000 {
+        compatible = "nuvoton,npcm750-key-storage";
+        reg = <0xf0189000 0x1000>;
+    };
-- 
2.53.0.851.ga537e3e6e9-goog


