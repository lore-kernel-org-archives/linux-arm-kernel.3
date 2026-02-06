Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDB6ECD9BE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 03:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTLlWgup/boAOL11HN9YevGJP11uRzIBi2lM6iUJUmI=; b=OroBezNNe4MGGBDc8BwYNRubSj
	kxV6K4WkpUyTyH8iedYuybQhH1+psByNC4M8aLUG5GpmOe+27LsrM30aPmL6zIkGadtK/8azoPSzC
	FXOB+l7gQSsC1L3lpToQA4Pn2w9yX8ZpmUhQ94c0OVF+gyWy5PVLbFGxnORwYrmljRVjQ+a73zJzf
	juNX2DF2XG3m+g+Ma8ci1h4rOLnX33waThXm8Gm9tNbUpzAFHLHGmAYxm8RFMuwNuELbWc9/SCcim
	nwkn5WETnGvBeLBpWA/aEiDxDHDE05HTPNqSdlI2yi7HMtQiV3EVFJ6KvrCQbY0i8LTZcr/WOhRCi
	XFL/gwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voCBw-0000000An7V-02ug;
	Fri, 06 Feb 2026 03:07:32 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voCBr-0000000An6x-0IEU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 03:07:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a90055b9e9so8204185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 19:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770347245; x=1770952045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTLlWgup/boAOL11HN9YevGJP11uRzIBi2lM6iUJUmI=;
        b=buQs307Xf665mZwKfem6dYbAKv2VL0FpXx3t32A8Lmb5/s9CAp8vsjmQEFxIP9pSzE
         wNKuC/CpSFJZPMyAYD6gCNBL/XQ6ZWphLmHhzaeg4mVBPr4zOVdnv+1ezEJ4qdn8kIt7
         djIQCiGAjonFwdpFED5yeyErqeaqyt+h3LrznBzlfYov1JGG+zjrMTa5xE5i6zvW38gM
         a08vi3rshkur+Io7YZcw44rMhQY9S1O8NdiOf8TAznyc+ounoxjOSwPYc4NeQOGUDmQW
         hthIPy+lw7LnWAzcnpw8lA7lOpXpU32i0AKLxq/EzNL0mtpThWQ7Fm0+fFKOnhfJZJOV
         72uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770347245; x=1770952045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTLlWgup/boAOL11HN9YevGJP11uRzIBi2lM6iUJUmI=;
        b=MLRCU6f2pAWizZoULDnE4PT3Q0f4AuenRk5f0PXdUOgdVU8buHqHAsUsE/nB1yDxm9
         5aNL4Ttwp2biZOJeQEYI4KeaXCbyEDm/ls1Wh5stChmmLvGkeBq21jdZhp4v9CeQCvck
         F/xRb0rrMUwrKWL4rYoIvrZdv6lGFxIv/PH81+lEUTrMaqYVW7HyXu+j+bz5Gu9fvGbW
         cS6R5EPzmng2S9cu5zkDz0mHqP1e2BmXJIjRWApRgUhh8ZEdgKsYzT1Dv0k0Ljzd9yLm
         2JXpJyYeO1UId6LBMVHHhICBNOsK6c+p0NWPQlIn3+goqaecSd5OW+6BGWyh2+nOPP2k
         EZGA==
X-Forwarded-Encrypted: i=1; AJvYcCWLZ4AXIAWFhazqzVpI2MF+AOKrjnu7/YWnydnTP1u2SITARgTbo1zrbjdiQ3RjYMIfNjL6Ir0s1sAPSToxQZ8d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx33YFnt/vXVrXFXXT6kupIBAqGt17iOUofcb6FiLMYHUcgwjiE
	LauMvvOEPV2+u+eYIilf9uoyMBJF27eBGkAjJpEWi1e9dXGIn+OVKQ0v
X-Gm-Gg: AZuq6aLpcmvQxO8OdxPNyNhngixVl4oLzk770/cbNAZyQkzAO1Qv1BWrOsQWXsI+IRh
	jqW+dbVV8LuNNg5TIQtKU3VIPcCIUpOUrr7fwXQ6SXLjIVF4ax2xjZNzUAAN/hYrvy6kOpSZoFW
	A0ZHmTLr1xX2AyBNmriASTIx0n8mmxQuP6C/GwBbCRfkJdnvSXhGSUyZ99wv7G/Wk2auTX+x5rj
	DWL/BsOoCJ3aHRJ5P3IAoKVH+uge27VUc+7kvDU77f8yqc0D+LJbsRunyGUorngqi0Z5VUYTm6J
	jjfup0mqHTm1CayfCYYNYNwXkSh9tOmPdowkMLsUwWQY3GFY67RI3y/NmELyq1ti+K+xHPE29ES
	0V8J2H8SRYWki+dutXzKoIvAjgNQZiZ9sdHvi+HY1yCk5FBeRKcE4iIgMAtSCFKJkIb0+k0Gre6
	PXBfuYcZLN9C4PSqdC8gpJgzlCHiUZJh/FK4P/A/HMev4=
X-Received: by 2002:a17:902:db08:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2a9521689bbmr13706725ad.27.1770347245440;
        Thu, 05 Feb 2026 19:07:25 -0800 (PST)
Received: from localhost ([101.44.82.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b9bebsm7512525ad.56.2026.02.05.19.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 19:07:25 -0800 (PST)
Date: Fri, 6 Feb 2026 11:06:57 +0800
From: DaiZhiyuan <jerry.zhiyuan.dai@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Zhiyuan Dai <daizhiyuan@phytium.com.cn>, will@kernel.org,
 joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Restrict MMU-700 errata 2268618 and
 2812531 to affected
Message-ID: <20260206110657.000043f7@gmail.com>
In-Reply-To: <3f22f7b8-449c-40d9-b4c8-fff3e520d563@arm.com>
References: <20260205093356.4328-1-daizhiyuan@phytium.com.cn>
	<3f22f7b8-449c-40d9-b4c8-fff3e520d563@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_190727_141139_A294CA36 
X-CRM114-Status: GOOD (  31.10  )
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

On Thu, 5 Feb 2026 13:05:24 +0000
Robin Murphy <robin.murphy@arm.com> wrote:

> On 05/02/2026 9:33 am, Zhiyuan Dai wrote:
> > According to SDEN-1786925, Arm errata 2268618 and 2812531 are
> > present in r0p0, r0p1, and r1p0, and fixed in r1p1.  
> 
> This is a bit fiddly, since these workarounds also overlap some other 
> errata that IIRC were *not* fixed in r1p1 - it's been on my to-do
> list to figure this out for a while now, sorry I haven't had a chance
> to get to it.

While checking the documentation, I noticed that in SDEN-1786925, 
document version 19.0 describes the errata as fixed in r1p1.

> 
> > Introduce this patch to avoid performance degradation caused by
> > restricting features on unaffected revisions.  
> 
> I'm curious, can you clarify the performance impact? At the time I
> was pretty sure that the ARM_SMMU_OPT_CMDQ_FORCE_SYNC was just for
> safety and never likely to be hit in practice, since with range
> invalidations any unmap should never end up with anywhere near 16
> TLBIs in a single batch anyway. Is that no longer the case?
> 

Based on the mailing list, the SMMUv3 implementation now fully supports 
the Broadcast TLB Maintenance (BTM) feature as part of the Distributed 
Virtual Memory (DVM) protocol. This allows CPU TLB invalidation instructions 
to be received by the SMMUv3, which is highly beneficial when the SMMUv3 
shares page tables with the CPU (e.g., in Guest SVA use cases).

Additionally, while this aligns with the SDEN documentation, 
please note that we do not have actual benchmark data at this time.

> > Signed-off-by: Zhiyuan Dai <daizhiyuan@phytium.com.cn>
> > ---
> >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 12 +++++++-----
> >   1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c index
> > d16d35c78c06..7eadb27eb9be 100644 ---
> > a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c +++
> > b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c @@ -4272,11 +4272,13
> > @@ static void arm_smmu_device_iidr_probe(struct arm_smmu_device
> > *smmu) smmu->features &= ~ARM_SMMU_FEAT_NESTING; break;
> >   		case IIDR_PRODUCTID_ARM_MMU_700:
> > -			/* Arm erratum 2812531 */
> > -			smmu->features &= ~ARM_SMMU_FEAT_BTM;
> > -			smmu->options |=
> > ARM_SMMU_OPT_CMDQ_FORCE_SYNC;
> > -			/* Arm errata 2268618, 2812531 */
> > -			smmu->features &= ~ARM_SMMU_FEAT_NESTING;
> > +			if (variant <= 1 && revision < 0) {  
> 
> revision is unsigned, it cannot be < 0. This just breaks the
> workarounds entirely.
> 

Logic error: if (variant <= 1 && revision < 0) should be updated to revision < 1.


> Thanks,
> Robin.
> 
> > +				/* Arm erratum 2812531 */
> > +				smmu->features &=
> > ~ARM_SMMU_FEAT_BTM;
> > +				smmu->options |=
> > ARM_SMMU_OPT_CMDQ_FORCE_SYNC;
> > +				/* Arm errata 2268618, 2812531 */
> > +				smmu->features &=
> > ~ARM_SMMU_FEAT_NESTING;
> > +			}
> >   			break;
> >   		}
> >   		break;  
> 
> 

Best regards,

JerryDai.

