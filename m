Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CEEC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=; b=Hug4Nksd2Z7n1mhQCqAqT/X0jB
	gHwxIPq3jL8klsigVmqiPR8FIp7pThdR8fE3f+Pp5C+80QdjT9q4dURTISvGDkm4hnTwHS2Za6nwa
	TzhYmdK0KUKbY5zw3mq4hUHiqCs8P19UawVqr88YNgfCQT6diE2Die8dM8W+VtVy2zkujY+I+xxnK
	DleU5p43DWgr3TK+RpX4e3+4amopDlZxKrGYkyrYmXDsyqzFbf5m02uh5MTaj5OWHfPagDiR7j8Oo
	u+MmxK36rQ0JV9mxk10mabf3QSWiPVhduOGskHsKmdlLqEGj7QfUYJi8NxXcVpL6xyFEQvRS6LTQD
	H+7W1spw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cd4-0000000EA0Y-1i5e;
	Thu, 10 Sep 2026 11:07:42 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cd1-0000000E9yg-05Nk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:07:41 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so5822667a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038458; x=1789643258; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
        b=qsALKBLuc6lRqR5oN/vSJjJYT7w7eMasGac7SBilwBbckJ02iesHaDh67Ye0NByrtw
         YGYvTT/L+zDcpLTJUt/Wo1qNINN4vzd3cHAqx0IJpsunfacx/v056DCEJetaEDiuWxPU
         0Gb+3975X8l6JAMfE0ZQAqiApcVY7SdmyNXaDriFuIFy7j5z1sSXobZtm9wVEJ5GIT9q
         0rdYjOd2CBdNqxN3H2JXXJnA4/tkmRhSn4YY77LEUdzBZuRzklRJyN3rciDPWjuAYfYU
         faM9YtPZhsrEgBZO4N1eNat242aMPsmkIdPcmF6/2f09wmP0WtKNhx4XI/N4pKa0mNyq
         xCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038458; x=1789643258;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
        b=JSFLrGETOb9ScnirVr2FPAfYoBS9UwD5eKsvQtHMLqKMenMw9sI1kLUvIVV9LrIBsK
         9fiYPUACUxPZnKLuuYeGl5HXM90G/AX2ljal+YJtADajZvo086Fs92Tiu5zE/mKdHnnv
         pKakZPCTys9u6rUE+PoZ/HuSGqUXfqQSO0j78IiB3+LM6qM82oRwR4NGn+MgU5zTsJek
         tlJ9+PsWpvI2zl+RMnuKR0J9Bvku5CvqFYsY1viS7nCIn2HvKP89p2stuFfjc1II0v/m
         t/AFCoL7VgYg5gWGTx4As5nJTyjmgeM6v4wYg64yD8i7Z4eBRs4739MlAdmCti4sJNPH
         zPrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFdE8hlRLzXgUKpMBkhy6nTqVlQh53Y3moVpw5tcIGYRwIAENSvjiwFmEZLINZ/y8LRWSkQIGSI5umSUstImEu@lists.infradead.org
X-Gm-Message-State: AFuF++n40+8/U18hmBjomqj4+v4O/UFUMKc9DBQ4gPAkJ94fvrFl2oqT
	8xX3tVNQsehqsMS8i8e29EAXPIvhJmmlvxl7J0hyL7uFvuWKpJ2abriu
X-Gm-Gg: AYBFou2/Es0cqLxTLaiY73sJdkcAZ54z1upNQNBE8gbpUHTJc6Bg0jE6YKwxUv9mGI3
	NZqSgEWCw7m/rOVnVoUZOjShHj0PRQ8QKCGDqiiojnygMA5EyMPFBhoAOXEHhZoKMyOkRwxVA3r
	Gn9FHcLCstJbB6W2BHnJ/Qw25OUz7uIK1uqSbgFNeu+/KqYKE/EBO61yiyOsLJ7iewIc62KNWgZ
	9j68fwhfSmavd8SC81Iumvgbd0xYXSGatl5J73ihQHwSW7ky0z/XfUbftK1K8wp/pWoiktnaw7f
	DGG1Rynk4Uj6yY0XZxgWJBwH1PkiJ+RtpoOIqelj7t/ym3dTFiA1Ige0UZGypOY2xHejelw0zu+
	MeRg7oYs5o2V2JjBWqL1PQG4q4WPsxWqUZjExy37L3/5d+SysrtBH+QzF1QU++CK3PEKUuUB6Fx
	/sMbPvEKRMzb19poN2Cx1c7xFff54GGkGR9N1iIaIG4ESBZfiyYhZXFA1B3n9Ud8bPbYIrzIGjn
	VPC/erIbNVhgOgQ91NWBItC2R74Vt2UU73qqd6FUO6Wj0wYOXYAL+8=
X-Received: by 2002:a17:90b:1b06:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-39b2622ba26mr58218547a91.19.1789038457819;
        Thu, 10 Sep 2026 04:07:37 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm43023781eec.6.2026.09.10.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:07:36 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate multiple page table pages
In-Reply-To: <20260902164123.2546762-11-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:34:41 +0530
Message-ID: <8q591i5y.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-11-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_040739_060009_8A126BB4 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
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

> Add vm_alloc_page_table_pages() and use it throughout arch code to replace
> open coded equivalents.
>
> No functional change intended.
>

Straight forward change. LGTM.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


