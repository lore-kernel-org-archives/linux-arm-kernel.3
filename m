Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0670BC98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsmgnhaFqTMEMgV8Zn0uR04tPAkg7R3E1Z3BnGPBPGU=; b=sW2Gz8qE4jjyIjdV1h+GeIue85
	caU9AUmS23vzE2+IHG02/9k2qYX3aojRVK1LelfJJ9NJ3bVU6mnPDAH6FJWG+RqoYPARIGQ0ky+4d
	JHT/FLf6jgfULVxT45FxUvdI9Tpu43fZF7fcx8dhh47f4iNzmMmzdIr+TjEBlQQKxU15ZkryjxKep
	MAxg8pT2eFM1Kgv/eMDy3/PmA/x0rYEnb4NKj9aAgH9tf5d+RM8bAKSV5AcFEQW66V3cr+q2dQXLw
	A9fEjDCHxPPLrnwGdvvka9MO4i1nHRtKsx4JMI8Gqmuut70Lh6S6ksR5+cus2sIdfUjMhLv6Le+no
	M2TiZsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eoS-0000000AQfj-15ly;
	Thu, 24 Sep 2026 08:28:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eoQ-0000000AQfW-3vBi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:28:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 426AD40B14;
	Thu, 24 Sep 2026 08:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922081F000FF;
	Thu, 24 Sep 2026 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238494;
	bh=GsmgnhaFqTMEMgV8Zn0uR04tPAkg7R3E1Z3BnGPBPGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AkMJC5JAXk/pX/+kR1K2A+X2qR9dHg/cylkIMUSRwxnRpKTJ8o90TZd6MY9zQFCgt
	 OqAf46Hj4z8Mm/IgP1xpEh9SMBAnhYIqehxrr1GWRYnLDX5YCkgJDQLpAhF7xz8y+p
	 WB6yMcowxeNwJSKaCYZk2KnXTLf6vcUYIc8o/MXvCU/4SHrXx7guEr5MWwkscKgopx
	 WwInTzGX2U50sJSoJ/pD7y/ZcejotJCWowo8ra/iIr7o6GyeHHr3t9tt2la+h/6Hu6
	 YzO1iqOvVMXiO5kuKSXZ5sITsGtan+25tRvkmvx82GrE3OpJFbPXDsN2aQojmTeehj
	 KpCOSPkuwbljg==
Date: Thu, 24 Sep 2026 09:28:02 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	David Hildenbrand <david@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 13/14] KVM: selftests: Add option for different
 backing in pre-fault tests
Message-ID: <arTe9AprfA3CVs9Y@gremlin>
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
 <20260923-kvm-arm-prefault-v4-13-d4b0b4dfa8c3@kernel.org>
 <CA+EHjTyPyy-Z=HAMOz6pUHrz_X4O+Lx3cQ6Ay_Wt+tnc1WDU_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyPyy-Z=HAMOz6pUHrz_X4O+Lx3cQ6Ay_Wt+tnc1WDU_w@mail.gmail.com>
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

On Thu, Sep 24, 2026 at 07:08:52AM +0100, Fuad Tabba wrote:
> Hi Lorenzo,
>
> On Wed, 23 Sep 2026 16:15:56 +0100, "Lorenzo Stoakes (ARM)"
> <ljs@kernel.org> wrote:
> [...]
> > diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
> [...]
> > @@ -189,24 +195,28 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
> [...]
> >          test_config.test_size = align_up(TEST_BASE_SIZE + test_config.page_size,
> > -                                         host_page_size);
> > +                                         mem_page_size);
> >          test_config.test_num_pages = vm_calc_num_guest_pages(vm->mode, test_config.test_size);
>
> With -s anonymous_hugetlb_1gb, test_size becomes 1G and setup aborts
> on 4K guest modes, as memslot 0 has no room for the page tables that
> map it:
>
>      No guest physical page available, min_gpa: 0x180000 page_size:
> 0x1000 memslot: 0
>
> As a followup, could you compute test_num_pages before creating the VM
> and pass it as extra_mem_pages, as arm64/sea_to_user.c does?

Ack, can look into that and send a follow up patch after!

>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks!

>
> Cheers,
> /fuad

--
Cheers, Lorenzo

