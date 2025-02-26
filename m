Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB3AC19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jY3uCIlzRPcqsdFsVDSRckZdY857FgnbST2KmHH/YWw=; b=pgQRbuGbbtEGRYt7Tut9CCpP8i
	GUIsvDbZL5mXFIkrOi4DLMXuaGCI2YuqWvcI8YTHGYaev9/bsbrtjaeiaGcy7yDevL0WfTXFi77ii
	QIKlme5JdYyGvP0+RygeIArNk7xImnJbwwMI2NwrSBX2WkIlI++sm8tyBaLfTSsZ2KCVcDQG+Z8QL
	8qADAvM/iyh/Z0JHQHan8VDtovfRkQphnRQcCv7H2aL6LFo6lcJihFiHmJC5GRh+QMUV/x7BTCXg6
	U6sGNS7rs1EzSioi7q04ItMq/r0ubwwpmoB4i/0NVMlaZ+NGWrh7gB6sztfmCAcWdh33m27Bj4LQN
	rnDc+YNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMmv-000000056J9-1a21;
	Wed, 26 Feb 2025 19:09:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMdm-000000054cA-0gpa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 19:00:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 341D15C7354;
	Wed, 26 Feb 2025 18:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9121C4CEE8;
	Wed, 26 Feb 2025 19:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740596416;
	bh=VHk6+dPKZF78pRrNidDKIzcA8Vd8WnrEysNDQjAv7p4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lmI9ua6Ci+qh1KVirQDshLct2N6hauoIY8BAPYgX4hXNgKUiUAE0ZZcFt8yta7sj7
	 nZLIhACUs7o9JPplNDjdhxxAOUmYM488AHK70BDi6/bfH5Ma4SDxU0NPsamQHU2FN5
	 o6SQ20c6Nz0s8HpZ8WgeXDkPyrRqT8+AhnoN8ixAaf7+EmP8oUSH0WZj53H+1rVDU+
	 5feQBxYGwkGRtgsF/j+fmcp3Aw8pZlI3k0/52cQpNRrUDzr3by+ive0FZD1sGhYU7W
	 q0eAqBAK3RuohHoc3U61r26G4izkkjvxVuazNrkmcC1yFQzv0voPeht9yRQbaIE/Nv
	 T9geiyNzFauYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80F4C19776;
	Wed, 26 Feb 2025 19:00:16 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Wed, 26 Feb 2025 19:00:03 +0000
Subject: [PATCH v2 1/4] soc: apple: rtkit: Add and use PWR_STATE_INIT
 instead of _ON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-apple-soc-misc-v2-1-c3ec37f9021b@svenpeter.dev>
References: <20250226-apple-soc-misc-v2-0-c3ec37f9021b@svenpeter.dev>
In-Reply-To: <20250226-apple-soc-misc-v2-0-c3ec37f9021b@svenpeter.dev>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=7cIMb5W1B1VA4bj9uxkLGyPS9AbrGxHzx345cZFtAjE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/r+lD1Bh8qjJmd9L3nt8Wfjzf+VE6cxljdMYp51V4h1z
 vIHkkldHaUsDGIcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJ2P5kZLgmfEC234zvaQHL
 m+Umc17u7+aRLZvYOX3X/zuc2WEseraMDC8UpRU3M5w+m8wbFMrmMJk5MVT9T/cVw9a5b4/G77j
 qwgkA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_110018_267155_A4C741E2 
X-CRM114-Status: GOOD (  10.45  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Janne Grunau <j@jannau.net>

This state is needed to wake the dcp IOP after m1n1 shut it down
and works for all other co-processors as well.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/soc/apple/rtkit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 2f5f878bf899..be0d08861168 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -12,6 +12,7 @@ enum {
 	APPLE_RTKIT_PWR_STATE_IDLE = 0x201, /* sleeping, retain state */
 	APPLE_RTKIT_PWR_STATE_QUIESCED = 0x10, /* running but no communication */
 	APPLE_RTKIT_PWR_STATE_ON = 0x20, /* normal operating state */
+	APPLE_RTKIT_PWR_STATE_INIT = 0x220, /* init after starting the coproc */
 };
 
 enum {
@@ -898,7 +899,7 @@ int apple_rtkit_wake(struct apple_rtkit *rtk)
 	 * Use open-coded apple_rtkit_set_iop_power_state since apple_rtkit_boot
 	 * will wait for the completion anyway.
 	 */
-	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_STATE_ON);
+	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_STATE_INIT);
 	ret = apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP_PWR_STATE,
 					  msg);
 	if (ret)

-- 
2.34.1



