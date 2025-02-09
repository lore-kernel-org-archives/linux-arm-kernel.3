Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F5CC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 12:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBB3S5wHXxRHCBrokp09Qrr+MLiAbdRehT2NEZubiMI=; b=lQeaMn7OFPhcDHOA9fmFkv2aZ2
	zDcfPZRoomgA8B3cLggoceWQd8khtPmFnhMcH07wmOUneHsgW+z/PnJ/OPlQ4+08x2uxARtkb1dNG
	kX9LPUMzWZ/WTKtg2BHSIt6u08edNA7LfSZVMpUT9jcBlilLOBGeO2vUkPciQMPnnXNrJdb8Y7E50
	Fd6oBkHt9E3T/6LLHw+0l3eeREiakxK4UYll1bVQ0FsqokI8bWqir/MQxHxnDE120OKMfNE8qFccE
	SiG61gClNzPIVYH/O2V4jffN+CGGXsHamptN1tuJ85K835svMuf6BX0JEg7vU7VWCJ5rfxvGC0mR9
	qFhpIeJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6AG-0000000EoM8-28RT;
	Sun, 09 Feb 2025 12:11:56 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th677-0000000EnKb-1Cp6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 12:08:43 +0000
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E14551140172;
	Sun,  9 Feb 2025 07:08:37 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 09 Feb 2025 07:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739102917; x=1739189317; bh=MBB3S5wHXxRHCBrokp09Qrr+MLiAbdRe
	hT2NEZubiMI=; b=XW84n3hIu20hl+UK1TLx1wXFkIg/L5wV+Of67RULxRywLNS4
	2rwVnPXY/u7cAL7zR6V4VcDpEE7ySDKJns1y6Id9yi5waEdrzNvJVJgcd7E8DUQB
	6vQ27w4wzB/7LUNh3RQ18OqJW1cfPK4lIDyU8HQdGyz8SGmTzzPHCqMqJ5UQEKCg
	Ru+P80VP59Q3K5Akle2XaPBNfAJUxUwm+Rmojv5AD6Ft4d5Jo+SWCLrRxLoGn8w/
	25ZDScye8zrRUci5nuwRvST0vaXOPTXksfJ4ZHsylG2fxBbvlCynqK0O6wsjNqrA
	hv5EIJM6sRGaGzmT03XRRdiXV5p7knNAtVxvgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739102917; x=
	1739189317; bh=MBB3S5wHXxRHCBrokp09Qrr+MLiAbdRehT2NEZubiMI=; b=x
	vZCve8EvEp4Zg/GU73iM/aub0xMs6HlBPo3bfctDLzzlljwpAIc0xKmJQn9UE+Z2
	53xUiENGO8vTJqMkmVKTPBuOQijFdwwGH97PvIJrfE7Gmfl9Bgg0u53LamjvNyWr
	mT9d/q+8TZq58UKjfkTXxSnRPvlQDUsr7bQwOxPTwThBS2d3Kl78HNpLxjeJXkIE
	+urn+vrY6bStdWjI2YFPGgSyMeEQNsg7/p941W+yK1NckTvhd3BuR6pM45btxm8l
	S/s5Hv3HIEajQQr2xDdCRT0BJdFpVUgPqU3kA1hVXWxQT6jG+jY3H/QwinmoHOp6
	mu5wurANFzKdsTXGhhq6Q==
X-ME-Sender: <xms:xZqoZ0_iRyP_Df5kbtNm1AyWMnYER6GdRft7SzmShhSQBa0_QT6z9g>
    <xme:xZqoZ8txuAXqzBhHUryWjPciJhsBFUiujid49SIU9fVjnYjeTbDTzJ8F5kwot62od
    onn6FdkXspZ2UdEqcY>
X-ME-Received: <xmr:xZqoZ6AtSQ4lNDMAoMM4-ZVbp4-SRYnBJOkLOS8mLIdzpU4F9h26krwXlr2mYrdwa_VTMB-8ULT85nvd6EfToVry6qoOIJULI022LVjat7b9rjLltNS8fGPB5WsQNm8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefhedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeefvdeiffefhfeifefggefhleduueejueekjeev
    hfffudegudduveeutdevtddtheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnsehs
    vhgvnhhpvghtvghrrdguvghvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtohep
    rghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    hsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xZqoZ0eZieiVL89duZxVltyKClKxzCCVJ5g48sYA663cVWFBz3od5Q>
    <xmx:xZqoZ5PRA74y-u6P9idJgxReTxur3yRsc6SS6rOKCFjcXcZwENmGqQ>
    <xmx:xZqoZ-npVISHnlszE7nmi5z7uXt7T25eKBWbjw4KK-SJvOUMEfHEpw>
    <xmx:xZqoZ7t_uMWrtD_MqsOyrx4dFhJpdX0aiINNC4LQcN11Q-VGxeIbWw>
    <xmx:xZqoZ-lIjd-7qNL3CF2yorurH_Lnv5zTv8mI3J6gCsPbRY7XFsPwkS0P>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Feb 2025 07:08:35 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH RESEND 0/9] Add Apple A7-A11, T2 SoC cpufreq nodes
Date: Sun,  9 Feb 2025 13:08:22 +0100
Message-Id: <173910236337.99422.7886961627376438816.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_040842_130363_54873A52 
X-CRM114-Status: UNSURE (   7.40  )
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


On Mon, 03 Feb 2025 20:43:39 +0800, Nick Chan wrote:
> This series adds performance-controller and operating-points-v2 cpufreq
> nodes for Apple A7-A11, T2 SoCs.
> 
> Dependencies:
> 
> - arm64: dts: apple: Split s8000/s8003 SoC DTS files
> https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.com/T
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: apple: s5l8960x: Add cpufreq nodes
      commit: 9e908d5f24dfdd0e21379d879bc104cb0b5e958c
[2/9] arm64: dts: apple: t7000: Add cpufreq nodes
      commit: e97323994f4ae23df8d0dfe750953b8561da3610
[3/9] arm64: dts: apple: t7001: Add cpufreq nodes
      commit: 1b57d5bc62d002e293e3424f59a626e453ba999d
[4/9] arm64: dts: apple: Add cpufreq nodes for S8000/S8003
      commit: 1fd51c73039a0076c8b23c25d6106f73701c21d7
[5/9] arm64: dts: apple: s8001: Add cpufreq nodes
      commit: b0dfdf02f76b61e0c8a7d1158ccc07d9c741901f
[6/9] arm64: dts: apple: t8010: Add cpufreq nodes
      commit: 029e1d609a20941fb4424da985073a2734ab2cc9
[7/9] arm64: dts: apple: t8011: Add cpufreq nodes
      commit: 1174a4690b1dc1f37bd5039269b312b2bb496e39
[8/9] arm64: dts: apple: t8012: Add cpufreq nodes
      commit: 870240153fb4d1ef280a222d5341d9acda206dd6
[9/9] arm64: dts: apple: t8015: Add cpufreq nodes
      commit: ca96d759d8d24d90b1726c2cc7c568ff4728bb42

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

