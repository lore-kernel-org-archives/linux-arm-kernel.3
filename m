Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8DDC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXt/uOqbphj4V91HISks6B4J5Xr/iPtpqYGyXndRE6o=; b=iHeLJZywqvO6UbQZ3K9AwmlDrk
	ZnAMWhxT+7+WHS+gOU81eYu0iYvE5f5SICzyxgyGWK3xWSn5rjXNxq1ciwCLzibcBq6DIB6T9iq/D
	IUffJStNfpB3IUaXxYiBrecx8YAGyhQgvTVarWHhhaKRVfbrY27IAe6Nl3xQNrS9OBWjiuxM1PvdS
	T1CUyV9h8/eSdhc1dK+WWZFc+p71+Nt4rruMJiSP+0aVtOB3wdCRBZdDuE24XfTRglKRYpi07oSRI
	CJT/LrjnT3zxJtLba4IpnaHPP2LENc4TfaRtluwvX4BT74UAvovT1WX2yahfljCufqcIRNyfNVaCj
	2qgr9aag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNxs-0000000ACJp-2SHV;
	Thu, 30 Jul 2026 10:26:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNwx-0000000ABeH-0RX3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:25:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49550ec592cso3621305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 03:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407113; x=1786011913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lXt/uOqbphj4V91HISks6B4J5Xr/iPtpqYGyXndRE6o=;
        b=s30lEpjhDm/owbwYIztVCWYuFKc6wguuCsLaNBug3Rhxbhy4IklIMj0/1GDx+M1qLR
         tEWKVVJBjWv7hgbYY27cyNPyNUVWqrP5ZtxFjKyik7ONRy6dnPprLijKqxQqW9ioCnCE
         OGMB2lBf9F1D7foRpjG44rcOp/ZNj7llW1fXwdJXyLzkLyFQvcVzZFOwhHhYQ0XJlv8r
         cYzSwS30J5Fx4PZp9rla/qsBHRu6utwp9iYH55d56MK9dLVnEU5ZtjzNjPJjByNsuIla
         lRFsNhPEe83D/2WLPvr1z7T5Ba1rMPzHem6Qiprr0Oy63trgwM+duzUXjuvguIaBjZ6p
         DLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407113; x=1786011913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lXt/uOqbphj4V91HISks6B4J5Xr/iPtpqYGyXndRE6o=;
        b=HxBHG7xjJpQ5yA2+QeYv8u1OP4rQdkJLn20TW+7Q/2rEyyxhnHg4iWdH4/PwX4wTPI
         vAInRuCvbVweVZkXO1DWeWRE9SPmWb6gG0PRq0U4suNb9L39fQegnjXN3jLYmESaUMFT
         QKIls+yGHTbnO+spR0XuDYyBxcK0v/n3cAUero4g6hWqsMZuUYRynC00NyfkbowJ+OPW
         d2JibH2XoY6lqeH6IaBeMvrR01xc0SdWF2Z4pn2Su1yTmiBq7n5QB1otSyxZwyADBYdf
         DHDKzSPdFqsnszNzsRSuxEj4NEET0CVbw4L4INDXNVLlCHZfJ2SQDDTmcJvNpJc456N1
         1E5A==
X-Forwarded-Encrypted: i=1; AHgh+RrxzdxBpe0plgyLJwKth/o3cUIXjudxO8ps2BLg0jgpnfIOs4Oo1HffXTTyso9CVQXjz8XBjo1ixejj+IlZqGn0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8zbZCp5pHIDI2BZyT7ee62JsMUWOqDm7CDCeQNermeDkmW8aJ
	Ae09xNqfbOizFqQqCAKru+sxYOdKfv+IUWi4RTZDdB78JOTzHNhUsNk3
X-Gm-Gg: AR+sD12+l/jWaal/vkb8nF44fPNw8erxrsc0rLf1x86re6jqJdkEhP313Ws26RcxcIy
	1S4U/wKV6N0YSGYcWKvkxiwmb8glo+0NF+dEfu901oxjpvMU+7l7gH2SCg0EgYaV82u8DlLGKdn
	dLB8QTE3vDJ9SanoblAbu3JaC5Re4ipAAVFc+rUMOjFzes6/xa8OSm/R7xpaPGWzt/+6qWWdxpB
	Kn7OoSw0wsVU44S/hIzHw/APcqS/V8O32HYXUNy/d6LqEiyHBobDbzt/yVSqPAqy8KWiPUaL6+P
	EaQ3rI4NrHzRSOlmWF3rHVR3sCW1gBmTTTOllgeMjbvvFVwjPyPOKJbdT3JL2yqj0BDJ7Ktc+yj
	205lEuzVxuOSNcWM8/vxsQle9gWfU6XjTQzgBmioJO+wXCYthXhp6dn8JhbKiScMw+uydBJHr6e
	goSX6gvSWFtGIL2aPS/T/G6SmXZAKMorEfqkvbBnU101tHUN+VnTBdUPuIlzgtZZWeOivQKGiSr
	V10RtgkLbeHb6FgVbcxh5wwPD45CfaE+lbLm1MiI7SZgcEg6kDPMw==
X-Received: by 2002:a05:600c:45d5:b0:495:6022:5a23 with SMTP id 5b1f17b1804b1-49801f2b8c2mr20936175e9.19.1785407112977;
        Thu, 30 Jul 2026 03:25:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:12 -0700 (PDT)
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
Subject: [PATCH net-next v10 08/11] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 30 Jul 2026 12:24:19 +0200
Message-ID: <20260730102444.1967900-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032515_203421_EB289644 
X-CRM114-Status: GOOD (  15.41  )
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
index d38820543ae4..f45bdb8c3647 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1041,6 +1041,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1742,6 +1748,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..4af8598b819a 100644
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


