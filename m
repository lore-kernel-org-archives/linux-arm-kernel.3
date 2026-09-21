Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D38CC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhWGvSN0/re+XL27oH8EyakYJ2QqZd3jNzma8F4tE+U=; b=09b9d9DA793AN7/toXNF+4cnSw
	gGJKHgbemSQLoHigyykPer11sjLTvSYeUCDCMTdr5blStE8FuB2ZZ5N8mCTj6kGSTouznNg35juFv
	nQYg5+7spZWBk8YVpYg3nYyMJzqJGQ7Wft5HTx95AyCmMjx4yJoGuVj1F2SVQ7kk9KG9CLxmYwMXf
	+YylWNjN4oNbofWek4/xtCvGECjlgkSIrfkWa9monogR+H5hG67vsPPUuuiKp/qXVOky8Sq2ZxVHZ
	NaHVlNQOsDgdIfy/cZQ+xsa+Lh3VC+5CCGsnwV2hzRMv5NoAiZ0BDmE+tZE37sx5IXarv6azrIlp8
	RRDBvQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hHU-00000002tjw-3xdB;
	Mon, 21 Sep 2026 16:54:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hHO-00000002thd-3x7F
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 16:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YhWGvSN0/re+XL27oH8EyakYJ2QqZd3jNzma8F4tE+U=; b=E9ehiEJ5o0OtcN24ciiChaIbhc
	I0QI+kDSRx3HVYtYVtKdPnWyAlu86REma/F87Pq9T8gJwAHeR35DMjFqOKTesXCjWgI2pzWIgHReE
	iSsl2z7t+CqxXwF6tgwLV58Os2B7zZ9kPTfshBqscISVqb0Nr2HprX5c4BobBSDltezNtzJg++/yG
	fATGQqtVL9copqOEg4Ze1B3b3Td5B+mka/fLLL0DLsGLQMwCsKx8XtIVoxVmTf+Mlo0ZafI5q930B
	70kZz66kRb+pE1gN685MD7DjGcbAUfCkuOHRXHx0LUo7l8oq298Ph5uUGXGV2+DK2q+krqrcodcjQ
	t1avxn7A==;
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8hHL-0000000CaYk-40zh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:54:09 +0000
Received: by mail-oi2-x10.google.com with SMTP id 5614622812f47-4b5c61966d0so1960973b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009646; x=1790614446; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YhWGvSN0/re+XL27oH8EyakYJ2QqZd3jNzma8F4tE+U=;
        b=PRhkP0kz/AAiRQzYyiPMJ98phSOtjyrJml/WsqRVaXCjIa8txYqlFqSiWZ8FTT1X6v
         Mv8+prpw3btN2zmuAwV5GqypSwEYIHhUm+WpH+BcTv8DWGqgBjZ4F146wpAAu8LhpZi8
         +uxVlyT9Mznm9/5jPlovZYB2EjvlibqnvxvrOrSqYPTHiQ/0sw1QieoLM3rtbM7Axayb
         KUfdtO1uXdrSq4LKDooiudOZnSCikcBzwUQrw+RqUdEOiL8thvF34C2wRRbzlnH0swLv
         8+DUeOE5qTkkyDbBgm6z2NYF6UJJfudkzBwofAKgqaqV+WPm/OWKVirgN8gjdVy3r6kB
         vD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009646; x=1790614446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhWGvSN0/re+XL27oH8EyakYJ2QqZd3jNzma8F4tE+U=;
        b=zhDPRjFb3+Qk7Yc3xBxwHXR92zcUz2r1cdU0jEzQIe/Pko5tXtgEr7JtKGoDqFVLY4
         OLJYo3V1Bdl2WuWWRhOhZ32bDyY8F9Wi2N8Nm0n47xBnvQdJXtcU84t3akomK1ewgvAA
         jMLqkq2Uxt7v7NCNXjmldo8EzzwYDrwQR5OCKETWxU9xZQTohk96Q9HuTExdhEUrL86/
         j8RVSf9GshBa3ZHdcvopR5g7Le3NL45X7i1bE6mZmWBxU4qwUjhTdcWVjqcL9k+/Ef6L
         VnMCZFm5Pnz2OfoJVPazh2QnL0XPpx4MqGTPpr381ab3O+yDlWtu7YDtf1Z0k6FWLDMz
         Nazg==
X-Forwarded-Encrypted: i=1; AKwUvBxV4QvOH784knCYxubvpOJXZK8RWUgv9CEEXUfj3ogP2KCr58xnFTJSVBlYrTeAQsRnORtHnIUv5XnS6uama6xw@lists.infradead.org
X-Gm-Message-State: AFuF++me/Lzx8pFK+cEiKe0jmjhj4i68sFV3+Mr8FZCxoHjpX8c5Xb5q
	6XrxEfxfOr40oJdUM8vKK19ohVwFeAiss/qEHYb43GDUZtQNdVIv2Hok
X-Gm-Gg: AYBFou0Y8AL6DG0x5S/OB0sw1efOrrT99U9Q3imXENHE6K1HrFmzQNOLdyvH3ZD1RXZ
	o+dhx31DnvPUqDa0yu+/iEAyoM82yXtkEQDbxOc562dYz1guj2VvPNZbRBWc1EmZS3A6CEUKY5q
	SkcsxmfaGZ4fncpD2t1Z59EteMEA8blBqjK33o7Y+M8Uzo/BPTDPRnMmFKqZbgX2HaQ51yOfA56
	VoqjyGE8fzUJGKd4SzGsuyYoIi3xIWSDBI6RIiiQ8k9bqdBPgMIdlc6W5rEWYmzTxTyqZ/T8UT4
	FlpJQfjMqytGZvKzoSQFZjnSXlz/Jjr1QwQqNlhGz+Xs6DwZkQpWSmFkwE3tWW2MXAkGVbcrL5p
	Nue16UZ/rX21PjLXYrti3ks4o0YOaJXqp8xHD5iDQmmVQWapVf+u8l4ohX8q3c338aDK/70MK2j
	Jq4yvkbiFlKVij8XL0YgY428DbCP2N4fARSb8jgJPazgaP/vqGe1iPKRV1DYdxZzqeV3sx/ehbZ
	ohTKA7O2tA1ZSYTsNBVVEfDovxukELEo0lChUq+aJ8NjTG4vQBh/SedtE5L9M2wYiqQaMywWguf
	3zwSAz222kHvm3ENBoWNbqIMrMhfWtGFCB8TW0yzWRO5WvZuCpO2NsmghdHDmlPJYtvjyGwIgTQ
	s4ZsYHUvYdefWw3XNmSD4Jg==
X-Received: by 2002:a05:6820:61a:b0:6b7:8415:d785 with SMTP id 006d021491bc7-6ca9c9551efmr10448335eaf.48.1790009645716;
        Mon, 21 Sep 2026 09:54:05 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d145bc40e6sm510481eaf.5.2026.09.21.09.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:54:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 10:54:02 -0600
Subject: [PATCH net 1/3] net: phylink: allow stopping a suspended instance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-stmmac-reset-fixes-v1-v1-1-87a4e431ee00@gmail.com>
References: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
In-Reply-To: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
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
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_175408_185501_4F376938 
X-CRM114-Status: GOOD (  14.53  )
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

A MAC which cannot restore its hardware after system sleep may need to
close the network device instead of calling phylink_resume(). Without MAC
Wake-on-LAN, phylink_suspend() has already stopped the PHY and PCS, so
another phylink_stop() repeats their shutdown. With MAC Wake-on-LAN, the
saved link-up state still needs a matching mac_link_down(), and leaving
PHYLINK_DISABLE_MAC_WOL set prevents a subsequent start from resolving
the link.

Allow phylink_stop() to finish shutdown directly from either suspended
state. Leave an already stopped instance alone. For MAC Wake-on-LAN,
stop resolution, drain pending resolve work, complete the deferred
link-down and clear the WoL disable bit while retaining the stopped bit.
This does not restart the PHY, reconfigure the MAC or bring its link up.

Fixes: f97493657c63 ("net: phylink: add suspend/resume support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phylink.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a1458da8111b..8f9278112623 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2495,11 +2495,17 @@ EXPORT_SYMBOL_GPL(phylink_start);
  *
  * This will synchronously bring down the link if the link is not already
  * down (in other words, it will trigger a mac_link_down() method call.)
+ * It may also be called after phylink_suspend() if the MAC cannot resume
+ * and the network device must be closed instead.
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
@@ -2512,6 +2518,16 @@ void phylink_stop(struct phylink *pl)
 
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


