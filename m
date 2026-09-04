Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB488C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8im8PClxGl7lgHdzbONpMSKT2jRICkKmM0EvGV5X+0=; b=0ICXvHUeOIaqOyUaqaIXp45/K2
	f1XSM/PJv5/trpH24Wn5dPV7GCZ4YFqgCzDQUpz8M3Pd6DW/AtMKSgQ1imw7+XRCRDBBmHhp5X6lh
	UcaPGGiT9tyXX0ePt8k3DuXRyRk/OPoXgfRVr09QhDu1d8ki5trmT7ZEg0fEgGzEHaBHURfpovddL
	4Qrc2asWmkHAFgWCdBr87Nhz0nzagow8g2601OrP6zi8H6j+BC7JhDVe+yUjuE0gFJgzgD1cdBamD
	14LHdy/kIecRp6p1sKpsYGo62qpTyCXSmZHpIz2a5QV1MpFT3IUlvrVs0oibAmbA5kIgZShTJy8Uh
	4SxZ1YGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2T95-0000000232Z-4A62;
	Fri, 04 Sep 2026 12:35:52 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2T93-00000002327-0lRp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:35:50 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1096514a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525348; x=1789130148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8im8PClxGl7lgHdzbONpMSKT2jRICkKmM0EvGV5X+0=;
        b=bYPojZlcjVzlhIPMJrdC0GJ3d/BkC8JqUHMJtxDPnsBDkCGSI6orC3Ha5BZwfs7h0X
         B1chigWnyDJ1nms7A7WaeipjjLX2vqfysdjMPQ9kfi87Xc2FPxzw9HVw61DUN7dCJW/0
         JRWk+bHp3+/iOVIu8XrPWFrfSN1GNPtMiMXpyBZ+TXtWCSR9v0W+6qC89B2/IXgQi0iG
         O4hdf28NobQzNK2D4VR9KpS2Lu4wFFofHYIB9vY/TjHBuw82o+c/IezBujyi8jypciTj
         v9Ro/hPaCqU5O+hwXHQlARCIeZvzit+KmGcFsuwlXsL8czilPTLFouXpu/Q9klTw5AY8
         Y0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525348; x=1789130148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z8im8PClxGl7lgHdzbONpMSKT2jRICkKmM0EvGV5X+0=;
        b=dO5A23t4Zjz8SFlb/k1a0CwaR8otHv9FLZGdbqkJNjcwYDYszz/I/GfSUpTQUicqMX
         BU91zGW1nqig2ZtjcRAjOEmzoG1p4zQEmAmfLG8qkydw4F6EIwANYd83B+11VMkUtdeJ
         x/Yai4ODCARuWBvdKf6l7bzaEUD6mn4aLcEdorOzLXqEPil6Nsii9DEvblAJtP9EJw+W
         4uPWRUyGj3Nejz3Sgij9/Y7r8sDRUElxQxGLGgj/SqBDg4Th4r0YcE1YKVqRw6otLloc
         QlFinUwOe7zEdyIXLHdDvX05KTRHu+AgCWF1DwJmiakavfZGXh5Hp0Tlbv60c4B4YQWm
         youA==
X-Forwarded-Encrypted: i=1; AKwUvBxUvMgdKwlHkcQzXnreVA8NmUnmK4XUcMd/Oz6PDXAF3yWiryNNM6JEW8qAmQvUGPWP5Teei1PqzCQVCecNijVS@lists.infradead.org
X-Gm-Message-State: AFuF++n4KAo6nqHdZqlxdWjL49pwpA2/0c07WurEd7LrktzVUxbzHwCe
	lWi/SyxD58gu4XWRRRMJGkVubIEB/AOUjcRB6vtV6VdxA+rtH27yvk2W
X-Gm-Gg: AYBFou2haCW6OgwH39lhdS6w65rdVpmmnkP/8qSFlKdnf4VId0/VeEOJYCVAEWoajke
	fq5VvWuX96qQ+96B9Q3VIRpWcn0tEE4TFqazT3NZ6rYC5KwGHhs84n/p5GBxdv+y3dTMxgr3qKl
	01SVGT7jwQqHjnTEkYMagyAQCxeqlsPYYQkOSc/fqETOiGLdZnWh+aLbNRutWqaS4S53a7IanfO
	rCDdhEoRjbkyYTrT4o1VawXnywz+jac/KDtjwV4iNVPZ7atwCAkhP2bGZIox1XfGlvVCLk702tK
	X9jfbUqAEIOA0XDmqSKGyIZdqOKjMP0rNnedoLH5e5fhhf01cwLO1joMa7vGqJAPCdmIEO2Os2D
	4p8HmQ1HWrogIsxOtwCACKoxK0BLgepgRSFkZhnTswlNlNA2Ej06sgpLK4iWkt7XQTFCHuttY2w
	ewoadCl1eUcDjXEHVgQzVIGzRhk3N+tuZuvknfqObDhyEF9PAobFru9IHzgA/pVipp8wEIncBEm
	7A1h8V573DCqzs=
X-Received: by 2002:a17:90b:2687:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39b2609f768mr9755672a91.5.1788525348223;
        Fri, 04 Sep 2026 05:35:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm6229374c88.1.2026.09.04.05.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:35:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] firmware: fix typo "upto" in comments
Date: Fri,  4 Sep 2026 18:05:38 +0530
Message-ID: <20260904123541.38602-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904123541.38602-1-hemanth.selam@gmail.com>
References: <20260904123541.38602-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_053549_226954_36A9F104 
X-CRM114-Status: GOOD (  13.19  )
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

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/firmware/ti_sci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index cc747ab0237f..94104edba9a0 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -4050,7 +4050,7 @@ static const struct ti_sci_desc ti_sci_pmmc_k2g_desc = {
 	.default_host_id = 2,
 	/* Conservative duration */
 	.max_rx_timeout_ms = 1000,
-	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle upto 128 messages! */
+	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle up to 128 messages! */
 	.max_msgs = 20,
 	.max_msg_size = 64,
 };
@@ -4060,7 +4060,7 @@ static const struct ti_sci_desc ti_sci_pmmc_am654_desc = {
 	.default_host_id = 12,
 	/* Conservative duration */
 	.max_rx_timeout_ms = 10000,
-	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle upto 128 messages! */
+	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle up to 128 messages! */
 	.max_msgs = 20,
 	.max_msg_size = 60,
 };
-- 
2.48.1


