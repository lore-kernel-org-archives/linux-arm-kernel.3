Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C87F436BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 16:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THZKYqCh3zVO+So/kaXQTTcEeZfZWD5YDDISxc7lZyg=; b=Wj6tZWA83vrjQS8FloOslRg8+m
	9NRAleoFUqw7Xoub185SO/SwWdO1y0fUd9+boMYqQDHMpF295FOeGOWvlQl3VjVpDFum1jqJ30SmM
	J3wcoP/KfNkhIgGI5vNBHgXdtuDdtNIaH9lumzX+9yfM6UYhOzHYSe9sH6r0PW/8PHw1BSasBHU8m
	bTOTB5gN/CYsKaFN5EPT7/VWcYRqUn9Tv3deRDwqac7BlZ87q7Lc1pJHmq871QDdQAISWbe0uv7oI
	l0pBWbdmRFI/YbVVNZ8CO42R6gut+JnE1q6XtOGR/nRC9vMGmkUxuq7ufXwfZ0+FY4SBZur11fzus
	pDbO7rSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmLW-00000004IGD-2j0j;
	Fri, 17 Apr 2026 16:47:10 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmLT-00000004IFp-2miC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 16:47:08 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b258636d16so9084305ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 09:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776444425; x=1777049225; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=THZKYqCh3zVO+So/kaXQTTcEeZfZWD5YDDISxc7lZyg=;
        b=wOBmwVX+0E4SmRqsppeLOGd36Veet0yEQmceOWMypme6NXM40D1whl8BTBojNmRSCJ
         Lghg5yLepLqA0+AM37ccZCB1C5rOK4T22tUrO0qAMTDgqJ5MmPxl8x1UDb4MwPuE3BAB
         XrbZTCQpasX5ueO9SkEbAXnN06U2z5bwpdWJN5hePmD6bB65v/FBKp8w7yEC2CxYEsGQ
         1pzWJyiRDTflu5Ymcw1nTOrnN7I37lslA3PUJJ4DTX5kFl+PDfMMvCXtG9gTIphfyarW
         Ee0xGOkWOidYLSyqzebEx8JN/Y54CQZ/tOk20hrvfnSnnoXPPpdt9hrtMGF9zpwWow5q
         XCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776444425; x=1777049225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THZKYqCh3zVO+So/kaXQTTcEeZfZWD5YDDISxc7lZyg=;
        b=r7p45y8r5HDKewyqm35FTiGYYkJvb18RtnabqYPau8y1xHazVNpQ87gp5x6d5RZhRv
         vAU/X9DkPTWnsKeXhfanAk5MWWHEcwAPA4mUx5fvhiYj3yEM+RFHXkplMb8KGvv3P4RH
         enNcoDcfsEmgRMy56sTNQkZATEkY4nMQuAm7LC7XDxkiPgDYSRcaqxWCZvSMxWGzVl21
         tVEu1bM8KU7ra2M9hLumTndqEylZkGtZKp4pRmmTjUny2FLrtQ7s1/IWHSG7Za29fD8f
         hJ0wmXUmI8/pSGJ2mLpkLRgZ+A+6rwf9D9ndmJ6Ny7QXRcG4EFlCapBIxXUvS1mZWDi3
         V2kg==
X-Forwarded-Encrypted: i=1; AFNElJ8YqkWvAqp66D7TJFVZK+jwS2lLafynlVSyfb+DlztVYV19IdKKIaCm/Xb1/ypInCp8mdmcl7IBeQ7ojXRcUPyl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx17en7TE/R/0an/Ef1VjdeX90voYltok31QflxKMNYie0v0hQs
	bIUjnWRPIsxvJ+IxyD1pBoDWykgQ4MvT62Z7+pEsuOPT3HPoiGxbPSRipFgEyDIO/MGEeUm8JEU
	WDiBDgw==
X-Received: from plbiw7.prod.google.com ([2002:a17:903:447:b0:2b2:46d7:4428])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1ac6:b0:2b2:5840:808e
 with SMTP id d9443c01a7336-2b5f9ee9487mr37665585ad.10.1776444425313; Fri, 17
 Apr 2026 09:47:05 -0700 (PDT)
Date: Fri, 17 Apr 2026 09:47:04 -0700
In-Reply-To: <0064952b-048c-455d-ad89-e27e5cb82591@linux.dev>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-25-seanjc@google.com>
 <0064952b-048c-455d-ad89-e27e5cb82591@linux.dev>
Message-ID: <aeJkCGwsrRmuBikT@google.com>
Subject: Re: [PATCH v17 24/24] KVM: selftests: Add guest_memfd testcase to
 fault-in on !mmap()'d memory
From: Sean Christopherson <seanjc@google.com>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_094707_770346_BB750063 
X-CRM114-Status: GOOD (  18.22  )
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

On Mon, Mar 30, 2026, Zenghui Yu wrote:
> On 7/30/25 6:54 AM, Sean Christopherson wrote:
> > Add a guest_memfd testcase to verify that a vCPU can fault-in guest_memfd
> > memory that supports mmap(), but that is not currently mapped into host
> > userspace and/or has a userspace address (in the memslot) that points at
> > something other than the target guest_memfd range.  Mapping guest_memfd
> > memory into the guest is supposed to operate completely independently from
> > any userspace mappings.
> > +	vm = __vm_create_shape_with_one_vcpu(VM_SHAPE_DEFAULT, &vcpu, 1, guest_code);
> > +
> > +	TEST_ASSERT(vm_check_cap(vm, KVM_CAP_GUEST_MEMFD_MMAP),
> > +		    "Default VM type should always support guest_memfd mmap()");
> > +
> > +	size = vm->page_size;
> > +	fd = vm_create_guest_memfd(vm, size, GUEST_MEMFD_FLAG_MMAP);
> 
> This test fails on arm64 when vm->page_size is 4k and host's page_size
> is 64k:
> 
> [root@localhost kvm]# ./guest_memfd_test
> Random seed: 0x6b8b4567
> __vm_create: mode='PA-bits:40,  VA-bits:48,  4K pages' type='0', pages='660'
> ==== Test Assertion Failure ====
>   include/kvm_util.h:683: fd >= 0
>   pid=889 tid=889 errno=22 - Invalid argument
>      1	0x000000000040262b: vm_create_guest_memfd at kvm_util.h:683
>      2	 (inlined by) test_guest_memfd_guest at guest_memfd_test.c:450
>      3	 (inlined by) main at guest_memfd_test.c:491
>      4	0x00007fff8f56af3b: ?? ??:0
>      5	0x00007fff8f56b007: ?? ??:0
>      6	0x0000000000402a2f: _start at ??:?
>   KVM_CREATE_GUEST_MEMFD failed, rc: -1 errno: 22 (Invalid argument)

Does this fix things for you?  If so, I'll send a proper patch.

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index ec7644aae999..c682bda722f9 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -510,9 +510,15 @@ static void test_guest_memfd_guest(void)
                    "Default VM type should support INIT_SHARED, supported flags = 0x%x",
                    vm_check_cap(vm, KVM_CAP_GUEST_MEMFD_FLAGS));
 
+       /*
+        * Use the guest's page size for all accesses, e.g. to avoid having to
+        * map multiple pages, but create the guest_memfd instance with the max
+        * of the host or guest page size, as KVM requires gmem files to be
+        * aligned to the host page size.
+        */
        size = vm->page_size;
-       fd = vm_create_guest_memfd(vm, size, GUEST_MEMFD_FLAG_MMAP |
-                                            GUEST_MEMFD_FLAG_INIT_SHARED);
+       fd = vm_create_guest_memfd(vm, max(size, page_size), GUEST_MEMFD_FLAG_MMAP |
+                                                            GUEST_MEMFD_FLAG_INIT_SHARED);
        vm_set_user_memory_region2(vm, slot, KVM_MEM_GUEST_MEMFD, gpa, size, NULL, fd, 0);
 
        mem = kvm_mmap(size, PROT_READ | PROT_WRITE, MAP_SHARED, fd);

