Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B515C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 10:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hG/K7/CcnoPnU06F7gqSInpeWfEZ3X7ik6awgPKsA9U=; b=nq196flgfyCo9WBAuLfBm2oltS
	zxhsIsJEjWvczz0XNPU7zeuSGCtlWAqwtbEo/I5R9z/SPO7Fhyzc/+YJ7PTLR/SE9kGRrXZpmjEx5
	bJB1JVJ7FPygK1qdttB2eqFB3jVKYhoTLw2ZRCmEnNbYG02GqM9cR92AKuyd2XFwuYxuIZuBLuJ/J
	yl56RgRDsYiJgg63JvXJVB5NJpb6uGZJXEzclGEDZfYbxSyzDLfcdhTEAG6wEMiJJteedzb5LrGVF
	7L5mL1TOtm33DV8uI8ZkNMvagyR1KhMn2jTxpFl2HKbHXzLQieNut6OqsguTSChbVMwif7LhEKZEJ
	Qajpa0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhg0-00000005pVY-0Ry5;
	Sat, 10 May 2025 10:43:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhNl-00000005njX-2ntc;
	Sat, 10 May 2025 10:24:38 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a1d8c0966fso1477004f8f.1;
        Sat, 10 May 2025 03:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746872676; x=1747477476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hG/K7/CcnoPnU06F7gqSInpeWfEZ3X7ik6awgPKsA9U=;
        b=nPjtM4yw++WIvweUNCRzaGGbfu59NyWX+bi4Qb9qizZbcFvlDPNXfRUve1gYPoWwEB
         Dc9jd8jwcZJT6Pd4+KaiAQ2cK7+Uu1YUd/1UZALBYETEQULFp4sAfiAInfmBGCR1Di3P
         qupklTLm5z7+BAeW7R83JB6CmktArAoOyvYv0leuZBbFLZEGYY9EhjZVV2VPdIteBhGi
         jDjKceo3WIHt95KdE7jdshfGdpRW5V70F1SpGZ2p4qZr299tGcqdTE5SQRNDNGP/YXjO
         O9r6HPvzYVOKWn3inzUikaFctPGMgf5Snf4nZpItKlVkYqkQWqCK6eXPrywYcTZZaTKT
         r88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746872676; x=1747477476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hG/K7/CcnoPnU06F7gqSInpeWfEZ3X7ik6awgPKsA9U=;
        b=wadahdOicgoMFqS+6dKgDBAHjQ7NB01fZgs+C7sO7PDTpFagjIuDZ2Zag+jG8Z/nBJ
         AcGwAS9oJmaTCIWe11h/t98Lgm/1duRD1Fbafb0+LrBjhT6+Fz7NKjLIpT7wvyqmCGWe
         h3YbdsnrqIJ0QlfQGT1BSKsBkxaeQ2C+RSGllsPORWhEb/UohLs5GyrbhWBGlhe2xGD3
         hHeDjN8yGZPUFyrD813Hxqn4S69Ld02GnSN/NtcRqFLlVG8ljGO/dHzd9rUjMWE8a8QS
         ZcuTzq6SePfCqJbVr7GX8EUn4+9/oOktjnZQd8TmuIaUiSnXCTn09Nzj0v8dCQn90x/g
         5Glw==
X-Forwarded-Encrypted: i=1; AJvYcCVEb/MIMMndDvvp/5Qye2kOUaH31Xp8wFs12ZLWpcUERWTXibjvpU8TjtqOgdJHCakFNyhWY1+F10iW3xR76ug=@lists.infradead.org, AJvYcCWI8YRtqc7hcYiRfngklO4jKfcpiwq53uY2q7Mo0TztR3/NmSvCaBFgubjeUkAwNU/U8X/WBS5jID4HAHmVxWHe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5/Eas0XPZiw9wqHQKpan3drfEOVl+belQTJ5CxzlGD3TjixVw
	moWc2FIZzINIpVXFnArQ0SvxNLS9hXm7oTErnnq16HA7QQJTFws6
X-Gm-Gg: ASbGncucz0w688rcg2SNw0xXNZeVTwNzuIq5rdzIgL3Jh1tcMrJjR3UYJu4mZWQQidu
	j7HN/7yaRFWgTm+Q8OIzQd6TsT74S5lR0Kgw4bGpWNDnIxXsuudIA/qxrjaOOgczY20CLkQsHLd
	j0TXJGLFnvLiZE2a6PzDlfJYhm6raQJ1eP7/xrwcqH1fFXi5X4ItYglhBhfzUoPRDL2OiV8sA2D
	LJLZhSR0xzgt1oC4Ra81su5ykRaA+rG9ICOP0eN/u2g/MnVFME2vz8wCSXMrB7d+yXB36nzvJm0
	+5hNBrghqjl7/iB41dnvNfLdMLm1u3v7kC/ixzuy7boTfizZoNwsdbUFc2nUOFi3y6RLxYYLkSE
	GNYvuVIMoEv+hfJKmEveS
X-Google-Smtp-Source: AGHT+IGg0viPLMVzU1ZZnxohpVFCHhptymHD57tQJ0jp+PpbU8jq5GZV781lNRt/rouBpcfZ9YplfA==
X-Received: by 2002:a5d:5f86:0:b0:3a0:b559:cf35 with SMTP id ffacd0b85a97d-3a0b986af1cmr9537590f8f.0.1746872675757;
        Sat, 10 May 2025 03:24:35 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm57981265e9.13.2025.05.10.03.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:24:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH v3 08/11] net: phylink: add .pcs_link_down PCS OP
Date: Sat, 10 May 2025 12:23:28 +0200
Message-ID: <20250510102348.14134-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250510102348.14134-1-ansuelsmth@gmail.com>
References: <20250510102348.14134-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_032437_707286_58D1078E 
X-CRM114-Status: GOOD (  14.42  )
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

Permit for PCS driver to define specific operation to torn down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called before .mac_link_down to torn down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 8 ++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1a4df0d24aa2..39cd15e30598 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1009,6 +1009,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1686,6 +1692,8 @@ static void phylink_link_down(struct phylink *pl)
 
 	phylink_deactivate_lpi(pl);
 
+	phylink_pcs_link_down(pl->pcs);
+
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
 	phylink_info(pl, "Link is Down\n");
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index c5496c063b6a..8b3d1dfb83a1 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,6 +494,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: torn down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -521,6 +522,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
-- 
2.48.1


