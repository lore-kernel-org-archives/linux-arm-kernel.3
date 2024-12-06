Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D625E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KOB2lRuRgc5c5Cx+z4l+rgFqNRL2xohrcJNSDIsVogs=; b=HioKkXkMC3VwL8CESEJ26X3xin
	OItf53Qt5d99Mry2sCnxHd5Dydj9lnuXeKJFxePQQJ7RjtXi+BzZz1BeEAGtGSGqBuFAFc0awrKfx
	JGtdRFvXZhvtlCfk+D68QCkZDHWpf0K6gBJx0UbVPj3TG1yaVGqrVklMt4p+g7FE5YlKXIAQNSpvO
	ox+5O8zzQ2O0iiG0TgQgDcYqKrmHCmOGMhLiutDOz4vTDXet+QxBTPI6LEwnZ5zBsNwtc4kVFjCWy
	VqfTpgp6FaSDbU+7h0eL3o7e9gjIKV8VfbTMYuInDdDl/bSLI1RSFwXXtrhySnrOPqXCzPYg0yM2/
	GmWWoKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVsU-00000001M1R-2arg;
	Fri, 06 Dec 2024 10:48:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVfL-00000001JTa-2nGY;
	Fri, 06 Dec 2024 10:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KOB2lRuRgc5c5Cx+z4l+rgFqNRL2xohrcJNSDIsVogs=; b=F4fZ6994jjC53bMEsZmmff8qaP
	XkcpOrjvd5t5eRx/0gGyTrmiB/ozlNgkaYWj5MWvwqVe/V6b44E1euanIUN+qVBUu6VoyquYqYYvn
	qr1IVUw4Oxx+0xKtqVUfacx/n6JW0d1fvJKJLUiKo+4W9erAc3F3V3PC3Dogcoh0swtHzdXdcwoSA
	yVZRDDAsbNKcSots0IUIW97JgxrQb2xPDOof7mJuAHMp8Pqv/2ipMFt17+JCtYCYypF2WCTqVWfWM
	487M+75KLxZFBtvhelHsG0nA5co64GQXnGXYr4mQemcx3h6ZslrdOFj29C4wF5nBcTNfFBw7p1mPq
	709sjeHA==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tJVfH-0007XU-GF; Fri, 06 Dec 2024 11:34:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: heiko@sntech.de,
	cristian.ciocaltea@collabora.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de
Subject: [PATCH 0/2] phy: phy-rockchip-samsung-hdptx: don't use of-alias
Date: Fri,  6 Dec 2024 11:33:59 +0100
Message-ID: <20241206103401.1780416-1-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_023431_724648_6743F18D 
X-CRM114-Status: UNSURE (   6.43  )
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

One nice comment addition and removal of of_alias usage for core
device functionality.

Heiko Stuebner (2):
  phy: phy-rockchip-samsung-hdptx: annotate regmap register-callback
  phy: phy-rockchip-samsung-hdptx: Don't use dt aliases to determine
    phy-id

 .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 64 +++++++++++++++----
 1 file changed, 51 insertions(+), 13 deletions(-)

-- 
2.45.2


