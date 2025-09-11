Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD905CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tv4lS2foRZaFqjOD0hYpJBiFCPSfGcp3Ev2ebPyWa+c=; b=lCJjPJZxSYmKcMDJL43w1PA3O4
	A3flXqNAJgRFqHeJ1R63SALrPNeuPkbb8FXAMsFLWkO9Pa/bgjLHV7zsTGADRC4valhs9Pj0xbMgw
	JAqH8U5tELi6PrUYRF7JdXB4CaySSTijyGL8TH4G2uDl/PVZZghvMnHfM5qD6xoKYK87lnoaAgidH
	As7tU7LKju840xNBnOY+7p7UptizSpqoz/XwM0uGgj7lb2ZVXNWBBGfNvdUa6JzAt0z/3AZrPxtJe
	WdhA9kSQbiq9Nnu4T9MNF6tUbfUh1yjncGqxW0YbfGdgMOkbYTF4HJ6Akpa3/WvqALGK1w8obHY4f
	PMw30b3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjvL-000000048Ga-1Wmc;
	Thu, 11 Sep 2025 16:13:27 +0000
Received: from mail.nic.cz ([2001:1488:800:400::400])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjvH-000000048BF-2W8W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 16:13:25 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:1488:fffe:6220:c8a4:e06:31cb:d419])
	by mail.nic.cz (Postfix) with ESMTPSA id A75B41C101C;
	Thu, 11 Sep 2025 18:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nic.cz; s=default;
	t=1757607198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Tv4lS2foRZaFqjOD0hYpJBiFCPSfGcp3Ev2ebPyWa+c=;
	b=mYgU/dQAjy5a06K5padwNKBx99hy/pc2XQBd19EDkodnU89ZhQ55O3QSe2HFh5bLJnO+70
	pm61fWXPWElIWsQi/8tfiL8PhmI+HpiBFfhMygUgFu9HhaKjY/Y9IBYgZAa/rV/tyo8kwG
	WX7lBZXY4jJ6RihpvF5DjFfY2IOS/Sk=
Authentication-Results: mail.nic.cz;
	auth=pass smtp.auth=tomas.macholda@nic.cz smtp.mailfrom=tomas.macholda@nic.cz
From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
To: gregory.clement@bootlin.com
Cc: devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	kabel@kernel.org,
	michal.hrusecky@nic.cz,
	=?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
Subject: [PATCH v3 0/2] Add support for RIPE Atlas Probe v5
Date: Thu, 11 Sep 2025 18:13:06 +0200
Message-ID: <20250911161308.52876-1-tomas.macholda@nic.cz>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Queue-Id: A75B41C101C
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.61 / 16.00];
	R_MIXED_CHARSET(0.71)[subject];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:25192, ipnet:2001:1488::/32, country:CZ];
	TAGGED_RCPT(0.00)[dt];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[nic.cz:s=default];
	WHITELISTED_IP(0.00)[2001:1488:fffe:6220:c8a4:e06:31cb:d419];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Server: mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_091323_821873_E4FA7B58 
X-CRM114-Status: UNSURE (   9.16  )
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

This version changes: armada-3720-ripe-atlas.dts -> armada-3720-atlas-v5.dts

Adds support for RIPE Atlas Probe v5. 

The hardware is based on Turris MOX, without support for extending with
board modules.

- The first patch adds dt-bindings documentation for ripe,atlas-v5.
- The second patch adds the device tree file.

Tomáš

Tomáš Macholda (2):
  dt-bindings: marvell: armada-37xx: add ripe,atlas-v5 compatible
  arm64: dts: marvell: add dts for RIPE Atlas Probe v5

 .../bindings/arm/marvell/armada-37xx.yaml     |   1 +
 arch/arm64/boot/dts/marvell/Makefile          |   1 +
 .../boot/dts/marvell/armada-3720-atlas-v5.dts | 110 ++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts

-- 
2.47.3


