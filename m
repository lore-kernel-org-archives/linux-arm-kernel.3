Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715B7C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yf9IdbuXbTrGB+Jor2tK9mk/PmZX/yXtOromeytnBF8=; b=qrw0mgORYSKQGHEgcUE1udFcL+
	xmcGCPGVoRbU8r3y3U3obUxLv7DzLCi3l9EzwJSrb1O7XY+ODxMJgTQLvMPoKYaYAIsVf/wyxsI1c
	qDToydfWcWTU7kNXGIzuOVMFirEn5hbxFS+QxAvYezB2o0Y6m0syjuR4JCh1yp/2615fUdhpWx/kd
	mf/V2Nv6Kr+jFqYHvvgxTDR0BL5P4zlyaP3naCYmy8dft1zbqdWawB3ZcCIFbrmV8TPY8Y8pRMQYI
	ZIpDaFC6ou4lNu+piHhkKpv8Ozobip06Z3IBVjlhdVtiVNaohYLTfsvT9iAF9PCcsVHejLNSw+PA7
	znKko5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qpB-0000000D76f-0rTW;
	Thu, 24 Apr 2025 07:16:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qlD-0000000D6OQ-2IAO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 07:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Yf9IdbuXbTrGB+Jor2tK9mk/PmZX/yXtOromeytnBF8=; b=dcsE7A/Up39isSnRBTR6R42c+R
	BMeAQXRiILZMkiaVUNTnJOPy7PyZNRGhOAftDPBdEMADjrHzZrYsoZ0hDJ2MMF5IvPbYUABJqbTYl
	QQt0RvplUAB+aItsUPyDEPpXX5BgvcBq/wiiGSk7e3+L5RkSKnPUqjszXFe3VzJfS9W3oLF+OuW1B
	yIxg4CHVyhuDme1Ya9mPXxgA7/v/E2sd/HhW016lumz6QFNJPizDBoCoXqr4sIqObORReH7/4rQdt
	NiSCEnv83SZuMj6H4VSurmF2+IIIxw/CQhrwCfbyBx3k+rOmQ0Viy5C3vOCHINs4ScVcvzm/SoGjc
	02pEQHiA==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7ql9-0000000BXQe-1IF0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 07:12:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E87E043A53;
	Thu, 24 Apr 2025 07:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745478751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yf9IdbuXbTrGB+Jor2tK9mk/PmZX/yXtOromeytnBF8=;
	b=eBft+tOCa2YXhCv05v4dwM3bKfKD6lWPPPnA2h7zJ0Gj8ZrCNoc4Av1+xvB2Qyan5X7fu2
	JygaDBWuYgEdUg9Bky5hrTVPpi40dK0SjRxqpQuw72HTmhV9OEGKQd0ayMM8/02LhiwL7a
	sH2/ECIq4RIZKe/W26EKxpx3QvA+N3WkjeNA1ZHkqJ+S2JKUj4DBpfTS0hKBeP8GIOyuYg
	L/8hkxvlb4L07/n0hEe/yDTDcwFu8o1RZ8OJzMVVZ50I6gOeUNluHk6jz2+JrBF6nqO2/z
	0qikMOCHd8c0nkmJapxw4MgulPupvmK+/pS40jKrNvp1s8o+pE0VG2hnrzxboQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Russell King <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v3 1/3] net: stmmac: socfpga: Enable internal GMII when using 1000BaseX
Date: Thu, 24 Apr 2025 09:12:20 +0200
Message-ID: <20250424071223.221239-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
References: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhto
 hepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_081235_585277_DB354CBC 
X-CRM114-Status: UNSURE (   8.68  )
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

Dwmac Socfpga may be used with an instance of a Lynx / Altera TSE PCS,
in which case it gains support for 1000BaseX.

It appears that the PCS is wired to the MAC through an internal GMII
bus. Make sure that we enable the GMII_MII mode for the internal MAC when
using 1000BaseX.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 59f90b123c5b..027356033e5e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -256,6 +256,7 @@ static int socfpga_set_phy_mode_common(int phymode, u32 *val)
 	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_GMII:
 	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
 		*val = SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_GMII_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-- 
2.49.0


