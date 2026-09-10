Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB3EC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=; b=IbRDHPct1IDbo0+8OWqp/f8EZ5
	te36ixrzU8kbKT3rZ3kKGhqGUdJEdz+jslfUQ/7tqw5I0B2/v3Oqz/T+LyshLiTyOYFsK1V0L8ay0
	XCkBGJvZ6ukM4u02dhA/3hSdp2cSmfshBb9LnIgGLdFsZS2gVqvtmeZkvluMywpMHBgPM7Ax+vaLh
	LXsYB2yRxe825upfo2L9xwdV4zoTUQXHPalUUdeNL4bknDwDx/WgeHl8dy5sZIefJTyabngJkY+P8
	AU0eC/0YAohQdcAS1hrXQI0LSDaVcJhzSuf/9s23MMctkPDUlP34Mugm3S5nI+So4/R5+2Hhewp+g
	GzJOYVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YMz-0000000DWfV-1SZM;
	Thu, 10 Sep 2026 06:34:49 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YMv-0000000DWe6-0LfF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:34:47 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-39682983a0fso7457944a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022084; x=1789626884; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
        b=jcHLg3DLryz/LmqgqW6DgVA9xbuIk/1iNGYkocVjPj+3mFYXrtbAAHvFE0t37u0+az
         3soVBwmYt4/qTfQtdeJVDCOpblbg5G6Gs2V9jhtWlM+ZyzVPbad4NhotF4bKwTcUkpV5
         EMwJ9uAWGy7VjUrE82Y6IhuDUtJLbY+Qv+epkov9euJCTwJ2gRl4Hu4oBj0w6y/b4/kQ
         Uy2pk7zg/RUHHLv2v1VrujmFNG1u9yz+cnrYEwaajit71h/cCb8aB+ANZISWJpYHfedI
         XrE6F0gXy15T05tGrau4PwDAzEDOld3wnzAe61hy9Ed9PE5obt2mRV8PysT5jTxCfu4i
         /cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022084; x=1789626884;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
        b=BjgvkNdALtq5ug9xOwkxjUOplTuplEDZ8W/CDGX0RQca9EJ+XSXasBFVR0rS+/1ski
         I0oQbgP2k3SZE+pVwbf/cs5mnKqvXpQA3G4f7viH7oqAQznZBH5Qxsoby3jOzGKtBJoo
         DJx9sgaNpBubn9q2VvRZd/Bj4cVLrks6iDfZVQ0nMzMFIYA3ba91q45mP/Ia2CiZdx+Z
         v5S9/W2nQDp2m8rRZRalXTWCltg+EcK62eKDgUzSH8iCby5SuIn+2Kf/rTDN6H1XQ3ks
         gMZqT3vyCXUHgwmyv4VcokSRjOFmbOj8VA7t8y3IeIu7sIZvyWVLGMy8lNBg06rlUvyB
         s7fg==
X-Forwarded-Encrypted: i=1; AKwUvBxbHNAWO55Jzly1xaC9UW9B7Lq4dm6vngAAp3AQPu8rJblXH3nf5apbEpDqnjl5CdosYVdymYWfectgcl98fhM+@lists.infradead.org
X-Gm-Message-State: AFuF++kGC0sS7vTrpbL9reOs1sw85GjIdJFycxWMxVybINQQHjCvooL8
	eq/qmL5Hx79BhbfR5KFPkJwlpp94hap6Q+ArqtUnZokdNRH9EM65gKMt
X-Gm-Gg: AYBFou0B6e2Cn+IZE0UZnX8/Nr/j/Mg0FyQOi9ugRe5pORixYoHvW60BX7R3/1yOmHe
	0IlZ6TY0esN2kX3zICVekih+MqdogciERHrKX5Qs5o1myn4Kkkq0rTLWicbPCQnKfjTLOjGwK1M
	YYC/gEhvtGrzqkAlVmwLNfFbdbWN2hENYisyLISZlSEcmOr4Mj3rhMZxGhcbIkXFvIL+tIfSdb6
	1UPseI6XICilN1d8/vAc7KGGbzv4wJR1Q/CJl9yeh+PmNjRcH8pUNtxRh9aWkQRZetl/BAo1zMK
	tK9F/G1c6zIWGY2aB877+eLfqyovBdfyMlFCq9Y3Eo7zZ6VQ7nVA/Ko7Gny7h0kMJcMmo2mqYXv
	SWgSlO0BwJLzp3cS47jZ38RBFZxXadqOiqepZQfrFuEJdj4H2BO9O4XCK4je0DfgELLeUEC83No
	K1tysJJU/PvwB9pYCg7Seq0J8nThwkCuWA6G0VeVU7pNWJuM70+PSvwH1tQDTDy4nPg7N4n28B3
	7XIQf1mGNMVz7hmqr5NZLqi5189hB33OPfsn1mwzlR7iZx0K9ljU4w=
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr57429977a91.1.1789022083690;
        Wed, 09 Sep 2026 23:34:43 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm10434389eec.20.2026.09.09.23.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:42 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 06/20] KVM: selftests: Extend page allocator to support naturally aligned allocations
In-Reply-To: <20260902164123.2546762-7-seanjc@google.com>
Date: Thu, 10 Sep 2026 10:57:06 +0530
Message-ID: <fqzh1xsl.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-7-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233445_120288_5E4785DD 
X-CRM114-Status: UNSURE (   8.12  )
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

> Extend the page allocator to support naturally aligned allocations, as some
> flavors of PowerPC page tables require multiple guest pages per table, and
> those tables need to be naturally aligned.
>

That's true.

> Take care to align the potential base address *inside* the retry loop, i.e.
> the base needs to be (re)aligned on every attempt.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Thanks for sharing the changes. Looks good to me.

Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

