Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB250C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j5WRfwe5s7CD4n1/aXk/GuB0uSEMmPxIt38DrP+sT9s=; b=ttAaZSpsoNXFBw8K005118cZxk
	GSeIlEW3eG1HCdY4fChKQrDAbbDZ1H1wuLmn0kApg7ijWqZSM4bJy9cas2CMWiBRixoK3eQ36FfQp
	nQPI5f6aQFq8eEjw2/+4w+HDOtPI34wA79k8vWZs9FznnWVRnbRzbFpr4cYEuACZ4Sb7aK+Rkwb6s
	L30ajJCwEecs6x0lPvdRXG8dC5cZ2FELgOc/cT/k6CUCZIULmawOJPT4cm4wVlwrxzXS6IMgUh/vu
	lzr67Z8PSjzNNiZbW94o34N9sJkC8oNHhxOaA2F3X9GXY2nXQ+nSt7/WXYzZ1WVlWnvHxE6sOAVuw
	Cg1smcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXpd-0000000C12F-0Tbp;
	Wed, 22 Jul 2026 14:21:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXpX-0000000C10d-1VSA;
	Wed, 22 Jul 2026 14:21:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F21E1A1051;
	Wed, 22 Jul 2026 14:21:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0DFD60388;
	Wed, 22 Jul 2026 14:21:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD5B311BD3A22;
	Wed, 22 Jul 2026 16:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784730106; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=j5WRfwe5s7CD4n1/aXk/GuB0uSEMmPxIt38DrP+sT9s=;
	b=q9U+aIf/4yDREUm1HYpEzUsh0wIcz3rw2jHYkX5xMjcB7JLX50HQtTMbtSUvrI+VGae9vu
	YVn7SJP2PnfWlPRMHtkm3ieV2/EjSyukXuPY/zb3qRlGRCpIZ93uyHhkEhfaMIJ2itr58P
	m4fuxIAyPKu+js9RoCTwmMzZWdiIB/E61TY1nRJ6h2SCwjls1890/wwN/Eo++VVj9Jg7hv
	cBSEzLVgL3MVo8OtY7lK0sul9jXiSg3JI59jlM0m+npiflq+X01XX8jTtz3s71A//I9284
	mrnjhne27BDlfP8nEzrkqxzU4wCNDZfNqiT8QqIpKoQG8aQDG8j/BAWR9cmDJg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Yao Zi <me@ziyao.cc>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-rockchip@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	s32@nxp.com
Subject: [PATCH net] MAINTAINERS: Add myself for stmmac ethernet driver maintainance
Date: Wed, 22 Jul 2026 16:21:24 +0200
Message-ID: <20260722142125.1767689-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_072151_537924_4CDC9AD8 
X-CRM114-Status: GOOD (  11.53  )
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

The stmmac driver based on Synopsys' dwmac IP is used in a very wide
variety of SoCs and is currently very actively used and contributed to.

It has been orphaned in January 2025 after the previous maintainers
became inactive, but Russell King was providing very valuable reviews
and fixes for the driver at that point.

Now we're seeing more and more activity on the driver, but are lacking
people to test and review contributions to both glue drivers as well as
core stmmac code.

I have access to some variety of stmmac-based platforms such as socfpga
CycloneV, imx8mp, some Allwinner SoCs and stm32mp1xx boards that I can
run regression tests on, and I'm offering to step-up as a maintainer for
driver, for the time being at least.

Let's hope other people will eventually join this effort.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---

Sorry for the huge CC list, I tried to include all stmmac glue
maintainers and associated lists.

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7..bea104a7e522 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25972,8 +25972,9 @@ F:	Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
 F:	drivers/phy/st/phy-stm32-combophy.c
 
 STMMAC ETHERNET DRIVER
+M:	Maxime Chevallier <maxime.chevallier@bootlin.com>
 L:	netdev@vger.kernel.org
-S:	Orphan
+S:	Maintained
 F:	Documentation/networking/device_drivers/ethernet/stmicro/
 F:	drivers/net/ethernet/stmicro/stmmac/
 
-- 
2.55.0


