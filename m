Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690BCCD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s+NwWNik0A4yQLnEFTlSBrclx3QN6Ei0fyFFruwyw1I=; b=XbPxLVtL0nI+M197XCEyMc5w/1
	+/MbAmJXktKvv7+otWrbyLjFQ0odmrExtnzwm8aBE1tlBG1jTXAArdpWkHm3Uk7z6JG8rwQ3TW6tF
	aVINIkBcei0xTbKPm8GjXqu6Gi439VUbx3hIc6LS5HxeRBegvyXK6/OS6pymJt7ie1avpb0Nw+Zkj
	O32aMdUFozcUaSU7s5wmatuEwBVGsEE9mZxWEAzsZs5gLPNyNNge2rqpLD5Hp7MoUJt5Ua26tu7Mm
	d6dIE/kHnWSRDutrHx9RSh/c491xtMZM7gUMw5iiwFrQCv34l0LfDFT2p8uG0RYNacBimuWW6npyp
	SFDF5vhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxiR-0000000Ad2X-2CP4;
	Fri, 12 Jun 2026 08:58:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxiO-0000000Ad1g-1S75
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:58:14 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4600cbb06deso442375f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 01:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781254690; x=1781859490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+NwWNik0A4yQLnEFTlSBrclx3QN6Ei0fyFFruwyw1I=;
        b=d9Wf0bviwYjB3b77GXwktZZlSJuZyBeDEXUO4hvW8DvcJK6Q0sRNn7oPikqog0RWM6
         QN6wYJUqUMivkHpqLTar6iGPGK1QG3TvRx40Z8CMG56JX5sHwNib59oTn0SZYBgrYEh4
         QHDR98mBsc45FwTakWTYXvGD7RqMt11LnpIV9GewyxiNN/fidLQCteSVDa0o0fl6yPmL
         xdtBNqtn+eMPXKuGiC944Ubpbww54czrbqdP51M0xrQlzLwk5FoSw+EYdUGBrhyPaPLK
         znHQYf7yGErJdGpBLAXAZUsGHd1FF/3aaSbl/72axfItTQNRnNCTkpH3MktlrVuV70dR
         e+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254690; x=1781859490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+NwWNik0A4yQLnEFTlSBrclx3QN6Ei0fyFFruwyw1I=;
        b=bxxyC09OzC/A1YlkEeGwpGdmFhJT2exrO2Z1lWeARaljfOJ7uZxMuHOWpFeNUmNxSr
         x596o5v0j+gnXUd4KX+0d/z0GuVffgszTLJTxfZYJcv0NSISP+qo4qqlXQlwxu+g+Xjf
         ZkBGBeHrLTcaYD08PdNyDASjVAEOICWy1iECwk6BMMhQleuS4p70x9N/LWDo32WsiuAl
         0FSDIwAQX/bJsIawybBU0UJ5kMu+1NpOOMuUf1u6soU4dC5o3f4xuazbXQOwru/AHHLs
         Rrr52nkMPLw3DqyIJdQwNOIlzSXlPB8kJMTFpZlqM0wvTy+a8GFtXbs9yAUDGxhRM24O
         X0wQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tPMKjXa0rAGTar7qBM84qavK34oby5/9OV9OpcyWd5sZ0FtVBJLMYU3k8mU/5T8bEzfhcBNbC6FFKPkNg+Ayx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Ik3AeTY6+zvwop/u8QWeXtXIsjOm1eIzDWr8kdIprJrfy/4f
	duCw3OkaeOZf9HyW0rhHXVznvUdnnzv0fnQJv2WU7UXHtJaxQABegD5fcZVEES3XQTE=
X-Gm-Gg: Acq92OGaDDFVsTUwVBY/ZqpVkFvetIbo0O2O/vRzZwbXK6vNVk1nQETIk6VoRcUZ9iC
	n5ATOsbgS6t48oZu+Mp6Nf8TkD72mkOBY1yNwlfLeK/FamYz02L/acfKAzVnZFAhiNOK7n07Ed2
	dCrP1G2k6hAQezax9QpZeOgfGB3xajAYGHCymmdLzrMrEvALIGuqqdoGR+4lHk7JU+TQYLYeU6v
	R/O+3pVEmXNnPYWzUIdnnrmVKCakHBLB0kLEa/lLMSun1ojtt4VbsLDFEB1XYxjONEQkiIOtqFT
	uoFmvdgCkTNQGHAwxTdugmBHSrw29ktNwODMhUpeFwbwqdJwpwXQ9u/RdyERsyxI+ATsWDHLisx
	QO5WQ8bU67/hD3euO560wvqRSmP1aEM0eSQA57dlQI4hap1g/s4fpQvhs8egGxhP+3BuUNNXw5c
	fqmcxY28UhmBBmrX2B19Mc
X-Received: by 2002:a5d:5848:0:b0:460:1c93:6eb6 with SMTP id ffacd0b85a97d-4606d0239femr2743763f8f.20.1781254689774;
        Fri, 12 Jun 2026 01:58:09 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0bbfsm3828193f8f.23.2026.06.12.01.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:58:09 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: netdev@vger.kernel.org,
	Theo Lebrun <theo.lebrun@bootlin.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Cc: Lukasz Raczylo <lukasz@raczylo.com>,
	Steffen Jaeckel <sjaeckel@suse.de>
Subject: [PATCH] net: macb: add TX stall timeout callback to recover from lost TSTART write
Date: Fri, 12 Jun 2026 11:01:26 +0200
Message-ID: <771b8faeaee1fce4a84a5ba2661d60b35a65a6d5.1781253818.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_015812_404307_2DD4449A 
X-CRM114-Status: GOOD (  13.02  )
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

From: Lukasz Raczylo <lukasz@raczylo.com>

The MACB found in the Raspberry Pi RP1 suffers from sporadic stalls on
the TX queue.
While the exact root cause is not yet fully understood, it is likely
related to a hardware issue where a TSTART write to the NCR register
is missed, preventing the transmission from being kicked off.

Implement a timeout callback to handle TX queue stalls, triggering the
existing restart mechanism to recover.

Link: https://lore.kernel.org/all/20260514215459.36109-1-lukasz@raczylo.com/
Fixes: dc110d1b23564 ("net: cadence: macb: Add support for Raspberry Pi RP1 ethernet controller")
Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
Co-developed-by: Steffen Jaeckel <sjaeckel@suse.de>
Signed-off-by: Steffen Jaeckel <sjaeckel@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index a12aa21244e83..615da65d5d68d 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4522,6 +4522,16 @@ static int macb_setup_tc(struct net_device *dev, enum tc_setup_type type,
 	}
 }
 
+static void macb_tx_timeout(struct net_device *dev, unsigned int q)
+{
+	struct macb *bp = netdev_priv(dev);
+
+	if (net_ratelimit())
+		netdev_err(dev, "TX stall detected, re-kicking TSTART\n");
+	dev->stats.tx_errors++;
+	macb_tx_restart(&bp->queues[q]);
+}
+
 static const struct net_device_ops macb_netdev_ops = {
 	.ndo_open		= macb_open,
 	.ndo_stop		= macb_close,
@@ -4540,6 +4550,7 @@ static const struct net_device_ops macb_netdev_ops = {
 	.ndo_hwtstamp_set	= macb_hwtstamp_set,
 	.ndo_hwtstamp_get	= macb_hwtstamp_get,
 	.ndo_setup_tc		= macb_setup_tc,
+	.ndo_tx_timeout		= macb_tx_timeout,
 };
 
 /* Configure peripheral capabilities according to device tree
-- 
2.35.3


