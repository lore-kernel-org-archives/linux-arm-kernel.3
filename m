Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DD0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 22:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mw42W47cvCq48JjABnRIE5S9vXRaDxPhdeJG1XHceJQ=; b=jfqgV0wK2d/Vuc0dQ7PPA0O1xw
	W/LhTcbSsTyLYzF0ZOi0Q6Cv8Y7ROfY6imqt23b/4vAQOBjVDE2b3+atWq/6rSNo9F/Wn26YCz28Z
	0GrWkt7RdXkFMJvJtHLhgnroipCUc4qsjSLoHmeZM9RWjp79PUIDhJhKtKV41xsr6RDvXBZV+xrrA
	FC0kNiuufLQVtobgUrd3T6H+lfEDeH6jqp/9bQoLwoPVfWxAkTSN1F1ULAPJKyvrtE6YIUA29cXtl
	rVDlZMZT9ktG6LkRbOBzitTH3xIvDtMzLBNr3eO4E/d2oHXMzbGVC0pi8P6SPArqudPe0bqHtCWnl
	E9UkQqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2E1-00000007nLT-0w3y;
	Sun, 12 Jul 2026 22:00:37 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2Dx-00000007nKi-1iEn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 22:00:35 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-51c29b46382so15069961cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 15:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783893631; x=1784498431; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mw42W47cvCq48JjABnRIE5S9vXRaDxPhdeJG1XHceJQ=;
        b=T8hLfcnamW/moaJ8RbCchDRvPeC5tC+omAoYWmg36jwkPmvNU1WoyEjdDidQyX/fsG
         8h5WvEaqZXsQLMltlV3dUZAHOo9Mag+qcAuMOOz8/4ja2qbAmq5IL/NPTkI555AF5t7T
         rpPvA0/9YIlmCYiTLgLPKORDe3AAOWtOEsoVxWcKaecBUaxAWN4nNwQyrmQsovkNkEVO
         ybwdQS+Mm/FRlY94RU/+tY2VtZy7v570cqqzk/iyz3wIrllGzcChneNB8sbuMNj4PW22
         ZSmvA/L4WhUYJYoNmVPlxIiSsY9bXok80Tq+J6Arp6zSSXGg4DUPvlWMPSNrD5+NSE1O
         othw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783893631; x=1784498431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw42W47cvCq48JjABnRIE5S9vXRaDxPhdeJG1XHceJQ=;
        b=m91RSHpMgIbCI4AUpcfMwe/jddSzz5nHfVj61tKDhAW/rFtzb+ryOKoxwYmxkSHyJ3
         61iZv/3NnoO63tZMRnBpDYSeDYnE46/ii7YImihah+nIxXF9IqLgbozEiEi7Orawa1Yk
         dwgX6cRn1N2gRQTWVCHZlUTs4IvY6rJDBQSlUhXWP+66smFOJ7RzmLI/UOJHOwhPx8zs
         VJkmnVln4VDTANLd637jdS7+Rrxv+o9WIP3yowpc34iP0had0zsjSwDQy/ecqs1CbNwd
         oUsg7tOoEi+gHVeoSsxpvDPnY86YADZlVB1acctvtBII0ySeRTpiMW47Ky66lrpnNGK4
         GkpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzDdb2g2Pu5vMtiYAufHHaK37CbWNhr5tHC+0y6+qAONGpRt0ifNlRtvsK9G35Qzm53jsVhifS5iRoTkvVqZ8r@lists.infradead.org
X-Gm-Message-State: AOJu0YzSFRwAdYMaG0EVBYli/glWSuBPdokYGh7C/fnlZagyPnucs+vt
	TZsNq1bBjWfUbukieseOfhcE3jS2WHfR/s9I2gaCEGPrRQnEmu5NH0kk6mFYD5uali0=
X-Gm-Gg: AfdE7cnZCFCJ86R6KfxVbCmhQHHZPcXNrcAvAA2m1pyICCz0dS4hFnh326M/h+yf4o3
	0oZRl6JeaSloDrRuFbBaNHigjqcyUnrYEyblfRsEgoVJrdYbzrdKt6WRstYSLhgae7yaz1nEPKR
	skENU2iaLi8z4tL7rb029aAk+JimAmQ+bVYaUCez03KoZ1jpD768dYAfNPUwpuAiYdjus2tLspX
	RcXIkqrjqXW0rhjgFuKewH+/4gv2OLjB4EhZIvY9xavXxnBlzg6OwIap7Avy2tjb4KQ+wZE37Oj
	3itBUEdzBwJKvmyJTh2XrCvkiQvPfqthZupwh9oTqGfm8xuTLEmc39j0W9tUIq6a2VPXeJM5kSh
	Q76dXfLD9VQMqCAP3ax0IkDlsCgQDLVnU57kc2EOMK4c36XmajiVZTgJZI2O0
X-Received: by 2002:a05:622a:ce:b0:51c:8fb:fa54 with SMTP id d75a77b69052e-51cbf1f5fa9mr66777941cf.57.1783893631369;
        Sun, 12 Jul 2026 15:00:31 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caae2068asm68895591cf.17.2026.07.12.15.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:00:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wj2Dt-0000000BnC3-044j;
	Sun, 12 Jul 2026 19:00:29 -0300
Date: Sun, 12 Jul 2026 19:00:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com
Subject: Re: [PATCH 1/6] generic_pt: allow missing sw bit in DMA_INCOHERENT
 case
Message-ID: <20260712220029.GA1835788@ziepe.ca>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-1-80e10cdde2ea@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-1-80e10cdde2ea@reactivated.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_150033_547502_2B5102F9 
X-CRM114-Status: GOOD (  20.75  )
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

On Sun, Jul 12, 2026 at 10:18:51PM +0100, Daniel Drake wrote:
> When working with a iommu with PT_FEAT_DMA_INCOHERENT set, generic_pt
> will attempt to use a spare "SW" bit in the hardware page tables to
> denote when a thread has flushed the CPU cache after modifying an entry.
> 
> This means that other threads know that they are not working with
> cached/unflushed data, if they come across the same entry.
> 
> In the case where no SW bit is available, two things happen:
> 
> 1. __map_range() defensively flushes every time it reads the PT.
>    This ensures all data that may have just been manipulated by another
>    thread gets flushed and made iommu-visible immediately.
> 
> 2. An undefined reference to __pt_no_sw_bit() is created, causing a
>    linker error in order to alert the developer that they are going
>    to suffer a performance penalty in the previous point.

Ah, actually this is all setup like this because it doesn't have an
implementation for supporting no-SW bit versions right now. That a
mandatory flush happens is not something I thought about, my original
plan was to put the SW bit into the struct page memory instead and
have some extra barriers..

It would be better to not call the SW bit code at all if
PT_SW_BIT_NOT_PRESENT so we have a clear algorithm that explains how
it is intended to work (ie mandatory flush) in this case instead of
disabling the linker safety check of using SW bit without support

Jason

