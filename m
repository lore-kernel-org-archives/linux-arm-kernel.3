Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ED5C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzkJ11PcuZctbuKF6H3B97Fb0rqT9GRSf4tUaQ3n42o=; b=yGyspldEcPr/nZ+GTdOc8zHyz2
	QUjoIYmKNID6n0vw1gE70onsHYznvHQrs7WNUSEGBehzAICJVHRwGD422YwY5waTPY1GkjPsTrKK3
	drvvPRRQwn1v3OvSDDwTvx58e+HWpmNQoTIb8msRLNCxSjBdIhAOkVZS1rrFUnNDOHbtr11trtHFs
	1oRBud8Rhom+dg96oTtn4UkrgpotUOX0j3fMNAyxsp/SgO5DdrISH3rAeGBcygBDtACBNsIaVaFp0
	vGtwX7GbWCnlIR0G20AoCTvA7uTrX0AOfK6gtlC+uKPfl4gecgXwtY0Tl9aeSzruvoieWGAxYpmb1
	Y9WiEWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsr9-0000000HB0z-0Ms0;
	Mon, 03 Aug 2026 13:37:27 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsr7-0000000HB0Y-1h37
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:37:26 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ccdf36f63dso145065ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 06:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785764244; x=1786369044; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pzkJ11PcuZctbuKF6H3B97Fb0rqT9GRSf4tUaQ3n42o=;
        b=Kr6UxRvXZK8bq36T0pGEWTPCkIQui2yTHg3Qux2ZBopQaIElh3+H6ubNP5V4If6dMI
         c4bwOFIZTZ71wD9rXb3HhCuP6rYz9SfjzZQMhjPyiCmZd7OkrVQCoNNLC+LqX2acLA1s
         Aq3cHeXjRucLk2bF31W5Kqg22OIp2cCH8ZKP/Gqhxn0YdU12Ln7YFftAzWFZs2E0NLD1
         syhqn4zVelx82DgvWp7AvSKR4s3HykP1pStIggzkxdyVMWWrW9SYjGFB/PQ8G+6711jr
         MBVj/Xv5NdgXFBjUaQLxLg36sCNrxoKjiFVZz9yYvZXdm2/M2+SokSDK6o7RFoU8LAOm
         uBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785764244; x=1786369044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzkJ11PcuZctbuKF6H3B97Fb0rqT9GRSf4tUaQ3n42o=;
        b=bcoUE4dbGEzmHLTD2FKhedEuAOhCImjAm3Ki7mnXX8MyUaphwXUwyo5ajbxU+Yfo0R
         ZxC2Br7dIINg7PxRROJMWwTCePtWD48mepFeDMeM5Lyfmzg1qyERqIce7WT1LqkZKrls
         5GBDxKyI8hFT/B3DkMVm/kqrm8l+YMuaNFWye6gaaq2cPm0i6ZaWabVait0URPJFKztf
         4oZ5noTWw3kIn5PCbRI0BeMIKa6BQVuTlla6UQ89vYRbi6GKiqhQ8V5zAvtpE/lvrlmQ
         uOcdXj8maJ921goaTadbw70JBKNOdARuq1lRby8ZV0k1xgJ5LErr7GFFQkxJf4vtnveP
         PwRw==
X-Forwarded-Encrypted: i=1; AHgh+RoARL4JzoS52+dMCAWNZV2eRiLw7nrXdRjIFYV3ViVbWToIuHKRqP2w12pR5Y0tt/OF/mb4opsVnvFuPCC4sDoz@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ3HbSdp1FkUDOudfT30PwLQu+AlUbwdyOWc3B6EHh1LUvNmrY
	bbGbcXHCvJuVqnmveSHBmECfUofDcDj9MYznpoyyxzyJ+i+t2411QSN4m1HsrjC9fg==
X-Gm-Gg: AR+sD11nbie1RfM7XINuHd8rMil2fO3Cg5AgyLMEd5eXuzVRt9HC3omuA4DCm+0Ot6R
	vMM0bsR5wxz48nIeo6H+Y9fq0ji2h44W+5AqnJpK+myZ9U8R0RhSo4T/qHxFZB4rtZI9mVUliqw
	O8icBEfT2VQy7SH/93kO9G/JtAptkqBP5SsEaqL9K1Azg3ykmgwKBXtwOrO5AgViEYofIsKRB6f
	LiqI1a2wMi90WELwwLG5LquQGFPre4E+OykPrj2dRk+yx1CnAXRUHR8UGIZk3sBNuEFOqAagCjn
	rKZavm43cLzJurjllBiszJ4jolqMrCMzsA3kG+vxuGOvABL873w+QuHS5Y8p0BxIolVlEbcTd/z
	8EepxCX+DvvUP4aBNdl/Bl4j6H6xDVaG+725Js3AdekXS/tNtrpwI/TfSEQldwnVZg3F3nZVMkm
	ZMBjcG4hkbBDaP7kspEQr5zw7upq6KvfWoC2rlPwM+L5XbIE4ziqio7nK5K3V5Wp3YOPsh1foOz
	LjVFKNtyxWGoGtKFFgmA54=
X-Received: by 2002:a17:902:d2c6:b0:2ca:be81:b469 with SMTP id d9443c01a7336-2d0545416f6mr12684095ad.0.1785764243858;
        Mon, 03 Aug 2026 06:37:23 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2e11478sm3955257a91.3.2026.08.03.06.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:37:23 -0700 (PDT)
Date: Mon, 3 Aug 2026 13:37:16 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, joro@8bytes.org,
	akpm@linux-foundation.org, cychu@google.com, hhchung@google.com,
	amitamishra@google.com, marscheng@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com
Subject: Re: [PATCH 1/2] iommu/arm-smmu-v3: Replace sort_nonatomic() with
 sort()
Message-ID: <anCZjMybqHA2n13e@google.com>
References: <20260730181216.2709088-1-visitorckw@gmail.com>
 <20260730181216.2709088-2-visitorckw@gmail.com>
 <am8MpGR14HAg58Gd@willie-the-truck>
 <am+CPy4+gcGPtR3G@nvidia.com>
 <00dae86e-cbc3-4d6e-966f-39afd4b8c2ec@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00dae86e-cbc3-4d6e-966f-39afd4b8c2ec@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_063725_447740_1540049E 
X-CRM114-Status: GOOD (  22.38  )
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

On Mon, Aug 03, 2026 at 01:35:52PM +0100, Robin Murphy wrote:
> On 02/08/2026 6:45 pm, Nicolin Chen wrote:
> > On Sun, Aug 02, 2026 at 10:23:48AM +0100, Will Deacon wrote:
> > > On Thu, Jul 30, 2026 at 06:12:15PM +0000, Kuan-Wei Chiu wrote:
> > > > @@ -4047,9 +4047,9 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
> > > >   	}
> > > >   	/* Put the ids into order for sorted to_merge/to_unref arrays */
> > > > -	sort_nonatomic(master->streams, master->num_streams,
> > > > -		       sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
> > > > -		       NULL);
> > > > +	sort(master->streams, master->num_streams,
> > > > +	     sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
> > > > +	     NULL);
> > > 
> > > Makes sense to me. Nicolin, did you choose the nonatomic version
> > > specifically?
> > 
> > It's probably rare to have a large multi-stream array, so I think
> > sort() would be fine.
> 
> Yeah, probably 99% of the time the size of this array will be 1. An
> exceptional value of "large" might be something like 64 for a massive
> (non-PCI) DMA engine with separate read and write IDs per channel for no
> good reason.
> 
> If and when someone ever were to report RCU stalls here then we can first
> ask them what the heck their client device is... and unless and until then I
> wouldn't think it's worth worrying about.
> 

+1. Agreed, it should be fine to use sort() here..

> Thanks,
> Robin.
> 

Thanks,
Praan

