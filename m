Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3479C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 03:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4LZZVgLPmLB3sng0ocnjsmsmEfU5SHO/hSLgHjRyQik=; b=ZwdrNOUrNGuI4eDQnnq6iSOYlE
	KRQvyXFzWTcS45cweCbWr+gaHcyI4M5DmfieEp2iPWTcaDp8pZwjeImi1Bu/MpEq8YlsYR+drzyiL
	lbIBBiIm7A6EckV0VpZ7bMYdptwCygW8S+C9shY3TKyETUG1dtk2ebHEDsZMP9ceEHmoNJYE3njRJ
	rHBO1lO97P/BxLtaTVmPsGFAQQC2Q/rb7X1Scb2Ik0JXfQPdyREK0NyAiwqI2gkSL7FPy6u3OwuGl
	L2Q9LMZfbjqfDEQb3LzxzGakyXQkdM1imNqizJq1uXnAcYaazMskaaWtdDjch0X6f6ZdjuL7/mA3n
	cKNwktTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88FJ-0000000GnuW-31Pv;
	Sun, 20 Sep 2026 03:29:41 +0000
Received: from out-12.mta1.migadu.com ([95.215.58.12] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88FG-0000000Gnts-3reJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 03:29:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=V4Vz6gidKP+9XlJ5npYvmEGbYAGJM9YPmsRmNHIjUZU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789874976; v=1; x=1790479776;
 b=dn+KG/MUQIJhIFovjNC99bJThiKMpANjlqiNn8yQcDszeuB85t1RYIkSHKLYRRjpKXhqUYu2
 PD5kWI8khkIrBD7dgDRe3EUxWGa+iPkGidcOMygaPCd3OBFmkpuJN4/9H1hY6vc3S/8yVWEhE8w
 yzqHwIoPtIUIbcXg6KSxrlHo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1de7dad217777a35;
	Sun, 20 Sep 2026 03:29:35 +0000
X-Mizu-Trace-ID: 1de7dad217777a35
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: errata: document Cortex-A9 r4 as affected by erratum 754322
Date: Sun, 20 Sep 2026 11:29:23 +0800
Message-ID: <20260920032926.452884-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_202939_196758_EF6012F5 
X-CRM114-Status: GOOD (  11.71  )
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

The Cortex-A9 r4 Software Developers Errata Notice (ARM UAN 0009D),
section 2.3.3, lists erratum 754322 as affecting all r2, r3 and r4
revisions. The Kconfig help text currently mentions only r2 and r3.

Add r4p* to the affected revisions so that users configuring Cortex-A9
r4 systems know that the workaround also applies to them.

Link: https://documentation-service.arm.com/static/608118675e70d934bc69f143
Fixes: fcbdc5fe6ebe ("ARM: 6772/1: errata: possible fault MMU translations following an ASID switch")
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 arch/arm/Kconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0cc289a7184a..c7d631d5242b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -708,11 +708,12 @@ config ARM_ERRATA_754322
 	depends on CPU_V7
 	help
 	  This option enables the workaround for the 754322 Cortex-A9 (r2p*,
-	  r3p*) erratum. A speculative memory access may cause a page table walk
-	  which starts prior to an ASID switch but completes afterwards. This
-	  can populate the micro-TLB with a stale entry which may be hit with
-	  the new ASID. This workaround places two dsb instructions in the mm
-	  switching code so that no page table walks can cross the ASID switch.
+	  r3p*,r4p*) erratum. A speculative memory access may cause a page table
+	  walk which starts prior to an ASID switch but completes afterwards.
+	  This can populate the micro-TLB with a stale entry which may be hit
+	  with the new ASID. This workaround places two dsb instructions in the
+	  mm switching code so that no page table walks can cross the ASID
+	  switch.
 
 config ARM_ERRATA_754327
 	bool "ARM errata: no automatic Store Buffer drain"
-- 
2.43.0


