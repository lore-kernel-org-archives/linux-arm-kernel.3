Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2977ED6554E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 18:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToEmNiBbhN5F/yjkx/YHq03WfxPjrJ7SieRa4FeLMBs=; b=WGltsdMMt8XmPDoUv9tcq3QaED
	VSk57nNcQlZ9pcCHyDcZk2ho6/VLBOQvrZa//Xjwc1enYKc+QR7Ovv83Ek917O1l/vnuFtQnPvGag
	6TIWP22/P67yQgbgRJ2o0qB967srbUzK/zIHfMFU6YnTau6s62G18o54OcxVbpwWzT6qp/vLEq5Wy
	dJD52KKaFhL2BbPZcX1YPCYvSrXiAHOi0Gc1vXV8LJqfe0vP5xWLgPo9tlwHQRFC7iSmapLooc/oa
	Hb8ImX68UEACtZBAsRAdLHnPFrZrdGkD+mrt4Z3G4hTxOcCjyyRiLrvJsd2pQxadzoKSCUl5GnlVw
	mWMdKv2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0dM-0000000BTds-3L33;
	Tue, 26 Nov 2024 18:50:00 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0cN-0000000BTXp-43n5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 18:49:01 +0000
Date: Tue, 26 Nov 2024 10:48:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732646936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ToEmNiBbhN5F/yjkx/YHq03WfxPjrJ7SieRa4FeLMBs=;
	b=L4/aYIeqWZUgwP8whOq9QGeoy4pNVidemMixAv6nZOlhild0Wre4/bBQIc5VeQigkiArVi
	8h7bFgbTSzWEIETs5dCZdCyUQMCK9vg9JutUo9YuEIldao2+2rIbEBbJhCB2eqca0kQ5Pb
	oBLUVmzdt5NDvOO5m9YOWXVTAjpBJ2s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH] KVM: arm64: Fix S1/S2 combination when FWB==1 and S2 has
 Device memory type
Message-ID: <Z0YYEmeJhpJ2PaWf@linux.dev>
References: <20241125094756.609590-1-maz@kernel.org>
 <Z0XoxGSWRCjbTFie@linux.dev>
 <86ed2yufdz.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ed2yufdz.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_104900_528647_7D4317BC 
X-CRM114-Status: GOOD (  14.37  )
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

On Tue, Nov 26, 2024 at 04:30:16PM +0000, Marc Zyngier wrote:
> On Tue, 26 Nov 2024 15:27:00 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > On Mon, Nov 25, 2024 at 09:47:56AM +0000, Marc Zyngier wrote:
> > > The G.a revision of the ARM ARM had it pretty clear that HCR_EL2.FWB
> > > had no influence on "The way that stage 1 memory types and attributes
> > > are combined with stage 2 Device type and attributes." (D5.5.5).
> > > 
> > > However, this wording was lost in further revisions of the architecture.
> > > 
> > > Restore the intended behaviour, which is to take the strongest memory
> > > type of S1 and S2 in this case, as if FWB was 0. The specification is
> > > being fixed accordingly.
> > 
> > Since you're already asking for a spec fix, could you mention that the
> > column headers in DDI0487K.a Table D8-95 are incorrect? MemAttr[1:0] is
> > used twice, although I believe the first column is actually MemAttr[3:2].
> 
> That one has already been fixed as D22366, as described in the Known
> Issues document for version K.a (issue 07) [1].

Ah, right on. Thanks!

-- 
Best,
Oliver

