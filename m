Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7A8CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aSgkWUhPzx8K4/mClsjqZv3PnnYgZuNJSn0DMQeoXY=; b=CIj+v6YSKR2zhlBk1aJHfNhJjw
	r5tQoVl7Gx8yeWH83ift2/N5dpgQvxrbsb7S/oI+u4ylFKcICOwRmVYVIG63SA4Yu+ueTSfMzAIgJ
	v5LOWBgk34FF7spD+BTKnYzDNN3t1sCEmBxGfWVPc04GsoCdJSf5bkgQ/mmt6HfpTXT3qfYx3eOOe
	+a0oF06hgJj/jMm8AAp27/7bZfAw4WNd6Z96vSSf9jWnm9/xgnoIxgwBLU7aw56XAkSwj61aCjV9b
	Egr0UkiJgNIx4kF5xam2edXxRksuGQxmOYlTPWihLPGk+hGz7x7LIpzOTm32i54t4lIUqfkuMl5Pb
	6VDw4vcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0hq-000000069sc-3LKr;
	Tue, 09 Jun 2026 17:57:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0hp-000000069sV-01Tp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 17:57:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF74F60218
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 17:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97AA1F00899
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 17:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781027859;
	bh=4aSgkWUhPzx8K4/mClsjqZv3PnnYgZuNJSn0DMQeoXY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LN/tXPw8AXNYmFuAjkSA7IVKHeFaZ05LF1royqZl9sc1zcIoamIT+zZtZ1WVFqRa2
	 D+ICBldMrN/b1bC4KA7owAgjiEzBwlTMuaGBPqBKaOwCCwofdFUG543t/jvahPomwH
	 F3o7Dvpj3oLQQqTFQI5fr67OvEfVEQwQYtrXchKwxwJjJzONw7Mv0oRFokR7bmed7z
	 pucShdDe481EdQuxZ6O8iZzcRREpT7k4d+qBjByMUtVMNiHUqGH1P7/LE7hwsF4cxF
	 zz52MWE3dFrnrOdIWmGW8BDeWVCmlrDekijIq6xc6AcSJYbR/EGD3w4pxRP3sXk//o
	 55a+inVeDEt9g==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bef8b97655eso1076422066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:57:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+8rHekR4C/T2HRDCbucpG/wrCR4eqqPHo6uQcF0/aDtvLMJ7rRMMy1nqRCjb3R3uRbzbC5i8TF9M3I/o1atwHq@lists.infradead.org
X-Gm-Message-State: AOJu0YzRHUNGvE4CuP74Ve1lnnfxFJuAfTJ0/e/qw/VloL86tbbfPudQ
	iGgeXHMDYJVp4fL4dvW7z/Xx+SVj8V3GDQhLyc1i7hzQAHjl4hiKACx+NxrMbCIL62sy3dkV9Om
	U/uz+OoqN0sWKLHzx/uu8anXaAjHshNE=
X-Received: by 2002:a17:906:d550:b0:bec:1632:eceb with SMTP id
 a640c23a62f3a-bf3a840d8bcmr919741066b.19.1781027858565; Tue, 09 Jun 2026
 10:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260608081108.2244133-1-maz@kernel.org> <aicqzM4W4NN-GndT@google.com>
 <86ldcotbub.wl-maz@kernel.org>
In-Reply-To: <86ldcotbub.wl-maz@kernel.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 9 Jun 2026 10:57:26 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMpvxoVcDvWn3q0C0Dv=0Kknt_BqZ8KqddwuKa5bd44Dw@mail.gmail.com>
X-Gm-Features: AVVi8CcBbJljDF-ob_nMqw_7wUVvIUirAOYqofuY07VBH15GCgGGqOLIaMxlMSM
Message-ID: <CAO9r8zMpvxoVcDvWn3q0C0Dv=0Kknt_BqZ8KqddwuKa5bd44Dw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Hold kvm->mmu_lock while initialising vcpu->arch.vncr_tlb
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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

> > If yes, I think the code looks confusing, at least to a layman like
> > myself. It initially seems like the lock protects against concurrent
> > initializations, but then the NULL check is not done again under the
> > lock. The goal of the lock is not clear without the original report.
> >
> > Mayeb it's clearer to explicitly use barriers if the goal is preventing
> > reordering?
>
> This would require both the initialisation of vncr_tlb to use a store
> release, *and* all the other call sites to use a load acquire.
>
> I really don't think it is worth the churn, nor the (very small)
> burden on the readers.

That's fair. I was mainly just pointing out my initial confusion and
that others may share it. Avoiding the churn on the readers' side is
understandable. Maybe a comment here would help explain why the lock
needs to be held?

