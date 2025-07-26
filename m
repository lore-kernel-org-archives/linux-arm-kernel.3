Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E664C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 10:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8MeKRW79IYnH4GmCMwZac8sROuaBWd8QIywAI0eiGP8=; b=DDCG+g/64UnrglBjwFOdy+HdLP
	9qIfrur04DQmcW5Tjw6ZrCXF7U5W3PNCJpRXTan4ezhED24fBZwuHPAzXPCuEjXHbQn/PGWmm44IL
	MM/kWz+Ses7cfd8xKfh0sSTxz++Y/QCg75SDbbxvGiPW/niI9kG9p372zQX6MHNiv+hs9d6xf6IGP
	vozxqpJro+C/vC6EwiFvSq6RQ4aRPFwoUzSyeFLQ4XPDg8bsD7E5APy3FwCfqzSGBV+HDKWjD8CtS
	Am7HOr/ycCrVqp3S0zYbS72fe7xfxKrLALw2HZa96lZ+uLRUBaxCAEA5xPLYJz9dVY93Gr56wLDcc
	1YChcOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcSZ-0000000BNEG-3a9x;
	Sat, 26 Jul 2025 10:48:59 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcHF-0000000BMZK-36GC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 10:37:19 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 15AEC14001E4;
	Sat, 26 Jul 2025 06:37:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 26 Jul 2025 06:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1753526237; x=1753612637; bh=8M
	eKRW79IYnH4GmCMwZac8sROuaBWd8QIywAI0eiGP8=; b=RbVY++RXdJx77DF9rh
	WKMtopbEOcKoL8FuypvlkMHSla0WgzWU6ayHwavRcwdDa+ffLpD21UbmE9MXZLpc
	FjIktSrw6VNsPpP2gcNH6NcoVE7r1y8FRlZmvXcSzNIL+94atLyTQwV2swWwsaqc
	Xxqq734HVYX2HWqIGKgFCbBr9gbyvTtrOrc/HH7icWH15Evkn/u1eAnU0F2E3I0j
	rO1Yu5/qL9RAWNx+CGgSMYkOW63hkivyjx/x4iUt5gLukYptcqhDy+8xendcti66
	bBWgduBereID+MGUz0w+OTIq5gdRZ3MpzhUdCgdIlCMcb7goiAss1mt7cCdyOucC
	GqlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1753526237; x=1753612637; bh=8MeKRW79IYnH4GmCMwZac8sROuaB
	Wd8QIywAI0eiGP8=; b=lG10jkql0H5b1l6254Rop4sICnkc8NFfxb1LDu0zZ/O3
	FOc/UI2sfoLgrZ9yQFKcqligkAMbUuRD/YGMlZTWvB1t5PtbsMpgx0jv2+9eH8b2
	ont6Z2Qv8+hxC36s8UtSoKn2duMMMpBqRihehLBkPc4iDDG0AeSKsafw900nYyEi
	6UA4mn1GUJjRSUr8oQz5ePOiUJkQqjONJtx4JEeAn+gOmk6Do1xlvEQZqkg1Zapz
	XuVcezxYm6cmzZP5rCI30C0zcCzN42v0nmicouCqTr7x6FP350foIT+9FoV4MCgH
	JmJ+humfXRUUYT787rE16nHJjtWRaVb9tggT4aZxiQ==
X-ME-Sender: <xms:3K-EaFdM1zXVqqDzXJOPCh0AG-fFWJpUcE9FVRDNEXwSDc9BsJAfHg>
    <xme:3K-EaDPHa3UqeBl2XRtInF25ijwH4EO0b6V2ZHIg_2TwXVSllpytfo2MeCdyov478
    1fhR-SdJk0mFV0IAW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekiedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    duleeigeekveeugeettdejtddtleeghefhvdfhueehtefhudelffduvdeuleevteenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthht
    ohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughssehlih
    hnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhm
    qdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhope
    hsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3K-EaBde9NHgLkQ2rhd3bfJHSoeis6eHrxjxD6BlN1BXD3hiRCyEeg>
    <xmx:3K-EaKtM20ONWgtDGVzYe4_pjOg0R9voKPogl4ocjoU9q8AwXbRaMg>
    <xmx:3K-EaA9xhmhhWv1PNLnj44eLUu2SMLISk6ZvwZqN2EDJTdJfLdG6Ew>
    <xmx:3K-EaF1au7tPFyorF1yb3uTe37M_bhynb6s_UiCkrcIc0I81t41zrA>
    <xmx:3a-EaO-KZVuyqnSLm9bQMREgIicVfYPlEc1mYgq96eE9XXwbC02B08Vo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C9398700065; Sat, 26 Jul 2025 06:37:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 26 Jul 2025 12:36:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <94f09700-cebd-4270-840f-219ef14bf2ee@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.16, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_033717_857409_40EB38C8 
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

The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

  Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.16-3

for you to fetch changes up to 912b1f2a796ec73530a709b11821cb0c249fb23e:

  arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R5S (2025-07-22 22:33:36 +0200)

----------------------------------------------------------------
soc: fixes for 6.16, part 3

These are two fixes that came in late, one addresses a regression
on a rockchips based board, the other is for ensuring a consistent
dt binding for a device added in 6.16 before the incorrect one
makes it into a release.

----------------------------------------------------------------
Arnd Bergmann (1):
      Merge tag 'sunxi-fixes-for-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/fixes

Chen-Yu Tsai (1):
      arm64: dts: allwinner: a523: Rename emac0 to gmac0

Diederik de Haas (1):
      arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R5S

 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 6 +++---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 4 ++--
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts      | 3 ---
 4 files changed, 7 insertions(+), 10 deletions(-)

