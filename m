Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9808CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9ApFTtIbFndOO5kudQ+mdr96c2vq9dMtY6RicL5Hhg=; b=K4L4+FDI32fcCiq35KvRSPC7YM
	AVKBPvS8T/R0t/Yrik6w3UoduKNh7vdMsljbeNdv/8yV4VlbsVvFr3Hiu9lQytDJWsGz8pu8t182T
	4seb5WsX+UxWwL2a/Rl6bR/2dbEQNsgLdmX7J8dsCGgS+2W70Z+LZUKACAkl/CNez2y3XeMD0uAtf
	GL8Kkl7OJjqcDgPeqULqZFqtnhuU+i5mLhw+lDa6Ni8AZYZtseh4V0D+Bp2Q72VXaGyDgJYpXB4J0
	cWV6C+SEFA8IdEi5SLLZ18ywxTvBsbq4TK93B/BGZvJ6UT33Een71qKAoMZGIssHp6u7JDi9dK8Ui
	I+dJ2f1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ76y-0000000EGkn-3yQn;
	Mon, 15 Jun 2026 13:12:20 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ76v-0000000EGkG-2E73
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:12:20 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51765531803so70711cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 06:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781529135; cv=none;
        d=google.com; s=arc-20240605;
        b=EMBGLE0j+CG2qM4UdfSt2B41Qs5e6zv8oq3BYtdzajAn1Pj73GilsImYPrFGyDvHQh
         3U+O4QKeOqJnkwFWanQaw1nO+ZXyQu8jxCkyL/doArpxc79LiTGkPyoibtLtO8JZ4I/Y
         XpNJv9M04YSQY2AduhkJyKEpSeRqRqoCXN3qua1szSdjKiWE5D75HSBE4u9hw7C2l/Dv
         sAxB2pLh/UZhsGb0bBrln9D9lXfhUheEfIwfq/Rw9kcAsvwn9iAzjs4HAZdsotFjJNy8
         6gIWVB8/NlyfTucXA/b52T88ScnBUQvCl4rukSSL+YokfRUabDi6K+FizqI49ymbRgYJ
         F3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V9ApFTtIbFndOO5kudQ+mdr96c2vq9dMtY6RicL5Hhg=;
        fh=V+MIhl4jDfa5NFAKLdFQDJz3Lj2wybPFopVtWVDupAM=;
        b=aCpLUX3NrptdKg3ImMrJE6bCllI+IWf2GX/eEGemafF5Pj6YxLY3vqd/PE73WfLXac
         sqzHicds9UEFSeGSbLaKM2BkAtV8utw/v7iy7uicxLHv+X2Tvt+F7GSNzhzCI30PRLvc
         p0He2C36jKzWcSYEQaL68fBXgatG5XFs7PV9FD9xhSs2GqBDx/WbXmRSe6Z2VpBMQ1CP
         kSOQUlKjbF3++xKtRrzZGQcwj3FwwQLBTbIM6t02bTaP3bNzROi6XDxeSM74kN9uB06Z
         +U0nxz2ekNDr+qQ++zMcdUiAYPz8GB9iOBIieITMzZPaxwG9NafXDfPQKDo4UTuqj/wo
         dR8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781529135; x=1782133935; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V9ApFTtIbFndOO5kudQ+mdr96c2vq9dMtY6RicL5Hhg=;
        b=jJ6ONHYt6yc7U3EbniKYrLPUOwu39ShoUHYhPepZK3rCNuXhCqq/cOtc6hfgBdaCYw
         zXYsYJuesoNJ91hsPPC0/njcsh3xcPGHcv87HVUYeKarjHze0OXhqBRoP2+7lLQYv5u8
         bZvbc7KLHl7OYp4c4m8llWnEQ+GlszPvuL2lMskFvaMYifGqy0nwBleHblEwZ1TbDZAi
         +lTi+1sHghX8DQHhRAgdVXv1IfuSCN5GskjAMBQMW8dG/voa2m7w+8G8ecXFBhx2lRgW
         VN3o9TJGwHjehSpuJ7F9STeo9jmbKQnvbqXCb2Vr3AwfW4ILPyGcBMCr+JqPZ0EjxCjj
         PNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529135; x=1782133935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9ApFTtIbFndOO5kudQ+mdr96c2vq9dMtY6RicL5Hhg=;
        b=eFdCyAlJe65tEBSbhF/7QljaMJLMCDx8p6KgxpCRCvCpOMKad6ses2NP5fYQrw/PR9
         xs7WgwkkwLZxOj7sf6d4rBaBJj4MV0H7ZfHD/eEzfnHSqTLfJ3z+d9W4aq8CeKHdDUyb
         z9Am+6mIWg4Gh4Fq2fqTV1dOyMtKGt4Chh5CaqAb+TYeRUr9Tx2B8T/clts+xf6QWkwD
         F4xoOe5Qo1MipQSCI7m79nrJ50jvoGbqVazjh+UiPR1XEDA9z/7AaOqKisfWX0mqftm7
         Wl2u+NISIl/qBW8QVCpJpIcE+mfual9AwgR+hJ8Srb3uOrwVFEn2cXgzaB8AfwYolc5x
         GacA==
X-Forwarded-Encrypted: i=1; AFNElJ/8vhMaKb0jaRpOMiBYomfhKUXrc6a/jeDuIHWcY2S2rFcnQNcV933cZzoRS+gaW2kaEnBefCE2DMobInBtc7FI@lists.infradead.org
X-Gm-Message-State: AOJu0YyE8ITsk2HcP06TelyhUL6SqfR6e7EhoTSsbVhPWEcuZxzia6hd
	hwqgoEcDuimmstm31x7P14VV4HUzk6fB9zA3W+KQ8vH0TPsJHj6i8T9epXxHCGTO+SKjBjeh2x0
	mNm3Y9vrJbiuz/apLTGY/1xYad7o1rUv1ZlGqmHSZ
X-Gm-Gg: Acq92OEeQUVY2AH5Z9U7+V/wRnG16ukZZ95JG7lbZorhGwpDj3YeO7SFOPFzlJudsEf
	oj9/C6O+cCSilU8ChkLnLh0drvXiZ3JW30WuzGJuOx/fxazC+oROJkQhgaWa9edIRt+kOJ7XUoK
	8X0BKavYeK//SHHAYNLdrJNolUOoPEkfKFHYgTZ54osJkU1FVGbbSpwA4llRp7B+MWG7eQdszcz
	O6nBDrgWz2P5s26wrL3ZOSw243lETTAXKig/j68sCrk7xOeLFQshJxP4btP6tYwUY119HgLOMjN
	/fe+0OjUohfrQ4rrQJA=
X-Received: by 2002:a05:622a:5810:b0:516:3def:1cf4 with SMTP id
 d75a77b69052e-519872df3b4mr1903741cf.1.1781529134395; Mon, 15 Jun 2026
 06:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com> <20260612065925.755562-3-tabba@google.com>
 <ai_1z13TyEXbHx4Q@google.com>
In-Reply-To: <ai_1z13TyEXbHx4Q@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 14:11:37 +0100
X-Gm-Features: AVVi8CfeXGRS4qbHoDv1tNV11kQoNJh7W4G-vCO44nFd_V-kW6IwV2WUcVJxP2E
Message-ID: <CA+EHjTw_goANXAuFiDdkcSW4d0xtTJjqO5Q=ySn9F_pHn+ZBJg@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] KVM: arm64: Use guard(hyp_spinlock) in pKVM
 hypervisor code
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Per Larsen <perlarsen@google.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_061217_604589_1DC50BBF 
X-CRM114-Status: GOOD (  32.39  )
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

Hi Vincent,

On Mon, 15 Jun 2026 at 13:53, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Fri, Jun 12, 2026 at 07:59:16AM +0100, tabba@google.com wrote:
> > Convert the manual hyp_spin_lock()/hyp_spin_unlock() pairs in
> > arch/arm64/kvm/hyp/nvhe/{pkvm,mm,page_alloc,ffa}.c to
> > guard(hyp_spinlock) and scoped_guard(hyp_spinlock), dropping several
> > unlock-only goto labels in favour of direct returns.
> >
> > hyp_fixblock_lock in mm.c is left as an explicit lock/unlock pair: it is
> > acquired in hyp_fixblock_map() and released in hyp_fixblock_unmap(), so
> > its critical section spans two functions and cannot be expressed as a
> > single lexical scope.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c        | 154 +++++++++++----------------
> >  arch/arm64/kvm/hyp/nvhe/mm.c         |  37 ++-----
> >  arch/arm64/kvm/hyp/nvhe/page_alloc.c |  13 +--
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c       |  86 +++++----------
> >  4 files changed, 105 insertions(+), 185 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 1af722771178..46cd4fa924be 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -313,17 +313,16 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
> >                             struct kvm_cpu_context *ctxt)
> >  {
> >       DECLARE_REG(u32, id, ctxt, 1);
> > -     int ret = 0;
> >
> >       if (id != HOST_FFA_ID) {
> > -             ret = FFA_RET_INVALID_PARAMETERS;
> > -             goto out;
> > +             ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> >       }
> >
> > -     hyp_spin_lock(&host_buffers.lock);
> > +     guard(hyp_spinlock)(&host_buffers.lock);
> >       if (!host_buffers.tx) {
> > -             ret = FFA_RET_INVALID_PARAMETERS;
> > -             goto out_unlock;
> > +             ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> >       }
> >
> >       hyp_unpin_shared_mem(host_buffers.tx, host_buffers.tx + 1);
> > @@ -336,10 +335,7 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
> >
> >       ffa_unmap_hyp_buffers();
> >
> > -out_unlock:
> > -     hyp_spin_unlock(&host_buffers.lock);
> > -out:
> > -     ffa_to_smccc_res(res, ret);
> > +     ffa_to_smccc_res(res, 0);
> >  }
> >
> >  static u32 __ffa_host_share_ranges(struct ffa_mem_region_addr_range *ranges,
> > @@ -418,18 +414,20 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
> >       DECLARE_REG(u32, fraglen, ctxt, 3);
> >       DECLARE_REG(u32, endpoint_id, ctxt, 4);
> >       struct ffa_mem_region_addr_range *buf;
> > -     int ret = FFA_RET_INVALID_PARAMETERS;
> > +     int ret;
> >       u32 nr_ranges;
>
> nit: inverted christmas tree

Ack.

>
> >
> > -     if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)
> > -             goto out;
> > +     if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE ||
> > +         fraglen % sizeof(*buf)) {
>
> nit: I don't know if we wouldn't want extra parenthesis here for readability.

Sure, will add parentheses around the second operand.

>
> > +             ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> > +     }
> >
> > -     if (fraglen % sizeof(*buf))
> > -             goto out;
> > -
> > -     hyp_spin_lock(&host_buffers.lock);
> > -     if (!host_buffers.tx)
> > -             goto out_unlock;
> > +     guard(hyp_spinlock)(&host_buffers.lock);
> > +     if (!host_buffers.tx) {
> > +             ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> > +     }
> >
> >       buf = hyp_buffers.tx;
> >       memcpy(buf, host_buffers.tx, fraglen);
> > @@ -444,19 +442,14 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
> >                */
> >               ffa_mem_reclaim(res, handle_lo, handle_hi, 0);
> >               WARN_ON(res->a0 != FFA_SUCCESS);
> > -             goto out_unlock;
> > +             ffa_to_smccc_res(res, ret);
> > +             return;
> >       }
> >
> >       ffa_mem_frag_tx(res, handle_lo, handle_hi, fraglen, endpoint_id);
> >       if (res->a0 != FFA_SUCCESS && res->a0 != FFA_MEM_FRAG_RX)
> >               WARN_ON(ffa_host_unshare_ranges(buf, nr_ranges));
> >
> > -out_unlock:
> > -     hyp_spin_unlock(&host_buffers.lock);
> > -out:
> > -     if (ret)
> > -             ffa_to_smccc_res(res, ret);
> > -
> >       /*
> >        * If for any reason this did not succeed, we're in trouble as we have
> >        * now lost the content of the previous fragments and we can't rollback
> > @@ -465,7 +458,6 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
> >        * sharing/donating them again and may possibly lead to subsequent
> >        * failures, but this will not compromise confidentiality.
> >        */
> > -     return;
> >  }
> >
> >  static void __do_ffa_mem_xfer(const u64 func_id,
> > @@ -480,29 +472,29 @@ static void __do_ffa_mem_xfer(const u64 func_id,
> >       struct ffa_composite_mem_region *reg;
> >       struct ffa_mem_region *buf;
> >       u32 offset, nr_ranges, checked_offset;
> > -     int ret = 0;
> > +     int ret;
> >
> >       if (addr_mbz || npages_mbz || fraglen > len ||
> >           fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> > -             ret = FFA_RET_INVALID_PARAMETERS;
> > -             goto out;
> > +             ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> >       }
> >
> >       if (fraglen < sizeof(struct ffa_mem_region) +
> >                     sizeof(struct ffa_mem_region_attributes)) {
> > -             ret = FFA_RET_INVALID_PARAMETERS;
> > -             goto out;
> > +             ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> >       }
> >
> > -     hyp_spin_lock(&host_buffers.lock);
> > +     guard(hyp_spinlock)(&host_buffers.lock);
> >       if (!host_buffers.tx) {
> > -             ret = FFA_RET_INVALID_PARAMETERS;
> > -             goto out_unlock;
> > +             ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> >       }
> >
> >       if (len > ffa_desc_buf.len) {
> > -             ret = FFA_RET_NO_MEMORY;
> > -             goto out_unlock;
> > +             ffa_to_smccc_res(res, FFA_RET_NO_MEMORY);
> > +             return;
> >       }
> >
> >       buf = hyp_buffers.tx;
> > @@ -512,53 +504,41 @@ static void __do_ffa_mem_xfer(const u64 func_id,
> >                       ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> >       offset = ep_mem_access->composite_off;
> >       if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
> > -             ret = FFA_RET_INVALID_PARAMETERS;
> > -             goto out_unlock;
> > +             ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> >       }
> >
> >       if (check_add_overflow(offset, sizeof(struct ffa_composite_mem_region), &checked_offset)) {
> > -             ret = FFA_RET_INVALID_PARAMETERS;
> > -             goto out_unlock;
> > +             ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> >       }
> >
> >       if (fraglen < checked_offset) {
> > -             ret = FFA_RET_INVALID_PARAMETERS;
> > -             goto out_unlock;
> > +             ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> >       }
> >
> >       reg = (void *)buf + offset;
> >       nr_ranges = ((void *)buf + fraglen) - (void *)reg->constituents;
> >       if (nr_ranges % sizeof(reg->constituents[0])) {
> > -             ret = FFA_RET_INVALID_PARAMETERS;
> > -             goto out_unlock;
> > +             ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> >       }
> >
> >       nr_ranges /= sizeof(reg->constituents[0]);
> >       ret = ffa_host_share_ranges(reg->constituents, nr_ranges);
> > -     if (ret)
> > -             goto out_unlock;
> > +     if (ret) {
> > +             ffa_to_smccc_res(res, ret);
> > +             return;
> > +     }
> >
> >       ffa_mem_xfer(res, func_id, len, fraglen);
> >       if (fraglen != len) {
> > -             if (res->a0 != FFA_MEM_FRAG_RX)
> > -                     goto err_unshare;
> > -
> > -             if (res->a3 != fraglen)
> > -                     goto err_unshare;
> > +             if (res->a0 != FFA_MEM_FRAG_RX || res->a3 != fraglen)
> > +                     WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));
> >       } else if (res->a0 != FFA_SUCCESS) {
> > -             goto err_unshare;
> > +             WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));
>
> I am not sure this is really better for this function. At least we had a single
> callsite to this WARN_ON(ffa_host_unshare_ranges) ...
>
> Or alternatively if we really want guard() this can just set ret = XXX and then
>
>   if (ret)
>       WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));
>
> So we can keep a single call site for the rollback.

Agreed, the single rollback callsite is better. I'll use a flag to
keep the original control flow readable:

>
> >       }
> > -
> > -out_unlock:
> > -     hyp_spin_unlock(&host_buffers.lock);
> > -out:
> > -     if (ret)
> > -             ffa_to_smccc_res(res, ret);
> > -     return;
> > -
> > -err_unshare:
> > -     WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));
> > -     goto out_unlock;
> >  }
> >
>
> [...]
>
> >  int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
> > @@ -996,22 +975,19 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
> >       struct kvm *host_kvm;
> >       unsigned int idx;
> >       size_t vm_size;
> > -     int err;
> >
> > -     hyp_spin_lock(&vm_table_lock);
> > -     hyp_vm = get_pkvm_unref_hyp_vm_locked(handle);
> > -     if (!hyp_vm || !hyp_vm->kvm.arch.pkvm.is_dying) {
> > -             err = -EINVAL;
> > -             goto err_unlock;
> > +     scoped_guard(hyp_spinlock, &vm_table_lock) {
> > +             hyp_vm = get_pkvm_unref_hyp_vm_locked(handle);
> > +             if (!hyp_vm || !hyp_vm->kvm.arch.pkvm.is_dying)
> > +                     return -EINVAL;
> > +
> > +             host_kvm = hyp_vm->host_kvm;
> > +
> > +             /* Ensure the VMID is clean before it can be reallocated */
> > +             __kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
> > +             remove_vm_table_entry(handle);
> >       }
> >
> > -     host_kvm = hyp_vm->host_kvm;
> > -
> > -     /* Ensure the VMID is clean before it can be reallocated */
> > -     __kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
> > -     remove_vm_table_entry(handle);
> > -     hyp_spin_unlock(&vm_table_lock);
> > -
> >       /* Reclaim guest pages (including page-table pages) */
> >       mc = &host_kvm->arch.pkvm.teardown_mc;
> >       stage2_mc = &host_kvm->arch.pkvm.stage2_teardown_mc;
> > @@ -1042,10 +1018,6 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
> >       teardown_donated_memory(mc, hyp_vm, vm_size);
> >       hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
> >       return 0;
> > -
> > -err_unlock:
> > -     hyp_spin_unlock(&vm_table_lock);
> > -     return err;
>
> For this one too I doubt this is really interesting: only one path using
> err_unlock and actually the entire label could be just removed to to simply do
> hyp_spin_unlock() return -EINVAL;
>
> This would avoid adding another tab with that scoped_guard(). But that's
> probably my aversion to scoped_guard() talking.

The scoped_guard makes the lock scope visually explicit here: the
lock must be dropped before the long teardown tail that follows, and
scoped_guard makes that boundary clear. It also prevents forgetting
the unlock on the early return. I think the extra tab is worth it for the
clarity it provides.

Thanks,
/fuad


>
> >  }
> >
> >  static u64 __pkvm_memshare_page_req(struct kvm_vcpu *vcpu, u64 ipa)
> > --
> > 2.54.0.1136.gdb2ca164c4-goog
> >

