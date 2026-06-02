Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9B6C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 06:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhEw5DiSYpz62UgZllWX9BsqQC/TZl5aB/QiWr0aWdI=; b=b+meALMcARtUhPBn4KDE9WQkRR
	pADOsM9mPwZCJUHpZxavt7yj3CARjoJNcGzSU2qBCeM5za78c2xvMOZ74va3HAVeObdKNRR6TBuho
	ihb229q6dxhlTj1l/91nTf2/Cn2q3YRiElNgqMzmv+Wh4V0308UtlRUmZWI8A7FhwMs3+I5hX1vp/
	YiVthrUDkhlQfBe4afISponv4Rg7bkANCYwvM1ccsD1cs7b1//UcS7LIm/mhdr5G8jWRxtobmXNda
	EUuH3s7g28IONnGpxmXIZ382ldnMBagiMwa9FysTaQrFB0FBs306UrZWpqnUm649QPcrS+P9V2qxo
	0bd29KgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIYb-0000000COHm-0NPU;
	Tue, 02 Jun 2026 06:24:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIYZ-0000000COHK-31pv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 06:24:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2bf2911f93cso1565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 23:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780381495; x=1780986295; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhEw5DiSYpz62UgZllWX9BsqQC/TZl5aB/QiWr0aWdI=;
        b=euK6QnhZAaTQIm1RawfSv0fI5GrqZ6l3SgvJ6X0wjpP6MW8ehgYGd967R+qxchYAnh
         A9d4zCRXZ9wCZdhtp0V+RVREgCCHiN4R4NvEa1DY4TlpWLWGJUjWr7EyDMh1kIZN67zY
         bZBgXCqhZp3AjNlCSWBtAqXgiay0RR4xdw/EZApjn6dC2LbpHgikGcBHTSuZA72HRjFt
         ymMUKsOY9jfpcwps44uvj1vIweycqw0omJZldQGj1/BhQvQW+pq6UYAzToP3Zxr/CrOf
         +VOxRb7zhNPWqhQ20CxpZcY7R5hfNALcDpYDE4SJwxMB806Vfn5EB+0hdsNoiLrNX+v8
         d63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780381495; x=1780986295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhEw5DiSYpz62UgZllWX9BsqQC/TZl5aB/QiWr0aWdI=;
        b=aEIs/6xZarQQAMkhHW9sS4GusIx9k+RUkBNd4bhkD06RqL+DZa9piDbIU+VBQgrEPX
         280wIulx1If9Nq3iU/c9k/3JwiPjr35DKZQDao5YBF5UgOtk+UG5dm4CXkj7Tf72qE+r
         p/2MtvSj8dWDVnuQg8T1ZcgGFlySrYutKMLcJjyz0ibB4k/2CmFG/BqODoeJp/tLoOmL
         fcUgy1A/shIJt04ihupK/D8xLy9sidqypkIY33UL9ZEIgFXJ8Yu4iT6XyIVutCE8JDx2
         fZ7fnAB3UPUrry9uPsyYGrrHXMrJv8rz78dLzQ5tbdEXdb90CXQ9MSznoCp6E/fmWUZT
         6OsA==
X-Forwarded-Encrypted: i=1; AFNElJ9XEBDK8f8srl7uYbXEeWsgibH7o0Pq3wAeEhsCxuvqT8T6l+ALqpNsYnN9hxxBtnM0IrBbXVylN3nWKvSE133H@lists.infradead.org
X-Gm-Message-State: AOJu0YybcvoWX4oXtDe+kvLATFNjKexBaCFHONQDzEt0dzMXIdx2DWUt
	BUeEdyS3eAFyaZkozrM5V8e3ZcArxEZHw++foTOfW6tCZX9lgZr+Ct67Oo7b37pRzw==
X-Gm-Gg: Acq92OGmV5ZMNkIjyL5yXHvtIn5hfSOCEoSbGXwCSUvPRmRUELylvktVLKmiB4IcEi4
	tyCYuwgAfq4Bh6d87431F9VaRcflm0d6os5BNEAnztEbqaWfDTmU9IRk1bxVvxj+3uhSNzvFS4Z
	5/CdJMqwoOpT83L6kZyvnLkgrfUIDMD5kcbg4CgB03y2Qb/E6QCDpJhmHYbt1LuwW7v0MYZyJuz
	6xbZkFiLqxW2SzoukJ5giUyHVZb9KfbaPvkTMlVrZNswwNDoc4Kp9K4G0bz6fDuauP0jrlO3wOo
	n7K8c6Op/1EIXuc7WFUXIKvMgSJfX1vN+1yGMcmD01EUKI6LnStxJw1MS1PyP9oURWrfuyox8nj
	ShjOJdVbHgrhBBcFYlxeY0BKyFDZ8Ptu29sDC1J9AoxspxOr7xRJpNuT64NIZankATkRlx6+x/h
	oOQe3JCO3Mux3j3PMyGchcuRPn+RqGOJJEBr5NfDtHRZIgDq3Omp5NX9WS8NNq+zwkosMkeSc=
X-Received: by 2002:a17:903:3848:b0:2bd:6dad:3dfa with SMTP id d9443c01a7336-2c10eb301ddmr2110195ad.24.1780381494066;
        Mon, 01 Jun 2026 23:24:54 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc9bff159sm5459516a91.0.2026.06.01.23.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:24:53 -0700 (PDT)
Date: Tue, 2 Jun 2026 06:24:46 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw
 access
Message-ID: <ah53Lq8DTAsVUY0n@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-12-praan@google.com>
 <ah4isiGhSScKMotO@Asurada-Nvidia>
 <ah5VOE5vuEPwr4oQ@google.com>
 <ah5vZl3zcC6YPeZ5@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah5vZl3zcC6YPeZ5@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_232455_762189_048EC290 
X-CRM114-Status: GOOD (  22.41  )
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

On Mon, Jun 01, 2026 at 10:51:34PM -0700, Nicolin Chen wrote:
> On Tue, Jun 02, 2026 at 03:59:52AM +0000, Pranjal Shrivastava wrote:
> > On Mon, Jun 01, 2026 at 05:24:18PM -0700, Nicolin Chen wrote:
> > > On Mon, Jun 01, 2026 at 09:59:08PM +0000, Pranjal Shrivastava wrote:
> > > > -static inline bool arm_smmu_can_elide(struct arm_smmu_device *smmu)
> > > > +static inline bool arm_smmu_cmdq_can_elide(struct arm_smmu_device *smmu)
> > > >  {
> > > >  	return !!Q_STOP(READ_ONCE(smmu->cmdq.q.llq.prod));
> > > >  }
> > > 
> > > Can it be named perfectly at the beginning?
> > 
> > Ack.
> > 
> > > 
> > > And again, should it check Q_STOP in vcmdq?
> > 
> > I don't think so.. the primary CMDQ's STOP_FLAG should act as a proxy for
> > the SMMU's global power state. Since all queues (primary and secondary)
> > are gated synchronously during suspend after SMMUEN=0, and ungated before
> > SMMUEN=1 (i.e.before the caching can begin). Checking the primary queue 
> > should suffice..
> 
> Should leave a note inline to elaborate why we only check primary
> cmdq only.

Ack. 

> 
> [...]
> > We can also decide to drop the can_elide checks from invs_array and
> > atc_inv_master altogether, leaving gerror & page_response the only
> > remaining call-sites, both of which don't use secondary queues.
> 
> That's not true.. In the host mode, any command will be issued to
> vcmdq. IOW, primary queue might not be used at all.
> 

Alright, I see the supports_cmd is a Guest-only thing. I'll add not to
the can_elide helper.

Praan

