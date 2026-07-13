Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDC0C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZ0k43QjY4fFBTZv9XwnB5eVI6fl2iA5pqXp0CRkiRA=; b=IR6EW1kB1OeJSQUZSyl9kTMacT
	ZDVIO7uNIgWoQisLtQoy1wPOEg5N6Lel8GcppzXaAw/I/oFrSha5nrZ9JIJExMLNtm2LKjbr0zfCy
	OC3CP6eoC5fx3fiJ1rSWd/jQRG/UulBzMjoySESsTXsAqLgRsw1tkZdTo4941+7V9CcXhL1Qx1X+d
	zTeoWY15o09Pc1Kov2uHfl2MSGpYV5nL3rdh4PhM3+yfH+UE9cEDde1wNiUL9Hl3vmhFvyHZxuT8E
	IF3jI9o3Ydd9W+famu2zZdW5zswobjRHLcxSN9NeK1u/fS9gBlEAzQtx0NFeIEB51OezfAvhzFqXz
	RfqSFZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEVz-00000008yS6-1NPY;
	Mon, 13 Jul 2026 11:07:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEVv-00000008yRm-46dW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:07:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso86595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783940874; x=1784545674; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YZ0k43QjY4fFBTZv9XwnB5eVI6fl2iA5pqXp0CRkiRA=;
        b=CK66JEUf9X7AJSc8eoDZA8apQChmc8u/9zl/TjycVqnRw7W/AeQj9IgRLevRlh0e5S
         58BVZHt2wo2Ap/iJ/eAofk/ocojChPmApZ/F6DJpy9BFYJXYGrZb5JXP+StTDWV5E/N7
         NTpfxDBmbg1em9KWms9JuY+jtfxV11Kxy/pDJdSx2WUg4QmeqEfBiURBUFpGAudtdYsb
         BjWe6o7rvBygAC5xbAUfn6NimnrnzFhipDP7KnXpS0R9OdQ1pR5n9v0bW4O4B14MLGAz
         KRMMXvvb6pGkApTe7/luatNqi7sRIndH128q7x4tUFJHnNt1avttrNWpOcDhU8WZRTxe
         79Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940874; x=1784545674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZ0k43QjY4fFBTZv9XwnB5eVI6fl2iA5pqXp0CRkiRA=;
        b=I8W+Nw+jmBjHqiiM0joFthwj3SAT1bpcZsuh9e+LVwACTR8j03MdJSTF3oTjH29K4D
         RIqAPQQunO/bljxH/9vM/Svdguh8nIjph4LhZWABtJhfKkMA3hXO1XzifCf9J5oWnxP4
         dX58ZdVGm+u/G9wptzcEVU0ZXVvNyJJ0TAopPeu7SgoAxF0q7rWp/W0Wa0vhwMHrqpSz
         M0KgSrJyaxAUh+trvYBEjzZexNV9C9QN2pfaK0uY9pM5/IrIqDprXiFUIYJM9LEexR9v
         Bb9NVxe1y9bbPCOlcml8Lv4W51wIcPTLFzq+iPKgdmArq2Ual4wVKkZepNYE3P7e37jb
         u/pg==
X-Gm-Message-State: AOJu0Yw/qLLGepvQO0uUf517fh68afl43RBk85hMn0/owULw/YGQ4K8b
	vPW1+SqgHtpRun1N+YexZgB12eWaAevtHqXB5x0dftbEsu6nSeglT2OHeotvYEsn+A==
X-Gm-Gg: AfdE7clVUZVOrOdikyUrrnIMLsDVTRXQLEn+EQWeGTdI5JQGtrp/bufd0apbEh2UDts
	9zTsdvKnUdHERiLq+nxX5sI+RdQe/P1vUbYF8F31TwcK95HANaF07fAu+ugYmhg2/5BaEYRW/LA
	iLqwvSKmdJNk7sd3clrmT5nxPmxRpt9rGDbpJGK9kFu0ADrOwFDiDJcEEFRJFucpUE7bOqxFFVU
	+hJxhxXlurjIvYAdkaJui42ECOmiqyNmSEk/8YAJ/yez2B6OIfeOfEHcjHgofJ3vZUNl1s5KPK6
	uupN9Q2PtuJCd/YM5JW1MKExtZPx0h8FfzTWXRirjw4qgDDWngxcib6REf+IqdvYC1n7r9klvNA
	WFDS21KBmW+1250j/+Q913IWRojoALd1tX9S0WasqVz7yMyUNaPdoBONk8mNcX5vWe4H2dtP9Pv
	K0mNhG6Zz6I2TvFjQV6sUMMEMxgYtMHXqwZ9kE907lypzZ0aqm
X-Received: by 2002:a05:600c:a088:b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-4945e32136bmr235535e9.2.1783940873591;
        Mon, 13 Jul 2026 04:07:53 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm82275582f8f.33.2026.07.13.04.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:07:52 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:07:48 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 16/25] iommu/arm-smmu-v3-kvm: Add CMDQ functions
Message-ID: <alTHBD1YBiTbdbIG@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-17-smostafa@google.com>
 <alEXQ2X_0XQylvw-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alEXQ2X_0XQylvw-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040756_031371_C81E110B 
X-CRM114-Status: GOOD (  26.73  )
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

On Fri, Jul 10, 2026 at 05:01:07PM +0100, Vincent Donnefort wrote:
> On Fri, May 01, 2026 at 11:19:18AM +0000, Mostafa Saleh wrote:
> > Add functions to access the command queue, there are 2 main usage:
> > - Hypervisor's own commands, as TLB invalidation, would use functions
> >   as smmu_send_cmd(), which creates and sends a command.
> > - Add host commands to the shadow command queue, after being filtered,
> >   these will be added with smmu_add_cmd_raw.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  14 ++-
> >  .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 107 ++++++++++++++++++
> >  2 files changed, 115 insertions(+), 6 deletions(-)
> > 
[...]

> 
> I only looked at that smmu_wait() as this is the hyp_clock_ns() caller.
> 
> >  
> > +/*
> > + * Wait until @cond is true.
> > + * Return 0 on success, or -ETIMEDOUT
> 
> nit: Would be nice to explain use_wfe. 

I will add it.
> 
> > + */
> > +#define smmu_wait(use_wfe, _cond)					\
> 
> nit:, (__use_wfe, __cond), or (use_fw, cond)

Will do.

> 
> > +({									\
> > +	int __ret = 0;							\
> > +	u64 delay = hyp_clock_ns() + ARM_SMMU_POLL_TIMEOUT_US * 1000;	\
> 
> Does it help to lower the risk for the 128-bits fallback if we keep the
> resolution to _us?

I will remove the tracing clock support as mentioned and I will handle
the overflow in smmu_wait()

> 
> Also, ARM_SMMU_POLL_TIMEOUT_US seems to be 1s. Blocking that long at EL2 is
> really terrible. Any chance to lower that? 
> 

That should never really happen, I am re-using the kernel max, but I can
change this for the hypervisor.

> > +									\
> > +	while (!(_cond)) {						\
> > +		if (use_wfe) {						\
> > +			wfe();						\
> > +			if ((_cond))					\
> 
> nit: I believe there's no need for the double () here is there?
> 

Will do.

Thanks,
Mostafa


