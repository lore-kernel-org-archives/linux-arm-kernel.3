Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C12DD339A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d97UR0UjnCMrEO5V4kWQDzu6chN5QPIcsxj/Yw+ez/o=; b=ol18ijxx3aG/TeC+lYbqLJG29R
	0hTQR/wqguAOrExD3t7afGP+zPh63IgEvtqXGZAK/Ahb0Q+C2BAgUYqHjkOJVj0HXtm5NqmmwR9R3
	0hqyN/7mKmcezX838Uh98mZ9pv65Pqw8m37ohIq+ypcvk9CKomYhgJPfieZ8lD0QngxmD9T7QKeH8
	o0U9uNMCm33xlR88JR3WAZEb7vS3x1hHZ2Pgtlf0pW2F9ti2HQsnBPX+JCcuwT9fpbpT6qYjaQUq5
	v4ABD5qZHBrvROpPFm4Uyod2p10E1aXgNauj/17DWuCqYgcSqqWvMg3RydxLzvyPRqWxNo66rH+R1
	bbEB3tJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TY4-0000000BehR-1aDm;
	Mon, 28 Oct 2024 17:29:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TW3-0000000BePY-0nKL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2FC09A42A0E;
	Mon, 28 Oct 2024 17:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5085FC4CEC3;
	Mon, 28 Oct 2024 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730136413;
	bh=SKqZVIdbcpTAJdp25Ku/rlpGb1j+HCxQ0QZMwxF98NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/lAKwQDurB3M9qJLZpE61TvOd5s05B2G6+c9/KEZ6fU2GRJekqo0+OK18Dec7yeg
	 8LSARWFaeNF6I9Lt5SZlaeZCmYtOU4QUjCxsgjdYR1ErU+8NW1+In5eGwx3k+bhDPQ
	 8G7Lnhnx1xwLjukiuQpOy5HXIBFc3Uerll5OzvFxsIZvb5GWQTuUpsQrdNsDTxY82U
	 dHoJith1tEq42QRdE7AUKS1TqMJAt8j+ZhrD/vV/zN4/eCfeeMzpQbYc5u/Su4lwFn
	 HXkKZYIxkiZ2p0ygNutzWWHyyDsPRAocJryCCT+99/uCDaEzP/oyu7ugTtzuF4rLId
	 jLu3eTIKqYMVA==
Date: Mon, 28 Oct 2024 17:26:48 +0000
From: Will Deacon <will@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access
 control
Message-ID: <20241028172647.GB2871@willie-the-truck>
References: <20241002184326.1105499-1-robh@kernel.org>
 <20241024103953.GA30206@willie-the-truck>
 <CAL_JsqKT3gXJQLNr+H8D8nmEeGuDxS8iOje6yaCs+ne-4FcCvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKT3gXJQLNr+H8D8nmEeGuDxS8iOje6yaCs+ne-4FcCvg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_102655_316748_B355674C 
X-CRM114-Status: GOOD (  18.98  )
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

On Thu, Oct 24, 2024 at 11:41:11AM -0500, Rob Herring wrote:
> On Thu, Oct 24, 2024 at 5:40 AM Will Deacon <will@kernel.org> wrote:
> > On Wed, Oct 02, 2024 at 01:43:24PM -0500, Rob Herring (Arm) wrote:
> > > diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> > > index 0afe02f879b4..bb93d32b86ea 100644
> > > --- a/drivers/perf/arm_pmuv3.c
> > > +++ b/drivers/perf/arm_pmuv3.c
> > > @@ -770,18 +770,27 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
> > >       int i;
> > >       struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
> > >
> > > -     /* Clear any unused counters to avoid leaking their contents */
> > > -     for_each_andnot_bit(i, cpu_pmu->cntr_mask, cpuc->used_mask,
> > > -                         ARMPMU_MAX_HWEVENTS) {
> > > -             if (i == ARMV8_PMU_CYCLE_IDX)
> > > -                     write_pmccntr(0);
> > > -             else if (i == ARMV8_PMU_INSTR_IDX)
> > > -                     write_pmicntr(0);
> > > -             else
> > > -                     armv8pmu_write_evcntr(i, 0);
> > > +     if (is_pmuv3p9(cpu_pmu->pmuver)) {
> > > +             u64 mask = 0;
> > > +             for_each_set_bit(i, cpuc->used_mask, ARMPMU_MAX_HWEVENTS) {
> > > +                     if (armv8pmu_event_has_user_read(cpuc->events[i]))
> > > +                             mask |= BIT(i);
> > > +             }
> > > +             write_pmuacr(mask);
> >
> > Since this is a new register, should we be zeroing it as part of our
> > reset callback?
> 
> That should not be necessary since EL0 access is gated off in PMUSEREN
> in general and enabling this register additionally requires setting
> the UEN bit. That's only done right after this.

That bit is set unconditionally, but it looks like we always write pmuacr
for v3p9 parts so it should be ok. Thanks.

Will

