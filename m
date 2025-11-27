Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4D4CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 15:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hd0CY3ZU14atwFY3xqBMDgidv/YHSzUs9dC1+cwr/w4=; b=cKmd9Z6ziB4q2cpXSOSTdBw0FV
	Xp5JV8BAdU/yYoejuy8LyWAx5A5p5+yyl1idWITdl/rBD23miCYm16PNKuNMy1cnZ64E7rPJOnWJe
	44uI2PIotgtvmNy2uuXqJ2ioxkcTb5MNzRzxVcWcath6lnm8pfA24UQhcFTaYXZ1muG7xmnFZ9pKl
	5eIV4XhIxB5jWzVW66OxKfC59x5wa8vnyyhlxbvig5XlHVcWfaMUW+JrDr+/NdwZeMy+vXHVaSLJ1
	5jfP3TeTo4Uuip+akdw2GX/5gcBUUtMi5gswxi52CjtRmC9ZkqXqMfJ76hr+pOCbFXXcHpP4rRoea
	eZ9bxjcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOe5q-0000000GrAG-0PtY;
	Thu, 27 Nov 2025 15:39:38 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOe5o-0000000Gr9k-0gkp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 15:39:37 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4edb8d6e98aso405291cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 07:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764257975; x=1764862775; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hd0CY3ZU14atwFY3xqBMDgidv/YHSzUs9dC1+cwr/w4=;
        b=g16xIgY4UnQL0Juk3GH5bVAcEF3uqIPHXb2KnPiWVHHk49yfHIAHHU3pkhHc9rb8cG
         6G5+NGIX4L+qPFjZpTtHzGm82XLzgyYTnXBgeRPi9zOQAZSPEQD6HvJ5fFXv0YPchnu1
         Ujvds/LK9On7kbILBqm/5/mBafms8gI0BRV8m30LWXXoksr8GjI3NQC8m2pRidJ0QRMb
         hacwntPQp4HCR8PG/pdlIVG/F2A6hpsPkmkNW+WQ0EgOS0JZZSvlJ2neSnNSzI/ezTDZ
         OrAs941oVY7rFZXWdQ6puuD6zK6ab9V13nQebCFG/ryNR7E1v9tMayLTZ948yJZNWhwe
         5ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764257975; x=1764862775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd0CY3ZU14atwFY3xqBMDgidv/YHSzUs9dC1+cwr/w4=;
        b=Sv95PifKvDJOLE38wE1i/ocSPPJtjegTBZ8MimOm45sQeTnNmzPCLKV0U3xSdBnM24
         EKHmWNMlEBjpfqiYuiofp94tfcBtnBx0s24Gx/CCM/wxqB0EoKD61HDdjDtoDqudJwZc
         6EOamf5IWs1BiFNX6TKbRcnlTeao9YZAjHrlgjCHe+nEh28uNT2o6E585cW6Mxigmj1p
         Xdl94QXZmvT0Bns742TNAPvSe44jqza6cxcq4aGZ1xoaUVxI2w1PNFmxQIni4ZIfDRpl
         bf2TF1f+xigY1iw7SlEi/2kjpBmZ7TcZo8EvILTsdeWaWmxl1qPkxOSAnXQywNWjm/5D
         T3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUMoDnJzzPQLWCUnkH7GF8DgHJqIwh3oVGGoBqaJncHoceMWFZ0L06yGx3Q/AsQoVTn5sPv3juMZgsRnbpGdqVP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx10GeOmsl3VTnT1ujb0XDfmIcXkPfkAWZeZyFeLXQ/IGoxHEF4
	CP2IRqQNeou078xGWlnoy+hvDv7DtjxpWxedCbzs5ZHA4BHafK28Zxf6Nh3RJ5iDeLRkHROIZn0
	JhbsE34qH586vrUsj0Ng+zYvrTVuOC40hCxPtcSgv
X-Gm-Gg: ASbGnctnU8Aux/oyDjottZb57ww0AF03cExuJaYM55yOJ31gdEwmCnO3nUAN68OR7vg
	Y9YI135NpFxKKTkLdsowbnWh36+SnxMaSEIGliG9Y4NCa6BeZeQVVb5IOxkxt8I8qnhvyE1EhVB
	yLGnm/u8fuPPRWGt19G6u5b9XbxXvcXAgp5vn1TXx7Af6n7FMOV+TVmIYHn8FmjNtHt/rl9auow
	bPVgMX4PTza8s/xptj9o5rPLHub8kq3VwU/NfnQxBWaYvflXKZ77ga1TvxlTLS+QC/gSnw=
X-Google-Smtp-Source: AGHT+IGEsrfjcbkJGkqxXUYXJI3yjjMPThz8ftNHObRNiq98zA3po26R6DweswD54zni3BAoy53/f5b9h4FygzZZsrY=
X-Received: by 2002:a05:622a:181a:b0:4ed:a65c:88d0 with SMTP id
 d75a77b69052e-4efd0c63121mr5012851cf.6.1764257974659; Thu, 27 Nov 2025
 07:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com> <20251118103807.707500-3-tabba@google.com>
 <868qftqehe.wl-maz@kernel.org> <CA+EHjTwHrLhdHrNSA8f-+bCZ1-QEuNocQQxeiaaost9oLwaG5A@mail.gmail.com>
 <865xaxqal2.wl-maz@kernel.org> <CA+EHjTxhOvu-733Z-gJgc6f_EAs-tksA6u5KuQZeimP6T6M-fQ@mail.gmail.com>
 <7f1c187b-0f94-49c5-b4c9-2f414ab0ac8a@linaro.org>
In-Reply-To: <7f1c187b-0f94-49c5-b4c9-2f414ab0ac8a@linaro.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 27 Nov 2025 15:38:58 +0000
X-Gm-Features: AWmQ_blndo9HCJsMPCLdj3IZ8iIryYV2t4AJnZgeW8Vjj_H0mejoM0lyx7lRygU
Message-ID: <CA+EHjTxpTKFQwWHR6vBVxC_a6dpza_bgCmxTXSbWjT7wfJh2TA@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
To: James Clark <james.clark@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_073936_210229_B9173860 
X-CRM114-Status: GOOD (  31.17  )
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

On Thu, 27 Nov 2025 at 15:26, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 26/11/2025 11:48 am, Fuad Tabba wrote:
> > On Wed, 26 Nov 2025 at 11:47, Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On Wed, 26 Nov 2025 10:37:57 +0000,
> >> Fuad Tabba <tabba@google.com> wrote:
> >>>
> >>> Hi Marc,
> >>>
> >>> On Wed, 26 Nov 2025 at 10:23, Marc Zyngier <maz@kernel.org> wrote:
> >>>>
> >>>> On Tue, 18 Nov 2025 10:37:59 +0000,
> >>>> Fuad Tabba <tabba@google.com> wrote:
> >>>>>
> >>>>> The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
> >>>>> register accesses. These accesses are trapped to EL2 when the bits are
> >>>>> clear.
> >>>>>
> >>>>> The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
> >>>>> had the polarity inverted. When a guest did not support the Trace Buffer
> >>>>> feature, the code was setting E2TB. This incorrectly disabled the trap,
> >>>>> potentially allowing a protected guest to access registers for a feature
> >>>>> it was not given.
> >>>>>
> >>>>> Fix this by inverting the operation.
> >>>>>
> >>>>> Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
> >>>>> Signed-off-by: Fuad Tabba <tabba@google.com>
> >>>>> ---
> >>>>>   arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
> >>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >>>>> index 8d06a246dfd1..f6f8996c4f97 100644
> >>>>> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >>>>> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >>>>> @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
> >>>>>                val |= MDCR_EL2_TTRF;
> >>>>>
> >>>>>        if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
> >>>>> -             val |= MDCR_EL2_E2TB_MASK;
> >>>>> +             val &= ~MDCR_EL2_E2TB_MASK;
> >>>>
> >>>> This does not only change the trapping logic (bit 24). It also change
> >>>> the ownership of the buffer (bit 25). I wonder whether you should do
> >>>> something for that, maybe by clearing TRBLIMITR_EL1.E, because
> >>>> otherwise, you keep tracing, but using an EL2 VA. What could possibly
> >>>> go wrong?
> >>>>
> >>>> Overall, I'm very uneasy about TRBE in the context of pKVM.
> >>>
> >>> So should we clear/restore TRBLIMITR_EL1.E on guest entry/exit in
> >>> protected mode?
> >>
> >> I think you need something of the sort, yes. Overall, SPE and TRBE
> >> should be aligned on what they are allowed to do, as they are two
> >> sides of the same ugly coin.
> >
> > I'll fix this (or add a patch to do this, depending on how it looks)
> > when I respin.
> >
> > Cheers,
> > /fuad
> >
>
> To understand this, is it just belt-and-braces because you don't trust
> the current filter clearing in TRFCR_EL1? And to reduce the potential
> for mistakes leading to trace leakages? I suppose even the hardware
> itself could have some errata where it tries to access the buffer, even
> if we've completely filtered out trace and flushed before going into the
> guest.

Yes, we don't trust the host. The pKVM threat model is to protect
against a malicious host.

Getting into hardware errata... that's a can of worms. I haven't
considered that.

Cheers,
/fuad


> Thanks
> James
>
> >>          M.
> >>
> >> --
> >> Without deviation from the norm, progress is not possible.
> >
>

