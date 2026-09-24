Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79787C98313
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkmHV8teHowj2m0K9pJEIvKKL09RFM5c5Z/D26hfzoc=; b=vQRRUaAFQW1T/N7V+KkrjDMTvt
	yE9v3UFbhBJFRkKwkxfieFcOX7qGs1XqyOcxHhmU4r6hjkTn0kR72ZyNAB3di3u2J66hj6CM9sMx6
	BYecYskHPMlgbN9I54FGBEZMFgA+jyvH19vsmg8KWQU8ZtpIPH4n4U2+AM4caM+EZqfYow2i17rPc
	9IjRaOO/Pow7MPPg/U17WbXlS2tza7o7W4EWTAv2fME3zEqn2nI0I/7V+z1NoEnbwPeFbwVyEsEaI
	IZBMlowFp4RV4AnkmHr/hV+LD1/UbvF/+2s7wkrlHFgCpDRJqJlJr1K4vFHkLWFkZvA2pJuRIYtHy
	fYS3lzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ceH-0000000A793-3RKK;
	Thu, 24 Sep 2026 06:09:37 +0000
Received: from out-23.mta1.migadu.com ([95.215.58.23] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ceC-0000000A74m-0ZHP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:09:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=EAQiwSLU8WvEPiMz51OeeUlVyfvtoZuDVj/Ws6zFfEs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790230170; v=1; x=1790834970;
 b=mk2ooo/TdUwU6oDq8hre6CGjmRtyV6y2wztnRNq9mzivc49G1D28TBxqZvTsCrM7CqB6J2UG
 JOyS0vgIW1NwRFFJMCV6yEYFPZDkMqnsRNeCn1FTlvPSboassVjflfA8L6DXdq+Rlssk3N/GJ+P
 FcIbaJ5GQpmpst/uzrVcO6QA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9f796bd7d08a3c71;
	Thu, 24 Sep 2026 06:09:30 +0000
X-Mizu-Trace-ID: 9f796bd7d08a3c71
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so3505e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 23:09:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx5yJqh+8TvKtXUESn3t8u22nQGhk7ixq4CYfCsXs6Jq0bl32yEPta00gnpx5jjI9hWllowVi+wUlUFylFPMNbk@lists.infradead.org
X-Gm-Message-State: AFuF++miTnIyWCDzakpmIRgDAGnwBmN5zbgK+ZN4jl/1H4hcQFExX4jm
	cG/hpt8J5wbW22/1NeArfaV6KA1CEv5TqxdG3iQWiWRVTGzNYue86r8IncYWYQMgdJgzEaDfj5Y
	6NIz2YO4K/OWNIsLFo0mCeXx+yC6Qnx3nXUNXv39q
X-Received: by 2002:a05:6512:ba4:b0:5a8:6646:d7b4 with SMTP id
 2adb3069b0e04-5b8de3bb43emr120128e87.1.1790230168511; Wed, 23 Sep 2026
 23:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org> <20260923-kvm-arm-prefault-v4-13-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-13-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 07:08:52 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyPyy-Z=HAMOz6pUHrz_X4O+Lx3cQ6Ay_Wt+tnc1WDU_w@mail.gmail.com>
X-Gm-Features: AclHuK8PM-gKMDq-u5QWjDRmdsBji-o2uwHNqiDgg3TNGtYz82rPBW9_kKwo1Hg
Message-ID: <CA+EHjTyPyy-Z=HAMOz6pUHrz_X4O+Lx3cQ6Ay_Wt+tnc1WDU_w@mail.gmail.com>
Subject: Re: [PATCH v4 13/14] KVM: selftests: Add option for different backing
 in pre-fault tests
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
	Jack Thomson <jackabt.amazon@gmail.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_230932_396255_18EB721A 
X-CRM114-Status: GOOD (  10.27  )
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

Hi Lorenzo,

On Wed, 23 Sep 2026 16:15:56 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
> diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
[...]
> @@ -189,24 +195,28 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
[...]
>          test_config.test_size = align_up(TEST_BASE_SIZE + test_config.page_size,
> -                                         host_page_size);
> +                                         mem_page_size);
>          test_config.test_num_pages = vm_calc_num_guest_pages(vm->mode, test_config.test_size);

With -s anonymous_hugetlb_1gb, test_size becomes 1G and setup aborts
on 4K guest modes, as memslot 0 has no room for the page tables that
map it:

     No guest physical page available, min_gpa: 0x180000 page_size:
0x1000 memslot: 0

As a followup, could you compute test_num_pages before creating the VM
and pass it as extra_mem_pages, as arm64/sea_to_user.c does?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

