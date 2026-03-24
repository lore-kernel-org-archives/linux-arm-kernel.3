Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FC5F4613D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i3H0gQ3inePQcRWKg0xBxsYMNefC7LuvIc2YWwFUeLE=; b=r+eMgdCiFpg5KbD6cHn3EYHn5/
	km85O+lNrrBj8SSf/6kV6iSZH2VR8k2uEUyMBA+mwGCw1mtetv3BoIacMQqo9xn/cCsuMdNC76kQi
	tQPNj+k/FCcNTiOayJfrw6VJ1MJWVEv1nMw02rUcKb8/DJLXWwJadY9PZ2ggs80LnNMY2kh+8E8ot
	UKElVzm1lGolqrsWlV+hCVKyzkCC2h4i0fAYmIFpO7cjKD6qxRs9pEvgFj5taeQisfL7WtfFOQUzu
	3+k73v8rrJ0cpWvcfLhvg3rgHwR761Ejvr/N0GQMgvj1MDgU8qgiMCkxeewH2yUr+r2P68YbuaIUk
	6xiGeGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51M1-00000001T7j-40s0;
	Tue, 24 Mar 2026 12:59:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51M0-00000001T5G-0Uwz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:59:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 563291476;
	Tue, 24 Mar 2026 05:59:19 -0700 (PDT)
Received: from login2.euhpc.arm.com (login2.euhpc.arm.com [10.6.38.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 71C343FAF5;
	Tue, 24 Mar 2026 05:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774357165; bh=hSHaOLuWCmAA3DjRUyNNc+rkzhPq3HaFInsUYt3eCA8=;
	h=From:To:Cc:Subject:Date:From;
	b=iz2VRlbJr+aIhxqaVDAryJq4y8SqQvm+3OMklAlEj8nLNa1426KtgsiX/Tq/nsdxi
	 PhggmnFC9SCtfFt+P8GCslxSCZv4cNK/3qXxc9kTnPte7/kpSwN/3HLKCYTsvo3tFr
	 87cGJ1XACkgj07jwXJ4ed4jqbyb11/S1bTBaJpEc=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	joey.gouly@arm.com,
	Sascha.Bischoff@arm.com
Subject: [BOOTWRAPPER PATCH v2 0/2] Support GICv5
Date: Tue, 24 Mar 2026 12:59:04 +0000
Message-Id: <20260324125906.67012-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_055928_212908_42080C3F 
X-CRM114-Status: UNSURE (   7.56  )
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
  v1 -> v2
     - Assign SW_PPI to NS domain (per Sascha)

Vladimir Murzin (2):
  Introduce --with-gic option
  Add support for GICv5

 Makefile.am                    |  15 +++-
 arch/aarch64/include/asm/cpu.h |  11 +++
 common/{gic.c => gic-v2.c}     |   0
 common/gic-v5.c                | 134 +++++++++++++++++++++++++++++++++
 configure.ac                   |  24 ++++--
 scripts/FDT.pm                 |  16 ++++
 scripts/findbase-by-regname.pl |  44 +++++++++++
 7 files changed, 234 insertions(+), 10 deletions(-)
 rename common/{gic.c => gic-v2.c} (100%)
 create mode 100644 common/gic-v5.c
 create mode 100755 scripts/findbase-by-regname.pl

-- 
2.34.1


