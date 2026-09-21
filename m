Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FD2C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbpMCPOoGwJs/JoA+EgW5uc8xxm6ep2bRVgFpoDxIgk=; b=N/NGSYHM0Ap6i9k0jQyzJau9Tm
	Y7w1RroLyrRFBK8iybILuW854Q0uC6mIv0vtukpgFFbQp2rcRtQMG4RI+ecgEkV+OiEVF4+YJ2KNo
	koWVFru5YamwMARV/ReBeeutFXVWA5hWdapKnzFHSPLDctAg+UHo7Scl8A9M+aJRUVPPnYzJQ0LWu
	NYi1UtveXB6WdE33A6P+8+3fuZmxGnkOXeFdja2EXa8sllvruyAiOoDON4YD13xROQ10Si/9ieK+g
	o86WzRG3EKF8eggmhVXSDbvi78f17OIrnpEkQ24ny0VoL8nB5zxoJ4E+ubIWiaoCXq9KPerF26q2B
	zPM7Uy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f0x-00000002OcR-1HsN;
	Mon, 21 Sep 2026 14:29:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f0t-00000002Ob7-3a7G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:29:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9E3419F0;
	Mon, 21 Sep 2026 07:28:53 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8164F3F86C;
	Mon, 21 Sep 2026 07:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790000937; bh=GdCBBFERQ2MnZAE4vUIvESlZ/KGfgi3JMauYWLFutKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vT9ISrEB7+Z18zVsimq7PdDh0N9QjdkuO2kUdjV2nTxj6pxb2tT8duNAb44eMm0Tb
	 PQla5NKFcP4jbzx4/d/tTgWrWui+PHzIhwZvgdT3PBoD+1bYzU8IzQyGHa5jvxteUN
	 7YZqBzg6zMSI01xinyU83P9XziedpXrJFfiZtPhQ=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 5/5] KVM: arm64: Enable HAFDBS for guests not on migration
Date: Mon, 21 Sep 2026 15:28:54 +0100
Message-ID: <arE_Jh4UHiUdjrSi@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <497c6239-a75f-4087-83c8-efface3fe3d7@huawei.com>
References: <20260901171558.2674031-1-leo.bras@arm.com> <20260901171558.2674031-6-leo.bras@arm.com> <497c6239-a75f-4087-83c8-efface3fe3d7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_072859_980766_38E9EC97 
X-CRM114-Status: GOOD (  23.59  )
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

On Fri, Sep 18, 2026 at 07:58:43PM +0800, Tian Zheng wrote:
> 
> 
> On 9/2/2026 1:15 AM, Leonardo Bras wrote:
> > @@ -2570,53 +2571,76 @@ int __init kvm_mmu_init(u32 hyp_va_bits)
> >   out_destroy_pgtable:
> >   	kvm_pgtable_hyp_destroy(hyp_pgtable);
> >   out_free_pgtable:
> >   	kfree(hyp_pgtable);
> >   	hyp_pgtable = NULL;
> >   out:
> >   	return err;
> >   }
> > +static void kvm_set_hafdbs(struct kvm *kvm, bool set)
> > +{
> > +	/* Check if no action required */
> > +	if (!!(kvm->arch.mmu.vtcr & VTCR_EL2_HD) == set)
> > +		return;
> > +
> > +	if (set)
> > +		kvm->arch.mmu.vtcr |= VTCR_EL2_HD;
> > +	else
> > +		kvm->arch.mmu.vtcr &= ~VTCR_EL2_HD;
> > +
> > +	kvm_make_all_cpus_request(kvm, KVM_REQ_RELOAD_STAGE2);
> > +}
> > +
> 
> Hi Leo,
> 
> HD alone is architecturally a no-op. According to the Arm spec, the
> VTCR_EL2.HD field description reads: "When the Effective value of
> VTCR_EL2.HA is 0, this field behaves as 0 for all purposes other than a
> direct read of the value of this bit." So patch 5 as it stands never
> actually enables stage-2 dirty management.

Oh, right, I missed that. :/

For the above to work it would need to have the HA bit:

+	if (set)
+		kvm->arch.mmu.vtcr |= VTCR_EL2_HA | VTCR_EL2_HD;
+	else
+		kvm->arch.mmu.vtcr &= ~(VTCR_EL2_HA |VTCR_EL2_HD);

> 
> In the combined series, I'm planning to replace both kvm_set_hafdbs()
> and our earlier enable/disable hooks with a single derived mode:
> 
> ```
> /*
>  *   logging && HDBSS-capable  ->  HDBSS  (HD|HA|HDBSS)
>  *   logging, no HDBSS         ->  off
>  *   !logging, HAFDBS-capable  ->  HAFDBS (HD|HA)
>  */

Yes, seems correct, if the performance numbers can show patch 5 provides
performance improvements.

> void kvm_arch_update_hw_dirty_mode(struct kvm *kvm)
> {
> 	bool logging = atomic_read(&kvm->nr_memslots_dirty_logging) != 0;
> 	unsigned long target;
> 
> 	if (logging && kvm_supports_hdbss(kvm))
> 		target = VTCR_EL2_HD | VTCR_EL2_HA | VTCR_EL2_HDBSS;
> 	else if (logging || !kvm_supports_hafdbs(kvm))
> 		target = 0;
> 	else
> 		target = VTCR_EL2_HD | VTCR_EL2_HA;
> 	...
> }
> ```

Humm, do we actually need the atomic_read being ran when we are enabling 
dirty_logging? Maybe we can restrain it only to the disabling part.

> 
> HA is always set alongside HD by construction, so the no-op issue goes
> away.

Right.

> 
> I'll fold this into the HDBSS v5 series when I send it out. Let me know
> if you'd rather keep it in your v2 instead.
> 

Feel free to merge your part on top of that, I will work on collecting the 
numbers, though.

Thanks!
Leo

