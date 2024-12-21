Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF69E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 22:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iwUK/DVtJwVBiDSKobZgyvCljH9xONjC8VYapDTg/W0=; b=nOP9V3j7DgvXBmcYHnOqOnLyZl
	WpP83HkR4HDyod4NCh+eehCU/nYyF/1rR1O8rHfUqjHEZpHXjhE7J+j2SNSROlY+YVKUTqJ80yhT/
	uo2ZiIUNZwhS6ZV+rWZhV2SYnbksELM/YbMeFub7mcCfbEyQ0v5pVZjrK6LEzbnfXarcAcdk0zB+U
	/cV9axQvh4gQme0nnv33PE/dBpwjATbWb5cxrnMkGsXQHdCht0wUM77GyrqGNvYEKqM71GD5LBB7Q
	HQfbTTmyXBS6LPv1TS7tOUZxNirRrtKbhzEAObFBZVvVPuOPvLv8e++0U20cr6OmWRPKg/3PT9O1x
	0V818P/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP8KK-00000007WQI-31aT;
	Sat, 21 Dec 2024 22:52:04 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP8J6-00000007WLg-1P12
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 22:50:50 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 0FE691380212;
	Sat, 21 Dec 2024 17:50:44 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Sat, 21 Dec 2024 17:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1734821444; x=1734907844; bh=iw
	UK/DVtJwVBiDSKobZgyvCljH9xONjC8VYapDTg/W0=; b=Jp5k7Hn8Sb3IVNaJ9d
	hkCuXXB6xyK1MnDbvcWTtyRPSkgYcZRObl1E/2ngW/WKMtyQ6NAJ/jAxgJnpgFtT
	Us/49zLPNrr8clgTyMG1AD/Qu1XPQmwlgprVMO4ysesD6/EeMmE8dlOk0dsbMIeq
	c4z0ewbt/rdj++0Qm/VQ6kaAOEhnYCBVekzvRGsfKSf41pND5y1/gF6nrdIutTRL
	tSP7ByKY0s5x9rhuVtvbKETFVQ04Os0lMsrxyn0btXy/iiLRdfp2jAMMl/JrDQFB
	3T2NtlvJxQkiD2zMrS5e7UrJI74IrPeyOvam5YgmtrTttlaicMbg61NmgWpCS1Vc
	Slog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1734821444; x=1734907844; bh=iwUK/DVtJwVBiDSKobZgyvCljH9x
	ONjC8VYapDTg/W0=; b=MF+LkH6sOn1PZwdyR0AsfwjzBgykXKI9R6nwhiHcamgn
	t4bQZ5xtH24PLBElF6ReiyFE0e2SEqBEL+VmLigwSy5qAOC5QuhGLngUHk4H+uFR
	bG7/QgLms6B0iJMYUUpp5/wL4ufQlbvDynRC2rjmDe0CRaR2RUl6HuuvG6HTD1qd
	wZedo/U04+1sgRXjAlux6CojQ8E5LunWmxpqfHrra+ngJDK41tmIvbPAq68v8P2s
	urY9cKyvCxBFEyW1KDKR1SmqcTFoVaaKfSD5bmYgvYdtTATdZjU/wwaxJrSUCC9x
	edRuIIm5yGiVTLuAxvl1MAoOiDMRIHp0/QvJQ5XlSQ==
X-ME-Sender: <xms:Q0ZnZ63kY1LczpClWN9saq_C6QoSqrMe3q3BgZk6N4vWm0VOR272jw>
    <xme:Q0ZnZ9HnbfFwCcHNSnn6lXs1oo_KAS3lWsEL11cxnXQCcYwZtMaIrle5aXVrneOFi
    jVmzHFOxaB2jVpVDNU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtiedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtjeertdertddtnecu
    hfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvg
    eqnecuggftrfgrthhtvghrnhepudfgfeeuheelheehfeeigeeigeeiveevheelteelleei
    jeeikeekvddthfejieffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurght
    ihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhish
    htshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhl
    ihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Q0ZnZy7SHXSKZ-i5OgW7YLpTZtbOY6iiMeI3z6vH_B1jywywV8Wy2w>
    <xmx:Q0ZnZ7090ybxWLdrMZk2BmM7Y3lnNBs1RDZc-mKlPuZebttMVxw2ng>
    <xmx:Q0ZnZ9Hb6F2qjypJY0dNHdxZqJsXNY1v6SmqNP_oBPJV9LyNg6j0Rg>
    <xmx:Q0ZnZ0_6NZWWeMiqkTIY7Fqq2ST60I_d8JSI8xeqcQHL_7SaHhtGag>
    <xmx:REZnZ9C6f-YNiO8w8fpztwNBfxmThVruNCsh39zBXJdOzm-9ajA-6jEv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 96D132220072; Sat, 21 Dec 2024 17:50:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 21 Dec 2024 23:50:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <a54c5c66-5255-4177-a616-a4f39a83d2af@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.13, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_145048_896236_10479DF0 
X-CRM114-Status: UNSURE (   7.12  )
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

The following changes since commit f578281000c50cae991c40e1f68b2fc0b1b9e60e:

  Merge tag 'ffa-fix-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes (2024-12-13 14:26:32 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-2

for you to fetch changes up to a31ffd6ed5ee994e1c04dc794499a0c04618dc55:

  Merge tag 'arm-soc/for-6.13/devicetree-arm64-fixes' of https://github.com/Broadcom/stblinux into arm/fixes (2024-12-20 18:02:27 +0100)

----------------------------------------------------------------
soc: fixes for 6.13, part 2

Two more small fixes, correcting the cacheline size on Raspberry Pi 5
and fixing a logic mistake in the microchip mpfs firmware driver.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'riscv-soc-fixes-for-v6.13-rc4' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
      Merge tag 'arm-soc/for-6.13/devicetree-arm64-fixes' of https://github.com/Broadcom/stblinux into arm/fixes

Valentina Fernandez (1):
      firmware: microchip: fix UL_IAP lock check in mpfs_auto_update_state()

Willow Cunningham (1):
      arm64: dts: broadcom: Fix L2 linesize for Raspberry Pi 5

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 8 ++++----
 drivers/firmware/microchip/mpfs-auto-update.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

