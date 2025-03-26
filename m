Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AE8C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 18:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ro9pG6MxHWJ6pF1usoSl7AujA1zvGiTsvD3tU9PibDk=; b=qudvD0qQfIpDkayx4bY4G27fDT
	N5FjtFR5bXbEpNqUKcbBdXbTddUyZgg4zWeM+1YE/Jd1y3ydOHgKUSx6lS90jM1k757VFZTFlIFGc
	JQaVUt5uKphOok7fNgb5AqOsly8ute0aX7Jxqr4GNGu+LmkcMC1K3hO4ShY9LEDamhDHMb8T7CXzv
	4kRBclrLUnG5o4iFfiJms1YFQY2ZnHRdBr104fDA4A39o0LdXfXdmZR04OOJDjF9yJtn9tpn8Wzlr
	XJTWA9svIUXQKPpAdTz277smSQ++uSPKaW9hGqUvRZakZZFYfSuGfPjJFELbeKlHYMcBVkhkE4dGd
	EHx/KOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVDQ-00000009K2j-02tD;
	Wed, 26 Mar 2025 18:11:00 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txV65-00000009IzP-49hm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 18:03:27 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id B14861382D80;
	Wed, 26 Mar 2025 14:03:24 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 26 Mar 2025 14:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743012204;
	 x=1743098604; bh=Ro9pG6MxHWJ6pF1usoSl7AujA1zvGiTsvD3tU9PibDk=; b=
	bgGVhIOzaMfFPiNcjVyfWRnM43aG5aJ3PhVwoU86KHmStlOHn3+4gDnMKSjdhH6c
	GHSX0UljJ3ai+LgezjbAttC8Uoq1IwPJsAwvzwJxBgLvKwzDzyEEWYX2MVhOPO6h
	c3UqAeVMVcN7B9ez5uW1fn1RtWHnIF3CBxVHevdNWknCZ1GNvIR7wCdDpaakdMH3
	qNpbOXguhKWTzVe6sqbr/6II5q8mhFC97SgaQ+1RK1YGsRhpM1ypCGn5uARX6yGl
	kxthEgiG7judCVbE3AntWSDole/pTMog+x9ykprSCtgIONwP91sM+dWSsxUhhH+t
	i190QqUcrCcWvNa3AcQwhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743012204; x=
	1743098604; bh=Ro9pG6MxHWJ6pF1usoSl7AujA1zvGiTsvD3tU9PibDk=; b=n
	iJnq7D8DF1wlEoqPbwIrp/yjQVkrIrU4K2/HCRlN374quh+D8+HR7nmApmsVsMxc
	dKdCGATpUE0cJuaSy1RTwB9B1GKf43ZzYW1t4mqU0UegmTS7VYezOtabgBtg5bdx
	Zk0j+hMK5Wo2OTeThcvsaPkW5Gwze6O+kjUFYTWsZ0imqM3C1xhgi8NeFHRNf+Av
	uqvzrhnDHU6YowrzcK1+lJfGhrOOqfZgELcshZ5d7yxabkm/Cr6olUoE7pFRbsmP
	2GSzUCpWukJYJFHDjtoJfd8mOY8Bc2RbQhhWSeHor1DS3IfRf2HjgF3snStQ/xoj
	1Reuew3tnqNLL3uPLCOBw==
X-ME-Sender: <xms:bEHkZ4XAaDh02NIDqOfGXYNh1Y8zEINcCm4Ms1oBQqlIy5M4kda_DA>
    <xme:bEHkZ8mSIzpI5aobS-FVP02fh23xPAeqV7BeGxf6opCSeAvwQkxyCrp3vb7k62t64
    Ajj4Tvm_RFg3gEsRA0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeivddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepkedvuefhiedtueeijeevtdeiieejfeelveff
    feelkeeiteejffdvkefgteeuhffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggv
    vhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:bEHkZ8Ztsk1MleNodVQoXi9UOqm-3zVxwrcnqZ-vl-KMBUeY_bbnqA>
    <xmx:bEHkZ3UNBI-ofvtxov-fuFl4xxpXtyHumEh2l2u4iqY2ybohdg0wAA>
    <xmx:bEHkZymd8KKeHzBwhj1w3vz6sLDXRQYE3iez2Nvf4fYC56Q8sLOaPQ>
    <xmx:bEHkZ8dcWH4hmjziICmWSlNeo4WeYMzms1etC6KfO1tc0EkDM8hJ_Q>
    <xmx:bEHkZ0j0bhLUkHkCGiSQfPxvfqPWajQ5xfMFmU4av2QjCNisPKuYJnld>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 644B12220072; Wed, 26 Mar 2025 14:03:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T2e1b8447a49b63d2
Date: Wed, 26 Mar 2025 19:03:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <9a65c188-56a7-4e0a-ad3f-350d67d854b9@app.fastmail.com>
In-Reply-To: <1ef00af5-0196-46c4-95f3-7c6b90f3e293@app.fastmail.com>
References: <1ef00af5-0196-46c4-95f3-7c6b90f3e293@app.fastmail.com>
Subject: [GIT PULL 3/4] soc: defconfig updates for 6.15
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_110326_096766_37F6A948 
X-CRM114-Status: UNSURE (   9.02  )
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

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64=
319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
efconfig-6.15

for you to fetch changes up to 8ce2a15b1e6464a8681fb2f787602fc78f8e2f39:

  arm: defconfig: drop RT_GROUP_SCHED=3Dy from bcm2835/tegra/omap2plus (=
2025-03-21 13:27:08 +0100)

----------------------------------------------------------------
soc: defconfig updates for 6.15

A small set of updates for the arm64 defconfig to enable more
drivers, plus a bit for housekeeping on some of the arm32
defconfigs on particular SoC families.

----------------------------------------------------------------
Arnd Bergmann (4):
      Merge tag 'renesas-arm-defconfig-for-v6.15-tag1' of https://git.ke=
rnel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'v6.15-rockchip-defconfig64-1' of https://git.kernel.org=
/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/defconfig
      Merge tag 'ti-k3-config-for-v6.15' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/ti/linux into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.15' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig

Ayush Singh (1):
      arm64: defconfig: Enable gb_beagleplay

Bjorn Andersson (1):
      arm64: defconfig: Enable USB retimer and redriver

Celeste Liu (1):
      arm: defconfig: drop RT_GROUP_SCHED=3Dy from bcm2835/tegra/omap2pl=
us

Devi Priya (1):
      arm64: defconfig: Build NSS Clock Controller driver for IPQ9574

Dmitry Baryshkov (2):
      arm64: defconfig: Enable Qualcomm QCM2290 GPU clock controller
      arm64: defconfig: enable DRM_DISPLAY_CONNECTOR as a module

Neil Armstrong (1):
      arm64: defconfig: enable Qualcomm IRIS & VIDEOCC_8550 as module

Niklas S=C3=B6derlund (1):
      ARM: shmobile: defconfig: Supplement DTB with ATAG information

Ravi Gunasekaran (1):
      arm64: defconfig: Enable HSR protocol driver

Santhosh Kumar K (1):
      arm64: defconfig: Enable SPI NAND flashes

Sebastian Reichel (1):
      arm64: defconfig: Enable Synopsys HDMI receiver

Shawn Lin (1):
      arm64: defconfig: Enable Rockchip UFS host driver

 arch/arm/configs/bcm2835_defconfig   |  1 -
 arch/arm/configs/omap2plus_defconfig |  1 -
 arch/arm/configs/shmobile_defconfig  |  1 +
 arch/arm/configs/tegra_defconfig     |  1 -
 arch/arm64/configs/defconfig         | 16 ++++++++++++++++
 5 files changed, 17 insertions(+), 3 deletions(-)

