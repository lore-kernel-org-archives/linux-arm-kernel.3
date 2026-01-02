Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23438FA3753
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 18:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IiIOdbgFZQ8/EhuBk+duA7uZTuVxCyFjJNieGC9yzc=; b=iG0WKYOZxJi11aS+BaRWhHpjOA
	RMTdrhwoxZKMTNyNbQmPkqUTsxzFuHJdBmSsGoKnoYAsh9Ep5TcUZyast0cdCaEe4STT9QemG7hNO
	TThiHmV9EJWzCN+aA82kNWC9FzxmmMa193l2tw5q5s9cbVmvKUxk2LyufJMN5QNI26V+UQDgA4vqB
	t0MqxJDVUIZmtZtFcQVcc85xeLlaV5VO20tRcrPAcVG46p63d3abnFIJJ9vcWDXmJnl0Zxg6SS/nX
	LBlwv1wS3CCjcBAmo84Cf26c+C6e/vDRiCs8eJZWhpiqIvXS64yVhszBx16TS6o0bsz1vhv4gqFiq
	CsSmovKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjnb-00000008ciE-2WV9;
	Fri, 02 Jan 2026 18:22:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjnY-00000008chp-1x9A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 18:22:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477a1c8cc47so2405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 10:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767378170; x=1767982970; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5IiIOdbgFZQ8/EhuBk+duA7uZTuVxCyFjJNieGC9yzc=;
        b=Y4cXM+5YT23NrH4xt6uvfs7VppjIDZdo5sHpCCwQ3BPhEBfEnesUarsMxK9cntlUkc
         Vk2Ppo+jBpGNu2owYo26PiyidstzwV0fJhAfWLZ7Hcy/g13onlxO9TpwIof41972RUAK
         YhcnTzek3/T9EiOGkf2B/TMLnUy46STKMkOJD3GBEk2WTj/GeVClVhX0BEby2rOtRsG8
         o1AGhq2DzCt0f4dlKj104IaowE2/grIlT7nO86oxwC4P0A3nhDhE/ezwrRyPTIlmVG/M
         lEO5/mzubhSZShYtshT8q8wR4VTQL3LFZBdLmvMxNC6bMuG6eXVBVtgMkBdP2xLEE6ZJ
         6fLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767378170; x=1767982970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5IiIOdbgFZQ8/EhuBk+duA7uZTuVxCyFjJNieGC9yzc=;
        b=g+6IL092Gu8Etjv6GDSpoRTimL5zlWidkTZ3HB9dmPLDMIppJhdsdRuu6O3YFztMaH
         RDX904x5Zxm1BhD+vHbsLLvVdFJH1QVaChohmsOA9yBNOkkIKb8hHxvboc5exZ6VWfCs
         j/jdBxSu70e4zS/f4eNc1w1f9uXcCXg+R1sS4O9M0I3CweBWHdnFXiv1WrD16XZXdKGj
         45PsxHATwfO5yRvNZEp+T2TQfNyTHQLBKGGUWM0fPjP7ty5vPmUBvWs9g0rea6b6nGBH
         b/Iekifqh6LcttWhF93quDxAkubRGHDqHBTDvWTQOznXn+cAyDq7ZbLXGO6S2Wqe+yEB
         3fsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRlCugwLxYRpuXiiDD8Y16dHvPaEFgbOH/atkVEul1Bub+U/yUSDZp2EvGIBJO7Ci+Trcf8qB8ptIp0KQfXT7f@lists.infradead.org
X-Gm-Message-State: AOJu0YxLlqld0sGmIEM03kERa8GWpW17uLztlZBR2OZggEeDyza8W01z
	qmsjivc03fOH6tZNHnuD+iOzPRS1nGL3h1+RMrPy+lJ1LrUIQT1YUgUa9egMnQc+yA==
X-Gm-Gg: AY/fxX7Z0381e+OCjQGBGd6mzUK3lEyd/IYToyMbnp1yYTJLgfJ7TMWKPNL+bXQ6Fpi
	G7Qa7J5Y7mmJKqAMziFBwU0rcyIbXYmLS9mmIHAupysBYXrvjbRFytCeEKRK0oKnSWUWYR/zClo
	w4IPWcJap/fIu8Eq6uGV+C2yKD7op/wuZRRLUmgN9IKntQ2b03kB8uDA30bWEEpGdVRm5hE3o4s
	uDVYsdLlxWLtt3Gfdt/ls7C/bmQ/xzoFFgDWz5Twu5x7xms4eDkB8I0cr+zgsIqJ9VFKYQcrSWZ
	lTZubhL3zaELvPh6DzPR9+8UoD6zQgvDrQl1Y0aqMuCFh6q2oJukeOLi4sl35SI7ZlpIpxT2Oay
	Zp+lTuQJpTjIPvybVl6CCaMhRDW0vr0eODVo4+KAyT07WBAuepwFY9/pG/wPa53/p4qWaH9AJbu
	3KNvAHomZ+8KH/mk1BKSRKzM5hW5uLCa03SXoRm2qAJnsc3LXKlyUo
X-Google-Smtp-Source: AGHT+IHPa9BfjetwRVFzisbfuQDu9u4VsHiovnCoNEmzQNdcrMb63MY4lDI/VvFuE8axHy+Gopltqw==
X-Received: by 2002:a05:600c:6a90:b0:477:8282:6cca with SMTP id 5b1f17b1804b1-47d6c328fefmr5725e9.6.1767378169601;
        Fri, 02 Jan 2026 10:22:49 -0800 (PST)
Received: from google.com (171.85.155.104.bc.googleusercontent.com. [104.155.85.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aee5sm86915989f8f.4.2026.01.02.10.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 10:22:49 -0800 (PST)
Date: Fri, 2 Jan 2026 18:22:45 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com
Subject: Re: [PATCH rc v4 3/4] iommu/arm-smmu-v3: Mark STE EATS safe when
 computing the update sequence
Message-ID: <aVgM9ZNOmK6MdaNa@google.com>
References: <cover.1765945258.git.nicolinc@nvidia.com>
 <adf08c3b9f289188aca4fe80e506dca7aa48aa19.1765945258.git.nicolinc@nvidia.com>
 <aUQvAKjVUT1L3N7j@google.com>
 <aUQ6u+s8YbPiLC8Z@Asurada-Nvidia>
 <20251218180129.GA254720@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218180129.GA254720@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_102252_521768_443CE989 
X-CRM114-Status: GOOD (  36.48  )
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

On Thu, Dec 18, 2025 at 02:01:29PM -0400, Jason Gunthorpe wrote:
> On Thu, Dec 18, 2025 at 09:32:43AM -0800, Nicolin Chen wrote:
> > > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > index 12a9669bcc83..a3b29ad20a82 100644
> > > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > @@ -1095,6 +1095,15 @@ void arm_smmu_get_ste_update_safe(__le64 *safe_bits)
> > > >  	 *  fault records even when MEV == 0.
> > > >  	 */
> > > >  	safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
> > > > +
> > > > +	/*
> > > > +	 * EATS is used to reject and control the ATS behavior of the device. If
> > > > +	 * we are changing it away from 0 then we already trust the device to
> > > > +	 * use ATS properly and we have sequenced the device's ATS enable in PCI
> > > > +	 * config space to prevent it from issuing ATS while we are changing
> > > > +	 * EATS.
> > > > +	 */
> > > 
> > > I am not sure about this one, Is it only about trusting the device?
> 
> Yes. The purpose of EATS=0 is to prevent the device from using ATS at
> all - critically including using translated TLPs eg because it is an
> untrusted device and the OS wants to prevent it from attacking the
> system with direct access to physical memory.
> 
> If the device is trusted then once we disable ATS it must stop issuing
> ATS, so the EATS=0 should never trigger a fault.
> 
> > > I’d be worried about cases where we switch domains, that means that
> > > briefly the HW observers EATS=1 while it was not intended, especially
> > > that EATS is in a different DWORD from S2TTB and CDptr. 
> 
> Well, no, it means EATS is enabled a little bit earlier or disabled a
> little bit later, it doesn't mean it was not intended.
> 
> The point is our rules for ATS say that the ATC is empty at this
> moment and the device is not permitted to do any ATS fetches because
> we won't issue any flushes.
> 
> Thus there can be no concurrent ATS traffic and we don't need to
> exactly sequence EATS with the translation.
> 
> With virtualization the hypervisor is still the exclusive owner of ATS
> and guarentees that EATS enable/disable is sequences correctly with
> ATC invalidation.

I see, thanks a lot for the explanation!
I was mainly worried about the virtualization case as the VMM can
influence ATS enable from the vSTE.
Looking at the code in arm-smmu-v3-iommufd and iommufd/device.c, it
seems ATS enable will only change at attach.
Looking into arm_smmu_attach_commit(), I see the ATC is invalidated
after the STE is installed, which means that userspace can transiently
observe the old domain ATC. I think that's fine at the moment because
when binding to a VFIO driver, it will attach to an empty domain.

Thanks,
Mostafa

> 
> > I think the last line that driver controls pci_enable/disable_ats()
> > should justify the whole thing? Are you worried about device still
> > doing ATS after pci_disable_ats()?
> 
> Exactly right, and we can't worry about that because it says the whole
> ATC coherency system is broken.
> 
> Jason

