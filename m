Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA6EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6zk47/4FkBLywYJQuQtMPLTYPI0Mlf+FNTdse3N6ZY=; b=FPbyJ+kTz/04nl2iDySi28PWk3
	h+7S+AG+n84HsrDYVcIgOIbSGEpLI85swNg0gZ1M7jtfSlI6OmkxbcBnpMa0r0shEpW+n9JRyCnir
	Z0LcX5uMWKuPQE46XQERopNjuTI3G96vxpxGtsuOQz1tX97uD/Wi2uRtskrbcjjNzKxh5awt6BJ2O
	Sg/e81uP2K9Fz7QKq81VK+/RIt1a1e1/InIw2MXG0ssp+B349lh+W/a2S1hQwcsekyZBN0XD/ebru
	xrfiE/c2Vvd1T9Pb/jna8fEZ703jUP4o+Guio4IJVVv8aQgtEWH3A2hefGNGkKuNMDJUV8Z834DLB
	IxoJeaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpYs-0000000EZat-2aOQ;
	Wed, 19 Feb 2025 19:16:46 +0000
Received: from out-184.mta1.migadu.com ([95.215.58.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpN1-0000000EWNJ-1UqK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:04:33 +0000
Date: Wed, 19 Feb 2025 11:04:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739991866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6zk47/4FkBLywYJQuQtMPLTYPI0Mlf+FNTdse3N6ZY=;
	b=qfSVRKIyz0N96eyb2/fchCXV9IZQuTERYuYiqdmTT1Q16j2DTYZRmsaOLroYfNU/jy7Zwr
	GFaYNBUMLghClhBGonIAxfzRrV6mJTtT4FdnpDecu2+U/4s6ggEOH3UT/1L+jM6clbVN1C
	RjZ9bDP6vKDCkhlYeJk1gCICWTcRULQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Fix MDCR_EL2.HPMN reset value
Message-ID: <Z7YrLMz49_f14MRs@linux.dev>
References: <20250217112412.3963324-1-maz@kernel.org>
 <20250217112412.3963324-2-maz@kernel.org>
 <Z7OFvp7LMcOvWziA@linux.dev>
 <86a5airpyy.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a5airpyy.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_110431_799603_F84F5538 
X-CRM114-Status: GOOD (  21.58  )
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

On Wed, Feb 19, 2025 at 02:03:49PM +0000, Marc Zyngier wrote:
> On Mon, 17 Feb 2025 18:53:50 +0000, Oliver Upton <oliver.upton@linux.dev> wrote:
> > What do you think about adding a new vCPU attribute for selecting the
> > number of counters for a VM? We can allow non-nested VMs to use the
> > 'old' method of writing PMCR_EL0.N and force nested VMs to use the
> > attribute.
> 
> VCPU attribute? or PMU attribute? I'm really not keen on the former,
> but the latter is probably workable, as it is VM-wide, similar to the
> way we keep track of pmcr_n.

Well the _existing_ PMU attributes are actually vCPU attributes. I do
agree that accessing them as a VM attribute makes more sense, but that's
the UAPI we already have...

> > We can then enforce ordering on the attribute and prevent it from being
> > used after vCPU reset.
> 
> How would that work? Do you really want to mandate the PMU selection
> (with its counter capping) to strictly occur between vcpu creation and
> init?
> 
> This would, for example, break kvmtool which has these two operations
> back-to-back, and sneaking new device-specific actions in the middle
> is a bit unpalatable (there is a split between VM-wide and per-vcpu
> actions).
> 
> Any idea?

If we want to do this the 'right' way, we should provide VM attributes
for selecting the PMU implementation / configuring the event filter
to complement an attribute for setting the number of event counters.

I don't want to have a mix-and-match approach where vPMU attributes are
scattered between the vCPU and the VM since it requires a similar amount
of gymnastics in userspace to set crap up.

Thanks,
Oliver

