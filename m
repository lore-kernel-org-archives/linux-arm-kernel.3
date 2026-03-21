Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB441099B3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 05:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcTvfZxxxHTOO8PPQsyM51dY96hQcI/WjTannbuBJtg=; b=GEoNhLZOLE9RWCg9zfoKGAdO5f
	0tnYE6A2Buh2k60BDR1tHclMd4w9wJRB55hooJdF5XPRDT2hrAqoqSQqDB9GXGaUOLGm606P9zImD
	zndUhinbx3cItBfOcgJ5DdJvbEC3rYCLQzLcfOk6eF22YbC0JlZ3PyGQMhNXszA7vf08p53l9lNj1
	gETdxh8/s/9lLXlojSSakeZM+jwb3C2mc5EFmWRnQuTO+eTef/im1HQrUuK3TygextKxx5NjBD36/
	texynIG5vNsmuW8+EduRNapPDiaOTvs8ziIKPOcbjUmeUNfuiyiqe2W230oBfwd0AOAdu/ZgSkn7v
	Bdi472/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ons-0000000E5Om-0ES6;
	Sat, 21 Mar 2026 05:23:16 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ono-0000000E5Ns-2tp9;
	Sat, 21 Mar 2026 05:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774070580; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=PcTvfZxxxHTOO8PPQsyM51dY96hQcI/WjTannbuBJtg=;
	b=cWDBSUE/tepERALZ2ykFloPnctop6WWA9ukA35FIzoCi3Y4uX/cTlTu1e1Z3hxfYLKSecBvQDmOvyF8vmZWc0DOiJG9F7ZFrNlvjMAW50VREDlAoIZ6y0TPFVhtWB58eWfzQDEw4MrJ4MiZK/maoFf0EB7GJSFW7t37rukN+snI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X.O-uAP_1774070572;
Received: from 30.42.98.36(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.O-uAP_1774070572 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 21 Mar 2026 13:22:53 +0800
Message-ID: <a9c48aca-fd2b-4b01-95d2-62607594d236@linux.alibaba.com>
Date: Sat, 21 Mar 2026 13:22:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] mm: change to return bool for
 ptep_test_and_clear_young()
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <3fa94c3c89fd93fe22c8cb59967f064787d686aa.1773890510.git.baolin.wang@linux.alibaba.com>
 <ikarxctf.ritesh.list@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ikarxctf.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_222312_937767_C8631268 
X-CRM114-Status: UNSURE (   9.62  )
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



On 3/20/26 1:57 PM, Ritesh Harjani (IBM) wrote:
> Baolin Wang <baolin.wang@linux.alibaba.com> writes:
> 
>> Callers use ptep_test_and_clear_young() to clear the young flag and check
>> whether it was set. Change the return type to bool to make the intention
>> clearer.
>>
> 
> Right I checked all callers of ptep_test_and_clear_young(). I agree, we
> only need bool here.
> 
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h             |  8 ++++----
>>   arch/arm64/mm/contpte.c                      |  4 ++--
>>   arch/microblaze/include/asm/pgtable.h        |  2 +-
>>   arch/parisc/include/asm/pgtable.h            |  6 +++---
>>   arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ++--
>>   arch/powerpc/include/asm/book3s/64/pgtable.h |  6 +++---
>>   arch/powerpc/include/asm/nohash/pgtable.h    |  4 ++--
> 
> I looked at it because of powerpc changes, but ended up looking into all
> call sites anyways. So overall it LGTM (and I agree that we can remove
> the unnecessary externs from function declarations)
> 
> With that please feel free to add:
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thanks for reviewing. Will remove externs:)

