Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F146AC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SPLHEnL32VMztrcnb47sdOOIp8DhV7sAw4bVApA3vKY=; b=ndkVnNhWTNewONuaHJ4lukdr9p
	MBZFWi2vYeAfF8XjB7s99bWjLTa/hy5YL4y+QM1jxEASTJGBeVvoKQuAk6sJedPeZMx9YktK4E3WC
	s/PRfGZ1LVmG+J522BymNgbTOGWgJLu5JuPdNzWRkDoqIZK8O8XuLtV9CRFO5foM7C2XoQ/296k51
	cK1Iz/nbz+fmnjd7032BoqIs6FPLuQEmS7GwFHFf3tlfaXxXI6eb8sHP9IWsF7OTIq141NpEtCIed
	4igS8Oq3a4UiicwmLQrefJof1F2cdQk/jJ2ac99OoagkZ48Izx4f4t47ItdIVHPxhf9tkIwYOTxBj
	K5kRkUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiX8-0000000GIuk-3GNW;
	Wed, 07 May 2025 17:26:15 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChK9-0000000G6Td-3MdI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:08:47 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 01F8F1380109;
	Wed,  7 May 2025 12:08:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 07 May 2025 12:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1746634121; x=1746720521; bh=SPLHEnL32V
	Mztrcnb47sdOOIp8DhV7sAw4bVApA3vKY=; b=QhMACibKXCS8SvOVvp9KFMJlP1
	MdVstuoK/2maW98xhdrSHmGTefSHzOafHR6zmnfhUFNkbL6EaTtno5pGGcfYFzHR
	r7yJsjSzRZS2cwII8Bp2fjnO8FUPcyD5sXRUPoLjyQ7seupCQG8E6ao57DomT9F8
	V7Ije9Gkz8xidSbA9/8uKgV1mGHoUXVqAbqH9wg35Oky0h6yffY3y+ciOeVHsb/v
	PD01ln6VdrTOqU8AR4+AyI//ZQSIOAs8tQQEdFN2pBFQlm5dWE0G3LSK15PeWRje
	nuKWiKRCKfpGAd8biDyNuC4jyLxctrsSDX1OS5+vWlfdG7JlcMeYMhBbVk1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746634121; x=1746720521; bh=SPLHEnL32VMztrcnb47sdOOIp8DhV7sAw4b
	VApA3vKY=; b=mkxzDmZ8c5cNiWRimD4kpXn6TbwfU9L2hM4u8KzEaDWkStygyXW
	amvVUFC4CWtBk679jVeXvjJy7n0LLPiDq7SqmQudZns12koLJxC4oNhb+ervOgTY
	vhv8l0r+7OONw+nhTooXYmE5MurVv0ii/+S1fvuyKI7WpBvh0SBiQ+yh3tVMBta6
	BBxfBCeEGFXXWa/xD/YafG2pd7VF2LPtpSo8qAUcbhINvMl+RVahXZBY5RPIjHRD
	U3Mim/2Oi+ZG/fVVIzLm/frDGHw3lsjxCBqAQFg1z/uYdKCg8zpnHmOqosg0SFtD
	NBpGxvLE0kXaKy+UYtLDa4Fv2HHseOPQm/g==
X-ME-Sender: <xms:iYUbaJ-f4ynyr0duQ0NK1-s_20X7n5hea9NM_3uWC5RVHwdpFBnZpA>
    <xme:iYUbaNvs3adPGwEt8GcFVnRlEmPmkcV3GG3kcNwzcLLYD_LeuIykFFUbhRIA64Awu
    bCQehxRYnyAFkYXJQc>
X-ME-Received: <xmr:iYUbaHDzjhc2aSkqmnTZo9kgIt9oKh84dzhQMOfhMD1RZyJya5CLLJXdCXVDC5J9ZBk6WFpGx6zqGl_HUSVu7a3r6BRBTJykoyHt6LDA-t6HWhJ5JkOYkD33cwm-BmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehs
    vhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnhepudeiiefhge
    etgfektdeiffekhfejgeeikefftdfghfegveegkeegjeetueffvdeinecuffhomhgrihhn
    pehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthht
    ohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhotgeslhhishhtshdrlh
    hinhhugidruggvvhdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdgu
    vghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iYUbaNeyt0ZG1Q8MCrTSfYOCJ0NcDgwxgzdgbYft1MROwcE33qAH_Q>
    <xmx:iYUbaOMTXLPi46aDtpUhs8FjnitPBOerVKyj1PpWiT9Vo_Mkn6K34Q>
    <xmx:iYUbaPkFPchA1eIDLOg5XMsREvxHAHUqyCIvlfgVvwdX_orjJfJGlQ>
    <xmx:iYUbaIvSgveeEMG-gH1--iA_vVQ5bcA34jBf2pcP8e05_dsspQx7pA>
    <xmx:iYUbaGadBcbcWUBvCbatA9_Gf59U8DfRjDasAWulVFf-Ktdl2uCimStI>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 12:08:40 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC device tree updates for v6.16
Date: Wed,  7 May 2025 18:08:27 +0200
Message-Id: <20250507160827.87725-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_090846_461059_19C6AEC0 
X-CRM114-Status: UNSURE (   7.22  )
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

Hi Arnd,

Here are our device tree updates for 6.16, details are in the signed tag.
As usual, these have been part of -next for a while already.
Please pull.


Thanks,


Sven


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-dt-6.16

for you to fetch changes up to d8bf82081c9e5a4f0f239cdd01296377ba490471:

  arm64: dts: apple: Add PMIC NVMEM (2025-05-01 12:03:53 +0200)

----------------------------------------------------------------
Apple SoC Device Tree updates for 6.16:

- A-series SoCs: CPU cache information has been added to device trees
- M-series SoCs: SPMI controller and SPMI NVMEM nodes have been added

----------------------------------------------------------------
Hector Martin (1):
      arm64: dts: apple: Add PMIC NVMEM

Nick Chan (9):
      arm64: dts: apple: s5l8960x: Add CPU caches
      arm64: dts: apple: t7000: Add CPU caches
      arm64: dts: apple: t7001: Add CPU caches
      arm64: dts: apple: s800-0-3: Add CPU caches
      arm64: dts: apple: s8001: Add CPU caches
      arm64: dts: apple: t8010: Add CPU caches
      arm64: dts: apple: t8011: Add CPU caches
      arm64: dts: apple: t8012: Add CPU caches
      arm64: dts: apple: t8015: Add CPU caches

Sasha Finkelstein (1):
      arm64: dts: apple: Add SPMI controller nodes

 arch/arm64/boot/dts/apple/s5l8960x.dtsi   | 13 +++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi   | 13 +++++++
 arch/arm64/boot/dts/apple/s8001.dtsi      | 13 +++++++
 arch/arm64/boot/dts/apple/t6001.dtsi      |  1 +
 arch/arm64/boot/dts/apple/t6002.dtsi      |  1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 57 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi      | 13 +++++++
 arch/arm64/boot/dts/apple/t7001.dtsi      | 16 +++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi      | 13 +++++++
 arch/arm64/boot/dts/apple/t8011.dtsi      | 16 +++++++++
 arch/arm64/boot/dts/apple/t8012.dtsi      | 13 +++++++
 arch/arm64/boot/dts/apple/t8015.dtsi      | 32 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 58 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 57 ++++++++++++++++++++++++++++++
 14 files changed, 316 insertions(+)

