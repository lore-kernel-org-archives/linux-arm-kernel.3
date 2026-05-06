Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C484DCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTseNJ/2nD6TjREZvOS9tCHIBcGxqDugB7fH5uhKP20=; b=HsmIWG+w8aZtSXdH/EJlggjm2N
	NDpN9ZMrbgAIxfKkAFktCAPESz1h0m8qsSeMnSTlgBdNa6J7KAAFziAUNwJHah3kSkxP6PtVMAURQ
	xMVt9R/TE6wCthWTfg7rTV9F43zO475yfDaNNNEb0hhbnYENBRZeSc0ktygB2agLHTF4jyUKY1jba
	ix8XCVHaMJj1GuGgKREsVVJi3tkTC8CbY9glmZU7F0cEO7LOCR9vqczy0VykL6cG5PNZMwC8F+ep3
	nIo30d2tRitZXgthWeBl5SNo7KX+9OClYn+iPEb7JMPIp0gkv0hGVw0QAhJnHEHYbGGqMhN8tdJRn
	HwaBYRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe62-00000001Icd-2DwF;
	Wed, 06 May 2026 15:23:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe5z-00000001Ibw-3jnc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:23:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso63675515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778081010; x=1778685810; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cTseNJ/2nD6TjREZvOS9tCHIBcGxqDugB7fH5uhKP20=;
        b=QZ+9iLm7nOqs2j4t5Ny23l5aHTpZROChlxz07mwEzGRUv0yK19pOkI/Ij70z+x2kLu
         apJDO9q3/TLwEkFQuT5CYhAOoTV6kpnjU6SxNcpySJx3z4I4HyoWfl06Zh+p6gOVaXwJ
         1WaaERzNvK7WWECU+RcsIKclwsoCjh4Movm+QOFvZwppYzvkoZnoY3HrvWe1pmgmVDnb
         4MVbJBfz8HDZ7AjIoHEwW0f1aW/jooWOndSg1Tn3DvlMh9xbO5AmxlD9zkmIdJTt5pzx
         c//YAiAJmUgscnMRJLWf+EqaOtlgMoqUEbijxVJ9Q1yHxoXggc4ZufEotDCahwmTY+F6
         kDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081010; x=1778685810;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTseNJ/2nD6TjREZvOS9tCHIBcGxqDugB7fH5uhKP20=;
        b=DD2utShvTdLa6WukfBlykTU3uO2XVky08FLnQkAYx71EygCByDbK4Uoni/7LvpWlyf
         M/hfi5IJeKmZLRo9zgScOE/U/++O1faNMqcEA1MZssnGg+ciAEsM2INzP2iycOC31Vnj
         GoIYdvfi8wLB/ld5RV5lm9ISMt18RUryVK5nKb2I9M6K0IV99tOD8MJkG0zmRKR7tPo0
         j8RGih/BjD7PaesO7MkxWDO+xFnPYEHLn0FG1lbE5v2FuCuHTp7x2Ga0FRr2SIwilV8T
         PsxVFC43awpUsU6vHdDptSnM2obqs7M9Leg4iAkakc5FhrdCDMpO9ToJ+4sdCZ+J2R2c
         XV0w==
X-Gm-Message-State: AOJu0Yw3IMMHFLVzuX16YEIa5nWVLxnI6XqmyNjPtXmVzYJI/VzN6LKt
	ScW1Z0poYS4KmdI4cFcvHAMdLyk40EnNwKEKHQFzNGOWTZxeaUzLUqY1k/laxVCl+w==
X-Gm-Gg: AeBDietRbBLVHpXsZWFhpbonpReFSjq9AdTqQFpKr2PtcqH9OgANnQwTNbpvi5zaMxv
	qc0yYWrPI4VhXpksB48m1Rrl095mEVeqNVOk0G1UAmezFWduiOdLDhkqPcnuwehBatH8XpH01pX
	huYUIMHowrrqX+IiJUJqtiU0nrryAk/WnFexpK/5VAVsjZ+hQtb4Cj2Ev7xSyocp2WPxfrH+w+S
	0+nnoRFeeO85ICKsTJdlFax20VX0y3HiTgCJhvWrXOmOjGaE1TI8TWLEUIm2TA9wvlhpXxX+6Is
	D4wmPmGKgVO2lpu30+ijWrMsA3jbQl1wI9jmx8Rzx3Hkn+eQh4qgbS6olqKbJKfE11ekOljKhM0
	mLSrkGZqJOBiBvdKfOOXnd9dOJ2qON9lGIlWZEYrTmoU7LWxLR0ZpqXDw/WrKdApV2xp0+cyWb2
	f0mngz7iys6ejMNma2UKdlhz8M+2j/VG0MlYZe+VeHcOI6/KRh4XmTqvrHg7k2y0Z6aEHH/CZMX
	0SzcHpheb5EUIiW
X-Received: by 2002:a05:600d:10:b0:489:a4:e555 with SMTP id 5b1f17b1804b1-48e51f36fc6mr55916045e9.21.1778081009725;
        Wed, 06 May 2026 08:23:29 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538acf23sm52766815e9.8.2026.05.06.08.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:23:29 -0700 (PDT)
Date: Wed, 6 May 2026 16:23:26 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, tabba@google.com
Subject: Re: [PATCH] KVM: arm64: Harden clock for nvhe/pKVM
Message-ID: <aftc7n_-43ozFFbl@google.com>
References: <20260430103724.2151625-1-smostafa@google.com>
 <aftYT7BY_9ZdGxmA@google.com>
 <CAFgf54o7pGrtBY1mHuptnCNrRSGVPU=WHW=Qf5v+wGL6Gum-Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFgf54o7pGrtBY1mHuptnCNrRSGVPU=WHW=Qf5v+wGL6Gum-Dg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082332_346653_7A0D2ACF 
X-CRM114-Status: GOOD (  29.09  )
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

On Wed, May 06, 2026 at 04:10:20PM +0100, Mostafa Saleh wrote:
> On Wed, May 6, 2026 at 4:03 PM Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > On Thu, Apr 30, 2026 at 10:37:24AM +0000, Mostafa Saleh wrote:
> > > Sashiko(locally) reports possiblity of division by zero and
> > > out-of-bounds bitwise shift in trace_clock_update().
> > >
> > > Although the clock update is untrusted, we should at least have some
> > > basic checks to avoid the clock value getting out of sync if the host
> > > is buggy.

> >
> > I am not sure about the gain here. The host can still write values that will
> > make it out of sync anyway.
> >
> > The timestamp is ultimately fed and read by the host.
> >
> 
> This is not about having the clock in sync, but to avoid executing
> undefined behavior, such as division by zero or large shifts in cases
> if the host is buggy and not malicious.
> That was reported by Sashiko
> https://sashiko.dev/#/patchset/20260501111928.259252-1-smostafa%40google.com
> 
> Thanks,
> Mostafa

I would then reword that to make it clear it just prevents the host triggering
UB on the hypervisor. It doesn't really harden much, which is fine because that
data isn't relevant for the hypervisor.

Other than that:

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> 
> > >
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/clock.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
> > > index 32fc4313fe43..a7fc61976fd0 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/clock.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/clock.c
> > > @@ -35,6 +35,9 @@ void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
> > >       struct clock_data *clock = &trace_clock_data;
> > >       u64 bank = clock->cur ^ 1;
> > >
> > > +     if (!mult || shift >= 64)
> > > +             return;
> > > +
> > >       clock->data[bank].mult                  = mult;
> > >       clock->data[bank].shift                 = shift;
> > >       clock->data[bank].epoch_ns              = epoch_ns;
> > > --
> > > 2.54.0.545.g6539524ca2-goog
> > >

