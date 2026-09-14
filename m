Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF91AC88E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZYe0H/DkNs3S1y5Hj6oAegp5W2rxwzj7DXdbHt4+9Y=; b=3TBvsQhCWySv3zLe3Cpuw/RztA
	jWHV0U5lP19nC+QXwDRnmfyLNxnWlak5h7rkIy0gIrmjixaQt1fq/bC4lgyk7jZciFfZwCGgxd0V0
	+GpFD7diBfquSCvDbFIm1g/vNEXMGs4cKDb4qf3/fj5qm5P4zSSoNvrlWARN5QOZVJMtGY0irbGyv
	1QRtnW7yCkvc0V1mvkham69dSDL28pBFpGFd782VWYW5ZS7nYw6/ORh8oSYb+LMO5nvJMn5Aj0icc
	2fo5cq+LrQQCQJo7noSjcDtwuFZTFIr5f8awCWu/sYxoFJBF/d360QuJYJzQpuHEquziqSESepUdF
	XbLJgNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62GN-00000002not-3IdP;
	Mon, 14 Sep 2026 08:42:07 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62GA-00000002nc0-201q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:41:59 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso8983475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789375311; x=1789980111; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZYe0H/DkNs3S1y5Hj6oAegp5W2rxwzj7DXdbHt4+9Y=;
        b=XBlTFRKLuw1hULU+Xc3kdOytYxc+jmDqJVOeKpbC04TLO66lQMRU1m5WPKnGoCy8zy
         9qLBAnqCeGNA885Qvc6SGQ0Ym376E33FLloTUqmcckjDsE86UwTgcmEeHlBWPe/zk0Oo
         cCmtvLWP84E0wTwzl2Z24cfdlwAut1zqE54jfJxRIrJxoRxUH4qH+HGGUccFlmYlpBwE
         DKCGyr9HqAmt+9L3Td7noofB3ZIEmrP0JTtQmKoh9lJr9RPCWPqmukGEIQ8oj5EoGxke
         CNDOukq/jZuopcSXqf4mkP8Fa1DEGvb92cAURtKfVSph5ffURmtGBhqT/dZW+tpiIPzf
         nQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375311; x=1789980111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZYe0H/DkNs3S1y5Hj6oAegp5W2rxwzj7DXdbHt4+9Y=;
        b=cKhgW/40ZJ9sOiv4j959P9D7v6/0L7XspOjmZKwWuuwKKqPMAMnTWEB4otrOYgAmZm
         e4pL5UBWuocFcP2P7LDTosslSSycEbjALtR+Yd/UtCb0tJG18/Y+oUP+33iOzG409rKe
         lM6rCzFnuED4kpOlngkgxuXkDZTwVL8HgfNGm/lPHfng1q4EbUEsS+hO/Ebf8SFE7RAt
         qAbEd8ZdebbN39vFXapRN/gcDMIdOZS5pXP7zsxlxCnIYy6dj/H71qiI8kCCNc5v9z6X
         wSSgWUVOqgh3R8cBUK936Uoh+kKo24poCP9y/l22gC1jUtAxsWe8HKIQPaVJC1tXkuz7
         zcAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgo40jPmYr1vDXjHRkZxPZuj/icVefl8CEltFVmSpzI1W/yKAIfYiJ2kJY5/ebuGIuxntcozruepcFGFe/jOjr@lists.infradead.org
X-Gm-Message-State: AFuF++lcq8Uluw5FAXmJL1jnkHRERtdUK9oO5Bw4Y/1ma2TZZfPaBBkR
	tpDtEVK1C0XAmb9tIe62fosLtRKfyN4/VTN1pBmth7hH/acgQJGNED2/2OpuSS9ajQ==
X-Gm-Gg: AYBFou25LhRgCn2nmZc+lIX4/Y1A0PPv+I7iI0gsAaLg2q0RFIVh4yQW7DAtZC0mujA
	j4iOavZUtQZTAPp2pwLj7hP0DOsnHCoFGTx1nH+0YiGLXXHC3PwTy6csBLFWae9RTSjjMfwc8Aa
	PjQbmaA5fpmZ1MLe4gzquCNMaOCYHAWlG4ThML7/OHDwxC+ISV6bMKt/+pDmYSGW38BAE0Mp6VY
	y98jhtF2fHok53Y1Jt15/1qq6om4Ei+I3CCWEJ+GLHv+z9Y5isHDbQHphfbGCnIzkGQ65KwpnyN
	Ouf6q9cZLXY/N/cccawTvlD1XatzhtJ4B2x+wGBNu3FgvWjRUB5ysle0O3tcyvAl4OGIYENEDFp
	c2G/9hS+nJnBGAt5m96kk8ti4WS5Ut1XdccSm1d3lHG154hLJHZ9bXJ3W+sTpvmXO9Rsyft+1Ss
	/29VsiWtoNSNPNTpxZ9MMmUTwJZJ73BxFzgeG25Odqjyr1sXuxralhMSP2IIlETL6extq5jQ1Nt
	tm7q2r5ETv+dBzqGBDj27cZK/Np6myo6k6JZr2GDVs=
X-Received: by 2002:a05:600c:3b9a:b0:49c:ffde:45ff with SMTP id 5b1f17b1804b1-49e7a66b656mr16287655e9.17.1789375310790;
        Mon, 14 Sep 2026 01:41:50 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm25945683f8f.32.2026.09.14.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:41:50 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:41:46 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com
Subject: Re: [PATCH v2] KVM: arm64: Fix protected VM fault on system with
 pages larger than 4K
Message-ID: <aqezSgNz55DzInH0@google.com>
References: <20260914075839.4019904-1-vdonnefort@google.com>
 <864ifs6xn4.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864ifs6xn4.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_014154_566941_898E9CF8 
X-CRM114-Status: GOOD (  33.98  )
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

On Mon, Sep 14, 2026 at 09:32:47AM +0100, Marc Zyngier wrote:
> On Mon, 14 Sep 2026 08:58:39 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > Just like commit 08f97454b7fa ("KVM: arm64: Fix protected mode handling
> > of pages larger than 4kB") fixed the boot of non-protected VMs on system
> > larger than 4K pages, align the fault IPA down to the page-size for
> > protected VMs.
> > 
> > To paraphrase Marc, pkvm_pgtable_stage2_map() assumes the address passed
> > as a parameter is aligned to the size of the intended mapping, while
> > HPFAR_EL2 gives the IPA minus the bottom 12 bits, regardless of the
> > system page size configuration.
> > 
> > Add a check at the start of pkvm_pgtable_stage2_map() as we do not
> > support !PAGE_ALIGNED arguments and use the gfn as an argument in all
> > callers.
> > 
> > Fixes: ea03466e806f ("KVM: arm64: Handle aborts from protected VMs")
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > ---
> > 
> > Changelog:
> > 
> > v2:
> >   - Use gfn_to_gpa(gfn)
> >   - Drop "phys" from the PAGE_ALIGNED check, it isn't a requirement.
> >   - Fix gmem_abort() as well (Sashiko)
> > 
> > v1: https://lore.kernel.org/all/20260913173516.3122436-1-vdonnefort@google.com/
> > 
> >  arch/arm64/kvm/mmu.c  | 7 ++++---
> >  arch/arm64/kvm/pkvm.c | 3 +++
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 9ba86450fe4a..ee78201a44df 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1672,10 +1672,10 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
> >  		 * PTE, which will be preserved.
> >  		 */
> 
> Context:
> 
> 	if (s2fd->nested)
> 		gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
> 	else
> 		gfn = s2fd->fault_ipa >> PAGE_SHIFT;
> 
> [...]
> 
> >  		prot &= ~KVM_NV_GUEST_MAP_SZ;
> > -		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
> > +		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(gfn),
> >  								 prot, flags);
> >  	} else {
> > -		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
> > +		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), PAGE_SIZE,
> >  							 __pfn_to_phys(pfn), prot,
> >  							 memcache, flags);
> 
> So 'gfn' is not related to the faulting IPA in the nested case, but is
> the output address of the guest's own S2. You probably end-up with a
> livelock handling the same fault forever, or worse.
> 
> It is a bit annoying that neither gmem nor pkvm are using
> kvm_s2_fault_vma_info, which has the ability to reports all the
> important stuff, as it would avoid this sort of bugs.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Using kvm_s2_fault_vma_info would surely help the THP support for protected VMs
[1]. I am thinking now about bringing it as part of that series.

However for a fix, that's a bit much?

[1] https://lore.kernel.org/all/20260911135053.146435-23-vdonnefort@google.com/

-- 
Vincent

