Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D6BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 22:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1khi8+SBsdLtnYEbz8P8DQWF/VnSE7LC2X12JEweD8=; b=ID+rMeqRWXfn8H9iFCTqTEc9UP
	mkDZ+mi0YEmEvsIGylwkxe6Xy/4bXcRDMT+KCRkN44/yaQ6OrSlYl597RI1S0PTfGkOnAzi8JGxAC
	AiL0m3krz/Fdrvu/xpwL4fhqXNGRV0RiIafNpM6rKTXhaqVj11cYXyHdRz9O9UWbEkcKWNSaAoVA/
	f3sb97jlvIw4matdq1Mv8ZR8ZaFE6mVuZ41bpuon50iGn9/i6OK6toaMHcfLkaKEzXtNZsXFNOKkJ
	sDl2Xl6j6Gr75QTOwMvkHP8YtCnVgsKGFxeusbu0VsGU24pRjw5EEq39eTQM+AKUUykbPFRNWKhZs
	3pPEbtCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDfO-00000004QXg-1xCP;
	Sun, 09 Nov 2025 22:13:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDfL-00000004QWv-3bMI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 22:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762726422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k1khi8+SBsdLtnYEbz8P8DQWF/VnSE7LC2X12JEweD8=;
	b=SP0pEs9BOyPNL5LnlzPb/bAgM8AcJjHHJ/6FKIs5pnqFieWERuTCXXc+EQDW1T8OKUIE/M
	Zpj6jh71IwKxCONOIwgt8eC+4TdsrqVMgaeR02J0ubRSGTn+5ZREVEh5cFdL3d+tcHpBDd
	lPqI24HwflgFsRIJok+05oGyhoxV1YI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-fOUOyw-NPniuLgLtACLBVg-1; Sun, 09 Nov 2025 17:13:41 -0500
X-MC-Unique: fOUOyw-NPniuLgLtACLBVg-1
X-Mimecast-MFC-AGG-ID: fOUOyw-NPniuLgLtACLBVg_1762726420
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ba4c6ac8406so1926109a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762726420; x=1763331220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1khi8+SBsdLtnYEbz8P8DQWF/VnSE7LC2X12JEweD8=;
        b=CELO0j3MYuVlrpfpP96iUzziU6bH44crJT4hudEf8y3tdah4//mxGlnsOi+X+x/4Jl
         /+G/KhM5ADIV3S6SKz+PCms4gj+6V/wz59zKny+2uLrWOjCfS8LPpmLDtwY6neW+SSCm
         sabvLdaGFdtvFpUHJbSPa+gQFMfvwaJJ7J5SgEwkhTVigGTZ1hgwzGAX0OqgUSVHmLmL
         VvsK917PK9tdMQSG7wjoRXxitTkx38k2jFpPHXSm+7eKtq0UjH0kTuO7CXOIiTgOAUbQ
         t9Vp/dG+HISzS2cf7e8wlsCZPjZrjjQlkMlaJV6sw8V0jMEKPr5FkZtWwPSlTgPJA547
         y3Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVRkoFDU0tYLioU+oZ/ZRkrq8sqG+Bl1vYpD0KtvQkyTp8O0ZTPD4LR3xj1m/n4h3E8A2PoRbK8ju/dfptWOizi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9iCaidgnC4gjAYrDwa7zAgj4SsWFhup1ATwBLYgDBpxU9ndxw
	ODjei11uiv62uZ/kLq1QyWwX8f7oiHdKXFxkbdGYbogFuXy2IXxkhVx2f9p79Sbee3Qga7iqPwD
	lN/HflBB6UVJrJrkeiHZ7LsQFC2DhBqL0gXoAdy9pcCIcTHbwdF5bGUclk5As02xBD8mnxJ2Rwv
	k0
X-Gm-Gg: ASbGncvhlteEhiAdLJ7evP9xIQ2EZaoAOijYbpPFqjQdIPhE/qyoLQxIOISZIP1FvJY
	vBbUlRBimNBSSz+9h7qUNGaJI0qpQSbFz+0micVvMzhZ1eZ8fjHxZ7/4vJn5scdCQRTebf+N+9q
	AgDs0NgQyG8+1t7oDZAvbVSgMPTGNB8BD9my53d7fi238xBJuxIyYwOk58XXD9iiUQwSN6TObN+
	phCF9LQ8pd7Z6XvHPUTOJ6RWtFDWHS+N5baheHnvvhd2Vc8ENSE0lJ5EGPnraGF5ZhoScxYLODo
	uRTQzHlioKMh7AagWV6AbHQ1GLwpANLw3NXfR2WYR7QMRXbE/GBeDnPW53iDdyTjhFTUoAaZnaP
	cq4RgCI28UEsYsdLkAKyy1udD/WCn/SMQjJfdkIE=
X-Received: by 2002:a17:903:3c4e:b0:298:2879:fdf5 with SMTP id d9443c01a7336-2982879fe66mr5263405ad.61.1762726420124;
        Sun, 09 Nov 2025 14:13:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGb4XxQvoeJ0W8VROpZXADL4+iR0errP9SCVp5LKwsSJ4XS5XSp4nkIxyN5gwkjzdnJusKqWg==
X-Received: by 2002:a17:903:3c4e:b0:298:2879:fdf5 with SMTP id d9443c01a7336-2982879fe66mr5263015ad.61.1762726419763;
        Sun, 09 Nov 2025 14:13:39 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c6f20dsm121120615ad.65.2025.11.09.14.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 14:13:39 -0800 (PST)
Message-ID: <290d5834-65fa-4200-a76f-356a754c3f06@redhat.com>
Date: Mon, 10 Nov 2025 08:13:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/33] arm_mpam: Add a helper to touch an MSC from any CPU
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-20-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251107123450.664001-20-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O7mKx7BqwvnPgLIwkiDTfrLfzypVQiLZ8U-IFpe94IM_1762726420
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_141343_972223_CF763C30 
X-CRM114-Status: GOOD (  13.08  )
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

On 11/7/25 10:34 PM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Resetting RIS entries from the cpuhp callback is easy as the
> callback occurs on the correct CPU. This won't be true for any other
> caller that wants to reset or configure an MSC.
> 
> Add a helper that schedules the provided function if necessary.
> 
> Callers should take the cpuhp lock to prevent the cpuhp callbacks from
> changing the MSC state.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 37 +++++++++++++++++++++++++++++++---
>   1 file changed, 34 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


