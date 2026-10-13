Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A2DCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeRaURUo5EbmMLuGd0BOhxrctGp6NHfz84lMXFt/WCo=; b=zdiRwSh5jshT/KvdCp21WPaAGT
	3dSY9/HBvw89hrRqj20hiqMkWrWEwYvWn6f967UBKSfNDxyqLhLBFIYFG4lUWJOszGuu+tJVDsgUn
	52U53ZmoinsAtSe9ELU666mQYXpTb6qxcNpodURwgeKORqQlsSFMo/mHXZqs+gYR30S4xs44IQp++
	b4hz2SkYuFTzRYiFJITNMkkCsR4U+/fmlM9E+4DB3GF72C/OXibKFA5hbnsxUKi20U8ioKYQT6an1
	rZmzMmbTp4cUvP893yoDQTaOFbcjk5SPDJzRb3T0pAw7+Y6cpFkyEGDN7cVb7bNt7CIwt5w/fWvzo
	F1rECGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeiG-0000000DPad-1t68;
	Tue, 13 Oct 2026 15:46:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeiE-0000000DPZ6-1FJQ;
	Tue, 13 Oct 2026 15:46:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D442A169E;
	Tue, 13 Oct 2026 08:46:41 -0700 (PDT)
Received: from [10.57.13.106] (unknown [10.57.13.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D4FF3F673;
	Tue, 13 Oct 2026 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791906405; bh=JeRaURUo5EbmMLuGd0BOhxrctGp6NHfz84lMXFt/WCo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X75FUdGMBAZYYdPrK2BcgKxQkWiUuX/Mev7U3QTFrR/D2ZaBM94pw0qWGcNhIsrhi
	 HNgW0pdzZ0TS8JEbWeGOyWyZ+WWETzZd6VBjM69GJs3SFC+HdmB5a8oKbOxUfqjRFR
	 QT19CD1NHaJSx1sqnq4l1v9tXFIlJQAsH36l+TS4=
Message-ID: <9a36345e-5301-4636-aabe-557d923e61f9@arm.com>
Date: Tue, 13 Oct 2026 17:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64/mm: fix destructor for unconstructed hotplug
 page tables
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
 <20261010112457.49485-5-songmuchun@bytedance.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20261010112457.49485-5-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_084646_639580_8CB933B3 
X-CRM114-Status: UNSURE (   7.55  )
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
> Commit c594b83457cc ("arm64: mm: call pagetable dtor when freeing
> hot-removed page tables") made free_hotplug_pgtable_page()
> unconditionally run the page-table destructor. This matches page
> tables allocated by the arm64 mapping code, which runs the
> corresponding constructors. However, arm64 also uses the generic
> sparse-vmemmap population code. Runtime intermediate page tables
> allocated by that code do not run a page-table constructor. Freeing
> one during memory hot-remove therefore runs a destructor without a
> matching constructor and corrupts NR_PAGETABLE accounting. Free
> intermediate page-table pages through pagetable_free(). It runs the
> destructor only for constructor-backed pages and then releases the
> page through the page-table freeing path. Fixes: c594b83457cc ("arm64:
> mm: call pagetable dtor when freeing hot-removed page tables") Cc:
> stable@vger.kernel.orgAssisted-by: LLM Signed-off-by: Muchun Song
> <songmuchun@bytedance.com>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

