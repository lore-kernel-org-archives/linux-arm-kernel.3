Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E42CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 14:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYBSTQZkpol7T1dKE62nFL+WbYIAMEdcURh6EKQh7UA=; b=O6rcTZVqRjDLD3EQaVwgGEpvQi
	3rKTatWNEay5amXSOdLISskLE05QXLvLXfmefCsbKOohVTikbzxKy6Q1QTmxCFq8thcORVOFFOW4z
	qH2YwhbnDL1sqjRKyaYkzMsySHcEvnh0Kcpc/L28rWNW0zkvGQOeUtPXfQUmOmtcfjD6gQ6MBm2Zf
	ZEe5N5qhdFZ4T7I8HiXViGWu9ojJs5Ku0BTWNlp+P6u/2bVOpb6rvYHJijVI8eJMsxQXTagZ9hAlR
	ANfxLY+aKKML1thCqs6Xrsm+OkA9IqN0VcmFzC+RNhfHcF71d6IoB0C5UIwnC7mu7Pyh7CVmF+pe0
	jHx8wv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsj8U-0000000BTkq-28h5;
	Thu, 13 Mar 2025 14:02:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsj6q-0000000BTZJ-2DPh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 14:00:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C62F91424;
	Thu, 13 Mar 2025 07:00:37 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD2283F694;
	Thu, 13 Mar 2025 07:00:24 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:00:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Sebastian Ene <sebastianene@google.com>, catalin.marinas@arm.com,
	Sudeep Holla <sudeep.holla@arm.com>, joey.gouly@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, snehalreddy@google.com,
	suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: Release the ownership of the hyp rx
 buffer to Trustzone
Message-ID: <Z9Lk9QwAGhYxk8lC@bogus>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-5-sebastianene@google.com>
 <20250305004522.GC31667@willie-the-truck>
 <20250305094104.vctshdtgdukno2aj@bogus>
 <20250305193425.GA32246@willie-the-truck>
 <Z8ltm55D1jrv8QtX@bogus>
 <20250313121559.GB7356@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313121559.GB7356@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_070028_651180_65B75DBC 
X-CRM114-Status: GOOD (  28.41  )
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

On Thu, Mar 13, 2025 at 12:15:59PM +0000, Will Deacon wrote:
> On Thu, Mar 06, 2025 at 09:40:43AM +0000, Sudeep Holla wrote:
> > On Wed, Mar 05, 2025 at 07:34:26PM +0000, Will Deacon wrote:
> > > On Wed, Mar 05, 2025 at 09:41:04AM +0000, Sudeep Holla wrote:
> > > > On Wed, Mar 05, 2025 at 12:45:23AM +0000, Will Deacon wrote:
> > > > > Hmm, the FFA spec is characteristically unclear as to whether or not we
> > > > > need to release the rx buffer in the case that the flags indicate use of
> > > > > the rx buffer but the returned partition count is 0.
> > > > >
> > > > > Sudeep -- do you know what we should be doing in that case?
> > > > >
> > > >
> > > > We need to call RX_RELEASE here. I went back to the spec to confirm the
> > > > same again.
> > > >
> > > > v1.2 EAC0 spec Section 7.2.2.4.2 Transfer of buffer ownership
> > > > (Or just look for the section title in any version of the spec)
> > > > "
> > > > 2. Ownership transfer for the RX buffer takes place as follows.
> > > >     2. For a framework message,
> > > >        1. Completion of the FFA_PARTITION_INFO_GET ABI transfers the ownership
> > > >        of the caller’s RX buffer from the Producer to the Consumer.
> > > > 3. For both types of messages, an invocation of the following FF-A ABIs
> > > >     transfers the ownership from the Consumer to the Producer.
> > > >        1. FFA_MSG_WAIT ...
> > > >        2. FFA_RX_RELEASE.
> > > > "
> > > >
> > > > Hope that helps, can dig deeper if there are any ambiguities around this.
> > >
> > > Thanks Sudeep, but that also makes it sound like we need the RX_RELEASE
> > > even if we're not using the RX buffer per the input flags. :/
> > >
> >
> > Good spot, I had forgotten about the input flags that can avoid using the
> > buffer. I will see if we can improve the spec in that regards.
>
> Thanks. In the meantime, what do you think is the correct behaviour in that
> case? I guess _not_ doing the release when the flags don't request the RX
> buffer? In other words:
>
>
> 	if (flags & PARTITION_INFO_GET_RETURN_COUNT_ONLY)
> 		goto out_unlock;
>
> 	if (!count)
> 		goto release_rx;
>
> 	[...]
>
> 	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> 		ffa_to_smccc_res(res, FFA_RET_ABORTED);
> 		goto release_rx;
> 	}
>
> 	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
> release_rx:
> 	ffa_rx_release(&_res);
> out_unlock:
> 	hyp_spin_unlock(&host_buffers.lock);
> }
>
>
> What do you reckon?

Yes matches my understanding. I also cross checked with FF-A spec authors
to be sure. Now I got to fix that in the driver, currently it releases
buffer unconditionally which is wrong 🙁.

-- 
Regards,
Sudeep

