Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF1FCD5BAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKUS30hEKkJqsuTkVMrr7mwScb2qlJAj6ESCesmLApg=; b=fKGYPYyuvDAPxBgxNHCjvcTJ5E
	45X5PH1L50rjx48pk/riNJdhxFiYB/W8HaaYonf/WNd+qvsM0kZSaKotmMpSSdRjdTgedB4fx+1xT
	3WU5and/9FLvxoJS7bOaEhKCs04qZ+f2C6YhseREbcJz3Qz2BI9jHvrKkB7lmmqs7Ujr6gNCNaN3c
	Os9DK8/FvEsbbIg2ylxqGvDTPSUJeTeYmtK18ajmfDumAFQfuUA6oeGXAWJW3BtfVdcFViZLKVsoM
	RR0Bi+dYGFjNocPuM/fVqhPu6X6qplqZMQFG7ddQMSHxXV0k9/6ovH3w9AAmFpaB8a0Gq36xZxAQ6
	nr4KIshw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPT04-00000002y7e-2vWK;
	Tue, 19 May 2026 22:33:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzx-00000002xyt-3G0w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:33:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488d2079582so40326095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 15:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229992; x=1779834792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKUS30hEKkJqsuTkVMrr7mwScb2qlJAj6ESCesmLApg=;
        b=CiDtKv3OsgmcncGjVyQRrmi3BUQleez8GFEkS/jcmFVloUAvX54tnDHMQLegEqXY5W
         neNjuO4V/0+ROo8rFF5QIfvezeJ0m/qQnBeylzwBzQT+6UgUcdaaRrEbdDkEZ4UcS2tW
         5NP2cyZsjfo6Yl4oohVqzIxnhvb5zUgFAqdALbvS8VV9NWEgMiISf6WWEIyqZ95AhsVo
         +a+dsQbp+CuB4UrGctVK946HUgZsW6eeOXkOD4wwihWhkq2/mKhDL3+4P6XV4bBCM+Vx
         0B/ro0vYE9qOwP+KLRtqaxpAZ5fuP1CyZro2e5ZSpkaFeBx+PHkqid1tq5Fvw6R1+kJb
         s3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229992; x=1779834792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKUS30hEKkJqsuTkVMrr7mwScb2qlJAj6ESCesmLApg=;
        b=b+rCCjWjqZaENXsOw7EFHoYThql1EXS3vmiMtNoEIUSRORKciAHKGcoUBIqvScBcVf
         wTKK18hGHPY9nsX7ID3uKXpEvb4/VKoBUmyJunuK1J8j/IpNUO2pQ4nE+h9xlVd7rwyP
         iFYZ6UpdURQYT88Dhsy7Ohh67hY2b7pRE8tePuJVCRK/e/QF4L07gvozdVCWSiOUjwtU
         4UoLTr6+QMIEpXEpTGb/7dkq++Spf5gA9aemPENORMkC97K5oxIvcY3ll+UrpGq85mCN
         QWimnG9cE292xJTXWmsY3XUNKHD9KztsrA8WllQaAUEZL+9sRsDhkpuWj+tAQ+XrX2wX
         0fKA==
X-Forwarded-Encrypted: i=1; AFNElJ9Zqie7D8iLv+jX2JOCQ6vzmwSlHHi6ALm7I/+PGh74YOUBroaG6Tfg8cpdA9UFCIOXImPt6nbdj4OsJVk8rUhv@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnl0zz5Py8yeu1gN80KgKij18cwc2XFVyouSo37FJeYr3gVlZM
	2yjo4+1YQxahMGap6Ar8zK0viqObMjlchD3QpZi/Wm8HH5ajJmiIyRsY
X-Gm-Gg: Acq92OFAmgBgFczZ/VER0mZympoIHG1bBNMp2IRffEiRwNjqML3GD0l0xT8PbKXCNFJ
	NirhiS5TUpRQz1DNmlM4HTzXKf7HnchVDJlFp243OAzGztOg+d+jgsGPe+VFLi1KfXX6Uo9YI4H
	EfGotC9CP4YZYDiOH+j2pfiZAH6CFCgNRS0TjI2KoeEv6n+B+vQO7kkxKT+I2o9VQ4Xd2lkQD+1
	8rt0+tr25L3uD54w49eo+lrjryMXMyvoEdg4ktARRTBRNqPJ2iAeEZIb91d0wlDrEsLU7fVcZPU
	gzIZEmfXOnYOSUPJ5AAOS2Qayiq4EkxrXTZMUAEUEcJMm9+bR877a1ecDVQeM6dh5Vi57s5CsfN
	aoqyVJnqerLMzNybZC9edst9UnRsdkbaIx2keOgYMNqKEWt4LJQfGKn8DAF+VmfChAW8rHEKWcC
	w5b8PWrLxeefpeco9vBqZuw7mPXhh9b6h6TO/jXqGCCgZ9orWQhHtg9xiNvIY1FH2TN3gAhzQd1
	SBvRhlBtw==
X-Received: by 2002:a05:600c:2d86:b0:48f:d5b2:7c42 with SMTP id 5b1f17b1804b1-48fe63259camr228600395e9.17.1779229991759;
        Tue, 19 May 2026 15:33:11 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:11 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 3/5] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Wed, 20 May 2026 00:32:45 +0200
Message-ID: <20260519223253.1093-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153313_868956_31D3539F 
X-CRM114-Status: GOOD (  11.40  )
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

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having a dedicated reset line to reset it.

Add a dedicated compatible for the Airoha AN7581 SoC and reject the
unsupported property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..8223fbc74f14 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
@@ -38,6 +40,16 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: airoha,an7581-i2c
+then:
+  properties:
+    resets: false
+    reset-names: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0


