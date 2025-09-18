Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D906DCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lQJyQ7FLUMcIhP5TEGnDgUZcIoEC+sx4YCsTN5+u4L0=; b=ynlnq+0Si84AQ6wiOvfB2nEh+U
	DXFp9S1j+wv+4JXKjCMvDr44yzYMJnS0E3maeeh7HOJ8kCQOY7Vw2IZd1GZCkOn6iPDyylaJWeBhx
	aeLC7kieLoz6X46lBlnExvQwmJMVZSC937atIvI5sKL6xNopNlxdpOKo1wyF9dhQ8dHxjc/TMT+Ej
	6tOYeZEhQWZnHsnNNR0AQepbBC7kA8YCIhOKB9SMxK9mbh69vhxmDIzIUeWgBn4rAcjBHC9ftjQ76
	4e02bfBh4KeIlsPSG/4ZBEd0Tsx9V5VICvahb68fcN+7kUUaM6JkWJpMTgHT4ItQkiCxHyUD1SE2b
	JJv/ir5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7uz-0000000GOIs-2NLS;
	Thu, 18 Sep 2025 06:14:57 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7uw-0000000GOHn-181R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:14:56 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 09EF11400270;
	Thu, 18 Sep 2025 02:14:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 18 Sep 2025 02:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1758176091; x=1758262491; bh=lQJyQ7FLUM
	cIhP5TEGnDgUZcIoEC+sx4YCsTN5+u4L0=; b=BezBWcen9LSA5oncojP1Qfq7Ta
	/sLn7aYCEqICzUJXKpY4kQYXZgEv7Qx6TdhNqqe2QNczPESjWZYCxoeFNZn913Su
	+M2Nr7OW+KyRtiXl/KcR1oXlgmz1vZkgH2wymcNfpuKWT5PQpnnAM9C9Frah3hSn
	Xrjh/13J43aeQxCsIf/nOPMQf5nh1JqDYq+HpNBsbqmMPEUI1tTE9GKHd1qw1idx
	e1xa1YfmDxcw5F6xVofa+xWDpQGRHQwlKHSnhuHzzv2WuLEtEywDqKmZ8RVof38d
	9DDRaY93UP6gt7M5Y3kTgTqzYnWDgp1kUHO6KOTnv1y2FWPf1gWU9dtFSAww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758176091; x=1758262491; bh=lQJyQ7FLUMcIhP5TEGnDgUZcIoEC+sx4YCs
	TN5+u4L0=; b=jMkQyWrbbehtL/JEHvOSNJcFfifhWNWCvQpxf9L1Zv7Gy76jJYb
	LcXIyA/JlXrYeljn3+FT+vC+JVkdk2efUhm0LNecKWj+FFWYiLY8P+ItSRPl1Di3
	VHU1IohHOERS18On2A0pmm6dvgvPdRpuR5LJerqS7ct7YTpiPS1LG/zN7p/x0w0Y
	zXj5sqsv63nIyJHlxYcvEa6+ZdY+5H4+nUElcBA+yvHlcPiIK/UaGMxClRar4D44
	HVgnJpUIF4azqtvl9g2ooWHEU2MdngqXA9HEX0lU9Vz3FkMqNR+F1UuQ6WHsmwri
	IqeorjITwgK7eb5Mf7K+bZ9Fn45lyRWDFVQ==
X-ME-Sender: <xms:WqPLaB65Td4CgHbfUTT-D0RIEWMBH-h2epdyBtKLnXynoVf3DO7zow>
    <xme:WqPLaFoW1KmQXsRuthzFOuL1JUa_NHYrJ-7Hho6MWVNUbwTOhHkgK0fSNoARW0-gP
    MCQQiBe0LpCfPjopSo>
X-ME-Received: <xmr:WqPLaKNADrXFrami6u7mO2NJaNLWhbK_wGfhef3Srxk6NkrpuuD3W_eK1Z2rbV0e8JD-7RSUvC5ztvnxBwbWkH6fRyG28tE4x5fJpXhKI4DVspZ8mKkEgcGN3JE4c3Wmc4AXWAdudc86qOXceeKSY-M7Nps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegheehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforghthhgvficuofgt
    uehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecuggftrfgrth
    htvghrnhepjeetheejgeehhfeuleeghfeihfdtvedtvdefhedvvdeludfguddvheekhfei
    geetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpthhrrghvvghrshgvrdgtohhmrd
    gruhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rghtthesthhrrghvvghrshgvrdgtohhmrdgruhdpnhgspghrtghpthhtohepkedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlih
    hsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhho
    rhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvggvsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruh
X-ME-Proxy: <xmx:WqPLaF3MhVx6MXo1P2YFhxqhz7rlzy5fX2FLw41B7YA0FzQ8Xn9owg>
    <xmx:WqPLaBBH3LMOsga1skicxtFDZvcvs4gFur1kFBdohvJ--XaL8Xzxig>
    <xmx:WqPLaKLR4mCtcyWcZjC0KnpQ5EjLAvvkIkjvWTFFjmipOjtHdISyjA>
    <xmx:WqPLaCmE5NfXPbF7ovmUrQ08r8LNdEKyo99xWMlSc6W9GaKtILhQmg>
    <xmx:WqPLaPRpNU_CD7My1fxzdaYFprYcSO8w6hd24lyEmmgQMV0Cig1Sm0pN>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Sep 2025 02:14:47 -0400 (EDT)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v5 0/2] dt-bindings: embedded-controller: add binding for Ten64 board controller
Date: Thu, 18 Sep 2025 16:14:39 +1000
Message-ID: <20250918061441.5488-1-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_231454_986614_E1F79B4A 
X-CRM114-Status: GOOD (  12.67  )
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

This series requires the "dt-bindings: mfd: Move embedded controllers to own
directory"[1] change which is in mfd-next for the 6.18 cycle.

Changes since v3:
- Move to the embedded-controller directory (which was created following
  the last submission)
- Remove the extra paragraph in the dt-binding description field
- Const'ify the I2C endpoint address (only one I2C address is implemented in
  hardware, 0x7e)
- Fix the description line of the fsl-ls1088a-ten64 patch (s/arm/arm64)

Changes since v4:
- Cosmetic only (no changes to the patch diff), clarify why the Reviwed-By:
  tag previously given to dt-schema file, was not taken up due to the content
  of the patch changing
- Previous links changed to lore.kernel.org where applicable

v3 series:
https://lore.kernel.org/linux-devicetree/20250821061115.18254-1-matt@traverse.com.au/

v4:
https://lore.kernel.org/linux-devicetree/20250917011940.9880-1-matt@traverse.com.au/

More information on the board controller can be found here:
https://ten64doc.traverse.com.au/hardware/microcontroller/

There is no (presently) Linux kernel driver for this device, but
it is used by U-Boot for functions such as reading out the boards 
assigned MAC and controlling some devices on the board.

[1] https://lore.kernel.org/all/20250825081201.9775-2-krzysztof.kozlowski@linaro.org/

Mathew McBride (2):
  dt-bindings: embedded-controller: add Traverse Ten64 board controller
  arm64: dts: ten64: add board controller binding

 .../traverse,ten64-controller.yaml            | 40 +++++++++++++++++++
 .../boot/dts/freescale/fsl-ls1088a-ten64.dts  |  4 ++
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml

-- 
2.45.1


