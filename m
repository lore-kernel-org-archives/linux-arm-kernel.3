Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168C9C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 15:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4sLZtsQqiXOx6MVDhhpvktftzSq2Eg0fdZh/iken748=; b=k6y0iAOWQoUHkhA87pSOJgCYdS
	/UFLP2P3sf1C8nOd97KtHUNPGxE+3eOczx7sFG1CIf7YADe4IsnerxWCODVH4x8/c/YvVShTJA4ax
	TCsTwIQqXG6vTpZUUd5o92nUAUe9J1sB3GB//exs+I5YLyv1aCMstI6BwWL7B2l6YkrUxHRfMJyBn
	VVwCBq4N0nkp2lpS1LZNjy0crdsdaXFHswOoofREcAi/5b5ptR7vfNssoz38OWvWbFpj7eVWtTD1i
	cMJZh9H0oKAAAqfzmVhhmcWvmkT+tltJtDGuHFSef9bBqnelea70YWVBdLCQFe897edWVFNigK2ex
	XYuPYKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRv8-0000000FLwu-0EBF;
	Thu, 16 Jan 2025 15:36:34 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRro-0000000FLRu-0C4f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 15:33:10 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6175E11400C6;
	Thu, 16 Jan 2025 10:33:04 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 16 Jan 2025 10:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1737041584; x=1737127984; bh=4s
	LZtsQqiXOx6MVDhhpvktftzSq2Eg0fdZh/iken748=; b=ItnRXkQ6fhD1p/N+wi
	kwlSf5OB9blDL/dwtXsECwasixa+LQGmOvQlYqv1Sv17P5nzKYCsYEwSMxnG15fW
	GekFwPQ/C9mi3GHjPU6VkCQTzhTphFeYDZM5l9ZPdffcqdmMWPaakoUvQyHidv1/
	3jflXvuboKK9T1T65Fdq5fnmh2K5JPv41AqZ7ugD7EQ2xECk9TUdGxSOEXaspLWM
	S62xgGPeuDD3+5uWGRNutYzoiRG6I2MlsUdSZpnwszAYxT7K+IlUFo6eb1u8pUUs
	5n4ulvk5wKk/VlQfomvLrnyrgaUqJROwCrOyt91BKiD98lSIeTc6cNH2B6B3BgJc
	MtXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1737041584; x=1737127984; bh=4sLZtsQqiXOx6MVDhhpvktftzSq2
	Eg0fdZh/iken748=; b=Wgp+Zr19SyZfYxQAl3SU5e1lLFKH/94nLnMje0cornqU
	ZzYyea7SyTFK2d7Yf98lYe+jsatrKi6l/lF+ph3+Wqv6knBDMopqLmQh+63+byIw
	q4GGMukW7oHYEYZ4+p1tudaHPz+WLkR/mKw8RgV1ie9e99EDFHIpZsqrgKtpwmhZ
	TKE2kUQ0gPhI/0ejJ7C2H0ANHw+DMqzkWFoHzI2B4zKPgKwSHsNWv15r+vkZiLOO
	YdarQpQXB87Kqa5fZSHpsNK7vaY1ZYFw4oE0QKL4N+rQqGGzkUVwjaiqU8xurcva
	gsJX7sgJRgOvS+fRQkY99MmB9kNCSpu9DfY72DTIYQ==
X-ME-Sender: <xms:ryaJZwMKV2ppAtSaIqZdm8OigQQF-xzWOlY-eIhexUz3XD9l5n5akw>
    <xme:ryaJZ28RyJaqv_Z32KYaLQdJXEP-3dV66DQMOtJIMuIPZ_sYMSTJFCMs8gnGmOeGj
    N7SMW9gzW_h3LOTu7E>
X-ME-Received: <xmr:ryaJZ3R-jT5bsU9I-faEx9HpWvuNpBuyXMt8byiNruJ1ENDnIxOL8KRKkdOoD1OsPk-GsTqizCX_HLTvweC82kPfdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiuddgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhu
    nhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedufeeuvdejiedv
    kefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthho
    pehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheplhhinhhugi
    dqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshes
    rhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:ryaJZ4t7rjGEIgypr_8ep-sY2T5FoxVFZlcpGszF_TohH0W3oKw8ww>
    <xmx:ryaJZ4dAsZTGtkG_pBPOZheZgRsL0lTbhULfRUgs2WC8uJRdb_fjKw>
    <xmx:ryaJZ81fzJ5wJiansACb83OH9Vg6g-wm_U1JNvcW7-Jg8EmChreIIA>
    <xmx:ryaJZ8-JsMQ1RWzTjmVtj8U02ifaokMywhr_f4FFT3SSjtFGA0ppuQ>
    <xmx:sCaJZ9EGxq6283vsz2s4QmBDF9iO7ZIoffYY8NAfInuwnJZxoFgeD3eN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jan 2025 10:33:03 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] ARM: shmobile: defconfig: Supplement DTB with ATAG information
Date: Thu, 16 Jan 2025 16:32:04 +0100
Message-ID: <20250116153204.615736-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_073308_557112_253F2132 
X-CRM114-Status: UNSURE (   8.10  )
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

Enable CONFIG_ARM_ATAG_DTB_COMPAT to allow u-boot to override kernel
command line from DTB using the bootargs argument. This is needed at
lest on H1 Marzen to control the command line from u-boot.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index a8afbd338de7..0030225dbc34 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -15,6 +15,7 @@ CONFIG_SCHED_MC=y
 CONFIG_NR_CPUS=8
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
-- 
2.48.0


