Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA939C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 07:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=fjhCYtUcaSq0dNmp/uY6QFONknU1MFIVam9Vx9FJ4HI=; b=ep4v0kQ6n4bLqkK/W0kKkDfO+U
	uAqonoBffeibTAPM8MR1neb+Q9rzd6s17NW0GJcYTAr49DdjucZjci2rbKKtyvK3kP0p7/et/vbXE
	CGLTU0ca47Y14TSHJBJLxO1HUIdynhzde+EkYKJ6DPppcIiU6CS5M0kfASPVKl6nnEE5sJe6XmXO5
	RDBKpk/h7dbYTipOpFIk6gDUZx37xe0xdmaBkXabf/7LtZ7jubzDSOPqBqHls/jmCi1RlAk0mZlrS
	TXXOa+NefYhLAOzlm9HPGDAdRRHBz0waCRiX2DJ/aa1UtxUzFDsigmAY6O3OA6R+CwqHA9ILZYFAd
	zRUCzJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlgi-0000000B0M5-16G8;
	Thu, 10 Jul 2025 07:27:24 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkgV-0000000ArGQ-3N4W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:23:11 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250710062302euoutp0268a43f667495f144a3dd104789182376~Qz6mXqO1E1921619216euoutp02i
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 06:23:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250710062302euoutp0268a43f667495f144a3dd104789182376~Qz6mXqO1E1921619216euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752128582;
	bh=fjhCYtUcaSq0dNmp/uY6QFONknU1MFIVam9Vx9FJ4HI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=CkDXOzjz0vA7/XzIyo+2hcUn6b9nNB7sPzYh7UO9k4sX7rmzen6MGbAtJqzfReu+i
	 4Dm3Yr3jaCyjnBcp/Si7MGfLNhYU9zPcsar+tR1kRQgOIz3/coNw61WsT5y2LTFqkT
	 7tFSuFUUoRygio+yVh5F3asSyjMeGTI7dntJldFQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250710062301eucas1p1b61431dc31a5933087b45c246866fb17~Qz6lwTyHl1786817868eucas1p1F;
	Thu, 10 Jul 2025 06:23:01 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710062257eusmtip1e3cd4937da192f21b7bc849539e961f7~Qz6iNiOSW1044910449eusmtip1h;
	Thu, 10 Jul 2025 06:22:57 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Andy Lutomirski
	<luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan
	<shuah@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic
	Weisbecker <frederic@kernel.org>, John Stultz <jstultz@google.com>, Stephen
	Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
	Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Richard Cochran
	<richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>,
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt
	<werner.abt@meinberg-usa.com>, David Woodhouse <dwmw2@infradead.org>, Kurt
	Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, Antoine
	Tenart <atenart@kernel.org>
Subject: [PATCH] vdso/gettimeofday: Fix code refactoring
Date: Thu, 10 Jul 2025 08:22:49 +0200
Message-Id: <20250710062249.3533485-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250710062301eucas1p1b61431dc31a5933087b45c246866fb17
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250710062301eucas1p1b61431dc31a5933087b45c246866fb17
X-EPHeader: CA
X-CMS-RootMailID: 20250710062301eucas1p1b61431dc31a5933087b45c246866fb17
References: <CGME20250710062301eucas1p1b61431dc31a5933087b45c246866fb17@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_232309_087935_20F8B6A0 
X-CRM114-Status: GOOD (  15.25  )
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

Commit fcc8e46f768f ("vdso/gettimeofday: Return bool from clock_gettime()
helpers") changed the return value from clock_gettime() helpers, but it
missed updating the one call to the do_hres() function, what breaks VDSO
operation on some of my ARM 32bit based test boards. Fix this.

Fixes: fcc8e46f768f ("vdso/gettimeofday: Return bool from clock_gettime() helpers")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 lib/vdso/gettimeofday.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index d6743ed756a1..97aa9059a5c9 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -395,7 +395,7 @@ __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 	if (likely(tv != NULL)) {
 		struct __kernel_timespec ts;
 
-		if (do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
+		if (!do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
 			return gettimeofday_fallback(tv, tz);
 
 		tv->tv_sec = ts.tv_sec;
-- 
2.34.1


