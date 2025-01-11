Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE822E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 01:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSJ2//G/dyGy/Z/QtKtRmb1VcieLheCT8CgoEclYxvU=; b=z3UruojRKnfIIe/zZxHKLQHrJ4
	cOc+CNnycJem1iat6JXcEZvYJwiMUhrzMm6M0hdLsYkjsll4/ZWmfHCE3fiyRdslVSd+PzZz3rir3
	fuirI4jolKKykZZJdLqp9xl4GWrnTLPZ9jQN9LRkbvIu3dNSxAfDRTJvGZVzh+YF0JiUuKR/fqZLH
	Q/Qv0MRnSZmX/R+Nf6LqcT+6X3kpII8T4/ZDRj52gLC7kBxNyTAfGllMP9yF5eopGlztQhcBw+xrk
	D6+B4P3UKDA59WEh0N9gZwZ9j8bHTppHCIh0QwCnLEyNfJ3mCNcOX74ONoh96Kr4DM+I3Ihhu5RVg
	dcJkj9jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQNj-0000000HVmy-2r9x;
	Sat, 11 Jan 2025 01:33:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQKy-0000000HVQn-1e0T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 01:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C3F25C3674;
	Sat, 11 Jan 2025 01:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC51C4CED6;
	Sat, 11 Jan 2025 01:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736559049;
	bh=7I1OBfWbo908Mx7qvQkrDHGouLRf+dWAo5fEwim6p1w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wCdNg1TFG2mQ2V7JLabBLagQ3iPh1FJkujMfPxuiGPq8mHSUiRbicfuDz2i9VqjFf
	 EAUFhX6Dmh7OxXqZl8IYRBtst8NCQct6t/dFbEismIfwpRA3Qoo2LI1c6LPpWu8fRG
	 2Kmoai3+QNA8Ga1fKjMEVJkS7d/Z4QkUiwdQ67Rg=
Date: Fri, 10 Jan 2025 17:30:48 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <alison.schofield@intel.com>, <lina@asahilina.net>, <zhang.lyra@gmail.com>,
 <gerald.schaefer@linux.ibm.com>, <vishal.l.verma@intel.com>,
 <dave.jiang@intel.com>, <logang@deltatee.com>, <bhelgaas@google.com>,
 <jack@suse.cz>, <jgg@ziepe.ca>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
 <dave.hansen@linux.intel.com>, <ira.weiny@intel.com>,
 <willy@infradead.org>, <djwong@kernel.org>, <tytso@mit.edu>,
 <linmiaohe@huawei.com>, <david@redhat.com>, <peterx@redhat.com>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
 <nvdimm@lists.linux.dev>, <linux-cxl@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
 <david@fromorbit.com>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
 <loongarch@lists.linux.dev>
Subject: Re: [PATCH v6 00/26] fs/dax: Fix ZONE_DEVICE page reference counts
Message-Id: <20250110173048.5565901e0fec24556325bd18@linux-foundation.org>
In-Reply-To: <6780c6d43d73e_2aff42943b@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
	<6780c6d43d73e_2aff42943b@dwillia2-xfh.jf.intel.com.notmuch>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_173052_470189_8CBA4211 
X-CRM114-Status: GOOD (  17.99  )
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

On Thu, 9 Jan 2025 23:05:56 -0800 Dan Williams <dan.j.williams@intel.com> wrote:

> >  - Remove PTE_DEVMAP definitions from Loongarch which were added since
> >    this series was initially written.
> [..]
> > 
> > base-commit: e25c8d66f6786300b680866c0e0139981273feba
> 
> If this is going to go through nvdimm.git I will need it against a
> mainline tag baseline. Linus will want to see the merge conflicts.
> 
> Otherwise if that merge commit is too messy, or you would rather not
> rebase, then it either needs to go one of two options:
> 
> - Andrew's tree which is the only tree I know of that can carry
>   patches relative to linux-next.

I used to be able to do that but haven't got around to setting up such
a thing with mm.git.  This is the first time the need has arisen,
really.

> - Wait for v6.14-rc1 

I'm thinking so.  Darrick's review comments indicate that we'll be seeing a v7.

> and get this into nvdimm.git early in the cycle
>   when the conflict storm will be low.

erk.  This patchset hits mm/ a lot, and nvdimm hardly at all.  Is it
not practical to carry this in mm.git?


