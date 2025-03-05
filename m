Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C42C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2OFT2OoedTJTEmeRVIN9FPGz/gwRD13KVUXjlzrTxU=; b=RSQrkjWcLIoJ5X5gBBnAbolsLF
	AGsz7kUsKsEStkGuVK4IBcYcgUggJRTwxmjehPsSWhNgdD84GNVl9jI8GNYU0oRE8UzoKl7GLdYwi
	IB4yNXmVn9syyxlS5U5PqhwmV+kfLg2qLfI3ELWq0X7LIWtxEPCDr0vHcCSu8K7199dv3tJRn5Xwv
	HI5HVBae7yOhrVOH4D2pe+f1UmiNvFMBCfEj0fDG5NT1vx3LiybBsDqWtqM+ojPNCmJ4MKpzjid8x
	b6VAefvGVzK+iI6ZXt0RJTovRJaQylVh/NKpaGBKp71M0zeD8AZzf4rV1tXiSxZUKHe/HQdzByLRd
	6DUtLXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptdk-00000008wmf-3dYm;
	Wed, 05 Mar 2025 18:38:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptbG-00000008wZE-1uUJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 18:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a2OFT2OoedTJTEmeRVIN9FPGz/gwRD13KVUXjlzrTxU=; b=bzYldFm9orulCNL6m5o7L7+Hh1
	ZR4CtVUEoFPLp7t2RoZr2WEHz2fFTJgIgKETT7boI2/0QqeuSm0h4U43XyF2BswVEardbAG5qcBD0
	xNi1pZhO7UiCY6zenhNCxkTaJLF0xUiKqI5F0gC/62VVir7ZwItmQw/+QGQOwr29QmKPnhJ/Mk1Yn
	SwxmYD3e3HK7j2Z21Ms8vYgnIcxROMJ1+cu0cAQPNsfWb9DvnocAFAFoLuBpMQTptshxkvDizG/FW
	lFXkf0S2BIj1DrU5KHyYwn4BtzNXFZvaxJSYVULuovB4av/xsjuOLtiKIhIvpOEhLv2LHcG34tLDc
	5JiDW2SA==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptbD-00000000gqB-1W4B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:36:09 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4393ee912e1so4815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741199764; x=1741804564; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a2OFT2OoedTJTEmeRVIN9FPGz/gwRD13KVUXjlzrTxU=;
        b=Cxiq/0lkpM4Is7a81WuPI5ZeVzFh/T26nf0nnTi41DREF6C+zqXrXU7IszgaVHsyXD
         iIkcTsWGbwDfd6CZCysPobBwYWuhzulSPCAoilyr0W57eR6iYxF7ahp7uCp91o9FqNoL
         k9NdTG0OGQUXd6KdUZMGILCuxoog+miLrIjEg+DBk1Ohcl4e/BvNlZPTioB/siM4FCIb
         A+wvq4ZKrFMJwkTiZ3KlC60OkMyHJnLRHbc843D03bxPpFc+kjprye0UBaF/5w8uUdbu
         JpBbs3bou2Cx5edgwZ0bYT66afsKw37Y7Ay65/3mw4FFSxMAf+2VPP+p0HskN9rCaBvD
         CB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741199764; x=1741804564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2OFT2OoedTJTEmeRVIN9FPGz/gwRD13KVUXjlzrTxU=;
        b=ggoMeS/VoEl6VQAqlSHt2wTdDm2PIzPr953X90iKX+SCAWiGOJ1grGsJyHpFdg5Ty3
         fTVRvKk1Jl8LpqO59Qmjt3effl+/5ygYsb52yTl+tYISqBfmJg5r1dG8HTs+BDorVfWk
         u7B7y3Crk9lDN/E9VTApQRe2aCJocmBryLMMny9QkABQ5tGsUbp4T+LIRfugnmozW0cY
         n1lmguep2wBcU828GFGR7twnXF8LCZDZviBV17+JnPzX4/EnVSOiegeBYGCqTrn7YG8B
         VBnxAlYT+hMLYPRoQo0I1VZjHToOWIHcrR6jQfjv8sCNVolf62a/8lKrM3CS99NJu1C+
         KMGg==
X-Forwarded-Encrypted: i=1; AJvYcCU8+xcHOVHOm1hSOC4tWilbKo3VvD88uHszKh1NTsWiv07TdSKxcwmthROAQe2U0WdcGvad1ygAO4vzwpdxjyhj@lists.infradead.org
X-Gm-Message-State: AOJu0YxGo5Jyvj3asVqKhGU2z09e2NLbui6E20FfWbWeQFFWlVtg1x30
	QOA7xWhqQ3qT0uJlQvQMitR4ZuNhdErvdBo8qX3ZuHkw+QCsyHrqXRn6Xb2hgg==
X-Gm-Gg: ASbGncvuEeCAXNqJNlIrJe1KyG9klW5E95AiI0kuUu6J3G5BNjlPVTs1E/5HgWX52ZE
	IjLrsqkYF6VfWMQXHLWQF0e7XltcmPGNQ/UwwD5CHDkIk5Wyz5AkHAbuN387DWweGt/n+Yi2x1h
	FRAz2SbIyhs4j7y9uaqe46hPhcwIPCtrpAWxwujymFA4AJGlhMOrmFwJUroFuOuTn9ZXBVtFZsJ
	vDwODJS6DPUDdfzySUBiKLemZh3PuxC7tmBXF66mGxyv8DdUHFqFRohZareFwNF/3xUP4oZ1aqy
	p8mD2GtwHAcaNmxUiZkMsxBxkE4dOvO5E7c69zsmq9rju2gqn/19mus787+OWmgIkUABXWlg6ii
	0REJwL8jrHvUi
X-Google-Smtp-Source: AGHT+IGuoCdVlssAi/H3pLNOEjzh/d6m6UEnCFgp+MZSf4rv9zgHb14AznLZkDz+7g00rolvyanVzA==
X-Received: by 2002:a05:600c:22d0:b0:43b:bfe6:d898 with SMTP id 5b1f17b1804b1-43bdbac5f6dmr43995e9.0.1741199763997;
        Wed, 05 Mar 2025 10:36:03 -0800 (PST)
Received: from google.com (100.235.22.34.bc.googleusercontent.com. [34.22.235.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796600sm21673887f8f.20.2025.03.05.10.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:36:03 -0800 (PST)
Date: Wed, 5 Mar 2025 18:36:01 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 3/4] KVM: arm64: Map the hypervisor FF-A buffers on
 ffa init
Message-ID: <Z8iZkQHknZfY7mpn@google.com>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-4-sebastianene@google.com>
 <20250303234259.GA30749@willie-the-truck>
 <Z8ZPBZF7J-qKdb_i@google.com>
 <20250304015633.GA30882@willie-the-truck>
 <Z8c6enoolJe7Zeqk@google.com>
 <20250305003808.GA31667@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305003808.GA31667@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_183607_499730_2C6F9899 
X-CRM114-Status: GOOD (  51.98  )
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

On Wed, Mar 05, 2025 at 12:38:08AM +0000, Will Deacon wrote:
> On Tue, Mar 04, 2025 at 05:38:02PM +0000, Sebastian Ene wrote:
> > On Tue, Mar 04, 2025 at 01:56:35AM +0000, Will Deacon wrote:
> > > On Tue, Mar 04, 2025 at 12:53:25AM +0000, Sebastian Ene wrote:
> > > > On Mon, Mar 03, 2025 at 11:43:03PM +0000, Will Deacon wrote:
> > > > > On Thu, Feb 27, 2025 at 06:17:48PM +0000, Sebastian Ene wrote:
> > > > > > Map the hypervisor's buffers irrespective to the host and return
> > > > > > a linux error code from the FF-A error code on failure. Remove
> > > > > > the unmap ff-a buffers calls from the hypervisor as it will
> > > > > > never be called.
> > > > > > Prevent the host from using FF-A directly with Trustzone
> > > > > > if the hypervisor could not map its own buffers.
> > > > > > 
> > > > > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > > > > ---
> > > > > >  arch/arm64/kvm/hyp/nvhe/ffa.c | 46 +++++++++++++----------------------
> > > > > >  1 file changed, 17 insertions(+), 29 deletions(-)
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > @@ -861,6 +842,7 @@ int hyp_ffa_init(void *pages)
> > > > > >  {
> > > > > >  	struct arm_smccc_res res;
> > > > > >  	void *tx, *rx;
> > > > > > +	int ret;
> > > > > >  
> > > > > >  	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
> > > > > >  		return 0;
> > > > > > @@ -911,5 +893,11 @@ int hyp_ffa_init(void *pages)
> > > > > >  		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
> > > > > >  	};
> > > > > >  
> > > > > > +	/* Map our hypervisor buffers into the SPMD */
> > > > > > +	ret = ffa_map_hyp_buffers();
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > 
> > > > > Doesn't calling RXTX_MAP here undo the fix from c9c012625e12 ("KVM:
> > > > > arm64: Trap FFA_VERSION host call in pKVM") where we want to allow for
> > > > > the host to negotiate the version lazily?
> > > > 
> > > > We still have the same behaviour where we don't allow memory
> > > > sharing to happen until the version is negotiated but this
> > > > separates the hypervisor buffer mapping part from the host.
> > > 
> > > Sadly, the spec doesn't restrict this to the memory sharing calls:
> > > 
> > >   | [...] negotiation of the version must happen before an invocation of
> > >   | any other FF-A ABI
> > > 
> > 
> > We do that, as the hypervisor negotiates its own version in
> > hyp_ffa_init.
> 
> hyp_ffa_init() only issues FFA_VERSION afaict, which is the one call
> that you're allowed to make during negotiation. So the existing code is
> fine.
> 
> > I think the host shouldn't be allowed to overwrite the
> > hyp_ffa_version obtained from _init, this feels wrong as you
> > can have a driver that forcefully downgrades the hypervisor to an old
> > version.
> 
> I think that's also fine. The FFA code in the hypervisor exists solely
> to proxy requests from the host; it's not used for anything else and so,
> from the host's persective, FFA should behave identically to the case in
> which the proxy is not present (e.g. if we were just using VHE). That
> means that we're doing the right thing by deferring to the host for
> version negotation.
> 
> Are you saying there's a bug in the current code if the host negotiates
> the downgrade?

It is an issue *only* for doing guest-ffa (which isn't posted here yet).
If we allow the host to dictate the version & there is an issue with TZ
FF-A dispatcher in that version => the guests will be affected by this
as well.

> 
> > We need to do three things, Sudeep & Will please correct me if I am
> > wrong, but this is how I see it:
> > 
> > - the hypervisor should act as a separate entity (it has a different ID and
> > in the current implementation we don't do a distinction between host/hyp) and
> > it should be able to lock its own version from init.
> 
> I strongly disagree with that. The hypervisor isn't using FFA for
> anything other than proxying the host and so we don't need to negotiate
> a separate version.
> 
> What would we gain by doing this? Is there a bug with what we're doing
> at the moment?

I think we need to make a distinction between the host and the
hypervisor when we are adding support for guest-ffa. We currently have
the same id (== 0) for both of them.

> 
> > - keep a separate version negotiated for the host
> > - trap FFA_ID_GET from the host and return ID=1 because
> >   currently we forward the call to the TZ and it returns the same ID
> >   as the (hypervisor == 0).
> 
> Why is this beneficial? It just looks like complexity at EL2 for no gain
> to me, but maybe I'm missing something.
>

Because the host can impersonate the hypervisor using ff-a direct calls atm.
and we are in a position to restrict the host from playing nasty games
with TZ.

> Will

Thanks,
Sebastian

