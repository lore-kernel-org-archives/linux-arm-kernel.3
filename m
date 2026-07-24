Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5123C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z3x+iDh7p6gFssE1Qz0DrKi/lsusCYlCByFZPjTNvjs=; b=rNZkND0FHxykCFYiyA+bAMMyk/
	M8lR/bkeheK6YO1YHzFd+N2/xDWjuIggadmNt8E7jfgH0XuETfRpRTrwJEdIOAKcy9fzXP8evkZwD
	F2iybSxIwXNME3xQIEbKHD2cIkEpoyY1cUt+GHFmnSznl+TZKkuzS0k7ZvzJEL2PmLHhldhBzh3nm
	4kx/AmOSbgOfp/Fvy+HtDweZgXhx90L904QLOFeAewR7/6epDI1VSsspvxDlc0UVFTOZWCQt1iGix
	FMn3yKaT7y3vuYtt4JP0VK/h3mWejrFWS6nXV1+p2B/HoYYVxsKLDafQE45O0yjEhL3wAhfh2llI2
	b+pdjFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnNNz-0000000HG5C-12pe;
	Fri, 24 Jul 2026 21:24:51 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnNNw-0000000HG4y-33ud
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 21:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1784928285; bh=DZWGC6QIL8eLuoB5lCnVl42W74flK/sDT7akFfjhw84=;
	h=From:To:Cc:Subject:Date:From;
	b=LZ02TrnaJOrOyhlaYxKp+BkV+EPH4jmIWGspfo3rJedVoc2CaDqzCmH/Z1ttL9WMi
	 jPKAapK2fd561QGtWUwXBGlcWkWtWm6PAAXJGo8IhSYiSRwP8mwmpFt7v2HAo5ss+1
	 Ibb06JAoBRiVn3A+AIpVSSdWfskdXMrD5GhNsxIpzFUYza/Ak7rXVVqLc0kdErRdMM
	 /a8AJ3O8bvPTnkF915OuKVRw19P7qhL9h1W9qe0BiK4q57FdDYmpEWoOfB1rW69qww
	 UgDvyIeLfoXX53+eXufLRdfOY9GHRyHOVxPRQWj/aQuqV9iChl4IdWyUDRgvcAasnQ
	 iXleoEcdgwqeA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 753803FAC9F;
	Fri, 24 Jul 2026 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1784928285; bh=DZWGC6QIL8eLuoB5lCnVl42W74flK/sDT7akFfjhw84=;
	h=From:To:Cc:Subject:Date:From;
	b=LZ02TrnaJOrOyhlaYxKp+BkV+EPH4jmIWGspfo3rJedVoc2CaDqzCmH/Z1ttL9WMi
	 jPKAapK2fd561QGtWUwXBGlcWkWtWm6PAAXJGo8IhSYiSRwP8mwmpFt7v2HAo5ss+1
	 Ibb06JAoBRiVn3A+AIpVSSdWfskdXMrD5GhNsxIpzFUYza/Ak7rXVVqLc0kdErRdMM
	 /a8AJ3O8bvPTnkF915OuKVRw19P7qhL9h1W9qe0BiK4q57FdDYmpEWoOfB1rW69qww
	 UgDvyIeLfoXX53+eXufLRdfOY9GHRyHOVxPRQWj/aQuqV9iChl4IdWyUDRgvcAasnQ
	 iXleoEcdgwqeA==
From: Vladimir Zapolskiy <vz@mleia.com>
To: soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] NXP LPC32xx ARM changes for v7.3
Date: Sat, 25 Jul 2026 00:24:26 +0300
Message-ID: <20260724212426.414433-1-vz@mleia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260724_212445_497333_E53D7C22 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_212445_497333_E53D7C22 
X-CRM114-Status: UNSURE (   9.89  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/vzapolskiy/linux-lpc32xx tags/lpc32xx-arm-for-7.3

for you to fetch changes up to d6ef4391897d8957f26397f381e78677c1277260:

  ARM: lpc32xx: remove a few manually populated OF devices (2026-07-24 23:29:08 +0300)

----------------------------------------------------------------
ARM: nxp: lpc32xx: ARM changes for v7.3

NXP LPC32xx ARM changes for v7.3 contain:

- Karl Mehltretter fixes a multiplatform kernel runtime execution by
  limiting LPC32xx SoC specific init functions to be run on this
  platform only,
- a stale method of populating DMA, SLC and MLC NAND controllers is
  removed from platform code, this change was announced to happen by
  the end of this year, all touched by the change controllers are
  properly described in the platform device tree for years, and very
  old board dtbs are recommended to be updated.

----------------------------------------------------------------
Karl Mehltretter (1):
      ARM: lpc32xx: only run SoC init on LPC32xx hardware

Vladimir Zapolskiy (1):
      ARM: lpc32xx: remove a few manually populated OF devices

 arch/arm/mach-lpc32xx/common.c  |  5 +---
 arch/arm/mach-lpc32xx/common.h  |  2 ++
 arch/arm/mach-lpc32xx/phy3250.c | 62 ++---------------------------------------
 arch/arm/mach-lpc32xx/pm.c      |  5 +---
 4 files changed, 6 insertions(+), 68 deletions(-)

