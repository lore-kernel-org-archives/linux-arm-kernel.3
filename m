Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1FFD3CCB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 06:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xK1im2sAlmRNN7BXrq1rFYNPvIT8yHRpRMOS6x3iiAw=; b=dxDehSFwdL98zO
	yXUVRhUpUNSlZsJIfSEjQns0UEmMs/Id1L5rlT/oAJlgdIE7UdJgea2htb9qlDoTzoG/e8LRLP4wv
	JyhgGDfxcrCf9G5SaVIf0BopXFZOAt2+2v2M1/U057YB8yJJi3QX13RfPgOQ+WXkGZMaKvjn7YAA8
	1HZ3GTIuHXmSlEbs08+2yDk3sYt7wH6BWiEYC1UltzpIbfW1J+VTPQN6prtSvQGyWvmWHAPw/VsmF
	GBKC0EETwiL0ny+uaIobMIR5P+IP7WJZbVDdP6RRiegHbBzBPsJFkgAEl1/e6rIOKtGTrnsJwCFh8
	OjVzBuzAOoT3ig+psuzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGpq-0000000Bqy7-2Guc;
	Thu, 15 Jan 2026 06:27:58 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGpn-0000000BqxM-2qVC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 06:27:57 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 68DCB1D000A1;
	Thu, 15 Jan 2026 01:27:51 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 15 Jan 2026 01:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1768458471; x=
	1768544871; bh=xK1im2sAlmRNN7BXrq1rFYNPvIT8yHRpRMOS6x3iiAw=; b=d
	QZMiUQB72rOpw4P0wuCfbiTUISnC7zjLiGpu0rg7SFn1+nQtkUK019KTlX9afIOv
	7vhiFez/H7BFhUxwBJyqaGkBkQeXhcc4XZvmOqW3Ej7KZyhposQOcSbfgJtcH9Pp
	WBEtEAepKMv2d3b1jhbCk5LJzO78lNiKfV35UnF71ndjIr+ezfrhFG6oyXZadc53
	KrqSoSwlr3ds6yl2nIO9cYms8txIbtkemWwK0R2RF02AayVQAIl23UshaW3ofhoQ
	AIvj726ifA0F7HX9/kSPseHP7RPKAOf9B1oMR+vKmY5hJqpYhblvEkq4k7SMwxa7
	6kChsB+wvnYR6N5pLqvXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1768458471; x=1768544871; bh=xK1im2sAlmRNN7BXrq1rFYNPvIT8
	yHRpRMOS6x3iiAw=; b=WsM5v/ue1Xa09XrenWe2gklMuCDQgplG6byA6A6Tjtbl
	vfX0N3ggVAq/2v550B7TajVf+0SJRkm3Zp1qUTUMsI9tzH9ATiy5GwY2mPamDpBx
	hG+6jLfdIPA1LT5+uFir7vrqC+qbm+RLWp9ryXdZSSvcGlU/OHoSUlCAHlyRMk5w
	yeNR5dcQ1oY6ElbB8J5M50o7WcM0bpLds4Q+UUQa45457dEDxXekrUlgh4kbDSmC
	2D+QEz5s1Hyjym04vZrPrwnmdeD/Y+pX0hufiGEYn+pbP8vyPnhsEJDXIn3FCfLJ
	DflLEtvrFCV0uDc7EwYEUWOJWv++4bHpPWqKWYg8HA==
X-ME-Sender: <xms:5ohoaUwfEa4OJHXTZw3d7DLs18hOFQdOjdvQQb5EP_QmSGLJwkjvdQ>
    <xme:5ohoaa17LHSoEPc1Z15k1TXDWKllX22QV-gKIWnzlg5eQ2yeFipsh_zzcfrbdeDXs
    AdhC62-UXp6sMAr8sBGaHWRVnncnK0-UwHD3SwJzrpWHrSlEj-PdHU>
X-ME-Received: <xmr:5ohoaZ_rp_72k1X71NehmIIUzzyO7suYsUJU6jnCkETea_rxRXyCUPkWG7yaPOikCPUh3vCP_xaIOFLbdMu2_AG1CFib7Hh8z7APviqEaPoBEIFWrGhQqb0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdehfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeforghthhgvficu
    ofgtuehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecuggftrf
    grthhtvghrnhepvdekueefuedvueevfffhueeufedtveeludeguefgtedvheffieefleef
    udeuleetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghupdhnsggprhgtphhtthhopeekpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvg
    htrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruhdprhgtphhtthhopehrohgshh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5ohoaSriUHHcmCZSFhrvMTKIkmwyfdvo2u-R_PKZKoGyRbEQSifmjw>
    <xmx:54hoabQ32lYHr5Wtp-BDc3SQDphzySuLDRj3x7Z0luCGB4vXOak0VA>
    <xmx:54hoadMlh4z4NogII4Ybw0tctdJN5CZ3E69KD5mRHl41xCz9VnNu6g>
    <xmx:54hoaRipEeP_GYXRVEXeQeBWWbfeMCt_eeCoD_p1VV9z2SDTzLzjsA>
    <xmx:54hoaWmTi1kQD-fBGTK-XTgbHN15Xc0tmU-CjtURPyxi72eNiR7XtoqP>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 01:27:48 -0500 (EST)
From: Mathew McBride <matt@traverse.com.au>
Subject: [PATCH 0/3] arm64: dts: ten64: updates for hwmon/thermal, mmc and
 gpio
Date: Thu, 15 Jan 2026 17:26:42 +1100
Message-Id: <20260115-ten64-dts-updates-2025-12-v1-0-a56380bbb2ac@traverse.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKIaGkC/x2MwQ6CMBAFf4Xs2U26i3LwVwyHQp+6l0q6xZAQ/
 p3qcTKZ2clRDE73bqeCr7l9cgO5dDS/Y36BLTUmDXoTDT1X5OHKqTqvS4oVzj/FojzFPgxQmQO
 EWr8UPG37vx/jcZxjHW99awAAAA==
X-Change-ID: 20251203-ten64-dts-updates-2025-12-ba306e21c0e1
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mathew McBride <matt@traverse.com.au>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768458468; l=1169;
 i=matt@traverse.com.au; s=20260115; h=from:subject:message-id;
 bh=S087UL4u+aARVy3r+45/NCQpjQ0CxAgkIwQszbbl3uU=;
 b=1oLD8Vpod1gC+ZjMx1rM8aBe/T9YODB/JdWUPwwt1iQaoLuH97KvOjPln8TrS4Nn8bHeU4VNJ
 MLE9fgW/roLD75W3jLTQno6yO5bCUCYhaOlXMnOEy2tkl8U6mYwocOV
X-Developer-Key: i=matt@traverse.com.au; a=ed25519;
 pk=SM+aGm9Y2fPJ2prfH/b5lab73fTBrKL5UsJwdzv7Pbg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_222756_162589_13373B07 
X-CRM114-Status: UNSURE (   7.96  )
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

This series implements some changes to the Ten64 DTS:
1. Add a thermal setpoints for the fan connected to the
emc2301 fan controller.
The values described here are intended for users of the Ten64
desktop enclosure and are rather conservative, it is expected
some facility to override them (e.g via device tree overlays)
will be provided in the firmware.

2. Reduce the maximum SD/MMC bus speed to improve stability
with some microSD cards

3. Add gpio-line-names for all GPIOs that have defined purposes
(both for system purposes and those routed to the expansion header)

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
Mathew McBride (3):
      arm64: dts: ten64: add emc2301 fan controller and thermal set points
      arm64: dts: ten64: reduce maximum SD card speed
      arm64: dts: ten64: provide gpio-line-names for all system gpios

 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)
---
base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
change-id: 20251203-ten64-dts-updates-2025-12-ba306e21c0e1

Best regards,
-- 
Mathew McBride <matt@traverse.com.au>


