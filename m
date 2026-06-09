Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C68FCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkRvDhdakGkuS3drIlrxrThJuZ1NF7hwtWDMZs8KAf8=; b=sUwoMt8SKJAfxE80DhDLGo2iPL
	89oLDWp3t1j1tf2t0NnItL07DiXFTG4+6F8ttv859IQ0NFodCDU+wkSi3qH5w7fvpU9LmaKf2VLth
	1xyvunR+x6icYssCxbxhbQUr5y8Aapx+GRd/8MVE2vSp56+tIwmELvYpoZDJFbQjHRMAgPG6ViY+F
	jEwfdQv4vm3azbOiAdp+JS4tvb0TcXL7nDnCa4HyrqsBUx+EeNJkvTCePUmsrBPRCvOLRr3kN9/7s
	rBo5dNSjZfQi3FVe/FTI+uxON775tsTjKJcdeaRpkTnbsjd/n1s4pIvIw7UGw1vCrHRKvEwGonIKq
	RV3IcD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwKN-00000005dfL-0B5U;
	Tue, 09 Jun 2026 13:17:11 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwKI-00000005dey-32M5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781011026; x=1812547026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N/vFtBsEQhmzFRkg7JVXBFy8+0kq7irSjH06B5RYaow=;
  b=T5p8l5MNMuCRUKmotbKZoWPpz9aYxMUOPzCk039pFrKQs4jncv2iXca+
   T4O/xAQLenLsW1dJcKy4lXpuw2MgK+knEX8eedMW37Yfn2STzjzit04ft
   51A8a3NwqsendBzcHfRdn+og3yuHG7k/nTutbzOyCnpyyrfhqdMUfC3jc
   nB/c0g8gEVLPjJd4DSXZooT8rMECAGHXnjkPdJzhFcOoxyqEtoSOCVlik
   ef/k+A6gUZUfaIaLZlCQxBengXDaf/G+3rWfoHry5JlaolJmaUvjjeT8r
   VypsplW9x+W/SVzB8DAFuzsn1CG32YYaNASZjU0AeYD6eBdhRQaZMtDyc
   A==;
X-CSE-ConnectionGUID: oxTTc2+VRq2l/FpbWP4TVw==
X-CSE-MsgGUID: kZSwjrQvQKmKhiSoU674XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="222428763"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="222428763"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 22:17:03 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2BC858204C7
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 13:17:03 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D328D18591D4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 13:17:02 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.34.167])
	by az2nlsmom3.fujitsu.com (Postfix) with SMTP id 5E34A101E52F;
	Tue,  9 Jun 2026 13:16:59 +0000 (UTC)
Date: Tue, 9 Jun 2026 22:16:57 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Will Deacon <will@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
	Gavin Shan <gshan@redhat.com>, Steven Price <steven.price@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
Message-ID: <aigNbs89G4bCQdjY@FCCLS0092175.localdomain>
References: <20260519101217.155740-1-enju.kohei@fujitsu.com>
 <ah638FZAyCSqtzMi@willie-the-truck>
 <41ab4dfb-b91c-46df-99a0-de36686c8fea@arm.com>
 <aiAUceqBREjwXk_V@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiAUceqBREjwXk_V@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_061707_581974_D9F012C7 
X-CRM114-Status: GOOD (  34.65  )
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

On 06/03 12:48, Will Deacon wrote:
> On Tue, Jun 02, 2026 at 04:48:43PM +0100, Suzuki K Poulose wrote:
> > On 02/06/2026 12:01, Will Deacon wrote:
> > > On Tue, May 19, 2026 at 07:12:08PM +0900, Kohei Enju wrote:
> > > > With CONFIG_DEBUG_PREEMPT=y, smp_processor_id() becomes an alias of
> > > > debug_smp_processor_id(). This debug function complains when certain
> > > > conditions that ensure CPU ID stability are not met, specifically when
> > > > it's called from a preemptible context.
> > > > 
> > > > In arm_cca_report_new(), which runs in a preemptible context,
> > > > smp_processor_id() triggers a splat [0] due to this.
> > > > 
> > > > However, the CPU ID obtained here is used as the target CPU for
> > > > smp_call_function_single() to designate a specific CPU for subsequent
> > > > operations, not to assert that the current thread will continue to
> > > > execute on the same CPU. Therefore, snapshotting the CPU ID itself is
> > > > correct, and thus there's no actual harm except for the splat.
> > > > 
> > > > Use raw_smp_processor_id() instead, to directly retrieve the current CPU
> > > > ID without the debug checks, avoiding the unnecessary warning message
> > > > while preserving the correct functional behavior.
> > > 
> > > That's pretty disgusting imo so I'd like to see some more justification
> > > for this approach.
> > > 
> > > > Note that while migrate_disable() would pin the task to the current CPU,
> > > > this path should not block CPU hotplug events. Therefore, we snapshot
> > > > the current CPU ID and accept that smp_call_function_single() may fail
> > > > if the CPU goes offline.
> > > 
> > > Why shouldn't it block CPU hotplug events? What happens if the CPU goes
> > > offline and comes back online again during the loop of continue calls?
> > 
> > It need not. It can continue the calls. The RMM keeps track of the internal
> > progress in the "REC" object for this "VCPU". Hotplug ON/OFF
> > doesn't change the REC object in CCA Guest. So, a REC can come back and
> > execute it. But the Linux could fail the operation if the CPU isn't
> > available for fetching the report, after we do a RSI_ATTEST_TOKEN_INIT.
> 
> I couldn't really shake that out of the RMM spec tbh:
> RSI_ATTESTATION_TOKEN_CONTINUE is allowed to return RSI_ERROR_UNKNOWN
> and I couldn't find anything about hotplug.
> 
> But my main point, really, is why are we not using migrate_disable()
> here? I can't see the justification.

Hi Will,
Sorry for the late reply.

I agree that using migrate_disable() makes this path simpler and
clearer.

I've reviewed the discussion where the original commit was introduced:
    https://lore.kernel.org/linux-arm-kernel/7a83461d-40fd-4e61-8833-5dae2abaf82b@arm.com/
but I couldn't find a strong reason why we shouldn't block CPU hotplug
or use migrate_disable(), even though I can see the current design was
intentional.

So I'm happy to rework the patch to use migrate_disable() and remove
the smp_call_function_single() calls if there are no objections.

> 
> Will
> 

