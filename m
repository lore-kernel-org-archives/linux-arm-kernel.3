Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20170606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VTzHEI78;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=l1IxLRPC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gx4a5PtxLdTskMqbqHdRE6WcTaLjJR+RWT06hGvA3x4=; b=VTzHEI78gjHFeC
	FgxwQGCxkfee6+pZG0/d4jHU60hQ5U4uqfVURNQW7j6w4XBqRRrUn5h9d2nvo+YDKAA4y0GIKGO0O
	l+cGXFkHNBgVmnm77BeK+sJOIJJZ6v9n4x7JXbpb9YkprozqVP9/RFwUDdKWZG94uHI9La7K4oalz
	OEdv321szKuYEekCchE6j4dQSQN/kqo5yLSAxlxhfIIApthhhPLNFhMD1qafeY/KF80hn3bLoeiEB
	BeZk8E9gptg5020x0QeXTWc4WOUWIehcQLT9k2fX8PnZSHK2vLIoZqlcVjrZNBIgWlL7qf+hAP0gR
	ibctwnNyC4yfnw0OicRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyYa-00000000IxC-0cvn;
	Mon, 02 Nov 2026 20:23:04 +0000
Received: from smtp-42aa.mail.infomaniak.ch ([2001:1600:19:38e0::42aa])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyYU-00000000IrO-2W15
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:23:01 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJNRx0r5wz1YT;
	Mon,  2 Nov 2026 21:22:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793650972;
	bh=Gx4a5PtxLdTskMqbqHdRE6WcTaLjJR+RWT06hGvA3x4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l1IxLRPC1tRvaf0Tmzj/t236kJyMBy8xSGm66UigBSImAQXRDIbyliNNfwCHvlXQe
	 h0h2RA5b7L8sAaEteNbe1MeUMP5Id64lJUzDiSCVz/z7A3tz7uoj7dDq70Osf3FgVO
	 gMLBzx/BH4EaLQsFbjz40gKtxlQjS3pfr11yqdbO6BjuqYHzaRBemC6DH8y7C8AOKR
	 Od9k+WpA2H44+yjgTHWMGAHMjAvSeluFEVFfciENimowbLZO7ZLPsFI6v+vg/zek6H
	 MH0kkS+iYVNqtyLuHA4RFXYE9k/UHBcYU/wW6JdG4Itf1S18KHlagHi3rEigW1asAA
	 HoecJfIkQb5sQ==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJNRw0t20zqRZ;
	Mon,  2 Nov 2026 21:22:52 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 02 Nov 2026 21:22:43 +0100
Subject: [PATCH v2 2/3] media: rockchip: rkcif: add support for GREY and
 Y10 formats
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-v4l-y8-y10-csi-vicap-v2-2-0a4149d96dae@cherry.de>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_122258_837119_0BFBDB56 
X-CRM114-Status: GOOD (  11.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Quentin Schulz <quentin.schulz@cherry.de>

The OV9282 camera sensor driver can output in those two formats, but the
VICAP didn't advertise support for them yet.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 53e62d0597648..4e172366f258c 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -95,6 +95,26 @@ static const struct rkcif_output_fmt mipi_out_fmts[] = {
 			.type = RKCIF_MIPI_TYPE_RAW8,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_Y10,
+		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
 	/* RGB formats */
 	{
 		.fourcc = V4L2_PIX_FMT_RGB24,
@@ -341,6 +361,12 @@ static const struct rkcif_input_fmt mipi_in_fmts[] = {
 	{
 		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
 	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
+	},
 	/* RGB formats */
 	{
 		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,

-- 
2.56.0


