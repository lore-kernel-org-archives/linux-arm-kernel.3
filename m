Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A3ACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=; b=4uqx9mssdp6U18bxRlwnQmqE1c
	ZspQsXNGSCAyXuBPrOq5j3oWfNhopj9QEXpQS5eUUzE5LI1jwTXS6UF6LhWUniV9J5q++M45DRI34
	IbJF7lsPSkzSB77D3ALupZZNuZ1dZZ4tjNJ6kDJpBGaSmjLJsOScq/+ak8EFqlj03X6gPjzcO3I7T
	8z8lwVYxwct2y+nBp6jRkbBig+2G//k188oMW1YHOu82lW+HADeis3eruuWH81mHm0dUxpQd3TDOq
	MoW3YIjrPtUFjKrEpO+WJf71Fdg88XhnE2NgrMxay7VfaU8/Cr2mQJ8HrgS1/JtHMtLxUmaxa3M84
	rPdO7FnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6T7-0000000EBqn-0xRs;
	Mon, 15 Jun 2026 12:31:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Sq-0000000EBY8-3z4K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:30:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490c1915793so29038625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526651; x=1782131451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=;
        b=cQmCC2W2CyqwbQFGcLs2jougsWrnsjWWB0ZkwIfCzCEJNb9SBLyJCo3OOnyuc0R0rQ
         sqbciFSkkRK372rsed/z/rj019HhFnJm5H6K1ajbUx4oyW9docR/jv6Aep8zd20Abwqd
         x60LDMOntlVUy6e9qsPA3DlKJGkc4Be2gGA/+S9REJGHa8GRfoXMSojJERfjrGgkFCrL
         17AKth2/kfuvKIauwxbI7L4iPK1ZKwYFWBnWtty5CHQET5z4zYbApa1nWROjjk45VHWA
         AjwiKOOU14uVcOA9WstNMvC16UQtHTyV5MufWdUOHAgWfrE9JxzYQuN1fEq9G/+4E0BG
         as0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526651; x=1782131451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=;
        b=fIxklk9stq/8xU9KpAz7mVclHugtcLVoIsgNk5fRoj0I+GJ0oF6t/fgiKO6NfaZBjF
         4yG97GdnvekcZzAatC2ytGHNig+FXGRZsNbMHAwZe1uoP/alouFhgG4uuf2K8FSX0UbE
         03nKkvPuLhCylY9A8/QS7oqHBO0PyQqPDrgTMP1qeyaTN4F7Bk2yOA1rDYzT8qJIsQli
         F3iRxlm4Suo0iilQI1FRsFa9DQbao/K53ZyClnt6vk+xVZVmfD581DDp32DkXIW0pIml
         LP9mTev7G0xHyASZFDOYaABEhXZYNXiPtt1ckRL55tEknAqG4QpXdSHbwv/hc6OdFwG0
         Du+g==
X-Forwarded-Encrypted: i=1; AFNElJ/r7+EjkRWaeJKEVJ3htYK7pktjD9xUxez44Y1z521sAI7hYwhP8ZTifR61LE9G7W706+TsdEUoGvJQ6DO2w9BR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw68SM4z6ksFref7ZGukHUfUhWthkqFY1hwr60Pz7doo89WfJCq
	gABNJKUY66xskskxv1l3CSMdMFvtrmhS/3+OE9LuqS/1w9X1ZAl7y16v
X-Gm-Gg: Acq92OGhmxc4M3HIQ29nNAec9O3/OlSwkZ0Fd6Nl6Y7gB5FHRjWE7racz69h99Rh+4Z
	MiUPWAOfHvh43AVLAlMYl2qnniR5AXmme08maJ5KmMLE8ttmSp0w3Hu3oH9G2pPxDDuj7Hm1NXc
	qogrAo9aB3OhwbwvZfA9LfcYKQy0cQwGv81aKjQBdekiBTjd9JAKpgH/xXF6P1F+d8j/3qHvhEX
	CLLbjI6cRsYLK1WgcqAptvYnSJMDmNST4Yo7kC2HtIBSeY//TPs0uytycUjJlf1lIts60xL+Cq6
	XrH5NDRJI+zq0tt9qIGNnRt8f16Q+r1C1as7XyARXHluQY/Y5ztfq0HikhzR8XOMbXb0apQTpBO
	c17gpavL9/nQduSEZBRMfiRgtya3mNGjYiTtUqFvQMkp2yoNSrutB4gjxUj7ftowORbxvm7GVG6
	Xc8dn1siuH7hqAKp2zZtmE631y0kOKK13Ke1ReTG5XCxZeKFNcNcf905Y=
X-Received: by 2002:a05:600c:4f83:b0:492:2c87:3d34 with SMTP id 5b1f17b1804b1-4922c874027mr31192735e9.15.1781526650826;
        Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v7 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Mon, 15 Jun 2026 14:29:45 +0200
Message-ID: <20260615122950.22281-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053053_068321_372C6378 
X-CRM114-Status: GOOD (  14.63  )
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
---
 drivers/net/phy/phylink.c | 9 +++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0734c98498a9..1bedac517d21 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1035,6 +1035,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1736,6 +1742,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..eb6c6ca34147 100644
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
-- 
2.53.0


