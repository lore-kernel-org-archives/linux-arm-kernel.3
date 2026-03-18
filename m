Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C76B107760E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 19:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iY4og2qGh/roH7GFoTs23bu6QUHnKE8+1qN6pUKQh8=; b=GZHqm5K8ZNJaqry7yqtJ97zLCB
	C9mB5Jomz+CiuYYN9w/BC1U8LO4QHZD/h4cCWBujkQvPjqJyERRqHtHHGXlS4lPJb/JnmuVd/muop
	SJ1ZVc04XnDwkyY31jdPtQqimQzwSWCDcB6o9KF6vWrSfTBfZd9iQu8PgjLX24V2dtqz6A9xFbLh7
	E5i1dK69SmU4feKIPFKVaDc95xtJYGTb5moGWAZUurwDbniRoIzeQM0EeH3ZSh/Oln/6H6NEFAK4u
	mT5uFOZjMrwYKf8CRONk11lwOTy7R1phFzETc2suHvsxTqfK0BFX7wHRLg11U0iC725A8jeE98IEc
	D/BwsyFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2whL-00000009F9B-1opA;
	Wed, 18 Mar 2026 19:36:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2whJ-00000009F8c-1FRk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 19:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2iY4og2qGh/roH7GFoTs23bu6QUHnKE8+1qN6pUKQh8=; b=gKq59PqlihHE27tV5vm6UBLyg5
	gzryftcGZ1QkpdkmX8rFlUa4NGeN1mYb681jFpySY4shovPV2t7KmPgWYeOCZHld8sjO7HZhnKLRQ
	DjH/9j2PUNu1I4H1i2hP4y6gi8z44Kn2dnc0Imk4fKADzv9ykA/8vintuLd5boc1Ja3iIe4MIaR+r
	pYFdwCYYDo1/3MDvq68tyClGWwr/zaPEG/S1mCXJiVs2enfPfP5qphQ+3SCUHRKaPqxZcn3arBx1M
	Hxqs5zAhv9PDV7tfKasKSkSMoTsxfT8tuN3wBZP55F8S+YzBH8SJXxhGF94X56vwilAtlakTqTDgD
	ZOhAd6SA==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2whF-0000000C99S-44m8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 19:36:51 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so221369a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 12:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862608; x=1774467408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iY4og2qGh/roH7GFoTs23bu6QUHnKE8+1qN6pUKQh8=;
        b=OnItuCWhq8k3SdsdslFtPeaVsV6lHHDg0me+ziYfcguyKfTwTh3G5fYaAYj5/e/HhL
         enuDE2uu9yiK0aE75CwQMHBK3DcJ3G+QgSn6lNp5G9u2bq4zTbhsi8sq1jTei9R0q0BS
         g8yLT2uaPJ6s55A2MTekjSyk8OH2Gr9S64Cjb8DW6ptcrtMd8xScLEGvwhQmk4GjRu3J
         mfv2rBScT8gDxR7YFnIe0IvBdlZPLc5Hrnxxw7KXQulCKfdjbkcIVr9kvs4O6sztRPJP
         4n4lHfZUvEB7S3oBRhH9tk7TCHeoFZVFt5kVh9qou5tJpUM6DLOvlQ2VxiBN5SI26dEv
         vaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862608; x=1774467408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2iY4og2qGh/roH7GFoTs23bu6QUHnKE8+1qN6pUKQh8=;
        b=AKQhUsMHujRRvR+j3ravg49X1TUCc831bAnmmJl3DY3Shx/YufjiezLyv46fiKg9TR
         7RLu6yn/5e9T9RZncPl67O17oQqYXaLtm6Sj633NxA3oeMjjIqic7H+EyKdf895qsilH
         QwOgxMt1oU5qC7E5QH4YEQVLcI7251VS0qLP1lKUAxbLE0PozZb4wrK5ZURSgjeuMHd/
         DTT9SoEJGczg7Y3T8DA1UbXoFyVvC84/4riGkT3fgKuEN9yxabVsbbEtLxG8fp/tO7Oj
         K2SLIZAHjuKOyzw3vWuU5TQog3jQhz1Lgh4rewa1OyxyIZuNh7rxRhZ1D3zakLfjmPqo
         jyKw==
X-Forwarded-Encrypted: i=1; AJvYcCWr4UCy3wGhdREFebCp4Nj2e7JgR3d/17o9RakfjosjvhE+kSROhlgNn4qcKNAQYCRuPymjF7WAEr/8wUmZ0IjJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyewf/UHb/6jvCje1MtwUwQgU8sZJ1CMI4c3KCyrAitgxqwa3ae
	lJugDNtKi6fMFVAj+RaquQPKWol7Sqzmj8fx8KYyX7DRp5q4pOaM82jz
X-Gm-Gg: ATEYQzyAo2Gyi2AXI5Ze5uuISVXkug+VkieyA3V/pfwhIaF609dvIXpXt4U2kORWEmL
	AwEV8lYq/Z/qLs7Q+519LZDOe3VU4v/KcjYeKoGqp6RBhuKixHhn65FvU5qzUztiSN1QG2lFf1i
	tbUvCpLq2r05mEmshU05g4OZSWYU+xCYdkS5oCIsN4YJ1KmFF62CwIZVCzCRN5/0inXAm61uPYH
	Nl+tZzP+T30yEPqxOuwl7gU9EsWCjGV9vGtc/ucRL0RbigQH/+eI/5RdXQ5TmyMTw9N1uKztK7Z
	KhnRQLpgHZNvI9aQsSR3Ej7hX5xmWP2q39A1iJtVPMggU34yFGB+MwJYgFnCJoiwWzPk05EhJn1
	1YO5YPMHajc/vTaVQXW7yuSB6r76sDgxAXboCxiu62HsW7C/JdcH46xWMGGD0tyumYA33FWnssE
	gsyWUAaFURVYTeZcKrKJ10bRuisikePuYhL7zW/tuNMp2qhPgWs9ake8tY35gImTUF/MBq/5ynB
	VFZ0YQhY+4DzmuaRU/1jpgez2jk1B9OJPLywuU=
X-Received: by 2002:a17:90b:2e04:b0:35b:982a:28d9 with SMTP id 98e67ed59e1d1-35bb9e3b705mr4266431a91.4.1773862607823;
        Wed, 18 Mar 2026 12:36:47 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9ff59a4sm1521664a91.2.2026.03.18.12.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:36:47 -0700 (PDT)
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
Subject: [PATCH 2/3] nvmem: npcm-otp: Add Nuvoton NPCM OTP driver
Date: Wed, 18 Mar 2026 19:35:37 +0000
Message-ID: <20260318193538.246853-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260318193538.246853-1-visitorckw@gmail.com>
References: <20260318193538.246853-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_193650_100867_872848D5 
X-CRM114-Status: GOOD (  28.99  )
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

Add a new NVMEM driver for the OTP memory controllers found on Nuvoton
NPCM SoCs.

This OTP is read-only and manages two independent arrays: Key Storage
and Fuse Array, which contain cryptographic keys, hardware strapping,
and calibration data.

Each array provides 1024 bytes of storage.

It can be accessed by writing the target address and a read command
to the control registers, and then polling a status register until
the data is ready. Concurrent accesses are protected by a mutex.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS              |   7 +++
 drivers/nvmem/Kconfig    |  10 +++
 drivers/nvmem/Makefile   |   2 +
 drivers/nvmem/npcm-otp.c | 129 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+)
 create mode 100644 drivers/nvmem/npcm-otp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd37c..e391e2bcb5f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18894,6 +18894,13 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUVOTON NPCM OTP NVMEM DRIVER
+M:	Kuan-Wei Chiu <visitorckw@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
+F:	drivers/nvmem/npcm-otp.c
+
 NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 74ddbd0f79b0..5d065b7448ff 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -483,4 +483,14 @@ config NVMEM_QORIQ_EFUSE
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem_qoriq_efuse.
 
+config NVMEM_NPCM_OTP
+	tristate "Nuvoton NPCM7xx OTP Controller"
+	depends on ARCH_NPCM || COMPILE_TEST
+	help
+	  This option enables support for the OTP (One-Time Programmable)
+	  controller found on Nuvoton NPCM7xx BMCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called npcm-otp.
+
 endif
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 7252b8ec88d4..63c23b304d64 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -95,3 +95,5 @@ obj-$(CONFIG_NVMEM_ZYNQMP)		+= nvmem_zynqmp_nvmem.o
 nvmem_zynqmp_nvmem-y			:= zynqmp_nvmem.o
 obj-$(CONFIG_NVMEM_QORIQ_EFUSE)		+= nvmem-qoriq-efuse.o
 nvmem-qoriq-efuse-y			:= qoriq-efuse.o
+obj-$(CONFIG_NVMEM_NPCM_OTP)		+= nvmem-npcm-otp.o
+nvmem-npcm-otp-y			:= npcm-otp.o
diff --git a/drivers/nvmem/npcm-otp.c b/drivers/nvmem/npcm-otp.c
new file mode 100644
index 000000000000..abe4bab66c06
--- /dev/null
+++ b/drivers/nvmem/npcm-otp.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nuvoton NPCM7xx OTP (One-Time Programmable) NVMEM driver
+ *
+ * Copyright (C) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+/* Register offsets and bitmasks */
+#define NPCM_OTP_FST		0x00
+#define NPCM_OTP_FADDR		0x04
+#define NPCM_OTP_FDATA		0x08
+#define NPCM_OTP_FCTL		0x14
+
+#define FST_RDY			BIT(0)
+#define FST_RDST		BIT(1)
+#define FCTL_READ_CMD		0x02
+
+/* OTP total capacity is 8192 bits (1024 Bytes) */
+#define NPCM_OTP_SIZE		1024
+
+struct npcm_otp {
+	void __iomem *base;
+	struct mutex lock; /* protects concurrent OTP accesses */
+};
+
+static int npcm_otp_read_byte(struct npcm_otp *otp, unsigned int offset, u8 *val)
+{
+	u32 fst;
+	int ret;
+
+	writel(offset, otp->base + NPCM_OTP_FADDR);
+	writel(FCTL_READ_CMD, otp->base + NPCM_OTP_FCTL);
+
+	ret = readl_poll_timeout(otp->base + NPCM_OTP_FST, fst,
+				 (fst & FST_RDY), 10, 10000);
+	if (ret)
+		return ret;
+
+	*val = (u8)(readl(otp->base + NPCM_OTP_FDATA) & 0xFF);
+
+	/* Clear the status bit to prepare for the next read */
+	writel(FST_RDST, otp->base + NPCM_OTP_FST);
+
+	return 0;
+}
+
+static int npcm_otp_read(void *context, unsigned int offset,
+			 void *val, size_t bytes)
+{
+	struct npcm_otp *otp = context;
+	u8 *buf = val;
+	int ret = 0;
+	size_t i;
+
+	mutex_lock(&otp->lock);
+
+	for (i = 0; i < bytes; i++) {
+		ret = npcm_otp_read_byte(otp, offset + i, &buf[i]);
+		if (ret)
+			break;
+	}
+
+	mutex_unlock(&otp->lock);
+
+	return ret;
+}
+
+static int npcm_otp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct npcm_otp *otp;
+	struct nvmem_config config = { 0 };
+	struct nvmem_device *nvmem;
+
+	otp = devm_kzalloc(dev, sizeof(*otp), GFP_KERNEL);
+	if (!otp)
+		return -ENOMEM;
+
+	otp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(otp->base))
+		return PTR_ERR(otp->base);
+
+	mutex_init(&otp->lock);
+
+	config.dev = dev;
+	config.name = dev_name(dev);
+	config.read_only = true;
+	config.word_size = 1;
+	config.stride = 1;
+	config.reg_read = npcm_otp_read;
+	config.priv = otp;
+	config.size = NPCM_OTP_SIZE;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to register nvmem\n");
+
+	return 0;
+}
+
+static const struct of_device_id npcm_otp_dt_ids[] = {
+	{ .compatible = "nuvoton,npcm750-key-storage" },
+	{ .compatible = "nuvoton,npcm750-fuse-array" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, npcm_otp_dt_ids);
+
+static struct platform_driver npcm_otp_driver = {
+	.probe		= npcm_otp_probe,
+	.driver		= {
+		.name	= "npcm-otp",
+		.of_match_table = npcm_otp_dt_ids,
+	},
+};
+module_platform_driver(npcm_otp_driver);
+
+MODULE_AUTHOR("Kuan-Wei Chiu <visitorckw@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton NPCM7xx OTP NVMEM driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0.851.ga537e3e6e9-goog


