Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD1ACD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vF41Onoci3xm4yuA1RWqxk2jwaF1A7+Ay2gmPPIXgsw=; b=Pc64Jjaw8tTK88+kbeyG8oORk2
	lDloamYGreuxfscDYTA2LKDY0HnKYR1WwhJGerrtgvod8XSYlf2HoFm290t3vQP9QNrpK0SB9ZBgj
	fNqZ0YYHx6TNAOBgHoRAeBuqNIEGuV+tQPRrs1eWeJ3gFOw1PC1WKFNEFhx+zSCIg7+OMrV7Cj2Yg
	qHWsU3ZHry92bMe2F/QCWZ0WJczpEd90o4SDUorQlK4uWhHWAfv4seLNs2TtIaFXEKjFfwYtjtNVF
	92Lo1Sb62CQw8SVdmkm0FnLGW7C+UL9Kkuw9OuX9ByUKvaSVv97X+JHfvK0xkr0R+FxJRnVOnTHR/
	MqKEHgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStrl-000000076HD-1gua;
	Fri, 29 May 2026 09:50:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStrj-000000076GX-0yB2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:50:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8679522D7;
	Fri, 29 May 2026 02:50:49 -0700 (PDT)
Received: from login2.euhpc.arm.com (login2.euhpc.arm.com [10.6.38.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 576933F905;
	Fri, 29 May 2026 02:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780048254; bh=sCr95ObJg5rMOPg70HgDwEbdF9p+j0u6SyOKwV3Geio=;
	h=From:To:Cc:Subject:Date:From;
	b=VfEZ6QiNeAofahy2FB7fTqiVZZ0iQ0rDXmOJ7YfDaCyLO49UQfweasj54zUjT3nTh
	 NAvHysrERxfXmdUHKCWJts2Qa1AqXYelTLz2m/I9HSGF0HhsoxCl2kgd2ipVGekxXI
	 iUSp0zT7/3jTnS7xxVEBM/71y1U23siPyAfeyJg4=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	joey.gouly@arm.com,
	Sascha.Bischoff@arm.com
Subject: [BOOTWRAPPER PATCH v3 0/2] Support GICv5
Date: Fri, 29 May 2026 10:50:30 +0100
Message-Id: <20260529095032.48951-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_025055_331171_75B0F576 
X-CRM114-Status: UNSURE (   8.18  )
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

Small series adding GICv5 to the list of supported GIC
versions. Minimal implementation, just enough for Fast Models.

Thanks!

Changelog:
  v2 -> v3
     - Fixed code formatting and incorrect comments (per Sascha)
     - Fixed spelling and grammar mistakes (per Sascha)
     - Added tags from Sascha Bischoff
  v1 -> v2
     - Assign SW_PPI to NS domain (per Sascha)

Vladimir Murzin (2):
  Introduce --with-gic option
  Add support for GICv5

 Makefile.am                    |  15 +++-
 arch/aarch64/include/asm/cpu.h |  11 +++
 common/{gic.c => gic-v2.c}     |   0
 common/gic-v5.c                | 132 +++++++++++++++++++++++++++++++++
 configure.ac                   |  24 ++++--
 scripts/FDT.pm                 |  16 ++++
 scripts/findbase-by-regname.pl |  44 +++++++++++
 7 files changed, 232 insertions(+), 10 deletions(-)
 rename common/{gic.c => gic-v2.c} (100%)
 create mode 100644 common/gic-v5.c
 create mode 100755 scripts/findbase-by-regname.pl

-- 
2.34.1


