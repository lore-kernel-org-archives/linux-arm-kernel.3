Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC75C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 11:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwk+BI46++mQRfC3AlfNr23A+9jAy9KyTdI8CCPcTAI=; b=kGBkmWvZSP2CrHvDpuiWEvILHa
	ZnU8R+q+emUahiUEjp/wpKxO1vnrl3cOkb/YC3DeUUE7sP20slOyCj0O0pcQSqFg63I+pXnSDyq5J
	u0uNfa/FWIMAapVnfiGztGXRxPQdbkEGhHxh0KnHY2ABCH/J1m6uJExACBt2wDfkEo0yx8w4DK6Oj
	J/aGTt0Nq6YEu4IlH6V1qMVdHn+kTErKALPGfB7ew0AErWQgz9k7aeVHgmbwUUzXQDY/nNGRqEFgo
	Vrm/xi7cESpWTBdafiH8gsLLUPh+6moAUtXfGUXeuHbGuaITqg6V19rBJCGhOyaoS6zt9YHgKFZZ5
	uDDQPtFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0HIw-00000006xTM-3fP8;
	Sat, 29 Aug 2026 11:32:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0HIs-00000006xSv-2jbb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 11:32:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gwk+BI46++mQRfC3AlfNr23A+9jAy9KyTdI8CCPcTAI=;
	b=aXgWjF3RCIrF73N2rxm23D543lwf65bN7UvH+g2NVAUDpVegRpfeATmI1PN02/WVWdpSFpa8M
	HWWnQOsJJpTvtR/aOTzTUPlt0KBHGvJmorYqKsCmKC7Tj1nlMNL+LZRwlN2uVVEpzZ6CT8gBQBD
	84eIU0ZhClM0bygV8z+7uEY=
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hXClX0C7TzJ4686;
	Sat, 29 Aug 2026 19:32:08 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A8794058B;
	Sat, 29 Aug 2026 19:32:32 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 29 Aug 2026 14:32:31 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <cl@gentwo.org>
CC: <akpm@linux-foundation.org>, <artem.kuzin@huawei.com>,
	<catalin.marinas@arm.com>, <david@kernel.org>, <liam@infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux@armlinux.org.uk>, <ljs@kernel.org>,
	<mark.rutland@arm.com>, <mhocko@suse.com>, <panov.nikita@huawei.com>,
	<rppt@kernel.org>, <surenb@google.com>, <vbabka@kernel.org>,
	<wangkefeng.wang@huawei.com>, <will@kernel.org>,
	<yang.shi@os.amperecomputing.com>
Subject: Re: [RFC PATCH 00/18] mm: arm64: Add kernel replication feature
Date: Sat, 29 Aug 2026 19:19:53 +0800
Message-ID: <20260829111953.893466-1-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f47c0ab3-6d78-fcdc-b7c0-cd3a7b5c8276@gentwo.org>
References: <f47c0ab3-6d78-fcdc-b7c0-cd3a7b5c8276@gentwo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.11]
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_043255_297461_C08445A7 
X-CRM114-Status: GOOD (  24.19  )
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

Hello, thanks a lot for your reply.

On 8/28/2026 8:58 PM, Christoph Lameter (Ampere) wrote:
> On Fri, 28 Aug 2026, Nikita Panov wrote:
>
>> There were several prior submissions with some sort of replication
>> for NUMA systems, including one from our side for the x86_64 platform.
>> In the last couple years, several research articles related to solving
>> locality issues on NUMA machines through replication emerged as well.
>
> Thank you for this work. This aligns with our efforts to increase data
> locality and the performance of local data access. Yang Shi has a patchset
> that introduces similar code to be able to map partial virtual ranges
> differently. His code may be more mature and I think these mechanisms can
> be used in a straightforward way in future iterations of your patchset.
>
> If we combine our efforts then I think we could be rapidly come to a clean
> implementation that can be merged.
>

I will check these patches in detail and leave some comments during the
following week (or to the v3, if it will be published).
At a first glance, code is definitely more mature and can be reused
for the text replication patches.
It would be great if we merged our efforts to produce something clean
and viable.

>
> Please see Yang Shi's patches. We can provide resources to push this
> functionality forward and have seen significant performance improvements
> with earlier approaches like this. There is significant customer demand as
> well.
>
> https://lore.kernel.org/all/0344c559-1959-4531-9265-d5a5180eb7cd@arm.com/
>

For me, it looks like the kernel text and rodata replication could be
adapted on top of the "Optimize this_cpu_*" patch set.
Problems with pgd synchronizations are the same and should be fixed as well.
Since vmalloc code is used for percpu memory allocations, module replication
might be supported, the only thing that should be taken into account -
data locality.
Consider all of this, we can focus on preparing the new patch series, on top of
the Yang Shi's patches and share it. If that path is ok, we will start.

Thanks again for your input.

BR
Nikita Panov

