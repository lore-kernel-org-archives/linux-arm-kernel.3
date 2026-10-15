Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CAFCCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pI3zZ29AOcHjmwZ74HnOrjeoVGmUraKW/9PCwaGZyP0=; b=3dXBf3X8iKrruI1YY3BwOFdipO
	tOJCoTfbjGYKizVYS8ypHOkD1OhXQ+L3U6iASA52svsjMHAANmQ822i+HSwpDo4U/X4sHeNp3kjg5
	4jViRg9wNMLS511tZNC+dUgnAhWNTQU6LKLBw2WC7HubOpjnYP1WnHzMdQA3HftMWIFl0URAmfm07
	VJC3yiDBvRUtDzEf0DrnoYwe+HdvjOQumaqRPlB5WAz4mbrMQ+nA659bssaTgADmE4gHHp4Wxn1uI
	16ezRDEt3joAv9x3IyykpbZY8IBEOBzsoE2VVY9pUw+BWzUyWLmSjphFtosSiZ627PepoJRu9m87t
	nSvPLmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSBd-00000001Lv1-2BJl;
	Thu, 15 Oct 2026 20:36:25 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSBb-00000001Ltx-0ESb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:36:25 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id C43EDEC00CC
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 16:36:17 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 15 Oct 2026 16:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1792096576; x=1792182976; bh=pI
	3zZ29AOcHjmwZ74HnOrjeoVGmUraKW/9PCwaGZyP0=; b=YTMJF5803X6pMtqrHw
	AFEsYO/M2SkmFajECfd5MK/t5xzx/xk9wipcpD7n5uiTvk8K9Bq+q7J5dMnhnt3Z
	BnfPj+H7JYuKIDjD6x7WYBcfmyU88DBqJdWk7ITw9kA1+4xPfmxsThOMjLamjYis
	4FrZsi8gd9/AeBruZ5+5i6iyD2V9UHIoGZikEmS74fgWUoIDezmq2jQv+ifHD7Ri
	6tCHp+ErGyOu0qxIFta5MeHfhNUoJUpixoIEiMq2iJ79BvVO7focxg63ElPj5c7l
	lcHoSH+sIBQ9o35R914b/AUgG15vXlnRTRc9wNRmjvVazHI0dKnIKdCoXBlZFA9Q
	qEPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792096576; x=1792182976; bh=pI3zZ29AOcHjmwZ74HnOrjeoVGmU
	raKW/9PCwaGZyP0=; b=CxsyJFsvV1DRR/o21JtKYclBcnRnMr5DfJEEmw1GWZow
	t8+MjEAfI3WYlLJf3R1kn8c0Hrz5LQmOwswpqypc64GydHpGY2KbXWwRAyKbxgJI
	P3pP7anBFoMhHa78U6bB8qhJfaJ9eYlaG5/Hhb3nxNuBO8xUkaMcgZy+P2VB/j5N
	uHBXNPf+g1dJV2LQJ/Su18eA12EPUaJOnnAg15xsWgbHeJ7LJPJODHbYEl0V1EN2
	cGVITG5TRfuN6NO9oNVs/kWUl1UV/AWqXhFYMXRNg09tvo6v4bu1ykEfHrpkRkv6
	1pzK+4WvXlofAvACHFbOoPXcRdjtp6iUNxehggnzGA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792096576; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:k1jE7EIO6j0MZ5I6gC6MjfaXMQgiSV7AlTISfc8ooWQy4pU
	a+Db0ONcrue3aewaFfVr8FgKPlHEcudevgooP3JNcOMf8oVwoGmVSksSh9kt3oxr
	N6FABKf6yp+sKVzsADJ7/3kIhoOU5pMulRpiwVTo3T2nbCd79ACUAmdAdJSEgfBF
	ed+9CQBmb+Y4NcroSONlSJEKnwXs0Zv41I22rItw/FI/n3Cc2puvY6P7wT3ZrY/m
	AFheTJsKIJU4E9oHlPzg/i13DJDppwj8y9SevyR+DNGambuOvmFeOnt7FTrXqmza
	CZJaho12nHSRXjeMRqwmxDEujRTZHpNgx99AzoQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:fQPqkfCpephV9SKBRb5ukJh7pWrDjJwPJ9ycN0dM7yg=:qnwLbPGVsMK6OAjr6047Fe3etPwsuFGTr5s1R53oGhY=;
X-ME-Sender: <xms:PDnRauws3QurykY31iIHFupbBHjHGXwlZcVQoMEHXOowDv_E6cA54Q>
    <xme:PDnRalH8prAb2Cofn6dT1I6x8pI6hT6sKnHSpSjmFDlp8UNp4IrpvNZwI896DlWjc
    0Llc86u4AQ_4FjbcA54fUhWrBPUD0T8PxbyPPWlo4esKGhHtz2mLUM>
X-ME-Proxy-Cause: dmFkZTFx0GH7V3XZb7Wc8HDaC57T6GbevYcYxPWXz4GjZ/5D3TvnwOhgZe4MIOwk+NClY2
    X2+h95Due4metXrYoPYdsiQd8bl9CW/jRUNwTLeHRsEq3om57sow8rXJFIIoH9UYXJzAF/
    3BDBcIDOi5FXNolyog3G+n2UTiWCIKwKSKfFHmtZgFdtZGwY1q/Yb6FmA/Iy5Fgw7FDeb/
    lEr8ySqcFKyfgi13ytdaPQUtUn8IS8Cva3zbi0inorPksCtiiiFw6N+E+QbW5Jmn7I6YSy
    tn+q+vXwiK2aOW8GviZ3XO0xSWkkwNIXcZGAgu5l0C/Lmo5wQmK6R9FYxM/4WX5lpbdYWZ
    nGuI7D8c3LK7hJJU6Xjt6e19w39oy8YCizklVBi+SgEaxJt+bXipXhyrLIQQmLWAu2QNKz
    Q/2hVihZZPRYWG7jg+ocDEXwajUAQAIOc/RDV2EsaxGPj1cN1eDEQx5G5LAMYyiBgz3T7y
    4VyIHQIYPQukGuNYX5oWtsAG6F7PouNDq5W66RJs2xtP/cxkIIuPDKq3PklTBiYDHEHRk4
    inNN5sRTETxKie8UestpgkzttKcPWS2y8LLBb/WLk1glkjA9HZSRbR4KY+nz5EN91wSuzo
    +NnlOJXwzYjmzu0IASDjaJScf68i8pa+ep8Xghty76+9+fwDw4YRPWfXcTHw
X-ME-Proxy: <xmx:PTnRaqYYPdpaVvSOpFIYJ7l7IFZ1G_5TTZ96nIxf3yUhyZs4zoZgcA>
    <xmx:PTnRao3wxstVxKNDjTxbhFLm4be3P0YjhQH6Q8eP00v5HSx_JTxoJg>
    <xmx:PTnRaoctug8tdOJbVQYcNrLs9FCL4jCoIPXDkvtMnpN177jQp3Z1Gg>
    <xmx:PTnRahGTzRz5a0-GbHYspr3_WSTcAMcigOZVgynzEXmPPsx4igsiPw>
    <xmx:QDnRavcLBnUJd-mXN5CV5C0SHQ8uYWN2oDRUu-Q4SXt5PPrDoIqQzG4N>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id CEE2632A008F; Thu, 15 Oct 2026 16:36:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 22:33:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <66aaa5ec-c39e-4652-8607-4e2ab6541a64@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 7.3, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_133623_399794_43FF614C 
X-CRM114-Status: GOOD (  12.44  )
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

The following changes since commit 1fc2d80928b706147e371602dabd0ba927dfe4a3:

  Merge tag 'tee-fix-for-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes (2026-10-03 23:33:02 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-3

for you to fetch changes up to 59f522f5a0ece96ce051a27d15533667a1d0dee8:

  Merge tag 'at91-fixes-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes (2026-10-12 10:27:57 +0200)

----------------------------------------------------------------
soc: fixes for 7.3, part 3

A small number of last minute bug fixes came up since LPC.
Most of these are for devicetree files:

 - Tegra264 needs fan descriptions to keep the system from
   overheating

 - A cleanup on TI DRA7 caused a regression on PCI support
   and needs a fixup

 - The beaglev-fire board can no longer probe the mcp3564
   sensor after a an inconsistent update in 7.1

 - A few fixes address compile time dtc warnings on tegra

The other three patches are all addressing minor problems
in tegra drivers and the sama5 defconfig.

----------------------------------------------------------------
Arnd Bergmann (5):
      Merge tag 'tegra-for-7.3-soc-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/fixes
      Merge tag 'riscv-dt-fixes-for-v7.3-rc' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
      Merge tag 'omap-for-v7.3/fixes-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into arm/fixes
      Merge tag 'tegra-for-7.3-arm64-dt-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/fixes
      Merge tag 'at91-fixes-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes

Conor Dooley (1):
      riscv: dts: microchip: beaglev-fire: remove double definition of gpio interrupts

David Oberhollenzer (1):
      ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition

Jinhui Guo (1):
      soc/tegra: fuse: Add missing newline to APBMISC error message

Jon Hunter (1):
      soc/tegra: pmc: Fix uninitialised clock rate

Pengpeng Hou (1):
      ARM: configs: sama5: enable current Microchip KSZ DSA symbols

Thierry Reding (4):
      arm64: tegra: Add PWM controllers on Tegra264
      arm64: tegra: Add PWM fan on Jetson AGX Thor DevKit
      arm64: tegra: Reorder reg and reg-names to match bindings
      arm64: tegra: Add PCIe root ports on Tegra264

 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi       |   2 +-
 arch/arm/configs/sama5_defconfig                   |   4 +-
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  13 ++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 180 ++++++++++++++++++---
 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts |  18 ---
 drivers/soc/tegra/fuse/tegra-apbmisc.c             |   2 +-
 drivers/soc/tegra/pmc.c                            |   1 +
 7 files changed, 174 insertions(+), 46 deletions(-)

