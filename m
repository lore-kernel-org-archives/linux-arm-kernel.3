Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463BACA0FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRHVnpg9jOOLhSqBOjWKSbJGnSs0q1UyU/4Pw3oBr3I=; b=o6LDUr2uQ6Ep+mVtmK+wxUhlY/
	cQGjF78NN6vtOAqecXnfogSHOsejY73aRse9ZdwyDD11Rzttxt50P1fbsLQFwJ6+o2T+76Mx4V1QS
	uL19YjudXDBECp4PlFdHgOE7C4sWCY4ACu0iGs/SgWKb9awG375GGKIyAYnWBsmF76J9kbk25lz/B
	TxVg2zOKIUDXuOwkIU0/qcjeTIt+7AYIBjbQNAIDwOP8SDORLHgl3rbE55EQoLi3kUAag5lrRuty0
	fa2sVolTJ2gVGh4P/D1jnaNSU2ONku8EGjSb8gBzm923xMVvdKaYwIT1GCdK52Na5rKKQYc7ZhATM
	sVb6U8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOU-0000000Fy1z-1mvh;
	Wed, 27 Aug 2025 15:49:02 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEFL-0000000FFTs-415X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:23:21 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32326e20aadso7715952a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293799; x=1756898599; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRHVnpg9jOOLhSqBOjWKSbJGnSs0q1UyU/4Pw3oBr3I=;
        b=mqHBLcc8EsdhLBbT/jhDxa6HfDoHNjAN28jA0jTMhFSKex59ysIQvSVj20NkU2FB7z
         mjQ26N2as8rytj7V8lDGaaFs14IFF9bOgXzPVW9yoUOBdfElPAHzxQmbgOQeITOWVGXT
         UHr+Nl9dZbt+GS0mYgUudCxA+aBTF+UjijpH/s0Q8DUP0WURMdDp+04gjqYcurjRCl6p
         Q8k81MycqXBsUSd5Lghorbjwh8HgxjGz6ZVhAUrGeg4xVEiODoL7rFvBi7U+l3WlRKJT
         1MsypEPqwPPqKDYTnDUMBNY1qIooF4GXojZEgKSP0MnpiLA3eohQhAagSGT6KvoYtgnT
         GoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293799; x=1756898599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRHVnpg9jOOLhSqBOjWKSbJGnSs0q1UyU/4Pw3oBr3I=;
        b=ozp5tAyMiSLUhE3gOOOzhhDoN1cYNMi/e6SiHvouW6MZwZtKYK93LcJ7hSyqaLDweg
         v3eyXw2gqKBK/cDpapcHD9t+9D5A325AMT2e14X7A5Ns6Dx5KvPIWrdjj62UPtyAxwJW
         4lzWmthVC25hbXc7q16OgSFXgblVOYCwVQjUgkwfyS1Bn8FQ8SaAF+4xfKBrmUKKXsyv
         d04zEg9DfAtEB8FYHC7Each8SdM9cHnsEXjrbk/R3ecQdNH6YzHxJSW3MKKWFkxjjQOa
         FSAKYOCMmWUi5C+BzLOxUBMbdqGnZ1fYOT6sJt6XY+OKN0kzMBBPtIu+JW6pEXCvcrHz
         9OUg==
X-Forwarded-Encrypted: i=1; AJvYcCXfqnVIMELomH3WgcPZbJ8fXgrMaY2RoQI4T9TDgKPEOER0/yrOxy3nmg608FG6UILlDz6dL3YrHwTI1NiRdenj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5wOugAGFRhioz1leeVA1gTJVwjnqgLNAd9L08JFsl1VMtUEzr
	L1Fdtba1l5LtM2kG/6WUSMW1sGBweGz6q7vLDVEMRXJtqMxYS3mxZUAamsjY4YhP
X-Gm-Gg: ASbGnctkLcwikIiQe7uiAwO7mO72FdwDayTD3hY1Q102ziuv6NHu/81UyGHkq9B6roo
	mSeTWktNPBgVLS7BnhvdYAefB6u3fqmp2a0+NxXxNT5jTwPrwBnH1eOTkzOT3MQk4VGjrQFQRsa
	PtF+LR56x11xL6MY8v1s8fKmosTfD4raJgY32HeBqS3DigNJZGpP0iY2ZpmtVZ4qSWDmlqTt1H7
	BgLvgV6DrLhWnG4eqqnARwV+YeCQrnC+KZJkpC9qNsqvWcCCzfhX2QJdzp1vq18Io3C65ZLNDZt
	Y2Ojj0/03lZoEdsvllW475DHEnk0tMAFUaXhuXpc1oiy/j+2I2uF+AI097qIeO9cSEcPFAW0bMj
	IKNdAS3i95+1R2Zm8S/k7cYd07vtDvlTNUN4VGKQeFWefm/Y2QGaupHfwqOlWW4e70Pw9gVuAl0
	ziQ1HLjy9rnsC/ZMsQQKdUVpoGyOg=
X-Google-Smtp-Source: AGHT+IGazgBF7dBdHwX3f8CSjkteviIi1P6yshCO+mKyTVKYMXEQPnfM8dJAfOCjG9kzcJT1WvLKrA==
X-Received: by 2002:a17:90b:3e44:b0:31e:ebb6:6499 with SMTP id 98e67ed59e1d1-32515ec135dmr27101965a91.24.1756293798966;
        Wed, 27 Aug 2025 04:23:18 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:38 +1000
Subject: [PATCH v2 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-4-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=VOrW2GfzJb6imZqi+U2s8G3s2QEeizLHqMoRRpb/nIs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjW92MB4c0NY3kzza2ESkqr5ug7N3ff//Q3gcdhkG
 GrodOBlRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABMJ2sXIcCBlW1rgMjN/5znf
 ExM2rF4ZczxhX0kf064y0Yd5wdN3RzIyTJ2y3PDT9O8aRz79lH238vDDxEsncws9+a+wr25iuuT
 8nwUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_042320_000579_1EADBA5A 
X-CRM114-Status: GOOD (  10.54  )
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

Add the new SMC RTC function to the mfd device

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 870c8b2028a8fc0e905c8934c2636824cbe5d527..59be894460d33afa754927630881532b548b7ad8 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.51.0


