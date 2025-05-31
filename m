Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AF4C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvcVlRsTp9UBvTgpnxSSZSMuazuqeYvLY20AHwA431Y=; b=iFWA08aObt4o6pE9OCdLPZOuZP
	DeVpFlkgFiGVjEKLUGYDqSLR67g6SSVzcKu5lxq37gAvkI/VlJffCaP7huV9MJIBWOTYrbKQU4e/L
	QZe9ccORv7ACUHR2eoj08OtgWtI4w0HCe4WfMRWa1LRovyaVIP8G30DQAWuWIMDPcMexOEnwyoTKO
	wGeGtrS5eBKaAkJuY1sRiRmQgNMlrmxTOzTHYk/Nzaj2bYVAFairFW50PuT85eNFohi7zsoQ91z4o
	TC5kLpvhMtwvoZ9T4tJUsUdM+TvaMXH6YeR5Mact4Iq7HCAYuqKonAU+DyjLslCPWWuHh74IER2PC
	Ph9kst0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLIFA-00000003ZGL-3Act;
	Sat, 31 May 2025 09:11:08 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLICK-00000003Yyw-2snE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 09:08:14 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0F7D11140138;
	Sat, 31 May 2025 05:08:12 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 05:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748682492;
	 x=1748768892; bh=wvcVlRsTp9UBvTgpnxSSZSMuazuqeYvLY20AHwA431Y=; b=
	FkiD4rR+Day+l+ahdkODGcXBtozfJGRiKS2vcnCY74JfeuhfdzJ14ODGOz+blDfK
	Sw4Nk4pEqOtvTNDqaac27pPw5PdfpdjwVLgG+LKKOUcoWzTOSnwj8ZHgCJRaPyAL
	gjU2n7kasv+kXWMHv3UYEhEY8Bq7VaE8DjZdKxo+aKkBGpkVDnVrWSlL8YnWt1m7
	sEe3qjDNxsxRiBKomZ2Cd4H8H2ssU0H0ryM1h5CVJQ3O8gN4CdHVXYm1+R1N3HjN
	De/+rP/oaDqeWfursMaM9ICja+Db5mawF7OxNcBklJj9AMxASR3eo3OOhkLxF+mh
	sCe+4RN2MmCtVEiWP8kIXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748682492; x=
	1748768892; bh=wvcVlRsTp9UBvTgpnxSSZSMuazuqeYvLY20AHwA431Y=; b=W
	Q9vZ5Z91lOY0ccUMnYK54tyQoRK6/0zMXS2IjIyd7UMq/qJAEfgUU5DfexGtViQk
	C1FT9hk42j8vcHZOKjvOHiOZOfrpeS58zP/20YHiwnso/M2XEcwZsZw0EJj4dUhh
	q6WU2AJtm0ftEmAGXpSv5JsFiSaWbo+Gby2IGfjKGjixMsmxmIX9sZOj0pi07HOs
	gmpotYuGENKkcMSMIYopNyg5z5K2kJ+ja6HNyfrpzN/BxFzptsLE+BLMA2mUeGYo
	LVcP120R3UlD5peZVLRgTeXkirTd8TQhX85d30T+VtvLh5JRa92I+jG33yaMF/n3
	oWrng7/OnBSbV3lhfJiXw==
X-ME-Sender: <xms:-8Y6aABswAzZWF8zh0LSyneYqhkjfJ9J8_J09_K4x76rPD3mec5n2A>
    <xme:-8Y6aCgY7CYwZkGsf4iTVa5dLFsEF2H0yp9GLwBNxcu7bXqCOglAbJjaHCW-SLzLW
    7B9405LXxwPcIZyfOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudehtdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeefffelleduheeh
    leejtdfhheegtdffhedtffeileehkeetffevtdegheduhfeiudenucffohhmrghinhepkh
    gvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprh
    gtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgu
    sheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-8Y6aDmRepwYIrUZHgQn5ULBv4Zh7oOOoK9Qr-dNYqlKzazM_9bFUg>
    <xmx:-8Y6aGx3GFIAYgUJBwVrfw5ilD9emcopHoabArEPVFHHN7rqNI-HuQ>
    <xmx:-8Y6aFSlietPKYPKJmY5ABxCljSgDx1SsqV5TXMGR4BfdpE7iPrXdg>
    <xmx:-8Y6aBZ5e7aTl7SqP5_HyDFT-bdREkxDKjZVck2_PlGFJWqfrCAxmw>
    <xmx:_MY6aAkHL2Y8m_0qQb8nNoNNiekU9mobYsZa0807IIgRSt4U9ilBllsR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AA599700061; Sat, 31 May 2025 05:08:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T97262eb0f1793ba4
Date: Sat, 31 May 2025 11:07:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <d98adabb-a26a-4962-af9d-5707e1cb3715@app.fastmail.com>
In-Reply-To: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
Subject: [GIT PULL 5/5] soc: sophgo devicetree updates for 6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_020812_802596_D60712C2 
X-CRM114-Status: UNSURE (   9.33  )
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

The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.16

for you to fetch changes up to 9bba618694cc905b898661c18e3e40955573ef5e:

  Merge tag 'riscv-sophgo-dt-for-v6.16' of https://github.com/sophgo/linux into soc/late (2025-05-23 23:59:45 +0200)

----------------------------------------------------------------
soc: sophgo devicetree updates for 6.16

The Sophgo SG2044 SoC is their second generation server chip
with 64 cores, following the SG2042.

In addition, there are minor updates for the cv180x SoCs.

----------------------------------------------------------------
Arnd Bergmann (1):
      Merge tag 'riscv-sophgo-dt-for-v6.16' of https://github.com/sophgo/linux into soc/late

Inochi Amaoto (10):
      riscv: dts: sophgo: sg2042: add pinctrl support
      riscv: dts: sophgo: Move all soc specific device into soc dtsi file
      riscv: dts: sophgo: Move riscv cpu definition to a separate file
      riscv: dts: sophgo: rename header file cv18xx.dtsi to cv180x.dtsi
      riscv: dts: sopgho: use SOC_PERIPHERAL_IRQ to calculate interrupt number
      dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
      dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
      dt-bindings: riscv: sophgo: Add SG2044 compatible string
      riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10
      riscv: dts: sophgo: switch precise compatible for existed clock device for CV18XX

Zixian Zeng (1):
      riscv: sophgo: dts: Add spi controller for SG2042

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |    1 +
 .../thead,c900-aclint-mswi.yaml                    |    1 +
 .../devicetree/bindings/riscv/sophgo.yaml          |    4 +
 arch/riscv/boot/dts/sophgo/Makefile                |    1 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi            |   39 +-
 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi        |   36 +
 .../boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi}   |   95 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi            |   39 +-
 arch/riscv/boot/dts/sophgo/cv181x.dtsi             |    2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi             |   39 +-
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |   72 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             |   32 +
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 3002 ++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044-reset.h          |  128 +
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      |   32 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi             |   86 +
 16 files changed, 3502 insertions(+), 107 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
 rename arch/riscv/boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi} (75%)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi

