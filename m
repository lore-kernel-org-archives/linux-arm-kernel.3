Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3C2606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nVVDVrH4;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CVb22o5M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6EsKNx+i/27AOT45Y7CU7NIo3IUkBxCrUdSGAbsZRm4=; b=nVVDVrH4r1ZmlY
	oUVx3wy1YL4DDgGnWKApaSxPB28ieb3rAXFY91z22kxsSSydbaUKFMKFrtRwBBIB9TPtCFEKnZFU0
	OE2KpnZGl3AZx0M/h6wO2DuTJLdd5KEUd54jrMeYB+Ap8LHJ3aVUbWVtm0VaPToLJKRzTFGEACvI1
	TBkbwOQt7MPNHyvicBfDGsxVNJAHIrZ+GNWT7SOD9MIO//L13QuEu8hbY2q1yo24W6euaigWojYYP
	v2Ex8sajX5k2+qhG/sfql8fO57APXLRg/IFVI5D6D+73xUPvZnc4G/MHDGy2RHTmJmF3B7zKAoyrP
	84jL7XLoUTj6Mh7DDtwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZpq-00000005GgK-3OvM;
	Wed, 04 Nov 2026 12:11:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZpp-00000005GfA-0wE7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:11:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F03D60F1C;
	Wed,  4 Nov 2026 12:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827D01F00919;
	Wed,  4 Nov 2026 12:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794280;
	bh=6EsKNx+i/27AOT45Y7CU7NIo3IUkBxCrUdSGAbsZRm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CVb22o5MeuxPtkYl6fYYqI1g8BE2dtuG9E8jQBTPP/QAhN4X+PPEcvCpb0LQ6DJMo
	 e6lcTM1/DwwfxmQYhQKfNDFIjyWI3or9dBC/ryYC1eLMNRlCd+wbU81XUU3DrP+8QU
	 w7KsSPFe9HeoL/jcHWdUsDZORR0eDM5kvF/bjnXn6dBc4fhRiIgZhbvdYMTPsO4861
	 +f63SHH12IbRoe8viAV9/pfG05ejYzlLRHsVwUHNIxAU0K1fYW3RSLUHDLT7EIWOwg
	 5BQSngEIVLDhHo/Vm5KiV4Wf7gBEpUDzHBFyN9V+hNVLZ+XDdYXSqqIrQfevsceM6Q
	 oJ+83gHwuVeWQ==
From: Michael Walle <mwalle@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Carlos Song <carlos.song@nxp.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 2/2] i2c: imx-lpi2c: don't treat a NACK in SMBus block read as an error
Date: Wed,  4 Nov 2026 13:10:36 +0100
Message-ID: <20261104121108.659820-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104121108.659820-1-mwalle@kernel.org>
References: <20261104121108.659820-1-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

An SMBus device might indicate that a value isn't ready yet by asserting
a NACK.
This will lead to the following error message which will flood the
kernel log for some device like an IPMI SSIF BMC:

   [    4.277005] i2c i2c-5: SMBus read count failed -110

Stop the polling if NDF is set and return -EIO, just like everywhere
else. While at it, drop the MSR_RDF_ASSERTED() macro, it's just one bit,
no need for FIELD_GET.

Fixes: efdc383d1cc2 ("i2c: imx-lpi2c: fix SMBus block read NACK after byte count")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index f57e800ac3b5..583155802e8a 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -92,7 +92,6 @@
 #define MRDR_RXEMPTY	BIT(14)
 #define MDER_TDDE	BIT(0)
 #define MDER_RDDE	BIT(1)
-#define MSR_RDF_ASSERTED(x) FIELD_GET(MSR_RDF, (x))
 
 #define SCR_SEN		BIT(0)
 #define SCR_RST		BIT(1)
@@ -594,7 +593,10 @@ static int lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
 		writel((RECV_DATA << 8) | 0x01, lpi2c_imx->base + LPI2C_MTDR);
 
 		ret = readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val,
-					 MSR_RDF_ASSERTED(val), 1, 1000);
+					 (val & (MSR_RDF | MSR_NDF)), 1, 1000);
+		if (val & MSR_NDF)
+			return -EIO;
+
 		if (ret) {
 			dev_err(&lpi2c_imx->adapter.dev, "SMBus read count failed %d\n", ret);
 			return ret;
-- 
2.47.3


