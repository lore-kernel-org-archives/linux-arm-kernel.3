Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDF9CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHC3T2VfhHaR13TALJYW7Cdr1Z7CusERiD0/w5L3j6U=; b=fqUwLgmDPH0pNJKTgQHunGQ8rx
	hmz57rR2EMNE5oZwh9GYBOIbNSNl07CwVP1augN2SWYtNDUQRP2HUhuEtl9pxknJWUpLW6rSdjOHy
	s10HjVvVu03NE7jaSnNbA+D7+CTImaAAqgdlwLeIgekEbFscxaj9HOpTyOuhzsSdY07OXU5SH2gIU
	LbcB0+d7tND4nexxs2JWXuhS/uYABG40iVd74zVqosTPqXErgL4S9vOFxhsbx3ab9aaLyIv0WFpQB
	XMK5MhokjseOu915koW89SXqkR0VINgysPixiUJ3wGci+sW0tZ6puvOrBG0iRpxWgdV0cO2oYpaUB
	K7t6hfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OwV-0000000HY6u-2FT1;
	Wed, 24 Sep 2025 12:49:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OwS-0000000HY4s-16Zt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758718191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cHC3T2VfhHaR13TALJYW7Cdr1Z7CusERiD0/w5L3j6U=;
	b=Zj5/AsDo8fxZ9k1ztExOATDXSha2k15QSFvCbI2dNu0N6rrWRtFwYQM0JQzgCkwgUOxqge
	EGfGLdE0hZk87iy+Vv4dX5c+Cv59G0YttRKOiSh+vDeNxoSzS3fsVXJzyrS9Abn9b3b9Lx
	IF3ORSd2NFcLYDY9f3kUjOVtE8RnuuU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-wLKVMyY0OWy74VX6mgeS4w-1; Wed, 24 Sep 2025 08:49:49 -0400
X-MC-Unique: wLKVMyY0OWy74VX6mgeS4w-1
X-Mimecast-MFC-AGG-ID: wLKVMyY0OWy74VX6mgeS4w_1758718189
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ecdf7b5c46so2905136f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 05:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758718188; x=1759322988;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHC3T2VfhHaR13TALJYW7Cdr1Z7CusERiD0/w5L3j6U=;
        b=cG8h0kxcrgobQFWP6shqijSO2yntuiLnAz5wORUWKHXHJernxzXcJ8sI3rKiuiIlFB
         6LDY/A7KG90Ueul7rjO5L8j5O29cta44kaKJoWibh8ssxs2/xLwdfzPP1e7e0hfu1kKq
         HlfyAwSAnlLyzTs63Y+EPLNHs+dMWu2ZEFJeEBHBMnfavt0kuhNaslvY3zU8lnpZgjlP
         7TbqYbm5jm91FrTr5ehZtsplfAZx+/L8kIbwlhegTOa7YDzWEY2V5RI0yrxRKgeiNf3z
         C+b1U+Pkrl9j+Og6+AjAz5aNDzqqVOZ79M6GQv1Ya5N/o+n7y7zuFwI2hkYjlgEvwmcq
         v3yw==
X-Gm-Message-State: AOJu0YzsXYhI/Lrxw0fq3zLHYyUKF+gdjo3VIetLfXrxfVfJKLl6YP8h
	oCPk0ndMWDTyVMiVwRVHWaYY4VkAiHjSxl8xg0muKOD5aGuR3W/iF3zZA96WB+Il3DuompJVfiT
	Fger1+zWb5GzFyArxHC9FxYZwWH5k5vBnStG/NQ7kPjraUeDqKouC/MemHZmLGkle5vCMvIbNhI
	Sn
X-Gm-Gg: ASbGncuiFtSFzW3M2V2Q5G8zcMsUV7GM36N0WkFfh91BiIQsdafbRjJ2JdhycBbgRdW
	nQ3/Cn+AXaOCgIgbufe+S2A7o66k3HgHcUlpYvdQ3HsLXgYkxFy/nbc26exdU/T8FVAwKZQV7k/
	wEakjTCzAfBYB96JcxEMg7ztDk3n7i48E2uUuTaaMfY2USnYnUL8rSJDZok0yaMNruJd8luhutj
	QC/ouSFmUSwzKLksIyKqixfSwAXx2IHpF/Nk5WJrobJFH9wIw4YNofLdb2d6VsIDUpeCx1yNqzs
	ayUFGsSpkOBkKgvNHUjTpyeX+qelWNVbxW1I58EN+aRhqvgiqnQs/QZAvk0N7O9tXrPFJuPoRgZ
	t8pXB6VtQhMHsSFvihhDbY7kXgrUTVQU3d20q5enuTdXEbfP5TWN5Q5zBtij4jeNn2g==
X-Received: by 2002:a5d:64c7:0:b0:3ec:e276:f3d5 with SMTP id ffacd0b85a97d-405cb7bbd3emr5343952f8f.42.1758718188543;
        Wed, 24 Sep 2025 05:49:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx36SpowqNISp0RQInpY5EuDwZsj0Ac9eSfzcispu3U/tKhZ7kW2h2MXOTOLjwD00+FAK55Q==
X-Received: by 2002:a5d:64c7:0:b0:3ec:e276:f3d5 with SMTP id ffacd0b85a97d-405cb7bbd3emr5343929f8f.42.1758718188080;
        Wed, 24 Sep 2025 05:49:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f14:2400:afc:9797:137c:a25b? (p200300d82f1424000afc9797137ca25b.dip0.t-ipconnect.de. [2003:d8:2f14:2400:afc:9797:137c:a25b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2aae3d58sm34490655e9.21.2025.09.24.05.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 05:49:47 -0700 (PDT)
Message-ID: <8006c8c3-8e62-47c2-9d0d-9c7183dcdcf9@redhat.com>
Date: Wed, 24 Sep 2025 14:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mte: Do not flag the zero page as PG_mte_tagged
To: Lance Yang <lance.yang@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 Gergely Kovacs <Gergely.Kovacs2@arm.com>, Will Deacon <will@kernel.org>
References: <20250924123528.1536835-1-catalin.marinas@arm.com>
 <c07073f2-96b7-4044-94e2-b41a2f8ca633@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <c07073f2-96b7-4044-94e2-b41a2f8ca633@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4KM1FObxhANj6re0M_wy7JDc_x1o77h4KN203MY_HAQ_1758718189
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_054952_378647_22F2621E 
X-CRM114-Status: GOOD (  14.14  )
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

On 24.09.25 14:48, Lance Yang wrote:
> 
> 
> On 2025/9/24 20:31, Catalin Marinas wrote:
>> Commit 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to the
>> zero page") attempted to fix ptrace() reading of tags from the zero page
>> by marking it as PG_mte_tagged during cpu_enable_mte(). The same commit
>> also changed the ptrace() tag access permission check to the VM_MTE vma
>> flag while turning the page flag test into a WARN_ON_ONCE().
>>
>> Attempting to set the PG_mte_tagged flag early with
>> CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled may either hang (after commit
>> d77e59a8fccd "arm64: mte: Lock a page for MTE tag initialisation") or
>> have the flags cleared later during page_alloc_init_late(). In addition,
>> pages_identical() -> memcmp_pages() will reject any comparison with the
>> zero page as it is marked as tagged.
>>
>> Partially revert the above commit to avoid setting PG_mte_tagged on the
>> zero page. Update the __access_remote_tags() warning on untagged pages
>> to ignore the zero page since it is known to have the tags initialised.
>>
>> Note that all user mapping of the zero page are marked as pte_special().
>> The arm64 set_pte_at() will not call mte_sync_tags() on such pages, so
>> PG_mte_tagged will remain cleared.
>>
>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>> Fixes: 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to the zero page")
>> Reported-by: Gergely Kovacs <Gergely.Kovacs2@arm.com>
>> Cc: <stable@vger.kernel.org> # 5.10.x
>> Cc: Will Deacon <will@kernel.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Lance Yang <lance.yang@linux.dev>
>> ---
>>
>> For reference, discussion on page merging here:
>>
>> https://lore.kernel.org/r/aNKJ5glToE4hMhWA@arm.com
> 
> Cool. LGTM.
> Acked-by: Lance Yang <lance.yang@linux.dev>


Likely you can provide even a Tested-by? Just saying :)

-- 
Cheers

David / dhildenb


