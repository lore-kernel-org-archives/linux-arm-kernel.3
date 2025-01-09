Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8FCE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FPGE2VUglE9CFYJaRkZs5d1Qv8okwjTkQX7zeGY738=; b=TlSa8FfmdLtDzaHMTlG0hfmIbo
	eaWskmxJOaXYgRvkTBl7dFNKRFrod3wczlCuEk8bfYiVuJV/QCka2ITq+H3r9sy/2ze8qJINoLix7
	c39kFuP4yigMcUtWwPVyjf0fNGT6BOG2wImKS40OnokeJULYZlbevrs2eoZKWcW2EIF1YTCb71ACM
	I+kTfcqg0qH3B75GA86exXNMDleh9GPkaXP3L+wZWgtLs9xYgHpZ9NOkmsaxNYtBfx9Mj8pJcgSD2
	TbQ3OMkPEWhqmtk8ZRlZa1uqooYhoYxhpAFh+J7tnXIOxOGrmlz/gxhxnSDvVWDnE+KVS6f1bmzxD
	dOiGKZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzl9-0000000DJqQ-1Ean;
	Thu, 09 Jan 2025 21:08:07 +0000
Received: from mail-vs1-xe4a.google.com ([2607:f8b0:4864:20::e4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTj-0000000DGbV-3AgD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:50:08 +0000
Received: by mail-vs1-xe4a.google.com with SMTP id ada2fe7eead31-4aff533abadso835579137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455806; x=1737060606; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1FPGE2VUglE9CFYJaRkZs5d1Qv8okwjTkQX7zeGY738=;
        b=Xjl0BjwpdhW6/wPUMLsZ0xpD1+mL5qjGwcDWdeorRxCkLh+03BV19psONFeQUHuifD
         pBe2iYy1PUYHo54CjplqbfWl/JsIiVOuu076G9Hv+eeWqEJf7IjFDuEDuRyXGDoCuEhJ
         x9YWy1e6tg733MeekrLJGGgmCUhqjqwpEkpse8EdAXXuptCeVD11KeD6epnfgWVN8nV5
         2b9ALZJIeFUdQepZoTtDr3KAYhWGaup3nGUCu7jhM3bSPvwqVbyfuyF6IuC9CuXifxBx
         V0k1maFKM1/qnUMuu47RPzuApVxYIhyBjGbE+HOflxnsij7pDHLO3vhtl8uj++LRQ/4Z
         scQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455806; x=1737060606;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FPGE2VUglE9CFYJaRkZs5d1Qv8okwjTkQX7zeGY738=;
        b=GzDr+98l+uGgc15XzWFlqvnqcvitet6xyTpLUFccsi1XVVcCdG6Nv7ht8DyJmMTWvt
         LvPiiHWJSGw+YpwlNRgFTc2DeKh0N/Ap4MzDQw2dRje970BKhfSjOL+oT7Nv8XVuehkL
         bIaLV5sFkNC4HgX7zd6JcgdK+3xobBd6uK5z24Rxe0dkU3SWkLcbmFpSkuye6KMsfiQz
         vmFnE3hcywNmwD0hAG8Aq/3Mv3XrhCZlgDiinCfC0MElYdXvoLst04vVbITAXhAvtIyU
         oIceUJ6lh6TAU++ieLGg1K3Q7UKjjjPTCteBLrVYBvxK4Nqtg0j2C/odIISCE4eUTPbx
         xhrA==
X-Forwarded-Encrypted: i=1; AJvYcCXcDFrE8OTd9zGpzStX2BztkAxEHT34BTQ8De8V6Y/vLpyYgzJMSXmsAmOZgf1hU3Ca3op96k8MMVPlO4LPpytM@lists.infradead.org
X-Gm-Message-State: AOJu0YwWY4H9QVSGZptGvY5SiPfk0aG9+JuVNN/IcsfDQ4J4NkmLb/0y
	52ILR1b4lTHVFTA4PicH1CByUXnlUErILq7W4lMAR18i9xc4u5016+ePKeHJoKrqZpuMwdnMp1D
	JMZnqfp7PiFT04YtyTQ==
X-Google-Smtp-Source: AGHT+IER4UDdWkNRD2ZPfHth4m0AOq+dYEUlBJOggH5PvPrkTbjMUbHW/yGSl0VACauqUoUnO5tUTjFJuH8L321Q
X-Received: from vsvg20.prod.google.com ([2002:a05:6102:1594:b0:4af:fda4:ed12])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:6e88:b0:4b4:e7e7:56c0 with SMTP id ada2fe7eead31-4b4e7e76563mr5145199137.3.1736455806482;
 Thu, 09 Jan 2025 12:50:06 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:29 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-14-jthoughton@google.com>
Subject: [PATCH v2 13/13] KVM: Documentation: Add KVM_CAP_USERFAULT and
 KVM_MEM_USERFAULT details
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_125007_803582_370C9FD1 
X-CRM114-Status: GOOD (  14.99  )
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

Include the note about memory ordering when clearing bits in
userfault_bitmap, as it may not be obvious for users.

Signed-off-by: James Houghton <jthoughton@google.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/virt/kvm/api.rst | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 454c2aaa155e..eec485dcf0bc 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6281,7 +6281,8 @@ bounds checks apply (use common sense).
 	__u64 guest_memfd_offset;
 	__u32 guest_memfd;
 	__u32 pad1;
-	__u64 pad2[14];
+	__u64 userfault_bitmap;
+	__u64 pad2[13];
   };
 
 A KVM_MEM_GUEST_MEMFD region _must_ have a valid guest_memfd (private memory) and
@@ -6297,6 +6298,25 @@ state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
 is '0' for all gfns.  Userspace can control whether memory is shared/private by
 toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
 
+When the KVM_MEM_USERFAULT flag is set, userfault_bitmap points to the starting
+address for the bitmap that controls if vCPU memory faults should immediately
+exit to userspace. If an invalid pointer is provided, at fault time, KVM_RUN
+will return -EFAULT. KVM_MEM_USERFAULT is only supported when
+KVM_CAP_USERFAULT is supported.
+
+userfault_bitmap should point to an array of longs where each bit in the array
+linearly corresponds to a single gfn. Bit 0 in userfault_bitmap corresponds to
+guest_phys_addr, bit 1 corresponds to guest_phys_addr + PAGE_SIZE, etc. If the
+bit for a page is set, any vCPU access to that page will exit to userspace with
+KVM_MEMORY_EXIT_FLAG_USERFAULT.
+
+Setting bits in userfault_bitmap has no effect on pages that have already been
+mapped by KVM until KVM_MEM_USERFAULT is disabled and re-enabled again.
+
+Clearing bits in userfault_bitmap should usually be done with a store-release
+if changes to guest memory are being made available to the guest via
+userfault_bitmap.
+
 S390:
 ^^^^^
 
@@ -8251,6 +8271,17 @@ KVM exits with the register state of either the L1 or L2 guest
 depending on which executed at the time of an exit. Userspace must
 take care to differentiate between these cases.
 
+7.37 KVM_CAP_USERFAULT
+----------------------
+
+:Architectures: x86, arm64
+:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
+
+The presence of this capability indicates that KVM_SET_USER_MEMORY_REGION2 will
+accept KVM_MEM_USERFAULT as a valid memslot flag.
+
+See KVM_SET_USER_MEMORY_REGION2 for more details.
+
 8. Other capabilities.
 ======================
 
-- 
2.47.1.613.gc27f4b7a9f-goog


