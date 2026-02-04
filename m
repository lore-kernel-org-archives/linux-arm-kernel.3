Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81291E95393
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oBVsKp7U+To9N/uLjz9BWdVSLM9ncuG1DF9uDyqjbjA=; b=nwaplUNHjQtx32FPIAjh/03Oa8
	T7HGB45s3mG7gmk4dPp2qXnN+PM7PhIayxcVHj7s9noBMMlqcr/7C2xcixH8Px4vlnS6k6EbD2Ba6
	pThFAYzEZ4dmxlCw5fPRuilc82iz52MG4tJbNo3X2MAqMKDj1JjVBo/cWPeB4Ev9ZfhFHWaA8BoGR
	l7s+NpcpXIRfSZn0d3gsNruCV4Lg72N3JeR7sS35SDduu0bCDjuUIiYCzA2eRy/c8rKw4B+IDmvOR
	6aGHHpAc2c2SaNZ2oyeNUxF3mY7xgvgybWLsFrAPECYKtuXUT935gtMUQrzPRT5PMgpgItPuH5iGa
	WYaqnCPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbpK-00000008QPT-2RdZ;
	Wed, 04 Feb 2026 12:17:46 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbpI-00000008QOU-0Hrp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:17:45 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 427EA1400089;
	Wed,  4 Feb 2026 07:17:42 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 04 Feb 2026 07:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1770207462; x=1770293862; bh=oB
	VsKp7U+To9N/uLjz9BWdVSLM9ncuG1DF9uDyqjbjA=; b=Zjomvf1efYgmIx6748
	twyeSHyAMG/hka4an+NAE5EjqWC2ebucn+OYRKMVEkFJOs3XOe1+HtbhV64n4dl9
	AKdzZ9zmFDS9YKb8qIzGl7jZHBRz+uT65B0Zb1JBfLSpDPbmgEABFqtiFeWEuU4S
	7b/EKO7FcrEJkqTJJd6PnR3lpZiqYPCYdiCMus5aTKlF9GYmMAi9VHzp+jSg/Ecg
	80nTCgVhis9OVzcFAVyZ8f/9/CKk5mdekvKMWR5ZX2rs0QV4POFgav6JcBeiB8RP
	+fZcBfNpqHLADsoJb0PbaejZ8fmuMnu8eqEhYDq1BWgmAsaZ85D0Bj1QvNf1TNAu
	v2gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770207462; x=1770293862; bh=oBVsKp7U+To9N/uLjz9BWdVSLM9n
	cuG1DF9uDyqjbjA=; b=YcrYDk/mYDc0sUaAPrMWZtQsGC/WXIso7WBc6ICN37Ev
	5yKMEVF1NjEAgzk3JsRQZtNvGk4I7bLdRFLFhv2797XARzXB8JUeWkghMkEvIO4D
	s0s8lnGK/x0s113Rcss9y7+c7ue9lzZOyKFt+zuARKD89BquNE00Y7WoULdwCchd
	U0ULXz0QZAHLnW4ciXWLuZgouobQLK3DnGBv6srna57Dy2NthDT1eoTkVzJqZCAb
	8Ndoq4/CxC8K6sZG7u+JL3Dt5tHms6mnIDvUbJ+V7t1Ie3T/xFHd8B50mZf6UoEd
	nMYu3CTf1ZJR+PjWOOAajTicw3HVwWGihnxKC0+Svg==
X-ME-Sender: <xms:5TiDaawrKWGWxy6UyTxaV1wWyKjj532hx1SEyb1oTqZHKOBcnZY6uw>
    <xme:5TiDaRH04qG1Rvx8DMDZ1DwnIQldMQOQbkJNtWnd-R9qVBTyj7qgVAd044BSJkEr3
    8jgCeLZKKRtT_ogpnhZIgNRPzbixE249nPVfhdQSHos52Jhub9or6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epudelieegkeevueegtedtjedttdelgeehhfdvhfeuheethfduleffuddvueelveetnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehshhgrfihnghhuoheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5TiDaRj3GH1E0G75nRhrVe-Q3Yu3q8fVaTFbgfEdPkolSBKuSiod4A>
    <xmx:5TiDaecfhJSvppvzrPfGnJxk4i3jm_I_yuBQKpTBQCzfMiPli7TOYg>
    <xmx:5TiDaRiPzI_lJ-6vrC4T2d1al2BKBu6uH0xTKrKI8JmjrfS6ClSApw>
    <xmx:5TiDaWxMPiMKNzbQr0qXyu8j5qELepCU32ASBWfTcotJj48JyNWJAA>
    <xmx:5jiDaXnK2kzcuhQ5oLDbvPEQ_O8di4IDSsWsi2vszp_8cYLR5Jue2Ozq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 95ACE700069; Wed,  4 Feb 2026 07:17:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 04 Feb 2026 13:17:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "Shawn Guo" <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Message-Id: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.19, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_041744_580732_F12BF17E 
X-CRM114-Status: UNSURE (   7.83  )
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

The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377:

  Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-3

for you to fetch changes up to c3cb2722e28969650c58d6defb09d57339a2a223:

  Merge tag 'qcom-drivers-fixes-for-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes (2026-01-29 10:02:11 +0100)

----------------------------------------------------------------
soc: fixes for 6.19, part 3

Shawn Guo is moving on from maintaining the NXP i.MX platform and hands
over to Frank Li. Shawn has maintained the platform for 15 years after
initially upstreaming support for i.MX6 and i.MX23/28, and his work has
helped make this the most important industrial embedded Linux platform.
Roughly one out of five devicetree files in mainline kernels are for
the wider i.MX platform.  Many thanks to Shawn for the taking care of
the platform all these years!

There are also two additional updates for the MAINTAINERS file, and
a fix for error handling in the qualcomm smem driver.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'imx-maintainers-6.20' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes
      Merge tag 'qcom-drivers-fixes-for-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes

Christian Marangi (1):
      soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid

Shawn Guo (1):
      MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer

Sudeep Holla (1):
      MAINTAINERS: Change Sudeep Holla's email address

Yushan Wang (1):
      MAINTAINERS: Add myself as maintainer of hisi_soc_hha

 .mailmap                |  3 ++-
 MAINTAINERS             | 41 +++++++++++++++++++++++------------------
 drivers/soc/qcom/smem.c |  5 +++--
 3 files changed, 28 insertions(+), 21 deletions(-)

