Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5941CCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDn63HL1kwJS/kY3r585sacU2JfuR+fJZeZdcH4A9XQ=; b=qavQ/9bEeeQf+pY8nsUu2PNAES
	xB5lylgbF53s0c6S8b1EvzfeKShZ6J+54GpD5D81YYAoNd1uaWBktZC6OdKiY5VTVXiQEJP824pmQ
	dh4BWxsMM18IjNtC701I3xJ5lxNl8nPcOpX1zXJGzyFzFjIykJnqDQaw+nKwaCO0NwcL9oRcoSfsp
	hOiNM0vBiRSv3frJzVlNL3JZz5ycOwBaKbBZnpvPkkqiqhCQTHYo4/y//MnWdAEMuPKBqnE07/hts
	7N+dd1xVGXIUh7UJKVs/hY17ZOWaxLvYwazIigB6Pfd/sHSD0HnLXCXjAaC1c4vQSs2Z/EavAZWvE
	9iGGv6kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgS-00000003LW8-1gzO;
	Thu, 11 Sep 2025 13:49:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgN-00000003LQE-27nQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:49:52 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3e7512c8669so598331f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598590; x=1758203390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDn63HL1kwJS/kY3r585sacU2JfuR+fJZeZdcH4A9XQ=;
        b=Z0aTeaVv93N3VVLNKwlfKWocW+PtkRbUxEVS63QXzCwH68+Pj9sc8nKqJ8sUL/3T4F
         wkFeIKV2R7XY/haecS2Yb6Ss76HWPp8mX+/LJC9oetkUuyJGmnnNMqUATsr2IKzwI8GB
         zAa/ocpHSVsMMVLVA+O+oiEr1tR7mfB3h76hHj9OuHbC3omD6ZfrEvIvGPKhcgJlJ3BI
         NXkZKOzZQx5kpGuqKasK67f9op0BSj4W3Xq8dfgtHtrWYMg6fBRbFNmWt/vJlKPm2Nni
         eMn7MlcevoRaryFuVycRhBcOpQvXqFk7cK5TBg1e2f4q0cK5BuRGWEpFH+FLcTwLanhZ
         +mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598590; x=1758203390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDn63HL1kwJS/kY3r585sacU2JfuR+fJZeZdcH4A9XQ=;
        b=nRxveFRYMbVyUzXcnaQWIoHI1IqfeD1NuTiNzu8Mg6LquzNRNyUS9288Qen2zv+tYn
         IFn9VClx0WSEwb99UzdIiefvI+1jCzqDW55H5cgX/gx+aBlFX4Z5lsZ8NAChVYu4qo2c
         ytNyc3MnMBmkqbJmHghWyr2fSsbpSGqenxBTOcXpS+ls6tstIGPtor/sBjyslCGVXpyB
         UlRZFP33CtFuMpi1GWR2ISCSzwtrpta7HALX0NIZp5qKJpZ+2FU63FsZoNBh71aUPTnA
         qp7yHiewgtF7H80fvGJCNTVqUvZPOxiCQlRSVCrEHqlxOZ+XyJku/m4m0k8DM8IacB05
         ioag==
X-Forwarded-Encrypted: i=1; AJvYcCUOaEAcx8Oxzf2viSfLQtb8QHjp6yDIyvmSibYmwEkvKBGp9xi+lFuqY2qp7RX/BrtAfJLHb2ZC6tqhIPHHg4W7@lists.infradead.org
X-Gm-Message-State: AOJu0YzHO3XrzJWOXVPEaqzk6IZbNZwk8EiKknMSLqGcBvchtXfDs6+C
	4wLgqgWQjsilr2xz2BE9ioIfUva4N1ZpYBpx8Cu6RkQ8rIaMBFbWnyZ7
X-Gm-Gg: ASbGncvu1EO5Jkh0vmPUHhHru/szimxcmiG/Dv8UUCSOznqcikOgqHGatf05cxP4wVL
	t+j0T7V2HyH8HqIgNFsvlT0i0wAGYSHxahD8vHL2j26ctaPzxYIjCXFtMDL8/z50XdJ10YAmXMy
	M7AzXbiQZ4EyNIS0sU9Yw69jN43X1UjsLkC1FnZphTlVk3Y3+tgkeuJ+k0wSMfD6o9FeYgBvpUR
	Yyl9V5rMhmJwCyxl6J/P06ALnqNQepgDl8PfIsNucifydOSMcs9i7m5vQID+z6hWqXV4JFAARF4
	SxE8DcE4nqnK/7yOnpW18RWyb23/jHrva0tn4Nh0T5rSusCAcvtxUwQQWXZbDJdneE7dmpLFiLJ
	Fu9mFyCFoiUERhqoCH9SZ/ugmDjjjz36ON/U4nGIV7AW27UMMqfDBkKvXVMVR1tF0ZKF5c7c2
X-Google-Smtp-Source: AGHT+IH6i2Rlk1oZZIkubpWUyVstEoqiFYIwX8SUUvSh7jWZ3DNV3Wa4AF6A7KNkrZ7i9r1nUbzyjw==
X-Received: by 2002:a05:6000:4023:b0:3e7:5fca:2177 with SMTP id ffacd0b85a97d-3e75fca25admr2356651f8f.11.1757598589695;
        Thu, 11 Sep 2025 06:49:49 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760778915sm2608361f8f.12.2025.09.11.06.49.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 11 Sep 2025 06:49:49 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com,
	roypat@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH 4/6] KVM: selftests: Fix unaligned mmap allocations
Date: Thu, 11 Sep 2025 14:46:46 +0100
Message-Id: <20250911134648.58945-5-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250911134648.58945-1-jackabt.amazon@gmail.com>
References: <20250911134648.58945-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064951_564462_11627ACA 
X-CRM114-Status: GOOD (  14.23  )
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

From: Jack Thomson <jackabt@amazon.com>

When creating a VM using mmap with huge pages, and the memory amount does
not align with the underlying page size. The stored mmap_size value does
not account for the fact that mmap will automatically align the length
to a multiple of the underlying page size. During the teardown of the
test, munmap is used. However, munmap requires the length to be a
multiple of the underlying page size.

Update the vm_mem_add method to ensure the mmap_size is aligned to the
underlying page size.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index c3f5142b0a54..b106fbed999c 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1051,7 +1051,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	/* Allocate and initialize new mem region structure. */
 	region = calloc(1, sizeof(*region));
 	TEST_ASSERT(region != NULL, "Insufficient Memory");
-	region->mmap_size = mem_size;
 
 #ifdef __s390x__
 	/* On s390x, the host address must be aligned to 1M (due to PGSTEs) */
@@ -1060,6 +1059,11 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	alignment = 1;
 #endif
 
+	alignment = max(backing_src_pagesz, alignment);
+	region->mmap_size = align_up(mem_size, alignment);
+
+	TEST_ASSERT_EQ(guest_paddr, align_up(guest_paddr, backing_src_pagesz));
+
 	/*
 	 * When using THP mmap is not guaranteed to returned a hugepage aligned
 	 * address so we have to pad the mmap. Padding is not needed for HugeTLB
@@ -1067,12 +1071,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	 * page size.
 	 */
 	if (src_type == VM_MEM_SRC_ANONYMOUS_THP)
-		alignment = max(backing_src_pagesz, alignment);
-
-	TEST_ASSERT_EQ(guest_paddr, align_up(guest_paddr, backing_src_pagesz));
-
-	/* Add enough memory to align up if necessary */
-	if (alignment > 1)
 		region->mmap_size += alignment;
 
 	region->fd = -1;
-- 
2.43.0


