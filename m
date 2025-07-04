Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ADDC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1vOdhhKTssMqYb+9TXbU/Ao2WvskkronR7j77XIUqVQ=; b=G0YzCcL43r/pQuabs7nUmYrL5T
	ZpJj92p6OhWh9GTGqMWB48B1qmEyK0dZoSLd1hIpwlMSBk9jqfKETgG5pNU5xnLhHmdmfHOxMrH3q
	mWx1mzmz74SsDy0rvwH0MydWI4SIh/haNSyyLNR07TCUfnSCnGk8gcFbFysskl/82cQWjY/Cp5aCe
	oWN71jjX03ptqoI/xFal4m2PRlFJJgOPKNkkVRzgdiUelmH3MZqMtruQPpbvU3dmAF4QdHULHifYb
	ClNz+lyLonTujiI369OFo5xo3B0tvH+pxoHiKTlFdHr8jzzW5XvjLhh0ZXC1NshCu5Rwvr3RriJaX
	KIzrIFow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXlD3-0000000FErY-2n46;
	Fri, 04 Jul 2025 18:32:29 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkv8-0000000FBOz-0G8O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 18:13:59 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 583D31D0011E;
	Fri,  4 Jul 2025 14:13:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 04 Jul 2025 14:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751652836; x=1751739236; bh=1v
	OdhhKTssMqYb+9TXbU/Ao2WvskkronR7j77XIUqVQ=; b=SN3Kefkvk1WfRS2fcq
	LPbOvAjYZWFV7lBIEuWybWjfJtAXnI29jW3U02FLd5SoYUvTWE0aK6++Uc534IqS
	83NfN/YbkA8Qq4bH86jPJL8hMUALCz5aWJyl9bWXq8SSY6a4SmpF13L4qA7IXtyo
	6v2glerpi7IHNUUpGZ9tczfu8i997Ad4xNk8jERo+LEPVowRaisWiguhI5wpx7+q
	XXqherd722nIeBPqtRjzWQF0XiqPVHTgBysxZ2ikI/9iSdjp2nsBXnDK/Y5Qz7cz
	Ty/pWwambaxBjCt3J3YNOq6gva8aX0V3NfXHbkZWKlKV1UbdIQbhtU0HNo9DCW2U
	wU5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751652836; x=1751739236; bh=1vOdhhKTssMqYb+9TXbU/Ao2Wvsk
	kronR7j77XIUqVQ=; b=PVMRW+K+hf0EQQBSs8Xkhyq/8L8jbYfS8ZiCI9AiyjVH
	hmxvfHt6Qs5GlOBRvwnHQWVuqFCVHzbWX51caPImV78ZO/ndijlWoVcGm3nIsHsn
	PDQ4psb5Dd0txIr5jF4y28ov7rcIsbFiJ4V2PgCGskDCEvimhxnvAph/X7Eod+62
	42Hy6/e8MW7Obdr7zMWCRJUZuNRsTGvpZdWLsxAyFZXZhz9rFOW8CGBnbS1qvGCU
	wweTmKtm8ozzAD4fpR2aVbTbN0IMY9dxEkSvQ4OJv1CEa5SnT6S8X3tjDOYG9sPh
	hE1JKY5nXIGMtoqjN3S8D4ZxhHxW8kLYcw+oc0jntA==
X-ME-Sender: <xms:4xloaNStHarFI8YGcJ8KdGmsA8TQowNjo5cPvXmpNpwiTSlFD7v-jQ>
    <xme:4xloaGyXNXhCvQ_LSszag2QSLVe01y1qVx2WwIv6HvUUoUIHJqytzdleM-XMoUs5d
    moVLY0wOTZlFy-yGiY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeekhecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:4xloaC3ZzIt5-GKYKHMJRttiab8B5ITsQIMZcRl2xOOtKBG9w3WRig>
    <xmx:4xloaFBSthHMWoB3X8zyug4qrOTW1rNraYlteZGaIKNmg0d4cvsh0A>
    <xmx:4xloaGiwmNagUydV9_evHPKDQ1Rb7xG-gIf2PsgHLQTXIhauMYXxuw>
    <xmx:4xloaJooR95pO3QyD4f_23w8ZdeX925Ps_Iz13osyUazueHiKCaaBg>
    <xmx:5BloaCqXORqigdBE-Ub9aZGYfl3SeSD3Q6l08nywVRRRib-kkVTUvRj8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DF28F700065; Fri,  4 Jul 2025 14:13:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 20:13:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <01889b2c-3a49-4510-9e25-b4becc0e4a2e@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_111358_385491_188CD722 
X-CRM114-Status: UNSURE (   8.51  )
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

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.16

for you to fetch changes up to 3f3fb97374308993dbe8884f44c2579a81b90bfa:

  Merge tag 'apple-soc-fixes-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux into arm/fixes (2025-07-03 16:27:31 +0200)

----------------------------------------------------------------
soc: fixes for 6.16

A couple of fixes for firmware drivers have come up, addressing kernel
side bugs in op-tee and ff-a code, as well as compatibility issues
with exynos-acpm and ff-a protocols.

The only devicetree fixes are for the Apple platform, addressing issues
with conformance to the bindings for the wlan, spi and mipi nodes

----------------------------------------------------------------
Arnd Bergmann (4):
      Merge tag 'ffa-fixes-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'samsung-fixes-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/fixes
      Merge tag 'optee-fix-for-v6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'apple-soc-fixes-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux into arm/fixes

Casey Connolly (1):
      arm64: defconfig: update renamed PHY_SNPS_EUSB2

Janne Grunau (1):
      arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename

Jens Wiklander (1):
      optee: ffa: fix sleep in atomic context

Sudeep Holla (3):
      firmware: arm_ffa: Fix memory leak by freeing notifier callback node
      firmware: arm_ffa: Move memory allocation outside the mutex locking
      firmware: arm_ffa: Replace mutex with rwlock to avoid sleep in atomic context

Sven Peter (2):
      arm64: dts: apple: Drop {address,size}-cells from SPI NOR
      arm64: dts: apple: Move touchbar mipi {address,size}-cells from dtsi to dts

Tudor Ambarus (1):
      firmware: exynos-acpm: fix timeouts on xfers handling

Viresh Kumar (1):
      firmware: arm_ffa: Fix the missing entry in struct ffa_indirect_msg_hdr

 arch/arm64/boot/dts/apple/spi1-nvram.dtsi |  2 -
 arch/arm64/boot/dts/apple/t8103-j293.dts  |  2 +
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi |  2 +-
 arch/arm64/boot/dts/apple/t8103.dtsi      |  2 -
 arch/arm64/boot/dts/apple/t8112-j493.dts  |  2 +
 arch/arm64/boot/dts/apple/t8112.dtsi      |  2 -
 arch/arm64/configs/defconfig              |  2 +-
 drivers/firmware/arm_ffa/driver.c         | 71 ++++++++++++++++---------------
 drivers/firmware/samsung/exynos-acpm.c    | 25 ++++-------
 drivers/tee/optee/ffa_abi.c               | 41 ++++++++++++++----
 drivers/tee/optee/optee_private.h         |  2 +
 include/linux/arm_ffa.h                   |  1 +
 12 files changed, 86 insertions(+), 68 deletions(-)

