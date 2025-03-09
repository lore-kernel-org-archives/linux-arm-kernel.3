Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B27FC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 11:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cp91pbB5DN2RZua8Qzi2EZ3MeEoU2r2L7P3lFPNnfBY=; b=Wh6YaqvdCfy2V9ykiMElxyxFs/
	BcS3CHzhWFHgtlzUXA/XI4OvfwQUjURrJTPvwqJ4CtwYg7geWnOIwXUdlVqFMrX1I2pL0lEPDRbVu
	yV33/lwvuqFjX3+UdNviRcNrjM5wVFtG6UnC5lbEG3EhArrV8E2z/M5WVCd8M7vnTFfs9gDNqk8sZ
	q+vvvW0ShlQbPyek9iNFh0XZlSuXOrPrHoCfCC+1Y/SWijSPdU0pKmQqDKZZsE5lqNj4fd5wrzVlF
	3PRCX5eNbf+Tbn/NH12cN/bK+6dxui0A6UDEeah+VF7BjrAixhK8O/TiooymVofGKKmhivwg6Dv26
	Rz1oKfyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trEv5-00000000SOB-3IDF;
	Sun, 09 Mar 2025 11:34:11 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trEtR-00000000SHK-3S6r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 11:32:31 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.phl.internal (Postfix) with ESMTP id 6E2A9138277C;
	Sun,  9 Mar 2025 07:32:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-13.internal (MEProxy); Sun, 09 Mar 2025 07:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1741519946; x=1741606346; bh=Cp91pbB5DN
	2RZua8Qzi2EZ3MeEoU2r2L7P3lFPNnfBY=; b=PQU72ehjmMOLtRay+y0HSuFSMg
	CJsQjmj6Xxn6dAsD2MFECU4nHG3PRAqH33ktLvgp+dmlQ/GP0K/4jDbL6Z4Lk4y9
	ZWSD0oWQPitmZjueSe4B6BcuN7qHQwNfqLUxwrcUKv3NGqEtg50EIj2l3hxb+9Qn
	gDd+3UEyeq2hFr/J2GhWBjwuxpvAF+7KAlKKTBwiPfA8XHy5xxsQ8zOTWPVmAmhv
	b8qpo4UiCGJGkCs7a6cZ2pgogE7myPTBIa+06uwRqQTO1NknO4DqVK83pUK60nPN
	a3jIobf1fNhkLjfSSQ0gSMWdXt11eRpEGn9cCtuXzsK94FXzhUk6zba7ti5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741519946; x=1741606346; bh=Cp91pbB5DN2RZua8Qzi2EZ3MeEoU2r2L7P3
	lFPNnfBY=; b=u9EwQZBU2ecARqRlwjNuXFotaZQIfFKVF7Eve4ypZ9BjdIUJaqA
	a90V7dnjKUAStnU3atPwt1EvftBMCJqYpHufat0JVN/bZZ0ZwgKCL2MYq+Z+FSXf
	cfa8bIgtc6KooCCoW30Rt8BrPmuAiN5vM/Lmk//qW7cEjcCKqb+4cqR67EDbn6s8
	v8dug2SMkcimAmg7Fl9qVkNtBQbjZnl3zgFmNWyyzrB2cWKxcBlOx9FrV8jI/kvh
	caxMTxA3Xf4XG6tRXJRVVr1nPorjW1DNedzyp88+ySdqtCd+IoXydxG1t+4/A9qT
	yDh7KpPCxy8XZJi92JWXHFwFgonMHcffoAA==
X-ME-Sender: <xms:SXzNZ25iLS_exPE_cN1I1JaG2f1JDlX9osjrHo3wonjzmRjksf32kQ>
    <xme:SXzNZ_7YH0baFb4_jYaWuseCv0oQ1vvaTcnZ7kVRxKpTmQJSsWpIcTJ6579IXp27T
    FGxL6yyXwOrVDNkZWg>
X-ME-Received: <xmr:SXzNZ1fwC76ILiwN1yjLQJDR50RsJ-GhwvrWZZPfVK1wq_lMa_T2iYpJ47cFPJvPHK7hAoSV8UHIfYWXlm_md4frNjs28M7RplHrxpQDozOE7BiQNwmKAEWguVJMscw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudeifeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehs
    vhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnhepjeelveffvd
    efgeeuteefueetgeeghfelveevheeugefftdelleeuudefvefhieelnecuffhomhgrihhn
    pehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdgu
    vghvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprghsrghhiheslhhi
    shhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:SnzNZzLrGuwSnzZhhua0RIYir2QSycKhL4Nr0VfLVJi0kRiRSciAmQ>
    <xmx:SnzNZ6LUICEe7rI2mDX8zXiVGzm3kOFOU2awiOoGMZQgYT7OZvScHA>
    <xmx:SnzNZ0yxQpzmG6s-jypPAZftYb7FnRZjZRVgwKMfQCQV705_fjcRmg>
    <xmx:SnzNZ-JWXUCxzguKEGVoLSGTM7WlBUrGX1zMSR2-SAWCV5b6VnwCqQ>
    <xmx:SnzNZ_EfmoYfk3PkPkvj65VP3uGWSz83iIRnyv4w5J502ZWNWMMF9BG4>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Mar 2025 07:32:24 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Third and final batch of Apple SoC DT updates for v6.15
Date: Sun,  9 Mar 2025 12:32:12 +0100
Message-Id: <20250309113212.48137-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_043230_263410_CC4EC9D8 
X-CRM114-Status: UNSURE (   7.70  )
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

Hi,

This is our final pull request for Apple SoC device tree updates for v6.15
based on the previous one [1].
Drivers for the M1/M2 touchbar screen and pre-M1 (iPhone, etc.) backlight
have been merged since then and this batch includes the required device tree
nodes. Both drivers and these commits have been part of -next for at least a
few days. The corresponding drivers are scheduled to be included in the 6.15
merge window as well.



Best,

Sven


[1] https://lore.kernel.org/soc/20250302115808.59172-1-sven@svenpeter.dev/

The following changes since commit 44db68dee1f77260d7037319e911e9883a6ffe0e:

  arm64: dts: apple: Add touchbar digitizer nodes (2025-02-26 15:33:46 +0000)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-dt-6.15-v3

for you to fetch changes up to e1bc21d8f8fde47173073a2d6233f5faa4864cfc:

  arm64: dts: apple: t8015: Add backlight nodes (2025-03-06 20:54:28 +0100)

----------------------------------------------------------------
Apple SoC DT updates for 6.15, final batch:

- Added touchbar screen nodes for M1/M2 platforms
- Added backlight nodes for iPhone, iPad and iPod touch

----------------------------------------------------------------
Nick Chan (5):
      arm64: dts: apple: s5l8960x: Add backlight nodes
      arm64: dts: apple: t7000: Add backlight nodes
      arm64: dts: apple: s800-0-3: Add backlight nodes
      arm64: dts: apple: t8010: Add backlight nodes
      arm64: dts: apple: t8015: Add backlight nodes

Sasha Finkelstein (1):
      arm64: dts: apple: Add touchbar screen nodes

 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi     |  4 ++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi        |  7 +++
 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi |  4 ++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        |  7 +++
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi  |  4 ++
 arch/arm64/boot/dts/apple/t7000.dtsi           |  7 +++
 arch/arm64/boot/dts/apple/t8010-common.dtsi    |  4 ++
 arch/arm64/boot/dts/apple/t8010.dtsi           |  7 +++
 arch/arm64/boot/dts/apple/t8015-8.dtsi         |  4 ++
 arch/arm64/boot/dts/apple/t8015.dtsi           |  7 +++
 arch/arm64/boot/dts/apple/t8103-j293.dts       | 31 +++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi           | 61 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts       | 31 +++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi           | 61 ++++++++++++++++++++++++++
 14 files changed, 239 insertions(+)

