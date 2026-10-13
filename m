Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79534CC6B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+SkemdQ5RdIVSDhFwk1CDFjL1ey9nZZXcddJZzDyn0=; b=SLeCDaO3Bj7axkv3MPncyMaOjt
	StjkFNss3Gajk6ooGPzNrOqguUqJBIqou7s0f4hepmSPitMCy3Ch/VCWvnjqB1eu7g9yWzmqUcMqf
	5FMDgYRlYKH4EtvLPPLPt9ogihOkr2UAQtcQus1zodUMSxLxdFGGt3vD9R/vKdzPooeCoCxJrHqyM
	Lg/0CUoQhPF/AA/LU3F3pQ38LKxfRPzLUbkTxgv67YNga8H2vAC6ozC4rUFmzxIfLXHOIDi7NzacS
	ji3RPQSFpJELnHxv980KI22UvD1GI+v/rrdH9Q3ribOIod+HeHBVAKzjCu1ZgFbNO7814FhLvX8v9
	LSlgM29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGei9-0000000DPVE-0v4S;
	Tue, 13 Oct 2026 15:46:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGei5-0000000DPTf-3Mii;
	Tue, 13 Oct 2026 15:46:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 210DA1650;
	Tue, 13 Oct 2026 08:46:33 -0700 (PDT)
Received: from [10.57.13.106] (unknown [10.57.13.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C3783FA32;
	Tue, 13 Oct 2026 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791906396; bh=0+SkemdQ5RdIVSDhFwk1CDFjL1ey9nZZXcddJZzDyn0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lRhpxucs9r1hSijFNWdvNkrzvM+4YX3s8AQOkMMLTKiDkd8+VFpyiYfcSLMqt9IMJ
	 3VFIrdHZ8R6/NSTrS86UQbde7kSX4GQddPWf1kMf8bMHsbMZ5DaO09ya3CYUSyLmIN
	 qQRasCGUPcCGBWQSeFCJyxvTeA2ok7m6/IW+K14s=
Message-ID: <3eb77f76-1558-4b1d-a8ad-d25da8b0b68c@arm.com>
Date: Tue, 13 Oct 2026 17:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] riscv/mm: fix missing destructor for hotplug PUD
 tables
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-4-songmuchun@bytedance.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20261010112457.49485-4-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_084637_888853_25DF69EE 
X-CRM114-Status: UNSURE (   6.03  )
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

On 10/10/2026 13:24, Muchun Song wrote:
> Commit 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel
> pgtable alloc") made alloc_pud_late() run the PUD page-table
> constructor. However, free_pud_table() still frees non-reserved PUD
> tables directly without decrementing NR_PAGETABLE. Free PUD tables
> through the common free_pgtable_page() helper so that
> constructor-backed tables run the matching destructor before being
> freed. Fixes: 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special
> kernel pgtable alloc") Cc: stable@vger.kernel.orgAssisted-by: LLM
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>Acked-by: David
> Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

