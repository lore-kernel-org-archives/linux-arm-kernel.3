Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A858CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 22:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMNRIy7juPEY6DIXxF9DZzfJvByV0E5yz461o/FuEmU=; b=oiZZT53rGLvt/oJ5Lt3r9Zrvu7
	YXFLL2N3CYln/39VCeeM8FFkegpZgdIZ5rIGMZwMCjrqgNCYL+pOVvO823/x1Njm0+XMpLvADAPrp
	2PLqwr8RGqQMpMeW1eC/+0OlrrWB2oNnHYsYTTQSxUmvCyvCQTqn2f0hrM16wdVuHYYTk+O9QFivO
	bp+tREokyFcs6jRdH8mNiVSrd4DYQ0OAyrfizNHVK2THf9QOmIMzqtxmSRJW3pTWNeuaQV62dcD6J
	vqF+G2WflzTIS2EuOnnVrIrlgVl9o9ZOUrHpwLBDupf+E6J6npppVfgtbW0lFWIwlyRHGB6FCm5pp
	LFOY9YOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1BfH-0000000F5rs-26Nz;
	Tue, 23 Sep 2025 22:39:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1BfF-0000000F5rR-4C4e;
	Tue, 23 Sep 2025 22:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kMNRIy7juPEY6DIXxF9DZzfJvByV0E5yz461o/FuEmU=; b=SojriKu2ZEAiqDCZFCDQRhRKhn
	nKspnPTfBVKaUKc77OtjSxdvixl+GHzCJK/5nnDH122mvTIjGuaDBtfO2/vhms/1t4MnJvEPwrhjB
	SL/CfblZqb+J/Mg1qpXUiH8CIEeTs7RnM5SEdFEjpxScnHE1UEuvNZ37MUF2Idfeulhmd9iuFHN+X
	YneEJmmbwYFcgPkAR878Rq4Hy6K/em+73ZwEXsSrT8HKSJSfk8+IhYUuoVieViWI58YHUR7Ufjd3M
	/5l7MwBlIgT3Gk4OECBaBAUXXAeZup1SPEBlZdCDvKR6uwJtaxODOFfE3ZGINd6WxrnAwhB2zzg6Y
	5izeBW/g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Bf7-00000002lyS-1MIl;
	Tue, 23 Sep 2025 22:39:05 +0000
Date: Tue, 23 Sep 2025 23:39:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Yin Tirui <yintirui@huawei.com>
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	anshuman.khandual@arm.com, yangyicong@hisilicon.com,
	ardb@kernel.org, apopple@nvidia.com, samuel.holland@sifive.com,
	luxu.kernel@bytedance.com, abrestic@rivosinc.com,
	yongxuan.wang@sifive.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, wangkefeng.wang@huawei.com,
	chenjun102@huawei.com
Subject: Re: [PATCH RFC 2/2] mm: add PMD-level huge page support for
 remap_pfn_range()
Message-ID: <aNMhiZ4FiEE1Rk_T@casper.infradead.org>
References: <20250923133104.926672-1-yintirui@huawei.com>
 <20250923133104.926672-3-yintirui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923133104.926672-3-yintirui@huawei.com>
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

On Tue, Sep 23, 2025 at 09:31:04PM +0800, Yin Tirui wrote:
> +			entry = pte_clrhuge(pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd)));

This doesn't make sense.  And I'm not saying you got this wrong; I
suspect in terms of how things work today it's actually necessary.
But the way we handle this stuff is so insane.

pte_clrhuge() should not exist.  If we have a PTE, it can't have the
huge bit set, by definition (don't anybody mention hugetlbfs because
that is an entirely separate pile of broken horrors).  I understand what
you're trying to do here.  You want to construct a PTE that points to
the same address as the first page of the PMD and has the same
permissions.  But that *should* be written as:

	entry = pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd)));

right?  Now, pmd_pgprot() might or might not want to return the huge bit
set.  I'm not sure.  Perhaps you could have a look through and figure it
out.  But pfn_pte() should never return a PTE with the huge bit set.
So if it is set in the pgorot on entry, it should filter it out.

There are going to be consequences to this.  Maybe there's code
somewhere that relies on pfn_pte() returning a PTE with the huge bit
set.  Perhaps it's hugetlbfs.

But we have to start cleaning this garbage up.  I did some work with
e3981db444a0 and the commits leading up to that.  See
https://lkml.kernel.org/r/20250402181709.2386022-12-willy@infradead.org

I'd like pte_clrhuge() to be deleted from x86, not added to arm and
riscv.

