Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5623C5B561
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VB96Ldc2jz3Kca5DqAJVE1SCjhA8uLTE3bNlY0xHhzc=; b=2eBIPWNtj6PrS9STyRV5/omK5i
	Qklw4sKAdqx4mV5bMLjWzHLZ34JfsVGnbBDc1AIYhuOsD5kRFwSUSUiJneuqjPEfqTrTBwPetFX5B
	z2GzidJkJIcP1nHomWaPbI2XT+DYBNkKkMGmoj1jeoZqVc1Px95gGImMhuraLpPvlBkxAxOHyKnEc
	xDFzPKSZ0sGs2mc7z3jZ15Hr/cTIn8UWXMZn5roi81MN6eDQhe1k/D2Hw5RqVO0/zCG6cgm3i+93O
	Q3CAdlcBhVkASmAGGN6p2F/yRDX36FtoadD1u79+ihOqtG3x6mFfmO9Ri4GsDYldklLHWjBTnhQR3
	8W5qxhFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABY-0000000AgPI-12vT;
	Sun, 09 Aug 2026 20:31:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABT-0000000AgDl-0oOE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:31:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso8688755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307509; x=1786912309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VB96Ldc2jz3Kca5DqAJVE1SCjhA8uLTE3bNlY0xHhzc=;
        b=WttS58vZVfkggbMy3sEnDcRF0jhySb1VddLh22VfbXDugvwJiM18OsO+Yjmt+qXYNi
         Zizgg5oE7y/Vv6bIlYktttr9MqT+tan35DbAgfgev/FM7oYtyQ0dArPvKXHpSJtWE6sb
         2hOx/WUyBTofrgNz3kfFhN/z/VqX+PfnkhConlQu3QYJQHPRWhE0MTKTSZwyzDwjwGhs
         7gh5Jjfejscts5LFGw2qNrZys8WwLrgs6LhV74NUaKQRt9IfX2nlgfeRCDFDO7ILVFqK
         POS+im+ijWBD5it6Bn+Zd2GcpFV+SP0kZufUTd8oH0797bUbL3ZNuSONM+0D5X1BUJJB
         Xfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307509; x=1786912309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VB96Ldc2jz3Kca5DqAJVE1SCjhA8uLTE3bNlY0xHhzc=;
        b=kkHipfoYKq2A+xFrW1BWihUDUPcho5mavaRredzLIRIixmkamv3yGiQuvi/hGkcWcq
         OPH7cMaexVeoxp21wmEk8vu5KKWm5TvgnVO8RfrGn8yoFKgAOrUi04o7CW7viOB6nuRJ
         xO13fwPQByQeyvtqFM/qCkAuwrjt26RcaiKpi9NKdJ9d/W+lmC59BsVRY0kQaKDYs5lN
         uJGkhLozOdrnNl4o4l+rUeCw5T1W4Uw1XVJXl28CaTGtqTxeOE6kKh1TTZO/2SOVTHOE
         jKnVxB1jCc3ur2ZNJezB9Kbmq3QVBtc+aLAbzOVNOM1F9SI5mhdft68BDMAZO/mgMOFj
         5z+A==
X-Forwarded-Encrypted: i=1; AHgh+RqzS8ObXd21AmmHJ4Rfnk5E3c5dzQvNcX0XZ4LnGa1z6wu5zjytmAghRll/Lm0SkCyPWJDSk+egnr5mLRJYkglG@lists.infradead.org
X-Gm-Message-State: AOJu0YxQCGxrCvLViWUOOy5LZnbOYPXeT+pudT9nDetT5S/u3dTMMiw1
	YjrgATO7v3aYYYu3qxSUfxIV1kGuRAaZ61DYe9xbrFXX7dJ62657xRp7
X-Gm-Gg: AR+sD12yRuw9YqvofWXJNpw7bvOMDdIcPbSEzvuNCpwU0IH1tV6fGECBZCv3i1R3Ygr
	mJ2O34yV3oO5iOAuir6hrbbq3fPbM4aKHn1wkzEG05cFcMa9LZTMwaE26AxqnnpzEChGliivMd/
	NVSfgBv1oX+JRD4SLowGO7qkSTiAUehGx8QQfLg4Ct4TUCqo6dYcCWu+R/bMFZFy2yFT8MN/DvF
	rpEvrSZGbX35O4hSiwHhR/Y9dKwSr41Zl9w98Rwzf4BivWlAfSqmsOyp0QqB1EI3hsp3MMhojmF
	RzdO3WFYWgpha3WgWQCtE01zh1VDCd/+JkVVgE7qe0Q3tTMywONiRnlU8bxeBiFkSKhlFlqlUBz
	2Za2LqO89Eg4eQAlVQPAd/mJxcVg4r/Q0MokgHWB7ZN/yIqNIkBAJIXhllYuYCe6pmWQYU2knOC
	jSxBdCp/C+zRfaZ2/CmHUHriuWuDcRRf+ZhUQzTj+niQrRYkrjtpiBzi3h5fpgcYS7sGHbMQVfm
	YM+4N/FIF6lZe0t80AgkikSmw+d7RZlRWMVY7R1410c57Ar
X-Received: by 2002:a05:600c:470a:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4995e0df176mr198258835e9.13.1786307509452;
        Sun, 09 Aug 2026 13:31:49 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v12 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Sun,  9 Aug 2026 22:31:06 +0200
Message-ID: <20260809203116.640271-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_133151_272412_846220D4 
X-CRM114-Status: GOOD (  15.82  )
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 191c902d4008..d64fde37eb2d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -982,6 +982,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1687,6 +1693,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ca9dfc142388..ea554c0d41f8 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.53.0


