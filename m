Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1239CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 10:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRHY8TjgLXlayczNGHNxnYXWUTLClhWO+MAQeAavDGw=; b=O8GOW6NcNc4C+ZsOZMjI0p9P6/
	j105bALA6cSPElaVqviaBSYqJ82Dy1FgLE+5N2oelhEmq8synpzDfd6MM8oSL/PHIn7sN6VT6zGXp
	qxgsJme0OruxTIkYZL7ZAdXitKOw3aQ+eKDsVPPvfVWnEwz7ikDnwQpmY5G9ABgc5PKWobtYYHlqK
	xFxWhT2gB0xNVQy1m4B0SXim5tmiVikUy/AfL8kXpcTsgdZKOHDntXlu8Q41+5EmqpIZJyG6rgZ1j
	3UuNJcsha81W6tKuTHvmf78F+bZ82ZEHg9al6yxXOywoc6OpETKNL9NYhDgVSJhWayDOxqRlWqy74
	vIBMDwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSY4p-00000005bOa-2MGs;
	Thu, 28 May 2026 10:34:59 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSY4n-00000005bNr-1BCv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 10:34:58 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ba180a022dso4365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779964496; x=1780569296; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XRHY8TjgLXlayczNGHNxnYXWUTLClhWO+MAQeAavDGw=;
        b=Iq653w2+1ovummBgMgc7NW34t9HX+/bXAcpR6KdvtOJdwWIaXsGbclgt1/ftVQyiB5
         Ug7tjYN7N5q3ki57MlF4D1jdMa4/9AbmOouAWA5KamTJ6izPp5mvGPvyQJWEMIrfNFXR
         53pr8nTh0rRqBBzq72/L8PkH5Aw7cgOzp850Mm+EvFmrcm1pYMjPCpsmHvcg/F9/5pk6
         ZaBKwiFL4rM0z2OvMZvSP+/WpppJTBvsNgw80W2pYedaljszpFiYLwSsbNaXdk146tk3
         gWD4PvQYwyV28aPUxbAJaA3ol/0yFCRCH5yE1TX3nQd1FoFY1brTPaS5ykGifi6mvd8f
         Q6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964496; x=1780569296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRHY8TjgLXlayczNGHNxnYXWUTLClhWO+MAQeAavDGw=;
        b=sEkTjKrlIyrWXrlo2nlpM0SSFE3uQ+RjuhW0ferd0xC+2jpL+a55mgtT83yt9Fxs6c
         vdU6xQObQ/B4XaP/nT3kTBhk8TwZ8K0zNHbyt462xK/FdZuLiZbAc8ox52yyWMLAMhjT
         0PH6OhX/goMxw3kqPn4UQ0lLVoaRn4v41Yg/L6t0OP7EqP6scQsNPLS8RuAGtxgUqgQM
         Ysk+7eN622CsVYsV1lGonMifCY12QbB1y5hINwBtkLMa9IUxxctxllR/osKxmL7nvgQQ
         DJYI26Cvv5PWWczEeRgZ3adPPoJaA4+VxBx5S+mcwVqh7VxfAQ+hEAU/OR8mHjcMPnG1
         T5dg==
X-Forwarded-Encrypted: i=1; AFNElJ9bE/HuoXkD5FLIFpyoyRUZeRXtvoD0VMKnHmCk6R0CMWdR5LTochYTJ+4Z7yybtVvaPTN5WCZiw4sCOun7egWB@lists.infradead.org
X-Gm-Message-State: AOJu0YxhLbPK6dyNo+VodgbMjqfDSLzhgUFCdGYAMdZmRiaHbGUAzD1F
	hx4edoiQlP9u8p74KZoHLMbPK3Imu67759W4SrBfyujyzld5MpfQGJ8LCUhLfQK7nA==
X-Gm-Gg: Acq92OFOc0FfFtBawLYYUkAn+sR1xKQdqtel8i5qN6vJ6LjBRUNzPgCNvEMvUNUs1YN
	uDmgtQwdsNMlL0NOaCXhWGYCtGv/A3fcqXisGGmshx4HHdNZNrXFFP8ilXOvTzw5LRJOWqqGnuG
	89gjpkGFIWDhbbmfhPlfHbzwnxFyyE2qPAJzvFr195lpjtV09V1osNTDQWJBy/OtZb+ystBG1dk
	BJU/0Qypu0GxgFZ43yj/NUcFyPQsBvmGwIJQ6UqLtpe88BwoFDhFEIlVaMZx+O9fyTLp2LiO/71
	w/Damxszk3kTF3f9gUDeESEcSqfWL6ghgs5o7KvbXYRedocnwSwk7E+suYR/ToWEU5cGA9wCjf6
	R3B4VwQAMvdp7j99yxghZmcntKEWUuerBS6AJOuDQ+XwC6267zv/rdnX15dcTzgJqO2JkyD5qPc
	E3tF4qkdv1dmA2/++fHvaIg7c1OH7nvR/c8HLWUs5erNwuWhKMdALp3IxrKp6zoSS7oBwA
X-Received: by 2002:a17:902:ea03:b0:2bf:28d:87ad with SMTP id d9443c01a7336-2bf0bb751admr924255ad.0.1779964495169;
        Thu, 28 May 2026 03:34:55 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6e80246sm5742507b3a.12.2026.05.28.03.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:34:54 -0700 (PDT)
Date: Thu, 28 May 2026 10:34:42 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 02/11] iommu/arm-smmu-v3: Add a helper to drain cmd
 queues
Message-ID: <ahgaQm5y_9mISKg0@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-3-praan@google.com>
 <aheb/OLd9AQO6rD8@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aheb/OLd9AQO6rD8@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_033457_351566_55820AEF 
X-CRM114-Status: GOOD (  15.99  )
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

On Wed, May 27, 2026 at 06:35:56PM -0700, Nicolin Chen wrote:
> On Wed, May 27, 2026 at 10:13:58PM +0000, Pranjal Shrivastava wrote:
> > +static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)
> 
> So, this function has a very generic name for queues but its use
> case is limited to cmdq in a suspend context, and might not work
> for other queues.
> 
> I am adding another helper for in-flight evetq and priq:
>  - Drain a queue for a detaching master; other attached masters
>    might still advance the prod, so queue wouldn't be empty.
>  - evtq and priq sets wfe=false.
> 
> So, there is a naming conflict here.
> 
> Maybe:
>   arm_smmu_drain_queue_for_cmdq()
>   arm_smmu_drain_queue_for_iopf()
> ?

Ack. Sorry about that, the earlier versions were draining the other
queues too but that has changed from the last few versions.

I'm planning to rename it to arm_smmu_drain_cmdq(), sounds good?

Thanks,
Praan

