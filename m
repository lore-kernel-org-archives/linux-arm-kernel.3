Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA760C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oG2Aeo3c/OWoq8RPRO4RI+cTpPcODlviTOgMp/5mgkc=; b=e19OcS8kwvIfYOfGnK2kAVDn12
	rqrye8vkWdzpsgkESTQzVx/PVxhO2TlEtgl8HN9P/2z2qK1GZ+Sf54dZHNvtpGEoNoskYfL1HzRS2
	P2xMZp9I4X/C/HfPEIYWZ3NdS+9lBkpME59IlatoaVk4WRpeMN3U2VE+0lavjwCz8UPZ2/Eim9mTp
	o5efGA4WJoTQtiaTU8fU7N1FnFCILMOX0z8mQYztxW/sbJdEpWMB0u7ijsgwLe3v49+Ut4ztkJGdk
	tNLkHbmmoK+w6inFC0HODM2lC9eAdRrAfoEjlhdTqerzOD+W5mqBRAq16F68H7d5qtgEJjm4KrbYy
	5/MOVPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwtu-00000003q32-1YFy;
	Fri, 16 May 2025 15:23:06 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFw54-00000003ffY-2HLd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 14:30:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8180743A2A;
	Fri, 16 May 2025 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747405830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oG2Aeo3c/OWoq8RPRO4RI+cTpPcODlviTOgMp/5mgkc=;
	b=f03CaVX2Z7nQPOVdGZse2tIBjf6lW2DSl52r8br1aYmPIHdFH43WeL9gB4mEX+2tuQhO3k
	Gj4VTsFA7Uyh/4fG0dE4cj9JWaC/6MZWObI9EBEnF+G9cIf9vAwTsqjwbXGoULhenuqEEc
	j6WA9O6bno0ZXB7PaUR+4VUmAIlkgZpyXY7egH7jUkfkcwdnZSYCJ9VxCCX2zBs4i3bx2K
	/LkSxhKlPkElEI+2pXDwmBmQwkaJdbtO57GEg77kRlV62Il74P96HQZZFF9QKD5BuCsUC8
	2ghkiTHVAeesplGVLF4wtCQwM250L4rXDfOGeRU9dZX0qJD8lq3OEa+cZAmM6g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v6.15 (#1)
Date: Fri, 16 May 2025 16:30:29 +0200
Message-ID: <87wmagpr0a.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteevffejteelkefhveetueeileethfekiefgvdetveevvdelgfdufedtgfeigeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegrfeehmeelleehtdemvggttdefmeeiudehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrgefheemleelhedtmegvtgdtfeemieduheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehsvggsrghsthhirghnrdhhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_073034_870927_5771116C 
X-CRM114-Status: UNSURE (   6.42  )
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

Here is the first pull request for fixes for mvebu for v6.15.

Gregory

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-fixes-6.15-1

for you to fetch changes up to b04f0d89e880bc2cca6a5c73cf287082c91878da:

  arm64: dts: marvell: uDPU: define pinctrl state for alarm LEDs (2025-05-1=
4 13:01:47 +0200)

----------------------------------------------------------------
mvebu fixes for 6.15 (part 1)

Fix uDPU board LEDs by correcting pinctrl state

----------------------------------------------------------------
Gabor Juhos (1):
      arm64: dts: marvell: uDPU: define pinctrl state for alarm LEDs

 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

