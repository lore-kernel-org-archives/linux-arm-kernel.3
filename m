Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACAECCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meUdmos9kizDlu8CgoRudmdRK0uwEePyLqtSln8LbHo=; b=W1wU9mR68dujLR88/dE2XcRMrP
	c4yQPyb8eYrywqUrRUbLHskVjwH0fLNAIAPkwWEzS6D21Wy0IKNXQlofr3KI+sQHUCFXwE9PkCtxU
	QyFwzHkvK6i4WIFWMyvk5E4yB3aWfjNTvDCmN9PhQjs1KHEeLvH0zR9aUaw6uzx287kWM6vBSFTHU
	NNJ0UxB12zxk/X6iXB3d/+8iiitLTESpyw9WQwRybEwP8qzEBj9+9EjneWWaWcq+8bkSier050ClN
	SUvfqKZQ3naEwuIFhZi2w/4fPnngo3AnsyqP1k1eiumniTBvD/WPq89b9uzozJxAEwJnjSEeP6jLi
	eZ0vvODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSCC-00000001dWl-2VdM;
	Wed, 22 Oct 2025 06:19:40 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSC9-00000001dUU-0ClR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 06:19:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=meUdmos9kizDlu8CgoRudmdRK0uwEePyLqtSln8LbHo=;
	b=yzcAOevmafGW2CJiWtKvyITW2LJ0FSsPf5vlpv24nmQwx1dMBCEyfQKIG4DXZSJ14pXFJTIRQ
	Y9oDTQmdM/Pp0jz9qP+qUTHbztfrRFwn8bm2E3likMLSDkJgAYoZBFx1+qpWtRCiZfSJQTpuO8O
	YgSJIrymsljiTMHrBKJ6k7M=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4crzWN1nxqznTWP;
	Wed, 22 Oct 2025 14:18:40 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id 79C4C1A0188;
	Wed, 22 Oct 2025 14:19:21 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Oct 2025 14:19:20 +0800
Message-ID: <b9520113-9236-4157-a4ab-fd6908f1b577@huawei.com>
Date: Wed, 22 Oct 2025 14:19:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mte: Do not warn if the page is already tagged in
 copy_highpage()
To: Yang Shi <shy828301@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com>, Will Deacon
	<will@kernel.org>, David Hildenbrand <david@redhat.com>
References: <20251021181353.3842660-1-catalin.marinas@arm.com>
 <CAHbLzkpd8awNe=bZVv9fTux+Fx-HT8qL4ENZ-uC4YcPjf9e=KQ@mail.gmail.com>
Content-Language: en-US
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAHbLzkpd8awNe=bZVv9fTux+Fx-HT8qL4ENZ-uC4YcPjf9e=KQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf100008.china.huawei.com (7.185.36.138)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_231937_402194_D32B25C9 
X-CRM114-Status: GOOD (  20.86  )
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



On 2025/10/22 3:00, Yang Shi wrote:
> On Tue, Oct 21, 2025 at 11:14 AM Catalin Marinas
> <catalin.marinas@arm.com> wrote:
>>
>> The arm64 copy_highpage() assumes that the destination page is newly
>> allocated and not MTE-tagged (PG_mte_tagged unset) and warns
>> accordingly. However, following commit 060913999d7a ("mm: migrate:
>> support poisoned recover from migrate folio"), __folio_mc_copy() is

no "__" prefix

>> called before __folio_migrate_mapping(). If the latter fails (-EAGAIN),
>> the copy will be done again to the same destination page. Since
>> copy_highpage() already set the PG_mte_tagged flag, this second copy
>> will warn.
>>
>> Replace the WARN_ON(page already tagged) in the arm64 copy_highpage()
>> with a comment.
>>
>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>> Reported-by: syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com
>> Link: https://lore.kernel.org/r/68dda1ae.a00a0220.102ee.0065.GAE@google.com
>> Cc: <stable@vger.kernel.org> # 6.12.x
>> Cc: Will Deacon <will@kernel.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   arch/arm64/mm/copypage.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
>> index a86c897017df..40749d0a385c 100644
>> --- a/arch/arm64/mm/copypage.c
>> +++ b/arch/arm64/mm/copypage.c
>> @@ -51,8 +51,13 @@ void copy_highpage(struct page *to, struct page *from)
>>                  }
>>                  folio_set_hugetlb_mte_tagged(dst);
>>          } else if (page_mte_tagged(from)) {
>> -               /* It's a new page, shouldn't have been tagged yet */
>> -               WARN_ON_ONCE(!try_page_mte_tagging(to));
> 
> I think you should remove the WARN_ON_ONCE in the above hugetlb chunk
> too IIUC. migrate_huge_page_move_mapping() does the similar thing.
> 

Yes, it's better to remove WARN_ON_ONCE for hugetlb too.

> Thanks,
> Yang
> 
>> +               /*
>> +                * Most of the time it's a new page that shouldn't have been
>> +                * tagged yet. However, folio migration can end up reusing the
>> +                * same page without untagging it. Ignore the warning if the
>> +                * page is already tagged.
>> +                */
>> +               try_page_mte_tagging(to);
>>
>>                  mte_copy_page_tags(kto, kfrom);
>>                  set_page_mte_tagged(to);
>>


