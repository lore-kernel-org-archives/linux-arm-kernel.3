Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CB1CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLCEaWfAO7nUm59+syKMMoJB8EG0FMX2rc04JgPJ2aM=; b=ztKdcusW+S2mdMbrWA576cSESa
	pRwjfd/zHXnfa3LLSd7GTH5INGkHHnxwm7UAmgqBaLedW5wSMnVeyvX519uzGk+PP5RorFiHEoZHj
	jrZIjW+ojn9lmDZsEStDo7bftJFBEcE7b8CkVdbiZPUz68KiW13U8bBTRMkeD/vqeq0Bc+GxCSUQf
	okeFzrn44elTCpJp7h7g/MvPwWOljb5igY333bP+43INWYYmvwW24rwRjaeBQ27KeIXTLE1bkPVNp
	NxGtotEjmZH9+368nObWR4i3htgFHx8l0EJKsnHxzgFs6YtSSnvU7omoCwz324g32Thj3K2ANocxg
	ilfSXZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInTY-000000079CW-1Dz0;
	Fri, 01 May 2026 13:00:12 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInTV-000000079C2-3160
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 13:00:10 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8b4eb1fd5d0so11252566d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777640408; x=1778245208; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sLCEaWfAO7nUm59+syKMMoJB8EG0FMX2rc04JgPJ2aM=;
        b=Dv04UxKJYT1KYNu3PDyMlk0XyngsMEgoLL0U31C45h/5Qv+tGXl+kP7ot4iy7YWI/w
         Ly1gZh1fGi7/Gr6OqZ9S9uDv3doLYQTMAO1rMyjE53GVNNPkos1HiWHc+2DQmP7eKbG0
         2VpySOG2wSq4iV2cuEo/NGkdw++jLu4vCdPZqVR7aoydUvFM4KYPoJB1nOeYWF68ACl8
         /PdByJ6KAlb75dfNaPHlO9LezaUJESrrAB+c+uQb+Wuxu4CUpmd9jVFZfesRWOdGeUqH
         kILFSR9RAPRReUgw5ymSEY7F66TIWldjJLj3q2pzB0l3Sz68mtAlHpMw/51zuW+prYmf
         Jg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777640408; x=1778245208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLCEaWfAO7nUm59+syKMMoJB8EG0FMX2rc04JgPJ2aM=;
        b=PbbqVOUWO82KbAJ3Lnl9lutn1C/B53VXcLvBj9xrnS7uc1nbU02SyXzCMcEQFnJcHI
         Hsflu+tGDwdWnvdaVOtoatr5zokJOPpkD8oqnWuJpFy+cg1TwPvCcxyGWQ/+EcpposHG
         lxYRF0jrGWWcxjOF3Z8Roflp11wbdTn2u//MquF/YhKykg+hVXpZKXGpkAn6P9zKy0v/
         pNblNF5rT28OF6chIpkWr0mfnRnX/OPAHyLX4H6bRiEYrMTAkvSz3YdBhnIjRZy469OM
         hlTN84K/hx+juv75n89QqlRsED6LRegPg5RflgjvDYPB5GuEJzAJlOeoaHnDrJaFJUj6
         XyGw==
X-Gm-Message-State: AOJu0YydjppcbGwM2i41QHoiof6S0HeE2ltyvTnE/id62un6GCB7BP6v
	73kKUWtcquap8Uk8saWb6EnDo5qg2IDPnuTL6srhI+FMYWp4sNhVLDmIVlYhNwr3N+M=
X-Gm-Gg: AeBDieug8/yrHBJRlUS2pwwtbZ8PWq0Z0uA0HjdE0wDn7tV/epKO7FaSWMGxpyH71hW
	MoeuwJvh+iE/Tifufo3HqPpSE1Z28tWcqc5htiepgl03kY5nEB5U1L31/78Q46D/aly28689UVE
	hszlf7vu6XDKf8BK9Tn4l4mZY3zOcjP6/jRrnmWkIf1cvA+wcAvVdSgf+LndxuXHxCLIhAqZqM3
	Qhe+ehRUYX6YkH85jUqYiXfGRtP1hWQeu4abaF0FIHqfynPHYafB4rXo2tZ7900zGX71POVFlmy
	Fi6tE81N4+6YA3JhKqyDO++xR8v23aZNHCtICxRQxzNotBosR8nhSht3G4mXabPufUUEseQ4bdL
	GjFvCHLthswvq7umHJyaRLzJyB0OcovNgbFbrg9/68HaAEdAkkzGLgL58Gf+rbmQ0ok1g58brP9
	++ODPYoellb/tzuXfUpwNckKVG0pQwOIJCrRhePsVr6dKHZIWleoXaouJnCZNhrioeHD3W8NvYc
	C74kM5Zedns/CyYsD81XeArUI8=
X-Received: by 2002:a05:6214:3d85:b0:8b5:e126:e77d with SMTP id 6a1803df08f44-8b5e126e7b5mr18314046d6.8.1777640407970;
        Fri, 01 May 2026 06:00:07 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c7accddsm23110796d6.36.2026.05.01.06.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:00:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wInTS-00000005DWr-2vHb;
	Fri, 01 May 2026 10:00:06 -0300
Date: Fri, 1 May 2026 10:00:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <20260501130006.GF6912@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501111928.259252-9-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_060009_763265_49D2F1F4 
X-CRM114-Status: GOOD (  11.11  )
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

On Fri, May 01, 2026 at 11:19:10AM +0000, Mostafa Saleh wrote:
> Create a page-table for the IOMMU that shadows the host CPU stage-2
> to establish DMA isolation.

Is there a reason you can't just use the CPU S2 for the iommu?

ie the CCA RMM is doing that, it is how ARM imagined this stuff would
work.

Once you start supporting DMA like this you have no choice but to keep
a fully populated at all times S2 around, why not use that for the CPU
too to avoid faults?

I guess there is a reason, but maybe explain in the commit message?

It sure would be simpler, you wouldn't have to mess with iopgtable at
all...

Jason

