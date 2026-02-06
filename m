Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48A2EB28C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 05:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XanFJk6z+qGIRmlUMo6TSRHTx9qrlHyNpnmxNZ1x0jU=; b=VaL9kjDh4WQD+X
	GX8RwdQ9UjUJBawRt7PXgwqthB/UIouGApedHrIOqzNqHhQaOWwMqACHI46P3q7qpRtFzcpufNN5h
	vz2L7fqNTuDnsuVBRZGlM/wkoyg7JHqROB4HYp0qbCDeWixkcFn/qA1jpJKkFQtbYdNdXRR2Srfz0
	Rxa445FQ2kuUydA8kLsYKUpmZ1lUDtmEXpWZGrDcVNqJRzHSeIH20zO1WiNxDqnGU3E4jOkTDs4Tr
	wXuHGf+pu5LQoWW7Xsr6yU5dq9X4KPyTAKae/ERID+Z48uaNofBF13cpU1OlQ76+2l9SD0IQtfJlb
	Je6cChiklelrCl2DguUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEMO-0000000AtTp-3jnZ;
	Fri, 06 Feb 2026 05:26:28 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEMK-0000000AtSw-1Ezz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 05:26:27 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2B68014000DF;
	Fri,  6 Feb 2026 00:26:20 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 06 Feb 2026 00:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1770355580; x=
	1770441980; bh=XanFJk6z+qGIRmlUMo6TSRHTx9qrlHyNpnmxNZ1x0jU=; b=Z
	BWMV3p9004+oT0RPvAK/dua/Ij9vJ6NWBR2OaE9RYviIhKMQUL/DqvVSmwomLYwE
	j/Cz4bMiVHldJ1Khlg+UoLnjHwVG+D+B7QhpRhMM8RHWaS1AU5K1Pj50nR7nDQjs
	DHCNSsrzd61Tmo6gDc/JWPLBRInuAoUFB1m91s/jbsqV5Mfr/j+/ficlV9wMof7j
	45/ckQ9adgCzFdp6kmeMgb9pkBTJKQ4U2OMU/cVlbHmapNxUfXoD4iYigeo+fbZg
	YaCuakmrU3gzmVLiGWNyI9TQAdmApzNz39jM+cubTBniOD/9prZjSR69tDQMRZAf
	kbKPWRAd1RT937Sjdh56A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770355580; x=1770441980; bh=XanFJk6z+qGIRmlUMo6TSRHTx9qr
	lHyNpnmxNZ1x0jU=; b=q6TSnqOlKibiwUe8VrBehl8Vey+bAPBIIYSBoT0GDr3e
	KAZ6IQx6C3UxhkDpuNoKgp7Yz3KhOp+mH8DfsK361IW/zxCUu/Lx9TxfTULXbCcx
	zg58JLyNC9QuzhnrQjxdFoWE1swrbFmxxJk/FmmhRkl8G3tU+OUWfFshXobc7/lO
	VBNjaMbxyb+5PyaKDrOi9qKJE7gu4DJ6DrzGmmPlPVqs9biD7eZ27twlnrDO7j3V
	bmFx4QgN4Ciq8EpqJUUlIoJkS8EG1TtH/dHmv+Af4W9LlIBFOdL7PQVPzWje8/W7
	4rDDLKFGzm+IwD49b5rv2KB/sE+hqkxbFNevp18Tqg==
X-ME-Sender: <xms:e3uFabWjun-9BvfioFzCm5z8cbgbas6R2swWLed3xZVKRbANwh-tGw>
    <xme:e3uFaWIyHCX-USb00SL74PFF1gehZcXOT3wEKt0AureqsOkgh_ZhWjD8nt_Fixo-Z
    p-jEV-LwAQ6Ee0Yb6ONlncXbp8XPjFbr-PqhuONa0Ocdc2BaxHU7OI>
X-ME-Received: <xmr:e3uFabBUuxf2wJuI9RVK5-zXPlorspMiKqKcYTurq7E9pSjv-J5lMeCRdndn6r7JQ1oLYBREsV-5t-s5cucrxo9jJJUGCnIA3-S2rCMhiPiI0el7a7z9zaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeejfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeforghthhgvficu
    ofgtuehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecuggftrf
    grthhtvghrnhephfekleegudfhgeeijeekieehveeltefhkeeiffeljefhudeitedtueeg
    hfevvdfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghtthesthhrrghvvghrshgvrdgt
    ohhmrdgruhdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghupdhrtghpthhtohepkhhriihk
    odgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehfrhgrnhhkrdhlihesnhigphdrtghomh
    dprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:e3uFaWfkpShQTbhjkPtnQCDJ9fVZI6wFvRSNxpVqzhiZQWouYKs3dQ>
    <xmx:e3uFaa35SrzO78sPbV19Av0RFdgqbgeXL5NVK8j-ijVdheSvnsZ9lw>
    <xmx:e3uFadhyW8uUOH4CTGbpHHf4eYf0yVy-xZkCNjv8BMnFdAe5Abw7xQ>
    <xmx:e3uFaTnyRLfNLcFW84k4FU1KdZj8-k2ymKXdJ86RVVFRvtgbw4X5ig>
    <xmx:fHuFaVXJY6g9xFVA1wmQp85Z0pCGwmg-7Hru2ETQiMiCgRtNU9v4SVyO>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 00:26:16 -0500 (EST)
From: Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v2 0/3] arm64: dts: freescale: ten64: updates for
 hwmon/thermal, mmc and gpio
Date: Fri, 06 Feb 2026 16:26:11 +1100
Message-Id: <20260206-ten64-dts-updates-2025-12-v2-0-2d77f47a89e7@traverse.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHN7hWkC/32NQQ6CMBBFr0Jm7ZCZIo1x5T0Ii7aM0oVA2tJoC
 He3cACX7//89zeIErxEuFcbBMk++nkqoC4VuNFML0E/FAZFqmVFDSaZ9BWHFHFdBpMk4lEhK7S
 mIS2KHQlD2S9Bnv5zuru+8OhjmsP3vMp8pIdVE3P7x5oZCU2rmxtZa5VxjxRMlhCldvO7Niv0+
 77/AAkNYZfIAAAA
X-Change-ID: 20251203-ten64-dts-updates-2025-12-ba306e21c0e1
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mathew McBride <matt@traverse.com.au>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770355576; l=1515;
 i=matt@traverse.com.au; s=20260115; h=from:subject:message-id;
 bh=RxbK41rt/m7zbJesG3Z6QkKG1uCBKfEDyBwzqmZTGNQ=;
 b=eMhl3Zj7hKnM9o9aAYzy2Wucs9O1T1HffAVto28/0UR+5Szvj9hqicvh53REmvaQ50tk6OJC3
 alcRMGOPWnCBtsDFMbNxd/LqTc6eqY2bDT8rcS+6dQNubJ7zPdfEZKZ
X-Developer-Key: i=matt@traverse.com.au; a=ed25519;
 pk=SM+aGm9Y2fPJ2prfH/b5lab73fTBrKL5UsJwdzv7Pbg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_212624_669782_7EAA7E40 
X-CRM114-Status: UNSURE (   8.12  )
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
with some microSD cards.

3. Add gpio-line-names for all GPIOs that have defined purposes
(both for system purposes and those routed to the expansion header)

---
Changes in v2:
- Fix the labels for the SFP+ (XGO/XG1) related GPIOs (patch 3), which were
  swapped around. No changes to the content of patch 1 and 2.
- Include "freescale" in the subject to make it clear which tree the board
  belongs to.
- Link to v1: https://lore.kernel.org/r/20260115-ten64-dts-updates-2025-12-v1-0-a56380bbb2ac@traverse.com.au

---
Mathew McBride (3):
      arm64: dts: freescale: ten64: add emc2301 fan controller and thermal set points
      arm64: dts: freescale: ten64: reduce maximum SD card speed
      arm64: dts: freescale: ten64: provide gpio-line-names for all system gpios

 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)
---
base-commit: 06bc4e26310f9f2c0dd2fbf4885483306c5235cb
change-id: 20251203-ten64-dts-updates-2025-12-ba306e21c0e1

Best regards,
-- 
Mathew McBride <matt@traverse.com.au>


