Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7778AD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAfMjKf1n0EM57yS6vP5/PFm4GU7RlouzaAGnKGJjA4=; b=ZaIaTgiWWBw6Vdt/o2MXsYsOJR
	+d6n981raRKSWaEOtVZlm1OQscYgjaPG1VCF4wRPAPwXO1yW76SJWbEqKQ4r2zJURcwwCcSMdr/h5
	p2/FVDmU0FMcDkFlEI22FkafvIqCpc74k9mZvUPxI5dtDVJVykpVPJekEYKmMT5/fMZrnqIlCuclt
	N+XWLDZSgJWtniMGRGRVRaAMsr0r4k/ZoPkuWS+K6VkcvE4duKXwaJRvJ3OZf34Z5Arqrpc91szbB
	Sn1WeZZCg0mt6rqdEYfcNwgC+H/4iQVptt2OP7p8ERtOs2sct+h1vCehxtLrCrbldPoxBljN0FLCz
	oJQT3qdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1dt-00000000eQI-060F;
	Fri, 28 Nov 2025 16:48:21 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1dq-00000000ePh-2BuE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 16:48:19 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8b21fc25ae1so192235985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 08:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1764348497; x=1764953297; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BAfMjKf1n0EM57yS6vP5/PFm4GU7RlouzaAGnKGJjA4=;
        b=BZdY/d/x7n30+ViHtvFDbv8WFj4aK9r5hHrjbuvJe5KqYWdS0xNUU3lb21pM7lbltM
         kuqEzudQB1oXO3COF+j3eRHXFY+bLFaAah1krJ8eaVsrfQHsyO3ZeBxitOuDIARqCU6v
         RG828EtKy9qBPZ4HQssS3wIb00QskI6HuIkwEs8SbO2SoRcCBJ65GOWaT06t4p0CdN+7
         rMH5neWU8/YKATbvFtVAr2Y0U1m1MDA3y2FSGqv9/bzvPvctPwVEQO+tjRzdOO/1IfFM
         He86P/f6amb35ORPMAUDrqP1WQ+n34NtJ7xHe2vg4JOF81qjyspkifOtMOUz2IYGFegj
         qfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764348497; x=1764953297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAfMjKf1n0EM57yS6vP5/PFm4GU7RlouzaAGnKGJjA4=;
        b=fScDVsGXFYqcL5aglfCRJB+4PnZ1LWk7tF7LLqQpCI47AEoYjzvXJzgjJcQjpufF9D
         AY0Yoc/7/z5HRAZ+ts8l6BxLHwppTtth6mO4CqCpbq36hHOnLRLn0Xb5+6Ud55Rei9HH
         uEf8cVDJ9wfBGz6yI6fJ3K+IR6yDjhUinapxdRL/2WqreZAlNfB4UEQcbYABRDcy9Q8a
         aZoOCfHi7Y3ChQvp3HBhLiVXxPUBelKdtEdzrqsgQmaiPLb39rgGKK1ocNOS28ICg2m8
         n1D8LevWM5fELIP7eMYv9DDkBpsxOtSXshhO41mgxIP+7tcLfte9C0NT473oxPlcAAkU
         H56w==
X-Gm-Message-State: AOJu0YyQRXcfQQ0FlpVW0atR4m3ZYjo5MeRzY1vhliZLPrQRQRyN3Ubi
	NfuscUaQiK9kPg1t+1+gEE58myNmGTiCrc9oAF6ryckLuRsiz4knHqEyzM25LVAyiWs=
X-Gm-Gg: ASbGncsJmfRbFP9lnEzxD+wZbuzOWpxcHlEo0PUmFswi2FuIrT5+MoCvABYtmzDfnlq
	tCov8hKEwzdcEEU9adPg7DIOUNGZyFNezxrB6X+tfZ8qsSC2t/VOPv7rq3TFumowXEYpolQ+GUa
	SZwEFzarjUKugGDwEUCxDBNK6OjZFO/oQhG5sUZEGr3GTQnAdOjZWy3axikTfhQsQ6DXc/Gqm4g
	wfyGqS3GByojCVZtE/A3bIzw5vwBLmqqO6v6cjyNBrMj5pMXjIIjOwA9VAwcXGpT1ztLexJAYtc
	Weyf0/kXLaGegqtMxRy3swc/gH921rHl4lR6bVP4ZkEt4muipekxSJvA64e5Fmb2VYFbaWpxsf3
	OHqS6cNjtQYtz8DjY8VGi7Ehy8sbMgY9J+GvTInVJwGS2tExp7dFftDfntp3HkixotAXA0Z5OiT
	AKxyFA2iQ2OECBYgietXWe34arFrSmcLpMJCLdCNB8GxfjHQRlCK34Fbwx
X-Google-Smtp-Source: AGHT+IHQqaabicTwzKD3aV8B7vGpE1WoUx4p1TCHTluWfNaKtOTmIupEbWyDAmYJQk3capA2QEx8FQ==
X-Received: by 2002:a05:620a:4496:b0:8b2:76c6:a7ae with SMTP id af79cd13be357-8b4ebdb0ab9mr2073856685a.50.1764348497176;
        Fri, 28 Nov 2025 08:48:17 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b5299a5f1dsm335208785a.13.2025.11.28.08.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:48:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vP1do-00000003PwW-0xng;
	Fri, 28 Nov 2025 12:48:16 -0400
Date: Fri, 28 Nov 2025 12:48:16 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 07/27] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <20251128164816.GC812105@ziepe.ca>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-8-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117184815.1027271-8-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_084818_563121_4A6AA03E 
X-CRM114-Status: GOOD (  11.00  )
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

On Mon, Nov 17, 2025 at 06:47:54PM +0000, Mostafa Saleh wrote:
> Move parsing of IDRs to functions so that it can be re-used
> from the hypervisor.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 112 +++-----------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 111 +++++++++++++++++++
>  2 files changed, 126 insertions(+), 97 deletions(-)

I don't see that this slow path stuff needs to be inlined?

+10 to my prior remark to not dump all the huge inlines in the main
header.

Jason

