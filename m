Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915E5C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkErzt1Ss+Bkd54SXbmEFKlCZnBrxlDz3Xe8Bme42SE=; b=J5viKEH9f7pky4QrljjgPzVuqs
	XFNoNdkKI2a3JIHpjc5OxKyNXixLeHTXpYD4/ZeYyjLbGD4rPHE65GpChdHjTpjrT4ddPBObDIKa5
	8W82opOIrTbXGwstSlUutVp7jDd4eOcV5euHrdTqQsf+Ks8r7S4QpPSQnlCTEFZrfFQLgdaUbCfq/
	kxNFoIZ48TAY3HVO2IXJRMhbXgwJgUBGBap/ibcHtm7gq8naukt34yDQbq7TyECpiKvCk/8fUICbd
	cUgNWRHhNIsDok5v6djwqm5VE9qC4ZL8f6wawsz19krXShRB2i14D9qYVO0PWbZol4E+YhQ9/tAiW
	vnJEifDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUwx-00000001vaS-2mbR;
	Sun, 23 Mar 2025 23:41:51 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyc-00000001p5p-0LCk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:31 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso838504666b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769569; x=1743374369; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkErzt1Ss+Bkd54SXbmEFKlCZnBrxlDz3Xe8Bme42SE=;
        b=DpybbQ9FbxjeK4iX403lc0d8bltLiny1aRe+QII+2hhlImgUmq9SJFxx2P098ZpPWQ
         v3DxgR84YerCjh2nMGruV2lat6c1uai/1Mz/sLxuNcWCkdwSQ0LHIiq4QLGg9oumaDpp
         k3E/xRuPynKJpJ9cNs0GpJ8eTfViQzeUBDeC9339LcGCcqTesEnqIPh5IU/xEG5OA0+Y
         PYPSbaq3v+wvOFsAnH1+nVyIdiWUXVWIRSkYMelCXKnP6zzjmxhShnZKNuJhPganYLrs
         F4zqSkR+sSEmt2sgynpkm5hmx1U+0N4hK9G5iVteMfm+SBxRYAEalx1f5Tjowk8fAIGP
         9Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769569; x=1743374369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkErzt1Ss+Bkd54SXbmEFKlCZnBrxlDz3Xe8Bme42SE=;
        b=MB5nAUIsPdceaB/tcRiBAc01d04Ip7tNqWcYgZwAh2cNpnKo8qF8YGL9MWc0wgnLru
         QleDY74J7FsHQqCtmMSnWPCPgqsbzLxsYysD1fJ/I8GnErLyqf3tqoG9AZMVmDzC9V9D
         /R3Jn9KhxhVBcmbWvEIR2OOFRAE7TJbmlHVvXNWTw7OlEPAtW0xFbInqiYNj9fzwVOKc
         kzMwsP7kMcREmZQdGToI4TubtXcPjLGaCRoYLbCh3/djLKHWPBf6F8HzjmigeEJrFS/f
         mtQJbW2Vd7zWq97EVIfbxW/9PLr9Leg0tCNZwIlwtiykl2HjPf3e8V7oK+1+3pg2EJn+
         e0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWLjtwfWfBGJ1f5jHzANlvj/B8huOGYYXpgLNH1ag+mM2geExZ3GrtMgqX+1fvCtx+prkkQ7cbJdVCjYiIU9Hp8@lists.infradead.org
X-Gm-Message-State: AOJu0YwDcz/V9rZRJ3vuTV/i3UinOjpgWhMFyNBOKqGg+c18FHu2XD9s
	lOR6fiX+bUVLaFpZcky6F4I+cvQ+Ve3GMvBoQwFi1/SFf89VG1HeKA9RTgEzkzg=
X-Gm-Gg: ASbGncvQ2iIgzOoZITQw6iLu3s/MmzTXG61w+9Vtj9XKxyamoLR6RWDkSjdVgQymzKx
	hT3fBSoDLmnHAkj4l/O9liaQ9Io6+m2Gxa/n0te1i/HdrYnuoSMPVuxjC300j9z8a8vd2nl8QmE
	/DPryCdSAKf7fNFvWkKK40hIj2Csp93r79TpkwBjpt2BpACLutUXlkDS97GoyX30pLHqZ6l9NdB
	JjyCz9dmCz1leECIrnFVl/v6JJxROfDIsGz3BGCZxUyQCHYyLgirgOyLZoWP9VmvK9LG3ztm5VH
	eyuaDMp9pn0K+YcuDdntTnyQtGJ6OH0sKHzilxDEmm0zBrRwljzuuPNwf8zJN5gqLe/2FyjCyQo
	57Lh6vG976k5eNkhUHZXsX5rSCCAf
X-Google-Smtp-Source: AGHT+IGAFdzsUecxR0Ot+aNtVjqQT9dbvewdjFSLK22DE4stZjNqeNVzWwfh7T1/N7CaL7vQgLskZA==
X-Received: by 2002:a17:907:ba0c:b0:ac2:4db0:1d22 with SMTP id a640c23a62f3a-ac3f251f16emr1170254266b.42.1742769568705;
        Sun, 23 Mar 2025 15:39:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:25 +0000
Subject: [PATCH 09/34] mfd: sec: slightly rework runtime platform data
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-9-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153930_126586_F1096D74 
X-CRM114-Status: GOOD (  18.17  )
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

As a preparation for adding support for Samsung's S2MPG10, which is
connected via SPEEDY / ACPM rather than I2C, we're going to split out
(move) all I2C-specific driver code into its own kernel module, and
create a (common) core transport-agnostic kernel module.

Transport drivers will have to do device tree parsing, and the core
driver will allocate its own additional memory as needed.

In preparation for that change, separate out runtime platform data
allocation from device tree parsing.

Having this change will create less churn in the upcoming split of the
transport-specific parts.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index b931f66f366571d93ce59c301265fe1c9550b37d..9c514f4b5f853ec2b4e234c578935ffad145cd4b 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -262,27 +262,16 @@ static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
  * Only the common platform data elements for s5m8767 are parsed here from the
  * device tree. Other sub-modules of s5m8767 such as pmic, rtc , charger and
  * others have to parse their own platform data elements from device tree.
- *
- * The s5m8767 platform data structure is instantiated here and the drivers for
- * the sub-modules need not instantiate another instance while parsing their
- * platform data.
  */
-static struct sec_platform_data *
-sec_pmic_i2c_parse_dt_pdata(struct device *dev)
+static void sec_pmic_i2c_parse_dt_pdata(struct device *dev,
+					struct sec_platform_data *pd)
 {
-	struct sec_platform_data *pd;
-
-	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
-	if (!pd)
-		return ERR_PTR(-ENOMEM);
-
 	pd->manual_poweroff =
 		of_property_read_bool(dev->of_node,
 				      "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi =
 		of_property_read_bool(dev->of_node,
 				      "samsung,s2mps11-wrstbi-ground");
-	return pd;
 }
 
 static int sec_pmic_probe(struct i2c_client *i2c)
@@ -303,11 +292,16 @@ static int sec_pmic_probe(struct i2c_client *i2c)
 	sec_pmic->i2c = i2c;
 	sec_pmic->irq = i2c->irq;
 
-	pdata = sec_pmic_i2c_parse_dt_pdata(sec_pmic->dev);
-	if (IS_ERR(pdata)) {
-		ret = PTR_ERR(pdata);
-		return ret;
-	}
+	/*
+	 * The s5m8767 platform data structure is instantiated here and the
+	 * drivers for the sub-modules need not instantiate another instance
+	 * while parsing their platform data.
+	 */
+	pdata = devm_kzalloc(sec_pmic->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	sec_pmic_i2c_parse_dt_pdata(sec_pmic->dev, pdata);
 
 	sec_pmic->device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
 	sec_pmic->pdata = pdata;

-- 
2.49.0.395.g12beb8f557-goog


