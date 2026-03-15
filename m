Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71047F30275
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBcY1jNO230ersIPOAT9WM1qbuR7iZiog4/B3vVvee0=; b=zFI56FSplRu20+pq5ykf6Xy/Li
	XzfNyuFzoI+TydZGsJWkr6kHY0KedfxdC1JeD8SClDyJxJrePgBG3MF1YSmxU4RUCDyYKGz2uMzbE
	Fe9sfxkpvhacHrw+PQQqbiyr1K8FLQqCW8sa1M5malq4KPlhFbTyUcaJsqlEno25AZMvQ8wWObFx1
	svK8IO3WYiOt+BnQLvvd8fRh45Un5RNy7Rr3OhTDxlNUgBW+0phFSbfaGz52pAOkbRWxF27BaY9ni
	QbNS+fMy0dfHSDljeMPyPnAwmzwMz6lEOmXCPtEUdGruPvjxRpavcdOW00awG7RqbVuUGZuCgLM0E
	+0T+jypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1p5P-00000002lDP-1fTB;
	Sun, 15 Mar 2026 17:17:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1p5K-00000002lBM-2RQ1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:17:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439b6d9c981so2673004f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595021; x=1774199821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBcY1jNO230ersIPOAT9WM1qbuR7iZiog4/B3vVvee0=;
        b=abXjmK8m8g1UvDCM5JNNElOv04reXoGI+/AeoFc/YhF7NGPkWwtrL7cgYv47kh5ENE
         pu09pKDsH/T/8IZvx1+AmQMcQV+hrdsHOsuNdk6SifNyM2VreB9oEDKlRPkR4gumdahU
         97/KKdECKr9MLKSc/9IW2P4d6o/aTKM6GjgmfXn6ExgZg2L2UREES7mjxmRooRbPxblE
         2t4sNwkgnTJvoyhEDQv8flJ1KrjJXC3tyi8WMKrHGKZsyq+YtOHfs3jnz+sJZ6yrV66G
         gVnmF7hgdVcxX6jKL2Pw4KRgBuDfp+c5UuK/q00w9KTeaSmOjLOuQVPj6I/DVCJj9hi1
         XyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595021; x=1774199821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBcY1jNO230ersIPOAT9WM1qbuR7iZiog4/B3vVvee0=;
        b=TSh2iqSTYeFtXC1AheEuq/VTsWqYapLAqfvNamRRUcODFB9ksCeb+2OnYCTgvgLgz0
         uQYDrwp8fNhmcuD/Q92m2m4UC/FfpXon2WkS09DGQMDZ1sKOkm4adoYrdET9HTF6mk8g
         FCulIY1zW4btNMV3i5/KvFFoL41Htkia22ArllDhXnTmqD+GdwF84Q/Z0z/Dclrb8u+T
         ftSS//Mvjn3EsnVzlmyuRYvAeJRVLpJ/hBIeQ7g+Wrx/a516BLp5gOzzCh3OfjpZBrUU
         xBfDwBXXcl6L2AIYXp1xN8fMc0q/hO1b8ezKI0AMquHcMTFlXvhGsxcnHzMUwSh3qDY6
         HDpA==
X-Forwarded-Encrypted: i=1; AJvYcCVauVt85nm0I5jrnRGKAyRAVCk77OyDsnHB8poqGgG+cq0Khn5cKxvEV2xJxtA2faf9OR+p/BGddWrjyLF4cTtN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7InWGu4kdW4QCOjRr7vChc/sYFPdgJedP7nuSTs8+2/yEjlS8
	njNpMtxCnSaui+TX5ecOZvxHvb7Ww0NCXhXinkv2Gg0UuHaBp7sHX1LZ
X-Gm-Gg: ATEYQzxnFtB0uInTtsHmCuHoD0eL54INtBFbk4N5rwNp2tmG1xZhhmJ+nQuJs+hX9Lz
	UfCzjgpdB6ViW0C8oI5LSrt7g2IVQlxIvrbyESYZlQb7Nr15LQ/GJXNKa3BOuDjYR1xvawRkN/n
	szSFHt/jBuPWIPuW5kvsHD2NlV7XiioaJjoSYvU0Ncb0s0y9v2UwN1iOKJ2A5wvg/MNi3GQ+frQ
	QLXDyPhEySnNRLM4F8jkSIsYMiMhDChqDokIeT2KRgyNxqdS4KYhny5ikXHX8usX58+IRv77Z2z
	Koudtk3mDyUls5h0RE3E1QtTRIDJZsFecYgD/3CCfQFusQdX072ADTTXN9NqRqly6bri9RSpnFb
	BC9sNLoc8pZ0gaDeho0N13N9+woWlx4Zn9ZAEAIQsakKDEQPSS+h1BUh27bLkVAOR3/LozfZ9E6
	NjT7eCskI6fyUWhDGF+lQ9Pj6BPKID//SRTg==
X-Received: by 2002:a05:6000:40ce:b0:439:d74d:a686 with SMTP id ffacd0b85a97d-439fe1ae6b7mr26631100f8f.28.1773595020567;
        Sun, 15 Mar 2026 10:17:00 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm40536429f8f.27.2026.03.15.10.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:17:00 -0700 (PDT)
From: Adrian Garcia Cicuelo <adriangarciacasado42@gmail.com>
X-Google-Original-From: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
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
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 2/3] rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
Date: Sun, 15 Mar 2026 18:16:51 +0100
Message-ID: <20260315171652.269020-3-adriangarciacicuelo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
References: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_101702_634707_07EEF2C9 
X-CRM114-Status: GOOD (  12.37  )
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


