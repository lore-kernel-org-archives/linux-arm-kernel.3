Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72D3CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ckXTMkQFG2f4F58xaG7TlKzFSnClmd4KDdj+2pOa+o=; b=PWUnYgAHKk7ukasqwUNzKKYCPU
	+BYSUTEJbFG3lNpMF/rB8A1AdHlfPhpvC0Iic7s/ClxL3hoH+BPNLRG0M7csFBwf2cjLqnEg40eqG
	1LuX4cNqZ7Cz3OGBwPpdMjeQlOoANjGbB0vN3gPCpp/PFSNJekr+swQCJWvDGQiy8aMEPYSXguhFr
	VM+V+qMOy4I3fRWDTm9xKR/4RQWLpcArYCnH4+lxIilYSA4JbdFhHbACU5G7AiT2q0mbvw2DNDvqt
	v3uWROfak0ZvzMvr6yaKhTvDFB0ONe+c524Qi0+Ac3YZmxEfaqo6fKOONc+ZJETTF5Tda0qejoU28
	nhYWwaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwics-00000003fr2-00eV;
	Thu, 11 Sep 2025 14:50:18 +0000
Received: from mail.nic.cz ([217.31.204.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwicl-00000003fm7-1NK7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:50:13 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:1488:fffe:6220:c8a4:e06:31cb:d419])
	by mail.nic.cz (Postfix) with ESMTPSA id A89CB1C1087;
	Thu, 11 Sep 2025 16:50:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nic.cz; s=default;
	t=1757602208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7ckXTMkQFG2f4F58xaG7TlKzFSnClmd4KDdj+2pOa+o=;
	b=jpH90/iopMqZnkfM4gJHkK+QC4Wi/G7ONhotwaavKwXkuws9bkqGJ8BiPQVRPxjrgagbDG
	iFYVPYoER9sDsCIkroFsfgbO5fXyd6izH9Wm0Cl4XMmD6ON+w+PCa69Dy//a9mEtXxiI0Q
	p5O7h6RFHX6MviwGjgUAKu9F0myIiKU=
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
Subject: [PATCH v2 0/2] Add support for RIPE Atlas Probe v5
Date: Thu, 11 Sep 2025 16:49:37 +0200
Message-ID: <20250911144939.49999-1-tomas.macholda@nic.cz>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Queue-Id: A89CB1C1087
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.61 / 16.00];
	R_MIXED_CHARSET(0.71)[subject];
	MIME_GOOD(-0.10)[text/plain];
	WHITELISTED_IP(0.00)[2001:1488:fffe:6220:c8a4:e06:31cb:d419];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25192, ipnet:2001:1488::/32, country:CZ];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[nic.cz:s=default];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dt]
X-Rspamd-Server: mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_075011_554102_D9856753 
X-CRM114-Status: UNSURE (   9.44  )
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

Same as the previous version, only with changed labels, and dts added to
Makefile.

Adds support for RIPE Atlas Probe v5.

The hardware is based on Turris MOX, without support for extending with
board modules.

- The first patch adds dt-bindings documentation for ripe,atlas-v5.
- The second patch adds the device tree file.

Tomáš


Tomáš Macholda (2):
  dt-bindings: marvell: armada-37xx: add cznic,ripe-atlas compatible
  arm64: dts: marvell: add dts for RIPE Atlas Probe v5

 .../bindings/arm/marvell/armada-37xx.yaml     |   1 +
 arch/arm64/boot/dts/marvell/Makefile          |   1 +
 .../dts/marvell/armada-3720-ripe-atlas.dts    | 110 ++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-ripe-atlas.dts

-- 
2.47.3


