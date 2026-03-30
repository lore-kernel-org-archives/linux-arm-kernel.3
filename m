Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17E1FF494D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 06:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtR6QSUB2ScaqwPTh7aokVfbXtyto+oCSqungSTj/GA=; b=Qqxnm2SvBUMv0TbcNrhctmH07b
	2PbzJ9KbdeN/CaKDKLVEUzNbPcyXfsEI5NlY/uP6JzcIJjo/DZzf26MCR+8fJIKcBGbA0sZpc5mpx
	z7SLRc/EPdWmTFWWZCPlrX1fBJBhUah7TBim8un7TckuBrkIv+dB6d8NCW7FniFJOC8GNKO4R97CT
	rpe9cYLyQdrCpG4todyJdSUbHp42FJOtV4MguLyJPf3gt3IgUf3+TF4hvxeHZNd3Vl3t+35eIC2t3
	OfRWJwqHqV+WUDBSdlkOvRm2TNBG/dVD9Ei1/1WzSLWVM9DOiWifNZunZHSbDAeJG930heHliW6ss
	0lm/sAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76HU-0000000Ai4y-3zgw;
	Mon, 30 Mar 2026 06:39:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76HT-0000000Ai4q-2XZH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 06:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MtR6QSUB2ScaqwPTh7aokVfbXtyto+oCSqungSTj/GA=; b=rAm8hU9PlZW2LDNqMZp6A+uTHc
	eNE60ZsZs2VBhKz3iBvVkBgyvTgsEd5PuIXlUAkKQ0JoAn5NEcUMiYxgEUAXDlHMiDah5aa98ln4h
	BBBrEQnv6W1MvOiUplwH8zs2pcGKMS3fkcdHNDQzNpKz88D+6YQWrhEJTcgWdRKcVY8UO+68b5THE
	0b/ttVfoKVVOcGjGHpFX7VgU/lA8jFGR6IzeEOB2U+/1d5KCppXtwsoOhwxfk1QnoxtDq3CaREkW9
	Xj/PGqsFfFpWAi+ejy29Tth4Mlygk4fuRUyrmRtE48TiCueGK3qMkpIwEWg1oMjE/brcKGW45bU4q
	927Akziw==;
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w769d-0000000D968-1QH8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 06:36:56 +0000
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fkh5D18SWzLm2K;
	Mon, 30 Mar 2026 14:23:12 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id DF2C240565;
	Mon, 30 Mar 2026 14:29:19 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Mar
 2026 14:29:19 +0800
Message-ID: <47b32b11-fbc8-4e9c-9b04-da3d1465ae7c@hisilicon.com>
Date: Mon, 30 Mar 2026 14:29:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/10] devfreq: Fix NULL pointer dereference when a
 governor module is unloaded
To: Yaxiong Tian <tianyaxiong@kylinos.cn>, <cw00.choi@samsung.com>,
	<myungjoo.ham@samsung.com>, <kyungmin.park@samsung.com>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<zhenglifeng1@huawei.com>, <zhangpengjie2@huawei.com>,
	<lihuisong@huawei.com>, <prime.zeng@hisilicon.com>
References: <20260326123428.800407-1-zhanjie9@hisilicon.com>
 <1774576755240654.100.seg@mailgw.kylinos.cn>
 <2f9ab345-5940-4298-87a5-bf9121fe219e@kylinos.cn>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <2f9ab345-5940-4298-87a5-bf9121fe219e@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_073346_306357_29AC3631 
X-CRM114-Status: GOOD (  17.90  )
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



On 3/27/2026 10:06 AM, Yaxiong Tian wrote:
> 
> 在 2026/3/26 21:14, Jie Zhan 写道:
>>
>> On 3/26/2026 8:34 PM, Jie Zhan wrote:
>>> When compiled as a kernel module, the governor module can be dynamically
>>> inserted or removed.  'devfreq->governor' would become NULL if the governor
>>> module is removed when it's in use, and NULL pointer dereference would be
>>> triggered.  A similar issue was also reported in [1].
>>>
>>> To address this issue:
>>>
>>> Patch 1-5 rework mutex, factor out a common governor setting function, and
>>> clean up some unreachable code.
>>>
>>> Patch 6-8 prevent a governor module in use from being removed (except for
>>> force unload) by getting/putting a refcount of the governor's module when
>>> switching governors.
>>>
>>> Patch 9-10 allow 'governor' and 'available_governors' to work normally even
>>> when a governor module in use is force unloaded.
>>>
>>> Note that this series is based on [1] or devfreq-next, otherwise code
> 
> Sorry, please ignore the "remember to CC me on the patches." in my previous email.
> 
>  In my opinion, it would be better to prioritize the FIX first before proceeding with the lock mechanism optimizations and other work. This would make it easier to backport the patches to lower-version kernels. I noticed the patch is already in the devfreq-testing branch. I hope the FIX work can be moved forward smoothly to resolve the null pointer and other bugs. Thank you!

Hi Yaxiong,

I don't think this issue is urgent because it can only possibly happen when
governors are built as loadable modules, which is typically used for
development rather than production.

For downstream kernels, feel free to go ahead with quick fixes.  For the
upstream kernel, however, I'd prefer to make the devfreq core clean and
sensible.

Your approach is to prevent kernel panics when unloading governor modules
before changing governors.

This patchset achieves that, and additionally let userspace get a friendly
warning when trying to remove a governor module in use, e.g. 
"rmmod: ERROR: Module governor_performance is in use".
This requires using the module refcount stuff, and brings out a set of
cleanups and refactoring.  BTW, cpufreq implements a similar mechanism like
this.

I may carry your fourth patch that changes the return code of
governor_show() in v2 and address some Sashiko review comments along the
way.

Please let me know if this works for you?

Regards,
Jie
> 
> 
> 
>> sorry, based on [2] or devfreq-next
>>> would conflict.
>>>
>>> [1] https://lore.kernel.org/all/20260319091409.998397-1-tianyaxiong@kylinos.cn/
>>> [2] https://lore.kernel.org/all/20251216031153.2242306-1-zhangpengjie2@huawei.com/

