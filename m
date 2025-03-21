Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E617FC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=co8JDmZx4HmArnDvcnRVxtXy60X141/SmNungt+YCYA=; b=fgc2oEnstidm9cbOjzH2gGJO2v
	Vs5jiCatnnMwwQeNPI8U5qhB0eOP1wPF7bzyTQyB1sKyuPCfaBtdJYqJYcDbUKXNJmq/VweMECQbV
	7pzMrhJjxXzFPyV74xk39Tv2XrYiVlLuecFuXmQH3xVLPGgNVmurEI5rexynViwyaAM6hMoVT27oo
	QFIWHVow08/9OZ5WuyREjUPQvjq75VyP+UfI0xPmEBuf4bJLauR6GPjKEQeKIzFuqQTCNb8v1NVQL
	gIi4pWsbWhxst1JY4q+aXJ5In5xyvz2cVlHNij8wCiKo0Aq1NHR+NHl4xM0YJGw5PxsIDnqrjOfBF
	KKwdT62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZq9-0000000EYvI-03AN;
	Fri, 21 Mar 2025 10:43:01 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZiZ-0000000EXUP-25qr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 10:35:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05FAD432C1;
	Fri, 21 Mar 2025 10:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742553307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=co8JDmZx4HmArnDvcnRVxtXy60X141/SmNungt+YCYA=;
	b=CeSI6YTZlyjSoGnwVyaPrxNXGMcD0MVY7JCZqknxbNudjZRVwShUwplGqX/Rc6KTLWyad/
	PeMmQE67B3ZVIvVmQkFb/eOeRRoCq+GGLkA1CDqgb+O5VYFg7SVQ3HSfFHIIsetfiZnCwS
	DR0nW7NmN63AbrL/Lc57umqyo4KL4buT+yzTd+/gj5+agAZP66mSZKO6JbN+k83dzse054
	+5JbjHRIDf8xbmvB5IjrGyBCPK8bKqvyuEl9kp6Qt9Otz6uZl9IBvX3R3yX07HBtTHxnPd
	4EHidxqS7qsPpAVfmuE4YL7vMk5XKkIZEmANEoyjRWsSiPIS/ejCrC56+RLvjA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Simon Horman <horms@kernel.org>,
	alexis.lothore@bootlin.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH net-next] net: stmmac: Call xpcs_config_eee_mult_fact() only when xpcs is present
Date: Fri, 21 Mar 2025 11:35:01 +0100
Message-ID: <20250321103502.1303539-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtheeufeeutdekudelfedvfefgieduveetveeuhffgffekkeehueffueehhfeunecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiiv
 ghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_033511_821818_E56D168A 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

Some dwmac variants such as dwmac_socfpga don't use xpcs but lynx_pcs.

Don't call xpcs_config_eee_mult_fact() in this case, as this causes a
crash at init :

 Unable to handle kernel NULL pointer dereference at virtual address 00000039 when write

 [...]

 Call trace:
  xpcs_config_eee_mult_fact from stmmac_pcs_setup+0x40/0x10c
  stmmac_pcs_setup from stmmac_dvr_probe+0xc0c/0x1244
  stmmac_dvr_probe from socfpga_dwmac_probe+0x130/0x1bc
  socfpga_dwmac_probe from platform_probe+0x5c/0xb0

Fixes: 060fb27060e8 ("net: stmmac: call xpcs_config_eee_mult_fact()")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
This targets net-next as the blamed commit is also still in net-next.

 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 7c0a4046bbe3..836f2848dfeb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -524,7 +524,8 @@ int stmmac_pcs_setup(struct net_device *ndev)
 	if (ret)
 		return dev_err_probe(priv->device, ret, "No xPCS found\n");
 
-	xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
+	if (xpcs)
+		xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
 
 	priv->hw->xpcs = xpcs;
 
-- 
2.48.1


