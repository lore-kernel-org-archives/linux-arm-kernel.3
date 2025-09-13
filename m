Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721DDCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 06:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m9qLE3qXnOG94GvXjkAQataKE5t2lJhXnQe1G4RxJtU=; b=gbjzIUGK4WgtnwxRpZoKohv4nf
	+5IU4oyj2/2GJL9ySZ/tNp6iszlU1mXC1Uw0r6W/LgporCdR/7Oxw4AelhFPpcydBjVDlUlv5mIef
	RWqHa9z++0mWI52JNiNoMXe/xlzIibeIlHieGxBguloIW/9JehY9jYXwc6uwLVvAFywAP44Xj+ANm
	j3tpsIXKJOX9ujQPs5T3oSDNbtiZorneD0uhTPMy664HD37wtVbSIM38PVHTijeZj+Z0Ku6BwWUdm
	zpLDlYKL5Zzv/8cIEnZ44BiJp13TyiuCgjGW9MnjwLy3XDvOE83eL3rvtyYhgoatJi0O56nHj7rCr
	9N5sqoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJiA-0000000DWmB-0T0p;
	Sat, 13 Sep 2025 06:26:14 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJi7-0000000DWkt-1wz5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 06:26:12 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so3094064e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 23:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757744769; x=1758349569; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9qLE3qXnOG94GvXjkAQataKE5t2lJhXnQe1G4RxJtU=;
        b=B2O4QVnZ9vsS+DF26A6b74Mq4OoPw2GJsgjlfCNsOZhAXTocPT4yYOC+wza6E6cKP9
         wZvZLCP7xQ7dx3CyQQ0MuX2BWeswxQ5BvgujLY2S0sj4gC9Pu5cZm7AYO2KEdWCehXB+
         MZqn9u1fskf7gfj2aQRiuYjijs6hcrwAxqdRsEYFsYHBRRLG5XGwA83ZQo5uLQ089lO/
         qqD3i/k2VuTJUQ8q/Ucmnrqb/qohmErPg2FM32V4NzDpaV3RSWc2HdzTfiMeEzPpBhaE
         BkctZ+4NFMad7bdIY5fvEem/sphDCtMOhxo2L0mOgmH0mItqDGKCyzDPIPwLKpzR+aqN
         lChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757744769; x=1758349569;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9qLE3qXnOG94GvXjkAQataKE5t2lJhXnQe1G4RxJtU=;
        b=qqf9WI6ZpbnSqTIC+zpIfQgsJ067biNT/GifLxyZwpT3+OVy7U1Pa6L1YQaBr2JSVZ
         aFOjTE0a1Xh9A4MtjviAlKjbaHHWbq0QUz3sNFMhtQLe63g9iEYAo63aCVFO78s4qRV6
         hCczqA5EFvWdzXBkueXoQczKs5inlBeovIrDAYflyE9wlqx11TkJzj1153f7wLN68P0N
         w426O4jnN1wr5JblG7XXROGtCU0MNrDFOc+TaDote0Q17V0sgL1SwGifu+01GQGJLqYy
         TJfKqoggoU3szUGD6Ts59mgqIskJybhqTEuTNeTfjq1qk0wS5JKhXwJOt/8b6c4JSdI8
         6hPA==
X-Gm-Message-State: AOJu0Yyz40/z2Y/TJIjPjhED+9lWYeIU2BRv6sSP9PsF00YDIiI7QKkb
	pGEekxoIfJkvGhc3hve/8thR6moIzkECXNS3i2gsWcS41BR9A2HOgIkR
X-Gm-Gg: ASbGncvCajyb9RQ1XV9pFalJudJnNpYhLUToESbs2Cfu6DT4wcTefb+o+Yg6RQAOaiK
	do5Y5JkMsK3lI4AWScAFusmfMjRKzwQv+w0FxfwsyjUZ1qakcM71nHjiWEafjBbcO0+rKwiMieu
	lUUDZQ+PejoD2svbrh3kk4OshZdHvu6qGU5eQPDxKrGD09fnILvvIWov8plz5xxIeLJRkxt69cU
	6zbIxMIZlmWvipxzBkVXNMIktiU+gKQLEgwCWoNEClGcWEvXHRGLuJ40aidvUWcw1epFwxOERAS
	RTjAoji5ddUtYTRw8MDWLsZk9deb4yvSQpS/9eFe8+YUSjePZ/XhkFukVs9JErq6GzC7wDQfmBZ
	BYvMglQm9w3lNal/oA+KbYPbRuLJvYzG0s//2IpPjmHEY6L5rUMCNaqgsd8Q8q7R4P37FXMo2+e
	FojZwxs215mCbv
X-Google-Smtp-Source: AGHT+IGXM12xzNIqaGKxCqfh8qmw0eeDtRkYW2hR/ijX7NGKH1pUtKyn6LBcL/b8EiiJAqLbSVqMAA==
X-Received: by 2002:a05:6512:798:b0:55f:51b3:9410 with SMTP id 2adb3069b0e04-5704f5b1386mr1148904e87.49.1757744768758;
        Fri, 12 Sep 2025 23:26:08 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63cd7sm1744097e87.90.2025.09.12.23.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 23:26:08 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 13 Sep 2025 08:25:59 +0200
Subject: [PATCH] i2c: davinci: use I2C_MAX_STANDARD_MODE_FREQ when no
 clock-frequency is set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-davinci-i2c-v1-1-d18849aeaaba@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHYOxWgC/x3MQQqAIBBA0avIrBPUqLCrRAuZmWo2FgoSiHdPW
 r7F/xUyJ+EMq6qQuEiWO3bYQQFeIZ6shbrBGTcZb0dNoUhE0eJQEyGGOeCC1kMvnsSHvP9t21v
 7APx/YPhdAAAA
X-Change-ID: 20250913-davinci-i2c-ddcca6ac7c19
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=eSwL1MT+q6WDO2KrNb5iM6MU935ElZHmEA8e3Mn7/nE=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBoxQ55acVadW/3JXh++wdkm/MMo+xEeExE4KLXa
 1ln8cAoNKmJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaMUOeQAKCRCIgE5vWV1S
 Mu3AD/4j6iYh68lIRfTr4SdGIuhIMu4tCtdY/vcHUsBEqxwlDXDPZZ7kZlm3bjzMr8t5rU0viwi
 KAz/5t/s2uCkouGjs8/F6T8OYMi2j3hlNV9PmTny4YimZOeukv6LZk1clR+JKW2/HL51IJ0qpz9
 NOYKFw/np7GMR+sxmPwZb6igEjg9CJujOv3cs9eWuGU0pZswSlQl8FnI8Hhwu2j7U71IVZC2CUp
 kyMBGC+2qTSUhPQuT0JSC3edAzwipCHfyPWslq1rNdQhEhphqhZRzvw9ASFjuVpVW6dJDpoI7zM
 3AKasQBnhKrhoIXrbf9OIb86jJe+HPPCyNhpQgnIFQ7VTSHM0wlTH3n86jYlQr43tGD0YLq4hgd
 kTIWbCzUx+QFgvWHqoSKOSUR37j5pEcMRv8Iux/nqdLGebE2j55OLhQ6ZlKAEb4YYf1FbJ/vPbQ
 9HGj18sf44harGe7U24Y3hNsR4ADy0MQJ5dBJ1O75eAukxRcukdGRfRe+alYl9/O28YSVReDctN
 +UMbx7ZXMT327WBmbctcKVjHY3WRrsprGViTGC03nPB0L1SvhAEnibz7E3S7F4c4oOmttUCKcY7
 /zR11Eq5Gov2VX01GeBD8BcFPSx7Cqh3bDV0zo2bFMpALCwjtJ2Anu30SA8UB9isIRxSHovG7v+
 Z6m6TN4mMddXhlA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_232611_527633_E71A7967 
X-CRM114-Status: GOOD (  12.59  )
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

Go for I2C_MAX_STANDARD_MODE_FREQ instead of a custom variant if no
clock-frequency property is set.

Besides, the calculation to kHz does not work for
DAVINCI_I2C_DEFAULT_BUS_FREQ as it is already specified in kHz.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6a3d4e9e07f45ecc228943e877cde1fd9d72e8cb..c6d81efdb9e4dabeb5ac40e9fd9f1a2189619e71 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,8 +117,6 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100
-
 struct davinci_i2c_dev {
 	struct device           *dev;
 	void __iomem		*base;
@@ -761,7 +759,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
 	dev->bus_freq = prop / 1000;
 

---
base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
change-id: 20250913-davinci-i2c-ddcca6ac7c19

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


