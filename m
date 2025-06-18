Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FABC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 05:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6MpWO9eGHCybkhP95T8R+1KfjKYk4MOXDyWFRHvmIc=; b=te4imUq8EJIWqMBbACaf3cklTA
	UdYHxWJXmedjZ2TZd+UyheR+CpB74wTAUDdyrYCmL3vtKbYjcleFCRLaRrX4Cg2k/MI5yxJ+eMvjY
	iupFyMijclN7kHBQOqZPNWrM5BwVTPlmK3zyV/IJgQrY2CHDimBY8vTFN/+rwUljnev4AWuf+w2Cm
	R7y/d8hnCoudTHI2VLzjEDKOKYkU5fDVoyec6Qg3wyNr7+ClTA5xPkdfz08Px6CDLiYTYIAZmNSaD
	vNwPeqIh+18Z065NRgo6V0Fcd6eQ+5EBRroNqqv8U28FiS08+yq09Eo2RZcRCAU9QiM8IPHWU1edj
	kL0CM4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkvY-000000093k5-2Eze;
	Wed, 18 Jun 2025 05:01:36 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLz-00000008zxV-18hm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:52 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so4298732a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220690; x=1750825490; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P6MpWO9eGHCybkhP95T8R+1KfjKYk4MOXDyWFRHvmIc=;
        b=fC9YLp0jpc7OBqnZ2tEkX0+DRYZmmTUr7IPIhAmD8ZQ1kICyNuQZrv+n2+7Yra0/Lo
         fQxN7uJbAu4yAdkrWQC9imTI008gfLbw3Kon43TaSsimOdBcdMFHmIB3MVwuvW0vyIN7
         1p3Hu5tPIxAGfKVhUDtkSEwJEi9sqg3g58mToISRosIPeB1nWhLFf0++OF9JTGMW4kEH
         Y4SYzxlPI9juvgXKLTJTKTs4zzyeob5f3d8SvmFlRwqPg8gNXuME7wkiTCBLfH45vdaz
         /HRr7mdgE+X+92gP4E353tZ61ovy6e8UWtsbAKSwx+nhECp2cOzzXptxTqYso8VOFHLk
         PAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220690; x=1750825490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6MpWO9eGHCybkhP95T8R+1KfjKYk4MOXDyWFRHvmIc=;
        b=tHI5CGkCUBrnpFP8mKRWmXoLNJ9UBKyOYSFfwPrkY21jeJjZYJC6Tg46C/2FoNjPW8
         7NimfM+PVoI6GssfY5VxKsrSjL7oXwmUNHG5wTDgfbyJ384RQ8TU+456vLxHbQ+vkqMB
         fy8lwpwnYh0wL2MRxUydoexnuMJzrYdy2E6YqCVkbDaNMyEetQ++UvOGPUVws/rwLZos
         mvCGT7N3rDyXlpLupJqeAjqcEYe0KuDwXgHKd7DJI/4Nl2OzvTw7HlWd+2TF2+OynKRu
         1fUc/iUfhHoTxBNmysUahkc4tMzpXaStPGZYL/qr2doxSoelGAgNDqGZ7J3F+J5FiTPm
         QRsA==
X-Forwarded-Encrypted: i=1; AJvYcCVgCUfsvoo8sWIcyrU5MGAJzRIeZgafFl5EI/zlFExWdrr6KodcbOamxfimehnCohHTzINSu4IR3dKmW84SgiNA@lists.infradead.org
X-Gm-Message-State: AOJu0YwhKV99Dt/UxAFs6FjXFcUynQrLsPUA049O+st6bRIdfvpldt8R
	/dD0X/6IA+qcbY/PEtrxRCv2LLYMVztNLr7AGbqz4l3w+0Hyda3DuWkl/sXD40OBt/m+L9+iR9n
	rZAobPbsQI/OMyV1G6yaLyQ==
X-Google-Smtp-Source: AGHT+IFBmqhQDFkst9hOrle0gOrugvU+bLMa/osue2o1jv722NhjgUmFbYBlQLzwI5ul7WF7bNf9FKyZ7x+dJLfM
X-Received: from pgbfq12.prod.google.com ([2002:a05:6a02:298c:b0:b2f:dfa3:cb81])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:512:b0:218:5954:1293 with SMTP id adf61e73a8af0-21fbd668df0mr28784142637.34.1750220689787;
 Tue, 17 Jun 2025 21:24:49 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:24 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-16-jthoughton@google.com>
Subject: [PATCH v3 15/15] KVM: Documentation: Add KVM_CAP_USERFAULT and
 KVM_MEM_USERFAULT details
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212451_308066_BCF3E31A 
X-CRM114-Status: GOOD (  14.36  )
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
index ff0aa9eb91efe..25668206a5d80 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6308,7 +6308,8 @@ bounds checks apply (use common sense).
 	__u64 guest_memfd_offset;
 	__u32 guest_memfd;
 	__u32 pad1;
-	__u64 pad2[14];
+	__u64 userfault_bitmap;
+	__u64 pad2[13];
   };
 
 A KVM_MEM_GUEST_MEMFD region _must_ have a valid guest_memfd (private memory) and
@@ -6324,6 +6325,25 @@ state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
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
 
@@ -8557,6 +8577,17 @@ given VM.
 When this capability is enabled, KVM resets the VCPU when setting
 MP_STATE_INIT_RECEIVED through IOCTL.  The original MP_STATE is preserved.
 
+7.44 KVM_CAP_USERFAULT
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
2.50.0.rc2.692.g299adb8693-goog


