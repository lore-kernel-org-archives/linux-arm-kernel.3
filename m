Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49FDE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulXepV2jQyhdTDFrhVhKMW5GrTR/j6m545w2I4GVRQs=; b=pms51xcTagS4h/2l7I4FaCwuw3
	hZc7HOOba7TouS7KdD934fjddyfde5q8vQWFRdrxlUjkvybv/dk0thLGAKLiZ+QspsO+35zpEnEaW
	CxIr+Nr4o5YBrD7T3lfcRkZjIooNsNG6Av/SnBIfEKmDUmt2L4UK9F/Wt4ogtDLVM7B7nMdCiTHf6
	HtyFhEUJSR9j5GJ9GT15dDUjDZCuhkklEL7vX07WkOLFmdUMtm0GbDMMtiBvwAPv4/5MdulTJlF1k
	5HcByQHyaLuAy8l2pL1swf7fD3D4H97bfmyhQGhQxPH9bgO+kKvjDHqyFgZyUFoyRmneiHbrU/mjk
	zWang/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMqa-0000000EzVr-0A2J;
	Wed, 11 Dec 2024 13:33:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMnm-0000000Ez4N-0W85
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:30:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43621d2dd4cso4285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 05:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733923852; x=1734528652; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ulXepV2jQyhdTDFrhVhKMW5GrTR/j6m545w2I4GVRQs=;
        b=HOYHInVasdOBo7Ll2dz8jie3t0mPcGwS3n+32jyxR/dMa13krVKimqNGfxhMLE/yHg
         FwYCcrlA/MhHN92J0dv/VQM9e32kOBhVxs46fYPvdFb5MQFwQTISQAh5Z3nkCVTw+dZA
         BlO0tipZP1QHTBMHO3TSMmgccrWO7OhEnEtOv3hbsy+EIVP0WQc6lOkA7OZElkiKkMYt
         y0Lh6jBZJrkVWP9gHGs2iOQOw177nQbhVmRSnhN6VXympnApLqusvHJHR2BnE6VnzRwT
         U2FAavo5HROTAVjU2NVWokK76Dbuym+XQJ5CppsWwzz9l52uFua1APsddK/l86OlH5qD
         Fmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733923852; x=1734528652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulXepV2jQyhdTDFrhVhKMW5GrTR/j6m545w2I4GVRQs=;
        b=C2l36ArB9rh5ZwJXYvWccNAEel0ZuW3lTB45c0Tgtuoh73VVkpPXIFOaDSSkmduAkp
         mrXW7JL4u2PhExPnl4jL90fGr211Ohc6fSynFTMw1cs4hUJvKSyRg1RmzQHv+7XBp1AN
         FVEQOT/uPG0++JIxIS+JvH5hQgOTtJhNg4i9xxG2oFakLZ9eDXs4SEMspk7PiEPAr1oX
         639S/52MvMUV+eaQUP5R+tjyzxEmSsffOxw+VFPi+yGonOb0DR0E8QL48IoFG2zIlWwX
         x8z5KRRLEboJdfoYDai+Y+DwqXppLK97o3HgVYDU2cR4jmlBp96pMtho7B9Ra/+NJjqt
         vnKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0fF+nAGLApH1SG7sCrXEvy1JgFfV/xePW71wW1TacodqcFwPzkeYY6iNraNPFjkqn8tHGpDXKj6bTj7x5Ai/Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxJnkRFoHpJeiV92AM4funZ5uB7FfuSZOvNw0Jxn3llY0mGm78y
	+Rk5FOYs8n9FjPZomvxz6sgruVx6Tdwhz2kn5o9e57xR0M4ACYtNRMRgjK1CzZCcFsm1q3TEza1
	0JITsX859bZbjdlpkGFRi4a1Ocjt8S/zlDpj4
X-Gm-Gg: ASbGncuuLIk8Ggv8uFu17RTve/O3/mL6Hd4+yZRGU6u6ch6VDWtzPKrSgQfZjWmzSh6
	6lFxPjRxGs3nIi80bS1Wae0+/ZRHCV8FD0pe93zLd4MOz5PB39I/O/BuMS3ygifn9
X-Google-Smtp-Source: AGHT+IHRmXPiKVksQ+Q/0QXbqfJBa96/TnVG7AgNvAzq10478M87vDfF4wy2b2OQtQNTCiOmKVHSqDgIJgLmrCedgrY=
X-Received: by 2002:a05:600c:6c8a:b0:436:1811:a79c with SMTP id
 5b1f17b1804b1-4361dc51b9bmr977485e9.5.1733923852355; Wed, 11 Dec 2024
 05:30:52 -0800 (PST)
MIME-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com> <20241202154742.3611749-5-tabba@google.com>
 <Z1MwAomiLhnMn--k@google.com> <CA+EHjTy6Y6w9RyU2Vn8O+DDviSJf=P-Y4c+xVFqY-3GmHBv3kQ@mail.gmail.com>
 <Z1mTtS9nGvVM-BIq@google.com>
In-Reply-To: <Z1mTtS9nGvVM-BIq@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Dec 2024 13:30:15 +0000
Message-ID: <CA+EHjTz6B_8YzreN5EEqh6u-ZGLj0GjBxGe2THCwjWP0RT5KeA@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] KVM: arm64: Use KVM extension checks for allowed
 protected VM capabilities
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_053054_161255_84CECC31 
X-CRM114-Status: GOOD (  17.42  )
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

On Wed, 11 Dec 2024 at 13:29, Quentin Perret <qperret@google.com> wrote:
>
> On Monday 09 Dec 2024 at 08:14:15 (+0000), Fuad Tabba wrote:
> > Hi Quentin,
> >
> > On Fri, 6 Dec 2024 at 17:10, Quentin Perret <qperret@google.com> wrote:
> > >
> > > On Monday 02 Dec 2024 at 15:47:31 (+0000), Fuad Tabba wrote:
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > > index fb733b36c6c1..59ff6aac514c 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > > @@ -329,34 +329,20 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
> > > >
> > > >       bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
> > > >
> > > > -     /*
> > > > -      * For protected VMs, always allow:
> > > > -      * - CPU starting in poweroff state
> > > > -      * - PSCI v0.2
> > > > -      */
> > > > -     set_bit(KVM_ARM_VCPU_POWER_OFF, allowed_features);
> > >
> > > For my understanding, why do we drop this bit?
> >
> > Since the hypervisor is responsible for the power state of protected
> > VMs. This should either be a separate patch or I should explain it in
> > the commit message. Any preference?
>
> Gotcha, perhaps make that its own patch so we have a commit message
> motivating the change?

Will do.
/fuad

