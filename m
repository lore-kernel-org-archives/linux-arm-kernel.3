Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542F2E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJbTrtvGneL0K+ke9Gwc/0whnIda/bBfVk+UfsZChhU=; b=Qdl6GUc1kWumgLhnVIFddvlio6
	NeNUJ9wTK6Ok4kktUDdpT29vTAirfQZKPZgOPWWgOjBFK8gZQ39tu/HGT5TWxyiX0MFshj4ptvhC8
	7OvmBFgfszHdrlgOuYPcaQ0qMDLXm5q4aTRKFffglV/O2zyqiqHCNBOpC8WqhJBXor/LkT/aiGzjz
	vDseQcvKSBaMMUBWTWl+Sz59wS3zr5mxcrNFJKFPuWZa6Ujs9YsKLrqnlFN+7rEVHf76+gYB7U2fe
	dw2hNIh+oMdJbPy9szdnTPMeP8qUjrIORGsZX+oupJfrOn6hD6ItB/rCY1P2qxXaxqXPYlywAWwtm
	zryEDgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYtH-00000006rTK-2VOq;
	Mon, 09 Dec 2024 08:13:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYqK-00000006qng-46oU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:10:14 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434e5e71a08so71175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 00:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733731811; x=1734336611; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TJbTrtvGneL0K+ke9Gwc/0whnIda/bBfVk+UfsZChhU=;
        b=D8oHd9O3ElqTKuIImTeTIOtElZ5yoVQPXGi5rKWaUSZ2FfxYxllN5j3ympLKIVvfay
         iVksMOPbdXvHguyxUBbb1lNKaXJZeN2TRe5BT1Ruia14bquRfGzGXyhX6sPEwfzmHJRn
         YqX2HYKAXrG4k6uhsNLi2F6Rx/t3UpeDM5sckuzprD1Z/sjufpMNL6PkWQozVxcEYvkZ
         29iRzBCS3Rq/hUrryOioOp9It2Q3BmR1QhRWLAy8o0CiQVM/W0m0vYegXc72b6TfOtiE
         hS+hoOoX2KXxCy18qQBoZ5kSEbKrKvBLScJY7nm4A8TCeK1wcuzsolKUFGroiEUJqARx
         Ek7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731811; x=1734336611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJbTrtvGneL0K+ke9Gwc/0whnIda/bBfVk+UfsZChhU=;
        b=wsZLT+PZMXnhRF9u/cfowPZ52ivosbUnNYEYtj6XS9hYD2Czr0pzbNDJKIF1s195d8
         2lYLAG+5pj6Hli/tpotf5N9txQstYIF/wKN/gsWf8cp8WVLdVWK/nxQeM9EXn5l6dZgo
         nUk25CtlMqZB/0Pp9mnd3IEG52fyzlPgr5z9ZaCRDtfktS9maCEMV5Z8MJ0ZTUDASnDq
         zP371zlp1K/b6CjS3FG/pkFG8zcCA/IN2Zd9tXEjySLYQGoq+vqbIJvjaRp+UujAE6IF
         xVw1Pju8RyCswHRPTas4iLnMKXZdLW19oPilIfVSQS0T/oX1O2RvJ7HMS2ur+qG/wkpR
         Di2w==
X-Forwarded-Encrypted: i=1; AJvYcCUImCA1PhXKCpCb+gP44oHsrzRQX8kgb80X6TiNCVbPHoMJZ1ugQKdOjRuAMb6FTNI3hp9Wjbvcz0XGsIoGNG55@lists.infradead.org
X-Gm-Message-State: AOJu0YzAttVKCYACyh3VcfN4Ffa/7+MIJD55kJVLfDHy2zs062OACq5/
	AC9xSGNN4InJt6giAIE5Gf1Wby1KuASw4vILpshdNE2trQF5kUezcMsDVaOO8LIJmBTe28slWTr
	z3drMJjFV29MGxYxzaDZ7g8VwmcaTJ8gTIasq
X-Gm-Gg: ASbGncsiX0wWhpTlOv/fUsVhkUqyQZtA5HGanuFxUm0r0WmTBa7Qaenu374FwmqS4Xt
	Fzxodl5A/7px4xUyoXlHMA9mYyg6MTQ==
X-Google-Smtp-Source: AGHT+IHzonQzcQEPPJQ19YlDfCKStU1KuBNC12yGt6wg237N05KxGZu/6cvhmSjtaskyGSZGiX3jh152NoyInvIXc1I=
X-Received: by 2002:a05:600c:6c4e:b0:434:9fac:3408 with SMTP id
 5b1f17b1804b1-434e8347d19mr2392935e9.2.1733731811183; Mon, 09 Dec 2024
 00:10:11 -0800 (PST)
MIME-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com> <20241202154742.3611749-6-tabba@google.com>
 <Z1MwuSh6jc94cem0@google.com>
In-Reply-To: <Z1MwuSh6jc94cem0@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 9 Dec 2024 08:09:34 +0000
Message-ID: <CA+EHjTwSFW5hMFWhkOMBgO1QFq1t0LaGBns_-MnDZkzU6qdfXQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] KVM: arm64: Initialize feature id registers for
 protected VMs
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_001013_018775_71CA70F5 
X-CRM114-Status: GOOD (  12.84  )
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

On Fri, 6 Dec 2024 at 17:13, Quentin Perret <qperret@google.com> wrote:
>
> On Monday 02 Dec 2024 at 15:47:32 (+0000), Fuad Tabba wrote:
> > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > index 59fb2f056177..1261da6a2861 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > @@ -204,8 +204,7 @@ static u64 get_pvm_id_aa64mmfr2(const struct kvm_vcpu *vcpu)
> >       return id_aa64mmfr2_el1_sys_val & PVM_ID_AA64MMFR2_ALLOW;
> >  }
> >
> > -/* Read a sanitized cpufeature ID register by its encoding */
> > -u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
> > +static u64 pvm_calc_id_reg(const struct kvm_vcpu *vcpu, u32 id)
> >  {
> >       switch (id) {
> >       case SYS_ID_AA64PFR0_EL1:
> > @@ -240,10 +239,25 @@ u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
> >       }
> >  }
> >
> > +/* Read a sanitized cpufeature ID register by its encoding */
> > +u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
> > +{
> > +     return pvm_calc_id_reg(vcpu, id);
> > +}
>
> That wrapper doesn't look particularly useful, perhaps we could drop it?

It does get dropped in the next patch.

Cheers,
/fuad

