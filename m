Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935C1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlba2e7QUGGw+oIulUZtQ6j1YAhK9970oGDrQHkajZU=; b=J1Oqbx/Bl1LYuu13PhErBzEM4R
	04rrH4GGL8/Weg6P7CzYkdE/29xgO1hQkiA8odAWUHJOvbf/xEsWIHBVuvAhI4qrI2TTFFYxBQoMR
	7eJ4poUWv0219+AxyHYtcb6KDW2ukm+pEn/bAejX4AdUcHRr2lhTNE9qWVqGHePXSMzCELrzxgW4x
	SsEKpuAfFpY2qk6mXEYVnT+5wsLOsHTWQMDp1S7EUtQtqQm5rIrhx5zpyGkh1zJYw3XAzV+E7VlpG
	2a3jMcEpmZmt8hZXp3sUDeKmw17dRc03L3radNRjrM00JZIUwvVcbfoIJz8JdGN5Acrv53zwWdXZa
	cy39CCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshcK-0000000BENL-2GNa;
	Thu, 13 Mar 2025 12:24:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshTq-0000000BD1E-3wUX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 12:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 830C05C5D92;
	Thu, 13 Mar 2025 12:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBAEC4CEEB;
	Thu, 13 Mar 2025 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741868166;
	bh=ZWHDQFZydgFLF+pZhM5zaTgB/SRGh95yQ/J43duDfo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvpnul617r3+1dJblDjuGGF3ygGimnd4POqbjFo4+O44NuhkG8MrwnO4J7SN96WfS
	 Eg2ju52wMFzIKWlWGxAafV0lhzgdgNg3/4R12d/n1OI8YH+hBSdjITulP9baWQf1g7
	 4ZNcfDFOO0YoabVlIfJpBV+8WdB92DhaHXXo3V8zGi0tZ2915gd6CIV0IYwkxMB3ZD
	 9XjHE9QsRB9AD+dEhS4KMrTYEYUC67YyOfo5ocyJ/0nUmdq0UYBhih2r1skkSY6IOK
	 k6HV4X3z21S4/yKifPdRROwdqOsixPHowbEuoo66WoObj7bk9GHrVEsvCz/CcMVB9i
	 1ECWlKglNYubQ==
Date: Thu, 13 Mar 2025 12:15:59 +0000
From: Will Deacon <will@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Sebastian Ene <sebastianene@google.com>, catalin.marinas@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	snehalreddy@google.com, suzuki.poulose@arm.com,
	vdonnefort@google.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: Release the ownership of the hyp rx
 buffer to Trustzone
Message-ID: <20250313121559.GB7356@willie-the-truck>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-5-sebastianene@google.com>
 <20250305004522.GC31667@willie-the-truck>
 <20250305094104.vctshdtgdukno2aj@bogus>
 <20250305193425.GA32246@willie-the-truck>
 <Z8ltm55D1jrv8QtX@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8ltm55D1jrv8QtX@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_051607_064984_A9069AC6 
X-CRM114-Status: GOOD (  25.61  )
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

On Thu, Mar 06, 2025 at 09:40:43AM +0000, Sudeep Holla wrote:
> On Wed, Mar 05, 2025 at 07:34:26PM +0000, Will Deacon wrote:
> > On Wed, Mar 05, 2025 at 09:41:04AM +0000, Sudeep Holla wrote:
> > > On Wed, Mar 05, 2025 at 12:45:23AM +0000, Will Deacon wrote:
> > > > Hmm, the FFA spec is characteristically unclear as to whether or not we
> > > > need to release the rx buffer in the case that the flags indicate use of
> > > > the rx buffer but the returned partition count is 0.
> > > > 
> > > > Sudeep -- do you know what we should be doing in that case?
> > > > 
> > > 
> > > We need to call RX_RELEASE here. I went back to the spec to confirm the
> > > same again.
> > > 
> > > v1.2 EAC0 spec Section 7.2.2.4.2 Transfer of buffer ownership
> > > (Or just look for the section title in any version of the spec)
> > > "
> > > 2. Ownership transfer for the RX buffer takes place as follows.
> > >     2. For a framework message,
> > >        1. Completion of the FFA_PARTITION_INFO_GET ABI transfers the ownership
> > >        of the caller’s RX buffer from the Producer to the Consumer.
> > > 3. For both types of messages, an invocation of the following FF-A ABIs
> > >     transfers the ownership from the Consumer to the Producer.
> > >        1. FFA_MSG_WAIT ...
> > >        2. FFA_RX_RELEASE.
> > > "
> > > 
> > > Hope that helps, can dig deeper if there are any ambiguities around this.
> > 
> > Thanks Sudeep, but that also makes it sound like we need the RX_RELEASE
> > even if we're not using the RX buffer per the input flags. :/
> > 
> 
> Good spot, I had forgotten about the input flags that can avoid using the
> buffer. I will see if we can improve the spec in that regards.

Thanks. In the meantime, what do you think is the correct behaviour in that
case? I guess _not_ doing the release when the flags don't request the RX
buffer? In other words:


	if (flags & PARTITION_INFO_GET_RETURN_COUNT_ONLY)
		goto out_unlock;

	if (!count)
		goto release_rx;

	[...]

	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
		ffa_to_smccc_res(res, FFA_RET_ABORTED);
		goto release_rx;
	}

	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
release_rx:
	ffa_rx_release(&_res);
out_unlock:
	hyp_spin_unlock(&host_buffers.lock);
}


What do you reckon?

Will

