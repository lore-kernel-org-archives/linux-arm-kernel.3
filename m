Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E79EC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yr/D5ign98BDVCdT+Rpq/9PzvrLTk3CogAV4Kz2hZf8=; b=KARirqiAdt1EE8O2eGltXUe92T
	/ZfooTgteyS1ni8hRByq0+ha3n4c1yiu63+TwO/EuzbUl1MW6BxNEIIMvvXDAHVujqo27InO1v7qy
	Gtpvls/0F68Sc50TWboQqaf9KhiTd5QOwDsIPOPr7Ocq+Y5I+2UtbIy2+4+P2XW8tgWHdOxAjq00L
	qO2uEhv4hPIORuvfbwG+ADabHmVETfxZluKYRVZGhVqdSs2DNFk0iXF7zDx94opwyUBiilkhR05g/
	563rRbwCdnhRXJ+yrTTiLdKwE+FacHxwIFqz0dVrkFkqCB2z+JqCftt9x6/qEwR2snZU//DGBfTko
	76gEijWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv5s-00000001EPT-0lJG;
	Tue, 25 Aug 2026 17:37:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv5q-00000001EP7-0OPc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:37:51 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cede6375caso10635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787679469; x=1788284269; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yr/D5ign98BDVCdT+Rpq/9PzvrLTk3CogAV4Kz2hZf8=;
        b=BXRJER+SDsZ+VzrQhLPiHq+cL4AJ9qNR1wMK3Ihir2vOHQcz87sndrFS2W+/y6hh4M
         PolZe1U9V91JZu2Zqnfh2l1urHnCV42Bf2Co8lYZ2iiBWxnXzoyFm2lMsKw5TfrFlvmP
         GrUPrrC+w2GAlQX5Qi9zsmflrQvxx1gMjiLuHpvYXT1JH6fSpfVOZDl4QMPAHTzvAsHK
         1enlojn4qGl34AQKOJoNQwgMsNsl+OrLJtu64X3xzRwMB/6pmCjfCHjzGSgwqwY5iy3S
         IaCUiU7d28Ci0AmiUcM0kXMLGj/ZvWZdvNss5mnwK42kU8MKIWVEC4giZrnt3Jsay5i5
         BFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787679469; x=1788284269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yr/D5ign98BDVCdT+Rpq/9PzvrLTk3CogAV4Kz2hZf8=;
        b=LAPGjOtuNwg/VjLPjbwvnekxeiOiPcKNy3K/X3JfeMeWCsGOz3okFUq9mWPn6V3SYy
         XRC8w3cHTXuvvo2qmzlGekb2tj7+EmrYSji5qrNLzFdcyJEr9I+4h4RNWUORvXFvwvY9
         ORKhI3kfYv1gtiXsz6/305FCvM85BZpeHR2+FOkDQGcef2mUFdiruEOCDDwIY/ZL8WjZ
         5qb7uyGnhHmrOgJ6cJD+wp4CnDg1XO2Ht2X7A13dTI/nZRq3hTvIcRTybadEXnZ7Z2n7
         VZFmdHDZPeO0nXizhA6XR8hyTmSaQomLX5EYC35SrEFkVI9xWoO295I6IVRVytafZIXo
         M8eQ==
X-Forwarded-Encrypted: i=1; AHgh+RppyDUN/oDyK5ukDwgj3ZaoRlZmN2S3tklKFAlA+ywTuzicBbZadkKu6IWRYxPe+ryB7IdgaCT+Tr4ChheOtRtM@lists.infradead.org
X-Gm-Message-State: AFuF++nxj9cdwxszjaR7ChB2FJzgoXvmUBZAyacJaNfEyUZs/ZbTwawJ
	6Fv4HhPx71yHuipOp/wywMgIFFvvctwVnLQckwjmIWhdmXH3/bbrTm23nz0Vabb9aA==
X-Gm-Gg: AR+sD12e3t/xra/GOicJm7kMrh1/yMw76Q58eCWz7Keq4aa+2LKWZCurKD4SB80fR5j
	/anOVE8dTcEHEu9Lh42Oud6syIswZy3JnnN/VEh8EWcwS0g+UIseB3tJMvbY9t2wscOvr3eAH/7
	UJroM9yu2ybY+ACTyUci+woqIsypKARZvM0rXUfpFCmnKUl71YcAOOnsNKYiZCXh1emXwvn/Tdi
	B04wyrKXE+lWwUAlw4W+8eW1cwRAq4Ebm1FojEn4VjH5Q/xDpHqlH9xAV5DKwy25xeIkpXhmvXK
	9TYYyZAel/YrebpNwHvG+bmtiw01sdicY4I6ji24xIUKkdh00ffpd/W7+5d7ybA+lmHIg5ijwP6
	yDAtMccncm1CE0QBd9su1FPgLN1GUgiUzaHZBfdv6U2MAAOS83rIxK7n7ICb1x+78QRIm90cIQs
	vD2ZZ2+y6VeR/xQ7W3+x8zkv2axBDqNDpxGHh3OlWA/ORkFRpgH098IZsN+AKZggRL+vWhcqEEl
	u+Gg5Izyls87mh/TXpMIRkdNw==
X-Received: by 2002:a17:903:3c4c:b0:2d5:db3d:1a43 with SMTP id d9443c01a7336-2d6e07a75e5mr8544665ad.16.1787679468673;
        Tue, 25 Aug 2026 10:37:48 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704bfc5aasm970305ad.61.2026.08.25.10.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 10:37:48 -0700 (PDT)
Date: Tue, 25 Aug 2026 17:37:42 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 02/12] iommu/arm-smmu-v3: Add a helper to drain cmd
 queues
Message-ID: <ao3S5ickm47p1QWa@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-3-praan@google.com>
 <178767577112.3356902.15184998673790345568.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178767577112.3356902.15184998673790345568.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_103750_141135_E543DEE8 
X-CRM114-Status: GOOD (  21.38  )
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

On Tue, Aug 25, 2026 at 01:36:11PM -0300, Jason Gunthorpe wrote:
> > [ ... 36 lines skipped ... ]
> > +		if (queue_empty(llq))
> 
>  [Severity: High]
>  Does polling for an empty CMDQ actually guarantee that commands have completed?
> 
>  queue_empty() relies on the SMMU consumer register equaling the producer
>  pointer. However, for CMD_SYNC, the SMMU advances the consumer register
>  immediately upon consumption, not upon completion. Suspending the SMMU while
>  commands like ATC_INV are still in-flight could abort them, leaving stale
>  translations in the device ATC and causing submitters to time out.
> 
> This seems broadly wrong, but it doesn't seem explained very well,
> maybe put a comment above the function something like
> 
>  The caller must have ensured that no concurrent command submission
>  can happen. Thus the entry at the PROD must be a CMD_SYNC due to how
>  all submitters generate commands. Waiting for PROD==CONS guarentees
>  completion of the sync and all prior work and thus idle HW.
> 
> I don't think the other substantive remarks are valid.
> 
> The Werror thing is right, every patch should compile alone without
> warnings. Sometimes people add __maybe_unused to accomplish this..
>

Ack. I plan to add __maybe_unused here.

> > [ ... 19 lines skipped ... ]
>  [Severity: High]
>  Does this logic miss commands routed to secondary queues?
> 
>  The driver supports routing commands, specifically ATC_INV, to secondary
>  queues (like the Tegra241 CMDQV virtual queues) via get_secondary_cmdq().
>  By strictly hardcoding the poll to smmu->cmdq.q, we ignore secondary queues.
>  If the SMMU suspends while ATC_INV commands are processing there, they could
>  be dropped.
> 
> Yes, I think the ordering is wrong, to keep them as different patches
> 
> iommu/tegra241-cmdqv: Add a helper to drain VCMDQs
> 
> Should come first, adding the op callback, then this patch would have
> the hunk completing the function so the newly introduced function
> works completely.
> 

Ack, I'll re-order the patches.

> Otherwise the approach looks OK to me
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks,
Praan

