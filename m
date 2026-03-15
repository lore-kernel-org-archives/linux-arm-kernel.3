Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E22CF3026D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dhH5M5FJNqVSup5S7MKNqMM3K7FwdoGd3zPkVDPQec=; b=BmzvXSAyGCAmk16ZYoqUwVJQc5
	ivXujRpD3D5tDu+E7b+XY/8AHfIldl4qe5xD4Aw18ZuwSTzhByuAuT3VNaAyO0qlAphv/6yAllWXd
	4m8NnavpucBqi0riUVzZtxNk0RzfgBqw6b0RHl5C7TLafxHqgh/RBJna+MyIBIqdlaiT4ab6cKMBm
	ad7eEdsmzVIFjZacC6+a4hphst1t/ZR7coJIs+ENQd5InYTEFBWDCLrw7Z4I6G1FRvZ3N7HsJu8WK
	I3ZvnAmvZPEtfYRGEiTk+wcAPS9U2J6PP8gdhCswRn6S3oUWW6og8kgIhK0x9xUUzKApPeB74Kh/Q
	7kD7vFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pG2-00000002mSR-2Yfy;
	Sun, 15 Mar 2026 17:28:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pFv-00000002mQ5-3fCB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:28:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48540355459so34351705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595678; x=1774200478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dhH5M5FJNqVSup5S7MKNqMM3K7FwdoGd3zPkVDPQec=;
        b=T23ub2383gfjNEoVaaPtdlW6DM6PQf7MUNsE36zIuFZknsJP1thWsG1UiGgfIWqA/B
         79/V+drl43GR55xY4lgIoxK9IUx9IQ8kHrKuJhFOHsF4hp/SZbeQCLvhF0xY5aKWvxzA
         3vnOaF2B97TgwLXfRnUgmHrneXWcpzhb+Hr2Lwq36Z+yK7cETJSaGF7id0947eGdoHSZ
         47/+HuK5gFl94IMhx2HSRwZPsnHlmVEHQO6zs6Ud/0F6i8Sc6qVlpBTjo/tY+Ed4AbY9
         OQtI2JVsS5kDRPzXLx2ZQJG38TSiTzt+wkqZsAwLKz0UpTJAr/RIQRqd7oI+FkcL4CAK
         8kUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595678; x=1774200478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dhH5M5FJNqVSup5S7MKNqMM3K7FwdoGd3zPkVDPQec=;
        b=g+zfDKcK0s5u24ZwhojpeXGFsIFxCRr4umEU69UbIjOXWWVoBgeBJnEhxRZQYJL/ng
         1H1h0DAAD6OVtXtvlYSwp0K4OE5N9JHAe4XhEdp8wB8lrhlbtl0hqGSSk3aWOPlpmPaB
         ezpiRQvqOk1FqX/Re1g17Tpy/SXW9X4gndrJB0JfD3I6iI1XNCbLYKTlJJNIfOuEMftE
         ykIYtTWQXC2fcga9LPF5HmslGAYph4r+ZzJiSRGJ/i4StZ6ZwnMT5B/G071PJ+VAazd+
         NRsKFEmlWvzBfhUbOO5HTD4Do9/Tm/46ZrCmKgeWGTjfeRndLzpcV8c4YtlUwhQDohVj
         EfUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5YUOy6AjCFuI+nsFpFC7xcAsR1Is1jeCbga558aBcKVrWhBzuChlETQrpFQm1lMb1ltt0RMrzcQb4qOf0gHmN@lists.infradead.org
X-Gm-Message-State: AOJu0YyC69tlJ7wYT6xODLnNh2OA9b1zvK3Y2fL+iTF4WGL1MikgehFt
	zHHj6KxS+lKwEqBVizUW7gLyT97/8tUYOa3jgT60tIyONyo1V5RlCnEb
X-Gm-Gg: ATEYQzySxZ1SeU0Twwz2A5XKWuohMSty6zRJTfUJG7+PM82Ieo8Z+qoUVlquQAi5R1p
	R/MrZw4MWt5oBnlSditQqcd5cgi9wdBGH9Mb8XMe9KmF7P/iKpljk73GhU3Mf360hC+hUtwM7lo
	LCIohrZWI3kQ9Orhb3troOj9i8rR7TSbaSnz3FrvJI/F6ZFLgtkvb7bs3Ct88QFN81FArBgHGvi
	1HWaDLU20XHZ+gz0p76G+qgrgZh5oejIAYGWskKA5dVotjAvcWYkHMiG09pEQRF2kv+L85ouA74
	QinfWYLGqvZrWJ2nYV2Fyf9xFd/c2L3nEDh9Hcv/prpRs5NBGBwDjiw0rGXV8lwWL3dKb8J7qb+
	HnuptqF59pG3ZDDvdrg1gVwbNc5Wak3PoSDzkKLedOR/UJ1MnoaFuGaQt72Alv/UpT7Wndal6cM
	7/PwgQLUXKnNxkieqpoosxU6drHi8tYEmJOpg=
X-Received: by 2002:a05:600c:c162:b0:485:3fd1:992c with SMTP id 5b1f17b1804b1-485566d2fe7mr159704575e9.1.1773595677669;
        Sun, 15 Mar 2026 10:27:57 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6586csm73644905e9.20.2026.03.15.10.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:27:56 -0700 (PDT)
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
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 2/3] rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
Date: Sun, 15 Mar 2026 18:26:39 +0100
Message-ID: <20260315172746.270734-3-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_102801_823175_FB170720 
X-CRM114-Status: GOOD (  12.89  )
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

Signed-off-by: Adrián García Casado <adriangarciacicuelo@gmail.com>
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


