Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C598C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcGW3hftQvU3jMggm2moyLYr9Q6yInAQjdzrqRR3vjc=; b=1JBpWLfyF5PEswLPGuLLSBFihb
	v0Lfg1HLJjySdrlgBgbPGkFQ57hr7iM7MnNZplr8yFZ4gmK0Wqy3yAtyB00lh/bYOShn2IQr0U3Kb
	ddgN5g42oRGTY01Du+Jm4RgVKMGZkoGLU+RyuIhSLIuGWe1lJxJiocEAOL5AX1J8KYkMKjXxBktJU
	kR3KJd+rs8ITX+6wJoTr+rUzUfGtuJ8VE6jS3+rx3tOP8pxI1ljF1Ciys1SwZd8dVzaB2/SdpOMxg
	rGg+LDdAeakdi5x6pCPYc9AZwdNneUASOphMS0JZSveg3G+125lE7tZqfS1pykN21/kUHTu/1+5ij
	fz3TWAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGYw-00000002i1g-0mmj;
	Tue, 04 Mar 2025 00:55:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGXK-00000002huN-2G9v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:53:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43bca0048c3so12095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741049609; x=1741654409; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QcGW3hftQvU3jMggm2moyLYr9Q6yInAQjdzrqRR3vjc=;
        b=Nnxp+r4w7NCwt6f3OHiISgO8nTwnr+Fg+IzxysDkIh+avxYXCsEpaycTZM6hv/bluP
         /1ZMhxGgkmhu/wIYJomJgk39NcLyg72OBSr4+53fvxheMNMNDLRKe43LOcjcSg7v9vDx
         7RYOOjml4uXSJGKozrh76lEsahq8F5oRr0QIsB0pPZOaQ2uxiKgvKSIZTXZ/2JCyiAIN
         B2nUBcPwWzgZ5VzL6XmV5redpN1wjPq9UEvDk1diGj8u77FDcnM4W3O1lFvTo0Yi9uT2
         Dk+kfRFDC/A93cghhjzAp0y6LndLLlSG9aNT44Pl6s1pKaPa4H3/e8/iO4ZV9071Itqt
         dKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741049609; x=1741654409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcGW3hftQvU3jMggm2moyLYr9Q6yInAQjdzrqRR3vjc=;
        b=ZFOyMeJgl5wygcdh7QUB+g3eiTuqCNLGn9OiyU9KkZA3asfAPTbsNGCf4neVPsP9L4
         fH4aRc3WsoJUDUiQxqJotQkfb9oakFgnnrXcJ/8CF76Hh/LWeKcaSdCjc/6bpyk4iQ1T
         6BLU2S2BtY6FC6PAPaCoqvIL6FeOExGEfernSGV7UtisngjDUJGVDrJicj/vdFBuWyUq
         vAa47/BkkzDYZNZFk3C3tMIpcO1dyHBygcPrvHlfx990rlf+DgRnoNebCBkLmnCNfRrA
         4k4DnvM2k/z7s6xaIc6mOlj7tmFKpwnDFwhaFhqNcqaFXAQefhr9JN+qXKaWhi9QycBH
         Ou4w==
X-Forwarded-Encrypted: i=1; AJvYcCWlExo0wHWFLb9eC6sny940tinpSa5l0aHvUgPbKnvoDebSb33qrh8MlYONx6tCOmpca32/A6+anOPo8xd6kYT+@lists.infradead.org
X-Gm-Message-State: AOJu0YwnEkU6Q6V6iAtwY/q/39C/ewwX3djhMp8AKt/TPm4DHKII3vGm
	GsqZrWm9Lj/0dUnrdSXh79i7U0+Sr66RhWfIXOYxVyuZtmt7yi0X48bby4gmaw==
X-Gm-Gg: ASbGnctJDXOp+z1WZePZRwJV73tHake/AJRkywXzfx8ZDJHzTw7UqGylZpNCQ6tViqH
	MvgQBfvbL0Jyh63CecMgIvIrdujqVrOhHHtqrRLe9VUrr8AR9xETpSwRvmgno69EJUiie7t0P0v
	WxdwC4yKV0Fu/l+O/zEZDbSIgaAzDKUpRJJLQ9hhhkcd6bsvVfM1KYZXfa/m1Ou8J+BQNVC7jqO
	RFwZkvgSu4OPkJUR48nJ4DJr1zl9ahicAC6SeznNM667Q8PrCK3GahLocJY6WlFrXZoty/82niw
	+XvTMWDHxfWoC8MF7k6kTalHppsti0vf13IrOKgFnR+7pqLw9pkDPw8OOf1z43u/5T+g1eslnH4
	/hkUHpTI8zJum
X-Google-Smtp-Source: AGHT+IGGyKa5a4dpqv99Cmt1pAVAafiGZn4JUYC2/5rtkoVDs1twq+6HqnYQlt8PwwJ67CJIVwLsOA==
X-Received: by 2002:a05:600c:43d4:b0:439:9434:1b66 with SMTP id 5b1f17b1804b1-43bcbe262d7mr265745e9.1.1741049608743;
        Mon, 03 Mar 2025 16:53:28 -0800 (PST)
Received: from google.com (100.235.22.34.bc.googleusercontent.com. [34.22.235.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4847fe5sm16074903f8f.73.2025.03.03.16.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 16:53:27 -0800 (PST)
Date: Tue, 4 Mar 2025 00:53:25 +0000
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
Message-ID: <Z8ZPBZF7J-qKdb_i@google.com>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-4-sebastianene@google.com>
 <20250303234259.GA30749@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303234259.GA30749@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_165330_600683_49560BEE 
X-CRM114-Status: GOOD (  23.00  )
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

On Mon, Mar 03, 2025 at 11:43:03PM +0000, Will Deacon wrote:
> On Thu, Feb 27, 2025 at 06:17:48PM +0000, Sebastian Ene wrote:
> > Map the hypervisor's buffers irrespective to the host and return
> > a linux error code from the FF-A error code on failure. Remove
> > the unmap ff-a buffers calls from the hypervisor as it will
> > never be called.
> > Prevent the host from using FF-A directly with Trustzone
> > if the hypervisor could not map its own buffers.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 46 +++++++++++++----------------------
> >  1 file changed, 17 insertions(+), 29 deletions(-)
> 
> [...]
> 
> > @@ -861,6 +842,7 @@ int hyp_ffa_init(void *pages)
> >  {
> >  	struct arm_smccc_res res;
> >  	void *tx, *rx;
> > +	int ret;
> >  
> >  	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
> >  		return 0;
> > @@ -911,5 +893,11 @@ int hyp_ffa_init(void *pages)
> >  		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
> >  	};
> >  
> > +	/* Map our hypervisor buffers into the SPMD */
> > +	ret = ffa_map_hyp_buffers();
> > +	if (ret)
> > +		return ret;
> 
> Doesn't calling RXTX_MAP here undo the fix from c9c012625e12 ("KVM:
> arm64: Trap FFA_VERSION host call in pKVM") where we want to allow for
> the host to negotiate the version lazily?

We still have the same behaviour where we don't allow memory
sharing to happen until the version is negotiated but this
separates the hypervisor buffer mapping part from the host.

> 
> Will

Thanks,
Sebastian

