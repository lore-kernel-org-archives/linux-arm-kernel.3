Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B2CC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIXFX9rBIG9zQg5hvTNUaSYyxqeWifxp86PFRRFK6Cc=; b=FY4nmgtudAGVLngR6ozuxQ80pJ
	/XyrwXffHRu7p9AEwmrud2MUBxE5PE8fcFTtZpnlBlqxXD3/L9pjiQIJtSH8EJ4CGhJYo0CuOiZxl
	GXKoLD5wMT7HQQ2CkFfZNhmMwCyZnZiILfs6W2q1RUy6ta17PkohdwBmjpr0tHuKtXS9LU0L0DJdj
	uK7EYgY/FfF2lXBZeZl9X/+G+5wkyFY+NpznoZxzyYFNz+/NQld7JW22srzLMc0n6Ap/kDlPs+tzx
	bZCFUf01fr5HRlk85nV/2FafeLCSf+atOQKvAC97u7E+E9xGrRf92lVf05PJq3ocLMac7/EmZ50nK
	0WsmVCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tn1-0000000Dme1-0GAi;
	Fri, 18 Sep 2026 08:17:47 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tmy-0000000DmdE-2oby
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:17:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=j93Rw5e85f6pY7eCSjFAVhVix8y2aM8tStuN+RPXRkw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789719462; v=1; x=1790324262;
 b=OiC8qhaWNDJzjEhthmyQFnc4uzYwiPYNtFNPfXa9HpOYVFbaRC91p32pnH+cv2Jp3gpGwyAn
 xUyvX0qNGfK98lkix16baIzuwWun/ft2uEwgm+w7nRG88jPCcsqOb/szmglVZZ/h7WrXVJq6XWC
 vGpsrDM1EjJ+uAjhB6cNQIRI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id d0581680cb0ed85c;
	Fri, 18 Sep 2026 08:17:42 +0000
X-Mizu-Trace-ID: d0581680cb0ed85c
X-Migadu-Flow: FLOW_OUT
Date: Fri, 18 Sep 2026 16:17:32 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, robh@kernel.org,
	saravanak@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
	alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev,
	robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v6 00/10] kdump: reduce vmcore size and capture time
Message-ID: <aqzznOgILX2pZg7b@fedora>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_011744_938534_A6039079 
X-CRM114-Status: UNSURE (   9.09  )
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

On 09/02/26 at 03:31pm, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
...snip... 
> ACPI systems already filter reserved memory out of the vmcore through
> their existing path; only DT-based systems currently fail to filter these
> regions, which is what this series addresses. The flag lives in memblock
> itself rather than in a DT-only structure, so the mechanism is generic and
                                                                 ~~~
The patchset itself looks goot to me, while I am concerned if it's
really generic. I raised that in sub-thread talking with Wandun. Imagine
I tried to exclude many driver regions and split memblock regions into
hundreds, cma could yell out: cma_declare_contiguous_multi()?

IMHO, withdrawing the claim can fix the nit concern. If I am wrong,
please help point it out to let me learn more.

Thanks
Baoquan

> both ACPI and DT systems can benefit from it (suggested by Rob, thanks) [1].
> 
> Since the reserved memory regions are filtered out, the vmcore is
> smaller in size and faster to produce. 
> 
...snip...

