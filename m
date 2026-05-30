Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EB1CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 20:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7fBSNfLq7QUu4AmPks5xSIdwkB0r3aZw9X+kxcAAws0=; b=p2T4P7vsb87tg0mRu5MYZm/c70
	dM8cxXXRkiBBnRdWR/8B+DDbwx8tNkBa0Jvz7GDXDRx9sotHxxMZUHCxkJoSaD8Tzn7h3QxP+FDTF
	dyKRdxr1Ar6jh+sWyuxYcMGnReG2ptoEgujcE4Gi7aujF/q47qnlw23suTR65BbkcuH++nD+4i13s
	HGd2iVYSUYUZy88zC+ryBCpNSoD6P364PXOsZbVLyIdKKTHDwH0ptHimXnkQjtwMCO0rlZwEkbvJs
	3wXfc/gm2MoqWVEiCsH6TF1esCH7+iWYnIkb9YK7IO1bdBtNfO7m3Ct9lxAZkUaUpCCVr4rxP0YPd
	aYw5QwnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPwm-000000092ZC-26v4;
	Sat, 30 May 2026 20:06:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPwj-000000092Ys-1Apw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 20:06:15 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf18c30bb2so15709295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780171572; x=1780776372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fBSNfLq7QUu4AmPks5xSIdwkB0r3aZw9X+kxcAAws0=;
        b=HWNMOZdcAzOauWT2CejeOn9bXii5ri/2IH5/aE9i/6LNQQODeip03i1Lp0tbRM5oFf
         2mf3dT7EJznUFtIhYfaSVUW7E2zV37BHXQNH+oH9TM5kG+jRBK3m9RqNgoSXsYRdfnZO
         D3+yCxIMelUNbZdvozrGDLqW/oGxiWMwB8ji+buKnQ6/sBZx9/EdHj0lQ5l2aN+/xzPk
         xMfYCVzcP8cyTMEUFmzDu8PdEgBBfxHfHGtRteJi4g+E29oPj77lbzcLuWvGF7B5PA9R
         41BmJ1whZIjE//VV5G7+146cWHGc72cuXopUVQCuvpzNiu42srP26yML2TbQaGZ1QagN
         zW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780171572; x=1780776372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fBSNfLq7QUu4AmPks5xSIdwkB0r3aZw9X+kxcAAws0=;
        b=rYVuLF6R034efxUChNgwnN0S3vazXYBmDUa4KHh8UupVl1gcharvqXgWGRTEgdaAcV
         tRgpbH2oPF4FBq5SadR24oaKS/rIeWAYDAHJhYqnFkvLWcxCGTAYiwTqD8nVJzYwz4ES
         /UANb6pkFGeEvS8DRXsx2zYILJhJije9mY5pmJdc/6XxKNIgQrsoXUG3ub93UiG0zKhW
         RLj1UYDYU8mVJUT3jMKBOmHwsVK+9ZbWgQVmxABr0zSvY0GokRSEniga1uMFuUpSgtpo
         AaWJfsHemeljgpqSI/Q1roTFTwRwbje1gYjZpTa8dosv3bgmjriX54BeI5IC6BIBoWEZ
         0hDA==
X-Forwarded-Encrypted: i=1; AFNElJ+wQrnLn611ZiZIbeko5Xzc61ldw/VXbafiesty05U62CGWHAPPGPRl0g4KFBzjZD6ul1pd83lHbMy67LckujLD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2SBpOTV5aULr2qGQe9yJHuYxhUm442k7X45G6AED82GoOpwcm
	zSDNMW1Uv3cpVXf37ejMbzkgo8hxP3DBqz3nZ5dXbOQTM1T5fEC3deD5
X-Gm-Gg: Acq92OG8KyrNi2bVyO1QGVwamaDTn+jvdnMGs9K862CA9c+J2g59Sd8QHeuufQH/sIk
	BjHgY8YdsSTaNuTMn/CsuEfoX3yfmXPTcldaAIh0f0kw3iiOmWdcHrcPc3w80jg1nZOr/VU9njL
	KBC8vFrkAyHstAcDKNHm/9V6x/4q1tWUZ1mr6QwZ8mn3OV+SSoz0rS9tuLtvdmiev1PCvs/nkbr
	pEMCoOFkZCD4LyyF1soD4BjgP4LlwtgCXoW497RYePxzCdRVGftdjQDRoPGz/mN8t2K026XRqxk
	qe/cHmUAzxFBNgYH+Fyks696uJL2KkgsTY+3ATCIskM4ZyHWTZL5FMqeMjnKBtIZVpRg0A1+bQv
	nmPWbyccs+DS5XPKG3Kwismmt53c88V5CQ+0Q2s0InIeApgJf3t9OQ907iAoSrWf0/3f6gPDNa1
	w1Ai2ihE56VoSEzqGr+0RiuqkaYKK0aghdDE8cDKrY1WdW9y1j4lmIQWsqMAxFRSQsRWd9HsGzO
	03liYIT08/lPYTKtXjoBO7n6ofd3IDjk0j2C7FHjC7LWA==
X-Received: by 2002:a17:903:37ce:b0:2c0:b5c1:8e32 with SMTP id d9443c01a7336-2c0b5c192fbmr19092815ad.41.1780171572211;
        Sat, 30 May 2026 13:06:12 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c4dd4csm58546105ad.78.2026.05.30.13.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 13:06:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: mxs: add missing kernel-doc for struct mxs_i2c_dev members
Date: Sat, 30 May 2026 13:05:54 -0700
Message-ID: <20260530200554.8415-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_130613_341915_2C8265D8 
X-CRM114-Status: UNSURE (   9.97  )
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

Add kernel-doc documentation for the struct members that were previously
undocumented. This fixes warnings when building with W=1 and ensures
the struct is fully documented per kernel-doc conventions.

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev &lt;rosenp@gmail.com&gt;
---
 drivers/i2c/busses/i2c-mxs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 08c9091a1e35..4e07babea9c3 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -108,6 +108,14 @@ enum mxs_i2c_devtype {
  * @cmd_complete: completion object for transaction wait
  * @cmd_err: error code for last transaction
  * @adapter: i2c subsystem adapter node
+ * @timing0: I2C TIMING0 register value
+ * @timing1: I2C TIMING1 register value
+ * @timing2: I2C TIMING2 register value
+ * @dmach: DMA channel
+ * @pio_data: PIO data for DMA
+ * @addr_data: address data for DMA
+ * @sg_io: scatterlist for I/O
+ * @dma_read: flag indicating DMA read
  */
 struct mxs_i2c_dev {
 	struct device *dev;
--
2.54.0


