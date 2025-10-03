Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F44BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 00:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxESuiqnyWWA26ID9dPTIMFHWjBzQCaSkf0/moxm4ak=; b=Semrn1//OcF2fLCe6f+PAl6oN6
	dEIXuQSIK/sSHrwnlt0+Idq0Wd+Z6o4D9yvOk5iQB2qJpnWHQjrEVsTP+ptpVqF19enNmTFscMcTV
	Odmpg8QBfKgqCgAv2yvCnKWs00ZWDgXC4tK7Q4ccgQvjd+4s+b8scFLusglHTl+ZJaaTlLC+hcSXJ
	3fzKS7//7AsflAwk9t1BsFljBWvzqoJTkynuqDGbjujfy2onPLwWUXd07riEYreK2mTKI/eeATqr1
	yzTh0UozBK4qqI7o8C4vf3OrhLufCSk5DY6aWCMOHgmkDN8cJ9ClUaRxJhApR6cviouyf0AZrCMFw
	QxGgq7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4TUT-0000000BRQP-0jXY;
	Fri, 03 Oct 2025 00:17:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4TUQ-0000000BRQ3-3IVh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 00:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759450657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxESuiqnyWWA26ID9dPTIMFHWjBzQCaSkf0/moxm4ak=;
	b=Mce6PGJi+k/TzsofmJi6yflZba6HqL314O+K4pCCo7q6BnNZ0KDW5e0toRtV3Vx2Uj0Y/t
	QOKDuP91jJeb+VZP2N+w39Hc/OzB9ddrzbj0aBfxyavgmi57F42dgeObjToPOXw8L80TNj
	1hEcy6ZyzUmBXcS8eIi4NC8A/P7t5m4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-VFN-QJkAPy2SR1xegsPlnA-1; Thu, 02 Oct 2025 20:17:34 -0400
X-MC-Unique: VFN-QJkAPy2SR1xegsPlnA-1
X-Mimecast-MFC-AGG-ID: VFN-QJkAPy2SR1xegsPlnA_1759450654
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2697410e7f9so30719355ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 17:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759450653; x=1760055453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxESuiqnyWWA26ID9dPTIMFHWjBzQCaSkf0/moxm4ak=;
        b=slX9nfYJw1riBr8/dRY2n6rIwxcPhkknD/44DPzSIiLJ+hblGW2y/NZSEJZTUKBMa+
         0BYz39xBO4Z97wkaqxSLD9MQDE4XCNOl1bl+OrQZm4MXdqY/pjIeqUGiJHhyOKFocZ96
         BfwgetoreOmBZ0ut0NFgBMOnh1nPIEYBbY8E2deaLDnOdTee2s7qeeu71ffrpfBKE2vF
         iCBlh6pLHRE9JLPLwgUXoKsS4kcXzc2BDvD4co5/Q3NoyFjwRCEgLpjNilX8v0qAXcB1
         r76ciAnhaB3aHaNKVpBSDvf8/DgPLVGqEBGYLL9/AA6DNEmCWYZpBHVxVY/TihgeR4sm
         V9bw==
X-Forwarded-Encrypted: i=1; AJvYcCUw5tI3ZvhxCyKTO+iIJU7gGUbX+8PzCtwWl72y0kQfYqA5O+YcVm8lahusXkC24K2KhuYr5GrqtPaxIT2w6k2L@lists.infradead.org
X-Gm-Message-State: AOJu0YxuV9MG+Vd86DPAkDLzhGrnYgm0fiyf2UvMtG0uvnyuv2dF2NeK
	w9S04+yp62g9GzZ0mHTwf4JN8Sd/zqSLdRXG0bppP42q84w0aWgh2F/3nCx1s2h5pG2aYpmvp81
	1UMttEz9jGPuYik0DfhlB12S9ofQb+yTwSIXPJxgK9noyPoQV1XVZZiR/UTgwxZBvbKboI9Fqja
	kd
X-Gm-Gg: ASbGnctr4BGT8b5zC5SJgdppQfpknYvLu2PgwDpO6BDu5FlxPTsA2rqJQEPloEdvRYP
	vMTjk4qbxuSPXFQ/vVLyL8rmobOQxxGeZxu2YtLFZlHwGuxumP/HddX6Scz9PPQxKcOi0R8HOsr
	tkE8lT2wSmX+f8+nQCOLgBJS5vRTxbfu+jKJVH9wMcr377Gm6beS31nhsl6h2upkdoM7Yx6e8/x
	Z/DfBdLgrJqmXUBdiaK+AS4xyP23Bm++3hKKSNbRwuPSBmNX8IiaaMjEdrX+e1Kb1n1lVz7LFvL
	R1ykLVKkLwzAqOFnFkgtPimCDPheC4fSwNvm16aOfkgKkt0zae/bN9ZO/5QhkD3Amxadc+tXckP
	jB3Y1NS8sNQ==
X-Received: by 2002:a17:902:cecd:b0:27d:6f49:febc with SMTP id d9443c01a7336-28e9a56096amr14497665ad.1.1759450653612;
        Thu, 02 Oct 2025 17:17:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZHBudX+t5P5dhIAoHtlCGZ+jK1znqx2KJ3DZHFAw2+dbJ6/l4LnIeuh47XhZ6VySQT/LLTA==
X-Received: by 2002:a17:902:cecd:b0:27d:6f49:febc with SMTP id d9443c01a7336-28e9a56096amr14497255ad.1.1759450653268;
        Thu, 02 Oct 2025 17:17:33 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b8444sm32362015ad.86.2025.10.02.17.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 17:17:32 -0700 (PDT)
Message-ID: <37614dc9-91dc-445d-b289-1346e216dcae@redhat.com>
Date: Fri, 3 Oct 2025 10:17:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/29] ACPI / PPTT: Stop acpi_count_levels() expecting
 callers to clear levels
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
 <20250910204309.20751-3-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250910204309.20751-3-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bUb44z4Lz20HsSoH3J456XIswRyioszbiFBnsMYesQ0_1759450654
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_171738_904955_D0B1B7BA 
X-CRM114-Status: GOOD (  16.19  )
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
> In acpi_count_levels(), the initial value of *levels passed by the
> caller is really an implementation detail of acpi_count_levels(), so it
> is unreasonable to expect the callers of this function to know what to
> pass in for this parameter.  The only sensible initial value is 0,
> which is what the only upstream caller (acpi_get_cache_info()) passes.
> 
> Use a local variable for the starting cache level in acpi_count_levels(),
> and pass the result back to the caller via the function return value.
> 
> Gid rid of the levels parameter, which has no remaining purpose.
> 
> Fix acpi_get_cache_info() to match.
> 
> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> ---
> Changes since v1:
>   * Rewritten commit message from Dave.
>   * Minor changes to kernel doc comment.
>   * Keep the much loved typo.
> 
> Changes since RFC:
>   * Made acpi_count_levels() return the levels value.
> ---
>   drivers/acpi/pptt.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



