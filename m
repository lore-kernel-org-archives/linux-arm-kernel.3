Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAC8CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 09:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LUDHGMpxY5/D93pfLKYpEzHyH09fS49yr/B51sO0vo=; b=4JT0+UV6maQ0hQiG4BEMgEHsi6
	HFQ/nQM6Lg67Jt8p+1zuogMvaumFcQBRyW5tKLA41wdltpbpVfri6ZAKXDcB1RTbKRVOxSKhCDdsf
	kvedTHXEDIM3IspLuKMox2mAe5atxSui58OO6Q+22NZMDdKI26Rkz/aWJ5eQ1PltUyVYoBJyJ2yne
	LsEf7Lnheag5CHAtzleOmrwRGyDnGpieKXOduhPseZwdsCtUUIBbx2cvJKQppSHGeOak6KraEJSig
	8fnm0WI6CCeraFj43S6La+Sn+0gCKYpOPK0I/k0xKVOuD0WnbSKI1k3DyWuGibksBEHB0kweVNmIr
	vyTk8rcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3z8-0000000GSeW-28nS;
	Thu, 04 Jun 2026 09:03:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3z7-0000000GSe2-0C9T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 09:03:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE854402FA;
	Thu,  4 Jun 2026 09:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067CD1F00893;
	Thu,  4 Jun 2026 09:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780563808;
	bh=9LUDHGMpxY5/D93pfLKYpEzHyH09fS49yr/B51sO0vo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=auhIrtK9ikXMdXDAcVSTuvzh6VYtK99/HrDClrE5/wSkJtxxX5DNXBPaM9o2Adw4p
	 4YBDaRR66KpOtPX87uSnZaTlivRWZ6jLVqfltutjDQLx23WALPYYy6LS26XgBiH9hX
	 iXnvJxDA/IIu0nk5B8jm4N8MYL/2M+5zer/AzXoKsiHY4gjEM8hco6uit6JO0VNAPi
	 uw7Cc/kUjzfVlQy7iZSTTMpuEZnZl5+jqK6VZQOq3/0Rqlinh9TZ8ygb+Hi+PT+82p
	 c2R0H9cOx0cG/bBkyro3pNven9jghAs4YfTS4bo467AvvBOltFnJuzMnSYJGt7H4e/
	 enhbqCB4nnGJQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Mostafa Saleh <smostafa@google.com>,
	Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org
Subject: Re: [PATCH 1/3] arm64/mm: Simplify SWIOTLB setup in arch_mm_preinit()
In-Reply-To: <aiAojTDO_FcEG8XC@google.com>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-2-smostafa@google.com>
 <aiAdyLKSRGjV4_r3@kernel.org> <aiAojTDO_FcEG8XC@google.com>
Date: Thu, 04 Jun 2026 14:33:23 +0530
Message-ID: <yq5ay0gur82s.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Mostafa Saleh <smostafa@google.com> writes:

> Hi Mike,
>
> On Wed, Jun 03, 2026 at 03:27:52PM +0300, Mike Rapoport wrote:
>> Hi,
>>=20
>> On Wed, Jun 03, 2026 at 11:05:20AM +0000, Mostafa Saleh wrote:
>> > At the moment, arch_mm_preinit() checks if the system has limited
>> > addressing or is running under CCA to enable SWIOTLB, only after to
>> > be forced to true anyway if it was false due to
>> > CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC being unconditionally true for
>> > arm64.
>> >=20
>> > Simplify this logic, by making it clear that SWIOTLB is always used
>> > but its size depends on the address layout of the system.
>> >=20
>> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
>> > ---
>> >  arch/arm64/mm/init.c | 11 ++++-------
>> >  1 file changed, 4 insertions(+), 7 deletions(-)
>> >=20
>> > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> > index 97987f850a33..fcc9c05a8fe6 100644
>> > --- a/arch/arm64/mm/init.c
>> > +++ b/arch/arm64/mm/init.c
>> > @@ -336,25 +336,22 @@ void __init arch_setup_zero_pages(void)
>> >  void __init arch_mm_preinit(void)
>> >  {
>> >  	unsigned int flags =3D SWIOTLB_VERBOSE;
>> > -	bool swiotlb =3D max_pfn > PFN_DOWN(arm64_dma_phys_limit);
>> > +	bool limited_addressing =3D max_pfn > PFN_DOWN(arm64_dma_phys_limit);
>> >=20=20
>> >  	if (is_realm_world()) {
>> > -		swiotlb =3D true;
>> >  		flags |=3D SWIOTLB_FORCE;
>> > -	}
>> > -
>> > -	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb) {
>> > +	} else if (!limited_addressing) {
>>=20
>> Can realm_world() coexist with limited_addressing? Then the size adjustm=
ent
>> is still required.
>
> My guess would be no, my understanding is that CCA guests have niche
> hardware.
>
> However, the check for limited_addressing is negated, we adjust the
> SWIOTLB to be smaller if no bouncing is needed.
> So, if this is a realm world, address space layout is irrelevant as we
> keep the original size which is larger.
>

That=E2=80=99s correct. Realm guests need swiotlb to always be enabled, and=
 we
should not reduce the size of the pool.

>
> Otherwise, this alters the current behaviour.
>
>>=20
>> I'd also make this more explicit:
>>=20
>> 	if (max_pfn > PFN_DOWN(arm64_dma_phys_limit))
>
> Sure, I can drop the bool.
>

-aneesh

