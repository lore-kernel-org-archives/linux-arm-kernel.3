Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5649BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=; b=VDObBGaRFjacdO/dGcdXqestAI
	O92nAzy2utZJAj/okZEvGD8shnhWP/wMlcYfxgSPZao+k7gTBLCZPu+yMcmqQxXzn/eJRqDC+0DSv
	fTiMGXWHTfAUdkJ1HJRXCRMyWWH8aZzrKpERpx6MSOg6oCSdysc6YNGPDDpSWWUTye4sZK+r0ZzU0
	E0bMippjMN9FIaEJaYr8CAF2cEBrJF5a11YzMOjoF+09wTUlL1IFUImpzhbsBaknNPU3PbTtO6/u/
	ikMVO63ICha5UJKKauTDFLLVZc4DcfWS2r/9lMmIVyU/C7gelAgDu/wdXYFshx2OVBIFYQa4JLNeA
	5CMUChqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Gih-00000008NMn-3WD0;
	Thu, 03 Apr 2025 09:18:43 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPk-00000008Jjb-0khk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:10 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so1320554a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670747; x=1744275547; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=;
        b=zRVpn7MxwoWLkZJu2CSWrtk6kTq2j67HuauhZFNekZG1n3p3mg9307Cgp3CQsb42ua
         Rz4HuoPRd9tIvhYBeYCytHOqTeTBgG6WDBwKXlCzwDqvEzijoZf4iPE3SUIJ7PPBXH46
         /q93OwXZCeMzGLRQuAInSf3gOMBFjXMEtGRQvZl70NHy7sSUmvjE2T/O5YWigiCDhiLX
         TV3tRtTgV4YpuHPlKLg2/B6Hnt5wgZQhd1lvDj9wjozudwcsHAMwAPgmprCRHrwAfyY7
         9Q6efawd0hkjY7T++Jpgz7JLDzWpPX1MMledp54ucEw/lDq+SMFqOgRO8Hpgm5Vo/og/
         O88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670747; x=1744275547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=;
        b=MkqliNXL85JwxD1dVuMkJ23LarVxIFItjBoAfoCKm1EhS9mpmcJejWy8nNhwdpyRX+
         jOSbEifnQwJlHLnR8BnSNi6zJIx36sIVk06l4z0tvgEYQMZ3Gv2bZ6p5K9u5+ahIxfcx
         gAcrJOZ+v08Zt8ZL0Rohr9ENX92jt/0b1MqT9nJ05pXArT4MOtQkiso+TeVEabnh2F7b
         BO7YrF5ArxRyEaYTj+wW4LIVZvcqD0eiXZZlfXhjCUTjN6s/RqZUhsHGwy/Iikpnh1xQ
         LiftsjPxmAWcuLc7GvTr+mvIVoLNMpvabFBntD2jAJa8pFTx98zuCc82LNLXrUylL/n5
         SbyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUprIZDjNuXAoiI3d8zWOU199xoK/5zPTu+TNLRlQIlDVSK2/R4tNkx8i4lWyVOzg1+pdflj66iOCRz7dI8Up6u@lists.infradead.org
X-Gm-Message-State: AOJu0YwSB3qLzWkUm9sBB2Aj4CHlD+cCZjKgOgg38zZJBV/BuLKAcWMd
	rl9tp54iGIeseFDxdyG3FLuP3SiZvT+RIKVeylpn0aChfBfUVa56DCC34NJoO7c=
X-Gm-Gg: ASbGncsD/MIKJLdlJZFMarG8eAL8kzd4pZtNrS1i7eIJnZZL10NlEhmHBq6sRX4enAB
	0T+q6B3MdiI0RdRB+u/jq8S+Nr+OF8ZTU9Qxx4gz6dyemEMC/6sFzqWCwuwP/3RdbVm8lMiwHEJ
	gQOITobaMTjgBuMI8VgGdSFv94Fi6KM7d2opg4PjMthKY15/7o/HVURTr5A1l2FihY28iwMKd3i
	4JeC2QNsG2LkIbsLb2Spt2P0sppYuFe4hanF22CW1Hi20urdvMyYmZcKB3RmI4+mxRS5Yy9UINM
	NepLrF0kR2fyGz/wJzVOeYmD8UnafNvjwLIpnnqzlZHDi2NpALJqrqKDxT5GrEB+CeVpA7yOyfy
	l63ywJKVa3k9JrmIWkyHF1Lin07W9
X-Google-Smtp-Source: AGHT+IHQHM6p/MAOKJQd3/sqq0s5Pmh71tqwvfrmV/m7Z/Cso9FWL+o5hSWX6vucaMzTOkvAI4hVoQ==
X-Received: by 2002:a05:6402:274c:b0:5ed:16a9:c333 with SMTP id 4fb4d7f45d1cf-5f08412c8dfmr2413316a12.2.1743670746820;
        Thu, 03 Apr 2025 01:59:06 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:05 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:02 +0100
Subject: [PATCH v3 10/32] mfd: sec: merge separate core and irq modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-10-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015908_227986_35F919A3 
X-CRM114-Status: GOOD (  13.44  )
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

There is no reason to have these two kernel modules separate. Having
them merged into one kernel module also slightly reduces memory
consumption and module load times a little.

mapped size (lsmod):
         before:             after:
    sec_core   20480    sec_core   24576
    sec_irq    16384
    ----------------
    total      36864

Section sizes (size -A):
         before:             after:
    sec_core    6780    sec_core   13239
    sec_irq     8046
    ----------------
    Total      14826

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Checkpatch suggests to update MAINTAINERS, but the new file is covered
already due to using a wildcard.
---
 drivers/mfd/Makefile                     | 3 ++-
 drivers/mfd/{sec-core.c => sec-common.c} | 2 ++
 drivers/mfd/sec-irq.c                    | 9 ---------
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index b617782eca436e34084a9cd24c309801c5680390..8f315298b32a2a9ee114ed5e49e760bd8f930aee 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -228,7 +228,8 @@ obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
 obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
 obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
-obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
+sec-core-objs			:= sec-common.o sec-irq.o
+obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o
 obj-$(CONFIG_MFD_SEC_ACPM)	+= sec-acpm.o
 obj-$(CONFIG_MFD_SEC_I2C)	+= sec-i2c.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-common.c
similarity index 98%
rename from drivers/mfd/sec-core.c
rename to drivers/mfd/sec-common.c
index c4b7abe511090d8f5ff2eb501f325cc8173b9bf5..782dec1956a5fd7bf0dbb2159f9d222ad3fea942 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-common.c
@@ -307,6 +307,8 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("Core driver for the Samsung S5M");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index bf86281401ac6ff05c90c2d71c84744709ed79cb..aa467e488fb5ef79d5bc7110e1ba7c26fcfa9892 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,7 +6,6 @@
 #include <linux/array_size.h>
 #include <linux/build_bug.h>
 #include <linux/dev_printk.h>
-#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/samsung/core.h>
@@ -17,7 +16,6 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 #include <linux/mfd/samsung/s5m8767.h>
-#include <linux/module.h>
 #include <linux/regmap.h>
 #include "sec-core.h"
 
@@ -510,10 +508,3 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(sec_irq_init);
-
-MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
-MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
-MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
-MODULE_DESCRIPTION("Interrupt support for the S5M MFD");
-MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog


