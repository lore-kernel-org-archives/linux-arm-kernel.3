Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEC5E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 22:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pa3RqmxudYJyFQPRnw18vNuYTg6IZacGgInKXmkuvPY=; b=CJpNTnAl7Q2XZvG5BOlaitF14y
	3Wm+95nEmXsenU/j13EQn4MQeyHZ0WvteB2/YEyP/3ZjQgXtkm0gQP8kgOQRJ7iZXn3M1J5APOnl9
	Jq5HTeN7pqAPy1eyBr75u2kXexVJNgrXRRNrqnlpNBVfHhW0TUlxWH2MBgGY0mv3HHJ8tSx59E+AN
	5t/Z5JEW8FEJbSw3Q6MKr6SRQcH0eMQlDrAFEMtML/S+Q72UI9FPnSdTawyT26b76mcahhuqkOBxH
	aZH03FZJJZuM/bFso1QHkkPe4fA1cCNrZrxCyF4fAn73vIoDurZi2UNjBf1ntS3arSB8jpbpRtO6G
	1YS8iLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIJc-00000006Rpd-2Nnu;
	Tue, 07 Jan 2025 22:44:48 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIIQ-00000006Re3-2FpQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 22:43:35 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3002c324e7eso181312231fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 14:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736289812; x=1736894612; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pa3RqmxudYJyFQPRnw18vNuYTg6IZacGgInKXmkuvPY=;
        b=wUJ4MjRwOznA6S+bPkUCQCit3b/nObf9wicGm90SwwvKmugZkSkOlT3g/mLBGenaHK
         6ZpZmETal6zKKQvyQHVNJ/mRKXzhj3lKLMYhLRKMte7yycNt1Vx0LFuU7oHD25cecB2Q
         rBRApSQ7gB77/S8i1usVNjzbw5LC9yiGGIM7JZf7n0X2D3NQAV0DcL+GPXwUU8imDExg
         dJJdBylAJTuLSwwD1RtIrk8SHutIJdYJCrWd5KGGnBsKSwI4lS+4bOdEtsh9GhiZN7FM
         Cgyq93pc/hyBsPPFi6nf6K/HekW2k3V96AIinOQuevbhtHn5LUFGTMciknZnZ5Lcrz2/
         hfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736289812; x=1736894612;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pa3RqmxudYJyFQPRnw18vNuYTg6IZacGgInKXmkuvPY=;
        b=ElpCSDw5yTlfKZ00rklEknJLvzwuaiFJkCR5Bzb4h8h5OdTEMJmCBcGc9uGPO8xxqd
         dpzoLp8D5HSSI5d/SrnfkY8srnTtv3PK9Fu8crRl5ygtjMIrmoPbNO6dibnFQXdDRFdF
         BKoQZ33oEUMcKmcFGLILod7YwyMqfZrXGhnx5BUfDSC5/b2ibcRzroA49K6FJBLhxU2I
         7YJiXjHgizsjbM/dsJoFBD8MYYmb4sK4VmAOp8iv5rQ4gpENGqCsTInJKu5PnOeXhm9m
         NN5CLAS1PKt6kQwZpyF+7VttWTBBI+PotaDjNiDr6yMhUB/P0BdHRZRlEilnGg8fDz9T
         qqQg==
X-Forwarded-Encrypted: i=1; AJvYcCV+4LCF9yTIXcIw0hTjinXhE9EkOMo8zETnOK4nZQoOk+e0ww9r/Jh71h683fWme/WRSEB0kZCH+OM9bArZ17M0@lists.infradead.org
X-Gm-Message-State: AOJu0YyB+rC6bKwcNFiMq7EQNlA3LJ0PM/u/RkfrUUTZJDH8EtogOPfU
	qeYo9aDxoGKVGiQUT++fFSEPlOZC24NIX4J+tqS8aOBgFvkKBjFBiqaVA+mrRgU=
X-Gm-Gg: ASbGncsq7JGmC5dHw1zDg53WLv9BxqU6+F64pRG0hgMuJXWcJlSs1XQwaFwbClRK0e8
	IDEAx61N+dNZUwj8zfrDZN3eyCK+HLQR+K2VE2XHxo3PmEx2z2iftxQgmkaZ0yZbj+XKmQTWSzp
	KyfGHR7DaUnSsHdRZG5hFUpigzTYo4661ErCRxY71X+ahcgxdCgQbRUr2dc3MimQyIQRhBUq9Eq
	WvhB4VaeT9SaUQ2+tWaYczpApvhBprMgDYfQ204xzxFT4GWAgdm/zIzsUs6iYip0bunJ5d8UnaQ
	CItjuXUKYpAx6JthG6iFKdDG05u5AoG+REY/
X-Google-Smtp-Source: AGHT+IHy5V27gDH+by9fnJ68iOhPGvEIJqeaut59nvgCwr8FXp2+T/5yYWYjCX3jT2mFaBHiG+I4UA==
X-Received: by 2002:a2e:bea8:0:b0:302:1b18:2c09 with SMTP id 38308e7fff4ca-305f45ba080mr1149561fa.27.1736289812296;
        Tue, 07 Jan 2025 14:43:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9b9c4sm61091001fa.31.2025.01.07.14.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:43:31 -0800 (PST)
Date: Wed, 8 Jan 2025 00:43:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Robin Murphy <robin.murphy@arm.com>, Rob Clark <robdclark@chromium.org>, 
	Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Message-ID: <fipxf3vf3nrbiqgwtu7z4vqcyt52dludehdvqc2cnfbal6poyv@uj4hxrlhnqeg>
References: <20250102183232.115279-1-robdclark@gmail.com>
 <20250107125738.GA6991@willie-the-truck>
 <CAF6AEGtZSOMi-=AOmjoXSVkwfyvKOymSuRRMZ7jOcM2wyhu5qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtZSOMi-=AOmjoXSVkwfyvKOymSuRRMZ7jOcM2wyhu5qg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_144334_585887_0C57A733 
X-CRM114-Status: GOOD (  28.54  )
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

On Tue, Jan 07, 2025 at 07:26:44AM -0800, Rob Clark wrote:
> On Tue, Jan 7, 2025 at 4:57 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Thu, Jan 02, 2025 at 10:32:31AM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > On mmu-500, stall-on-fault seems to stall all context banks, causing the
> > > GMU to misbehave.  So limit this feature to smmu-v2 for now.
> > >
> > > This fixes an issue with an older mesa bug taking outo the system
> > > because of GMU going off into the weeds.
> > >
> > > What we _think_ is happening is that, if the GPU generates 1000's of
> > > faults at ~once (which is something that GPUs can be good at), it can
> > > result in a sufficient number of stalled translations preventing other
> > > transactions from entering the same TBU.
> >
> > MMU-500 is an implementation of the SMMUv2 architecture, so this feels
> > upside-down to me. That is, it should always be valid to probe with
> > the less specific "SMMUv2" compatible string (modulo hardware errata)
> > and be limited to the architectural behaviour.
> 
> I should have been more specific and referred to qcom,smmu-v2
> 
> > So what is about MMU-500 that means stalling doesn't work when compared
> > to any other SMMUv2 implementation?
> 
> Well, I have a limited # of data points, in the sense that there
> aren't too many a6xx devices prior to the switch to qcom,smmu-500..
> but I have access to crash metrics for a lot of sc7180 devices
> (qcom,smmu-v2), and I've been unable to find any signs of this sort of
> stall related issue.
> 
> So maybe I can't 100% say this is qcom,smmu-500 vs qcom,smmu-v2, vs
> some other change in later gens that used qcom,smmu-500 or some other
> factor, I'm not sure what other conclusion to draw.

Might it be that v2 was an actual hw, but mmu-500 is somehow
virtualized? And as such by these stalls we might be observing some kind
of FW bug in hyp?

> 
> BR,
> -R

-- 
With best wishes
Dmitry

