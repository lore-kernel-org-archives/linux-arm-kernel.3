Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE7FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHT/WwMTvMyhNG0R1GTeh0JBDqIUGamHWFNRSDi1Fw4=; b=0SCgm35D3sgo6hOkbF5feCD4la
	J1Mlj1f5aImoSfZ8m6WpDCj5MjmoRPr/NWjk7wuYiDljAw4HET5sd7XcGRFpuu+8HqnW4WhLUK6xP
	AT8hW0dItGPvHe3tZ2xE1fgK8ptvoxPJ3QGBButTOgCzblgI3wsk6sbZd9lZptFNHyGHYo4UZe1Qw
	PnFZ9CijQdksv/ScRzsknYQzITpVPA3Ll2EChgYO9B3+RLq/Xxt+KWtTwx7XNKjffbwldlyTAkgD/
	XzgywQcp7i6CHszzKzhg2VLGS0THyM+EQF4wTGsieV2BobxjfglLdrMsBsJDVyfQqFx8JCfMpTTgg
	HHet4A1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaLK-0000000BYvW-1RIh;
	Tue, 14 Jul 2026 10:26:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaLG-0000000BYs5-01a8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:26:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-476a130c138so811162f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 03:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784024780; x=1784629580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sHT/WwMTvMyhNG0R1GTeh0JBDqIUGamHWFNRSDi1Fw4=;
        b=WNhPwIcEC/3puA6YnC9HCk/4fdJzn0wkdl9sN5+OWP+tLB4AUcqfAz0PLz5pleiicR
         Gsgyat3htMM1Hi8YyAJHfG4rQzlP80HOsXSxMNFoBBjuiQlZkZfPBBonFxK/1VdVBcf1
         VSlbNp+DzTv+smZ7MM0VhzLNR3EqtNpYOZsCrX5feR8rkdqfe8tE7m5kcnz0aesmo8sP
         YVLRM9Hzt+zR0TTuxSirVV4vdBNJaeVw4xMT/A91DIadKZqoIz7U92z9odVjL0BEGnkf
         h6oUygWcMPnIfZu9CBUb4NqYKfwrLI0lMt1pJaK982FtDKEx0zGDUp8Yim9At0L2Otha
         JUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784024780; x=1784629580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sHT/WwMTvMyhNG0R1GTeh0JBDqIUGamHWFNRSDi1Fw4=;
        b=mXCGfr0snLX7Nl/CkGnitbcCA+GspyDY3JP5SrmlTgRJp1YbMx0mSviOZ85BUN4R2M
         ink2U/wfyIeeNwAoIqX/DOtQZGNRHW/PF0Uyu322sNyVYc2Q45ss0lwYSPhRXE0iBcIn
         4fXzJDIlyO41Zg5VOCYV/M/hi2nBhKvMadiQN5ChK0z+XY7buXk1xyBufNg+AaA0IKjs
         IaYXjywKT7KDGOM/df6pXUllxjf/rIobdw2II5KIemUAPxzq6YRZgGpFj4UHetjGr9cB
         eR1qc9hF457DLQd5mSzvUqUVhBRMSAHshSgf5Ym3Y2u8o0bwPE8pkUmFOzBWoF9/LCbJ
         ROkQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8HlizWVwaOGaB2jcycfPH1OZfu+Lykn2mjDQNXKgfHo1TYnZ1HHsS01ZBIgrEO0COazbHXuEc9kVBt/ww+x7R@lists.infradead.org
X-Gm-Message-State: AOJu0Yyup+VX9HA6Q2rtGDSIGL3U9644uo4JalNz3iIyzvlnzpStsxfH
	XANliIi/qBOCgBmbkFQWGSe4tkkNlcJqszlOdkkfTBgo91ZBUekTWPbQ
X-Gm-Gg: AfdE7cl1dWYwiq1oYpb0H1JkhXZWh84otwH/uwydYUsBdJH7ImXWK37U5v4MjzRY170
	bDotrzeRLuRdglXenKNLfZUg3oqBTcdK5Li1fzjXgtBnjhpigSxwvQvNTK3ecuVqJ+TRbe8iwxo
	txRBH6oMzbBFOyBMRYIxxQQ0DBSjaPTTP3nb4b0dc8qvYwdX/Ynsx4Hk9MUABsJOhA06WNdB1O+
	uMf1YlgKs1xP7ymmsBQL2g6HGWT23tWqkJ3YaNSlEb0MwISoZqRmkTHWCe6fiM7iXgshzGU8odz
	9Enu8xefLrmWc9m8fSf7HKJPsNNLhjo28pum8TUR8D17auVjiw+n/lX7SiliIVnZktwt6mum/uX
	FW7hA8v+H4KvsC6YMXm14MtdCG3ZhOghpCcHkmlXQyPh42wOAC9gw/3R6PgyftJWAk4zwM74YU8
	Vr6TNOeCEPkVHzq+XV+LbVyDWQWqw1gUTOnfujtmAhaxkFFkDyETPbo6Xo5MTnCk/DJIW/+gpmK
	7dJySo=
X-Received: by 2002:a05:6000:26c9:b0:475:f100:35f3 with SMTP id ffacd0b85a97d-47f2dd2ef0dmr14426836f8f.48.1784024780086;
        Tue, 14 Jul 2026 03:26:20 -0700 (PDT)
Received: from localhost.localdomain (ip-89-176-136-191.bb.vodafone.cz. [89.176.136.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm7251991f8f.29.2026.07.14.03.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:26:19 -0700 (PDT)
From: Petr Wozniak <petr.wozniak@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com,
	rex.lu@mediatek.com,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	Petr Wozniak <petr.wozniak@gmail.com>
Subject: [PATCH wireless-next v2 1/2] wifi: mt76: share the throughput LED trigger across bands
Date: Tue, 14 Jul 2026 12:26:14 +0200
Message-ID: <20260714102615.2943-2-petr.wozniak@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714102615.2943-1-petr.wozniak@gmail.com>
References: <20260714102615.2943-1-petr.wozniak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_032622_059344_A2957A92 
X-CRM114-Status: GOOD (  14.35  )
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

ieee80211_create_tpt_led_trigger() creates one trigger per ieee80211_hw
and returns NULL with a WARN_ON() if called again for the same hw.

Under the single-wiphy MLO model each band registers its own LED classdev
for the same hw, and the bands can be initialised in any order. Create the
trigger on the first mt76_led_init() call, stash it on the primary phy's
classdev and let the other bands reuse it. This avoids the WARN_ON() splat
and gives every band the same throughput trigger regardless of init order.

Signed-off-by: Petr Wozniak <petr.wozniak@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 13c4e8abe..0c6641050 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -228,11 +228,19 @@ static int mt76_led_init(struct mt76_phy *phy)
 		 wiphy_name(hw->wiphy));
 
 	phy->leds.cdev.name = phy->leds.name;
-	phy->leds.cdev.default_trigger =
-		ieee80211_create_tpt_led_trigger(hw,
-					IEEE80211_TPT_LEDTRIG_FL_RADIO,
-					mt76_tpt_blink,
-					ARRAY_SIZE(mt76_tpt_blink));
+	/* The throughput trigger is created once per ieee80211_hw. Under
+	 * single-wiphy MLO every band registers its own LED classdev for the
+	 * same hw and the bands can come up in any order, so create the trigger
+	 * on the first call, stash it on the primary phy and let other bands
+	 * reuse it; calling it again would trip a WARN_ON().
+	 */
+	if (!dev->phy.leds.cdev.default_trigger)
+		dev->phy.leds.cdev.default_trigger =
+			ieee80211_create_tpt_led_trigger(hw,
+				IEEE80211_TPT_LEDTRIG_FL_RADIO,
+				mt76_tpt_blink,
+				ARRAY_SIZE(mt76_tpt_blink));
+	phy->leds.cdev.default_trigger = dev->phy.leds.cdev.default_trigger;
 
 	dev_info(dev->dev,
 		"registering led '%s'\n", phy->leds.name);
-- 
2.51.0


