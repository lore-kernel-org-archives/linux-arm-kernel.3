Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D96F54ADE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtPJfOS6ybRUYylo/bLt96EKp7yLEhb5rsHoucJB9QI=; b=PgTFvlrSMP1frOzV3HpGpuqv09
	lhcw1oJ7RPdGKiLwoWPJjf/sLjr56l8gyJHgTRduC6E9Besilaj5youaUMqPQZcf0t/O7FIUOpp95
	tal2VyZkVCi8M+OAIJJDB0h76mnFlG2BrhtlNkgT5/6qzTSxx7ZzSx9J98SYugQrVQgZ2wXD5gJ3/
	Lu90e92RyTSokToOg6rxsRAw0xN9aKf3LB0+pgddFRCMLVwZ5wgjzLgkdLjFaxxx9crRjlcgzoHFp
	ilVdnJ4IsIYEvOo1MjVpqJ6/RzbFE79KTSnox/+T6AQbsPXp+eIWHadVtRiXHF0mL+wHkw9q4QK1L
	FR7fTAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5567-00000001wm6-3Kfw;
	Tue, 24 Mar 2026 16:59:19 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5565-00000001wlB-2DYD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371558; x=1805907558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4wZaEWcRmOK6fFyQu8mcl48M7LLtMpZtBEYXsd1Cc4E=;
  b=JL9j3tQeXBYC83en/T8KiQE9JJyUH+tYKOhXXjWWAS+oIoMIcgoLgo0W
   PQ8J1LtlYKISV4O7YW4/ZBAJLct0KS1Z5n33+LDGxT8qTDxPJ/zK75RFD
   4Q3UCd0TwlbWJ4z5Q/sUv6+VUWa3Xv8xuxHm1hnJRTlnLpcZxk0cEfAtq
   lkw7v9Xlcb1JWazFzTGp0KurDx2USnkngF1b1Y6DgXdvqg53lVlYPkMCS
   XbtxgNWWfjWW8bznrWL16ZxYU3qxLOwG9lKtqEj7ilgD/My2dEzFsCQ4y
   qBALtZT9j0oKqDX4EM8Vxa9VIBnen6b1lzG9qJMUFdv5DeZsNK4U7H5Nh
   w==;
X-CSE-ConnectionGUID: DYDwOi0yRy2MaqkCrJydJQ==
X-CSE-MsgGUID: OfvlpeqmQHCpeQdUrQy3CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86471759"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86471759"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:59:17 -0700
X-CSE-ConnectionGUID: b26LCQzsTZi2fIETMNneag==
X-CSE-MsgGUID: WA0Ub946SXOBfg0OV/eeeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224666273"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:59:07 -0700
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
Subject: [PATCH 03/10] resource: Rename 'tmp' variable to 'full_avail'
Date: Tue, 24 Mar 2026 18:56:26 +0200
Message-Id: <20260324165633.4583-4-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_095917_619966_CA0D74C1 
X-CRM114-Status: GOOD (  13.27  )
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

__find_resource_space() has variable called 'tmp'. Rename it to
'full_avail' to better indicate its purpose.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 kernel/resource.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index 1b8d3101bdc6..8c5fcb30fc33 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -727,39 +727,39 @@ static int __find_resource_space(struct resource *root, struct resource *old,
 				 struct resource_constraint *constraint)
 {
 	struct resource *this = root->child;
-	struct resource tmp = *new, avail, alloc;
+	struct resource full_avail = *new, avail, alloc;
 	resource_alignf alignf = constraint->alignf;
 
-	tmp.start = root->start;
+	full_avail.start = root->start;
 	/*
 	 * Skip past an allocated resource that starts at 0, since the assignment
-	 * of this->start - 1 to tmp->end below would cause an underflow.
+	 * of this->start - 1 to full_avail->end below would cause an underflow.
 	 */
 	if (this && this->start == root->start) {
-		tmp.start = (this == old) ? old->start : this->end + 1;
+		full_avail.start = (this == old) ? old->start : this->end + 1;
 		this = this->sibling;
 	}
 	for(;;) {
 		if (this)
-			tmp.end = (this == old) ?  this->end : this->start - 1;
+			full_avail.end = (this == old) ?  this->end : this->start - 1;
 		else
-			tmp.end = root->end;
+			full_avail.end = root->end;
 
-		if (tmp.end < tmp.start)
+		if (full_avail.end < full_avail.start)
 			goto next;
 
-		resource_clip(&tmp, constraint->min, constraint->max);
-		arch_remove_reservations(&tmp);
+		resource_clip(&full_avail, constraint->min, constraint->max);
+		arch_remove_reservations(&full_avail);
 
 		/* Check for overflow after ALIGN() */
-		avail.start = ALIGN(tmp.start, constraint->align);
-		avail.end = tmp.end;
+		avail.start = ALIGN(full_avail.start, constraint->align);
+		avail.end = full_avail.end;
 		avail.flags = new->flags;
-		if (avail.start >= tmp.start) {
+		if (avail.start >= full_avail.start) {
 			alloc.flags = avail.flags;
 			if (alignf) {
 				alloc.start = alignf(constraint->alignf_data,
-						     &avail, &tmp,
+						     &avail, &full_avail,
 						     size, constraint->align);
 			} else {
 				alloc.start = avail.start;
@@ -777,7 +777,7 @@ next:		if (!this || this->end == root->end)
 			break;
 
 		if (this != old)
-			tmp.start = this->end + 1;
+			full_avail.start = this->end + 1;
 		this = this->sibling;
 	}
 	return -EBUSY;
-- 
2.39.5


