Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A79F30274
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBcY1jNO230ersIPOAT9WM1qbuR7iZiog4/B3vVvee0=; b=HfiorME3JV+Rjegug5EMBvmMAf
	S5aR0+3qOst5CRUods6r5SmCo6c5p0yrQIAJInxSyc7GXzg24cLxG3j5XlYLK3zgWuGJV2fAXYtsj
	YpbaUxSxm0fcPeEpmzUVVdRKprPDBc8+RVriCzpocx2xGxIRH4BC60X/Bk/TzWdKmDVg03KyzpVUZ
	9NkiwqQiJcPChDsQzLKQdcTbH6WRS+u9ZaGHbfT+Y4QgCeek2v4YXlCC7OH9f0mCnj3f4PQQYIj8x
	by0zJlmUxNstEDFgbyvBtKd1yg0z4xzzgxFQ6fhjjz8Fi/wk3VZG4+pw8qlYy1hg5LYrHM8FFdxnl
	4+BMlDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pDQ-00000002lsi-1TUG;
	Sun, 15 Mar 2026 17:25:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pDL-00000002lqL-3M0G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:25:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48541edecf9so40985555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595518; x=1774200318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBcY1jNO230ersIPOAT9WM1qbuR7iZiog4/B3vVvee0=;
        b=Rav20hx2V04xjdpNrfzd77yJ7Z3L+leYPQ3y0c+LuU3Bx47SdcvOPGU49biicLy5Mt
         GevX/uLk+WOs0zx54oC2ekWEcJk0be6StooTDiobpGT9X41f4Ic5jfoKeBa+kt2a3vlY
         m59VxEztHDnSWc3Yh+8FATy+lYCscx6XSCyeJQHjPVhEes/Kujx1SOI1vRnQBfrAdnC0
         MeZp5Zf9Tjh4mBGph1h79IGGNLbQEKFFU8rk1t6dgT+7b/9fc2a20lla9e2F/3oaP3bw
         5Obs5oPP2rckDgOakcyxR5d+K7dsMWaaCpzay75GiRPBT6hoRpMxryu4qensFoz57+lS
         QEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595518; x=1774200318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBcY1jNO230ersIPOAT9WM1qbuR7iZiog4/B3vVvee0=;
        b=sCOeLfcWA+EH85hvCd20uTGaUFw5vOUM0MU/r1wnAZ6omfUtjV2CoHDqfTAG+xQRad
         BIi+VlSIohwB92+jrWFOpgnhUkLijxoaykmxM9+QsMncVeGVxq9lb76bH4Re4pvi78AF
         46nAAxIl0HIQG/HH6NzEXPtkQ2/LdJqgQR/4ZcOAkiMksC2iluZxB9J+l0hp0M6DLpqd
         nOOs0JJ9ig9vdq55wl5ABfj2ftBoS0JWruYl8sAnDQTd3LIvYbQ/rNmCGIKdKcGoIvtl
         U56sUnagvE0gyAezxY26v+NRVLymXgLI2mTzJiaUIRbB8pazOebk8Td3Rxe/RkjiV43S
         7eow==
X-Forwarded-Encrypted: i=1; AJvYcCV2U1R2CQ7PkuKbMb57KRD6qlit/8w0p8G97fRilvUX2MLctAOFoR7yL6VpbqEZN/vRfBO7dz/2HwZ6y+twss0/@lists.infradead.org
X-Gm-Message-State: AOJu0YwVBfxPj/XYp3PPV7R5cxGURbOHSSU2NwQcqtJSf6n6N1WflKp9
	xJefPtWIreA+pN8cBg8tobzUt3nDQoyAESNWYLcHkoRRF78JkPYi+Mxf
X-Gm-Gg: ATEYQzx+TJVdF4B08rN2iN4z9V0G3tVDVyBilJek604ABDzAgy5Pg+pfO0fpD4M0YP4
	MoAFzd1onkgZHeDg0xK65gh2iya32U9nFbSlOXNcZGb8FMs3q1aLteDnwiZkp6fbCidQLIvX+JL
	zBKWp1bPacXd2yvL1ToToD7m1yhsu/YiLg4wyiOnyMawb1tkueboafF/ycVC9E4UtgH9AdIC5a/
	w8gJYgOH/HKHThASb4u93oEUOtTzoTNvc3XfbEJ8alAsCfZtahci96xXyz4PuoGCmEEJMEvaory
	6kYFyZZ6+DMSeDw2UathcHMjZnAkBYiHVUNTj25OrGigCUzoT5uRtr4jQkOsOnTYSjgRKSJ8Mbl
	r9U9wFT0drXs4SE9xzRy4I1Vl32+kzbSHxL9IkAm8U0P9Hlb/nRz2gzy6N3UmMIAqnRIkDXESJq
	eb1rfAQ8ZpbSjHrgzxilbY0AI5RE3DfMuoFjA=
X-Received: by 2002:a05:600c:8489:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-485566f7a2amr181338655e9.17.1773595517762;
        Sun, 15 Mar 2026 10:25:17 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm457168325e9.3.2026.03.15.10.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:25:17 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>,
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 2/3] rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
Date: Sun, 15 Mar 2026 18:25:06 +0100
Message-ID: <20260315172507.270480-3-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
References: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_102519_870703_68735FBD 
X-CRM114-Status: GOOD (  12.48  )
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

Update the Rust rnull driver to use Pin<KBox<QueueData>> for queue data
allocation. This aligns the driver with the latest PinInit zero-copy
initialization abstractions in kernel 7.0 and fixes a type mismatch
with GenDiskBuilder::build().

Signed-off-by: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
---
 drivers/block/rnull/rnull.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rnull/rnull.rs b/drivers/block/rnull/rnull.rs
index 0ca8715fe..23df23936 100644
--- a/drivers/block/rnull/rnull.rs
+++ b/drivers/block/rnull/rnull.rs
@@ -54,7 +54,7 @@ fn new(
     ) -> Result<GenDisk<Self>> {
         let tagset = Arc::pin_init(TagSet::new(1, 256, 1), GFP_KERNEL)?;
 
-        let queue_data = Box::new(QueueData { irq_mode }, GFP_KERNEL)?;
+        let queue_data = Box::pin_init(QueueData { irq_mode }, GFP_KERNEL)?;
 
         gen_disk::GenDiskBuilder::new()
             .capacity_sectors(capacity_mib << (20 - block::SECTOR_SHIFT))
@@ -65,16 +65,21 @@ fn new(
     }
 }
 
+#[pin_data]
 struct QueueData {
     irq_mode: IRQMode,
 }
 
 #[vtable]
 impl Operations for NullBlkDevice {
-    type QueueData = KBox<QueueData>;
+    type QueueData = Pin<KBox<QueueData>>;
 
     #[inline(always)]
-    fn queue_rq(queue_data: &QueueData, rq: ARef<mq::Request<Self>>, _is_last: bool) -> Result {
+    fn queue_rq(
+        queue_data: Pin<&QueueData>,
+        rq: ARef<mq::Request<Self>>,
+        _is_last: bool,
+    ) -> Result {
         match queue_data.irq_mode {
             IRQMode::None => mq::Request::end_ok(rq)
                 .map_err(|_e| kernel::error::code::EIO)
@@ -87,7 +92,7 @@ fn queue_rq(queue_data: &QueueData, rq: ARef<mq::Request<Self>>, _is_last: bool)
         Ok(())
     }
 
-    fn commit_rqs(_queue_data: &QueueData) {}
+    fn commit_rqs(_queue_data: Pin<&QueueData>) {}
 
     fn complete(rq: ARef<mq::Request<Self>>) {
         mq::Request::end_ok(rq)
-- 
2.47.3


