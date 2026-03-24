Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00C3F54ADE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s16obLPlfxX3ODE8B6LSIvb7UDetCIb25s0h37Tlk74=; b=nh0WYWUQzoiXADvNNWAnGfm0Ma
	2kwbMNBhrvWdGsGe8teJ6tCufTBpiobrayVksbCamTV4QrZVDz54TE3hwvJrNMV0fQMR3n6XlKJdw
	Cu/FRV8xN6BZo+W+Iy3wloGKopI49QLYDla09CVvFdjOJlBuV6/q5DSNspaAJmoEoLMR++irt1KAA
	CTSbAnXvbNMavHuSXHUW2Z6Y7T4cFOAUzCRbXrsBpDOw0kCLD6HOFE70JHfMrsxOAgTjVfzBwrbcz
	Q+ubl4+K6+mbJMtv1sMPcywmM6++oVK4qGCkef1gjkIKQlL6Ftf2wfTrv3YYlKIJgUdO5Rpl7Di5b
	Cd7Hm3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w555X-00000001wYk-2VXx;
	Tue, 24 Mar 2026 16:58:43 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w555U-00000001wXn-37Yw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371521; x=1805907521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rU3n+FhgkyydByVdKs0lqSkLocKXu14IaAOX593F5w8=;
  b=c/Cx3dv3Vz2/YJbekHvh+gD+WIP1CwyNuQ3q0MlWTGImDZiT1q5uRbVc
   8bALhv9WRH2YI6Npjox5VxweEtizr6VeUqSCQGPI9tV9WRwXrQ1zza/8/
   DZD+qQ8HedqBh24LsNLDc44P9DDOd2eFzXOFXpQlU3wRet3dnQGImnx/A
   QWjN1f6hkstl6XO4sFD0Hn0WMcpJ4Qk9XRk4id57U2nGqI0lvMsw+aS6k
   ZdkDBuammcrUGgQ50INjc/9hFh8UCB4L+koUWz1oInxxf1kGgNqKYoAfm
   DyAb/ZzbHxMOjwNlPDxK5ULEw2j5/9lg8vkem+s1IqsMlZipeNnSYQpNs
   A==;
X-CSE-ConnectionGUID: ecNxeSUcTTO8iRP9gOzgdQ==
X-CSE-MsgGUID: HCq0zXsvTrmEr/Ny6hqiXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86471566"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86471566"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:58:40 -0700
X-CSE-ConnectionGUID: cUSLjl01TreRSEfKEtoT3A==
X-CSE-MsgGUID: UG9hoz2GT3+u65rMjcqTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224421884"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:58:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 01/10] resource: Add __resource_contains_unbound() for internal contains checks
Date: Tue, 24 Mar 2026 18:56:24 +0200
Message-Id: <20260324165633.4583-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_095840_817848_8A4A8B81 
X-CRM114-Status: GOOD (  17.68  )
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

__find_resource_space() currently uses resource_contains() but for
tentative resources that are not yet crafted into the resource tree. As
resource_contains() checks that IORESOURCE_UNSET is not set for either
of the resources, the caller has to hack around this problem by
clearing the IORESOURCE_UNSET flag (essentially lying to
resource_contains()).

Instead of the hack, introduce __resource_contains_unbound() for cases
like this.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 include/linux/ioport.h | 20 +++++++++++++++++---
 kernel/resource.c      |  4 ++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 5533a5debf3f..19d5e04564d9 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -304,14 +304,28 @@ static inline unsigned long resource_ext_type(const struct resource *res)
 {
 	return res->flags & IORESOURCE_EXT_TYPE_BITS;
 }
-/* True iff r1 completely contains r2 */
-static inline bool resource_contains(const struct resource *r1, const struct resource *r2)
+
+/*
+ * For checking if @r1 completely contains @r2 for resources that have real
+ * addresses but are not yet crafted into the resource tree. Normally
+ * resource_contains() should be used instead of this function as it checks
+ * also IORESOURCE_UNSET flag.
+ */
+static inline bool __resource_contains_unbound(const struct resource *r1,
+					       const struct resource *r2)
 {
 	if (resource_type(r1) != resource_type(r2))
 		return false;
+
+	return r1->start <= r2->start && r1->end >= r2->end;
+}
+/* True iff r1 completely contains r2 */
+static inline bool resource_contains(const struct resource *r1, const struct resource *r2)
+{
 	if (r1->flags & IORESOURCE_UNSET || r2->flags & IORESOURCE_UNSET)
 		return false;
-	return r1->start <= r2->start && r1->end >= r2->end;
+
+	return __resource_contains_unbound(r1, r2);
 }
 
 /* True if any part of r1 overlaps r2 */
diff --git a/kernel/resource.c b/kernel/resource.c
index bb966699da31..1e2f1dfc0edd 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -754,7 +754,7 @@ static int __find_resource_space(struct resource *root, struct resource *old,
 		/* Check for overflow after ALIGN() */
 		avail.start = ALIGN(tmp.start, constraint->align);
 		avail.end = tmp.end;
-		avail.flags = new->flags & ~IORESOURCE_UNSET;
+		avail.flags = new->flags;
 		if (avail.start >= tmp.start) {
 			alloc.flags = avail.flags;
 			if (alignf) {
@@ -765,7 +765,7 @@ static int __find_resource_space(struct resource *root, struct resource *old,
 			}
 			alloc.end = alloc.start + size - 1;
 			if (alloc.start <= alloc.end &&
-			    resource_contains(&avail, &alloc)) {
+			    __resource_contains_unbound(&avail, &alloc)) {
 				new->start = alloc.start;
 				new->end = alloc.end;
 				return 0;
-- 
2.39.5


