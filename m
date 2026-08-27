Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90199C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:Cc:To:Mime-Version:
	Content-Transfer-Encoding:Message-Id:Subject:Content-Type:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bh0KpptlHo4EabAVwVEP+7z/2v5dfwz3z0l/dDVT/I0=; b=aElCELQCO6goYZxVG5JJA4htgE
	hbmFaNLDiU6CG93GXM6Mg5QFR5wKw97HYTz81JY3+4XjjNOUdhvIwRWiRe5IGFXW5x0AN0f69n7M3
	BsQt90MWB1F27gEd0qWFomBK8UV8HSwVjE/BcV3ygeBhkjfx4mMFAx5M1AF2oTBIINPrFkkJ0l1Pn
	V8P4/WQvU0xnhqAIB2iy9SoK2OeZvTxVMJrIaGLaa9iQfol2XNGKXbsEdrVpwn0k8gS3jFNkt0Yz2
	OC9N0OJewCdkPG6n720w3ntsaNWFJ7v8qR6Fc/bHT5c+gOIxc/kfxjqF0n5ncohn7KZ+qnIqoPHql
	Ip4kojjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcGG-00000004Gik-2ZMS;
	Thu, 27 Aug 2026 15:43:28 +0000
Received: from sg-2-1.ptr.blmpb.com ([71.18.227.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcGD-00000004GhZ-0Jih
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787845391; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Bh0KpptlHo4EabAVwVEP+7z/2v5dfwz3z0l/dDVT/I0=;
 b=V00chBgzzYgCqNjsuHPKFjsaKDb0LkzBjsxut47JqxA7+5W4pM0BccR2F2R7vQes0TTFpB
 CqsGB8gZYtZG+s6NxpTU9ZmZgDVVrYWPC/nmikjbHWJdGVzsm8GmCSaQTPhUpQQ2wntGhb
 lC8z9JgzYZrDvEA/PA+1hqfz3syOhXPy19RLct8Go+Q+MGt1GTJVX5k1Z+2NSwciBV4wHB
 DyOUkyR6J2fz6xSV1BkC1cNjkQuxBMO2tJ6StH4Bu3/x9/vJkye70qdlRUjYsoOTS8zCCj
 GPBhaAbl57rJBKTSBN5cujFZ/cDy16J+ritY4XpZDlhHLIIE+TjR3THmtvlw1A==
Date: Thu, 27 Aug 2026 23:43:00 +0800
Content-Type: text/plain; charset=UTF-8
X-Mailer: b4 0.16.0
Subject: [PATCH 0/3] i2c: fix DMA channel leaks on probe error and remove
Message-Id: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
X-Change-Id: 20260827-i2c-dma-channel-leak-b58522243736
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a905b0e+73a6af+lists.infradead.org+me@cherr.cc>
X-Original-From: Shengzhuo Wei <me@cherr.cc>
To: "Codrin Ciubotariu" <codrin.ciubotariu@microchip.com>, 
	"Andi Shyti" <andi.shyti@kernel.org>, 
	"Nicolas Ferre" <nicolas.ferre@microchip.com>, 
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, 
	"Claudiu Beznea" <claudiu.beznea@tuxon.dev>, 
	"Wolfram Sang" <wsa@kernel.org>, 
	"Ludovic Desroches" <ludovic.desroches@atmel.com>, 
	"Oleksij Rempel" <o.rempel@pengutronix.de>, 
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, 
	"Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, 
	"Fabio Estevam" <festevam@gmail.com>, 
	"Yao Yuan" <yao.yuan@freescale.com>, 
	"Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>, 
	"Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Vinod Koul" <vkoul@kernel.org>, 
	"Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, 
	"Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>, 
	<linux-arm-msm@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
X-B4-Tracking: v=1; b=H4sIAAVbkGoC/yXMQQ6CMBCF4auQWTMJTi0Qr0JctGXUAayko8ak4 e4WXX55eX8G5SSscKoyJH6LyiMWHOoKws3FK6OMxUANtU1PHQoFHO8O9zXyggu7Gb3tLREdTWd aKNc18UU+v+xw/ltffuLw3FuwbV9sRvTUeAAAAA==
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Thu, 27 Aug 2026 23:43:09 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_084325_311095_D2C03B45 
X-CRM114-Status: UNSURE (   9.34  )
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

Three I2C bus drivers request exclusive DMA channels before
registering their adapter, but none of them releases the channels on
the probe error path (the remove callback is not invoked after a
failed probe), and the at91 driver never releases them on remove
either. Same class as 777979e62711 ("i2c: mxs: fix DMA channel leak on
probe error"), which used devm_dma_request_chan() for mxs; here the
drivers own non-devm state, so the fixes release the channels
explicitly on the error paths.

The three drivers are otherwise unrelated; the series exists only
because the bug shape and the fix shape are identical.

---
Shengzhuo Wei (3):
      i2c: at91: release DMA channels on remove and probe error
      i2c: imx: release DMA channels on probe error
      i2c: qcom-geni: release DMA channels on probe error

 drivers/i2c/busses/i2c-at91-core.c   |  3 +++
 drivers/i2c/busses/i2c-at91-master.c | 12 +++++++++++-
 drivers/i2c/busses/i2c-at91.h        |  1 +
 drivers/i2c/busses/i2c-imx.c         |  2 ++
 drivers/i2c/busses/i2c-qcom-geni.c   |  4 +++-
 5 files changed, 20 insertions(+), 2 deletions(-)
---
base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
change-id: 20260827-i2c-dma-channel-leak-b58522243736

Best regards,
--  
Shengzhuo Wei <me@cherr.cc>

