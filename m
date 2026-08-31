Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA63C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArSGj7c2DTB+uNsBgzHLh0fINaLzVW2mblZJGAkXJLo=; b=S9fL6snPOy/5EHAHZtmDDmj1g0
	w3PrtPiT0r5aV1s+VUyq5Peyc6+w+DtgM3E5UXK+heZsQToRHNpdTi9WyICnRqz9TQOY/5HY26WW5
	dZ2jEizISnzOatW1S1e/JhpSKMstj9YuYDtxucjI5Sa/A7YmCjOTX/sLLKKnXAcs0nkGFVhAsYFt3
	odIPOdVJsbmiR8nHEtm39Jc+/BsJ9CnqRcGniYP2VUPO6Wp7fwaYxlryIHLGi42Xd7jHAxYItU7io
	qMIxnCUhO2EzZK5fZmmEnwUn4K8gk2Ftvf5WLyFk/gHUV/BWlAJNSlMKaZ1yymTgZXr+LUEUFtRiM
	sZJqCFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BaD-0000000Ag1o-0PEZ;
	Mon, 31 Aug 2026 23:38:33 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ba7-0000000Ag0m-3MiH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:38:31 +0000
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VMYmri3590071
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 19:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ArSG
	j7c2DTB+uNsBgzHLh0fINaLzVW2mblZJGAkXJLo=; b=fNSgbsm2VvfDqMfjzfYO
	k0YKPxEysqgiI6D7Qf4ZFTCDJV9N0QIuF2BPZOoiNOV3kiSxo7SP6AlJBGetjbTM
	FpQgZwtkh+gLVBrDjDS8LrlTU+1kF796i5o8VKkueQX0cYI4g0RI0IqReI63OU3z
	9qjXb1dFa2QIa51yi9Q3daDT7vMs8/zG/QWrYMjPKslBk6cON02goPUKF/eL8wgV
	RBu2yXtAHunqGaw+PDFbBTvPhtSsNfZSBDttQzy5gnGNdopWC5yPuweJSwZec+eD
	eFuqMD0TM+s/mOf6s9NzMwyi1qwUBYQSYJHucxHv0UpLURgN1leF4AhgPMCnOcw3
	jg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gdeqba4nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 19:38:23 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903982af1so944076985a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 16:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788219503; x=1788824303; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArSGj7c2DTB+uNsBgzHLh0fINaLzVW2mblZJGAkXJLo=;
        b=dYSOxoW0qHXGea+MA8Odi6EaKXtadRp8AieiGOX7BI54TcDCLLZktcwvJ+LEj0tRpf
         UcqhxBIaKcU3/skBpJmM5WGtzNXywIhf/3iYvIq+EjKG5oj+LZXWGQkehdrw5KeakorS
         LlszfNWv7LmVx8SYtddo4WBE1CUw8vN7HjSZfTHugsuO+H3We+U4q5Z0A1yz25151/Hl
         lVHE5TJ18uK9MgSA/4jmeJURFfxhzMOh2ycIAJUPrL/INaZuS23WKQ7I7XRoF0g3FZ7b
         KHvqfbQeKiNZQHq2m3yha/E416eWiJ5NY0NLTNeVhOQsxZa7j0pv0mfkIGl50J/i0z2m
         YCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219503; x=1788824303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArSGj7c2DTB+uNsBgzHLh0fINaLzVW2mblZJGAkXJLo=;
        b=KLtQqGa+AsJiYYsWKryicPaiGjPlvlDmtK4J9x/AnX6fvcyym7hAAoajMhHZ1pMg6c
         JEFnDhIUvFCAVvRt/tJ3aMXxVp3DVoUJvqo2EGS5m3bGNFsHQ2nX3Qzu0Nk/gvkajWFM
         JAvpr0K9/doI1aca0GmcMhbCWJMbPVJIhNsvc92ioocNSisghPajUVlS8B9zxypwHtMJ
         Osmz5UpjUvVFAVoRl7MhGiiaSnWhhXbh943C4WrChGIPtfLjqNuJ7nQyzSjUDc+rBmPo
         bYr6XmiMVhnuP/QjkrxW7lTAi5D0hL/0/S+O547Vve6g2O7RuN3JWqEa3a8LOtuW+rPb
         sgqg==
X-Forwarded-Encrypted: i=1; AHgh+RoL7baVJWZ9DO1foHKMgcyINKljuczqI0dnfiVsa+4EWlp9pgiz2uByuQqsXvQsWybmwqgTnNkY6O4yt7R0ZoUf@lists.infradead.org
X-Gm-Message-State: AFuF++lrtQCCfV9DLoWT0PyoYbwU4cKOBbf47njNNFGQmyoyX6dgWT9a
	XUwGQ8vq/KOgGmjqMX3AgrkT/Yc+4dsa6ip1FNA7PDBX+i/H6cYJXUihL8BItO4okyVxRT7+lDy
	tDwUye7hq51T0ksB8VG3CieKRJT1aNl9xNmEGSoTyW36O95YyFWKZ5f1jCpqIsHyUV9YMPkOw
X-Gm-Gg: AR+sD11EjV7S/ZcWiawXLoM2hBkAPlhecHGwLeXLKH00+vyXPF7CjJwWDuY4tuajSJk
	x6Xpam/ACZm7uwMRt6dfWkOoaLxD9uc0AzmUAazHmDVyFN6Kp8BBH9tH1xOtmevEo1zk0f/Xnta
	zpRPifSg9y6PCznPPmMO/lrxsiiQ6Te9Oo0kykPQ8NwZsXlbrwTdTfJZ7dlNi4aBYawbnHzxAOy
	yrsto3yNftCgFe19aoyMlUUN+nbxfbF25vqbQMHYa3RuVaDqwfN913kYGq/ZPxKj7bzG5mVO+6O
	wPdDzAHntrYFhrsXnYHrSEQpY35MXsgn3ugKBOxJK0LzcPKptC0x4ocLtMmcfT95UWthvO4sxtE
	A5ubzUzEep4AlDzQAjle667HvDLp4mEWcO/AVj741AIoDfongYQ==
X-Received: by 2002:a05:620a:2acd:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-939138ffddemr2919447185a.21.1788219503258;
        Mon, 31 Aug 2026 16:38:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2acd:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-939138ffddemr2919442685a.21.1788219502721;
        Mon, 31 Aug 2026 16:38:22 -0700 (PDT)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173a4254sm893939785a.25.2026.08.31.16.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 16:38:22 -0700 (PDT)
Message-ID: <61dd4d89-1b1f-4185-903e-a2b1ff089836@columbia.edu>
Date: Mon, 31 Aug 2026 19:38:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] mm/huge_memory: use folio_swap_entry() when splitting
 a swapcache folio
To: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
 <20260830-folio_swap_entry-v1-2-7786b52acbc8@columbia.edu>
 <DL37OCFFKFCH.2VWZ3CMY3EFG7@nvidia.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <DL37OCFFKFCH.2VWZ3CMY3EFG7@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDIwNSBTYWx0ZWRfXwhjPqxEeKx+F
 Y0bD5QQgV6w5UoDkOBM6oYi71IB0tokTJJ0jeowmCQ6yPvYOeR+rT3I/XQUjmo/V/qF8hkfHghV
 eok2VH/O7czZ7WWX8j4CWDnpuzCQAAwuHEIctD6+JpuYd1IR7DP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDIwNSBTYWx0ZWRfXwtlha2l6cW63
 gppw+/bOf6YB5Gl7jbw3ZpNWhryw+nhHzqxiifAgEfYvXbbcuUBGTpZAqsSOeogQ9d4zwmz/RPY
 bKlU10LWcWPtod94TO1z4ChH+982G5L6VTNI3nZKdS3YB7lZTwhj76K7yO1bqHd2vOLlMsGoEpm
 BsSsZqafS1rfQZIN63Yvpaaayb9NIGK9QK8aQtk3qF2JD41f6WGW38wEBwbQGDCUWik2tpFO/ew
 x64Oij1nY7HGHUbYwNXxZHOLjBhCY9MAy3Nc6qIFSmZUUQ0+raSzLY2GYtyoge/DkI2XSnC+jFP
 QFcdcaa0WyG1Bq5+kfXvlChl0W1FjvU1aOk2qh2FLsmM8+xRLwOrGlR6JmEs41FotIdIDkIWzCc
 FV+7KwEj0BzfB6QsQYyGDGotHVJCXEBsel40V87D2V7ZZcFVIj63cEFBywvCpFQNEt1aPHX2Lpf
 D5VDfS8uHkOB+gWOIig==
X-Proofpoint-ORIG-GUID: 4JKZ0nSHs_n5N3OzVYlffIHeKy-UrcSS
X-Authority-Analysis: v=2.4 cv=fcSdDUQF c=1 sm=1 tr=0 ts=6a96106f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=X7tRCqHdiWbQX_0A2iAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 4JKZ0nSHs_n5N3OzVYlffIHeKy-UrcSS
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11892
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=10 impostorscore=10 malwarescore=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=10 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163829_032110_6F4BD9A8 
X-CRM114-Status: GOOD (  23.01  )
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

On 8/31/26 5:50 PM, Zi Yan wrote:
> On Sun Aug 30, 2026 at 6:32 AM EDT, Tal Zussman wrote:
>> __split_folio_to_order() open-codes the swap entry computation for the
>> split-out folios. Use folio_swap_entry() instead.
>>
>> No functional change.
>>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>  mm/huge_memory.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 54494c3fa983..03287f995d92 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3760,7 +3760,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>>  		VM_WARN_ON_ONCE_PAGE(new_folio->private, new_head);
>>  
>>  		if (folio_test_swapcache(folio))
>> -			new_folio->swap.val = folio->swap.val + i;
>> +			new_folio->swap = folio_swap_entry(folio, i);
> 
> folio_swap_entry() checks folio_nr_pages(folio) internally.
> folio->_nr_pages is in first tail page of folio. If new_order is 0, it
> is basically checking memcg_data in the first new_folio. And after first
> iteration, folio->_nr_page will be clobbered. Without
> NR_PAGES_IN_LARGE_FOLIO, folio_nr_pages() is derived from folio_order(),
> which is in folio->_flags_1. It can have the same issue.
> 
> Please keep it open coded. You can add a comment like "during split,
> not all folio fields are avaialbe, open code the swap calculation".
> 

Thanks, I'll drop this change.

I was debating whether the warning was worth adding. It'd be nice to
avoid accessing swap.val directly and abstract it away, but given that
that's done in a few other places too, open-coding it is fine.

>>  
>>  		/* Page flags must be visible before we make the page non-compound. */
>>  		smp_wmb();
> 
> -- 
> Best Regards,
> Yan, Zi
> 


