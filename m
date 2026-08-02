Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BFCC55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LbYy5ro5NDFE3DG1YbB/j5IpRtLd57Aeh6qzOqIXCU=; b=pArFIlk6SRVbUGffo16I4K7Dzc
	lQ39h+s3+VdgkBNxRrhbNgxQLKkQcKywsdTRk7oiKlRy0MedAVQsy2t0kDpsZmzcRhPyusmOxEO6Q
	1CX/6pMglzVtpWovS/+xIz3MB8Ra36km9Uv1UV4+ZvhSEO2J2gbTjYlM5S5exURIqCAdAujrQ/l+K
	F0aq9ZgE3p3YT6Ra0bYqOX2DQtvJOb0MkJz0lAUEzsAZqHxz7nEhBA0l83MUlABvRCNg6aCvWzDrw
	5p44vxxWbSObnxKiazRJwJOl+inhmymze7iQDFOLIbuLhKmTVVE36QsO5NuqW5FFJkZ24b/tKZ2Oi
	yYVq9Gmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqQoH-0000000FSQ3-2niL;
	Sun, 02 Aug 2026 07:40:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqQoG-0000000FSPW-3UOp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 07:40:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AB1A41AFA;
	Sun,  2 Aug 2026 07:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E4A1F00ACA;
	Sun,  2 Aug 2026 07:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785656435;
	bh=5LbYy5ro5NDFE3DG1YbB/j5IpRtLd57Aeh6qzOqIXCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZlkYsLplRph3ACb5Y0qShIVauT+VeZYT7DAbyEWRuhNCXupiQXKQeGe48Rp1BoU6o
	 ykH+8hNRMTh3IOq4fgDP11Taaedt3v6TjdFpDBnso8tmFbWPf72X7Dxxz8H9n869lI
	 +o7o4gH44rsEYbf3t0hLdy3zAYU5NrpZ9ts9yUAo6FY+2xzcL24dqG2D+1XtPaA+dr
	 A/Ar28oyD7OKALChWX2DBVAWVLtv4G83BYcrutcRRwl2Tun5geNoLv9MbF01cNbQH0
	 k4mNwEi99GsQEEmwZoveFbRu00OqMa32HK19GG7MCJHW4L/hQP/o9zozMKLK3BZYcl
	 8u+jNC2kvyE9g==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	surenb@google.com,
	liam@infradead.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	shakeel.butt@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	zhanghongru@xiaomi.com,
	willy@infradead.org,
	zhangbo56@xiaomi.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [RFC PATCH v1 1/2] x86/mm: use VMA lock for kernel faults on user addresses
Date: Sun,  2 Aug 2026 15:40:17 +0800
Message-Id: <20260802074018.73887-2-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260802074018.73887-1-baohua@kernel.org>
References: <20260802074018.73887-1-baohua@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use the VMA lock for kernel faults on user addresses. This also
makes the existing code below meaningful:

  /* Quick path to respond to signals */
  if (fault_signal_pending(fault, regs)) {
          if (!user_mode(regs))
                  kernelmode_fixup_or_oops(regs, error_code, address,
                                           SIGBUS, BUS_ADRERR,
                                           ARCH_DEFAULT_PKEY);
          return;
  }

Right now, the code above is dead because !user_mode always
takes the mmap_lock path.

Co-developed-by: Bo Zhang <zhangbo56@xiaomi.com>
Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 arch/x86/mm/fault.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 45b99c3b1442..c22b74e0eeaf 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1328,9 +1328,6 @@ void do_user_addr_fault(struct pt_regs *regs,
 	}
 #endif
 
-	if (!(flags & FAULT_FLAG_USER))
-		goto lock_mmap;
-
 	vma = lock_vma_under_rcu(mm, address);
 	if (!vma)
 		goto lock_mmap;
-- 
2.39.3 (Apple Git-146)


