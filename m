Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A49D2168D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 15:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjHwpOaJDmP0t3MeUI8ElolfA57YlcBm5BKDBzuz6TQ=; b=oNpv7ob5UZhaOyg1Pxw2Kihx1U
	tXWExoFOmIudE/YyD4H7Tq0b/TWKco441GDC/M8qpGNHWTimp90/SA8NP8UI5+Ma7G6fGA+ztMhhL
	IAjD4tabGrAd+ysUJUOi3XSnLlN3eyeHrx2LyIYTVxeJzNLDZfwvbfV/dpWboCcyckY0zHnQOjw5q
	6VLY9Lbe5evfqFc2NkPDEPsN/oRu66+1Iw+TtVj/f4C26daCTQkbyiIiIcdOtlI8AB2k1fq64UxBR
	Zf25nNATj6Oe0KI7egNzxfGBmnbZDa6BtDy8HYrMaMAKV2UNjU9M7DiV36r3RkDCf9JMZLFEbNOSo
	jteC6UDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAvV-00000008BKm-3h9W;
	Thu, 04 Dec 2025 15:07:25 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAvT-00000008BKJ-3JfM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 15:07:25 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8b2dcdde698so151223785a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 07:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764860842; x=1765465642; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tjHwpOaJDmP0t3MeUI8ElolfA57YlcBm5BKDBzuz6TQ=;
        b=pB/p4sigwUZLioSVLwTou0mBX/i/PZ/e7XjSsZR1Jcfn8VehcKBse6Cd47LUWlY0Ml
         w75DvcYOEVIpKSQCIzfonRBAdU0MaUGmDq8RiSOxScHadzxCMulymemVMriQbZllELOc
         +Ljqwb31ijTc8taiddP15jQ/dHDydb2GLOzNVNEbJSoq7zR01v5gNaUTpzbTCB5Yslg2
         JCXQTpl9Q9fdDiEpWucj5HanC3iMX4y8EduPxnPNO+UisfYKVXpcfiV1UYxINxm3mTOV
         22FCZ5TDfhSzlTcmw4v7imaVDrTgSvqzC4SLbWoFkx6mLTzKShaPumWr9/fSUO9fREKs
         DbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764860842; x=1765465642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjHwpOaJDmP0t3MeUI8ElolfA57YlcBm5BKDBzuz6TQ=;
        b=B3LiqMSVUEsiOCLCWU2Gf2petqG8Y7ODsy8etEAaiVqEdVdplieWGOjjtGD78266hV
         mVxUzlQbT64O7EQAWWK9zNKyOk2eC1mWCFScCJ7yBc7xf29beL2mtWybGGVTPiVgyzY6
         f3lSL1JkGEtcjDZeT4hu5IWGTIG3r9LlP4oBa823Xm8ZmKo5wa0QIFRy0MqaI6ZaTq9f
         kRNFDEJ+kJpT+uRuY1ieuKWNEp9geuyXDuhhTIc1lDnQ7/gXP/sR67WeSLYl0crS/OvY
         EOunBpiqzIJfOtVHi4LC+wF7ivVhpPMTrJysT5opsxyFDv5JfJAcCke9Fzz+EL9D7Qrd
         9CEw==
X-Forwarded-Encrypted: i=1; AJvYcCUz8YWLEmGS+sp8xPkIn8oovsWNl7PhzxXpgJU01HNQqAafzlSDFN8qMQL22sv6QE04D53COGszgxafjfvGXQZX@lists.infradead.org
X-Gm-Message-State: AOJu0YztvGrgoGPSstFv5OaoG/vq4d3eTTquOGY6O6LnXZfWke5GfSl0
	UxQgTwNFRvjYoBzxAa1ZHPp6k/03Nc8jrGfzGzJch/z7zeBymwSDsJ241AQNuyZ/Ton9QLcZnSN
	TMh+VUM/2jmwMFSFvaIRZOIGRKz32CqZwNZSHFdDhhw==
X-Gm-Gg: ASbGncvS9qckN02x0nrPVIgPOiyTHaFt9aUUiL6hHs/AoEWB5CoANxci84YrzYFdni+
	k14KBKLNZ86dwy4+wAIPYE8NuK5are3bRUwXgwgsXlanGj+R7JMr9KwEqCGn5re7Pxvy2ErPaLh
	4NWqRZPPqwbXiUM/Ns0+mPUEveW+S3F/iNXMk+f8SeYf8dUuk+gHf2iZ0111wyCdkD49898/nbd
	l9YqFRWZq+kbgYX/fQhfoppmT1uI0uxUsl7DUOzJR1YX3VNVes6e8dr9oPfevzOySZ7L02RoAqj
	xA7QJKFHoKgLEjeP1lf6+Fau/Xau
X-Google-Smtp-Source: AGHT+IGW4QHe/3D4ozEpzDM51LfMiRME80VbqEXFqmEzO/LEeQXjUvDFBWO/0int2YzlU5zMoEDkYH97s+NQOJMcWzc=
X-Received: by 2002:a05:620a:1a9c:b0:8b5:a0fd:fb5c with SMTP id
 af79cd13be357-8b5e6c923dcmr872267685a.57.1764860841778; Thu, 04 Dec 2025
 07:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com> <CAJ9a7VhcSxTTaxMR4SS+GbHoPHXm0honykjXy92fbv0HG=1o4Q@mail.gmail.com>
 <20251204104713.GL724103@e132581.arm.com>
In-Reply-To: <20251204104713.GL724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 4 Dec 2025 15:07:10 +0000
X-Gm-Features: AWmQ_bnB9RPHEhVlkAJoAfLxxhVlrvDqC-dJqQafsxrkuGYt4hiNi28eUPF-ZaM
Message-ID: <CAJ9a7VgV6chvWmeG2xta11YqyNpdRZqx4=EF7vC7k=J2utpRYQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251204_070723_880588_E87F445F 
X-CRM114-Status: GOOD (  26.75  )
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

Hi Leo

On Thu, 4 Dec 2025 at 10:47, Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Dec 04, 2025 at 09:15:07AM +0000, Mike Leach wrote:
>
> [...]
>
> > > > +             /*
> > > > +              * QCOM CTI does not implement Claimtag functionality as
> > > > +              * per CoreSight specification, but its CLAIMSET register
> > > > +              * is incorrectly initialized to 0xF. This can mislead
> > > > +              * tools or drivers into thinking the component is claimed.
> > > > +              *
> > > > +              * Reset CLAIMSET to 0 to reflect that no claims are active.
> > > > +              */
> > > > +             writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> > >
> > > I am confused for this.  If QCOM CTI does not implement claim tag,
> > > then what is the designed register at the offset CORESIGHT_CLAIMSET?
> > >
> > > Should you bypass all claim tag related operations for QCOM CTI case?
> > > (I don't see you touch anything for claim and declaim tags).
> > >
> >
> > The patch I have created to handle systems without correct claim tag
> > operation is a dependency for this patch set. Thus no need for
> > override here as the core code will handle this correctly.
> >
> > The only issue is ensuring the non-CTI spec implementation will result
> > in the correct detection of no claim tags present.
>
> Your patch works only when a module has implemented claim registers.
>

Per the Coresight spec - unimplemented registers must be RAZ/WI- so
this still works for non implemented claim registers.

> This leads to two issues: we end up clearing an unknown register in the
> CTI driver, and then the coresight core layer assumes it is reading a
> claim register even though it is not.

Again RAZ will simply read 0x0 - which is an indication that there are
no claim bits implemented.

>
> For QCOM CTI, combined with your patch, I would suggest directly
> setting csdev->access.claim_tag_impl to false (perhaps using a helper).

That would be a better solution, though as Qcom appear to have
implemented a pair of standard RW registers rather than the claim tag
functionality, the write solution works for this particular
implementation.

Regards

Mike

> This would be much clearer than the "hacking" way.
>
> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

