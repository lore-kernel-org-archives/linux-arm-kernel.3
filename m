Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5D4C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G7fJXu4jyQdtN3N4XbnGyi2XfxpE/vrFhi3nZwuRLSs=; b=SM27eahijhtffDoVbGrDfpLAYq
	aNDlAFcCi+2JimVng3qLuZ1YpY6PMyHeS58dehf3W5JSUfQF8ei0rzK4DX4g25b7c4mTDLFmmJiKf
	S0LRHPkbJKNgftPQFibMoCFxccR0LSoqhT3fTjsD0x5O8NdP/rlYjEe4OMzjXNiawb3sej5qrDBFg
	5kxCt3PoLM9QX0Ue4kNIg+huzAsNZG8nXwcme2557me2jF862dHC44yblZvAMAv7U8y5ceG51az5J
	BEFzf8EfcW4zsqwqM4jy2tmbET7VRbqTPI4qQ6eLb1NMebgqpufAszu2d8ZPqaLb7inmY80nkAcb2
	dYy5gPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5j-0000000BIuo-1XeN;
	Wed, 23 Apr 2025 17:40:59 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bRH-0000000AsPh-3731
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 14:51:05 +0000
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id C963D11401F7;
	Wed, 23 Apr 2025 10:50:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 23 Apr 2025 10:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1745419859; x=1745506259; bh=G7fJXu4jyQ
	dtN3N4XbnGyi2XfxpE/vrFhi3nZwuRLSs=; b=vIdrmn72Zr+p9bSfnB40Za/1py
	6k4fhm7awpAbIxEvDkgtiaFuleqPolPAyAAoxVjOG6Ke8IBP+6+yF6llloG9b+GT
	rTg5ZRZTHcmd/d8GeRnYG99dM93C+XUjPSX3tLL0uAVvJv+MQUXnBJlhZ73V+MTv
	AEW0n+r+4Ucwuti2mNHUZ/G3X+ytrjCFNbgsS3gPjNGnkIGIzCEWhQ6ldb7b5mLG
	DMUVcEYLtQ1XbphIv75JOWA9cyjNL42Uetp6Se0BTaC+CxUkqqyjVB2B4h41D0op
	lKyagDd/D97fB+gyDMfIW5vHjOMhqHPBgGNegCQOyMHYcaSIHugqBx7XPuFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1745419859; x=1745506259; bh=G7fJXu4jyQdtN3N4XbnGyi2XfxpE/vrFhi3
	nZwuRLSs=; b=Zl/3LmPyjVCeKjXPtq6oJGCQtVf67lqX1Je9LiVGwcmjl57ELjZ
	hf3eWfEnMZR+6RPejr5DXNlxs4PEbSraUbDbkOe15uGJ2OAoxb6tBFTv6OVOOZ4+
	O9RkjG0lwJcHKmd+r4xqxSC+xfbG+n/O/bo36on7JJz5FPWnDz5iGJ3IpkuV7tLr
	ErxALos37LQnUY1lgdZMDw4PyWf9gFGsMQkK6T8L1pcXKXpIjXdOGnIHeYlpiYrI
	SYYpRdTKFsZI0TIGC0bCPvrB439g1zW4EP8Z4pkEnYVCwSDmyJM9Fda7tpUBoNcx
	73CWqd06OXdOpG99g+waGV2Sfa4HlxP7OyQ==
X-ME-Sender: <xms:U_4IaE3ZmKovaZ4BzZB9PCSu3MSVdHkdT5eWtdtM_E5mPTcfVRxLNQ>
    <xme:U_4IaPHPQVcln5jUAEZYsBwG0I5xsSF5KCZQU7tma0-nt4SKItDYjNLD_dgAPjHyM
    9aNiDSMHjbuhmZsf9o>
X-ME-Received: <xmr:U_4IaM5nZO9r6Qf9T0grvbOx7WPWvKTVpV_fmWPVZ-IiRFLNIPLgQY0Xdy6AS2MDGQ7N-Ko-zccZHIOynQ1nE_jZ_Qjrq82pOJeRUEOim5hJzuFGMOQJJsSNHDqUUXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeikeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:U_4IaN2yzr0umJZVNR_dt1n3AbJiiOqv41ZBAv-oSidEkM6YKebL0w>
    <xmx:U_4IaHF6tEtAKgauoUr14PbJnw93bcwPnfedWnKTJzrvlbGUr1JsOQ>
    <xmx:U_4IaG9E7MC7yr-n9nCPfs67URyXrRBiMeMSozxOjUoaUfc9aqEQGw>
    <xmx:U_4IaMluBjXclKO0rWpDVfT2ezHmG87WP3jsAe6ZJYkT3UW7KTOtog>
    <xmx:U_4IaNRtDswWqhEf1HvsBLkEEcwd0AanCfD617GQRKZMZJPE4WfriCI7>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 10:50:58 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC fixes for v6.15
Date: Wed, 23 Apr 2025 16:50:47 +0200
Message-Id: <20250423145047.3098-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_075104_211848_7D421FA8 
X-CRM114-Status: UNSURE (   8.18  )
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

Here are two small fixes which should go into v6.15 from our side,
see the tag description for details. They've already been added to -next.


Thanks,


Sven


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-fixes-6.15

for you to fetch changes up to dc5befecbe2683ac49fc8dc76aade35e62f4cf30:

  arm64: dts: apple: touchbar: Mark ps_dispdfr_be as always-on (2025-04-19 08:40:33 +0200)

----------------------------------------------------------------
Apple SoC fixes for 6.15

This tag contains two small commits since rc1:
- Add a .mailmap entry requested by Asahi Lina to better filter her
  emails
- Mark the power domains for the touchbar support introduced with 6.15
  as always on since the driver cannot initialize the touchbar from
  scratch after the domains are powered off (e.g. during suspend).

----------------------------------------------------------------
Asahi Lina (1):
      mailmap: Update email for Asahi Lina

Janne Grunau (1):
      arm64: dts: apple: touchbar: Mark ps_dispdfr_be as always-on

 .mailmap                                 |  1 +
 arch/arm64/boot/dts/apple/t8103-j293.dts | 10 ++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 10 ++++++++++
 3 files changed, 21 insertions(+)

