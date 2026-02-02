Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2880E7DEF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 14:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2kyDBMjKUAvLcpywCWxpjEa8MLWup/GMgXHmqrdgQw=; b=Oqu6ECJ8ih2NZ1E2+QZzo25L1R
	EF8T9RQ4O8XWXgudBQXx/PpQ5mCZKpDi4POaTDqF35fAcJW8T+YTZ0afee2QMvXC+ST8ySXJBMfi5
	CKM1k0XEjf1yplMmielhc3UgaLlrTGvTjV079Yg8gVJ4YbxUFMo8QSGgG4fE/FR7OZPEm9huK3re3
	wvTdyaU5LC0LYW0TT0e/ZExSvT445e751RNgi7//neQ2p9GEdnENDydHCyswg7b2AYlSqgDm2bQom
	B5aU0GS2sOUTeZn45JIwUY2SybmL6hBpKrR+gPMiitihOdy3DXA3p5qvaUkRwAuYq8V5J30MTlyRD
	M0hXppHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvKy-000000058Rv-2LhI;
	Mon, 02 Feb 2026 14:55:36 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvKv-000000058RO-43J9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 14:55:35 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-50299648ae9so1132651cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 06:55:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770044132; cv=none;
        d=google.com; s=arc-20240605;
        b=DenQWpb1lfETD3YOPsgNwFGeUGQ5utZ9CurPXpllGss19cM29I0xs1uj0baYuHnV7F
         Y9LvOcVdWdMosJ2gXZ9IYOmnJ+yl8ySgs0NEmkRpXvlah8EaKFzIdWRAEV6VsuCPyom6
         3KUmkSlg4OP/zr9F5VUvCbQRRBkN+SJWkyqZDthR2CRF7ekj3GVKkqXv4p8i0aukXkxa
         DHSV8XZnwQPrJQMvE+Q7Yy2Eg3a2z8Vwfx88YkhfXFCW/OnUMckyKkXWY1PGLwZhnbBG
         9gzD+Us2iHQ72PAJ6NW5AvOYUxPp45XEW/wBDdASsXN0voDwTHCokTa6RO8rnTG89KzJ
         Nesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p2kyDBMjKUAvLcpywCWxpjEa8MLWup/GMgXHmqrdgQw=;
        fh=DQkL7NzUYsx8hn3Vwm0R+KPiRqQvVvCCJnnw6/DFb0s=;
        b=EdOxph+SoXFsjTuochZ2zuNRtBY1OS+nfKdD71ns0hwS9pFlvG72hG9uGHt4RAiC3F
         +19e8/Txfml9VNz5XKJWIjfSkcr4V0Agy9m31mp278Z1k3XrgPW2aVOx4NDvrSX34sh0
         ImROpqFwy7vIw3u59g/IRmSuu9AodbVbwhyNzJsCf19ESvRuGC9mAYEXDWFjWJ+BQvvC
         lWL95bwLokGvJQk0hPE6ln2L1aJX1gL5HTzWv30AgkEYooOUkvxWNagH77l4bDKz3/Vc
         qnWdSk0S/tx3rJqUqv4wZEmRiFfRPblBuAMOo3QdC8NOoQFNRFMPIBsgBsH9c7clSe2t
         ukBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770044132; x=1770648932; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p2kyDBMjKUAvLcpywCWxpjEa8MLWup/GMgXHmqrdgQw=;
        b=WodzqeMoQ267mntnyz36Y2BbfuEXdXXBraN9eKCx3i+M93mvR4Zsaaxbg1rlR1Tiy5
         qxNkBFURjYNKCFpB1j/6jsI98xY7AfKb7vwlgnfiDlZOs8vg+m1FwCPgbHe3/oFZEN2K
         0jIUdbICG2WJzO1XnUKdg0LO/XemlG7MJ3jTL4d8V1r7II9eC+qNZbJO49u2uSFWYaeJ
         nwRvvAMbO9CryljVaGrJ/yqtp2Tn4Z6dFpmzLZDsx8YuowqLJZ06TRS7gjTIg+R0zT0f
         r+4S9ulOkjZvQ22hqkaJru8l3EvQp7so0qlBrZf1dvp2ooFGUgAAjP75R0v5Vi9w3eNk
         cY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044132; x=1770648932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2kyDBMjKUAvLcpywCWxpjEa8MLWup/GMgXHmqrdgQw=;
        b=mIRPiP3uE88RGNWK8W6hxmbwjQVd2arQBsnVX4PEwmaJ8S5XX+r8jn+DpxEMh4VO/A
         6pnlpL1lQtYglUEzSEQYssdN9IOtTNkBs+7P8cCRb/E7DyE6j5UBlclm1HGC0L05Iv8s
         oeMPToQSx61tRZFvCMCuqvjWsQZtnYDFX8PlVa6t84TGJu+0hux/dQetmLW2ZUfJHX1O
         P+UKYXxRsZg7m9JCIS4OrZq75YvWoCxANoG97/0oW7TVKYKZ8Rrfj3ZECCagqmS3ARcU
         fI78G7EfOOoKIFIcsvJBP3eMaud4uMy2mrxWEuBSli1XQyStsLUJKsVU9XRD09j41guZ
         Hflw==
X-Forwarded-Encrypted: i=1; AJvYcCUcKlwYt2qVNKZbZCCg1J2EsRfMSyj+dAMF9HUo7UktArwhgejvWwdr2h9I+8xZX4WFQFEuV/m1RaalGRfTtGH9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1X9vgEPDUaev2GQgwWy160z2Cp4vq2q79aP3jahnnIePD+Dez
	GlOvcy84QdcXQeeM3NZm7ncKqB9A6FewnXhkKGjfj8WKsMLnfT9xyn/HX8dAWzDHDxTSSa5cSw+
	bq6j5jbmoniUEQG7uhqJpJBRFbLVmS4z6K8j6uvfA
X-Gm-Gg: AZuq6aI/6zLskqcBDgDWckhww6cM8p/PTp0BdzcLUEf3YfvcTI8k8u7y9jY2FDXPyKW
	Zudy5F+n9uPd7CYiWlC8sKzEZRKVdYRPwiS1HNNsVzyhusv2rD6Hb5soBa2sRTyYgPmdOVCGdXP
	4CtPLrHSmTWJnt4dS8MTBTeMvy5mLNOJuPsqyzSKrc0oJVKCmhfTzWeqF91hVxIhmXLAb9tCaI3
	JJvZX8QZT44VFa2MfQc3kY6kCVcoyvebU3D9DLkzFzmqFWp5fYZzivdEutTvNf7xt5a/vDK
X-Received: by 2002:ac8:5d45:0:b0:4ff:bffa:d9e4 with SMTP id
 d75a77b69052e-505dfb55052mr19488481cf.13.1770044132084; Mon, 02 Feb 2026
 06:55:32 -0800 (PST)
MIME-Version: 1.0
References: <20260202130513.49436-1-tabba@google.com> <86tsvz9pbg.wl-maz@kernel.org>
In-Reply-To: <86tsvz9pbg.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Feb 2026 14:54:55 +0000
X-Gm-Features: AZwV_Qj88kuF0nlt2JcSTWbHw1T0UvegRJGqt9wyIYg1kj2dP_rnWko34sG6YH8
Message-ID: <CA+EHjTxC3SXJSHkChVfzLs7C5M4iD59VhKYiHf99MjxuNSPZaA@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: nv: Use kvm_phys_size() for VNCR
 invalidation range
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_065534_040114_B28F9ED2 
X-CRM114-Status: GOOD (  26.42  )
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

Hi Marc,

On Mon, 2 Feb 2026 at 14:45, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 02 Feb 2026 13:04:24 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > KVM: arm64: nv: Use kvm_phys_size() for VNCR invalidation range
> >
> > Protected mode uses `pkvm_mappings` of the union inside `struct kvm_pgtable`.
> > This aliases `ia_bits`, which is used in non-protected mode.
> >
> > Attempting to use `pgt->ia_bits` in kvm_nested_s2_unmap() and
> > kvm_nested_s2_wp() results in reading mapping pointers or state as a
> > shift amount. This triggers a UBSAN shift-out-of-bounds error:
> >
> >     UBSAN: shift-out-of-bounds in arch/arm64/kvm/nested.c:1127:34
> >     shift exponent 174565952 is too large for 64-bit type 'unsigned long'
> >     Call trace:
> >      __ubsan_handle_shift_out_of_bounds+0x28c/0x2c0
> >      kvm_nested_s2_unmap+0x228/0x248
> >      kvm_arch_flush_shadow_memslot+0x98/0xc0
> >      kvm_set_memslot+0x248/0xce0
> >
> > Fix this by using kvm_phys_size() to determine the IPA size. This helper
> > is independent of the software page table representation and works
> > correctly for both protected and non-protected modes, as it derives the
> > size directly from VTCR_EL2.
>
> I'm a bit confused by the explanation. We have plenty of code that
> uses pgt->ia_bits outside of the NV code. And yet that code is not
> affected by this?
>
> I'm asking because NV is clearly a case where the pkvm_mappings
> aliasing is unambiguously *not* happening.
>
> Isn't the real issue that we are entering the NV handling code for any
> S2 manipulation irrespective of NV support? Would something like below
> help instead?

That would definitely work (just tested it). I just assumed that the
code is there in case in the future we want to support nv + pkvm....
Although, I chuckled a bit as I was writing those words :)

I was going to ask if you'd like me to respin, but this is a
completely different patch. Would you like me to write it up and send
it (my contribution would be the commit msg)?

Cheers,
/fuad


> Thanks,
>
>         M.
>
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index cdeeb8f09e722..d03e9b71bf6cd 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1101,6 +1101,9 @@ void kvm_nested_s2_wp(struct kvm *kvm)
>
>         lockdep_assert_held_write(&kvm->mmu_lock);
>
> +       if (!kvm->arch.nested_mmus_size)
> +               return;
> +
>         for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
>                 struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
>
> @@ -1117,6 +1120,9 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
>
>         lockdep_assert_held_write(&kvm->mmu_lock);
>
> +       if (!kvm->arch.nested_mmus_size)
> +               return;
> +
>         for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
>                 struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
>
> @@ -1133,6 +1139,9 @@ void kvm_nested_s2_flush(struct kvm *kvm)
>
>         lockdep_assert_held_write(&kvm->mmu_lock);
>
> +       if (!kvm->arch.nested_mmus_size)
> +               return;
> +
>         for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
>                 struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
>
> @@ -1145,6 +1154,9 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
>  {
>         int i;
>
> +       if (!kvm->arch.nested_mmus_size)
> +               return;
> +
>         for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
>                 struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
>
>
> --
> Without deviation from the norm, progress is not possible.

