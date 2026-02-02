Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9E1E73147
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCcD9bj7awZZLZPuAnMOEAmooVssTLmcQS2kNDZinC8=; b=B499UXYC1pQXITNNvgRyTtHDRa
	8FxKU9kiY22wL8Sw/3HvLLr7D7JW93V2S9T1Pl6c5DQKwlh9KA/ZtWzYA+C7b7I/BuSJTKEOX5RZi
	D7q/XaC/Twk2/bI2L076dDrSW3wY8xMOdxNSwMvcQ1UFoRP3hDpN5e5Kt4s7ylw7c5nx79VTCDsTC
	06CueAuU11x19YX3dzG086glCn+ByvNfLKNv2w/p7ZfDLMT9LnQK05oZ6QYmBZn8LBoGEmg06BFB9
	ZCiM7L9kzKKkh9tKKYDEbRbe/brYS10nYeSgf4XCd3Vvp5MAj//Md5VB32iYOKO8mhkgNbIDkQR+0
	U60d9RRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpnG-00000004g8G-4ATo;
	Mon, 02 Feb 2026 09:00:27 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpnE-00000004g7r-0zd5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:00:25 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-505d3baf1a7so933691cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 01:00:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770022822; cv=none;
        d=google.com; s=arc-20240605;
        b=Z/aEVq3TNCNmcITEdV2MoNZaM8sD6oKf8+S1bYRX+m6exho8+BUTlJ06MIVIydzYF0
         9HJ3urVVXJYhhF4rjAKrBnd122KaQpzyQtWpLxDRn+0ng7TJAGP7QU3Wr2YYItWDKdui
         1egyQc6qyE+bunaC1ELorxjzdMhURYRl1UvRTYfM9O8gKmLO2R14ENgh69DHgKKA1H5O
         fWPYnwlbBLcr9lU9JWNzfnTaB1S9if8CwMBKuw2ngLpuoHd1F6dtVJsS5GJN9CXdZIms
         v627y1qKtnnXTU+z3fL4UMLH35i1jxIUvtxHuiU+doRpQTBCdepEwJIQwHIWKffO5LJ/
         ba6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mCcD9bj7awZZLZPuAnMOEAmooVssTLmcQS2kNDZinC8=;
        fh=+kgnWcVEH+6m/cl4EzliRfC8XzlAEwtaccXGhVRE8rA=;
        b=BHup8IWZuWEMYfv/HpLao0wmqLAzbV+LMjGDw5Tf9bie9WzrkNcvjhlXkb8J2FCjVl
         V6ULeUTLszittPUKR4LHmbLB9gmQCKmUDHS4EdCyDdhgKJK4HMyx9XcOp9Ol94cMtS8b
         3xQv1m4p6gQtXcbMlbBS+H/fuT1xZ/NMX+nxh0eB4ZTVKrRKu00ZK79p900D/Y+mUiiZ
         ifkapGp3hiFUaMouwWztw4mgCgen9utxKp8we1/IziKirek8rXtoR7c0+Kbg/M/iWYzj
         57boycl/oFIhiek6o67MRTqckJR1+/dEBGhwcxMJgDj1NpXm3zEdTOPX6aoDoZpt/V6o
         oIEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770022822; x=1770627622; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mCcD9bj7awZZLZPuAnMOEAmooVssTLmcQS2kNDZinC8=;
        b=ox5Ey7c1OLHNLgnzgBZIQXnnTf9lpM5NQ0vLKBLSHD0TYfDVKEPz4801lhaNux9G6K
         KzyXkOMkLZ1sllt/9CiCOO/45YPrcSnMQhpZNZvh1loeJwRI3zxU6y/qS//cybTAg/6h
         /mliMmGTKYsc1UPbdRNHas+R9AjGV7KJwgHsGcTDp8lMVzP6VeCDFeIQDZQFHukTKvVj
         Zy0l7WHFHjQkYZvBUzkSdwOYcaJxvZEQTGKmgRmEAGFP6CSTXBAGp69puxyhfU98FVaM
         Ll5A36eW++31G3Nk+OaU0dpfOaSZJOtWjLrmNo94i0OQxmH8v+Jszk9HKAZjLQDBQUJP
         i3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770022822; x=1770627622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCcD9bj7awZZLZPuAnMOEAmooVssTLmcQS2kNDZinC8=;
        b=WCTuRNUY96e51rlTCcocxrohu+z4VlXUJ8gah5ODMWwI+D8S254IX7I+NkWSwEIQNu
         3dZl2hhG7e3Sq9l7a9BW+zu7+8FFIDVnB+d36dFpGCFBW6epN4s63xQ4sLi0Q6FCy3p8
         vG72O7EDVNnOwsspRqfrUn9pFHYR+pE4xtep7idr9nMXYs/z4A2CGgevNd9PZXlhhrce
         qDQMgbdsUHHL0geCE79Vlnm07ViDK0dFJPizZebElR5W+Y6XT50ycyFmnMy8FObhGiRH
         /6um9H870Dx6q0fqYeRUjePByh+gu2Q+QR9zjVSiuFjtmiY1hlksBCaH9Bm8xYHl2wZC
         mFWA==
X-Forwarded-Encrypted: i=1; AJvYcCVlZE91zajyZgcoJ1Kse+br7PNvfqcPaiAb9nQ2N5naIj6wBybvos0wNoJ6W44XRe2t5S9JCIJX3svtD4Xhe04T@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5duqUYFymbQ6k9AQY5Q1s91OMWmt5//b1hXoWd9AMf992J9eO
	SuGKDy9wZkWNBK/jPbeXCeYhfHKJpztKk8exXf0Y1Ap1IJ8HCiplcMXyocaZPbzZIRHLZlOYwHZ
	lHI+H1bOkdVFkk30m/TY8JzSheHldJocIksz3h8t1
X-Gm-Gg: AZuq6aKeOlRXUsjCnG6bTrAqPmvqLZBAm4ws5zuAYLAl8RTnnmeq2ogGMtZWY04b+/n
	Q2DNBvZPXM2kUKBHYDixJPn/vWAaCAJo3oA5dlGB7g1RyJZcvSngyfdkrmkQezh7ER5rjWr04Kh
	gAaGB53oNDxi/VJI7xAEo2omra5cxr0LyAzWAhVMD53W4F3kNNVxWWBEe8AtZtLwACjqE4WE4Hy
	meUJeYvRhcVGCB09KfCBm4Ly4o/KOoIkfmWvTLyUxGX9cvM66Es1u+g+UZWtTX52Z7UEXaL
X-Received: by 2002:a05:622a:3d1:b0:4f1:9c3f:2845 with SMTP id
 d75a77b69052e-505dfb30e91mr17084781cf.9.1770022821656; Mon, 02 Feb 2026
 01:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-21-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-21-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Feb 2026 08:59:45 +0000
X-Gm-Features: AZwV_QiYpw-7eH_Ok5Bnjv2eot8sO20awaRxhk21veOJg4c86-z9Wey20QWTlg4
Message-ID: <CA+EHjTxAEah7N1myCgc-XRDjSFLiQcYHQtNjLWt=Ns_Rag6vPw@mail.gmail.com>
Subject: Re: [PATCH 20/20] KVM: arm64: Add debugfs file dumping computed RESx values
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_010024_300106_D6025687 
X-CRM114-Status: GOOD (  29.05  )
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> Computing RESx values is hard. Verifying that they are correct is
> harder. Add a debugfs file called "resx" that will dump all the RESx
> values for a given VM.
>
> I found it useful, maybe you will too.

I'm sure I will :)

> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h |  1 +
>  arch/arm64/kvm/sys_regs.c         | 98 +++++++++++++++++++++++++++++++
>  2 files changed, 99 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index c82b071ade2a5..54072f6ec9d4b 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -375,6 +375,7 @@ struct kvm_arch {
>
>         /* Iterator for idreg debugfs */
>         u8      idreg_debugfs_iter;
> +       u16     sr_resx_iter;

Storing `sr_resx_iter` in `struct kvm_arch` effectively makes this
debugfs file exclusive (returning -EBUSY on contention). Standard
`seq_file` implementations should be stateless, using the `loff_t
*pos` argument to track the index. This allows multiple users to read
the file simultaneously without blocking each other.

>
>         /* Hypercall features firmware registers' descriptor */
>         struct kvm_smccc_features smccc_feat;
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 88a57ca36d96c..f3f92b489b588 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -5090,12 +5090,110 @@ static const struct seq_operations idregs_debug_sops = {
>
>  DEFINE_SEQ_ATTRIBUTE(idregs_debug);
>
> +static const struct sys_reg_desc *sr_resx_find(struct kvm *kvm, u16 pos)
> +{
> +       unsigned long i, sr_idx = 0;
> +
> +       for (i = 0; i < ARRAY_SIZE(sys_reg_descs); i++) {
> +               const struct sys_reg_desc *r = &sys_reg_descs[i];
> +
> +               if (r->reg < __SANITISED_REG_START__)
> +                       continue;
> +
> +               if (sr_idx == pos)
> +                       return r;
> +
> +               sr_idx++;
> +       }
> +
> +       return NULL;
> +}
> +
> +static void *sr_resx_start(struct seq_file *s, loff_t *pos)
> +{
> +       struct kvm *kvm = s->private;
> +       u16 *iter;
> +
> +       guard(mutex)(&kvm->arch.config_lock);

My understanding of `guard()` is that it releases the lock as soon as
the current scope ends (i.e., when `sr_resx_start() `returns). If the
intention was to protect the iteration, it seems like `sr_resx_next()`
and `sr_resx_show()` would end up running unprotected. That said,
converting this to a standard `seq_file` implementation should remove
the need for locking altogether.

I guess you based your code on the existing code for the idregs
debugfs. I had a look at that, and at vgic-debug, and I think they
both can be simplified and made more robust [1]. I also have a diff
that converts this to use `seq_file`. It's pretty similar to what I
have for idregs in the series I sent out [2]. Let me know if you'd
like me to share it.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260202085721.3954942-1-tabba@google.com/
[2] https://lore.kernel.org/all/20260202085721.3954942-2-tabba@google.com/




> +
> +       if (!kvm->arch.sysreg_masks)
> +               return NULL;
> +
> +       iter = &kvm->arch.sr_resx_iter;
> +       if (*iter != (u16)~0)
> +               return ERR_PTR(-EBUSY);
> +
> +       *iter = *pos;
> +       if (!sr_resx_find(kvm, *iter))
> +               iter = NULL;
> +
> +       return iter;
> +}
> +
> +static void *sr_resx_next(struct seq_file *s, void *v, loff_t *pos)
> +{
> +       struct kvm *kvm = s->private;
> +
> +       (*pos)++;
> +
> +       if (sr_resx_find(kvm, kvm->arch.sr_resx_iter + 1)) {
> +               kvm->arch.sr_resx_iter++;
> +
> +               return &kvm->arch.sr_resx_iter;
> +       }
> +
> +       return NULL;
> +}
> +
> +static void sr_resx_stop(struct seq_file *s, void *v)
> +{
> +       struct kvm *kvm = s->private;
> +
> +       if (IS_ERR(v))
> +               return;
> +
> +       guard(mutex)(&kvm->arch.config_lock);
> +
> +       kvm->arch.sr_resx_iter = ~0;
> +}
> +
> +static int sr_resx_show(struct seq_file *s, void *v)
> +{
> +       const struct sys_reg_desc *desc;
> +       struct kvm *kvm = s->private;
> +       struct resx resx;
> +
> +       desc = sr_resx_find(kvm, kvm->arch.sr_resx_iter);
> +
> +       if (!desc->name)
> +               return 0;
> +
> +       resx = kvm_get_sysreg_resx(kvm, desc->reg);
> +
> +       seq_printf(s, "%20s:\tRES0:%016llx\tRES1:%016llx\n",
> +                  desc->name, resx.res0, resx.res1);
> +
> +       return 0;
> +}
> +
> +static const struct seq_operations sr_resx_sops = {
> +       .start  = sr_resx_start,
> +       .next   = sr_resx_next,
> +       .stop   = sr_resx_stop,
> +       .show   = sr_resx_show,
> +};
> +
> +DEFINE_SEQ_ATTRIBUTE(sr_resx);
> +
>  void kvm_sys_regs_create_debugfs(struct kvm *kvm)
>  {
>         kvm->arch.idreg_debugfs_iter = ~0;
> +       kvm->arch.sr_resx_iter = ~0;
>
>         debugfs_create_file("idregs", 0444, kvm->debugfs_dentry, kvm,
>                             &idregs_debug_fops);
> +       debugfs_create_file("resx", 0444, kvm->debugfs_dentry, kvm,
> +                           &sr_resx_fops);
>  }
>
>  static void reset_vm_ftr_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *reg)
> --
> 2.47.3
>

