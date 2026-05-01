Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B47FFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 09:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KJvh/XpegIBYrHOJk7E96WpmL8EapMHXqu052w960x0=; b=Ldq+EZjVehY8jcOt/iycOUFQqp
	7Obmn9l/0OkwLcDWi2mbh7StelQMo8lVHUyZeUJRBsvytP3OJGQPwVxOiiGPzTjiH+C/0pX8Z/sib
	95bXNv+sNz2OX2kPBzhopJrCHbCPlEVmPAOXCtaGcpUUPVkSHQysexG90u0r9BVpJV71WUGSGW4Rz
	GVNnJNXsV9NeJWoLmBdTvDQeKmCgQzK8mzffN+orW0P9QX61zVM/A4SQFGc7M7H7PapSDGo9AWPDJ
	gs6YIWIuSZHOTYsIuh3orWo0GpTcyB7qThmQEsFzVWQJUiwOBwGc3kSroMm6D04vuvDFCT0EAunJT
	MoOcWJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIkca-00000006ZDU-0noj;
	Fri, 01 May 2026 09:57:20 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIkcY-00000006ZD9-2E3Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 09:57:19 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c797d5ad36bso633166a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 02:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629437; x=1778234237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJvh/XpegIBYrHOJk7E96WpmL8EapMHXqu052w960x0=;
        b=Rju4zy+n0f3dSoopADQ4AWryOLxSDoPpcoBh2aOCr9M/ulDx6lNIMFB3Y4Sklxl9f+
         oZzqh5QfULVMSOvViOvEjufBHRjHBPR8I6fV30a2nACU/wV9vfe4VgjtLUAswFpccLl1
         7F6zaPCCAScDf7Tpg5lFZb4J8oHJIwWf5wjlE1wznJtdTu8ExkSXw6oN86iozb6aHoEm
         1RuhzuPXgLxtRb03o5FycgdGs8ozB4RG4xiRV6uAPZw8sjVB3Uxvcx16VAq00O9/zVTS
         cp4chn51pOuiLzFJShJsrAcedO6DF648yvVEVcm3UFTQdFbulslS4VozyZoDLnJl/B8L
         gMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629437; x=1778234237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJvh/XpegIBYrHOJk7E96WpmL8EapMHXqu052w960x0=;
        b=D5UhfgKIkxUpZ2Db+ZiJpceI4rb9guM8nE+uB1pQi42cB4FZEb3Ojt3YsAsJuBv9yl
         GXletTN1TQeSYiw69uM3UcItiLrgsXpPT6L4rtjtNtRblKeecNV2GU+AQ5Auds46CyyK
         +2AmiE7Kj4HvVnA9p2eM8ksxj3vLvG+uwbnt+SVjob20A7BLISTi5xb94P4dd/787Ono
         rQQQI9TP3Wje8rPmPCLRGouejsSRMLYh5iCqdJB1AM2Nm832hF0emoSzZZjhIOTgqOQb
         Tw4q4MG5OrbH6EFjQ1p0Bgnnpry2bHX8IIDqMTUYNp89vFkgf21u/UDfhzvUXqsUm38v
         cZVw==
X-Forwarded-Encrypted: i=1; AFNElJ/MKEnBtOeYrsOcJQU44SG7855LTj2lAF/35Eit/A2Lve6xcASi5DCMgOTKL5BrmIgvwA2m3uRhFO06PL83jz2t@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+pbqsEBFeXdcu1n20I6l2R5CtqZNtJ8AyrZOT5rWH5t4bWnyI
	atgwzHSSW160mucTc9/1lDl/XQ8R19HvTbRDQvOQlq965LIbGajqYWas
X-Gm-Gg: AeBDieu7UyjHUhaqvSEn9FdiRaIDp37+SqWc0Md6VXhZHx08I2vFM2SIOZ+DDzug10k
	Az2pRAgYkCuwKdAWrYMipRBB1HBknX+Z0NOMgmHXpfP82w6WRqMr/z83+rYRXO+D6DRj2HSHbgo
	SKmqxIZzkfSj6pnIUWqVIqgksGWnmhu2zWLimAejh9Az/bgWs9IyKmuADU5bTvGnDN7jmfRbAc3
	bDXQ3tBCd52YSWjd9PLEABjw0ERndKohJb1q/JYelQtoBYd8fbFJRX6NTJLpCmutSw35CCJjSIP
	esdcaeWkldXnDP/M/sg7c7LDbUFXykQawTX3TpQCXoqv8jJ1SY2p7sWSR0e5w3kC5i4FisOKhMz
	zzYaqGUB5XqPZSq+DjeqJEwst7nxtEUS5evX/JK9x5Vz1NPtPtQ+SERuTY2oNkcGpMPNdr8wyqn
	qY4tEHVEnjShwMSg==
X-Received: by 2002:a05:6a20:6a0b:b0:3a2:c683:fa84 with SMTP id adf61e73a8af0-3a3cf77ba41mr7322916637.27.1777629436989;
        Fri, 01 May 2026 02:57:16 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:16 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/4] fix and improve for Hi846
Date: Fri,  1 May 2026 17:54:29 +0800
Message-ID: <20260501095433.1609309-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_025718_590910_6850AC6F 
X-CRM114-Status: UNSURE (   9.83  )
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

This series fixes a error blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- remove uncessary `else` (Sakari)
- fix link frequency (Sakari)
- correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com

Pengyu Luo (4):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: fix link frequency handling
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 226 +++++++++++++++---
 2 files changed, 190 insertions(+), 38 deletions(-)

-- 
2.54.0


