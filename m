Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4588C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NX+Wy/vDiqR9J8JJ3ihFc2hXFzc/UpLSMUDAQjn3ZY0=; b=MQq7qfn4MJH27falOwroe4bleE
	YXtpCCcJX/goZmxQr34ENymWliMJ1leQky8LJVgmEx9yhc0LsNI4bp5f2ruHRz/9o6bgHj5x+tMcO
	u6V1D4hxrpwODN417fKs6zeCgsYgCAc9SFbfedtlCB+hVtpcMccW7QF0IXqbns3YiCIEonpB62U1R
	ndKR79uIdQeuNPLMXDZD1KmeKx8UXjeEfLi1jDmIYpGE9fqasZk+7lJk3++9WpGvpvdvYBXwpJEzJ
	U6GezH8GeVowXSs1flGvKMj58Ws3zqTZkvkgCSRaic6Q3lP4KFBBDNJVLNTZWZIX3kOJuDAYGQQFe
	KgaqFvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokBg-00000005kOn-1b6g;
	Tue, 28 Jul 2026 15:57:48 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokBd-00000005kN6-0aGi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:57:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4A0FA4E40FB1;
	Tue, 28 Jul 2026 15:57:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AF10601BF;
	Tue, 28 Jul 2026 15:57:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D60711C142D9;
	Tue, 28 Jul 2026 17:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785254256; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=NX+Wy/vDiqR9J8JJ3ihFc2hXFzc/UpLSMUDAQjn3ZY0=;
	b=eCcoP5rj2l6Xhv5GPrVixILoLWrrfqlydlZfBNH5jI3VqxztFG9OJTcHx9jQRwhKb07OHr
	PL7HvRVg/rMbvSbyBpLWRnteB6H5kj+QcA99F75YrTNuDhtNhI83i08kjEHuWtePJWgiEk
	KYWxBs8oHnh4h7YC9ApTJYZGt2TFQjFUyJbhXkmbMMzmhi8goEFp2E/4RKXJmm0u0qZ0Sf
	PlDaMN9EuphIH0v3KLt44uR4cK6cxGNie+zplBZEFuhqMHDU5ixvuz5LqiqO+D809VKUHD
	0HikKlnwUZxdy5WyX+DEhD5/PE6cP8qakofy/BPTavq+Ypo/sbjyGDiVYYerwA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Zxyan Zhu <zxyan0222@gmail.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 0/2] net: stmmac: only use MAC loopback for selftests
Date: Tue, 28 Jul 2026 17:57:25 +0200
Message-ID: <20260728155728.1193169-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085745_324294_FF198CEE 
X-CRM114-Status: UNSURE (   5.52  )
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

stmmac selftests currently use PHY loopback when a PHY is attached, and
fallback to MAC loopback otherwise. PHY loopback however isn't ideal nor
necessary for the tests we are running, that only stress the internal
stmmac features.

Some PHYs bring the carrier state down when in loopback mode, which will
prevent any packet transmission even for ourselves, making selftests
fail for non-stmmac related reasons.

Let's rely only on MAC-side loopback for selftests, making it clear that
any problem found with stmmac selftests are indeed caused by the stmmac
driver, and not external factors.

This was tested on :

 - Cyclone V with RGMII link to KSZ9031
 - Cyclone V with 1000BaseX
 - imx8mp with RGMII link to KSZ9131
 - stm32mp157& with RGMII link to RTL8211F
 - Allwinner H2+ with an internal PHY

Maxime Chevallier (2):
  net: stmmac: Don't use PHY loopback for selftests
  net: stmmac: Don't rely on the PHY for flow-control testing

 .../stmicro/stmmac/stmmac_selftests.c         | 117 ++----------------
 1 file changed, 11 insertions(+), 106 deletions(-)

-- 
2.55.0


