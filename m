Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C8BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvmJs37OPUgPlZajW2Yxe5MxDWODiGxLsnHmAoScS7E=; b=ETNj13ykocAMzZtFwr/7TKBc58
	TIqQBarwdCS9ZHsvvAllKRFDBebLcY1BOfDVZMzZJqLFGiX/8if7CfXdro07UZCXbuaBcUtbuw4xs
	S2tiSM9PysTIKRR1srjVEhNSdpVYZ2Y5Sm63kL74DLaGnyJUeL0A1cfdRvvrDsfL8eGJFT7wZf2i+
	Uyc7JJSUFHR3gm5fvlTZt0VydetFDKWZ0JuBUb67E6nip+Yhr8rjarf4TrGqlY6v3TpHg+3iQn65B
	o9px+IFhUSZQsAg40XqLXhVkMklQKj5L8XapkzGlIU+CVZUI4Py65hDV7CKyEE8y0jSiuWlYJV4P3
	1PYKD4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmC-00000008d28-48ZR;
	Thu, 27 Feb 2025 19:42:33 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniZD-00000008JsK-1ZYL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:25:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2139C44264;
	Thu, 27 Feb 2025 18:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740680697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mvmJs37OPUgPlZajW2Yxe5MxDWODiGxLsnHmAoScS7E=;
	b=cguhkLkEpqUFw+CYfIqWVqxKb8bqrtFmGcsGFUHkWFPZXroBBJ6BOEJTnmfx+rpusXkH08
	ExOB4W0ztXqw/YLSqBANb3g3BTu1PYZz1W3ilR/XyqLT6rmOmbsAD7KiAp07kxyZkzuxqG
	m8q9PX9kKYyB0k/CY0UXU1SgNZsNhm2yKhTc2glzCUqqkGrpa9dA5OP5f/MbWgKpz5FYw8
	URsPFrxrU8JleSQz73V08igUul72wBaz8c6ZmZDV6+wf+oncsAPPRQoNZznfmgWTRT5o9L
	cXs/yi397mPLOFcJbINaNJSfaBpSIrEfnWdwOg9KlCOriPCqy33kchVXpaJ/dw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: [PATCH net 0/2] net: ethtool: netlink: Fix notifications for
Date: Thu, 27 Feb 2025 19:24:50 +0100
Message-ID: <20250227182454.1998236-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdehueefuedtkeduleefvdefgfeiudevteevuefhgfffkeekheeuffeuhefhueenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvt
 hesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehprghrthhhihgsrghnrdhvvggvrhgrshhoohhrrghnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_102503_831780_5F1B2792 
X-CRM114-Status: GOOD (  12.15  )
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

It has been found (thanks to Parthiban) that the PLCA ethtool commands
were failing since 6.12, due to the phy_link_topology work. This was
traced back to the ethnl notifications mechanism, in which calls to
ethnl_req_get_phydev() crashed in the notification path following a
->set request.

The typical callsite for ethnl_req_get_phydev() looks like :

    phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_XXX_HEADER],
				  info->extack);

as 'tb' is NULL in the notification path for the ->prepare_data ethnl
ops, this causes crashes. The solution for that is to change the
prototype of ethnl_req_get_phydev() to perform checks inside the helper
(patch 1).

While investigating that, I realised that the notification path for PHYs
is not correct anyways. As we don't have a netlink request to parse, we
can't know for sure which PHY the notification event targets in the case
of a notification following a ->set request.

Patch 2 introduces a context structure that is used between ->set
requests and the followup notification, to keep track of the PHY that
the original request targeted for the notification.

Thanks Parthiban for the report (not on netdev@ though).

Maxime

Maxime Chevallier (2):
  net: ethtool: netlink: Allow NULL nlattrs when getting a phy_device
  net: ethtool: netlink: Pass a context for default ethnl notifications

 net/ethtool/cabletest.c |  8 ++++----
 net/ethtool/linkstate.c |  2 +-
 net/ethtool/netlink.c   | 21 +++++++++++++++++----
 net/ethtool/netlink.h   |  5 +++--
 net/ethtool/phy.c       |  2 +-
 net/ethtool/plca.c      |  6 +++---
 net/ethtool/pse-pd.c    |  4 ++--
 net/ethtool/stats.c     |  2 +-
 net/ethtool/strset.c    |  2 +-
 9 files changed, 33 insertions(+), 19 deletions(-)

-- 
2.48.1


