Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4205CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 04:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeVwboJJee/PFYlolYYVyKzaxGvMwNKFwWXPyXPPzMM=; b=igk+9AQ1GhEKaKMT19YSSMAcoU
	cexDgq+1rKJBlVEN4ydnGUE7P+GO1W0+do9wpPpcnJATjk73tUEnXKtCYWSXI434pvc+sPx9/2AhJ
	ZGWhp6HLELNtFVyjasj234jNiUIxqc5DE1iesGU//cFC+TjHyltkjfWDsKK++Or6JBFVFyaSroYVm
	jF0MOvT//VmlHYuRvm3cIdi8VJV744FF2+fLBsbnAkX5vRjsgL/VRFeGR1Scg3hNUmSoTF9AI7XL0
	MMi8Cc9SccOxsRcwro+V9CzUAecFp7uLU82wbi19KnmIBD2AtrFyCIm5pkJWz8l2ygJAvSQX3UqR9
	IK3LHLtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGIL-0000000CFxG-3Jrx;
	Tue, 02 Jun 2026 04:00:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGIK-0000000CFwR-1cRD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 04:00:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf22c18ad3so1145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 21:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780372799; x=1780977599; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yeVwboJJee/PFYlolYYVyKzaxGvMwNKFwWXPyXPPzMM=;
        b=RtaUJt2eLI8f1ZRGmHNc+VfnWGaUBZrNg51nfwQzLFRWOZzjoIAtb4DaiiD1q1GFB2
         kHQjF1jNaaZ5qvLZKYSERKoMcUSUBXmx/aSWIOKlZ/y6oh3ggVbm9osx6bl4v9ypuqg4
         IxvXAq/9VpgrDHtKc4SIKtHU/LnWuNerDvUcUuThYa50kSE8KgnjFwDBq1cRrTJ+7EfO
         Cn9X9UdMwR/Xu+HwHS4JjPBcCkWmLOYwtNQfctusKJslR8wNwRwMmf+o19EYHJa2hGi7
         hidUfsuyhmvYHUzWDqN0dDDC1ZsDTa7WURnfDS9GoYdCgK9Mox/BfNOrKs+9wEC1EdXS
         4woQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780372799; x=1780977599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeVwboJJee/PFYlolYYVyKzaxGvMwNKFwWXPyXPPzMM=;
        b=Oct+REIfT7AkUVFNnGMzJR1Ark+K1/YU1DG7LLZFhAVeIKwrTSsuDYwpFJMi+rfFTq
         lpNHnqISEiJ7Kf0ofRxRqQgr7FFTB2ihS3vjZAuXCO5Jtll3YY7QDioZt+L5rmJjA8+O
         3yqj1oRCBs07fYUHeylEJ+n2kOiWcEnejwGv/i5vBmuEesXKweZD0zeCU9ypGGAE5Avz
         6OFhH1oaOI5nUrLdtoN6E5qAKJ+zqpLNN/4/xQBoBGCSXlTWVoX9WhJnVq9lbVG2kRzC
         4LTID0Bg+Z4Cbtj3v2Tl9jq1cUoBYieX+qvzNoAX3InvWvtEhBruJEzDkJ9mMGjZgpoA
         xLhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mtMzd0jgXcikUcXT6mz62pL5wiF86ui/shorT1B66b5LWPQ8Z9LsKEJKwWbr1UI/EIOWqBPIbChHbpbzJsl0s@lists.infradead.org
X-Gm-Message-State: AOJu0YwpVwFfzsFDCTbp8yXmKivWjw+htpu2AqsLG6E4b7MojgPrTfe5
	CzfpG8cJLpPT3hHAFNSWDjh64zKDRr5UaEjNnwoVZa0j71QiapC6qGKGrVsXsJvYgw==
X-Gm-Gg: Acq92OFiZN4hFSY6L1Xl3wLEuKI323tVsy1qwiZXCY/mBnCkVPF5PKtYLcg2lm+VFKS
	UwPNAU4HrPoI+XaGrq8Q/ya9b9xkunkthCrgjO9QXaKtnyGpwYqMHKLRn714O9LgnD+QNoHUmr0
	BZ0d/jHJUU8xYFX871bWxHFkkLzLiK0OHyor7Wid3qOia5AUAoPRl1eWOK5fA2TX1Yg96Lz6cJe
	AJ+cxoC0XWrw8z/BtW/87TVj/MLfUtYDv+W6oP2ItU4IwInhn5EDSxKNu7vW9AF4laemcW3IOmb
	hWNujnglnTMU2LkCbJrMAvjempihvyN6k9BnkO+sYnQO8cltSUid/Xhow9cBmwJPXF7BkJKG8IU
	tOHsu3oIQJJCBHLPC8Rri1YvcFK4OAIwCyWo1ilc7Pp5MQ7JRU0GkXyb0N85kYdMNaoNWoDYxiN
	Ut3/7lSYS2uMIDdb0yurL8Jb4NowG8wIbxa/rLMYvc2ykeRhuqG2/ho8Na4EhBpFpj6D9Xu8o=
X-Received: by 2002:a17:902:ccc3:b0:2bd:6727:d689 with SMTP id d9443c01a7336-2c10e88445cmr1839125ad.12.1780372798814;
        Mon, 01 Jun 2026 20:59:58 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84233c08eefsm7393253b3a.4.2026.06.01.20.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:59:57 -0700 (PDT)
Date: Tue, 2 Jun 2026 03:59:52 +0000
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
Message-ID: <ah5VOE5vuEPwr4oQ@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-12-praan@google.com>
 <ah4isiGhSScKMotO@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah4isiGhSScKMotO@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_210000_426679_25D0A5BE 
X-CRM114-Status: GOOD (  13.08  )
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

On Mon, Jun 01, 2026 at 05:24:18PM -0700, Nicolin Chen wrote:
> On Mon, Jun 01, 2026 at 09:59:08PM +0000, Pranjal Shrivastava wrote:
> > -static inline bool arm_smmu_can_elide(struct arm_smmu_device *smmu)
> > +static inline bool arm_smmu_cmdq_can_elide(struct arm_smmu_device *smmu)
> >  {
> >  	return !!Q_STOP(READ_ONCE(smmu->cmdq.q.llq.prod));
> >  }
> 
> Can it be named perfectly at the beginning?

Ack.

> 
> And again, should it check Q_STOP in vcmdq?

I don't think so.. the primary CMDQ's STOP_FLAG should act as a proxy for
the SMMU's global power state. Since all queues (primary and secondary)
are gated synchronously during suspend after SMMUEN=0, and ungated before
SMMUEN=1 (i.e.before the caching can begin). Checking the primary queue 
should suffice..

We can also decide to drop the can_elide checks from invs_array and
atc_inv_master altogether, leaving gerror & page_response the only
remaining call-sites, both of which don't use secondary queues.

Praan

