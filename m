Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23FACD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 05:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dxgi0jgxHF8ZOJD3E0wYhy+yjP1j3xhNtbRyo2XZKFg=; b=eW4E0I25GKBBjJEgxhoo3GFEWn
	OiLrL2R1yj7qimHQrUnj1L5wO6iFedSgTsJxmSWAPaALpRDi8ntsp210hgToekIdNnK0FSBryrs0Y
	CT4Eq4BFz+jnMWhLx0roYaEYSO97FXJ0HNOmLXU0HtIacqdJaBWbvRHkV2ExsHc9jE3mcL9/dGvUq
	TYa6svvQshJwLTQZjo+1SJv5BPM7pcHe51Tz/d5GOGwGadpwWAUIIHmcu6gNxs+5A4moZ7QxUIA04
	O0yjQDpYp5Joca7k3KJ980ufhhrxjhG792K8rOKwxaqTgBZN10WJjP9TDwXSWEGqbViPbd9w11dCD
	0e9/1gXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUI54-0000000CLhO-0AY9;
	Tue, 02 Jun 2026 05:54:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUI52-0000000CLhB-2RWw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 05:54:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A9DF8600AA;
	Tue,  2 Jun 2026 05:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2961F00898;
	Tue,  2 Jun 2026 05:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780379663;
	bh=Dxgi0jgxHF8ZOJD3E0wYhy+yjP1j3xhNtbRyo2XZKFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hyUYuEaZIBffvstbIQtU4xBRLFyatjz177ACyR/00AmIyTLww57nMlfTZqm7JvaFc
	 WptNFndbT9ABnMbAA8D1h45MzsemcWKb76lgHevcDTzBsUFitxJNyEp39LoXP/gCL6
	 DPBXPT0TFN4yCb9C2tZwUyap62F8y6VZvvo+oha/p/83XthtXihrPxwLwbYdanYQgN
	 bbjhcCk8CvPOkbSvtzbHwjiHxdGntgTOpa6qzWlxgRle3YvCRE8iPhDOFmq45IhCtt
	 FkGRZ2jkUZ9ouerlUZR7MLBV5sjRJXbRATfWCC9XYbwZy8fuyrdnOVNEW6hh3PkK/I
	 j4pgkeRqfLdHQ==
Date: Mon, 1 Jun 2026 22:54:22 -0700
From: Oliver Upton <oupton@kernel.org>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kees@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: vgic-its: Drop the translation cache
 reference only for the erased entry
Message-ID: <ah5wDnNJ7AKGLDxh@kernel.org>
References: <ah2c5lu4JbUg7dj-@v4bel>
 <ah3Yx0fjguUdCk_G@kernel.org>
 <ah4yiavdXTB10P0d@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah4yiavdXTB10P0d@v4bel>
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

On Tue, Jun 02, 2026 at 10:31:53AM +0900, Hyunwoo Kim wrote:
> On Mon, Jun 01, 2026 at 12:08:55PM -0700, Oliver Upton wrote:
> > Hi Hyunwoo,
> > 
> > Nice find.
> > 
> > On Mon, Jun 01, 2026 at 11:53:26PM +0900, Hyunwoo Kim wrote:
> > > vgic_its_invalidate_cache() walks the per-ITS translation cache with
> > > xa_for_each() and drops the cache's reference on each entry with
> > > vgic_put_irq(). It puts the iterated pointer, though, rather than the
> > > value returned by xa_erase().
> > > 
> > > The function is called from contexts that do not exclude one another: the
> > > ITS command handlers hold its_lock, the GITS_CTLR write path holds
> > > cmd_lock, and the path that clears EnableLPIs in a redistributor's
> > > GICR_CTLR holds neither. Two or more of them can drain the same cache
> > > concurrently, and if each one observes the same entry, erases it and then
> > > puts it, the single reference the cache holds on that entry is dropped
> > > more than once. The entry can then be freed while an ITE still maps it.
> > > 
> > > xa_erase() is atomic and returns the previous entry, so put only the entry
> > > that this context actually removed. The cache reference is then dropped
> > > exactly once per entry even when the invalidations run concurrently, and
> > > the behavior is unchanged when only one context runs.
> > 
> > Next time:
> > 
> > Cc: stable@vger.kernel.org
> > 
> > > Fixes: 8201d1028caa ("KVM: arm64: vgic-its: Maintain a translation cache per ITS")
> > > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> > > ---
> > >  arch/arm64/kvm/vgic/vgic-its.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> > > index 1d7e5d560af4..1e3706ac3b8e 100644
> > > --- a/arch/arm64/kvm/vgic/vgic-its.c
> > > +++ b/arch/arm64/kvm/vgic/vgic-its.c
> > > @@ -597,8 +597,10 @@ static void vgic_its_invalidate_cache(struct vgic_its *its)
> > >  	unsigned long idx;
> > >  
> > >  	xa_for_each(&its->translation_cache, idx, irq) {
> > > -		xa_erase(&its->translation_cache, idx);
> > > -		vgic_put_irq(kvm, irq);
> > > +		/* Only the context that erases the entry drops its cache ref. */
> > > +		irq = xa_erase(&its->translation_cache, idx);
> > > +		if (irq)
> > > +			vgic_put_irq(kvm, irq);
> > >  	}
> > >  }
> > 
> > This definitely works but TBH I'd rather just plug the subtle race and
> > do invalidations behind the its_lock since it already nests with the
> > cmd_lock.
> 
> Thank you for the review.
> 
> > 
> > Could you give this a spin?
> 
> After testing, I've confirmed that this patch approach works well too.
> 
> Shall I submit v2 based on this fix?

Yes, please do.

Thanks,
Oliver

