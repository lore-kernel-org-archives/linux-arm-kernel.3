Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E62C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5p0fnZhfsutRgdRJoA23rs+n3VC6+9xK2KvWtfvI90=; b=hzpfoQSkh3lwPLmnXWyu+nayUW
	rSdWBUw11hqdufIcbYJGsMzpuiGYk6HeU80GRlwAEO/UmRdf0xnwn6YfFBWhBv5zbYVCkru7Kavw5
	lAUAokip/KP+RHgoqgTYnkEZq1qOn74C/VJZYD6IedqjIWe3acXqxrmSng5/SRDkvJpFGgHBx2iHK
	RiX0Pi2QjhkO1rHgAyg3oYdXZvrCpniHHU+OAa42KsXpo5equwr4RecDFUEkr1sD1NWnJ5MLrRc8m
	dAiJVvTcJEJJzR7SJd0Z2kRS3hlbeg7J7WTKO/MoOeXBZYD7+XqFvBVEWwKSN1+Lw+5QxeNZXUbc1
	xmWQOEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dWz-0000000EIJf-2p4Q;
	Thu, 10 Sep 2026 12:05:29 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dWx-0000000EIIo-3YnO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:05:29 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so289912a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041927; x=1789646727; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j5p0fnZhfsutRgdRJoA23rs+n3VC6+9xK2KvWtfvI90=;
        b=d3zaaHPApCf6kyW9z7pmJzrLfKhf29HJLpjSA5dsEssqMWqLIjsj5S0SSjoj5777t7
         H6FMfpsl4EqTxPa3t82q9XgWdMdmO4zBn71X+9BoLOw0coA4b1XzTZBm2V+BXsMz0eah
         cxq6I+n7hbeewF8jWQmKF0N/p4XNbWxiuOwfEThdwUKJL5PlMSTJFepldUcvon7UgCg7
         LFTrzpjaczFO3/YSuSXPZLnC8hEZU/IwI29ksZlPynEM10ctOHFqvVLVqOsO3UmhUnO/
         qCbRrP2BvpKoPgpcPCNW24Hj16/9E8UoqNQiryr+Ii4aJ1wDUpzpStB/iWgGdPbVD9c8
         bffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041927; x=1789646727;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5p0fnZhfsutRgdRJoA23rs+n3VC6+9xK2KvWtfvI90=;
        b=JS/35c7J9QKoJdHMlMpqHogrY9dVSxZKEfqIdmK34tRz5Ecaoik2HkpqcJ4kWwX9tA
         Iy01xhX93Ehuuo1SfKwTYEHaFaogax+6/H2aX8Eur6r975tcTKN6dArnh/VyUB//tJwj
         YPnpjvfqegi2/etvmLzjJw6Lp9hzWMoNZIgESktKhSTbJivZbkj1+0gExinMKQpbIFCQ
         jtBw+87B8fpB/UL6TM1j2N4tiyf92U1o0aDoPpOWWXww19hrPWAlyluYNT7/L+Qn2yTs
         bztqUSppzEzf4VNM7GsOFCZus9UONE81fpB1s5QZdgsGM0xJs5ZiwELw2LShUcnPSAiz
         //hA==
X-Forwarded-Encrypted: i=1; AKwUvBxSLUhqlQ3oI/D/0/oPKymGdB7ezqL1kVvGybnul9xuxkaG5/xRLFLVtCdwHWW84n2RS5l75VZ2W4T11IpiVjPz@lists.infradead.org
X-Gm-Message-State: AFuF++mxcqkOU1SR6RPuJp+tUly+l4c8j+yTdmmsQ7bRVyGj8wJH/NlM
	9/XGCkqaCnwE+auEBoNir2YT7N7LwaS9ucgjczS6mcKc/R+a6mv8Zk4+
X-Gm-Gg: AYBFou1iczg2MQ1MmKh0/yQN6nOMJ7OFCxSgezRheTiKGUwJDPDd6CAvK++0PK/t8AI
	nhsiFE3KOzWVb/EQ9xDNxubsxTUA9Zlz1XjCWDfRpTdxI3bD3DXB6yhZNbEtlb5vp88IN6Dx0vM
	JR+niadWxt0MPgU8dMX0vGVT9nvftr0iG4oleksUivJOvu0mFqoSEDqAn4p8v1KAvzEGOT97YLa
	eDnIUwwZdSB0wp8mmvoFAkNVV6/LPhiqF/eQRD4UJ/pIevCO7yRjgQeGlFKPvD8VWjd1BmBF1mO
	ggWae8ioMDgzIBFoE2KJ58rAOZaTA9/foTEyvygmF0N7gQyYTfFdkookQDwBSxY7N+4XpRaCQey
	rJ9CimScZlsVEfvGiV+qoDfvHcpofSMsE2OncRD3cqmtr+nsrrPtmBiS6pG6YIY2baDzrku21Ql
	a9Fujvjiq71GliG8LINlQK9BGSCPKElZVyh64nbWJN1SexPQJbH7SaGKhX19//De3rMjV104V8X
	bhxo7EyKu8I7uVbe6T65kAfbFRi4XzuSMPMx36ASdjYl7EDS+lucxk=
X-Received: by 2002:a17:90a:ec8b:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39d70bb1bd0mr11567376a91.19.1789041926812;
        Thu, 10 Sep 2026 05:05:26 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm59190560eec.21.2026.09.10.05.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:05:25 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 20/20] KVM: selftests: Add arch hook to force page tables to be naturally aligned
In-Reply-To: <20260902164123.2546762-21-seanjc@google.com>
Date: Thu, 10 Sep 2026 17:27:18 +0530
Message-ID: <zexpz5cx.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-21-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_050527_890342_70B182DA 
X-CRM114-Status: GOOD (  12.07  )
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

Sean Christopherson <seanjc@google.com> writes:

> Add an arch hook to communicate to the core physical page allocator that
> page table allocations need to be naturally aligned.  The hook will be used
> for upcoming PowerPC support, which has MMU tables that are larger than the
> guest base page size and need to be naturally aligned.
>

Thanks Sean, for these patches. I have addressed your review comments on
v3 of PPC KVM selftests support and ported those on top of this series.
I am still in the process of running the entire series on a real HW
(and some todos/minor changes to be done).

Will soon post v4 of PPC KVM selftests on top of this change series.

> Bury the hook in the physical page allocator to avoid having to plumb a
> rarely used param into the main APIs.
>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

As for this change. LGTM. Feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


