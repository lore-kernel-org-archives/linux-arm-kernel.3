Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568A9D2629E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 20:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2eD+o7ZJqt8UHgxhoi1YhoZ79UecJ91Sm+qVMqrNb8=; b=qGPoJdH1sijxa2CmIhoFbCoJGe
	etckC56p6sqNZ/BFfJK7+Ko/iGhoQBd9MSaqhdX7p4NPmsGdzjrERImOjYBKZai4iBp7QiePKRY65
	h1U8WWdm7JpHhaS3YwSCgwytYI1LoUUIW1WKWks8rS09JZnBQdQTtKE5htgxw+fe+tQ9cZ3y1NGHb
	cLVvtB6OAibVuQRU/6P+bkwcxyHAykXPilwFoxobVqQ6NuJFGOzCoH1L3EXuRZ3TkdFFFMLDy1+yh
	cNGyrNROkgj4xyeteed0RJztBXhcKc4YnWcDS9QpQx7fePR/xozFId1Ve/RVQhHSNaNaWhB09g5uw
	woLgCCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIVQ-00000004Rlk-0fuh;
	Tue, 20 Jan 2026 20:39:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIVM-00000004RjB-0Xat
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 20:39:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-480142406b3so31838595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768941550; x=1769546350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2eD+o7ZJqt8UHgxhoi1YhoZ79UecJ91Sm+qVMqrNb8=;
        b=hXGxCGKpKqBWkz2G9aWhTuHR/6vMUowTMs/8TRg8R1z23SLVYtwks2kRbGzLEkI+a3
         Ys3HSBDurresriZDc+O6BL2nxBmNtJ1lE4twHl3+kSY62t19sd4O23oxFzwvCJCOXbAP
         cobW9NEAG1TUP7zr4jSwUpsyw/mBm0Bd67EJVyFQcvg/XH6ymGm4SGlKx4wBmOP8l+It
         nKjZ6kY7XMxEQPk5Otx7v6FOXZPqxhx6TvBkFvI7oczgpOpyGUUIzh8TRRKfCffR/ZlO
         N18nXInFC4WTuYNHIxRnBUanJ1GY2XCQhYylzbqk4PNSBZf9JxMXEEa6Suo1rQjxCLYV
         fo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768941550; x=1769546350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b2eD+o7ZJqt8UHgxhoi1YhoZ79UecJ91Sm+qVMqrNb8=;
        b=PbL2M7pJP3aqfBuUaF74DdTPsThPqPzqnZqj65Fflwmufao+jbhwQdcLXIFcEkMQCo
         UL7bioHP54czQMHHMJF+xWNpOlUFa3zEJ11l4PfUhQBVpI5MlvUSbtYqUoCjcV0zE4Pw
         NJ6IPZ9MDBw76KAis34x6RZITxrBwKHo6c92GvyxyK0Ne8YRcUpz9Zc5SQ6XTkF/1Up8
         OSgx3ubywDb33Sh8Iplaxa9ws8fx4U3mf5Ib8Pz3u1lqDly2ZTdstiKBeKB3pl7smGCK
         zV2GrQ1wN9THfyA0KPXVchZvQc74UVmF3zEJ/2Yk/PqQZe5/GtdV6+OjdsGIXPMbybmc
         ZBNA==
X-Forwarded-Encrypted: i=1; AJvYcCWmybITVxNVFDaLLNg8e2cmAZNrEGgmfwAvEGmIo3553EUBmYbh4AbvrQ1U7tJcef6DsZNw14H1CeIscX/TIm2Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzOujAwn47QfqSJdCqipSTYTeyn507q2ka+dBaHUB/0nfNY0VoE
	p/e07Sv7UwmFoh1yQXeZYBKogEj+p0v/6u3f9tzTCXyTqqJCPUUCibtS
X-Gm-Gg: AY/fxX6XV43c2VA3OcmFS7bPZCQtNrsLopEy/vv+3U91iweh8HKCIhyT9feP1xYfT6f
	rYn30dBm2lK8G7jRDfpiibLljhmLRfi7i4kSlzZD/zcsm66IbxMgF37c56TUIpcnsYG4BB4lYot
	m7vZbziZ/JaCqkqok4DkuDOsSeVpBkj0EPCNz++I+BjivrJOCYyAOn9oIO+Ydq+rvURvaf5cgEb
	/mnf9i5h2ovDYGSFAA/8/CrrN0EmKqtGHl9kfnN9t3XHNIrwIiagAc+fUbTEw5UvQ0VWvByCu9j
	CNL7Lnx/BLTG3WRNpt5s5eBqiBc2DM5+8HrpTULTXqIatTkTXUqNC4bEouSrb4Ilj8gNbYR08t0
	Z9/aUPmib4Byz0003b+LxhMPllSIOs3l+z9I0bYgZ9luKM4tqLvCk5bQHIJMh+9QkMuN/pT0GTj
	ZTwHJcGZ45PIP1StZt
X-Received: by 2002:a05:600c:8b55:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-4801e2fbd61mr211779815e9.1.1768941550130;
        Tue, 20 Jan 2026 12:39:10 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:39:09 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	francesco.dolcini@toradex.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH net-next v3 2/3] net: phy: micrel: add option to keep the preamble before sfd for KSZ9131
Date: Tue, 20 Jan 2026 21:30:03 +0100
Message-ID: <20260120203905.23805-3-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
References: <20260120203905.23805-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_123912_183905_53BEAC7B 
X-CRM114-Status: GOOD (  15.66  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

If the PHY_F_KEEP_PREAMBLE_BEFORE_SFD flag is set in the
phy_device::dev_flags field, the preamble will be kept before the start
frame delimiter (SFD) on the KSZ9131 PHY. This flag is not officially
documented by Micrel. However, information provided by NXP and Micrel
indicates that this flag ensures the PHY sends the full preamble instead
of removing it. The full discussion can be found on the NXP forum:
https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/net/phy/micrel.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 05de68b9f7191..a51bfe4a8d7b5 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -101,6 +101,14 @@
 #define LAN8814_CABLE_DIAG_VCT_DATA_MASK	GENMASK(7, 0)
 #define LAN8814_PAIR_BIT_SHIFT			12
 
+/* KSZ9x31 remote loopback register */
+#define KSZ9x31_REMOTE_LOOPBACK			0x11
+/* This is an undocumented bit of the KSZ9131RNX.
+ * It was reported by NXP in cooperation with Micrel.
+ */
+#define KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE	BIT(2)
+#define KSZ9x31_REMOTE_LOOPBACK_EN		BIT(8)
+
 #define LAN8814_SKUS				0xB
 
 #define LAN8814_WIRE_PAIR_MASK			0xF
@@ -1500,7 +1508,11 @@ static int ksz9131_config_init(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
-	return 0;
+	if (phydev->dev_flags & PHY_F_KEEP_PREAMBLE_BEFORE_SFD)
+		ret = phy_modify(phydev, KSZ9x31_REMOTE_LOOPBACK, 0,
+				 KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE);
+
+	return ret;
 }
 
 #define MII_KSZ9131_AUTO_MDIX		0x1C
-- 
2.51.0


