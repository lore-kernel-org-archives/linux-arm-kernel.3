Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAC7D6E2A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dpMtMl4II+Sy/lzwRM057QI5+4Um5eCooJUGQmKx8k=; b=U4Aa0D6e8PG1/EwEBqIh2xlt2y
	LXReIdVnmtyxrelyCaCSyMuZQmP75tUDZ7N6yMM6FHZJuMsPME0bW5PXgd83nppTytV7qkenY+y38
	ATsC1SNb9SNA7utyy1MmxAeWALK2aHLw4Mxbz5AnggWNAUz95mVy7hrDg+JyDCTqnNWjYpXhvqunu
	jyZs29BPybAVHY2CLvlFqD9ugN6YTBpqfNupsDbDphgylZgPO4a0bw/54pa5CKHBJ9ekl/jy4S9iL
	oE7trJ797ScGg86FWpM0DoQQr4mW6NFGGgi00M5h4OQcbYqsyDuSgJWIOCL+ic6Dm5Wdz76CY2Xmc
	QCNHjCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWG55-00000008hoo-1l1v;
	Thu, 18 Dec 2025 15:38:19 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWG51-00000008ho2-2YrK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:38:18 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dXFD06hZgzJ46dm;
	Thu, 18 Dec 2025 23:37:36 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E58F40565;
	Thu, 18 Dec 2025 23:38:08 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 15:38:06 +0000
Date: Thu, 18 Dec 2025 15:38:05 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: James Morse <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Gavin Shan
	<gshan@redhat.com>, <rohit.mathew@arm.com>, <reinette.chatre@intel.com>,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: Re: [RFC PATCH 01/38] arm64: mpam: Context switch the MPAM
 registers
Message-ID: <20251218153805.000073b9@huawei.com>
In-Reply-To: <c205297d-0f6e-4238-bd6a-3cab498c6a45@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-2-james.morse@arm.com>
	<20251218103546.000070fd@huawei.com>
	<a1786f34-66b8-4620-b619-79e6013882e4@arm.com>
	<c205297d-0f6e-4238-bd6a-3cab498c6a45@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_073815_943070_28669245 
X-CRM114-Status: GOOD (  45.61  )
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

On Thu, 18 Dec 2025 14:55:23 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> On 12/18/25 14:52, Ben Horgan wrote:
> > Hi Jonathan,
> > 
> > On 12/18/25 10:35, Jonathan Cameron wrote:  
> >> On Fri, 5 Dec 2025 21:58:24 +0000
> >> James Morse <james.morse@arm.com> wrote:
> >>  
> >>> MPAM allows traffic in the SoC to be labeled by the OS, these labels
> >>> are used to apply policy in caches and bandwidth regulators, and to
> >>> monitor traffic in the SoC. The label is made up of a PARTID and PMG
> >>> value. The x86 equivalent calls these CLOSID and RMID, but they don't
> >>> map precisely.
> >>>
> >>> MPAM has two CPU system registers that is used to hold the PARTID and PMG
> >>> values that traffic generated at each exception level will use. These can be
> >>> set per-task by the resctrl file system. (resctrl is the defacto interface
> >>> for controlling this stuff).
> >>>
> >>> Add a helper to switch this.
> >>>
> >>> struct task_struct's separate CLOSID and RMID fields are insufficient
> >>> to implement resctrl using MPAM, as resctrl can change the PARTID (CLOSID)
> >>> and PMG (sort of like the RMID) separately. On x86, the rmid is an
> >>> independent number, so a race that writes a mismatched  closid and rmid
> >>> into hardware is benign. On arm64, the pmg bits extend the partid.
> >>> (i.e. partid-5 has a pmg-0 that is not the same as partid-6's pmg-0).
> >>> In this case, mismatching the values will 'dirty' a pmg value that
> >>> resctrl believes is clean, and is not tracking with its 'limbo' code.
> >>>
> >>> To avoid this, the partid and pmg are always read and written as a pair.
> >>> Instead of making struct task_struct's closid and rmid fields an
> >>> endian-unsafe union, add the value to struct thread_info and always use
> >>> READ_ONCE()/WRITE_ONCE() when accessing this field.
> >>>
> >>> Resctrl allows a per-cpu 'default' value to be set, this overrides the
> >>> values when scheduling a task in the default control-group, which has
> >>> PARTID 0. The way 'code data prioritisation' gets emulated means the
> >>> register value for the default group needs to be a variable.
> >>>
> >>> The current system register value is kept in a per-cpu variable to
> >>> avoid writing to the system register if the value isn't going to change.
> >>> Writes to this register may reset the hardware state for regulating
> >>> bandwidth.
> >>>
> >>> Finally, there is no reason to context switch these registers unless
> >>> there is a driver changing the values in struct task_struct. Hide
> >>> the whole thing behind a static key. This also allows the driver to
> >>> disable MPAM in response to errors reported by hardware. Move the
> >>> existing static key to belong to the arch code, as in the future
> >>> the MPAM driver may become a loadable module.
> >>>
> >>> All this should depend on whether there is an MPAM driver, hide
> >>> it behind CONFIG_MPAM.
> >>>
> >>> CC: Amit Singh Tomar <amitsinght@marvell.com>
> >>> Signed-off-by: James Morse <james.morse@arm.com>  
> >>  
> >>> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
> >>> new file mode 100644
> >>> index 000000000000..86a55176f884
> >>> --- /dev/null
> >>> +++ b/arch/arm64/include/asm/mpam.h
> >>> @@ -0,0 +1,74 @@  
> >> ...
> >>  
> >>> +/*
> >>> + * The resctrl filesystem writes to the partid/pmg values for threads and CPUs,
> >>> + * which may race with reads in __mpam_sched_in(). Ensure only one of the old
> >>> + * or new values are used. Particular care should be taken with the pmg field
> >>> + * as __mpam_sched_in() may read a partid and pmg that don't match, causing
> >>> + * this value to be stored with cache allocations, despite being considered
> >>> + * 'free' by resctrl.
> >>> + *
> >>> + * A value in struct thread_info is used instead of struct task_struct as the
> >>> + * cpu's u64 register format is used, but struct task_struct has two u32'.  
> >>
> >> This comment probably wants to provide a little more info if it is to be useful,
> >>
> >> Is it a reference to the closid and rmid fields under CONFIG_X86_CPU_RESCTRL?
> >> I'm not immediately understanding why that matters given you could slap
> >> a union on it without (I think) resulting in anything else moving.  
> > 
> > Yes, the fields referred to are those closid and rmid. As James writes
> > in the commit message a union is an alternative, but it would be endian
> > unsafe. Unlikely to matter but lets not break things.  
> 
> Meant to say... I'll add clarification in this vein to the comment.

Goes to show I didn't read the patch description.  Oops.

I'm probably just being slow today, but why would it be endian unsafe?
I didn't think the alternative would be to assume the two uses of the storage
were valid at the same time but rather just to reuse the space (which would
have 64bit alignment anyway).  For that matter we could just put a u64 in
under a separate ifdef CONFIG_...

Obviously if the code made use of the access to closid / rmid for arm64
systems it would be a problem.

Anyway just expanding on the comment a bit should do the job with no
need for any other changes.

Thanks,

Jonathan


> 
> > 
> > I'm replying for James as he is otherwise engaged. Thanks for the review
> > of this series and all your review on the previous MPAM series.
> >   
> >>
> >> Now having it in thread_info moves it into arch header territory so
> >> might make sense for that reason.
> >>  
> >>> + */
> >>> +static inline u64 mpam_get_regval(struct task_struct *tsk)
> >>> +{
> >>> +#ifdef CONFIG_ARM64_MPAM
> >>> +	return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
> >>> +#else
> >>> +	return 0;
> >>> +#endif
> >>> +}  
> >>  
> > 
> > Thanks,
> > 
> > Ben
> >   
> 


