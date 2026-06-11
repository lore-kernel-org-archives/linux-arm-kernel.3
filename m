Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFBDCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 04:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIil3PPPNZBVFp0p+BoOF+dwvTw0E/3Hg89b1+W2I98=; b=CxLdErU3IRa4FU5MvkQ0NKs85T
	vD6Ywe8L+z9MCgHISLINEqSSJq4LK5T4Z8npS+IWoPG/pu6A0bdrAxXmdARWlb+yVLcGiJOhTxePg
	oLAKXwC7Abw5xvN+TgRI6lR5eUnAAoFfzIdmJG3+sVX9mwrURlhHfPl9R5bmb5UKkh2zpJi618IT1
	AgPZyNGOUVk6FyXuSbT4QPMBKk9fc7YHhTJ6IWU6s5Llxb5t9StcjyRZCpvcO4rjca4nQ81h9AVeq
	/rpEb/jisFITv2VzJMmxMqkzygtZ8N3WtH4ryq8EsdYsa4QoU59lY3bhktGNLuFqJb9GrP9a3kTtC
	xcwgEipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWmJ-00000008fGw-1cyl;
	Thu, 11 Jun 2026 04:12:27 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWmF-00000008fG9-11fw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 04:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781151143; x=1812687143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KtcPW09H3aB0abhJvvwgq761264cvkZ+OMuRh+NGI0o=;
  b=lf+16E+bgL/FMyXGCDIR/FyQfEN98WAAH5nK2ZTrIyHSADAGuVxy7CfE
   xnAIOhUJIj+R91sDdVvhJwygFCPRDMWVgsfmE0ZHYZtkGryVuX7UJt9H2
   oBb4Fb4uC/gZ43oXHnWph0QQCfaLuxexTPsIFfV34gzgo9M3Q4TrM+Etp
   SJ2P7D/SpN9VoGOlhZ5oA8e1ChsTw5YYpxxQ4Oy5oHMEExD6lxGYbdZR8
   4vFRtmY6p3wJpf9GVvBih0K8zR9AkwXO9A+aMJNtrZhFDqmxwaeT3JFZR
   czRCaIkEFmDqTuBBZ72NK0x5pE+fFAQejJAntH8rNZlPzemMjXs3unfB1
   w==;
X-CSE-ConnectionGUID: 1zNun6+yThaULrX1sm0tvA==
X-CSE-MsgGUID: UBf//mEIREe8cb15IvSlqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="229898360"
X-IronPort-AV: E=Sophos;i="6.24,198,1774278000"; 
   d="scan'208";a="229898360"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 13:12:19 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 48499C020C2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 04:12:19 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id F074F1801FDD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 04:12:18 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.3.32])
	by az2nlsmom4.fujitsu.com (Postfix) with SMTP id 78A5020000B3;
	Thu, 11 Jun 2026 04:12:15 +0000 (UTC)
Date: Thu, 11 Jun 2026 13:12:12 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
	Gavin Shan <gshan@redhat.com>, Steven Price <steven.price@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
Message-ID: <aio1FN1aVaCDcRfT@FCCLS0092175.localdomain>
References: <20260519101217.155740-1-enju.kohei@fujitsu.com>
 <ah638FZAyCSqtzMi@willie-the-truck>
 <41ab4dfb-b91c-46df-99a0-de36686c8fea@arm.com>
 <aiAUceqBREjwXk_V@willie-the-truck>
 <aigNbs89G4bCQdjY@FCCLS0092175.localdomain>
 <51a76d18-6db9-41f3-a1d4-60360088c442@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51a76d18-6db9-41f3-a1d4-60360088c442@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_211223_841249_48D23AC1 
X-CRM114-Status: GOOD (  42.20  )
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

On 06/09 14:44, Suzuki K Poulose wrote:
> On 09/06/2026 14:16, Kohei Enju wrote:
> > On 06/03 12:48, Will Deacon wrote:
> > > On Tue, Jun 02, 2026 at 04:48:43PM +0100, Suzuki K Poulose wrote:
> > > > On 02/06/2026 12:01, Will Deacon wrote:
> > > > > On Tue, May 19, 2026 at 07:12:08PM +0900, Kohei Enju wrote:
> > > > > > With CONFIG_DEBUG_PREEMPT=y, smp_processor_id() becomes an alias of
> > > > > > debug_smp_processor_id(). This debug function complains when certain
> > > > > > conditions that ensure CPU ID stability are not met, specifically when
> > > > > > it's called from a preemptible context.
> > > > > > 
> > > > > > In arm_cca_report_new(), which runs in a preemptible context,
> > > > > > smp_processor_id() triggers a splat [0] due to this.
> > > > > > 
> > > > > > However, the CPU ID obtained here is used as the target CPU for
> > > > > > smp_call_function_single() to designate a specific CPU for subsequent
> > > > > > operations, not to assert that the current thread will continue to
> > > > > > execute on the same CPU. Therefore, snapshotting the CPU ID itself is
> > > > > > correct, and thus there's no actual harm except for the splat.
> > > > > > 
> > > > > > Use raw_smp_processor_id() instead, to directly retrieve the current CPU
> > > > > > ID without the debug checks, avoiding the unnecessary warning message
> > > > > > while preserving the correct functional behavior.
> > > > > 
> > > > > That's pretty disgusting imo so I'd like to see some more justification
> > > > > for this approach.
> > > > > 
> > > > > > Note that while migrate_disable() would pin the task to the current CPU,
> > > > > > this path should not block CPU hotplug events. Therefore, we snapshot
> > > > > > the current CPU ID and accept that smp_call_function_single() may fail
> > > > > > if the CPU goes offline.
> > > > > 
> > > > > Why shouldn't it block CPU hotplug events? What happens if the CPU goes
> > > > > offline and comes back online again during the loop of continue calls?
> > > > 
> > > > It need not. It can continue the calls. The RMM keeps track of the internal
> > > > progress in the "REC" object for this "VCPU". Hotplug ON/OFF
> > > > doesn't change the REC object in CCA Guest. So, a REC can come back and
> > > > execute it. But the Linux could fail the operation if the CPU isn't
> > > > available for fetching the report, after we do a RSI_ATTEST_TOKEN_INIT.
> > > 
> > > I couldn't really shake that out of the RMM spec tbh:
> > > RSI_ATTESTATION_TOKEN_CONTINUE is allowed to return RSI_ERROR_UNKNOWN
> > > and I couldn't find anything about hotplug.
> 
> Like I said, we are dealing with Virtual CPUs (RECs here) and the only
> condition that the RMM enforces is the _CONTINUE calls are issued on the
> same VCPU (REC). Hotplug doesn't change the REC (as a REC cannot be
> modified or added once the Realm is ACTIVE).
> 
> > > 
> > > But my main point, really, is why are we not using migrate_disable()
> > > here? I can't see the justification.
> 
> There is no reason, why we couldn't use this. TBH, I wasn't aware of the
> helper ;-) at the time this was initially designed and we didn't want to
> block CPU hotplug. We could always request a new report, it is not like
> aborting a report generation has any side effects.
> 
> > 
> > Hi Will,
> > Sorry for the late reply.
> > 
> > I agree that using migrate_disable() makes this path simpler and
> > clearer.
> > 
> > I've reviewed the discussion where the original commit was introduced:
> >      https://lore.kernel.org/linux-arm-kernel/7a83461d-40fd-4e61-8833-5dae2abaf82b@arm.com/
> > but I couldn't find a strong reason why we shouldn't block CPU hotplug
> > or use migrate_disable(), even though I can see the current design was
> > intentional.
> > 
> > So I'm happy to rework the patch to use migrate_disable() and remove
> > the smp_call_function_single() calls if there are no objections.
> 
> I am fine with removing with migrate_disable() approach.

Hi Suzuki,

Thank you for your clarification, and explanation in this discussion.
I'll work on v3 soon.

> 
> Cheers
> Suzuki
> 
> > 
> > > 
> > > Will
> > > 
> 
> 

