Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33147C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxOPooZwR7A/6/E2lQO+PdaoMIRPu3SZ1nD5Ttfv3FU=; b=LiDlbWAiZJc5euiXznhdsXHOQn
	y78PxgNcT9jqQKdoZrrhsEaCj1wdy/d3u2CSjGnvb2pl9LchoXfya+raq6WSzXAhfJshDjqVsqar6
	G/NGhgT/wLOrAZ1H/QT4nPm7mVuyboodiTxj9H4+hS5SHGLd2wBR1SnNDqyV1A3BilV7iacRBa4mS
	3I9Nualszqa02lFQsHzlISFsK37Tj519sDvc2rVzI6dLOOKAcwp5n5aUdIjVOJgFPyUA+LGj+c/ay
	Z0tqClGfTz8B1ZhPfdmbUtJVYwBhZ06pnITZXxCxBYBmFK+Q+S7N5grricRwp8UaGcY2of48mFkWr
	uznlT7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4ve-00000001Mqe-0UfR;
	Thu, 08 May 2025 17:21:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3mS-00000001EtL-1hxU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 16:07:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C5B9236D;
	Thu,  8 May 2025 09:07:17 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 313073F5A1;
	Thu,  8 May 2025 09:07:25 -0700 (PDT)
Date: Thu, 8 May 2025 17:07:22 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>
Cc: Marc Zyngier <maz@kernel.org>, Per Larsen <perl@immunant.com>,
	Sudeep Holla <sudeep.holla@arm.com>, armellel@google.com,
	catalin.marinas@arm.com, kernel-team@android.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, qperret@google.com,
	sebastianene@google.com, will@kernel.org, yuzenghui@huawei.com,
	Per Larsen <perlarsen@google.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
Message-ID: <20250508-condor-of-angelic-pleasure-bfb5c4@sudeepholla>
References: <CA+AY4XcaJa1_U3qXQUBj4wZJYc9hKmRX8FTNeDvV2auEnC_WrA@mail.gmail.com>
 <86r017h00e.wl-maz@kernel.org>
 <aBnNXyJn818ZEKOS@google.com>
 <8634dfh47q.wl-maz@kernel.org>
 <20250508-spectral-sage-whippet-4f7ac2@sudeepholla>
 <CAMP5XgcCg+kB7tPwSYUcjfZqR_734cGEs_KX4st9SQOVLBV-Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMP5XgcCg+kB7tPwSYUcjfZqR_734cGEs_KX4st9SQOVLBV-Yw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_090728_535868_C43F6518 
X-CRM114-Status: GOOD (  32.86  )
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

On Thu, May 08, 2025 at 08:45:01AM -0700, Arve Hjønnevåg wrote:
> On Thu, May 8, 2025 at 2:27 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > (just adding some additional info not particularly impacting the $subject
> >  change implementation)
> >
> > On Thu, May 08, 2025 at 09:55:05AM +0100, Marc Zyngier wrote:
> > > On Tue, 06 May 2025 10:29:41 +0100,
> > > Per Larsen <perl@immunant.com> wrote:
> > > >
> >
> > [...]
> >
> > > > Asssuming we drop this patch from the series and apply the rest, the
> > > > hypervisor and host can negotiate FF-A 1.2. If the host then calls
> > > > FFA_VERSION a second time to request FF-A 1.1, the hypervisor would
> > > > return version 1.2 (without this patch).
> > >
> > > Why would it do that? Once a particular version has been negotiated, I
> > > expect to be immutable.
> > >
> >
> > Not suggesting that we need to support this, but it is technically possible
> > today by loading FF-A as a module—first inserting and removing a module with
> > v1.2 support, then loading one with v1.1 support. It can ever throw error
> > as not supported to keep it simple.
> >
> 
> I'm not sure how what you are suggesting here is different from what
> this patch does. This patch does not alter what versions the host can
> negotiate. The hypervisor already disallows negotiating a different
> version once has_version_negotiated is set, the return code just
> doesn't always reflect this. If you try to load the 1.0 driver in the
> host after unloading the 1.1 driver similar to what you describe
> above, then this CL will let the 1.0 driver know that the hypervisor
> does not support 1.0 (I use 1.1 to 1.0 as the example here since this
> is an issue even without the next CL in this patch series that bumps
> the hypervisor supported version to 1.2). Without this CL, the 1.0
> driver will now proceed making other ffa calls using 1.0 data
> structures that the hypervisor will incorrectly interpret as 1.1 data
> structures.
> 
> With this CL, loading a 1.2 driver after the initial 1.1 driver will
> work as it did before by returning version 1.1 to the 1.2 driver to
> let it know that _it_ needs to downgrade to 1.1. if it wants to
> proceed. Loading the 1.0 driver after 1.1 will now fail at the version
> negotiation stage however. This will be clearer, and more correct,
> than getting FFA_RET_INVALID_PARAMETERS return codes from other ffa
> calls when passing valid 1.0 parameters to those calls.
> 

Thanks for the detailed explanation. Sorry I didn't look at the change itself
and I might have made assumptions as I just read

  |  If the host then calls FFA_VERSION a second time to request FF-A 1.1,
  |  the hypervisor would return version 1.2 (without this patch).

So, my point was just that it is OK to even report it as NOT_SUPPORTED
if FF-A proxy doesn't want to deal with all the compatibility for simplicity.

-- 
Regards,
Sudeep

