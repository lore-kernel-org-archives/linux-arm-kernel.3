Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CA6CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1h5ZQj1hNsueFRANVvswmj77zdnaG+fzZ/hVdj8on7o=; b=hA8nAelnqJXrKuCYH9lpgBGBy/
	xUZJSMGNe1dT1VhtqnaWAU73DI28xpS0LcXxUBdSQQE/CJEZCgaPVDkpx6nNs7p8G3qCWqcxF6n5L
	dRaVQkEmIyxXRZHrCjPF+cBVgBKDHf1GGe4olAve06MdcVKIIdaJO/tSzC7+Cqbiu6NZ9r6Ta2llR
	HAXhcOGbzFMrUYVCZvM8mAu6WxWA2vB2rpClsoCrbidEdczlqBVVqW7axb7+xSMSsHw8SLnc3ezVO
	vc8g4/Wxmv1lovwtCSBi44Sd3LuRCmvTYlNPnze+J1Q9NZP5p9vwv4v2SgsFjQUa9YFEgxACOijBP
	GOScHfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3vyb-00000007tB0-0eNZ;
	Wed, 01 Oct 2025 12:30:33 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3vjl-00000007g0a-2Dyk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 12:15:14 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-33082aed31dso7887290a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 05:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759320913; x=1759925713; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1h5ZQj1hNsueFRANVvswmj77zdnaG+fzZ/hVdj8on7o=;
        b=sV/7NsBrkHk1gEhtAsfjbEpwEARQirq/UEKRyrxF+y+ioUi3mdec3H9yX4/HJkDgwu
         bU84XbQ1hAGYJuC3Zn8s6SFEXt+ifxEQDKSdkkbXrhUhPHGhZv+5Im+fjZuK/dymipA0
         bYQg2x8u1Ij+fVDp8blOUhHa45FkJcp76RgvfcKb626vZWP9pdWoLnGurTuMYeH/hcOA
         djbKwYHjbl43rlzul3h2GDvY5omLCUv2udj4hYMeSJMTpC+Lk1vP6RWv1APZYnLaxEC2
         H2ix/2vDJsn9EjtKC2YxC00zBc9weRW7ikN6vtOQs3XYj1XAX/li8/DXlwNCocn+ox3F
         Sl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759320913; x=1759925713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1h5ZQj1hNsueFRANVvswmj77zdnaG+fzZ/hVdj8on7o=;
        b=YA8ZNrQ+LKvTMi8KdgV+hwKYNfGB2cucpS62b2VBMVwiaMtad+lP5gMtr3RkcbRNXJ
         E9sNx4IOkvqpxc+xtWpiBQpo1MlvdicqajZcfE4XWOkwPgpWDY+dT9BbWwmI4rwUOaye
         pupkchnhlaFyF4szVYvdu/OFR+0Qvf5nbldbs2ZSAeZAbnlpmvl1jD6GXVyfdPdVocm6
         bKMhRPbT7CsMIXw1vAOxswHVnE1ARkwKNVbp/HjklwUm/dNT1vzKBpT2+pM01PM2TjBc
         T49RaZFW4ZUbu1mE73hRKO5LeApzriyBlPlK0q3F4/u7ctoVj1O1k1ehmOhZ6hUU0Ru4
         /mhw==
X-Forwarded-Encrypted: i=1; AJvYcCXiG9FsmBTU+fWR+1y7VdGzxU0kyxa+QWJlNEDjMOiUoiN35u1DK2Yz1TGVhdVR0Qdm4+X48zbhM+tsAn7JnVmt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8rMkJelV8GfXoBPYUnmVHsJwtesa1Ra/U4rGC4eRw+6OyqHOQ
	tBFCIdUolQweFGEuRSKAJLtZTDlBXy6u1W8ltx8ysnR4OyWvDLB1TT4qye8Pg7sY1n6GIipPtla
	kp+dmXgzVkt1eQs1CqZqk8Iuj+4iBqjiWq0FiLvX00g==
X-Gm-Gg: ASbGncsAqM3qJlbEK7oM5Ngj/Cu4d98OVusEyCuqIyy+AYMupt0O7z9WicCNPZ6N44T
	p+9iy/8Xw+kVTv7A4XfqmdZSihDA/JBCG7e3Z1Q0B00UiIP68cw2ohoGlBQ0m5RUSaOfYNIpgA0
	00yUFN/FYEDvuxvskVz8dvHUu4GP7pYk2tzMIPgRPHkblRkZMJCb9QOjROtHv9KkKalB5zS3bWc
	IFujeNXH/cGT2x3W17RAkmGx1wVsA4QjbKd40T9m9Y59HUnJ9nr/NzWxycXz1aEwdxX9ra2B8c=
X-Google-Smtp-Source: AGHT+IFMQXG4jx6J+vC3Rc7xSXplJA8AzsyxnpiINw0J7Iv1k4XOQ6RdJJ6UC9qkRQuIDbRdT63CA58n6n6HjdTblPw=
X-Received: by 2002:a17:90b:38ce:b0:32e:8c14:5d09 with SMTP id
 98e67ed59e1d1-339a6e83db9mr3712573a91.7.1759320912658; Wed, 01 Oct 2025
 05:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-10-ea49e91124ec@arm.com>
 <CAJ9a7Vgk0Pj5c9AJBKa+wBNNZR6a7RCTUWqW0Trvksvt6fCBXg@mail.gmail.com> <20251001102551.GM7985@e132581.arm.com>
In-Reply-To: <20251001102551.GM7985@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 1 Oct 2025 13:15:01 +0100
X-Gm-Features: AS18NWAStjplWGVYojVpMWR9OS2APZoRc2_QmefDNYGX0j_JRQsaVaPaf6qqAgY
Message-ID: <CAJ9a7VjYLXk4bx7gWFpQe=1TLQ0Ks8d7m-jrUnuwaLMonW3gwQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/31] coresight: etm4x: Reuse normal enable and
 disable logic in CPU idle
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_051513_751245_57210E8E 
X-CRM114-Status: GOOD (  40.04  )
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

On Wed, 1 Oct 2025 at 11:25, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Wed, Oct 01, 2025 at 09:48:06AM +0100, Mike Leach wrote:
>
> > Hi Leo,
> >
> > Overall I like the idea, but there are some minor issues that need addressing.
>
> Thanks for review!
>
> [...]
>
> > > 3) Claim Tag Handling
> > >
> > >    The claim tag is acquired and released in normal flow, on the other
> > >    hand, the claim protocol is not applied in CPU idle flow - it simply
> > >    restores the saved value.
> > >
> > >    The claim bits serve two purpose:
> > >
> > >    * Exclusive access between the kernel driver and an external
> > >      debugger. During CPU idle, the kernel driver locks the OS Lock,
> > >      ensuring that the external debugger cannot access the trace unit.
> > >      Therefore, it is safe to release the claim tag during idle.
> > >
> > >    * Notification to supervisory software to save/restore context for
> > >      external debuggers. The kernel driver does not touch the external
> > >      debugger's claim bit (ETMCLAIM[0]).
> > >
> > >    Based on this, it is safe to acquire and release claim tag in the
> > >    idle sequence.
> > >
> >
> > Not sure I agree - in the original save restore the claim tag state
> > was retained - so if an external claim was asserted it would not be
> > lost.
> > here if we do not retain the claim tag value, then an external state
> > can be lost.
>
> As described in PSCI (DEN0022F.b 1.3), section 6.8.1.3 "Saving and
> restoring trace context", when ETMCLAIM[0] is set to 1 by the external
> debugger, "The supervisory software will perform a save and restore
> sequence of the trace context". So the supervisory software
> (TF-a or EL2 hypervisor) should save and restore context (including
> the claim bit) for the external debugger.
>
> It does not make much sense to use the ETM driver to save and restore
> only the claim bit while ignoring other registers. For a robust
> solution, the supervisory software would be better place for the job.
>
> > The debugger cannot access the device during idle/oslok, but it can
> > detect that the device is powered down/oslocked and this potential is
> > a change of behaviour from the external debug perspective, where a
> > race to claim the resource now exists over powerdown were one did not
> > before.
>
> If we consider the supervisory software, then no race condition occurs.
> As the supervisory software must run prior to the Linux kernel during
> resume, it will safely restore claim bit for the external debugger.
>
> Thoughts?
>

If the firmware is PSCI compliant there is no need to save/restore the
context within the kernel driver if the external claim bit is set?

Mike

> [...]
>
> > > -       if (drvdata->nrseqstate) {
> > > -               state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
> > > -               state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
> >
> > The TRCSEQSTR changes in use, but is not read back be the standard
> > enable/disable flow. This does not matter in a normal enable/disable
> > case, but in a save/restore we need to retain the current state.
> > Probably should be added to the normal disable flow to read back this
> > as we do with counters etc.
>
> Good point.  I will update in next spin.
>
> Thanks,
> Leo


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

