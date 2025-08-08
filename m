Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F501C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 20:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uHYNYkNF/jUzNDjzt2kUBhDOv1VIkRTZuelGuSEW24k=; b=sTDzh1I0aBgfIkBS51Wd1/ds5L
	+jFeiY6QgrMiHPOpYxpnJICW80MjzteDzEyeWkzypbFqcE9fG0QpPPCWUSe6VN6f7AETO60C5OrYn
	q+ARYa6VTr5dux+q5457UorBp/OjW0NL5JaKRZqkx9ZQ7ql/3uHyRIagRlVanuOkRux6HV4KKPbkH
	K0G+8N5pKb6hp9OcW6t+b6n92FIJ/V7VcA84OS6BQ3jQ6lEEYx+SXqtDOeuEpvJ8Bey0NbwS98wlg
	tRSsFtdPu32I0tpmLs+W0k9o9O5Hlt9PLcD76X6KGSNZFtnZJ6AM7AxUZ0TPmBnltxqr2FVQ73597
	ARCtjWOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukU8i-00000003gOi-1HCg;
	Fri, 08 Aug 2025 20:56:36 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukU6C-00000003gEN-1fux
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 20:54:02 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 0932B1D0007B;
	Fri,  8 Aug 2025 16:53:59 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 08 Aug 2025 16:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1754686438; x=1754772838; bh=uH
	YNYkNF/jUzNDjzt2kUBhDOv1VIkRTZuelGuSEW24k=; b=O17MD1WY6bv0NbqGjh
	LMNS36SyzUV8Nnw95UR1lNNSGzUiXWtQ2DfgCtU1tfzyMf7trKyXThHPr/Xzv8CV
	0tsYEiqvPMbr48oENQrYS+7+o9Lv3221kBeMVQ3CobEshW+eQhAPEpt0roVYxHpb
	ZoQ6bArk2dsojyTZh6yEkjBCW+iRPzI1GQzUJ1yij8GhAfCP8ZeO394H3vsGWCb+
	4M81EX8RG4Vg054GEFmGYbMTqeiCrVK9fVMYCFjvbW19EWBtmhLfLq1M59eXEvZp
	XmhbyYtHXNUKr63swLmno+bLCR78+SP3HIJ10SL0bTpniYMZn7Z2bYHwda9gzMk1
	X3mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1754686438; x=1754772838; bh=uHYNYkNF/jUzNDjzt2kUBhDOv1VI
	kRTZuelGuSEW24k=; b=nZslFBf1DiBAzBPl9TCpQEAfZPaLepsFH+eOZf/DqRqQ
	ATf4WhrWk7H2pOPaTKFTrhdMTNTwOmYIU2a4kt8WlJMy++CoRdkPXwOJZ1/lzk3r
	pOZt2XpGBgQ7L2ircM/qmGvDEHL9y2QZh83atp6i84acS2LXqwcJ7Sx05WT6gvj8
	G8vxTJ9o6vhH60lal9qQTwVNxIsuW+MDgin6O21ROJXWVya87/Mrah8ag2OEqcqG
	iWFvpnLwfsu1PD9fRn8Tbka2yT2/4lkxrarKsk07zI29tfvxnF7L4llUOpF9I9DA
	uPQbTz3hzKbz9bVXgCq+Kg4ERiDp5dADWKoRlpfwCw==
X-ME-Sender: <xms:5mOWaKDF5Sa477--BGjq04zX2KDqJTYQRABQDaeacSXOYCqG6dHgiA>
    <xme:5mOWaEgB2TYRrtLCeEOjQ936HW6s1l-2uSGq6QVaV52jngO4bcO5eDEtadrwSHE-x
    8PHS2VeeQl1lPZRE0o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdegkedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epudfgfeeuheelheehfeeigeeigeeiveevheelteelleeijeeikeekvddthfejieffnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggs
    rdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphht
    thhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5mOWaOAvTk4fvF8E61GT8ipgIa1FWrm4nLLjHPiKWTDipH_-jT_18Q>
    <xmx:5mOWaEA14JsPRm5rCSx6uNvm10o2qJswjrmmoBP_38Y2quMG6GjLKg>
    <xmx:5mOWaIBW7-r1sMdZ1JojYtPLQIJr0WfZzyOFJEM0ghaxFJvwEe6CJg>
    <xmx:5mOWaHqRtAKXD_3OValej2KPDZ34CbDR04dW2HiYVJlZVGgX23FMzw>
    <xmx:5mOWaMKvfZcLC_q-P8k0vPB5KT4lk5Z0FmSKtyVNl3ibAdUBPFS5xkjX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2C331700065; Fri,  8 Aug 2025 16:53:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 08 Aug 2025 22:53:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <828e73a2-23ae-442a-8d29-415a87b8ec4a@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.17, part 1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_135400_910035_F3D78D35 
X-CRM114-Status: UNSURE (   7.64  )
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

The following changes since commit 038d61fd642278bab63ee8ef722c50d10ab01e8f:

  Linux 6.16 (2025-07-27 14:26:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.17-1

for you to fetch changes up to 0c952efa0d7cf5258879406077df33d23cb06d5e:

  Merge tag 'tegra-for-6.17-arm64-dt-v3' of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/fixes (2025-08-08 22:50:44 +0200)

----------------------------------------------------------------
soc: fixes for 6.17, part 1

These are a few patches to fix up bits that went missing during the
merge window: The tegra and s3c patches address trivial regressions
from conflicts, the bcm7445 makes the dt conform to the binding that
was made stricter.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'arm-soc/for-6.16/devicetree-fixes' of https://github.com/Broadcom/stblinux into for-next
      Merge tag 'tegra-for-6.17-arm64-dt-v3' of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/fixes

Bartosz Golaszewski (1):
      ARM: s3c/gpio: complete the conversion to new GPIO value setters

Florian Fainelli (1):
      ARM: dts: broadcom: Fix bcm7445 memory controller compatible

Thierry Reding (1):
      arm64: tegra: Remove numa-node-id properties

 arch/arm/boot/dts/broadcom/bcm7445.dtsi  | 9 ++++++---
 arch/arm/mach-s3c/gpio-samsung.c         | 2 +-
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 3 ---
 3 files changed, 7 insertions(+), 7 deletions(-)

