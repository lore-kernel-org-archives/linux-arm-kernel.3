Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D98CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy9U0bG4fRIRlqiXJDykXRQp/u4OIoI8vbmr2tAGcYc=; b=N8Q11SuLK0ac6tcBOvNQ1X5b49
	II+IQVy0OZzewGklPt2/vuXTzFKekX+ec/Jm2rdWDL+zu/rnvoQiJCoEzqqg5MBgccdqsDNNWjt7K
	lb+6gBYYGV8Jb98Y5u541AWrMRhWJUwB45IpW5lsH37oW5XXVjVZl4ZRwjaDv9MVDRu7vOQTy5+S7
	Awnfl/F4bDH2jeNCiCVGZDxyhmG9y4QGSQDJYqsjeZGIeSi+S9L6bqkbwTvgL1SlQYP3N9cpDIZI4
	2Hq06OFtYFuxKTXGieqaIz2b0VP7SZ8vbWdpmXskeC7Arym/3/r6FWzEcxe6SXImyq4z8yOPwujRr
	UnEzIhhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiAz-000000033nV-0zkq;
	Fri, 16 Oct 2026 13:40:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiAt-000000033iK-2LGS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 13:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Qy9U0bG4fRIRlqiXJDykXRQp/u4OIoI8vbmr2tAGcYc=; b=ozrDXfYMpEi6N2W6zdFLuIywRC
	Q+GE+dbW1Gq05DYJ/7DhNQU7rDpB2Cf7GMEEBsMTlQxDkHWcL1HRp5Pua6UuH10WqwTdlgxEr98jP
	SqJOMMfk59NCV52qdUgDutLcb903j+umbfQygTmHkRcRdPMXLCRaKP7Qk4H/uA/sCkopqQJwbGCIP
	qlV4kKP9yt2G+oZX+fVW5ZvGszsQ0m2ADhpqC0UuBoFCfSREB2s1gaw/DNmPZVXNR5mYmTClP2K9+
	xUPp3hEJHhMAjd2+CplRtvwauubD1SB99bFMy6RAb1EPG5YX29lu7d6UKuOM4v/jxYhoi3HKc3hBt
	ZELKzt3g==;
Received: from smtp-42ac.mail.infomaniak.ch ([84.16.66.172])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHiAp-00000001YZO-0hXV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:40:42 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j5mKc2PFjzcQp;
	Fri, 16 Oct 2026 15:40:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1792158036;
	bh=Qy9U0bG4fRIRlqiXJDykXRQp/u4OIoI8vbmr2tAGcYc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hh5149DuwUXmaq2dZwmroDWpjTHfh+z2s1E7viZ2WaxW2Yg9LBFxF0zDgJq06VNZp
	 OEhUGqo15ZRvRfYV88WV9xc/0TBFH19A/it4Hda42mVv+oVSUGHs056R7zoUZCyfm5
	 TnKuiMzBoD2NJlovJgc9rMD/pWFykIHLVJxvobM3m+cD7vTecqyi3at8VTyWlJrYu2
	 LPT1uVnJo4qG1utJPCGjK1VcZ6EYSuViRErt36PldsHYocZeWVQALc9QRoQDLivOmf
	 Ydt8cqN2GUsahMjfaE2vfRlsW/q6udthI2n86//lz5eURYZ+RBVBJcjKbvccmQ4KwT
	 J/C+x67+8+tzA==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4j5mKb2J0nzFpT;
	Fri, 16 Oct 2026 15:40:35 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 16 Oct 2026 15:39:59 +0200
Subject: [PATCH 3/3] media: synopsys: csi2rx: add support for Y8 and Y10
 bus formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-v4l-y8-y10-csi-vicap-v1-3-27bb87aa745d@cherry.de>
References: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
In-Reply-To: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_144039_316987_CB35F56D 
X-CRM114-Status: GOOD (  10.26  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The OV9282 camera sensor driver can output in those two formats, but the
CSI2 RX controller driver didn't advertise support for them yet.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 41e48365167e5..d8c6377235506 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -198,6 +198,16 @@ static const struct dw_mipi_csi2rx_format formats[] = {
 		.depth = 16,
 		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
 	},
+	{
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
 	/* RGB formats */
 	{
 		.code = MEDIA_BUS_FMT_RGB888_1X24,

-- 
2.56.0


