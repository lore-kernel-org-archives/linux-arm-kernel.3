Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE272C98304
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 23:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8++WyG12SZPVqlwFfWjIZRV+ikQ2NXn6irkLz76Dxw=; b=Ng31HJTg345B599yqMf19VR+ke
	AX3JTDnwq8A1Xn1th17OoB4ECOjJDA7DnnVhmnBhJay3NM/MzGxAK3FbhZcZQqW0TsWaVmik952/c
	Nmp/luma1xQpvkvPuvdvIzf5LpZiFPx0okNwTMXzkTbfmrNGcQgUQTHg6Agv/XHdd1jT+EddYLS92
	ra8VKk9UrjJekcxMbMu3dpXriJRefK0I3Fw8xm3huVMQGzqYKrvGAh+LYGY5W85njoBNBXyDa3eXM
	B6LuFD1Qyl7azKtcie2kUby7+eztDOXud9qXZKhy9ivhC32A+247qr+XbOc/uKnd4vJLVVDBU2ZyJ
	Va+J3H0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99tu-00000006jKb-30gd;
	Tue, 22 Sep 2026 23:27:50 +0000
Received: from mail-oi2-x26.google.com ([2607:f8b0:4864:32::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99ts-00000006jJd-1GVO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 23:27:49 +0000
Received: by mail-oi2-x26.google.com with SMTP id 46e09a7af769-7f4f0dd5507so230786a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 16:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790119667; x=1790724467; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8++WyG12SZPVqlwFfWjIZRV+ikQ2NXn6irkLz76Dxw=;
        b=WI+Ttca+OZWL2EObJ3779cqHhDavV6PorRNuudmB9o9qlQ77b15Wo/pDGiqx6PAQzc
         dTdQyP7bmzjsyPhmwiFHd7N4PTB7xdvR+3CBEJZGTnhfZaqOExC4PSVQc9kyI+y5FsQ0
         SiKmX4Jcr0yBH7eDJJgyNYPro9w0h9DOtrVSTerTiLN0VaXQSJS52SAu7iNlClo/olcv
         O/mvkqnl5li8nzZB3oam1e640c3LyWbfSF7yfztCynWGKew7bp8UqHl7atE0sFbVQYA8
         ejyZrTXTNSZNlDN1hhS9oRiXDVJ/m3+2C6oHsjH2aRvxxsEVHlTAjsjliJeKKNQDR5ck
         KV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119667; x=1790724467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8++WyG12SZPVqlwFfWjIZRV+ikQ2NXn6irkLz76Dxw=;
        b=s2LjD8QVo/Sgilv2s1Y8oB2fj+gZpi+McT9a9tKkhT5riiu27igKJKSpitZf0zrlIO
         7WOEhmSBS6FO+P1I0uSmQr3b2r8RLyRVKSxrPFOVSm4NUV82dolcCLE4tHgou/z1itXB
         /U9PAY8+IhSxipsb+Em2TKHydSExrVXDor0IZOxJcvnfIbCbM1vl374FP58gb6MiHaBh
         QWr4ZXTOUme7IlCZXqg+BotbJnztdHL0O6yuiuoZsdABrZo6u+meny3Js9DjOWYf6K66
         ah7qC4ASPO+HqMX6xp//gqGYda4Xx9RFHvDe5Vn7XDWWjydP9xKCMa+Gth4osdEOJW+7
         32+w==
X-Forwarded-Encrypted: i=1; AKwUvBz2a+Mbm7MsD/XJXljNQF6FAeLiMrojhoGvmJUnuOZoCuyXNgp8XX07oEZ3S5Pkf0zkCIP++NVo04aQlAmTlPeD@lists.infradead.org
X-Gm-Message-State: AFuF++nlOpfpb4pNI1cQlTnJ//jjJ1bPu23QBwmjv1nhBJPqxVgpbXpa
	RGGCHwl/KdOReiK3s3+5uYIBnFUK+4XCNZYPIKlM1+fmE6oAuCiLvV7u
X-Gm-Gg: AYBFou0QsL88USVht13xy2pwiuigs3W/nD8GIhJmoLomBtKzsOYw1tGyPgAj+kPMgR7
	POyn8qd1h7hb1+dMFwwU4FWEuuWkLK6s6RNP1FUYUbo1TwUY/gFfSVFJVeYqdAL8BO55EN5z51l
	0poDUnNGRXVIceJAYc/pbtMAdx1157/jqDIiy8sm+SxQtBb861CxIJ693gAqIanbDwqAe//2GX7
	2E6PDP1sugXFwera2qjl6sE3KkSd9xVDjFTu5Y27M9x4tQ1CYJ02T2Ev31O2fwSCqUdzY5F0YP7
	qN/LllUIe0UuZoZSBw553RUFyP351cZ2pk1JN3eXAu+ha/MccHQqb61PNfDteU5C9SRwh9z5bPv
	QK9s6S4qBruEQNBxD6hSY9i5QToqBPKxswZjRWBBnc/Y+Y/iBdYZK5o754QfKd0YzVD7JOfHODI
	r0WMfE2i+cO/dGCOWFYJskkrAmg1NivB9a2XpVVbEySyIQigz+OcvZcOsSGmMjyw33nKKf7q0fr
	cpIqZpYcQR+FJZn2bMPDqXl9K7TWeKF03OViIEVxH1rj1cyIuEeffglfI56Pvh9RF8nHA92AuZG
	i7sg2zTjdXozP3GVAG2k3NUP7lqERKcxfXTAicS1R9TiU+Kt/U1/lJo54UNgDfoAY2rK0coWrwy
	DXbZdF0trT9aAmetlHmH4cA==
X-Received: by 2002:a05:6830:4ac5:b0:802:68c:1b51 with SMTP id 46e09a7af769-815ef299a60mr1161319a34.11.1790119667060;
        Tue, 22 Sep 2026 16:27:47 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603fc87cdsm1243053a34.13.2026.09.22.16.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:27:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 17:27:40 -0600
Subject: [PATCH net v2 1/2] net: phylink: allow stopping a suspended
 instance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-submit-stmmac-reset-fixes-v1-v2-1-d92e609be996@gmail.com>
References: <20260922-submit-stmmac-reset-fixes-v1-v2-0-d92e609be996@gmail.com>
In-Reply-To: <20260922-submit-stmmac-reset-fixes-v1-v2-0-d92e609be996@gmail.com>
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
 Stanislav Fomichev <sdf@fomichev.me>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_162748_354712_762CCA90 
X-CRM114-Status: GOOD (  14.85  )
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
phylink_stop(). Leave that stopped instance alone instead of repeating
PHY, SFP and PCS shutdown. With MAC Wake-on-LAN, suspend deliberately
defers mac_link_down() and sets PHYLINK_DISABLE_MAC_WOL. Finish that
deferred link-down, drain resolution work and clear the WoL disable bit
while retaining PHYLINK_DISABLE_STOPPED. Otherwise a subsequent start
cannot resolve the link.

Document that a suspended instance can be stopped directly. This neither
resumes the PHY nor reconfigures or brings up the MAC.

Fixes: f97493657c63 ("net: phylink: add suspend/resume support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phylink.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a1458da8111b..df520d77fded 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2495,11 +2495,18 @@ EXPORT_SYMBOL_GPL(phylink_start);
  *
  * This will synchronously bring down the link if the link is not already
  * down (in other words, it will trigger a mac_link_down() method call.)
+ * A suspended instance may be stopped without first calling phylink_resume().
+ * In particular, closing a device after a failed resume must not restart the
+ * link or reconfigure the MAC just to finish shutting it down.
  */
 void phylink_stop(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
+	/* phylink_suspend() already stops the link without MAC WoL. */
+	if (test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
+		return;
+
 	if (pl->sfp_bus)
 		sfp_upstream_stop(pl->sfp_bus);
 	if (pl->phydev)
@@ -2512,6 +2519,16 @@ void phylink_stop(struct phylink *pl)
 
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

-- 
2.53.0


