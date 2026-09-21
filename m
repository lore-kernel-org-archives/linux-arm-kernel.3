Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980FDC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yTymEAWaatS3hNs3NMCopMPpShJbhdwWnMcQrP+brXQ=; b=oQvhVe4YYJAUyy
	2GKR+aFSImwfKvTR4Hd5CzTfKDwHEgkEaDmuxZBc/Ux83tU8WIZqmzJjYmvVuuFKwTJUxDzJJvOLw
	cKfBvmDrBkg3LbWmKM0DznY2aIT2OW+DWiPekccSkJ1n4mH+VyGjLYhll9ZheUI8iYj9eTgDqQVXH
	Cg2CAc1oSuTWG+CHRrvoO+WaIbYCsKTilZTdwrewZ28SwzGwF9X2eCAA4jRdKyQkMw4H7nucdMknp
	SBt8svlvpnkNuiDW4HnLd+l83efDCL7igF4lvOXS0MMq45f3KoWYyOr7QfXL/JM3wyZxSY1toO4Mj
	KTQ9qbgL5y0tmEvY4MSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b5Z-00000001ecm-1rXo;
	Mon, 21 Sep 2026 10:17:33 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b5S-00000001eW1-29o5;
	Mon, 21 Sep 2026 10:17:30 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789985835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yTymEAWaatS3hNs3NMCopMPpShJbhdwWnMcQrP+brXQ=;
	b=EXYS5BboGejYrW44OieqtnyMm94j2T21OKVrkkJehGm0rFzaqrNQxsrhOguVprPbxEBLcw
	Mk4bkb4Ee5H+e9fMmyWIqciwaZnnkRpdyX2YTU1miL5ZWxzObg/1YFMQtLC/h1m7uhlHgx
	KT9Qab/++IwVQdSJvr6fr2HNHmZq3CgAcIT86PPOPAPJBmW/eLxMJvlIsxeaQyudjBiY8A
	8JNEX7ZEl8zdTiya0aLRJSouD4/NRp3OaWvCz4TDbZJehR4p7s8B/yEsTB5QdQ90T7gruf
	f9miQHfCKVxN9NDFcPRx5aDbzgf1i1nnznhJi0rnMpXjXTj0JexPA4/H0f9iJA==
Subject: [PATCH v2 0/3] spi: Better specification for rx-sample-delay-ns
 and core parsing
Date: Mon, 21 Sep 2026 12:16:43 +0200
Message-Id: <20260921-spi-sample-delay-cleanup-v2-0-b460d572fd32@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBBGr0K6dkxbjUZX3sOw6M8go9g2nUIkh
 LsLeAGXL3nf+ybBmAlZXKtJZByIKYYF9K4SrjXhgUB+YaGlPsmLOgMnAjbv1CF47MwIrkMT+gT
 GKi8PBqVujFjmKWNDny19r3/MvX2iK2tvNVriEvO4fQ9q9f64GRRIkHhE721jlcPbK4aSY9h7F
 PU8z19Re1dA0wAAAA==
X-Change-ID: 20260917-spi-sample-delay-cleanup-ab1d03ae02fa
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=iIuowXzeOPCff2NgpDNY7AnzrSvtvo0WU3eOtTczGts=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWsji+xMTgs9+3mRV31iVn1leFaVUX9d9VGm9Zxcr/Puv
 HOZXPs7SlkYxLgYZMUUWaT4LV7bmsX6yB+rjoKZw8oEMoSBi1MAJpLIx8jQVNiqeto79mL4Z5vf
 8dwi3c/+fha21zxe+IrRiUH2lXUKI8NFtefTKmQ5plvuVWJpZkrR6DVen3E8dNfj74mZr/8IW3M
 CAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_031726_905512_F25F8EA7 
X-CRM114-Status: GOOD (  16.13  )
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

"rx-sample-delay-ns" has been a generic SPI peripheral property since it
was moved to spi-peripheral-props.yaml, but the core has never looked at
it, and what it is meant to describe has become blurred along the way.

It was introduced in 2015 for Rockchip, to compensate "boards with
high-capacitance SPI lines". The wording now in the generic schema came
later, from a description of a DesignWare register, and lost its
controller-specific qualifier on the way. It says what the value does to
the controller, but not what a board should measure to arrive at it.

Patch 1 says what the property describes. Patch 2 parses it in the core,
so that a controller driver can act on it without open-coding the
property name, and patch 3 converts spi-dw, its only user that reads it
from the peripheral node as the binding intends.

Deliberately not converted: spi-rockchip and spi-mtk-snfi read
"rx-sample-delay-ns" from the *controller* node rather than the
peripheral node, which contradicts the binding but is what their device
trees rely on. Converting them would break those boards, so they keep
their private parsing. The controller-wide default that spi-dw reads
from its own node is left in place for the same reason - it lives in a
different node, which is not what the core parses when it looks at a
peripheral.

This is groundwork for letting SPI devices declare their datasheet
clock-to-output-valid time so that controllers can move their sampling
point instead of forcing a lower spi-max-frequency, posted as an RFC at

  https://lore.kernel.org/r/20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de

Nothing in that work is needed to read this series, and nothing here
depends on it: the chip side is a separate quantity that composes with
this one, which is why patch 1 spends a paragraph on keeping them apart.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes in v2:
- Fix the bindings patch subject prefix
- Improve commit message for patch 3
- Link to v1: https://patch.msgid.link/20260917-spi-sample-delay-cleanup-v1-0-0e4eddbfb1ce@kontron.de

---
Frieder Schrempf (3):
      spi: dt-bindings: Clarify what rx-sample-delay-ns describes
      spi: Parse the rx-sample-delay-ns peripheral property in the core
      spi: dw: Use the rx-sample-delay-ns value parsed by the core

 .../devicetree/bindings/spi/spi-peripheral-props.yaml       |  8 ++++++++
 drivers/spi/spi-dw-core.c                                   | 13 +++++++------
 drivers/spi/spi.c                                           |  9 +++++++++
 include/linux/spi/spi.h                                     |  9 +++++++++
 4 files changed, 33 insertions(+), 6 deletions(-)
---
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
change-id: 20260917-spi-sample-delay-cleanup-ab1d03ae02fa

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


