Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51C5CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 09:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7B7TgaAJNDdxFCAT6n7BBRtHLR7fn0ke7ZNiMxn4Uls=; b=NCqtCykSINcywQisUeDQOQ/q8V
	CKh4Zj99VAwouOqKi8BOLYaFmZboFCZ2gsnN+wtC7uDz50XJxL6jx5P+SbiVs6bDVBahhTeF/01JS
	he2iTj4dN/JpjV8vnqUi9MKueWyNEcadphcQGTOvKiKckWp6rGb4PtApJcWWnlqMycSlSVN+/bs+6
	Dk33JXCePW4VRAiezhp8JvQ0jDjSMy5r3QCYAsREA4BRNgHVSQfE9IWIYZppN+vtJ/kssnblFQeOR
	Pm8WU3CV+o1vmssjEd99cUwSBQvHo86H1/6GRSJ+af6BWN0gB77OJ3/HfAxADkUw946D65GQkswdG
	k24olQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTbF-00000007nHi-0Ad3;
	Sat, 10 Oct 2026 09:42:41 +0000
Received: from out-239.mta1.migadu.com ([2001:41d0:203:375::ef] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTbB-00000007nGp-0bu2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 09:42:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AYKq4I4pt+XRaSTHkcogaEaoukmbVRkhJcniZ//zAgg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791625355; v=1; x=1792230155;
 b=GkHp9HYwYhlAfeZazSdWeQJrN0BWOreotNM+3ynVXJ6yGnjdQ2Yu157g2bWLcwgamVXkbA93
 qVTxIRGoZu3xUgv3nCKemIeKJWgUI7gLXasWnweZklqS1PpbQmM0g6iIdshtoRXyUsOG3ecPmHy
 UyKbqa5ut/uLpAJg0pbhzZew=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 57f0757703d8e229;
	Sat, 10 Oct 2026 09:42:34 +0000
X-Mizu-Trace-ID: 57f0757703d8e229
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 0/4] mm: Fix page-table teardown during memory hot-remove
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <b62aa96d-6c83-476c-bc28-7c2057702063@intel.com>
Date: Sat, 10 Oct 2026 17:42:18 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 stable@vger.kernel.org,
 david@kernel.org,
 osalvador@suse.de,
 dave.hansen@linux.intel.com,
 luto@kernel.org,
 peterz@infradead.org,
 tglx@kernel.org,
 mingo@redhat.com,
 bp@alien8.de,
 x86@kernel.org,
 hpa@zytor.com,
 catalin.marinas@arm.com,
 will@kernel.org,
 mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org,
 pjw@kernel.org,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 alex@ghiti.fr,
 linux-riscv@lists.infradead.org,
 agordeev@linux.ibm.com,
 kevin.brodsky@arm.com,
 bjorn@rivosinc.com,
 apopple@nvidia.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D9A15D57-0640-45AC-B404-13982B4A20B1@linux.dev>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
 <b62aa96d-6c83-476c-bc28-7c2057702063@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_024237_317340_70647D67 
X-CRM114-Status: GOOD (  11.32  )
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



> On Oct 10, 2026, at 04:48, Dave Hansen <dave.hansen@intel.com> wrote:
> 
> On 10/8/26 00:30, Muchun Song wrote:
>> This series is limited to bug fixes for the existing teardown paths.
> 
> Why is this a series? Why not send the architectures independently? Is
> there some dependency where they all need to be applied at once? What do
> you want done with this series? Are you expecting it to be merged via
> the mm path or the individual arch maintainers?

You're right that there is no strict dependency across all three
architectures in v1.

I grouped them because they address the same page-table
constructor/destructor imbalance exposed during memory hot-remove, but
that alone does not require them to be applied as one series.

For v2, I will move the common destructor handling into
pagetable_free() as suggested by David. The RISC-V and arm64 fixes will
then depend on that common MM change, so I plan to keep them in one
series and have it go through the MM tree, with review or acks from
the relevant architecture maintainers.

Thanks,
Muchun


