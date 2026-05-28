Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C01CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 23:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPjO7un7h9GEitHQbxwUka5FOoKgZe/Rp3tbdPetJu8=; b=Yg9lDpEB0AAkhYm8KP0gwYhUT1
	7gQKdnLU2oye8PcIXso2VnvjFCaotmMqm0b/8LJJWN2XbRnhT9vpMwJIN2i67p+h76hQZVwdZuAmF
	5bJxr0fYC5tuv4H6Lc68jjQyvgpaXRorhHsGhmsR/H0f8M/d/ZUvuGcNuBH8ruQz9xpBT60z979HD
	CYv+9fZpmxxI13ILu880Z7GhS+cQRpLQGNI3EyccZL0/jahzgo8EEYAzqx+E1Eb4xYmIXcgbZQKoI
	jmkrcrIFSvwOTOnuaaDL3k6xFfvBQJQxPPVsn3vkqDODmhoWnUtBuKi454FhLWdHErfF6cfCDyszI
	+D3e4aBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSkEZ-00000006Xps-3yJ4;
	Thu, 28 May 2026 23:33:51 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSkEX-00000006XpM-3Rci
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 23:33:50 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2bf22c18ad3so195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 16:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780011229; x=1780616029; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mPjO7un7h9GEitHQbxwUka5FOoKgZe/Rp3tbdPetJu8=;
        b=CMBDoZc8pZzmQJ7PL+FRQyWFx+E4/HqV82Fuw8ptFSvlcFvsLwaKsPj4QWBxM4MCmj
         Nsn79NGu8DIqntcJL9Ed1TWrQ2kz1vUYm11ybVwsfSy+Ng9jLGAWM3mP9n01D0aNHCrs
         CJedbYaHN9s+12SDjI+9HgC8Gcdh4U0KhrGYM3DbrADvyiLqUD9Tfy0JhrhWUtZNPFAk
         mMxqdnIFp6NAfE+/jqGzHSQhrbmvnMMmRJM0PwddCkQbu33r2THkcOS9fn1oNKlkFb2/
         6q9/tvqkbq+lQUwA5Q6y1HiRqBc6rjYUJ+fuEEkkXgIJQyxGwsLTibUjAemLNmK5fszc
         +izQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780011229; x=1780616029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPjO7un7h9GEitHQbxwUka5FOoKgZe/Rp3tbdPetJu8=;
        b=GJiFc6YVLCT7xjmhkCVePUith1Cw4XWkbPKW3/4gYM3ydaPDU8UZffA9qB9bBivOmY
         gGyJMDHU65yE+ZahqU/EfFaaEloseWNXsW1eJL6IZazd7VAfcEdEdzhjVpXdKO2Et/YI
         /aXtpfU553KbZHDxF5DN+hBr6UpT4cV17qi3vFZMabYU0dTtfdQXgHi5bfqMKpdXkTG3
         qdeXsKrQXxFyPmWckKt8Ulf2DqvFtbLNE18c0ib5x9vcFQjbSmoj/6zQOr9HFbR68qqJ
         8jGaWWTsygkkY2YRT+qXow9d0+SpkSs+aGUnfR6wIqi+BUWRhtpPQmZ73T7sdNXO3fsE
         3u+w==
X-Forwarded-Encrypted: i=1; AFNElJ989YXQ7IBSqc0uJ7CLB3jJOYsGhKkHUiPZFQ7L7Q8Y+mRhQEbtIL/uuGwlbHX4MJVf+fZi5KgaRUvelCMvMj73@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0KyzMDdQbn9zWSw3+X8bGBijx5YpOciauCdujO9Lz1wVnQvjg
	X2Zb3fMmnYV6hN/Uhpw0/qddJKvuZzPfJZrDGpYY+fj+JyfBuLaVoA6WYvy6Ye3yFA==
X-Gm-Gg: Acq92OEO5mzigK1+EUJBumMC7odbXxSqO5KceRFzCL/ZNv9CDhEWATimrHXaBAxEC98
	odt8sIb6Hw1TG5DEmteB/m5R3Rw2nt2tqWzG5kKeqMyiihJW0js7FVRXJ66zVA6vofeWgFBdCG1
	oQCpBUN4CiE28YmRFW9hDgOOTRWkJwr5oJm02ykJfNEm+ch4FYcvIJBa7uG1O/lVHOn+oiEgQjM
	xpM4PQQhCPeyzpONizcin44RZ52QqOtyuqcWyLHMEya6gieoEb0C1YBRehfYUuh2DtgDw+0tAKd
	NO3VvOjR5mPj3TexV9bQPjHT6R/iXuJxvrwOBLuJ9YyLV/ZvGkIHu3avcRMyb8h7Ehihtk7J1xa
	XeeaAGYoukNbhyc/MxYewloL+EPAxytV/3fRljq0Ytqd8titCksi07aCagJdKtcxru8yc8D1Ki9
	pUdr6WpZjY5VI2TKz/q7wDF/WDNWQE2CXbki7K++ITiNzKcV9j1akV96bDX9MNILWNEIGW
X-Received: by 2002:a17:903:2a86:b0:2bd:6dad:3dfb with SMTP id d9443c01a7336-2bf22f219aemr32255ad.25.1780011228588;
        Thu, 28 May 2026 16:33:48 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842132e1325sm66133b3a.33.2026.05.28.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 16:33:48 -0700 (PDT)
Date: Thu, 28 May 2026 23:33:42 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 11/11] iommu/arm-smmu-v3: Add KUnit unit tests for
 Runtime PM
Message-ID: <ahjQ1lvu9iS3E-ih@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-12-praan@google.com>
 <ahi3HYssUY9mjjbg@Asurada-Nvidia>
 <ahjLeryndiVuTULP@google.com>
 <ahjN5I4ObyGMDJAK@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahjN5I4ObyGMDJAK@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_163349_860799_38AAC802 
X-CRM114-Status: GOOD (  23.65  )
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

On Thu, May 28, 2026 at 04:21:08PM -0700, Nicolin Chen wrote:
> On Thu, May 28, 2026 at 11:10:50PM +0000, Pranjal Shrivastava wrote:
> > On Thu, May 28, 2026 at 02:43:57PM -0700, Nicolin Chen wrote:
> > > On Wed, May 27, 2026 at 10:14:07PM +0000, Pranjal Shrivastava wrote:
> > > > Introduce a kunit selftests to verify the Runtime PM elision gating,
> > > > post-suspend elisions and progress on resumption under active
> > > > invalidation load. Simulate concurrent HW suspension using a timer.
> > > > Mock all HW registers and CMDQ buffers by allocating them on RAM.
> > > > Make the mock CMDQ self-consuming to avoid hitting queue_full scenarios.
> > > > 
> > > > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > > 
> > > Maybe I am wrong, yet this reads like an entirely AI-generated code.
> > > So, should it have an Assisted-by?
> > > 
> > 
> > Agh, It appears I made an error during the final send and mistakenly
> > posted an old WIP version of this patch! I created a patch file before
> > committing the final changes. This has remnants of older experiments and 
> > lacks severals other cleanups!
> > 
> > I'm aware of the AI usage guidelines. However, this is not an entirely AI
> > generated patch, it's a pre-cleanup snapshot of a WIP version where I had
> > multiple rpm tests (an attempt to use kthreads to simulate races) that
> > were using shared functions like the mock_cmdq etc. remnants of which 
> > are seen in this patch. *FACEPALM*.
> 
> It'd be still very nice to have a KUNIT coverage.

Yes, I plan to add a few RPM tests to the KUNIT. 

This however was a WIP version that went into the v7 patches *before* I 
commited the final version of this. Basically git format-patch *before*
committing the final version..

Thanks,
Praan

