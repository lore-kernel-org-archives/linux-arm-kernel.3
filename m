Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148B8C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tq7uzj3Nuht/sUsnSMR7xKzenitos6XuGY/rnGcdmdg=; b=TcGGBDyxltnymakWNW4INF0sun
	Lj8MMQs2daEGoPTOIHvhx+3jp+1MK5AB9qTael+4khMjvbgpynRIE+jYqf+VFx7CVOp51P09rUGpo
	E9rmfYWyUbLM3y9ZzSKWJ537w2Gw4RkD3xRxNmeGWZYkbF/dGsG1cfOOPIjjklxESEyMyxT3hV/1X
	IefpTNTjmIqhNj7RwvSWCFa4/KTKATJqaTomcnJCCtVIWk25khqmGPiSauu6c7TKWTliPb5h+T/Mp
	l6UzMMKYGer4nsNI7uPxAenxxG+fJvFcu7zP58tti7bMFGaNzWTDJBqyzWzEQ35UGV9rNDDpb5iS5
	6xTkGC/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Aj-00000003NSa-2Xpr;
	Mon, 14 Sep 2026 11:48:29 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Ah-00000003NRk-0z5D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:48:28 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6a9e35826baso1669214a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789386505; x=1789991305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tq7uzj3Nuht/sUsnSMR7xKzenitos6XuGY/rnGcdmdg=;
        b=APeOB/+uNFHR4Vh+e5qjbb+bXYGyy/dvk7UmZtDieMDFfd9KCIicP1kjz80hzBetMX
         Gtl0cqpq9AVDP+nP/VD2G/QuwSWmaw5GsXbaYCCHZfu6qDnHYt0yNAzuEzx5V0/7MP0U
         oVkRXq4m0UYnyh+ECxreIs2W6O1A3EU7uMwAcmJA0OAgCPwUWhAbXnMxOFgLLX4jKh4t
         49/7DXsjoGEeVg6djb3FUcX/KKM0tp2rZchYA3lxjLmBMiresAw6p503yserlzos/HUq
         Q45Ii5SdeaNftAP6Iz0kgEdsu1Jktvm9QR97yLVMFMVpcExADJndlTjdbnmwKjA8vJNl
         sLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386505; x=1789991305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tq7uzj3Nuht/sUsnSMR7xKzenitos6XuGY/rnGcdmdg=;
        b=J66XjxQSQrf/PYYxpgPTs2kg0pc7wCt1AJpnZkfyaDzbBEMO0dTKwvqsn02Dc4La73
         AkIotXRjGg91NuXvHpDYkmPM33fAsDp5+ifWW3IZsYaBLw1/6tmhuq7lyJW3tgeTSo9b
         MCYKKYBKlnfmLFjDgyejOmcooSnf4PzkBLTGWs0en8KFw34F/EaCONymeiAw/VOXca54
         TfG1MZLLDcVkoN6jxEfVovj4nPdjvi2qgp+wNbLcvoOw+OtpwzWCA8Zw0pN4PKPZrIZ/
         02AmtGyWx0mEdK40C+F/BFRF2EZOG7g/tm6Rwhh8MsqL6JEmaQpRauEqpzEcxfm8TdSA
         6p2A==
X-Forwarded-Encrypted: i=1; AKwUvBxmQOn64No+tbIoc5BN7Ib7m5ONXvdbhKeMPsqoYTnp65IupnHMXkfD41vTAzI4K++1t5z4kpc6/6nV7nnF7Ks8@lists.infradead.org
X-Gm-Message-State: AFuF++kYQVapl4ByCkpbLUofjzzXQPY/O43HBV6xdB9HSat8eul/8L7k
	FyCKAqUq/lifOLX+/PE7pMm44OsmvbcbWIYXm76DWbZ96up25OWO2NVQ
X-Gm-Gg: AYBFou0vYqsgS71BPNqoQIQcTnVbQrrtwhTsQ7AQpFdJnGLq8FME5ne1hPt47roGsDn
	3adwllX/BX7mb0R6Ndb6su7fpjcGd+RIlOHhCdKxL3jUR8/F2ahgTHeszu0jskJbOTbI+dEsk0K
	KMwyMl50a/3ehQwJVOjIxkO3L0KQ7LWHjzHTVAzlpT0Wp0hpVruSXWODuRKHSD0RforL4OYT4FS
	gqAIzAFa6ijUjRgxIHFUAMXTvQFNkHZuKdeCdzBFY14aGTgKjrdVCe2FKZt3yhPHgFgAIGnwy5Z
	0sa88cJ5G6GCENh9CWgNqDJpl9dJyglQF9eIRZhg67FJyXtkv397aYf8gecQfreLQXuYnwSOS9I
	iQQuHk1CWwAsYAosRllKpN/xg4BKoF1V3iWAlCDw/EaI2n+/LaTqXz53rckoJXfbuH2OFUkt8JM
	JLEQr1Vt5vthbXMHK8MAaJG1+nuIOqdXp4SOTk2+Kb9flAWBqSiFuvXIOs9vaZr+bYYxpXwjkkB
	LV1nC3pV5kxImfipBWesy0WPQ55e1BNukzurToJ
X-Received: by 2002:a05:6402:249f:b0:6a9:9894:e4b4 with SMTP id 4fb4d7f45d1cf-6a9f63cd9ffmr1264857a12.34.1789386504591;
        Mon, 14 Sep 2026 04:48:24 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b59644f2sm3749062a12.29.2026.09.14.04.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:48:23 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: Robert Hancock <robert.hancock@calian.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: axienet: bound TX completion cleanup by the NAPI budget
Date: Mon, 14 Sep 2026 14:48:21 +0300
Message-ID: <20260914114821.55503-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_044827_292495_D122EC0D 
X-CRM114-Status: GOOD (  16.54  )
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

axienet_tx_poll() passes lp->tx_bd_num to axienet_free_tx_chain() as
@nr_bds, and @budget is only forwarded to napi_consume_skb() as its
bulk-free hint.  Nothing limits the cleanup loop to the NAPI budget, so
the number of packets returned is bounded by the TX ring size rather
than by the budget, and the poll can report more work than it was
given:

  eth0: NAPI poll function axienet_tx_poll+0x0/0x180 [xilinx_emac]
        returned 96, exceeding its budget of 64.

Returning more than the budget breaks the NAPI contract.  It also makes
the "packets < budget" test in axienet_tx_poll() false, so
napi_complete_done() is skipped and TX completion interrupts are not
re-enabled on that pass.  NAPI reschedules the poll, so this recovers,
but the accounting is wrong either way.

In steady state fewer descriptors complete per poll than the budget
allows, which is why this is rarely observed.  Triggering it needs more
than @budget completions outstanding at once - for example when TX
completion interrupts have not been taken for a while and a full ring is
reclaimed in one go.

Stop the loop once the budget is spent.  cur_p->skb is only set on a
packet's last descriptor, so breaking there never leaves a packet
half-freed.  The check is skipped on the @force path, which cleans up
after a DMA mapping failure with a @budget of 0.

Fixes: 9e2bc267e780 ("net: axienet: Use NAPI for TX completion path")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..37309fa355ab 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -788,6 +788,13 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
 	dma_addr_t phys;
 
 	for (i = 0; i < nr_bds; i++) {
+		/* A NAPI poll must not return more than its budget.  Stop on a
+		 * packet boundary once it is spent - cur_p->skb is only set on
+		 * a packet's last descriptor, so no packet is left half-freed.
+		 */
+		if (!force && packets >= budget)
+			break;
+
 		cur_p = &lp->tx_bd_v[(first_bd + i) % lp->tx_bd_num];
 		status = cur_p->status;
 
-- 
2.47.0


