Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CF5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcaBtUbqcaY+jhV54CgM/0KwutizUrkqiT6/VhUS7zI=; b=BnWo55FyZcgn4f/2EWuEYl4yu7
	TfgyaaidrmuZBKLA+xt6qQLK6kxIh2cMXrvyQOvkOKuaXDDs4glqn+2t4yBfciSMOfrGUZ4+SDiYL
	G7xDnZTozgq9S4BQ/bu7NRMCkddx9h5S7ntyozkgmIHVVKSv6x5r4kxDGUmc0QoAunpIg+l4S1iwj
	mG5lTKLdaqpsqwUcYpu4nYLPXNI371iT/gsbnAUam2x4AfmvrKFWBaLp9bzwnBWknU/oqukVVjg80
	54g4Wyozj/d2sLRA7ntcgde4x97J9CcLf0IFBEI7YJe5BjMZy9zAr10qO7QbLOMPpLmx8iKDQsFL+
	W8MxDFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXzN-0000000H4gh-2PMR;
	Tue, 30 Jun 2026 12:54:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXzD-0000000H4WW-2EBi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7CD843FA8;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0A55C2BCFC;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782824086;
	bh=r8e0kM4W/D8E2ftGWx1AFFn/6IYvXpTFrouoTgjxWWI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=E/kQUNJaYwMDQOkR1M88RDTVQkENI4Gd/iq3UXVRP1QfLEtIFrzIO1V/OVSwafdFs
	 udev73apm9HJ/W5UZWlCqnz5XTPNT5E4+515Mwv5DjVS+XXRQPd4pHsKVze0rm9jHV
	 cS/x5VwZN4+QV5QQAfWNq4iO3i0sR+zH3soFZLAeZK36kXj5HAZh4Fi39bwPLnsxR4
	 SPqEZD8XizYBdKNVdMSdjIivA2wtYiL1xG0Ag8/fXbjorC0Dg3AgwNQUEyz3g6ZjHd
	 ufhURfKwmRu1LkEA5FrVk3qWcO2j0ikjdMeRWTzv3nB+sq8Dn6fOQ/Av1jn3UeeNC6
	 MqooNPl24l+BQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D0FC43327;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Tue, 30 Jun 2026 22:54:34 +1000
Subject: [PATCH 06/10] soc: apple: rtkit: Add tracekit endpoint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-apple-mtp-keyboard-final-v1-6-506d936a1707@gmail.com>
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-input@vger.kernel.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782824083; l=1200;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=bN3yrDjkl9WQzPd0+ZiDDC8qRhUGrJL3vDZwtuyk+uk=;
 b=F3wNRoPaHLqPq5JGrX+geJ3sKRfXD9DJ8lDUdwzhplhgjDkgIcIt++FspWm54ohsMSn1wl/UQ
 eKgGQdqmxbPAWuKcXcWdhf5U03IZaH2GKPNEUje0wgj8gVOheUYmvhX
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

The TraceKit endpoint is a system endpoint used by MTP, AOP, and
potentially other Apple RTKit coprocessors.

Start it automatically when it appears in the endpoint map, like the
other known system endpoints, to avoid warnings about an unknown
endpoint.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 drivers/soc/apple/rtkit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index a3fdac8f6f06..1059b4bd8732 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -22,6 +22,7 @@ enum {
 	APPLE_RTKIT_EP_DEBUG = 3,
 	APPLE_RTKIT_EP_IOREPORT = 4,
 	APPLE_RTKIT_EP_OSLOG = 8,
+	APPLE_RTKIT_EP_TRACEKIT = 0xa,
 };
 
 #define APPLE_RTKIT_MGMT_TYPE GENMASK_ULL(59, 52)
@@ -191,6 +192,7 @@ static void apple_rtkit_management_rx_epmap(struct apple_rtkit *rtk, u64 msg)
 		case APPLE_RTKIT_EP_DEBUG:
 		case APPLE_RTKIT_EP_IOREPORT:
 		case APPLE_RTKIT_EP_OSLOG:
+		case APPLE_RTKIT_EP_TRACEKIT:
 			dev_dbg(rtk->dev,
 				"RTKit: Starting system endpoint 0x%02x\n", ep);
 			apple_rtkit_start_ep(rtk, ep);

-- 
2.51.2



