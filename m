Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C52CCD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 00:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tFoYpzfMUAkB3JpfkER88CdCEd7iFUbwdJ47mVqnAQ=; b=1Ppb+AijxpTx4g7IoSGF1OLgAX
	wDPC8ckXMZ5CVuS755fGa31uQV5bH/0hUc2g/t8CqQwnB4iTJNUOeTlEwVkHXQYaR/Lr1Roh6iMwo
	ENlJZG9TgpGD3TeNKCkAGa9mxLOOf6CugkoB2/M6C7u8ex05W2HDmxZ/Bw60x55ljc+HLFKbh1XVV
	w9Cip+t5z64ylWAdlgCVMdH0TVpPGKPGZp5bN0ehsrQDb3ZoSLgRaJ37mR49kQ7OclwYtIWERVc8Y
	vQiEhIG8JLzkrqvXN//zRWE436PL6uZZY0/Hen5bS5ud7Y7kmuGcGBBfSfm/sH+OChJbBmmOsicjx
	WT8QjDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlZc-00000006amx-3ssc;
	Fri, 29 May 2026 00:59:40 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlZa-00000006ama-2ctn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 00:59:40 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-913cc4d7c71so1464623085a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780016377; x=1780621177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2tFoYpzfMUAkB3JpfkER88CdCEd7iFUbwdJ47mVqnAQ=;
        b=EPgzErf4bHrKLEFXBz6sRbzVXMp5V9bNEJtp1chwN0lUUViHGbHCeD1jAE33Lt1lVf
         qVCR8g+hHA8hcZuQieuDLhBzmwn9G3QVl59cbZsIMTUnp6DEUuNlnnXtNJT/6zozfTc9
         FvzF0t8Qup1B2s72vjy9QLmRzCcKkAi3tXaUxkaFDpPZfv7OeQgrLauUjG/Qj2rG/eI0
         vZrZeCZ0mSynaqpJKuCUfbtgkoicfkuc3YPv5osT4n45WfBXulEwfxH+xCATLznepymY
         ZhkoJCwdmkPAslfry7srpGTuQMKxHMpXpBE3Sn3UojXRelEfDTPUITThxqNHpAqCsM7c
         A85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016377; x=1780621177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tFoYpzfMUAkB3JpfkER88CdCEd7iFUbwdJ47mVqnAQ=;
        b=Py0hATFjDl6PPX/kZqc/hi/0lD8UgAARHN4tfRUArYI7tQIKBnYb/0KOppktS+Fno2
         SOi0HNdTQf7NQ4YVriXJUCzOMKntRYDWMitplS/jLc6hB6X6tqXbcGZ1kuMTy+46m4jd
         1KiuZhYBFA+es5PieIgWgpoaMVrGrSIi3W1lAnAGcpt1dNDEnVutpB0DRvFFs0OyAK+e
         yayTmmZ7etATyoXX5P41XbUCoYVN51/hRK/ub7IRJTZJBEqnt7CeylBUOsp6JW/vBQcg
         Fxzp5yxHATEwBV82A/Y7/gFYtfIMsRwE3j2tOaRZh7o9gbc7XG5Z/SsN6W+y1EmIp3NX
         iIdA==
X-Forwarded-Encrypted: i=1; AFNElJ/ohi2hos2oct1aJc4eAzxqokpJiX3hOhaR+B2W9AqCZ8Oyy2kRgldLnqU8JVjETFBjfop4gXFnhZEZA0/Wiwfq@lists.infradead.org
X-Gm-Message-State: AOJu0YzV+Dz0xOOQDdOr86plmDUVg+xzrJ0euvN8FYqHzvcrVXQHMc/H
	OGX7ZuczFrMCK6gAxbjl/6b6xPZmT/AjOAciMfQ9zruxcW1XVGp2oKkCwb4DOUroWGJjMOkpbGO
	wcMq1
X-Gm-Gg: Acq92OFV0HbQeN10to+7bw8E4NfxmKvlWCgfMxYwVED2FI9NZ4MIJWcKioklg6gDPGs
	HohcNPjn8EnfzGPJaHYUp7gJixdVrb2LUASaDNga8bBuwU6az/+kImTaLVpyJzVIk1XQ3SLY23N
	JVo1wfVxs5yRNII3GGPARFs1B8WBnvFonCxCKLpenJOsD4oKyO+DLzr0JvUZ3zheCc2m8gopSE8
	6qKsRAor1co8AwSdnhwu6dFpOkCsajIhxQDTz3qefbxji8v6fZR8jrqKN05kTd6Mh6QSVyJosP4
	4FKomLQ5f2bKHKZhkpJX9z5nNV5TGpq5hXQKvVWgQZp8XhEzogKvyasvF1rWoUqHGySWnOk4CDi
	OpAeJ5kighxpaQmhskqfqWKGg/bhqQ1oWRyp0rvfxdCu+I5NPlkeizcFmnnzT0oxw8U+uAiDqrv
	354J2xiq+ijpe5Nv88irm2CajPLCHXIsiw11/djQqrI+Wo5AAQ2MeMQ4GQVUYSUCWfhiLzSQEb/
	69uyC51Mqe8Nxpp
X-Received: by 2002:a05:620a:6cc6:b0:914:aa0d:aa87 with SMTP id af79cd13be357-9152fd2d425mr108562785a.23.1780016376749;
        Thu, 28 May 2026 17:59:36 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91530135f92sm52883085a.47.2026.05.28.17.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 17:59:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wSlZV-0000000HBjx-3ea1;
	Thu, 28 May 2026 21:59:33 -0300
Date: Thu, 28 May 2026 21:59:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Issue CFGI/TLBI twice on Tegra264
Message-ID: <20260529005933.GQ2487554@ziepe.ca>
References: <20260528101617.4068249-1-amhetre@nvidia.com>
 <20260528101617.4068249-3-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528101617.4068249-3-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_175938_827410_78D75042 
X-CRM114-Status: GOOD (  17.33  )
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

On Thu, May 28, 2026 at 10:16:17AM +0000, Ashish Mhetre wrote:
> Apply the workaround for Tegra264 erratum by issuing every CFGI/TLBI
> command twice on affected SMMU instances, with CMD_SYNC after each.
> The erratum requires this exact sequencing:
> 
>     TLBI/CFGI ... CMD_SYNC TLBI/CFGI ... CMD_SYNC
> 
> To get this sequence with minimal surgery, hook the workaround into
> arm_smmu_cmdq_issue_cmdlist(). Rename the original function to
> __arm_smmu_cmdq_issue_cmdlist() and add a thin wrapper that, on
> affected SMMUs and when @sync is true, re-issues the same cmdlist a
> second time.
> 
> A new arm_smmu_cmd_needs_tlbi_twice() helper classifies which opcodes
> need the doubling: CFGI_* and TLBI_*.
> 
> For batches that exceed CMDQ_BATCH_ENTRIES commands,
> arm_smmu_cmdq_batch_add_cmd_p() normally flushes the full buffer with
> sync=false, deferring the SYNC to the eventual batch_submit(). On
> affected SMMUs this would leave the first chunk's commands issued
> only once, since the WAR hook in arm_smmu_cmdq_issue_cmdlist() only
> fires on synced submissions. Force a SYNC on the capacity rollover
> when the buffer carries CFGI/TLBI commands so every flushed chunk is
> correctly doubled.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 66 +++++++++++++++++++--
>  1 file changed, 61 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

