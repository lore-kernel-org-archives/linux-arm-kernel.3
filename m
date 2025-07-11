Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017B5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=If/5UB61e2uhkmoPY7NnwrYxADXd+FZxWUm6GwDZ55M=; b=iwYZwhoG9paXOyJmvzUGGWUc9m
	V1Jfj2wjHn5g9zT3R4Q2Q5jAVrrGaE0m5857Chk70q35L+PF+75va1d2mcF7oSiyheVoe2romG+lp
	qwPx8vKgb3VXDs2La8aZkqqyJMh0NYHZX0KycslyRqoIuMiT56GTiVSJyxOSFazbrV3Hw/9TopSQW
	JYXpRXJcbJDbeQAvKmWcSadrWqqo9anMmDw7tq5GCwS2Et2Du5gQWUJafYbpHZ58MUL0yjUVem8GE
	t8Ze2eYM6Ph3V/v4VEiOaSoW+ia9QkKb0MLl6vcFIdJRm3L6MvY0gOYoKFSudoXP929GVMJpXtBaN
	MRze0+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua67H-0000000Djg0-2XQK;
	Fri, 11 Jul 2025 05:16:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5au-0000000DglC-1xmQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=If/5UB61e2uhkmoPY7NnwrYxADXd+FZxWUm6GwDZ55M=;
	b=NQ9gCbcLvnc5uWA48xTC9rrD8+ynuC2CRoszLi5L8UkBtZOiK5VaDonX60DvevqCxMsIF8
	Wn7SQub1rusl/flxePJst9DYFZHFOeynUrJEIPP4mLX2uBEiBXEM116qEOvc2F/FL+LJNX
	4UciHXG/SmWENz53uawFIIfKtJiLUbw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-8gymTNxMOC6Isxwpbd5Wag-1; Fri, 11 Jul 2025 00:42:42 -0400
X-MC-Unique: 8gymTNxMOC6Isxwpbd5Wag-1
X-Mimecast-MFC-AGG-ID: 8gymTNxMOC6Isxwpbd5Wag_1752208961
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so1774638a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 21:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752208961; x=1752813761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=If/5UB61e2uhkmoPY7NnwrYxADXd+FZxWUm6GwDZ55M=;
        b=QVBcPjEtXnvM+aAeu0fPpuzidZUK8lFpDGcnklcaMNEP+0jOqQx1EA45GCfFS9dR81
         GOPS11rEWtUc/8pUN3WYtBSQntdD3JhJHHprvcHjp2mtfcu2nYpkWUsv75Z6KiICyV4J
         uggyJeubPX0r/Z+VtscnU6P1I3dYQZKtYzCj2m2LvexnvwDKl6fcmchg5cjkUKG+iDFh
         qyzIqg45RCWGAJhMzPpUFaiUl/sxM4IFSAKAEE6zYl7uKvEGJBlg7/yywx5banGHorz/
         dKi65uIYEoAtEUw/qjatLm+QDdQIQ6GFKrryCekebHz6wZGdtWGo7+gqICW3S5ZhX37p
         UbQg==
X-Forwarded-Encrypted: i=1; AJvYcCV0LHscB1Ipwsz76qaZ03iTIEFP0cs7ZR0x91VmHKFwa6HuAdNqJ3CWOVwNWHwb2SOQAIwn9TFXSGlVxsbe/rSI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9sk/oApzJvG4oPnEQOUQc7ArH4aflrYZeA9ElEwkQaK1VL6aZ
	xa8wfBfI1iO2u3qRx6sm6ZAnOe4834y2plbUCVwfA21Yt17w0R0XK11u5kX9No6RChR9zvN81Pm
	y8pYZUyh1k216T4YQeaBqOV/NTbxPRM05RemRdoMoTmTwIY9fq8PN2stbN+VcbHtlLyk96JQakF
	br
X-Gm-Gg: ASbGncsoOLs/kyIUIL03/KQMIYRw//U6uYzW08s7J5EYJM0NA4ACzCI58ULVMxutsVB
	YM/rQz+uZJiWzYfj5RyDqpXrdYxKNQMZV0BIbJN4NC2M8pxbbyxK1G69OOLS3hQwUlIPq14ztE2
	tO5MexzicINXWp5RMZvY8ZK5pNx3kzmR1uZLJTVDq/k45njDZFHQYwvoPRk81fD+/52qtN23DHN
	20ksxta8UcSKKj0rgsQXz1xQdBbi+Q4svj2qLcrVQqz1hoQ3MXtfPitXZromm35lmzb6l1RLqse
	d4oML2jgSGx8WXUFOB8INFmjS9IS/qggSNz8j5xyvWLXL6yPWZubQVq9QzZr+IiwxFLUq6MbjHS
	FmKM=
X-Received: by 2002:a17:902:cf0e:b0:234:c549:d9f1 with SMTP id d9443c01a7336-23dee3a6040mr25269725ad.47.1752208961086;
        Thu, 10 Jul 2025 21:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEceQJQw9Quj4aBv3qS+MmneGwIAixnuZknrzMzoYVfnNj+UGg775KAKT4tNEkyT8JSIPKn3w==
X-Received: by 2002:a17:902:cf0e:b0:234:c549:d9f1 with SMTP id d9443c01a7336-23dee3a6040mr25269255ad.47.1752208960547;
        Thu, 10 Jul 2025 21:42:40 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42b01dbsm36977215ad.85.2025.07.10.21.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 21:42:40 -0700 (PDT)
Message-ID: <5147e48d-2376-4b0c-adff-b8663e56f152@redhat.com>
Date: Fri, 11 Jul 2025 14:42:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] cacheinfo: Add arch hook to compress CPU h/w id
 into 32 bits for cache-id
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, WillDeaconwill@kernel.org
References: <20250704173826.13025-1-james.morse@arm.com>
 <20250704173826.13025-3-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250704173826.13025-3-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g0zNXQwvu0SL0NPNqhKTin0veY4QmnYYrAhWtS_mimM_1752208961
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_214244_585385_3B3D91B6 
X-CRM114-Status: GOOD (  17.09  )
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

On 7/5/25 3:38 AM, James Morse wrote:
> Filesystems like resctrl use the cache-id exposed via sysfs to identify
> groups of CPUs. The value is also used for PCIe cache steering tags. On
> DT platforms cache-id is not something that is described in the
> device-tree, but instead generated from the smallest CPU h/w id of the
> CPUs associated with that cache.
> 
> CPU h/w ids may be larger than 32 bits.
> 
> Add a hook to allow architectures to compress the value from the devicetree
> into 32 bits. Returning the same value is always safe as cache_of_set_id()
> will stop if a value larger than 32 bits is seen.
> 
> For example, on arm64 the value is the MPIDR affinity register, which only
> has 32 bits of affinity data, but spread accross the 64 bit field. An
> arch-specific bit swizzle gives a 32 bit value.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>   drivers/base/cacheinfo.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redha.com>


