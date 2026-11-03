Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB779606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mGssYWtI;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oBTnmWl9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yGT4gnoTr/m1A1XEiS0S3UY5LeCHkKhSuJJJVlqKjmA=; b=mGssYWtIPCs35WhzwDm1NNZgck
	imMgpopjuSuc8M8HbRvPaFl1DOm9v/461tv6Txi5KvimWT7t3nTDhJy5z56dO/yjocKorlcrWVZKh
	vlOb9OpyniTRYr9DvPmWiS97B5Sr5X+eIzAL+yIbeIGlDQHSusbq3WNvkcPE6hveZTf9+uBPvFz2Y
	xjzArh/wLiejOIt7SaKLS9tRkxkIM6Y8Uo41mbp2bMoU6xVySQu0YmhuyaEOHZHJ3RR19kQHKHs0K
	Uk8ysdo0/304w3lugVyS1dl72DEngAOFM7V0BFNhA/hjJXYvyG67VDmWtW9K02P3ibDpB3SjmTMs+
	ScZ+xaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAD8-00000001dPI-12cL;
	Tue, 03 Nov 2026 08:49:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAD3-00000001dNy-2BFd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:49:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EAF344E413C3
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 08:49:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B81686046C;
	Tue,  3 Nov 2026 08:49:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D25810328ED0;
	Tue,  3 Nov 2026 09:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793695774; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=yGT4gnoTr/m1A1XEiS0S3UY5LeCHkKhSuJJJVlqKjmA=;
	b=oBTnmWl9af13vZBlfaeG1iArN6MubXIcl1IywJhX9v9U2qx64VzMuYUx2TyddG8BiPZ1Q+
	rIUJDIC+9Rd2vy75A4V/EyRCitMDwG3Ouvk7wgvBGUpaGwmIas9mb79jXeXZLz9vYdBt3V
	Rb5/wm4tAgGnb8uD3zcfTcW/krPh5M3433rRUTSYnOnxs0aGMiFS76IPZT1ZQfbHW7RWKG
	vhMqFhz44l75PL1wjQXEtTp8RVCiLuI5BPxBWx4kD/Ke3VQSCBxsVQkvixMx2XZlQCFY60
	yZ3M9LmLn9WF1b9eEx5g5L61/vD5Ji8zZ5xfSr3OjCGziCEIHXl9qmrLfg98NQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH] clkdev: Improve clock discovery with clk_find()
Date: Tue,  3 Nov 2026 09:49:15 +0100
Message-ID: <20261103084915.8405-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_004937_697091_D025B41C 
X-CRM114-Status: GOOD (  13.14  )
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

With a setup where a clock provider registers a clock with a device name
"mydev" and a clock name "myclk", calling clk_find("mydev", NULL) would
not actually return any match.

Update the code so that we can support this while maintaining the
existing behaviour:

- clk_find("dev", "con") matches in order of priority ("dev", "con"),
  ("dev", *) and (*, "con");
- clk_find(NULL, "con") matches (*, "con");
- clk_find("dev", NULL) matches the first case of ("dev", *).
  Note that in that case we don't handle wildcards for the device name
  or it would end up matching everything.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
 drivers/clk/clkdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 919fc680ae4d..ee6c0afd6ec0 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -53,7 +53,9 @@ static struct clk_lookup *clk_find(const char *dev_id, const char *con_id)
 			match += 2;
 		}
 		if (p->con_id) {
-			if (!con_id || strcmp(p->con_id, con_id))
+			if (!con_id && !p->dev_id)
+				continue;
+			if (con_id && strcmp(p->con_id, con_id))
 				continue;
 			match += 1;
 		}
-- 
2.47.3


