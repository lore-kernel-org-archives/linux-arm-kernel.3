Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35217C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 01:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp2cPDX2Gx1yqqbKf91cIrL6zATVqvS/PN2+ecRrrmc=; b=T0IbeNl9FNU2kN7ZUwa0grDXRL
	S1GSOpnu/o+SgzCan7CinxkN0xjSESenjIPSeWZmW4SK7ElfowzHG5NWcKA1FGcTZI+5uFbHOAud+
	DZTFY2yNDZVVuB23SJT7xwBh3Z/BJPd/Pz2UWyQ7r0sSDnJ8M30fBLKCL7KBMU9rhM9PSvcpx/Zsd
	ZJeOdkvTj0PrDOl0t5rqGx7oM4edUWoBaRls6Cojue4dfbbSMjW9iBazbfzlF7o5z6hlNnW4ahduS
	2QEg/WDkFAeCGTv15FU/25a+lwiWTXhO+rZ+meq9Seg68mDTH5u31gf3bzmh/ItniyddQmUlJexTi
	jp9kGoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmTF-0000000709m-0mfR;
	Wed, 02 Jul 2025 01:41:09 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmQu-00000007039-02N0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 01:38:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-237f18108d2so319265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 18:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751420323; x=1752025123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kp2cPDX2Gx1yqqbKf91cIrL6zATVqvS/PN2+ecRrrmc=;
        b=2Tj9KpAi2rY4TF0kQg8Vc3XdnM7f1/EqLNkqVBw5U0q3wm4z79FFchggJ5egf1HHlm
         hU1CvqYWms18xrWmLjR6BPg65LLGaNblMPQ/VJOom9rq+WajGBH4R3zB9qqUsgZ+7Yu0
         TaZg3QRAp82ouuawTKaM9UxQIa1AbJaqFt5Ys4OwPeRdNya4Ap7VzkirHivizU4NSHYB
         pNFKg+K06TUr0gMV5jb5SOB3CW7VhcCjuOydZ/uMxaxGHUMfMpYlFk9fmPf0dF1U/DSd
         FwhFBsDlhOvyISa+VFCOvLf907NCHYrPkck9XmGa9f9zzNgWczRxkov2XAjDoTN8KpjY
         YOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751420323; x=1752025123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kp2cPDX2Gx1yqqbKf91cIrL6zATVqvS/PN2+ecRrrmc=;
        b=p6HmMuopASWyup4/xY2jH0KOINdKEyhxiFaPPxhEGxpl4ZApwWGNvhKt9Y8iko5hke
         AUXcnKgJstMofBLqos9bewS505duy2m+rq6vsYJ+u5uPUdd2t2WckrXeUE4BFaYwnHKD
         xsjfBWnQJ0ADi+aVTRojfE+eg6klQeWLt/C3B/Y0K+YeyhzE5dde5auKuFVMW83pV3Eg
         Jax7F0j4QyX6vISmrRRYHmqBoq5bnl7wzfmKK9nocQCSEJdF6hVv50rQfatAEpgTu5rS
         XGo14UhBR154zHSB6Z4iGIxdL7iJCZtWpeJ8MQGe97YyA2o9O123nMvTLcKQvXwGErAI
         Z6Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXYrYZ4N3gXilnY9r6GcpIOfoD24As7fmGwdYuIO3sSCkPeC9WWJJlAvhEtf9Gv6mpJJTTX0ka751u7kudYM0Md@lists.infradead.org
X-Gm-Message-State: AOJu0YzmY99ewgGG8U1NXTiEuJWUNhwd1f6iD6vsunrVwlbFDOOcFxph
	mqztQ8Hkk0niVdHsNnoCuk9/F34PJgHVWAm0Aw6DjE8DwcYGMPT6x8cGgay8Da9uAg==
X-Gm-Gg: ASbGncsCeegpdS7tCRLY64MOLRv2J+AruQU540O0uax4Oq0+IktkTXZGeBcPntmCxHp
	NjZUNgPZxfVy2uy7sfGgdEXMvdAfPk15pTG/dphzdVxemQsxAmRxiAABC/ZagBji2jKjxWTdIb5
	Aqa8tVb1U0iH0AKB+0JRNDMKJ0HZbwa5fs+NjZ/nzPwB3jEbxViD7pHZYsz4tC05IMbfhlcFn4b
	Qhgu1FFdrSXGcP10XWU0kOMpus5JE3mpDxb6UdPmsgDORsTT7AItKnyHPynDQznR5QgziWuJ2Rf
	1z21eaz9r1ZobGYNUk8Hk1ls/TucN7mrMoqBYHqsDXOydZrATfmFBwO/0tXAqOQwmyiOQVyy+AX
	sTU/Pz73jfSWnWTuGo8uH
X-Google-Smtp-Source: AGHT+IGlz2Z9E445R3idcc5ZRjEaWuytfr7E4KLC8vSsZvwO+Dw22SVfjYoD7L1quVzpUqXy09mcbA==
X-Received: by 2002:a17:902:c401:b0:235:e1fa:1fbc with SMTP id d9443c01a7336-23c5fd70ee8mr4718365ad.0.1751420322911;
        Tue, 01 Jul 2025 18:38:42 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540b394sm13073470b3a.36.2025.07.01.18.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 18:38:42 -0700 (PDT)
Date: Wed, 2 Jul 2025 01:38:33 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGSNmf5Q82xEbDpX@google.com>
References: <aGQGm1-i4M75b9Qp@google.com>
 <aGQ6KCI9OZEwHdxS@Asurada-Nvidia>
 <aGQ_F7Qx3scbbA-J@google.com>
 <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
 <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
 <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
 <aGR55PUBnwb8qT8U@google.com>
 <aGSBTpY0nkdp2TTL@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGSBTpY0nkdp2TTL@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_183844_067967_02A37653 
X-CRM114-Status: GOOD (  30.05  )
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

On Tue, Jul 01, 2025 at 05:46:06PM -0700, Nicolin Chen wrote:
> On Wed, Jul 02, 2025 at 12:14:28AM +0000, Pranjal Shrivastava wrote:
> > Thus, coming back to the two initial points:
> > 
> > 1) Issuing "non-invalidation" commands through .cache_invalidate could
> >    be confusing, I'm not asking to change the op name here, but if we
> >    plan to label it, let's label them as "Trapped commands" OR
> >    "non-accelerated" commands as you suggested.
> 
> VCMDQ only accelerates limited invalidation commands, not all of
> them: STE cache invalidation and CD cache invalidation commands
> still go down to that op.
> 

Right, I'm just saying the "other" non-accelerated commands that are
NOT invalidations also go down that op. So, if we add a comment, let's 
not call them "non-invalidation" commands.

> > 2) The "FIXME" confusion: The comment in arm_vsmmu_cache_invalidate
> >    mentions we'd like to "fix" the issuing of commands through the main
> >    cmdq and instead like to group by "type", if that "type" is the queue
> >    type (which I assume it is because IOMMU_TYPE has to be arm-smmu-v3),
> 
> I recall that FIXME is noted by Jason at that time. And it should
> be interpreted as "group by opcode", IIUIC.

I see.. I misunderstood that..

> 
> The thing is that for a host kernel that enabled in-kernel VCMDQs,
> those trapped user commands can be just issued to the smmu->cmdq
> or a vcmdq (picked via the get_secondary_cmdq impl_op).
> 

Ohh.. so maybe some sort of a load balancing thing?

> >    what do we plan to do differently there, given that the op is only
> >    for trapped commands *have* to go through the main CMDQ?
> 
> If we do something differently there, it could just do a one-time
> get_secondary_cmdq call to pick a in-kernel vcmdq over smmu->cmdq
> to fill in all the trapped commands.
> 

Alright.

> And this is not related to this series at all.

Agreed, sorry for the confusion then.. I thought that the "type" meant
the queue type.. I guess it's all done then. I have no further questions

Thanks for the clarification!

> 
> Nicolin

Praan

