Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44340606D83B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bj7dDwLO;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=jGjGl/BY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kwaHvVSLNnlL8EJAB8gLTdFPA3NQtaUsH/86Rw3xZxE=; b=bj7dDwLOzPjiKp
	gWCPAuPZufS3+65v/Lf2unVPUKK14Dv1DGtei6RgO8Ytw6V1VhgnMvGKsStXB7dnbnAcMNiJsUfVW
	kwg+mEab4OgkzvABnqMTBXZ6CZmKvwzb+ZXrfjIcjX8WX5ZfVj5loFJ/PKyMZ9sFBd77+2kRtWHe+
	U+7JbhoQbyLyxm47UkAVaXsGVdGJD5sSdSVUJewTCP2GP+/AnT4ll2I4IOsXW3XLPv1LFulWNClOg
	kGBl2OOjUIcnf3T5tkP9BJZZB4JXNlM6hV5SSoCGDiC2KBuEmHyYE1JroCRuQZ6vVDWzB5Jl1hfII
	8+/Mxhkso3iPMKmGStxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9uH-00000001XkS-3RNE;
	Tue, 03 Nov 2026 08:30:13 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9u3-00000001Xbj-3rNE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793694607; x=1825230607;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=gNZL42AuWbEzzLyd7sP8TMmreDXdLL3QoO4en0rD8y0=;
  b=jGjGl/BYnlY8+hK+RJVu+eHgmwZ2WVO6yffzDJkgSz48jjlWFfWP+hZe
   av0v58XhLBxRBvlf4lpTHwKmi4q0HBaNHHb7Tf1cBU3aHTbJTd6gmZN2Q
   PS2vp8NU7g+6zQB2hLT0mc5jvI25YlRRTtikDBKvWi0gKMs8L9Qqs3Q4S
   KMh0o3klAC5tDtgBPTv4kI4whQcBBQNJIFPWW18GwD4DSXrNOYZc8Xera
   M4keMF/U9OzdP2eyTiGfxJe0DOuU4m0w+77dflji90tRQ3aiCv6NOA09g
   mBaZbaBZjZfwh1eFdRiEaV4wI35fQPq95Vo9kv4yqAbjRxEx4spFqQ9m7
   Q==;
X-CSE-ConnectionGUID: /jxLnuPQSRiIqrKHd133PA==
X-CSE-MsgGUID: hbf/goxoT6+DR/osT+eNlA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:30:05 +0200
X-CSE-ConnectionGUID: HIzJ9sgHSOaJYO2yzYAxZw==
X-CSE-MsgGUID: o9r1Km6qRjaGCMSP1ub6Sw==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 03 Nov 2026 10:37:43 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 03 Nov 2026 10:29:57 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Tue, 03 Nov 2026 10:29:43 +0200
Subject: [PATCH 7/8] i2c: nomadik: fix race condition with interrupt
 handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-i2c-nomadik-fixes-v1-7-655c6af2cb70@mobileye.com>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
To: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 srinidhi kasagar <srinidhi.kasagar@stericsson.com>, 
 Ben Dooks <ben-linux@fluff.org>, Andrea Gallo <andrea.gallo@stericsson.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003002_229647_AE19B74D 
X-CRM114-Status: GOOD (  11.13  )
X-Spam-Score: -4.0 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If nmk_i2c_wait_xfer_done() gets timeout on waiting for wakeup from
interrupt handler, there is no synchronization with interrupt handler
that may run in parallel. This can potentially lead to various race
conditions between thread and interrupt handler.

Disable and clear all pending interrupt requests and wait until running
interrupt handler finishes after the timeout.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 361a5fc6a587..cc8b5a357f06 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -505,6 +505,11 @@ static bool nmk_i2c_wait_xfer_done(struct nmk_i2c_dev *priv)
 		wait_event_timeout(priv->xfer_wq, priv->xfer_done, timeout);
 	}
 
+	/* Disable interrupts and wait for pending interrupts */
+	disable_all_interrupts(priv);
+	clear_all_interrupts(priv);
+	synchronize_irq(priv->irq);
+
 	return priv->xfer_done;
 }
 

-- 
2.43.0


