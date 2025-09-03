Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498EACA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xl9c50SijOEdAZRChzrnPJTZawBct2jboofqHxITrdY=; b=pbCGqpzcNvQFvxzYVUyVosk0nr
	a8IrqBNhpNVMM/rJbJjWIuJ1GJG/72k4gSLhzByOJgXD0uxWfC+jHdhUPeQCXvA9LdTq+kW/PSML1
	N4WPFfoM1ag74w/uvmGNlGnS05VKNzShbxk2Lg4HqyCxr3ep3lLFBUbwcYvcfcR/PjMQ+mNQUmE2S
	Zt/wXwuAliChO3O6Y/OB8VpervgRJdVReye+Afkrh97gxKpGsajJPLxUSHzK8WFqhYXOb4cOSLF8F
	kMPCmcD/IbpmoeEZ/mSAS+pYPap7P9yg4x/UjsLM6IN4dYvBJaMiI2KKklrqq/C9chm7diwUfmuqu
	V40BVsJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjo4-00000005w8H-2tT1;
	Wed, 03 Sep 2025 09:29:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPx-00000005Lr0-256u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so28488625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886432; x=1757491232; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xl9c50SijOEdAZRChzrnPJTZawBct2jboofqHxITrdY=;
        b=uCdwNbZ8jr6+y/zuR/m1Z0vMvoQOxSQ0btNMiujsPyHav9xVtMryTXVnY5o+UuPJBd
         NsYDNcr6KuNcolw8VPmQs+uLAmcxOL5N0fZN8pyKmN9a5X2YKNPnOpbg4dt4Ontup2Wl
         dQQ6ovG+MaW3OFMWIfVb8rxWePtLzx/Fy71ym9vVWJErP5dxyAOPE8EXD2EY2EnBAD3E
         mtkafuAtqbzCm+EiOcPBW1w7jFHXGwC6HEhJPff6zMfg1v3x5sKf8IrB2KGsb7OnLdjM
         8D+rLgvynF/nrTbuFO4cbDX26y3d1gXX76/RH7W1vlfowktfwVV5NsS3B/y+6Pa8jkWq
         0Ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886432; x=1757491232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xl9c50SijOEdAZRChzrnPJTZawBct2jboofqHxITrdY=;
        b=o68wcurPL7NOu4QA+rloD2xKfa4bxojljJ1lym2y1lIj66x/c3KG+w15Nz4H6SgKbB
         gnpgziuvxzcFhZjlOS073biObuhOFfLWB2bDIlYnLVOVj+1RH1nNW/o64/tQNP6jcpST
         Dp8Sa8A32KyY14vv8PoAAj5aSehxexPI7FdDqNJguGYLxbn/vwek0iFt8EgJ2BzyQg6y
         QjMrXOaa1BGWn58RMNnuUU2vz3sESFq5Gh09kZv0nU0oLXq5u/9x6AGhvj58KeE2DU/P
         vC51nYv2ixHrmJNs8Gaq8PwnGuaoIBHEahCYO8sjasVjxk7eUbKxzdGjuwQe3K1trRc3
         GHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8yVNVY0DF5Bjb5pXSJ+fBqKbzRGwLar2rEt3JL/l/Vadt/UPiTRuMeMMQ8rDdpKByalsL79k4YNch3NeSIKFD@lists.infradead.org
X-Gm-Message-State: AOJu0YwSeyY8TZKSDn1dDSw8+/TJY1fohWgzt9tHO2ita+oWCXd6Dy/q
	CBgoWTb0iyhVnfEVkv8iAc7vlDuv/MU6HPy8kzf24i1HKCzs33ntGxhvjpu9vlKVahk=
X-Gm-Gg: ASbGnctdVZdQPY9L8+gh8EBXg/OAzoMqenZr+hVM1DNWCO63a9pLtWS5UNMgz2aFOe+
	Lqwk9+h75CfZSsHvvCxkun8O+uDNcHXOhQ7voMYRWhzBGYwCV+99EhFMLQIgu6QD9SikE3I2cwd
	5vaHYNSzYPVIayxAay2epqk3XsD2EbyceKG0jEYFAw7uiqfSSTQgwF1TVol5+bYfz4RvDvt7uqw
	nYdkUNvIxGrqkVHxru8ZuagYJA3tl2JazBE2HrP4R10y/1gfyJ/U2KHkzmr8h5q7fzeHn2R0TzY
	PH1B3gZz+4uCU5Yqic0VXuyQQBJZp1E7bIhMWg948qseKIW1NId4YsEZ5EP7dMxIDr+G81I8T7x
	Stav9hUGNXOz62CSAkN63Q4fiEJQ=
X-Google-Smtp-Source: AGHT+IF2bnM3rciUVbRMrNwmO+YSe6bBRk0RN/gGbq8L7FMVer7GZO86jwyTuVa/jTrPDmY9JPEBSg==
X-Received: by 2002:a05:600c:46c8:b0:45b:80ab:3359 with SMTP id 5b1f17b1804b1-45b8549c269mr116288125e9.0.1756886432069;
        Wed, 03 Sep 2025 01:00:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:14 +0200
Subject: [PATCH 10/12] gpio: ep93xx: order includes alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-10-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SeHuZ4DyFwDbjs5OShkvtEguX9jqUfBZsavpnJL0KgY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WSv3trZSskCN08g6ztefjtu8g89Qs468UlP
 JhNKWGRoYqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kgAKCRARpy6gFHHX
 ck6qEACV9xM3Bt5eAt5FKZW48qyPbqMf5pY7l5XUTZ+Li09j3ed6/2R3UB6jMZWQvEkintiENSV
 J8By/NYAK4bUYnVe3rZL6Riuz3NnRt7SLjU/DI7P6sMgGwkeEITYCQgZgFKik31jX3hK5gWyxEv
 WJKvrt8Tk8EhJyGrJMmng7ppj0kLU4CsB9hcW+GzGja2pjhI8d/gLF7weFg8JX2JynngL72C8bH
 gS8LKxDx4JtjReUqTJFVJ1yWBkQ9uHZ8Zn5qlbivGwdoo5B4raqBIUmUqMhz8L4/CyrRFFWJtSs
 TxAjpLuAI5tOzztMl42AyAKnG23mT5670+oLdSCC+g0Ns0jIUO2cLwFi3DaEbFhBiZYO1oaaOyj
 jdmnMzotD1HvlI0COVxnNFdd9uTvZxhduLOD6yR/RLWTAR3GalX78PTp2R2CcBYXT6UG/pWFPgr
 F75LNdWHDcmCUZx4JeOIHBvGjz3Km2w+ecrIAM4VrxrIxZQ0G1U6PMPXSXfzdrNf63fp/lYWicD
 LINF1QLAlwABiyEVV6qD/0i/gc6iWIyL9e62/lvSQk7+qbIduSlgn24qa/2QyKZSPe8LKslBWhq
 d88D5wmIoE10KJBLDO8WAbYyPPia8OWbIJJlL9z73xorUARUXsnHkOyz3s57BhAuuVwF3vo2WKR
 OFj2ms6wO2yJIJw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010033_551146_048E67B5 
X-CRM114-Status: GOOD (  11.13  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For better readability and easier maintenance, order the includes
alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ep93xx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 58d2464c07bc360137f3100de4e4147030bb121c..08e5ae8bf4d1a80ca26680a3c7bff0b8039fa41a 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -9,16 +9,16 @@
  *  linux/arch/arm/mach-ep93xx/core.c
  */
 
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
 #include <linux/init.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
-#include <linux/slab.h>
-#include <linux/gpio/driver.h>
-#include <linux/bitops.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/seq_file.h>
+#include <linux/slab.h>
 
 struct ep93xx_gpio_irq_chip {
 	void __iomem *base;

-- 
2.48.1


