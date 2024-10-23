Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4C9CF5365
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJNXHF0VHu7kbpuItfAcI7Rgm0r0TbZCkUNZfFQ8BfU=; b=2F6qvfLcWTw8AhU18fgGXLHz7U
	xTo+xwGSQci56NiPg1+fc2XwfFlpt+VNz5c+GiNki/J5IFtkTK6LDEXI5TduIyxXJCkZ5ZeqlbmY/
	TttD4aHOCodNq7ESZn5Y8UjbbSH1tWPQKgKhjWIjsoGVcSkTadRCBjpqdJckBNQQYmagwtV0iL2xg
	UsUKasmog08P4y+9FeT09gYEaXaPSCr0Nm36XW6lOZchcRmkjf1vxJEw1r9yfraI7MOPL6XVDioK3
	pXWThmA/KWEwZ0wQs2XboMIN4aLA6bpTnFRt0Nju4FvRs3JiW7HWek/3Wfa8fAKjqhq28D1N6g1hL
	FzCo2LWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLO-0000000EIMM-2eIa;
	Wed, 23 Oct 2024 12:20:06 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3a2a-0000000EFQa-0YWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 12:00:41 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20ca388d242so48229635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 05:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729684839; x=1730289639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJNXHF0VHu7kbpuItfAcI7Rgm0r0TbZCkUNZfFQ8BfU=;
        b=Eu/rL9RSPLL2DrsEYy4LLOYwQoS+SEHRHADQJ/DBHClBUbH4RS1DEE2dHxJe0qwuoD
         EyGe7JWyz3Qjp9xrE6q0K9O6e+bqc+d1JRVQGnziXYxBIf+O+E/kG1HV5zawV7IfV6f7
         HDMtn65aVIEvWTtY1F/QZuRbYlarEBuRx3ll4lomeqUhy+jUH4fsvDENl0ZbN7nyQFMe
         NGtcaJt/Mw5WnvvAMArBClklDlzfmwuRhFs1Z0iMOm2nK+YfF3wm+X2l8jFdfPueNaGQ
         TJww/krS4oonsddKK3JLPVZfx+G2MyGgkVacnVfcC1n5tDhpNS8uPQ/bSwejxJFs903k
         YkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729684839; x=1730289639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJNXHF0VHu7kbpuItfAcI7Rgm0r0TbZCkUNZfFQ8BfU=;
        b=HnIgjWt7nlzWwVy/DHDYjDqIpWfsxb5Qrtis+o/W7Nf0Jd3cgahZzohz7ipnvWN0k1
         qMbGUgHqPsz1acZYeat2A9McZfTR6W7Tiqt3F+nr+knn02Qqpb9KDzOB1MuduW0J+pq8
         x0FOQuGBDa1CHS5u9RHcHpQYRTTNuaV4XZeInuVh7iveM2AwV3/gm/zPdP8r7GPM2wVN
         Wm2DstKORY19R6azkpRiRBEBOexftoNPe2CQMfiA8yzBGehv8nh/6/D0sbctaZfFRtlr
         W8/BGTmzpjCAyOyBK79qCpVx0A+tdnJ+VeKeXhCLoiNQx4i26NvEvD9zTK1HgBL0MlQY
         jUGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyjbsAEgsmvpe2XjIELZyrYAf5PlPGkxjE1Wd9+WF0g+jnuummHd4aY2OVuf17um11LMDrh8VsgRpBrm1+7Zap@lists.infradead.org
X-Gm-Message-State: AOJu0YyEfNsxpreMtM1CXmf5alDPqWajewkQdzCs8XckGYpGheWEPck/
	+LhoSgrYob5nT3SBFFczkkMGFySY0iLzzhJsbxIiUFQbh21MJ++f
X-Google-Smtp-Source: AGHT+IGKZ9kKamJtXaXuqPYYC/YHkGi7wGCxH1F2GY/K/ywqS859vhdAXMa8nE5cVNyg+egOXi5EDg==
X-Received: by 2002:a17:902:c94d:b0:20c:9821:69b6 with SMTP id d9443c01a7336-20fab2d8502mr29487225ad.58.1729684838947;
        Wed, 23 Oct 2024 05:00:38 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3468:366c:e529:6d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f3665sm56598825ad.271.2024.10.23.05.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:00:38 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	linux-spi@vger.kernel.org,
	shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	lukma@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] spi: spidev: Add an entry for lwn,bk4-spi
Date: Wed, 23 Oct 2024 09:00:14 -0300
Message-Id: <20241023120015.1049008-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023120015.1049008-1-festevam@gmail.com>
References: <20241023120015.1049008-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_050040_281081_07A81A72 
X-CRM114-Status: GOOD (  13.33  )
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

From: Fabio Estevam <festevam@denx.de>

Currently, the compatible string used for Liebherr's BK4 external SPI
controller device is "lwn,bk4", which is the same as the board compatible
string documented at fsl.yaml.

This causes several dt-schema warnings:

make dtbs_check DT_SCHEMA_FILES=fsl.yaml
...

['lwn,bk4'] is too short
'lwn,bk4' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
'lwn,bk4' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
'lwn,bk4' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
...

Add a more specific "lwn,bk4-spi" compatible string entry for this
device to fix the problem.

The original "lwn,bk4" is kept to keep compatibility with old DTBs.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/spi/spidev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
index 653f82984216..2b87b9ae56c0 100644
--- a/drivers/spi/spidev.c
+++ b/drivers/spi/spidev.c
@@ -705,6 +705,7 @@ static const struct spi_device_id spidev_spi_ids[] = {
 	{ .name = "ltc2488" },
 	{ .name = "sx1301" },
 	{ .name = "bk4" },
+	{ .name = "bk4-spi" },
 	{ .name = "dhcom-board" },
 	{ .name = "m53cpld" },
 	{ .name = "spi-petra" },
@@ -734,6 +735,7 @@ static const struct of_device_id spidev_dt_ids[] = {
 	{ .compatible = "elgin,jg10309-01", .data = &spidev_of_check },
 	{ .compatible = "lineartechnology,ltc2488", .data = &spidev_of_check },
 	{ .compatible = "lwn,bk4", .data = &spidev_of_check },
+	{ .compatible = "lwn,bk4-spi", .data = &spidev_of_check },
 	{ .compatible = "menlo,m53cpld", .data = &spidev_of_check },
 	{ .compatible = "micron,spi-authenta", .data = &spidev_of_check },
 	{ .compatible = "rohm,bh2228fv", .data = &spidev_of_check },
-- 
2.34.1


