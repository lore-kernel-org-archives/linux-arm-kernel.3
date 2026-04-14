Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1D2ED7B91
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIb+7e3FoSZdsvZo6hNoQggErGHsAXBdIGibmV017wg=; b=E4lVYicTkYU1Qrs2xlwh0jKgAq
	fucAB8zk5j586VzXq+7MmQA+GrfV8KOOjtF+MnIC6zPuacukM+ZdJgPGspqJvsmptV5QdqqKFIGIb
	kyZvnltQznxdM+3dg2y2H8+GPDo2Db+GWgExx1PKiw9AcUiyHPv2jvPfZFiIUbOQe/OrKp/rhUa+Z
	Rp1p8P7IQB/xA/+aOLjkKlo836vQkkhd2yhzNDxuSM5FGJIAHMbCIelVi5lIWeFnW58dFyff78t2r
	/RAdvSz69EfeaxUMLeScM21Q7MRCoz22ivhC/HeVbu+S94H6lMLnTptZ1tyqquPtm1tgIWWOXIr3x
	txXn45ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZoF-0000000H2T8-1OXp;
	Tue, 14 Apr 2026 09:11:51 +0000
Received: from [101.204.27.37] (helo=mailgw2.hygon.cn)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZoA-0000000H2Sl-1AZk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:11:49 +0000
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw2.hygon.cn (Postfix) with ESMTP id 4fvz6Y1Vswz1YQpmJ;
	Tue, 14 Apr 2026 17:11:33 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw2.hygon.cn (Postfix) with ESMTP id 4fvz6V6YZ3z1YQpmJ;
	Tue, 14 Apr 2026 17:11:30 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 75DAD3005A41;
	Tue, 14 Apr 2026 17:09:35 +0800 (CST)
Received: from hsj-2U-Workstation (172.19.20.61) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 14 Apr
 2026 17:11:28 +0800
Date: Tue, 14 Apr 2026 17:11:26 +0800
From: Huang Shijie <huangsj@hygon.cn>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: <akpm@linux-foundation.org>, <viro@zeniv.linux.org.uk>,
	<brauner@kernel.org>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<muchun.song@linux.dev>, <osalvador@suse.de>,
	<linux-trace-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<zhongyuan@hygon.cn>, <fangbaoshun@hygon.cn>, <yingzhiwei@hygon.cn>
Subject: Re: [PATCH 0/3] mm: split the file's i_mmap tree for NUMA
Message-ID: <ad4EvoDcAKE2Sl4+@hsj-2U-Workstation>
References: <20260413062042.804-1-huangsj@hygon.cn>
 <76pfiwabdgsej6q2yxfh3efuqvsyg7mt7rvl5itzzjyhdrto5r@53viaxsackzv>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <76pfiwabdgsej6q2yxfh3efuqvsyg7mt7rvl5itzzjyhdrto5r@53viaxsackzv>
X-Originating-IP: [172.19.20.61]
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_021146_511254_C99C4991 
X-CRM114-Status: GOOD (  34.81  )
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

On Mon, Apr 13, 2026 at 05:33:21PM +0200, Mateusz Guzik wrote:
> On Mon, Apr 13, 2026 at 02:20:39PM +0800, Huang Shijie wrote:
> >   In NUMA, there are maybe many NUMA nodes and many CPUs.
> > For example, a Hygon's server has 12 NUMA nodes, and 384 CPUs.
> > In the UnixBench tests, there is a test "execl" which tests
> > the execve system call.
> > 
> >   When we test our server with "./Run -c 384 execl",
> > the test result is not good enough. The i_mmap locks contended heavily on
> > "libc.so" and "ld.so". For example, the i_mmap tree for "libc.so" can have 
> > over 6000 VMAs, all the VMAs can be in different NUMA mode.
> > The insert/remove operations do not run quickly enough.
> > 
> > patch 1 & patch 2 are try to hide the direct access of i_mmap.
> > patch 3 splits the i_mmap into sibling trees, and we can get better 
> > performance with this patch set:
> >     we can get 77% performance improvement(10 times average)
> > 
> 
> To my reading you kept the lock as-is and only distributed the protected
> state.
> 
> While I don't doubt the improvement, I'm confident should you take a
> look at the profile you are going to find this still does not scale with
> rwsem being one of the problems (there are other global locks, some of
> which have experimental patches for).
IMHO, when the number of VMAs in the i_mmap is very large, only optimise the rwsem
lock does not help too much for our NUMA case.

In our NUMA server, the remote access could be the major issue.


> 
> Apart from that this does nothing to help high core systems which are
> all one node, which imo puts another question mark on this specific
> proposal.
Yes, this patch set only focus on the NUMA case.
The one-node case should use the original i_mmap.

Maybe I can add a new config, CONFIG_SPILT_I_MMAP. The config is disabled
by default, and enabled when the NUMA node is not one.

> 
> Of course one may question whether a RB tree is the right choice here,
> it may be the lock-protected cost can go way down with merely a better
> data structure.
> 
> Regardless of that, for actual scalability, there will be no way around
> decentralazing locking around this and partitioning per some core count
> (not just by numa awareness).
> 
> Decentralizing locking is definitely possible, but I have not looked
> into specifics of how problematic it is. Best case scenario it will
> merely with separate locks. Worst case scenario something needs a fully
> stabilized state for traversal, in that case another rw lock can be
Yes. 

The traversal may need to hold many locks.

> slapped around this, creating locking order read lock -> per-subset
> write lock -- this will suffer scalability due to the read locking, but
> it will still scale drastically better as apart from that there will be
> no serialization. In this setting the problematic consumer will write
> lock the new thing to stabilize the state.
> 
> So my non-maintainer opinion is that the patchset is not worth it as it
> fails to address anything for significantly more common and already
> affected setups.
This patch set is to reduce the remote access latency for insert/remove VMA
in NUMA.

> 
> Have you looked into splitting the lock?
> 
I ever tried. 

But there are two disadvantages:
  1.) The traversal may need to hold many locks which makes the
      code very horrible.

  2.) Even we split the locks. Each lock protects a tree, when the tree becomes
      big enough, the VMA insert/remove will also become slow in NUMA.
      The reason is that the tree has VMAs in different NUMA nodes.
      

Thanks
Huang Shijie


