Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D3210A62CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGCrqVeDFgkXxXWc1OYeUWAPGhYE+zrHxSlgAWr0ZXA=; b=PGcNjXlnmrZMLhFdiicd+8B2Cz
	eW9VHk66w9ZnZCGftDLji3E64E15230RaxKKmFbHgCohbn1C9q60BzbAJ5vYS7Z2Ua9vZFtj3BsPF
	xWojN2UhZuaVKo24Zgi6lHzAsaVnRDi1je+uEI6owdiE1SONO6acrh+brtrNQHfsokxYK7RjcaKYc
	J6Ppvo8HUMQRb+SS6skfi+aCaYRHssqxzWiczjNy4cJWGtOJ6hA6i5D2yeQ2n0N8J9oeBNA0zpyLT
	oMab0Q9DDxJ+VNP2eb2xSSjt3slZSvLhId5DbwFMOcWhOvipijYvvfbnIFijR7YXcvAtTDyHL6xmj
	9kLPEoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kXZ-00000005Wis-1zfP;
	Thu, 26 Mar 2026 13:14:25 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kXW-00000005Wi4-0iBN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:14:24 +0000
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fhPGr210jznTVZ;
	Thu, 26 Mar 2026 21:08:36 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 439F840568;
	Thu, 26 Mar 2026 21:14:03 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 26 Mar
 2026 21:14:02 +0800
Message-ID: <ff1c030a-075e-4693-bad6-404428289301@hisilicon.com>
Date: Thu, 26 Mar 2026 21:14:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/10] devfreq: Fix NULL pointer dereference when a
 governor module is unloaded
To: <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <tianyaxiong@kylinos.cn>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<zhenglifeng1@huawei.com>, <zhangpengjie2@huawei.com>,
	<lihuisong@huawei.com>, <prime.zeng@hisilicon.com>
References: <20260326123428.800407-1-zhanjie9@hisilicon.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20260326123428.800407-1-zhanjie9@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_061422_431455_8CADBCF7 
X-CRM114-Status: GOOD (  10.64  )
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



On 3/26/2026 8:34 PM, Jie Zhan wrote:
> When compiled as a kernel module, the governor module can be dynamically
> inserted or removed.  'devfreq->governor' would become NULL if the governor
> module is removed when it's in use, and NULL pointer dereference would be
> triggered.  A similar issue was also reported in [1].
> 
> To address this issue:
> 
> Patch 1-5 rework mutex, factor out a common governor setting function, and
> clean up some unreachable code.
> 
> Patch 6-8 prevent a governor module in use from being removed (except for
> force unload) by getting/putting a refcount of the governor's module when
> switching governors.
> 
> Patch 9-10 allow 'governor' and 'available_governors' to work normally even
> when a governor module in use is force unloaded.
> 
> Note that this series is based on [1] or devfreq-next, otherwise code
sorry, based on [2] or devfreq-next
> would conflict.
> 
> [1] https://lore.kernel.org/all/20260319091409.998397-1-tianyaxiong@kylinos.cn/
> [2] https://lore.kernel.org/all/20251216031153.2242306-1-zhangpengjie2@huawei.com/

