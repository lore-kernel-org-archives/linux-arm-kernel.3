Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7B8E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVmBABSFHx5R5MTquILKgGxl08w4PCC+wHr0khmGJK8=; b=zEg965TyKVCJPTReKc/wnxHla3
	stx7yfp5i/7stjunOPDcZufnpe9UxzZ9lSI0t7rpZc0VTzpjuBohnMTJBCc/sRp7mC+G4X616iydq
	8xFGN1anKGQLQMInLV3uKk3gJM91cx1Y+p0aHe3fAmzZ7nzD5cSbWOpnwzlPyg5sYFQktBg8M7LZv
	rN/pn7S2QplNVmREgqpTbAMN59+foHuBaq4KGmg+W4xeJAZh+Fkn/wE8Xzua38GGhTgUfp14JD0n7
	y+kLvKG6xdjGtlUBLtggzaWHaWLucR8PlheDt4jGCTdRKGWFiEHlPxGdgBGWXwH7vb5U2Huo1M/oo
	3lB5el0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIv3G-0000000DgRQ-43dV;
	Wed, 04 Dec 2024 19:28:46 +0000
Received: from mail-vk1-xa4a.google.com ([2607:f8b0:4864:20::a4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupR-0000000Ddor-0aeE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:30 +0000
Received: by mail-vk1-xa4a.google.com with SMTP id 71dfb90a1353d-5152909933bso41989e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339668; x=1733944468; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FVmBABSFHx5R5MTquILKgGxl08w4PCC+wHr0khmGJK8=;
        b=z3blW8PIRKYHnXXl0bTyaeT037krXI2WXM8+j1GnPbIwB8n3aHCqTtiCOqDHkQ1UyO
         MqOYNJcOwOY+CZxHT2kWYsyenjbr+9HUHB2jBWmMnvkdJDpmSAhiSZ/e62wQ/yX4S7Er
         MxdQWLgt8GhpmfYKKliXLKNpF+HpxPN/aM4cBFDEFcbzVNsU9SJ/BwvrcL2ushr7/IN5
         E7ZqC+mgKrBs12GhLaP4JpAgnsNGQpKoj9gqMWCcwbNgXPFn4whfQNmK4wifQ4bvC1r8
         ZX+kQbJCztneeZaxms6H7EJTQKJjybcEkFG7NGdgZEWZvOBIYg5z63rdoy3yCOrY6q6x
         mboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339668; x=1733944468;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FVmBABSFHx5R5MTquILKgGxl08w4PCC+wHr0khmGJK8=;
        b=ao9+FA9/fWJ8R+RMwHn5H4GH+XcrMefoYPF+2010k/DCXpE3evOqLcZhnodNT9KWNh
         ktOgFBsrZyA9mCGwtLsvZMAX8g05v5g4u01ymMG+GxVgO6oiWyxWfwPV10tKKIrzlNgn
         eURiRL4VSJwFMq6eJ9pJq8Pn0UuOHqaCEL4NCnhST7N5wf+U2ndRBZLKoUK7j686ZC1d
         3Mc9/dfCT6UVxY3sNJi+adlm5dJPLc8dlOL1MZC5EtQ07GOn+OBAfClrAwsJppdLsyth
         bD19j6EL63HrLs9LihtXg9FwO/EPotp2toKQ2GEqe7u4XzsdeGbPkbKWWiCcaoNpQWqZ
         M8Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXbhSDNYx1IXOPre+TriK7vATBzVL7j8IgQDlR+52VUk2lg/EfdotctDtkZxilIirrgL43UBss9HYc4UEMnHBRF@lists.infradead.org
X-Gm-Message-State: AOJu0YwZxCLj3KIsKzICeG1SzCcolNMnQFBuwXsX5bkSy8C/NaZp2sCX
	VkxCAiP6hoRDuPUy4J1JpYF8kBhOt9aI4O+4XBbuaV8XOxS1to7vNJ4qxK9o/QtLGf82qF/WiNt
	dBN54yBH/D9xnm0HUNQ==
X-Google-Smtp-Source: AGHT+IH+tCG51tTfToGtalOfr4jm1GPLIEdYYz0WZu1LFU6o/sXkUUif2KKj20JmKczb7eMhosGsEIxjk4+0fihs
X-Received: from vkbfs3.prod.google.com ([2002:a05:6122:3b83:b0:50d:9196:e944])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:4203:b0:515:26e7:736 with SMTP id 71dfb90a1353d-515bf307c0emr11029687e0c.6.1733339668025;
 Wed, 04 Dec 2024 11:14:28 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:48 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-14-jthoughton@google.com>
Subject: [PATCH v1 13/13] KVM: Documentation: Add KVM_CAP_USERFAULT and
 KVM_MEM_USERFAULT details
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111429_196022_39B38D49 
X-CRM114-Status: GOOD (  16.49  )
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
---
  I would like to include the new -EFAULT reason in the documentation for
  KVM_RUN (the case where userfault_bitmap could not be read), as -EFAULT
  usually means that GUP failed.
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
2.47.0.338.g60cca15819-goog


