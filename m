Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8598FCD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VJWqjLWdqxiOOONLY1vYfV81aAYcYQpnBLK55L9RBKk=; b=GfCV04EcXHlFEdV835Oi9k4wfA
	DYUog9jya71QROfkeO6DmyHc/Rksz/EvRfeuVt06GsAMfXS2IzzeWGL3x4zFz7CPGSWLpLkORNsWB
	6xzGbzo7t5BKmlzdag0mHx83EebRjBdPLyo+kiJ5vSogzWVbD9E+o9K0nX2qPWzh+tBR3D+FGDWkC
	KvQtMO8X1QXNIBmz71h5Gh+ByFS6BwVzlbntJ9rN8hkChrjMrTdX03CX3WPQGUf03wr8GwO+KU+IP
	JCNQVXxwa/EcrDg423m9bIKWjrnA4qVPBM7iIClSyMmId93pma2gXeiafEtRWlutJbPIXi4TZQPWP
	JFOJCl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwFC-0000000AT1x-2nC9;
	Fri, 12 Jun 2026 07:23:58 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwF9-0000000AT1R-3asj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 07:23:57 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id F0C6EEC00CA;
	Fri, 12 Jun 2026 03:23:53 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 12 Jun 2026 03:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1781249033; x=1781335433; bh=VJ
	WqjLWdqxiOOONLY1vYfV81aAYcYQpnBLK55L9RBKk=; b=hsblgYSdEsC5CntnS/
	NXEZLp3a1V1vJhlbeAeWy4bdJ48VJw5GV5Kp0pUsMw4tG+8FGrpADx6AWwVCzQs4
	PKR0UEf5w/DwHZkRBDcMORbMt/7BjL8TL77cQZjgEi7RXXjmx9COfPB2oNQtkrj0
	g7SZKwq2tpzADtAbdS2abBjJb1jZQxfftC2UF7E4XDmLI2e/bcZf5zcRteVt+O8S
	1VDX7A7In2rX8KtsAdPadI7Hpu1KHoSktvIQ/hJwZvwqM/Zf2sFVf4kvVtEuSzJc
	cs/YZjGCv9MdAM7B1nD9NBntJRXj2xGocGCn5DGTAOKLdHCTItjk6q9e7RlkeyaH
	NXgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781249033; x=1781335433; bh=VJWqjLWdqxiOOONLY1vYfV81aAYc
	YQpnBLK55L9RBKk=; b=eKcMAIyROJVuCJ6p0h2qDEuvcUWTOmZeUPXsaMgEhGnF
	BVAs2HyQ9LcfMiCZSJ/8aCvMTJJDLDYATDfYRRu0x9I/GHi8WZk53YhRcHYb96Cr
	7bg0IbAKxNq1lCmiq6+/EgjjJiln5X5gYZnMH/r21vTg2YNm5Bl2czQbT2Uup5MY
	xrd35O7ZL/c8G87p17JjmKpiH3pZlLmNUZ4GiEio2jYdhwKc28LdgAJtyA6yPMGQ
	chfx3KY1FK24PK7cAd+uWjMdpPWQyxWEtNB7ppqGC/34e4hJ6JyHfjkxLmZKksFk
	U+9BzlCw4VRzS46QC/DrlzcOfGBDKbL5guPObic3hQ==
X-ME-Sender: <xms:CbQrahckZ0DXUECCFwJxqlFLXjjPgZGVfc2KoxxJTK_QPL3-7OpLPg>
    <xme:CbQraqDbGSlKpWC1lbW7Y-niPkvpZ9TqyxoeO61sG-9twS1zZEoa10L0hIaw6q3AV
    kuhjDChPcXkdkfXOtMCOxIgpB_tNB6PBAXDwOZLZy_Uq1ecFAZuK4ib>
X-ME-Proxy-Cause: dmFkZTFCU8dyaOy0zPeQGTvbpEbEEj+fc1idaXb0IffyRnewPAWGTHIcvNY0sgnO47EBFn
    BrbzSozhTykbwTc/DamWcLo9lQsFdWgn1+2gv6iY6IHpDqOhNshVCTRyWhBuhX8Lmjkois
    BXSu+MRZIFvBr86oY6weB194BWISCtyyPWmGeXsFhzo1pr+x2Xu25sCh1YRMNl1r66pWy7
    sMAsiIO2OMgiAt4q+lZ0bGNdY/XaNSNqKGhmLdczDXzKQQw6zqtCrbBbg9vN/m2ICgGLlU
    fFu1oJbvEeUOArewe0xb17KqMyFCE0PaOyf4xOIwLmuwaHjAYa5c5ZjK6+sj2GF+ixJwn/
    qWRMwR9LC2+OSPHUzraVb4Jrnd7fsFpT+VMW2p+wSpWo8hufaXAVQypTmSCfpfmPgxi2xR
    03cQQP7uZLIYO0rY1HtWptEY95g0tupOLZxpqe2DUh5HrpH3G9w8RzXEEcLMY3XobiCqzS
    YZtkzlKse6CT4+gKPRfwoF1lchheORQI1XuV+ff2w0HQGgAj6huulXQyUDjwcyH1GqGBbu
    bacd3rg86ayP6krOjjkHfdDeZnGxIpf1eDvyvV+PHsBDvyKPLXdVcdFHSwnkHADyrEk2Cg
    rL7XVTpmvUbSugxmLXg7/doamAl+WzS1JJkYARrhmpK3Mf3iBOPdAgvmVCyw
X-ME-Proxy: <xmx:CbQrajIWXhGXE5BQmqGZEQ6Ysjo_OHi6Zw6JpbQJPFkRwLxsYLjZ8w>
    <xmx:CbQrauBFRdpmbESH-AZw6CPMubPTH2rmkYViZAGJNj6QJaSFvGOUdg>
    <xmx:CbQrakCT2Hl9_jZWXOEQ7d22kfq6PYeCznt1JX_cgxMUY-DSUk-ghw>
    <xmx:CbQraoBcIzry-YaCGuapBEMNiavonnhgTcTFtfDRsZMTPScUY4m09g>
    <xmx:CbQramTkhpTVUqWqPl6YCvwfnB6dpLVszg2xG1jh8tOiK7uZBAPLwzJm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 44B22182007E; Fri, 12 Jun 2026 03:23:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A92O7juWEyRc
Date: Fri, 12 Jun 2026 09:23:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 7.3, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_002356_325721_2C4FE53F 
X-CRM114-Status: UNSURE (   6.75  )
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

The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:

  Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-3

for you to fetch changes up to 9c648f3554920721d8878807cd794fe2d7f989e8:

  Merge tag 'v7.1-rockchip-arm32fixe' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes (2026-06-09 09:16:26 +0200)

----------------------------------------------------------------
soc: fixes for 7.3, part 3

Two more small fixes came in, both addressing corner cases in platform
specific code: the microchip mpfs system controller probe and the CPU
power management on 32-bit rockchips SoCs.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'riscv-soc-fixes-for-v7.1-rc7' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
      Merge tag 'v7.1-rockchip-arm32fixe' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes

Felix Gu (1):
      soc: microchip: mpfs-sys-controller: fix resource leak on probe error

Heiko Stuebner (1):
      ARM: rockchip: keep reset control around

 arch/arm/mach-rockchip/platsmp.c            | 16 ++++++++++------
 drivers/soc/microchip/mpfs-sys-controller.c |  6 ++++--
 2 files changed, 14 insertions(+), 8 deletions(-)

