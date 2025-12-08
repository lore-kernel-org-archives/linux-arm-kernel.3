Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DE3D3B7F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FM3AQ1FlOuXJ/e1AGMCOoW838tRWe4uRS3PXygGI180=; b=1sHiCCX4vkTQK3SJhRNU0rv02Y
	2/u4Q+/YvLBKXXzjrkFBIbAtGOwMrqKH8qLfENpByeuWlDImHzSuVirnxgGGiJ3Qj6QNi+lRGo8t5
	fyJowY3e3LX2vafbnNOHIRZn/WdGCokkpZeghgU3unuhgTzym3Vs5dx90kuYRiUUN3nBBClbaKTjD
	L1gqEKZt/7odPMp3qrfTRzpoSj0y24DiZAvq8pwqTS+Qp1JT4meQaMapClqHEjN1PrVBuyLDhelR8
	SHQ56En3/oXE0i0PAXOPA1UzyInRqIXJ1uwq6MHXirwOR4QMU0zxP5GJan7Wv7QQrKuAk3WO3IhMe
	mjias+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vScB2-0000000DCHU-1EFd;
	Mon, 08 Dec 2025 14:25:24 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vScAw-0000000DCGx-0K6A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:25:21 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-8b22624bcdaso566331485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203916; x=1765808716; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FM3AQ1FlOuXJ/e1AGMCOoW838tRWe4uRS3PXygGI180=;
        b=ooY318OGWG7Xa+KsMTVr3zCtO3aH8ObJKGsheVX6PObdLD54VqKN9XLMcpWsE7e+0J
         Q4eBQgFIDNynEDCo+KM/Ijs4sZsHBcTwFDsDqTS757nIX4jN7LOig5SjS1ZvQMI2WzoY
         C3GTCGfjFq7AAIrfrJxDaVrUGgmermFccF0N0FbiOr8eAaH8p+quqHsa5kIhSQCoglR6
         YH1pBL/50XayRfTCznR9ecWaF8CyXz0TyE5623VUOpzCqec0M32pqPUbiiSYM6ciJxYG
         /lqkMlkr7gbcFLZEwLxIrNFsyI1Hfig8c2rMNWHrnZJQrCbuIoctnxIyo2R1Ho5b7O5G
         Nm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203916; x=1765808716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FM3AQ1FlOuXJ/e1AGMCOoW838tRWe4uRS3PXygGI180=;
        b=uvRaNpLMUj4SHxga6hlBQq41y8hJDIQHvK91mNIAHuNf25aXfQEhcwCi38v7qE3HbC
         qBTaNpzDRmxwDbP5W6sOh0QP61l9lJq9mkLrvH/pLh9UA1BewL65///KEzvtGieWHmR2
         qrXTtSx1AqIPXpfiNPgLUiQI/Q2Fx5A75IUmYb8e59uFnOjD9LAh3SQXoVNksjppEZnX
         xKzaAdF+UHP23CJkRppbyZ5H+NKALnA7bmQelIbVEyNRSkjK7lkfpCZAIkZbxjkii/uh
         R5MFpuVyMBpNz0c35Tc/wRr1nuiWGeRObkPBR21Of+SJQog/JqriFsPEVkZY05eWFhs4
         bFxA==
X-Forwarded-Encrypted: i=1; AJvYcCVhDI078HfExJbdRN7Jp0oUGhzu5Sf2HXcdaDptEjbMidnOr8VwSysKfTEMdI1wnxJG3jzO7ClhvM1NpXndk6X5@lists.infradead.org
X-Gm-Message-State: AOJu0YyExT1R7lfGtXghrEpGBM455Htpng48rVW5B5Rz2IlYTewLl4gI
	1AMtNOvoBUibYP3VnkgJqXUyqnxGwiVUIpwNGhSjvuvBQDfdW4ZSndHjSuAqb9Z8uHmhqCla2U6
	9luILlOqIQEB+izNTnusSjxHGC54/ifdPC1eD1sueUFjPCtcOieAtLTg=
X-Gm-Gg: ASbGncsDpPuqiPE0ZeHsZBhY0tL2QKV3nd5DCBwbBF9sCQHTzj2/+ZlCdRz3Gcc1swa
	P/yIMxVhqssHMoWXyv/Qc9FRJ8+PQRGl8EVlWEreEDMln/S3wi7WFykgFlZ3VGtHVpr6F30+21g
	Dz3gUdlUAF/kz++IiR5UsOmRteA+TfsZpPWk38jo3h58yIM6A4d4izgqm+7JLz84cOEVr8K2v5/
	Ciz7LszqjfnQ6kGz6L2qxz4kPvsuUnW797D0fKJhRWiHu/sMp2ezZsZ9B/xG2vOGx2cMONWvh/h
	3QFRnB1+9MSMiX8ow3TotRAkSsMrgpHdT+ZkSqP6RaedNJfnZXx6TWbVTr4=
X-Google-Smtp-Source: AGHT+IG3nXGqXUvqpQinMeRU4VZSYr+qfgKJd+Lp5hSD72PxIPIMTaz7Kdxvcqdhf3pLsgJBW1+LG7bFtTruCD7BKWw=
X-Received: by 2002:a05:622a:2b44:b0:4ec:f156:883d with SMTP id
 d75a77b69052e-4f03fea37a5mr115385351cf.43.1765203916316; Mon, 08 Dec 2025
 06:25:16 -0800 (PST)
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com> <CAJ9a7VhcSxTTaxMR4SS+GbHoPHXm0honykjXy92fbv0HG=1o4Q@mail.gmail.com>
 <20251204104713.GL724103@e132581.arm.com> <CAJ9a7VgV6chvWmeG2xta11YqyNpdRZqx4=EF7vC7k=J2utpRYQ@mail.gmail.com>
 <20251205102720.GP724103@e132581.arm.com>
In-Reply-To: <20251205102720.GP724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 8 Dec 2025 14:25:05 +0000
X-Gm-Features: AQt7F2okEBtfEyCOzornKkjPhmVhUUfg6M88kQWuVbbYdz34lne69R-Qv_-OWhY
Message-ID: <CAJ9a7VgYoSZPsm1jPniVZWZk7MHRAsRJwQGBxyNmndCcfnso2g@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_062518_132737_E6EFD1D4 
X-CRM114-Status: GOOD (  41.48  )
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

Hi Leo,

On Fri, 5 Dec 2025 at 10:27, Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Dec 04, 2025 at 03:07:10PM +0000, Mike Leach wrote:
>
> [...]
>
> > > > > > +             /*
> > > > > > +              * QCOM CTI does not implement Claimtag functionality as
> > > > > > +              * per CoreSight specification, but its CLAIMSET register
> > > > > > +              * is incorrectly initialized to 0xF. This can mislead
> > > > > > +              * tools or drivers into thinking the component is claimed.
> > > > > > +              *
> > > > > > +              * Reset CLAIMSET to 0 to reflect that no claims are active.
> > > > > > +              */
> > > > > > +             writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> > > > >
> > > > > I am confused for this.  If QCOM CTI does not implement claim tag,
> > > > > then what is the designed register at the offset CORESIGHT_CLAIMSET?
> > > > >
> > > > > Should you bypass all claim tag related operations for QCOM CTI case?
> > > > > (I don't see you touch anything for claim and declaim tags).
> > > > >
> > > >
> > > > The patch I have created to handle systems without correct claim tag
> > > > operation is a dependency for this patch set. Thus no need for
> > > > override here as the core code will handle this correctly.
> > > >
> > > > The only issue is ensuring the non-CTI spec implementation will result
> > > > in the correct detection of no claim tags present.
> > >
> > > Your patch works only when a module has implemented claim registers.
> > >
> >
> > Per the Coresight spec - unimplemented registers must be RAZ/WI- so
> > this still works for non implemented claim registers.
>
> QCOM CTI does not follow the spec in two aspects:
>
> - Given the patch's comment: "QCOM CTI does not implement Claim tag
>   functionality as per CoreSight specification", I am suspect the CLAIM
>   registers are not implemented at all in QCOM CTI.
>
> - It neither follows up the "unimplemented registers must be RAZ/WI" -
>   the patch says its reset value is 0xF and then even can write 0 to it.
>

Correct - but my point is that the patch to handle lack of claim tags
does work for both existent claim tags and unimplemented ones, where
the spec is followed.

> > > This leads to two issues: we end up clearing an unknown register in the
> > > CTI driver, and then the coresight core layer assumes it is reading a
> > > claim register even though it is not.
> >
> > Again RAZ will simply read 0x0 - which is an indication that there are
> > no claim bits implemented.
> >
> > >
> > > For QCOM CTI, combined with your patch, I would suggest directly
> > > setting csdev->access.claim_tag_impl to false (perhaps using a helper).
> >
> > That would be a better solution, though as Qcom appear to have
> > implemented a pair of standard RW registers rather than the claim tag
> > functionality, the write solution works for this particular
> > implementation.
>
> If an IP violates both the rules for implemented claim registers and
> the rules for non-implemented claim registers, how can we rely on
> these registers to detect the claim feature?
>
> My feeling is we are building a house on sand - these registers are not
> used for claim tags purpose at all.
>

No they are not, but by either writing the claim tag register with 0,
or by setting the csdev->access.claim_tag_impl to false, this
particular incorrect implementation instance can be made to work with
the existing claim tag code.

There are effectively two issues here:-

1) The existing core code does not correctly handle insufficient claim
tags or none existent claim tag register - per the coresight spec.
This needs fixing for all potential components - not just this one. My
claim tag patch does that.

2) This particular QCom CTI does not implement claim tags correctly.
This particular instance can be made to operate correctly as detailed
above as long as the core code can handle none-existent claim tags.
The alternative is to bracket every claim tag access call with an "if
!qcom_cti" statement. (which is what was happening in earlier
patches).

We need to fix the core code anyway, and the specific QCom CTI can
then be fixed in a single location without changes elsewhere in the
code. This is the cleanest and least disruptive solution.

Regards

Mike


> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

