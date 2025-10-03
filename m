Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38E2CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 00:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJ4GF21x3yH2fxgUvO+kT4SV03dtv6uBvlTIWHIhWNI=; b=pv7DdgmFrkLlL7PoX4oWcB9Ojb
	P3fTrVAU/rhpdayEiRYu1FtHgM7kCmHHxu5iWqCDwupNeSQrDJdLTcmx69RBIcE/5DXmkiWLKMRJj
	JokAPvIYU8NR4ndqSKCvkzgUN77dFDLY0J/DYzLm843o1DEsAlOfREaktPu/AEsxy0iNkujrtFIyY
	Etxiy7BrCwJn0cLeCDzKL2WS5/2N1QcM84d7qYDh2xJ6ZG0EqR6vnwK6/RCIITbhN4GbEIv3jbaA+
	SWZPciprVQN7+O7PzmPTopRZS/sc6Hc52MLgcdK9YKK5K90fPC05oH5jQJ4CMPtxNNvKocabVBuux
	dnMgRIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4TaO-0000000BRto-271J;
	Fri, 03 Oct 2025 00:23:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4TaL-0000000BRtB-2NgF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 00:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759451024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJ4GF21x3yH2fxgUvO+kT4SV03dtv6uBvlTIWHIhWNI=;
	b=NwvHkJbwCaKlDExSS25mcYG/Cih+XJlsSWCGxgI+0u0TyC2z0wAOF0nsUZGQaMPIXHEmiH
	QcpsM1VS9glY3aHDmcf6xZHFqT9262e+q8iNiyjddvaK8f02qRwWtrOqmJGi+doLmHzUJH
	qNW/6VjpbEVtbEkjjHNo4ljbygAtJCM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-Ag8FfZzzNGmVvvz-cG1X1w-1; Thu, 02 Oct 2025 20:23:40 -0400
X-MC-Unique: Ag8FfZzzNGmVvvz-cG1X1w-1
X-Mimecast-MFC-AGG-ID: Ag8FfZzzNGmVvvz-cG1X1w_1759451020
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-277f0ea6fc6so34584525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 17:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759451020; x=1760055820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJ4GF21x3yH2fxgUvO+kT4SV03dtv6uBvlTIWHIhWNI=;
        b=RXdR+gF3FtR4/U62uy9TCdBpcW+gEL9UKYyhSQZl3FBAWCO0JQ8NQI3v5NAyNmk4nV
         lfp+2xp22x7ZSv9g1TgC0cSGRhfygvqhNbaXjq9FaaxQZVh+MFVAyG0euK1SZyG4DIEw
         i87dgHRq/tn8K6nrmslR9eLjw6rn3OuOEqflSTw7lgUmU4wJopARyc81iifVbWbaXv0H
         HrKw6H3pWbjUSEK325uEwk2nqapIP5oorYz9NoJgdiHEw+7m0YaBjRq7PXXZh0jaIPyi
         G9CZuxkNsZVjIxAGrGTTGFkdXSotVwcVco4yX9pK1rLdsulYVvlF9khwWaYn77XcZnLV
         IVTA==
X-Forwarded-Encrypted: i=1; AJvYcCXerM2PMwwkCHwIgxOrhjOIn3vY+yyuWlKR49FimCDLc0crxjJrAuGtX8VuAqJfGKDjcWGA55NQpmzoiGc5raaR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw5H8xtnufCs00SHBeBxEESGo/fxVXIuUftr4ybAerEW0GOwrI
	EZx2xh1JAs8CLudXCPvcDp1eWraCtDnQRIiLSZKiFZSRmXBii5pEuNXY/SesZ8qolLdqIyLf0cs
	2bhfmPgD13CZSd3q0eyKL0Uc7Dh44PdbM1Yrw9ZIUrvfIQJ+MWxUsgHsnXwBIBGRwzcmM+/KdDz
	bI
X-Gm-Gg: ASbGncvhSxE3mQJONIA5ptdsC6yge7SVsJLpGWyTDZKZXcRjnnJwNrUArcbkWsk67n9
	I7cpjcsVAEGMmOBXyzmugZWcwmgYc4KOkejQFo4CAPrz1goS4m45QxL9Fxa71JzNFOASM18hCvG
	ddAkmic2PJpvNurWd1ZvUaY3WgkJRGAUhRD24ZyKe5Re1/qrFRQr97T5IKGMxh30NfXvc+Hn4Zz
	57iG18ZveKKOSj9z+z3KsVIjq1oLOoe7xrH6Tl+v0ipXhKEhCa44nE3iLlGLLvgoJKqnJU3X7sH
	CbSvwrALQ4EzhB5hHYp7vevEa9CF/4dnMTebjtCsJrGh6b/zuaw67Xrvx3LXM2vnfwNAaWu5scG
	D3e1gHnW+4Q==
X-Received: by 2002:a17:903:3d07:b0:268:500:5ec7 with SMTP id d9443c01a7336-28e9a5b9441mr12159375ad.2.1759451019780;
        Thu, 02 Oct 2025 17:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5T0f61djQ+l8nuJX+LHXogclh1AUcAAg1KdLhGp2cAXJedAcNcCLa6griCMec76R0JF2mkw==
X-Received: by 2002:a17:903:3d07:b0:268:500:5ec7 with SMTP id d9443c01a7336-28e9a5b9441mr12158855ad.2.1759451019403;
        Thu, 02 Oct 2025 17:23:39 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d5e36sm32448375ad.114.2025.10.02.17.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 17:23:38 -0700 (PDT)
Message-ID: <81262452-d780-4e85-b153-b3b8d16eabae@redhat.com>
Date: Fri, 3 Oct 2025 10:23:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/29] ACPI / PPTT: Find cache level by cache-id
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-4-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250910204309.20751-4-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BgCkOwwejJRSI3KDREjR0VjKMOTFbWq40t136TQeUxM_1759451020
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_172345_683406_527F928C 
X-CRM114-Status: GOOD (  16.36  )
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

On 9/11/25 6:42 AM, James Morse wrote:
> The MPAM table identifies caches by id. The MPAM driver also wants to know
> the cache level to determine if the platform is of the shape that can be
> managed via resctrl. Cacheinfo has this information, but only for CPUs that
> are online.
> 
> Waiting for all CPUs to come online is a problem for platforms where
> CPUs are brought online late by user-space.
> 
> Add a helper that walks every possible cache, until it finds the one
> identified by cache-id, then return the level.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>   * Droppeed the cleanup based table freeing, use acpi_get_pptt() instead.
>   * Removed a confusing comment.
>   * Clarified the kernel doc.
> 
> Changes since RFC:
>   * acpi_count_levels() now returns a value.
>   * Converted the table-get stuff to use Jonathan's cleanup helper.
>   * Dropped Sudeep's Review tag due to the cleanup change.
> ---
>   drivers/acpi/pptt.c  | 62 ++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/acpi.h |  5 ++++
>   2 files changed, 67 insertions(+)
> 

With existing comments addressed, especially those from Lorenzo Pieralisi:

Reviewed-by: Gavin Shan <gshan@redhat.com>


