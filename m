Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D336EFB7FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 05:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/C/RjEuENHKQ8NVKZ+XHFLTLUPqm8179r+FfKGRQPEI=; b=Ob+KyBjW9Xql/U0vTcnyz2Pdpt
	8ZK07guH7T6RXb22ZDe+KgyICBhAZcJQjMmRtmZODnTdkgCLaxN/n7qBMSPUJKBqm3YYr49I9V1ZE
	PiG8MOKcSWlSugGL4mYIVPo1Lmp5N5jFhA/485n2Qzr+gU95tbod/alZl2vCQ53cTsBygzdNruCUh
	gBXKIe1kKuXljdhbFns3QMxy7DJrN+8OWwp7mI9cnNw7pQi6SdNFr3wiSAfMHc2aT2gOD4r/959eh
	rJDMBGJE57IF2Tx4qVOuspbpoSTF5VCE4OjiMTnSvXEROO/FZQRWq4qQEWQIaiQXJL7h2JipGSlbG
	R5I3xWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulJ8-00000001VCO-2KX6;
	Tue, 24 Feb 2026 05:50:06 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulJ4-00000001VBo-0cqX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 05:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1771912196; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/C/RjEuENHKQ8NVKZ+XHFLTLUPqm8179r+FfKGRQPEI=;
	b=mJ63lv8j9uuGIyPuyHTIwBJ1yKXvQOVZA9A935RQFQeGJIiOuIE0cYXINL9DyAqHLifVwOAIAxJWAokWYEVRJ7kQHpiLKoB5QvDvM4ulF8BbXLWF/Coae9r2nYyFst/qUG/izonMPPTsthzc48up98RlzdnlT9E39s4R0V8VYYY=
Received: from 30.74.144.111(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WziN4bE_1771912193 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Feb 2026 13:49:54 +0800
Message-ID: <ec92b9a6-d6a6-4b14-9724-b1722d35b69d@linux.alibaba.com>
Date: Tue, 24 Feb 2026 13:49:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] mm: rmap: add a ZONE_DEVICE folio warning in
 folio_referenced()
To: Rik van Riel <riel@surriel.com>, akpm@linux-foundation.org,
 david@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, harry.yoo@oracle.com,
 jannh@google.com, willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 hannes@cmpxchg.org, zhengqi.arch@bytedance.com, shakeel.butt@linux.dev,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
 <e91eaa86a6fbb0682b4e308082048c688a57c035.1771897150.git.baolin.wang@linux.alibaba.com>
 <b3c1c739c233ccb32945ccaffdaf25fd3f96dd59.camel@surriel.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <b3c1c739c233ccb32945ccaffdaf25fd3f96dd59.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_215003_579380_A818E0CB 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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



On 2/24/26 10:38 AM, Rik van Riel wrote:
> On Tue, 2026-02-24 at 09:56 +0800, Baolin Wang wrote:
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index bff8f222004e..be785dfc9336 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1065,6 +1065,7 @@ int folio_referenced(struct folio *folio, int
>> is_locked,
>>   		.invalid_vma = invalid_folio_referenced_vma,
>>   	};
>>   
>> +	VM_WARN_ON_FOLIO(folio_is_zone_device(folio), folio);
>>   	*vm_flags = 0;
>>   	if (!pra.mapcount)
>>   		return 0;
> 
> Should be a VM_WARN_ON_ONCE_FOLIO so we do not cause
> a softlockup if we try to print information about a
> million ZONE_DEVICE pages?

Yes, sounds reasonable. Will do in next version. Thanks for reviewing.

