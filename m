Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BD4CC6B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Kz+IQfSF4Bo0R4irbQAkdmm6GDBbYpLf1oqZAlKJ38=; b=EDWs2t2BaVZtNcylJbvePeNT4b
	DH4OEVGEoNBPFEMKb9+9Ah9jZ2gKtfFel8xZuTjhL8f9BYFMfGMI6asMLZJk76HgvDDkFDuBE6Z7J
	bZsT7z1WPer7Yl0qAs8MQObQPxIl3Ebly2L8tpfBl3QcWgaZ376nXSZLJgImQLLrW/ovIqtbHuQO2
	rcSKon59lIOUEpFVPgGaHMOQZsYna8EhMvRefcBKQ1/WNqn+qRTdmFzw/APxNsRTZZSGcomxiQJmI
	Nx/ylSXFFTXxewTjJ3lyR++J28RdO+CBjjNHXUEPYTXxcZQqJiglBYix0qisvH5rT+5HyYDa0+fxd
	IDkI/sLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeDY-0000000DF3A-47aJ;
	Tue, 13 Oct 2026 15:15:04 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeDV-0000000DF1I-3In4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:15:03 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-53397554beaso33825481cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791904500; x=1792509300; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Kz+IQfSF4Bo0R4irbQAkdmm6GDBbYpLf1oqZAlKJ38=;
        b=gxpL5/rnyuxqDlC/vLOH1st6ROqTjVK2ZGsToULpZPsVKDlswU/D9+xOpi1/P9STdu
         VU/S52FSnnPtQHXt/d6HGPYvZYIjKtApWrJZze+ZOiajh2ZYwAcAa8A+odqtPOMiV7/F
         66MHlnybpMNwzO12o1ey1vJAPdayiM0mhvOY+t43VBB3144QTxiBsPtjEX11XR4zazpO
         GYKBcnBLaTbQeJI8yamV074qvORigG/HYOt8iYVrbuvOFz/Y/vB0iAH6WalOtaQzfHGu
         0Ij5AMe9yw6yEAPUhpkzCbgu95fOTZxT3DS68s4ArOyvgfwzpfiZEnI8p9Qv1ZRyGDH4
         IzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904500; x=1792509300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Kz+IQfSF4Bo0R4irbQAkdmm6GDBbYpLf1oqZAlKJ38=;
        b=FS5owQ5jRwz285Q4D2hFgx1Q6DzL5y7jvvU2NZWPH+KmQ8161J13/sJiWRkyPtC57e
         HYON7QeFDhBzhEiRk6ceHC71Rp6Ywxyowqyh/I7TVe2Uj799Y7tdtAs284fXHvKucUP4
         psR8oxXskTjT3VlmG9FGx/ca2Z9rfAgrqkWDR0RDUwYH2jfQXu3n9Bx/uYHUcLdk01kj
         CAOH1i62zAGnsE6JHUWZM4NH2IYhbxczikEA7+uT3EOpNzwONzGxDkoydVahzGD55G6x
         csygCdGTSzrJga5+w/HsHV/YvUJ79yr6r5jhHipGxBBjB/7/1i6JBAHoMUz8iu/fRNc2
         +d3w==
X-Forwarded-Encrypted: i=1; AKwUvByl4kNplqXz1345UYN5Iz/UGRp5eOaebySd0v5xO1ge6M69Wjz6x5BmPQ4wHqKsj1v9W8TN1F6K0Y1LbbcVDGXt@lists.infradead.org
X-Gm-Message-State: AFq9FYJd7u0sAKH+qzxYiWR2Lao5NHxsfnuhN5q1Gu3EmxlgcyT2R97Y
	IKjrxNV4ZVse2YIP6/C5S54CXxUJcJog+/hfjtDUO9pcGEjQAy870tiy418jrmRrQdM=
X-Gm-Gg: AYBFou2dESUDgQCQOw+vTQyKKZpcPVUcxTtpWeORm5jNgYSPb3Qbbsf5OXqn27n0are
	4b55NeB9zldHm2lOGbP3Y2OUekWbvo9BgA18nughJJsohwOMOyocbxbD3gmaLTQLhsGJJtCL2PQ
	uU6XRFfsvN49qjyZLCx5HK6LIkrsyAYsoZA+jD28RwS6CA01nK2NxM9KKEaOD98Zg1zL9Hgb9hl
	R5zNtiDJzvTaGqWDQhP/1qjmnVHDYVuydpXaXCkGPwOpH89ObUAeOQ7Plg1YFZfxGo7XYaWP1HE
	UrK54qk7MyXKX/780+qjyv+eCPDvpvSnat3RU+3IRizc3n/FRjvdthq7fKp678upF/h8EZnmxgj
	0zGpnsdGHQf7kZeZV35blQYKkKTcY7f8X0vCkZWRNbjzBiEj27AIpQD2ZtUTDFpl0JMUm0utQex
	QPU46aqERweBRc02RVAMIR4vJH13+fib3o0dZIgik/tTMDj1KyPgFri+d7bVRVA5xgM8obmF3mf
	li4rKGpXEp8M9u+jWaH+qHihUX0jLB9aNTtatWQxS3UR+x08jKnOO79um0HEbzp0OI=
X-Received: by 2002:a05:622a:e4d5:20b0:535:a5f9:752c with SMTP id d75a77b69052e-535a5f97acemr137130051cf.75.1791904499634;
        Tue, 13 Oct 2026 08:14:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7e32cesm100542321cf.28.2026.10.13.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:14:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGeDS-00000009ss0-0PwU;
	Tue, 13 Oct 2026 12:14:58 -0300
Date: Tue, 13 Oct 2026 12:14:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>,
	Will Deacon <will@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v6 5/5] iommu/arm-smmu-v3: Wire up shared-SID STE
 ordering and feature gating
Message-ID: <20261013151458.GL14213@ziepe.ca>
References: <20261011-smmu-shared-sid-v6-0-cb76b89dc612@nxp.com>
 <20261011-smmu-shared-sid-v6-5-cb76b89dc612@nxp.com>
 <aszfVNP6DGzWYdK0@shlinux89>
 <as1zR1wc7ERxvR1F@nvidia.com>
 <e8c22eb2-ed1f-47c7-b2ac-c56ead1cba8b@arm.com>
 <20261013124400.GI14213@ziepe.ca>
 <as5ERENDfgC6FB0b@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5ERENDfgC6FB0b@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081502_045063_5C30D812 
X-CRM114-Status: GOOD (  31.49  )
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

On Tue, Oct 13, 2026 at 10:46:28PM +0800, Peng Fan wrote:
> Hi Nicolin, Robin, Jason
> 
> On Tue, Oct 13, 2026 at 09:44:00AM -0300, Jason Gunthorpe wrote:
> >On Tue, Oct 13, 2026 at 12:22:06PM +0100, Robin Murphy wrote:
> >> If we're not going to support PASID for shared streams (which I suggest we
> >> don't...) than we shouldn't strictly need to worry about CD tables anyway.
> >> So rather than having to special-case CD table sharing for shared streams,
> >> perhaps it might make sense to generalise back to a "default" per-domain CD
> >> for non-PASID use, which can then get switched for the private per-stream
> >> cd_table if and when a device does enable PASID?
> >
> >If we have stared STEs then the group becomes the per-STE data
> >structure not the master.. We don't have any way right now to do that,
> >but it would make some sense for the group to store the shared CD
> 
> Thanks for the detailed feedback, reply you all here.
> 
> For the CD table question: since shared-SID masters are in the same
> group and always use the same domain, the CD content is identical.
> With skip_shared_ste(), only stream->master's STE (and thus its
> cd_table) is active in hardware.  The other masters' cd_tables are
> allocated but never referenced by the STE.
> 
> I see two options:
> 
> A) Keep skip_shared_ste() and add arm_smmu_cd_owner() to redirect
>    all cd_table operations to stream->master. This is a minimal
>    change that works for our use case (platform devices, no PASID,
>    no domain switching).
> 
> B) Drop skip_shared_ste() entirely and share the CD table at the
>    group or domain level. This is cleaner but a larger change.
> 
> I'm leaning towards (A) for now to keep the series focused on the
> simple shared-SID case.  Would that be acceptable, or do you prefer
> we go with (B) from the start?

I think the skip is in the wrong place perhaps?

The group is always guarenteed to have all the masters in it.

So we could split them into primary masters and secondary ones. The
secondary ones are all the devices thare share SIDs with the primary.

The group list is guarenteed to have all masters in it, so we can
simply fully skip attach from the secondary. It is guarenteed by the
group that a primary will have already attached to the STE with
exactly the same domain so the secondary just needs to do NOP.

If you do that then all these questions go away since there is only
ever one thing writing the STE, it is always stable and no issue.

This does leave a problem for master remove to switch the STE to one
of the secondaries, but that sounds like it could be managed through
the release domain mechanism, just nominate a secondary to be primary
and execute an attach on it in the normal way. The hitless STE
mechanism will make it work safely.

Jason

