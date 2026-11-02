Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE877606D815
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q45ynuWW;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=f3JgYF6j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EDgvLGh0EsgZZ6Jjp0KRVHOntBTitbUy1XByH4rUBAw=; b=q45ynuWWCbinvP
	o6z6f9A8ylIkTvgEg6t0M3GXT+rxuDr9051SnVID0hNg6v+0Cj0ePI2uH/Jh6eIUqfF4asMauQ+W1
	8wX7fY79YZfJjKmXg4JX0qzsMLu0Wwzou7Z8YS7qVwQlb4El855hSqEid0AnyRRoytoUzeIIIj4WD
	0aeLWUl9Zx/SpBSqP99F7GYwxoPotrjXCv4MFiv+hx1fNSEv/GYqyvb3fgT0iRZluQGmA88FqBt3s
	ntcEC2yI2DETsNwAosy3sBXOF0lfgigDH2duTcNkxG1J9yEgPLQi2AqrOQcy9tNsNRnuNQvOp9mjB
	4FV4EJC6mDhS9ULnldEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyYX-00000000Iue-3ObQ;
	Mon, 02 Nov 2026 20:23:01 +0000
Received: from smtp-42ac.mail.infomaniak.ch ([2001:1600:19:5550::42ac])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyYS-00000000IrQ-3Oqk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:23:01 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJNRy0TQGzTt;
	Mon,  2 Nov 2026 21:22:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793650973;
	bh=EDgvLGh0EsgZZ6Jjp0KRVHOntBTitbUy1XByH4rUBAw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f3JgYF6jRTzxLGaYDh4ADs2tAlTJxXnU+6vZeIeK8tWUrYG/MDhCADWF1xphk79qK
	 Y/eADuyyhibUT+mGJZuNOe/Fvg6t8qasmnBMpbZcnV32CsGPssgv11Aco3h5ynIMMV
	 vdWvA1BhEjhU+zqNCWEYgfoQHcn4my+nwZ4O0JPluQldAfuwkXtGv3yABvOglTOu4I
	 HS8esLUTWijLvb77VSQCEXnWXzaHdPCfeqSS6Tc6OsKOTQHMRAksQ5kvwc1itpWjbA
	 qYF8J4jbB18hd8atVMmCs6TJfz1D4DESfoU58Sf43kG6u4tgxiZwTO1exT13oCV76C
	 5iX6/THiGPJMQ==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJNRw6W05zqwr;
	Mon,  2 Nov 2026 21:22:52 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 02 Nov 2026 21:22:44 +0100
Subject: [PATCH v2 3/3] media: synopsys: csi2rx: add support for Y8 and Y10
 bus formats
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-v4l-y8-y10-csi-vicap-v2-3-0a4149d96dae@cherry.de>
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
X-CRM114-CacheID: sfid-20261102_122258_830560_FD3F1CEB 
X-CRM114-Status: GOOD (  11.37  )
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
CSI2 RX controller driver didn't advertise support for them yet.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index b7247d597c9cc..9e99947a15252 100644
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


