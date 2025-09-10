Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AD8CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FFlI9OTuERKqYca4THo8FMoMn6CHXSbt2umNcFhVvdQ=; b=TDwxZCOq4PnDZmGgp4TZgi+a57
	p5X7F/yyXRiICdQXqL2hK2ER+csktBOBrmLwFhbbu6xHbCHHNyeSu90hXK5megoZBLD9mfRNnAniH
	JwiHQZ0heCmWCaqJnVxxxHF3VzLGUnylk39iwzB/5joNxua1DdI2YZlPzc7DWUCU3FMjkqm9Yt/lk
	w7Tni7GeXojC47TACbKzKxqkXjsqB3sqEcgBXw3JC3jTEam4Q53eyqEELGksgR6Ifns+cisPA3x+9
	ITwC7FAIuu3k3WcPEPPfPeuSvzP4eigRzNEo6Siq/V4GRzYgSIdxfFKdIrBEPMhNVIhLJ+F8dRsE3
	jkCpf10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN36-0000000FEMF-2mcy;
	Wed, 10 Sep 2025 15:47:56 +0000
Received: from mail.nic.cz ([2001:1488:800:400::400])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN31-0000000FEIV-1K0O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 15:47:53 +0000
Received: from macholda.lan (unknown [IPv6:2001:1488:fffe:6220:172f:2c63:54a0:e850])
	by mail.nic.cz (Postfix) with ESMTPSA id D5C411C036F;
	Wed, 10 Sep 2025 17:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nic.cz; s=default;
	t=1757519267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FFlI9OTuERKqYca4THo8FMoMn6CHXSbt2umNcFhVvdQ=;
	b=TB65eaq6hNQoyZ8LMVYnxGvI/Iy3uGzqZo8cAc/rvd+44kOQM6lacxphpWtYUOIPjG7DME
	HaV+AkUk2AG3fBJtcKb6+PUxM1USdYp0CmPgu4yyndJXvysM3+ddvcKvUSiWmFdSGW467x
	big8GPRWWhdTzl6XZonO3RHIG5BaXVw=
Authentication-Results: mail.nic.cz;
	auth=pass smtp.auth=tomas.macholda@nic.cz smtp.mailfrom=tomas.macholda@nic.cz
From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
To: Gregory Clement <gregory.clement@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	kabel@kernel.org,
	=?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
Subject: [PATCH 0/2] Add support for RIPE Atlas Probe v5
Date: Wed, 10 Sep 2025 17:47:32 +0200
Message-ID: <20250910154734.24686-1-tomas.macholda@nic.cz>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Queue-Id: D5C411C036F
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.67 / 16.00];
	R_MIXED_CHARSET(0.77)[subject];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:25192, ipnet:2001:1488::/32, country:CZ];
	TAGGED_RCPT(0.00)[dt];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[nic.cz:s=default];
	WHITELISTED_IP(0.00)[2001:1488:fffe:6220:172f:2c63:54a0:e850];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Server: mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_084751_498852_74D16057 
X-CRM114-Status: UNSURE (   9.54  )
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

This adds support for RIPE Atlas Probe developed by CZ.NIC.

The hardware is based on Turris MOX, however it does not support board
modules.

The first patch adds dt-bindings documentation for cznic,ripe-atlas.

The second patch adds the device tree file.

Tomáš

Tomáš Macholda (2):
  dt-bindings: marvell: armada-37xx: add cznic,ripe-atlas compatible
  arm64: dts: marvell: add dts for RIPE Atlas Probe

 .../bindings/arm/marvell/armada-37xx.yaml     |   1 +
 .../dts/marvell/armada-3720-ripe-atlas.dts    | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-ripe-atlas.dts

-- 
2.47.3


