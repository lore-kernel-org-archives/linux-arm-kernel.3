Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845B3C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEghkHUpo4gQbia4h9dJFITq6F4ApiAV1KakWPfNYGM=; b=VNZqATw5Tc6mecTP0oc7FFQR06
	WHqABYPM3AvYXrtAG++u+uHklZwZLn76TbAInVC2Mk6gwytietjFQg1k49SAjGNUTy406wvrwI3UO
	dGiTEQADIk40+pAk5setulfSAgA+ryy+aMy9Rs8DvDNGitedvu+dbAAWifS8ir6CH1ZDKHaQePkR0
	MiS2QrdTU5xpv7V2wV6l9PhNwQMekDFpB287iqhGoc+hcxNopXh7YzzM4iiOKjciDgDNltLxnvdTg
	YmyY3FdgfvA+abvIcpMBsmnogOf13PYJ2pvCwEM3+XDV99Oh7o+dCWINjHGs8Ur7QJxWtO/H3aHnT
	+7i7Zvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nV4-0000000BoNC-1KGP;
	Thu, 24 Sep 2026 17:44:50 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nUu-0000000BoIb-13c5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:44:41 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 006d021491bc7-6bc475ffcf6so72674eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790271879; x=1790876679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEghkHUpo4gQbia4h9dJFITq6F4ApiAV1KakWPfNYGM=;
        b=IAdKDpOE8w2FMA+tupZ/3x4KVF5Nemi+qBkM4KjNkYxydjupVg2IO9HADz9seboORS
         ctDESU2WCzGZlPSzFDuCam0rJVe1u2TUNDcM4I4i5V7JVZ/PetN6nFUp/9rskgBWa9i7
         F23/Fw0Ae/RkjsKzK0Wah/AedhY9KP5QlFbc3A2ouJ0LhKE97pbg79/rYM05MTjvlYsT
         dMtLLgx39tlW+76RjHB7pwJovhnt4ovSNNAiDQSZs1/oDfpNB9wcPWm2GJAQyv1M6vPe
         ZcYRtVCUZqd/uJA+OwGClrhYDqVC601gTuTmUxg9+rb74Rr+EDSoMH0l4SsXrWktSwL7
         FPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271879; x=1790876679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEghkHUpo4gQbia4h9dJFITq6F4ApiAV1KakWPfNYGM=;
        b=gt4f4e57cHILiBcSdr5z+veH7JIc1mjE6pG221t0BtuHqv4XXikOxqRo3CzmKJpKce
         U0ci9ksGkc7Bloc46ph2Y9IgopvnBQPOEIGaslGxm8V1a6GvKX9sOTuKkAM3eatXfWoz
         1/MRFYKZdBdWZUMlQKv5ztS2Yarp8k77Rl3qoJpFCvYC+6NrnOgV1EfIlQRZQ8e5ZAO9
         F5H2kDyrxaXPbFSMaCDb8t5drab0fmR0HUwxU8ZFRTsXjEZTl0ACckHeUwRYivk00NEq
         bAj7/1sIQ8BKb6rrSE06vO/FHCFkhNpAYVA/nZjNenwigX2uHOFbGp2LGDVzAFjs6VJB
         uNcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpvr7vvQZjGyIVGXPPAP2ACSAjTg9I2JowHCtmCre+e+C+IY0XGKTE1FC+Xlz7pV4wQmFTxds9nT/aWeVBYtKb@lists.infradead.org
X-Gm-Message-State: AFuF++mPI7VfNdlABWv/9XiyR27UUiPQFWcXhdbJIceLC8cl7S91WOhL
	fTfu2wxM6ANqwHJOCfDnMlK8BRkqAWfAk3mAFg0fvZyhnRIqt9yCSnr9
X-Gm-Gg: AYBFou3akA2Z/BAz/XmsB8HQQC4eVtxsuMQ0ocF3yhMpUmzhAE5u2UYIhjw/gsfLHG/
	1xNWcafmG31rx4w/ociGjfldwh/tDibMEnbJSHNQLumT+xs9bLGiNEhCbvc++Mx+8SPWSb+5lqE
	cHCwaNqlhBnGhIVXYWbboVJpk7Wlyi1pQxYp1FPnLMNxQ3PxliFDD9abTfN2/2QspDnA8QZ77iq
	t7fxiLvudXiduL4ddZMurCK6oL1glolW43ADLPgQL8eFpbyE6WfTzgf8HQ8byAM5ozFBLnYv/0e
	dafpJMXcqBOAeFm2kG8JyMipoXwL8MYED9D4dqSgKcNWKbIIVPu1sY8KeVZBRVTYyoGn9P/WCt8
	9x37qvB0AIXMG6IclH/vvTHKSXEun95uQflR00aWr88Ten8JRhfCV/ddDwTLyJ5CX0Y0UkXcc/k
	Mqt8FrEXyvlSw8XTGFZiec6nMvH05akTWB64l/KAjXAI4dsFx/xVlGO6bJZoj2RrcYXXDSTYpWx
	rlO1WmMuwAE7MogIISGa9ZsNN0T9i62ds6TAkDo3BmZ86ShsJ+E35kUady6rp7jHw/Y8EVE9AYy
	byms8ie2tuW9gaLyCYaerQvY56iZOzYkrNeWf3aeMozJchgVauTh1X87cHVmwnKZ1h9yoKxsu26
	7hX7xeW9sIv2i8Hrnfij55w==
X-Received: by 2002:a05:6820:c96:b0:6cd:3fdb:fa65 with SMTP id 006d021491bc7-6d441c7d08amr2671632eaf.80.1790271878870;
        Thu, 24 Sep 2026 10:44:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491e8f8d14asm3027802fac.0.2026.09.24.10.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:44:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Sep 2026 11:44:32 -0600
Subject: [PATCH net v3 02/10] net: phylink: allow stopping a suspended
 instance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-submit-stmmac-reset-fixes-v1-v3-2-c031e3f3a282@gmail.com>
References: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
In-Reply-To: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_104440_327873_657CC024 
X-CRM114-Status: GOOD (  20.28  )
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

If a network driver's system resume fails before phylink_resume(), the
network device can remain administratively up with phylink suspended.
Closing the interface then needs to terminate that suspended instance.
Calling phylink_resume() merely to make phylink_stop() work is not a safe
substitute: resume reconfigures the MAC and restarts link resolution,
although the driver has not successfully restored the MAC.

This is a missing suspend-to-stop transition, independent of the reason
hardware restoration failed. No MAC recovery policy belongs in phylink;
the driver still decides whether to retry resume or wait for an ordinary
administrative down/up cycle.

Without MAC Wake-on-LAN, phylink_suspend() has already called
phylink_stop(). Do not repeat PHY, SFP and PCS shutdown. However,
phylink_prepare_resume() may have powered that stopped PHY back up to
provide the receive clock for MAC reset. Suspend it again if WoL permits,
without repeating phy_stop() on a PHY which is already halted.

With MAC Wake-on-LAN, suspend deliberately
defers mac_link_down() and sets PHYLINK_DISABLE_MAC_WOL. Finish that
deferred link-down, drain resolution work and clear the WoL disable bit
while retaining PHYLINK_DISABLE_STOPPED. Otherwise a subsequent start
cannot resolve the link.

Also undo PHY speed control performed by phylink_suspend(). As Andrew
Lunn pointed out, phylink_start() does not restore the advertised speeds
that phylink_resume() normally restores. Track suspend-owned speed control
and restore the saved advertisement from either resume or suspended stop,
including when PHY shutdown has already completed.

An explicit driver speed-down request, such as stmmac's close-time power
saving, must remain in effect until its matching speed-up. Restore any
suspend-owned reduction before applying that request, so it cannot save
the reduced advertisement over the original one. The following stop must
not undo the driver's new reduction.

Document that a suspended instance can be stopped directly. This neither
resumes the PHY nor reconfigures or brings up the MAC.

Fixes: f97493657c63 ("net: phylink: add suspend/resume support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phylink.c | 51 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1bbcf46c8356..b7d30ca34031 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -78,6 +78,7 @@ struct phylink {
 
 	bool link_failed;
 	bool suspend_link_up;
+	bool suspend_speed_down;
 	bool force_major_config;
 	bool major_config_failed;
 	bool mac_supports_eee_ops;
@@ -2498,6 +2499,14 @@ void phylink_start(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_start);
 
+static void phylink_restore_suspend_speed(struct phylink *pl)
+{
+	if (pl->suspend_speed_down) {
+		phylink_speed_up(pl);
+		pl->suspend_speed_down = false;
+	}
+}
+
 /**
  * phylink_stop() - stop a phylink instance
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2509,11 +2518,30 @@ EXPORT_SYMBOL_GPL(phylink_start);
  *
  * This will synchronously bring down the link if the link is not already
  * down (in other words, it will trigger a mac_link_down() method call.)
+ * A suspended instance may be stopped without first calling phylink_resume().
+ * In particular, closing a device after a failed resume must not restart the
+ * link or reconfigure the MAC just to finish shutting it down.
+ * Any PHY advertisement reduced by phylink_suspend() is restored as part
+ * of this transition.
+ * If phylink_prepare_resume() powered up an already stopped PHY, suspend
+ * it again when Wake-on-LAN permits.
  */
 void phylink_stop(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
+	/* Also undo PHY speed control when terminating a suspended instance. */
+	phylink_restore_suspend_speed(pl);
+
+	if (test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state)) {
+		/* A failed MAC resume may have called phylink_prepare_resume()
+		 * and powered the stopped PHY back up to supply its RX clock.
+		 */
+		if (pl->phydev)
+			phy_suspend(pl->phydev);
+		return;
+	}
+
 	if (pl->sfp_bus)
 		sfp_upstream_stop(pl->sfp_bus);
 	if (pl->phydev)
@@ -2526,6 +2554,16 @@ void phylink_stop(struct phylink *pl)
 
 	phylink_run_resolve_and_disable(pl, PHYLINK_DISABLE_STOPPED);
 
+	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
+		/* Finish the link-down deferred by MAC WoL, without restarting. */
+		flush_work(&pl->resolve);
+		mutex_lock(&pl->state_mutex);
+		if (pl->suspend_link_up)
+			phylink_link_down(pl);
+		__clear_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state);
+		mutex_unlock(&pl->state_mutex);
+	}
+
 	pl->pcs_state = PCS_STATE_DOWN;
 
 	phylink_pcs_disable(pl->pcs);
@@ -2657,8 +2695,10 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 		phylink_stop(pl);
 	}
 
-	if (phylink_phy_pm_speed_ctrl(pl))
+	if (phylink_phy_pm_speed_ctrl(pl)) {
 		phylink_speed_down(pl, false);
+		pl->suspend_speed_down = true;
+	}
 }
 EXPORT_SYMBOL_GPL(phylink_suspend);
 
@@ -2698,8 +2738,7 @@ void phylink_resume(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
-	if (phylink_phy_pm_speed_ctrl(pl))
-		phylink_speed_up(pl);
+	phylink_restore_suspend_speed(pl);
 
 	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
 		/* Wake-on-Lan enabled, MAC handling */
@@ -3616,6 +3655,12 @@ int phylink_speed_down(struct phylink *pl, bool sync)
 
 	ASSERT_RTNL();
 
+	/* An explicit request takes over from suspend-time speed control.
+	 * Restore the original advertisement before saving it again, so a
+	 * repeated speed-down cannot replace it with the reduced advertisement.
+	 */
+	phylink_restore_suspend_speed(pl);
+
 	if (!pl->sfp_bus && pl->phydev)
 		ret = phy_speed_down(pl->phydev, sync);
 

-- 
2.53.0


