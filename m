Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE3FE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 22:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4/Hq9oG1hCHZN6bpooRR8vHRpWTBHDd5vOt3uAQ3gY=; b=HhavGL66BkNm0cfwpSouCyeSEM
	eHis4HltG7ECOK62e/y2FDbBMoTY66jAfGhf9RxXerP2AuEX2DKNh6aBPGMN8I3Waxoj4Q+PbTTgJ
	m3RSx6BWUCNrhQuQhluQB4gP1/mBhcW29IOCzThFJYButx4uOmkCh4NcRyAVCHQqfEL2HAe73qJQD
	wze3X0x73jLSyKMLQt7zpRNxto2vf/xpNS8TanlqdBce0+0YRw7WvWS9Ay0egIH1sK7GegIXZTio2
	Ff9VS3h6f018JouuI2DbGK6dPEbTuzlv5aN9hLurF9FeVBpAybPvmJM1Z58tKhfSNBJaTKnaMEv1I
	fwbh3itw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaI0-000000071gf-3BA4;
	Sat, 14 Dec 2024 22:07:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaFq-000000071MB-1Xb4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 22:04:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-432d86a3085so18793975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 14:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734213893; x=1734818693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4/Hq9oG1hCHZN6bpooRR8vHRpWTBHDd5vOt3uAQ3gY=;
        b=JSzqZ0Rn+gXXuwCmKBc2Ozubaca7LtqnbpUFgfHxzG2MnwxZjI/ZmySMMsGkI3adlh
         eK248Dm5DvOw+tA2n00W+oriMXip0MOtESs2q+KIoOUVDT2qvJMr9OHZQ+oc0BR7KF5z
         HdWJ91Csse0W39dukGKxKwIH6aoBwM2Uc4BcxPIZgP9DYcfiKXODfsMUV3JZHU4pF+Dl
         LV/bFrA76J3MqorFxr4YQAcaNsk2U9jE55z6mQEuFf4zlXFSGs/4DUObS69rsuOIJN0b
         nwML/nf/Xqu69ON5M1Aane28s0UUKEAz2tSVNxU706LbaGhAUJ9w6kQHTN5bL7zlaOSI
         X2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734213893; x=1734818693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4/Hq9oG1hCHZN6bpooRR8vHRpWTBHDd5vOt3uAQ3gY=;
        b=g/PG/UgQcYZueG1nprEOV/wDowEsTavoNQQ0mZ1uLBWynIgZEVk0F590Kun7tkYTOU
         vsI+Etw0E4cQmN/Jpo4WYcLJw6QCVMWXYfEYTci1Jq+Z4IV2RGncIinFQbASVOib5mfT
         B43PxvlVtwaXvkOuCJHZXsVjFDahvGoYt2WUBTKsnKM8/oGgMsJkCorkUEGo1m79s4C7
         tO5aNJ9mQo/RucgOPQwuHMIcK4QR3ZT3xynHQCfhhFcgM5hux+CaZyyjAGZjjmf0lyi4
         8bUGKLKPFyWilnPSmEdKsMyhuAYNM++LcNczX/YKhq8JNXdUW7qQy8reW7pb/j//+P8B
         zU3g==
X-Forwarded-Encrypted: i=1; AJvYcCUik3RDoawxrE7SFpFEDU7P4xyITg1Vz8kxlMN48jEeYGAfJfu3cz5WNsWWGo/zJ6FcskrzWQ5PUlKlufI17K1z@lists.infradead.org
X-Gm-Message-State: AOJu0YyBZ6/JyWIZWgrwdc3DPgYPskoN/Izuts+bjzRJdgbfQce0b2VQ
	+89NQWGTPlxvHMdVfHD02/aUvCeKKnbkSACYsCF4kkmI3nCynt81gw0lbxPs
X-Gm-Gg: ASbGncvm/YstGxlVK8gR6c9AMpZuWuPx13X9+s28puhZwGVt2qKCs2NdsuoGcGZAUM1
	j4I8f24xvfk/ajXStP4gSpvLVOi4JCBqwiEQE9Pbo2LdwHRiCSNwPW+nkWj+980TjltpTNsczKg
	ioNqZt84l5qAHK25vKwu4YAbsLnqXY4N0FYXi5nhTB+xSnLH2Z8hj2NSvk7r83AUAe4vl/YMOFN
	5uF/8/gEXP3qJyR0+nu/u6zhkkNTbrxrGV/ZVlbQoL08WVw9ySSrT1FMTCXbaSsAxGrBrc1y771
	zBenWVivWAyJxvQHgRB9zA8MBDLd4dqV
X-Google-Smtp-Source: AGHT+IEZgL7+/oHEX5vhRmaBN/fBPq0CETkKB+H+95woCtbcul7ecn0vP85Z/48Wz2GhSZiyO6kbtQ==
X-Received: by 2002:a05:600c:3151:b0:434:fe4b:be18 with SMTP id 5b1f17b1804b1-4362aa3ffcdmr68162205e9.18.1734213892367;
        Sat, 14 Dec 2024 14:04:52 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361ec75410sm104456185e9.1.2024.12.14.14.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 14:04:51 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
Date: Sun, 15 Dec 2024 00:04:18 +0200
Message-ID: <20241214220419.723100-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_140454_402003_04D2A1CA 
X-CRM114-Status: UNSURE (   9.34  )
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

Add samsung,exynos8895-hsi2c dedicated compatible for representing
I2C of Exynos8895 SoC. Since there are I2C buses that aren't implemented
as a part of USIv1 blocks, they only require a single clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index cc8bba553..b029be88e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -25,6 +25,7 @@ properties:
           - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
           - samsung,exynos5260-hsi2c    # Exynos5260
           - samsung,exynos7-hsi2c       # Exynos7
+          - samsung,exynos8895-hsi2c
           - samsung,exynosautov9-hsi2c
       - items:
           - enum:
@@ -94,9 +95,28 @@ allOf:
         - clock-names
 
     else:
-      properties:
-        clocks:
-          maxItems: 1
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - samsung,exynos8895-hsi2c
+
+      then:
+        properties:
+          clocks:
+            maxItems: 2
+
+          clock-names:
+            maxItems: 2
+
+        required:
+          - clock-names
+
+      else:
+        properties:
+          clocks:
+            maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.43.0


