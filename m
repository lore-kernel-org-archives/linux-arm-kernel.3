Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2FFC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hL600D2Vd4+7j33RPgiVpKbsOkzk21To6aEbWxtha+U=; b=fOrJZ8VXBowye+0Lykfx32jlPL
	ET71s1UDFKku+a0yPiPJ9TR6utLkQb6s6V0SEkHV+KzP3/DYyyEleWPAq7Utus8tEF7cmhAUeHsUN
	nzvxl7jpUYbleMtb8L8vyIxR+JbAK+lwBtSmPSe76J65UYUVHAsERUtUFwC7+GyN/akq/aD/DBdN9
	sDhSAgBItoktg2Jw/q25JIz6S6JnqPYL9skjLVNTT4e8N7M0JIhycuoGpkTcSbhTYswy3/m4YaVvP
	8BBwf/gCuI6yacKSzmKU+24JbLs5wkLY2GnuKb40SSUXsZO3nqZycKciSbv9aec1vgKBd2czrY5jb
	7Zi1QPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYf9-00000006ACb-1vmT;
	Tue, 04 Mar 2025 20:14:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWDX-00000005fSH-0sRR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:38:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4393ee912e1so62635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741109885; x=1741714685; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hL600D2Vd4+7j33RPgiVpKbsOkzk21To6aEbWxtha+U=;
        b=pfVRmjHG3kd2AMDRhhkbCJg3xYJaXvEJH0o8Ofoa5K2h+mf9G6F2izN/ArRm7mC2Yu
         Dr38ITAZmIwstQWmTmjEyk4k65v/TQ6SJaZN7V24RrFf1RBX96pJLPNlOY0yllOxuadA
         LC7dhyZuy3DHDQbLt2S5tGxDE7F5PdynfXu2oyfbcTSS3gYGCYYP7aY5sZLevgh46/n9
         PkdUbMAg0WEelKj3tWickDVYNJV+coyDxwrA8oj0dei754TO0zr1i8Q6WBdMf72Cj0AO
         LBrScW2wvU4rsDEJsTty+zdoVtQDBnwBnxmum2Dn0e4iXRUIG7YQ+n9JWH6bj7Bug767
         vMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741109885; x=1741714685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hL600D2Vd4+7j33RPgiVpKbsOkzk21To6aEbWxtha+U=;
        b=FCyodYKO6YxbuHoTO5r0a4/ZA0tWwaV57IqTNzoOEKTlivVUk4Pp71pDUcr8VIhNZA
         xVIvT+vvh3kPkejOEliWLwO3f3qRprpWt/1CdK88Bgt1fpTfcIA4luA/LL/E39yu1yC0
         L9HmdCmi6zT5ow7tYPoXbdQCy2zsTCiOaPX90GBT4clRJJavgee3vuBAooYgw+FhqBQD
         XX0hSjwsnp1gysLXpl7m91CaorKCAF9XA0Rik8cfcNjYYU1pOMpdDhNAzo27mhayfljz
         VqQmA1YZPrQ8HkWdQAosd8IqcqZjOkpUedI6lKhbA/lHcn3RS6FkIsrP+7ZJltcpC9m6
         sl5A==
X-Forwarded-Encrypted: i=1; AJvYcCXxsF1Ydn+1yRdvx1Zb2RfhEWh+hkcfIHKvTA6YhgSKDobq2tJfmiPVMd73/cFQEAKE+ICoeg/tsHeVf7+utTO9@lists.infradead.org
X-Gm-Message-State: AOJu0YwSyDv1AVi/jyvpv9zZMo2KeJITasd78e+x9d1SO3Yn5P/PLs5q
	AmY5SRt8P2UKcO9XmWgM3ADDs6Z0FxEurQ+F348bKKIe+S+c0e78q5JQDHrfrg==
X-Gm-Gg: ASbGncuVN6lVcpHJDDFZpvB5mGKo2t/z3sKA7xDZbA8ZU6lvLh45E1EUOMWZBj2NV7y
	r8yiNq3c0RMt6m2QTm0e4mO0lKUT+6wW82qzbCE5Uvt/sAZjPqXmg+xmG3mlGYvVYYA6TsH3Fk8
	3+BjCOHzD8efXlYEDpmQ/rmBG697/5dPQkRFN088UGwNvhKAebyzCpCoV1/X48gGXSO8eP247tt
	6v00iXkr55EhLdw77Qrbjm4PasSIdKH39b7AdNcMzjbwyLP0+GQCYKbh/k/lyd2XBA/pmHexdMk
	XgSGo7xfrtCUlPMBaqhSqCCIMgZgmpQnzqoiP6nmXcxZCsge/VQUzIwhznm5NWT9JrXa8sA0rMJ
	VEgKotR87zC9T
X-Google-Smtp-Source: AGHT+IEpl5KnI/AmOBYa3wPD1FFPvleHPCRAbMj/fSXQ1+Q66fw7eWALywPcXdmGSME1S33/iyh4Iw==
X-Received: by 2002:a05:600c:329b:b0:439:9434:1b6c with SMTP id 5b1f17b1804b1-43bd15f3ffamr165995e9.3.1741109885428;
        Tue, 04 Mar 2025 09:38:05 -0800 (PST)
Received: from google.com (100.235.22.34.bc.googleusercontent.com. [34.22.235.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d906sm18464176f8f.90.2025.03.04.09.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:38:04 -0800 (PST)
Date: Tue, 4 Mar 2025 17:38:02 +0000
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
Message-ID: <Z8c6enoolJe7Zeqk@google.com>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-4-sebastianene@google.com>
 <20250303234259.GA30749@willie-the-truck>
 <Z8ZPBZF7J-qKdb_i@google.com>
 <20250304015633.GA30882@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304015633.GA30882@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_093807_249223_4880198D 
X-CRM114-Status: GOOD (  36.21  )
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

On Tue, Mar 04, 2025 at 01:56:35AM +0000, Will Deacon wrote:
> On Tue, Mar 04, 2025 at 12:53:25AM +0000, Sebastian Ene wrote:
> > On Mon, Mar 03, 2025 at 11:43:03PM +0000, Will Deacon wrote:
> > > On Thu, Feb 27, 2025 at 06:17:48PM +0000, Sebastian Ene wrote:
> > > > Map the hypervisor's buffers irrespective to the host and return
> > > > a linux error code from the FF-A error code on failure. Remove
> > > > the unmap ff-a buffers calls from the hypervisor as it will
> > > > never be called.
> > > > Prevent the host from using FF-A directly with Trustzone
> > > > if the hypervisor could not map its own buffers.
> > > > 
> > > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > > ---
> > > >  arch/arm64/kvm/hyp/nvhe/ffa.c | 46 +++++++++++++----------------------
> > > >  1 file changed, 17 insertions(+), 29 deletions(-)
> > > 
> > > [...]
> > > 
> > > > @@ -861,6 +842,7 @@ int hyp_ffa_init(void *pages)
> > > >  {
> > > >  	struct arm_smccc_res res;
> > > >  	void *tx, *rx;
> > > > +	int ret;
> > > >  
> > > >  	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
> > > >  		return 0;
> > > > @@ -911,5 +893,11 @@ int hyp_ffa_init(void *pages)
> > > >  		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
> > > >  	};
> > > >  
> > > > +	/* Map our hypervisor buffers into the SPMD */
> > > > +	ret = ffa_map_hyp_buffers();
> > > > +	if (ret)
> > > > +		return ret;
> > > 
> > > Doesn't calling RXTX_MAP here undo the fix from c9c012625e12 ("KVM:
> > > arm64: Trap FFA_VERSION host call in pKVM") where we want to allow for
> > > the host to negotiate the version lazily?
> > 
> > We still have the same behaviour where we don't allow memory
> > sharing to happen until the version is negotiated but this
> > separates the hypervisor buffer mapping part from the host.
> 
> Sadly, the spec doesn't restrict this to the memory sharing calls:
> 
>   | [...] negotiation of the version must happen before an invocation of
>   | any other FF-A ABI
> 

We do that, as the hypervisor negotiates its own version in
hyp_ffa_init. I think the host shouldn't be allowed to overwrite the
hyp_ffa_version obtained from _init, this feels wrong as you
can have a driver that forcefully downgrades the hypervisor to an old
version.

We need to do three things, Sudeep & Will please correct me if I am
wrong, but this is how I see it:

- the hypervisor should act as a separate entity (it has a different ID and
in the current implementation we don't do a distinction between host/hyp) and
it should be able to lock its own version from init.
- keep a separate version negotiated for the host
- trap FFA_ID_GET from the host and return ID=1 because
  currently we forward the call to the TZ and it returns the same ID
  as the (hypervisor == 0).

> We're also probing the minimum rxtx size in hyp_ffa_post_init() so doing
> this here is doubly wrong.
> 

Those operations should happen before the current ffa_map_hyp_buffers()
call, I agree.

Thanks,
Sebastian

> So I think we should probably just drop this patch.
> 
> Will

