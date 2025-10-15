Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75878CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qGWfDBGHqSPGWJIrWnQN9/sHI+wC3nVrrOc3hb1m0A=; b=zK+fB1tD3+4EucG71Fy7WYShqF
	USJegLeOUpvdaTwuL6OheecoZstiW3UfC2AD+08v01h40CxJTv7xDiXvRjadYdH7ZLZddSy08+uAl
	zSu9MVqPVW/E69H8ECJEHmwlUPLVsHvo51QJ9/IgcO+3nsLxHCjUHEDTEuPZO8p3jv0ih9zX/EY0U
	r42VR1bB2UnKvvvVntYJAx1mkOGKB4Tlo9IdyZ/6jP4H+iYzYaJA1xqImpJsHlOIe9kUF4znVdAew
	e8mpn99veX7iecnp3XCVF9k3UuhTlg4NmndvltHtpzxqPvfSRGU80qJyLJfw6dQcUAV09R25xyf3f
	7SbASPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yjl-00000001H6J-1jaT;
	Wed, 15 Oct 2025 10:28:05 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yjg-00000001H2V-2O5u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 10:28:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 85927C09FB1;
	Wed, 15 Oct 2025 10:27:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9971F606FA;
	Wed, 15 Oct 2025 10:27:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40124102F22B6;
	Wed, 15 Oct 2025 12:27:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760524077; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8qGWfDBGHqSPGWJIrWnQN9/sHI+wC3nVrrOc3hb1m0A=;
	b=24j3kz+TZBypam4eIYin2oaU8ga44Eb8szSPoPzfttkiNc1sKGA141nc2k50UTsxeDCz81
	79OVEr6ivEuhso/lXvKdjzzQ26imcDA2VyVIFWJc7F5D2/OhaicI1qtW9P5HfMgb7XZx9/
	6tmoA7teAreB/HUcPLDy2IWD47ahrhuKETwxrZtaw4rh8Uho4/T0UkkGbRKsCYCs7KZtjJ
	O01MsgiqKnVANuvlhNENUlQBbfdTWGFRptTcmI5+JeR1AkNZQLqyh8jOWxnVBYyzwRMAib
	X80psGjtblFuZ1kLqAzVUcKXSpFpTxHqZOm8EvV3jLhRgNFMjDzhgQGe/O2fKA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/3] net: ethtool: tsconfig: Re-configure hwtstamp upon provider change
Date: Wed, 15 Oct 2025 12:27:23 +0200
Message-ID: <20251015102725.1297985-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_032800_796794_2074F227 
X-CRM114-Status: GOOD (  12.01  )
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

When a hwprov timestamping source is changed, but without updating the
timestamping parameters, we may want to reconfigure the timestamping
source to enable the new provider.

This is especially important if the same HW unit implements 2 providers,
a precise and an approx one. In this case, we need to make sure we call
the hwtstamp_set operation for the newly selected provider.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/tsconfig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ethtool/tsconfig.c b/net/ethtool/tsconfig.c
index 169b413b31fc..e8333452926d 100644
--- a/net/ethtool/tsconfig.c
+++ b/net/ethtool/tsconfig.c
@@ -416,7 +416,7 @@ static int ethnl_set_tsconfig(struct ethnl_req_info *req_base,
 			kfree_rcu(__hwprov, rcu_head);
 	}
 
-	if (config_mod) {
+	if (config_mod || hwprov_mod) {
 		ret = dev_set_hwtstamp_phylib(dev, &hwtst_config,
 					      info->extack);
 		if (ret < 0)
-- 
2.49.0


