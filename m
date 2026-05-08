Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E09CD37A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8eLQlhXdKYRqwLg4DykUyxCfZQPw4q7VqcTUbCsSV0=; b=fRrOsFlnl6qgmvLldCfeaS5V4e
	6QuWvx1+uaLDvSb6Uiyeo9bmHWr73WoRX1CBDteRHgMZ8wq08lTCbCGfB2kfkVU8NRw2ZO9va2fI0
	Gr9QiBFAaKpgjCALuyWIZa+HSnk72Vsu7ANCrjQG8hvu+WzToLsMZONJ1c9tRkK4zOgU+LGqWIYuj
	f481E/Q59SrDmE7NsQT7cExz3LvglscHt5IglgWRLD/okAxCrchdxtBGi16Frven95cJWcuQ8S59Y
	8oZspq6ukiPub25vqi9ob5sfVRfLGaa0s/cD8jQ5Sm1OjxfHazSVV4d8qPfFB6/yArzmzipDqCutQ
	e11nTkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN68-00000006p8y-0jzJ;
	Fri, 08 May 2026 15:26:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN67-00000006p8S-1TwS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R8eLQlhXdKYRqwLg4DykUyxCfZQPw4q7VqcTUbCsSV0=; b=WYDG7qck/ZxJBVlFow2pq9P1L3
	lOZ+8EGNx+YmHDhiCWNiv8MMacU2haCBkTSVDMF0L1WGkyMqClecdEq9EBnRVY14FFJUwKSAup276
	5+vCV3tULZw0Y6Yt3luz2XMcnWba3UDkGvrihVyrDMUZm5lbFYA2O0oOxANtptIq493zCO4H0gQCO
	bmbGvk5hFHnxjIWtuesle5V9ugLjuZSVF6WinBDdND/RatoRh6gRfJdw5AQryCLrqGm/2vDiKixm8
	fhMBDLokPlMS5DF0NWp5xR2+H3IAOtdQA6HeyRVSr0U4f6WcCw84lFYLQC/6oI6gSH6CzhlT/Pzdh
	9vpOrUBw==;
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN64-00000006hDG-0diC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:26:38 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2ee990e8597so3709208eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778253994; x=1778858794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8eLQlhXdKYRqwLg4DykUyxCfZQPw4q7VqcTUbCsSV0=;
        b=tN0VrhnqleuKaVAYTXkKE2YV0yXGLUY2emHPPLni4sEW6d15UtsA+++YamHCPB4lSW
         57cXy+cOGCFdY1xiDaa3OUFzh2yH4gj/qz4SGAVy1ixMJZgq2aCJIQmtwSLigCCdkXnU
         JQF+wgEWXBs+MlUlvY/kuAL3XoWUwGX5KhNq2PDsf1jMLsKGraOCklSoS0GCGW9bfaJ2
         P9Vfw4vMTvxKc1w0nvpBMqENNjbRxOOL5w7/x7apIUqyazKCFWp7BkrSWUC+FuNAr3Po
         yq9QMX48EfKdoHb2WBi+WvMJFrzp+V8hg2d4CyXIyhtg+o0A5BFYocRsva4dhoawgLs2
         6iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778253994; x=1778858794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8eLQlhXdKYRqwLg4DykUyxCfZQPw4q7VqcTUbCsSV0=;
        b=oZCJ2lKE5yKC24TaoaPbR+fodub0ikw33p3pzUpZiLBjJVyxHrolhoRetuhKEvvrO5
         Mjbt0XZ5NNAyVB6GfRsBdSkF975q4PCXHrRIFUehocrmM9auHwKl5jv+MaZFNhIQ1sp4
         tbMbimQtT5d1q7ghOwTWYIHBRHL3kER7F6thNqfJ+ninHO/REdnGSwhzmUrck93Doz3T
         lZdC4a/Nc6Qv6Rn8fn3Hh0re6OHW7dHbj2tHaGrfbSFWuv5rzI5EC2Wuwq/YjqxRsaIp
         5iwWpNi/LflXBKEFLJtvdX50tQjXS94mhHXFYxMt03yQvZQ6jr1C1q67X9o0RZXr23Hj
         8SoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LV4rEZKbirqDfpVoxInd09O0MwxUImqhBghvXvMd6Rf73b7TuS3JZsD9rq3fhICLrJP3UI/6u4OSgs+yNoWCa@lists.infradead.org
X-Gm-Message-State: AOJu0YzQcIde3IqPlT7+t688EeaQaY+LBjSsDCGafkRPB34+V1MvPXUU
	Hxyf33rShMxfyH/qP7cOWqoulEK9Zoak9QL+iBDw6s/OhhUTR7d1BOEls3GpD8lJ
X-Gm-Gg: Acq92OFBEQQD7RPqovK68oB3oZ4ZznIIKgRgllVzR4CIF0rhPsCvuI36pQYv/SQI14M
	uCrrocT3+0swisLziKckw0npeLXWdp4Dn0b868I19qu6/rtfhYOSLd9agIGoJrQifuu8NV7KJK8
	kghnhGuaFQn1sffC2OtzwD5T81DBpb4tunQg9f2Jg9j8i6loKLcFq+BFdP8V33myzrDGukFRqLF
	LxILrn0ssN4v0+EWPLE/u9vEkCsUlEcrSX9+UFMh61qc3e7L6gCUZU7/MJTz31YvA3TOi+oGs4q
	9cjXuZSOOICOGY2zr/va+EwAHxJ0CPPh0FoMzf8EGldE3UGPCdGUeFJCGcBf5kK7Y5aFNuHDQNb
	rljE5nGBjr1gKUvp8iDd43EOg1MljcriO/quPUJfzuyINkXNKTkeEdHuNb5o00qkSKYYEPlfjaY
	ddFAocVEwhA/d/SqViYwzug9feoh+4LdWVvJCGFDCCKf3Yylo=
X-Received: by 2002:a05:7301:1014:b0:2f9:5c29:ffb6 with SMTP id 5a478bee46e88-2f95c2a01a1mr155628eec.13.1778253994365;
        Fri, 08 May 2026 08:26:34 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:26:34 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Romain Perier <romain.perier@gmail.com>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Peter Rosin <peda@axentia.se>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Paul Barker <paul.barker@sancloud.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant startup pulse
Date: Fri,  8 May 2026 23:24:19 +0800
Message-ID: <20260508152435.21389-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_162636_608084_2ED69750 
X-CRM114-Status: GOOD (  12.41  )
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

1. Per IS31FL319x datasheet [1], the hardware shutdown pin (SDB) is
active-low.

Fix incorrect initial GPIO level to properly release the chip from shutdown
state.

2. According to datasheet [1] definition:
  Shutdown mode can either be used as a means of
  reducing power consumption or generating a flashing
  display (repeatedly entering and leaving shutdown
  mode). During shutdown mode all registers retain their
  data.
shutdown mode does NOT perform chip reset.A dedicated software reset is
already implemented in driver by writing 0 to reset chip.

Remove redundant unnecessary toggling of the shutdown GPIO.

[1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

Fixes: dddb4e38c6ba ("leds: is31fl319x: Add shutdown pin and generate a 5ms low pulse when startup")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl319x.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index e411cee06dab..c947f844c756 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -396,7 +396,7 @@ static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 	int count;
 	int ret;
 
-	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(is31->shutdown_gpio))
 		return dev_err_probe(dev, PTR_ERR(is31->shutdown_gpio),
 				     "Failed to get shutdown gpio\n");
@@ -506,12 +506,6 @@ static int is31fl319x_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	if (is31->shutdown_gpio) {
-		gpiod_direction_output(is31->shutdown_gpio, 0);
-		mdelay(5);
-		gpiod_direction_output(is31->shutdown_gpio, 1);
-	}
-
 	is31->client = client;
 	is31->regmap = devm_regmap_init_i2c(client, is31->cdef->is31fl319x_regmap_config);
 	if (IS_ERR(is31->regmap))
-- 
2.54.0


