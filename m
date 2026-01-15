Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9113D44C61
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 15:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JHhgPo73JFubMx4EP8h9jX67e75KNMkM7M/+r7y04Y=; b=jHEvauuDpxCixIqbL0fgR2dhye
	z0x+tmQ/Dc+UiFbk/2aL/GEfUq/x1DQroZfs1x69B/cgs10EqSzuAfh+Oo43pKrTD3j8uqPLNxGay
	+1E6SVbzCALGbSF04QUe6L5DwXI14gkiJB+LJ1OkABNieeoKE4NkWHUBioFxxq/cUAOSiA+r7mY6Q
	sqtXZchQ6S/hYDynNX8+4QRXYvJD/GygBcRNZCBk1HT0YXs2DXh0qhlv8IRgatNbssM+sLF6gZtpt
	CZnPj7j7hFGoU37cMP8ZSIsBD8ABFF/EIKzE+MtcIQg32ZhkUwK6hBJDXzOR7vLkbyvuPTZdWUV49
	5s5J1r+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgP9D-0000000Ca34-1WwD;
	Thu, 15 Jan 2026 15:20:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgP9B-0000000Ca26-1cxo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 15:20:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47a95a96d42so52625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 07:20:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768490427; cv=none;
        d=google.com; s=arc-20240605;
        b=TJNPJHnxHt3zb1LZpVe32fX5KKJO8s3w52yMWkp1AsR/SXx9Y6ciIfZS1J4rGI/ZQj
         dwhK/qC6XEx5ED5HbsPe1nPpdW2HHj3gEBSA8hvlIjjU7ek5+LsndoPmSjbb6bt6ze+d
         CCLX7Ukaoj3ryAW9Ai7TSbOdWk4jUI3OdUGAv4OwIQsJ3QSAFrhunM3XjgL+xhwpA75l
         4M4DAzU3ndjyZk04oP+DSow8S0S3iyXCzEh+soKs9rnca6UqTvxo4FxqdGrljP7VG8OX
         Ao4qMGwEApCYCmnDEADGBDM+F9n+Gi+l3v62zaxIaesvWvAYg6tFOsCM4UyNZ57z9mvH
         3/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6JHhgPo73JFubMx4EP8h9jX67e75KNMkM7M/+r7y04Y=;
        fh=RNxN5JmaLz0D7yN/ilwAbl/CE637wsDVw+/Vu98VgmU=;
        b=RyckGIWg3hb7/U9I0X4nXcs2By1jAATxxRUVs+4i0giJcQ3T5B/XnJha6iMd05ldLQ
         +LI76wCRCcGedb2nK1arUwOlONO6EfPG8zl/xmsnBhZbc24hujCPo31QmMhlFXO8lino
         SoGATif7T/AW5rdgZe0t+Tcu5wXhU0j1n3okX7sD6zhIrshlh+5qnra4KIgXUVSg1Wcn
         clmgRwCxMfCZqTvlccZCkCvRwlTv62AjBQJ0mK+jBrgixyqiemXtw7hmrD+goM55riXe
         rSWAPBMVHn2IkMHmr3HGh+rBy0Pw/AINnyET3yCyqmvhi3/nX+O5VGlLhjzG0xuVXB33
         YBGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768490427; x=1769095227; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6JHhgPo73JFubMx4EP8h9jX67e75KNMkM7M/+r7y04Y=;
        b=FHhgbgW7okKDjbCYdJla+nME9p9lye0G85hnup/0EgiO60z13rTUy8VwYXqaHHVPUW
         s2GSGEP7GIcsEHAkWl4i8K8Hd5BQLeuZBXUb5J/ZLsHGzoUwH596U3ylEWX+mKouU/Bp
         yuqzhZqYu4I/XFTaddwDdW70i/mwPgwXuQ5RhPT66TBdQRqK8wfEstwYYmpHtcoNQTuq
         YamBljx5chDJ2vmnKNzTbvCSYAo8lNaRMQ+XyFan0AzaB862kNCB3Gs5q6XYrVsdLy9L
         2dNBaTK5B6//PMjvHEccpR1ivITQ6YpqTUz2Xm5eq5XpBPfsdqgBTQ+f9No6SlEDqVzw
         Wl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768490427; x=1769095227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JHhgPo73JFubMx4EP8h9jX67e75KNMkM7M/+r7y04Y=;
        b=qAlri4nGemn5WE2iy0cudELLnHnaGj6vguZ9IMrVgwUuAszA1kckRoHD1Cg9V+vCFW
         TkqhCUNXiXA8cg8OtHWtSAw1NXXe4y9sc49tRFuFObwhZr0rEMb/DFYRSoKLWQGWIK+1
         bUL3EBLDOtx2rVbLsQ6rl86C3kQPzIDtHgIiG9sRurK8RzxzwPk9px8HniJlNKakZtsg
         y+DRGBnf4hx+G0AWzjohNGcRBoDmwEV4zQH6HdFkYjnYzFklu7KRrjbv1Qr/AIm+Hn6D
         qDsn5gJfT7d/Qfw5YnJLtNKQ88sAEZjHPOgSEc+HgwKv8Ctw1vLCBqsV6QgRVVyhnhQu
         KJaA==
X-Forwarded-Encrypted: i=1; AJvYcCUnCjcTKAWRGhpppnUx8aP0a89pYpzhtvlvAcv+w39tI4H62CdBXqMsfj/im/rJjPmxdKxa0iJ7TdKGaU5wQ9Yn@lists.infradead.org
X-Gm-Message-State: AOJu0YxUiA7Ja1U/0bnqIuEwv+WUBKOD16PgeLLVw0KWy28FuXVeC3wD
	qst/2sJfBO0ICm9pGy+9+8LJPAtBOJUiaFknD2Svzq6OKhxp3RS3X0FVt3nA1E+qsfyxx0LYhUH
	9L42D8/lawnFtEhowYSdc0Z/YdofZRWbQNji6Pbc12B5JrzX58yBmLmyronc=
X-Gm-Gg: AY/fxX63rfri6pm9aoAQX5OnsLfYbpQvHXCffdKO2b29eLth766cPipAHwiFMtAwJg6
	ZBbslQ+td/MPCblZpTG2ci8fKBB9KFTuuH3gnqoGMaaPYXbpakL+Mve9gQx2gIPF9A8AMx28vOK
	j1WG5hArs0gY+jEKdeFqbv59I6L3SJgqrZR46kqHaYxMyHtlmrlIX1jtFckvGaIUVUiC0MZ/XnS
	Jy9b8T1kLX2oO0RdmzwLxq3WfVtmx83uwwiLY0TUTAvB4PwG6AzuL20PKaZo3HkpqsgvpEK
X-Received: by 2002:a05:600c:310c:b0:477:86fd:fb47 with SMTP id
 5b1f17b1804b1-47f83f3a12cmr746125e9.8.1768490427073; Thu, 15 Jan 2026
 07:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com> <20251211104710.151771-9-tabba@google.com>
 <86h5smlxyo.wl-maz@kernel.org>
In-Reply-To: <86h5smlxyo.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 15 Jan 2026 15:19:48 +0000
X-Gm-Features: AZwV_QgE41uEPI9Vg4fByEIPIpbH-ItbLeWT-3oeGpbf0mTS4ASvGnEoNWEl8Pg
Message-ID: <CA+EHjTzEtPta5VHr5R0r0v7ui7-8xv5me29uk2devZ=S14RHqw@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_072029_441197_4C615140 
X-CRM114-Status: GOOD (  24.13  )
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

On Thu, 15 Jan 2026 at 15:03, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 11 Dec 2025 10:47:08 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Certain VM IOCTLs are tied to specific VM features. Since pKVM does not
> > support all features, restrict which IOCTLs are allowed depending on
> > whether the associated feature is supported.
> >
> > Use the existing VM capability check as the source of truth to whether
> > an IOCTL is allowed for a particular VM by mapping the IOCTLs with their
> > associated capabilities.
> >
> > Suggested-by: Oliver Upton <oupton@kernel.org>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_pkvm.h | 21 +++++++++++++++++++++
> >  arch/arm64/kvm/arm.c              |  3 +++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> > index 5b564576160d..0fa8c84816fd 100644
> > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > @@ -9,6 +9,7 @@
> >  #include <linux/arm_ffa.h>
> >  #include <linux/memblock.h>
> >  #include <linux/scatterlist.h>
> > +#include <asm/kvm_host.h>
> >  #include <asm/kvm_pgtable.h>
> >
> >  /* Maximum number of VMs that can co-exist under pKVM. */
> > @@ -43,6 +44,7 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
> >       case KVM_CAP_ARM_SVE:
> >       case KVM_CAP_ARM_PTRAUTH_ADDRESS:
> >       case KVM_CAP_ARM_PTRAUTH_GENERIC:
> > +     case KVM_CAP_ARM_BASIC:
>
> Can we instead rely on an existing VM capability? I'm not overly keen
> exposing something new to userspace (KVM_CAP_ARM_BASIC) for something
> that really is KVM's own internal problems.
>
> Looking at the history, a bunch of things have always been present:
> KVM_CAP_NR_VCPUS, for example. You could even #define
> KVM_CAP_ARM_BASIC to that if you want.

I wasn't too crazy about that either. I like the idea of defining it
as an alias of KVM_CAP_NR_VCPUS. I'll do that when I respin.

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

