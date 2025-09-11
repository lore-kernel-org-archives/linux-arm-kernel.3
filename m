Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE0ECAC583
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 05:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gaoZGBVm3mGzgQoEGG09Oyg+9a2qCQexgaNw5V5SpOA=; b=hLZDRxnfKeCyk9LokMftctJmbE
	HFUdKkewjKTuoqEJNhUbpRBrjtbVLXoMIGHM7RClqkSIr7ToAcc3sOfl6Vq3NhupeUMXTB+uHdbwg
	HBsD3pzGPbkHQ+1fiolznFW812+nDbpLLWzSD635gJn7xeYzIE+DT23knf1MsiN+60W1uvApng2aP
	1St0N/Fycw7A5OHYqLnIp3lQ7AvB5dzynuPJzNmh12jbSTHgU+yM62EKOXDgvJ9+rDeAoMuESZ78h
	PF8hoFMqbSS1WOtG2YYC7KOAIi8vqDvoOq+gbQr/eq/klZGxApPxdI7kdJcD2lY0iheCj9PO4WX9D
	2RR4ZDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZa0-00000000whu-2Sh0;
	Thu, 11 Sep 2025 05:10:44 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZZx-00000000wfy-2di2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 05:10:43 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E7A037A0058;
	Thu, 11 Sep 2025 01:10:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 11 Sep 2025 01:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1757567437; x=1757653837; bh=gaoZGBVm3mGzgQoEGG09O
	yg+9a2qCQexgaNw5V5SpOA=; b=X4co1BvUqcXccl62w8HrWO4by3iZzqmmRnMGP
	v+1Nr/PAbw6aI/wFoYJXhGZieFoivmIB1xTTPEGBAd0g0kidAHDxu+h9jXFfsSEC
	o/BuhtyAy1mgSmcxATpTROtG/yRcJxFTIJ+8/QLi+7ebeIbilUIyX7Kv5vDnwGxZ
	Ekej56pG1U+7XQ7RrMx+lvuYfIrvWV8gQjFCJdFGNiwx8N3KOBDzFDlA+7L8Fpit
	snfAL6cyNTR7pJAA2hQHBK3YKvEn0iSdEYXV/2B5PQPIlPLT/DDu+zRc3PvO2qCK
	JdBtUTCTZxYlQbO8a9gJjaWIllTpwXMldZZE4SkEJw+/VHPVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757567437; x=1757653837; bh=gaoZGBVm3mGzgQoEGG09Oyg+9a2qCQexgaN
	w5V5SpOA=; b=HwiLEaYaRDf1Tb75MashswycBlfp6ngPG26sVxUHmZbGl8zHbze
	OUuGHz7JhmSRpgsIcBqZgshalNQ4xkEpbwQvqLBywBU6YhVFiGzC3jXVPqV4jnye
	D/MOFaegpWxIeoPCtBgjt7BMlN6Ooftr7IBjjH3vA6GZBLZJ6ukk5l/sNt98TL4w
	68f1CM1YkM3y3AP8Sm3wpn8Zl3xLCf+tB9r5m4KwCZwEKX8Zco6jxS9rPKWGQNG6
	ZyqbuccGJOrjqDlj/1ndcWDxLwGk4O5GUXmV+TLPtxA52Nn1LnKRouMORb4Hh1LY
	DSzEIK2kq82zexB0fDCyBWnFp6NJdM7Qmig==
X-ME-Sender: <xms:zFnCaA4dh6MhsOHOJPaloeKGNsm7erRR37Q-mP14-CFd3Pe15VHgLA>
    <xme:zFnCaBEOVcHuMGQWoGByHIeHTwtYtvbVZR_GYqCeNRhFEvWUSg4FHb_qJhCxJNnN1
    yPdsr3lbZxk8sdWCq0>
X-ME-Received: <xmr:zFnCaCKuty7_tw_nRTJyLtCs4y-_kt0E2PSZzhGV0ovYmsRG4OOWjb5oq5hn7LW2-8i3VIDJ037J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvhedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftvggsvggttggrucev
    rhgrnhcuoehrvggsvggttggrsegsshguihhordgtohhmqeenucggtffrrghtthgvrhhnpe
    euvdektdelkeeukefgjeejteetffdtudeiffefheevfefgveeulefghfellefgvdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrvggsvggttg
    grsegsshguihhordgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrh
    iikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpth
    htoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphht
    thhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilhgrsg
    hsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:zFnCaOjpULaNaq4e1xD_KLBzFF6NGwlPqRm7a0NltOzraA7l1XcRMA>
    <xmx:zFnCaAlFKFeBaiEP4bdxWyztaaz3kt8_r7lgcOPIjgSoHMPyTDvjcw>
    <xmx:zFnCaFURAgP4cAmYx2kVdgkktgAy3bpt3VpC9qjHyrOmYurF2-B6Sw>
    <xmx:zFnCaNuQzv6IWjSKUioM0tkxfbRm6QMhkypO0VVlj2EQ6U8RjCEaHw>
    <xmx:zVnCaHIOo2_TRa6BAKadwQcbQ9yS37xiHhRyilljsUX9gsh-C3p5bUn4>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Sep 2025 01:10:35 -0400 (EDT)
From: Rebecca Cran <rebecca@bsdio.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Rebecca Cran <rebecca@bsdio.com>
Subject: [PATCH 0/2] Add device tree for ASRock Rack ALTRAD8 BMC
Date: Wed, 10 Sep 2025 23:10:03 -0600
Message-ID: <20250911051009.4044609-1-rebecca@bsdio.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_221042_192936_8E2B9BE3 
X-CRM114-Status: UNSURE (   7.28  )
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

The ASRock Rack ALTRAD8 BMC is an Aspeed AST2500-based BMC for the
ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q boards with an Ampere Altra
processor. The BMC runs OpenBMC.

These patches add a device tree and binding for the BMC.

Rebecca Cran (2):
  dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
  ARM: dts: aspeed: add device tree for ASRock Rack ALTRAD8 BMC

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml |   1 +
 arch/arm/boot/dts/aspeed/Makefile                        |   1 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts   | 647 ++++++++++++++++++++
 3 files changed, 649 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts


base-commit: 7aac71907bdea16e2754a782b9d9155449a9d49d
-- 
2.47.3


