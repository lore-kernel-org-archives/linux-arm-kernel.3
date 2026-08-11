Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73D6C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UaKxJipLpPfFvv6BArJuqZGXT9Pu6iR5SAiWFJFjl0=; b=fqMRi4/i9VOgz1EajDGMu+oUkn
	tF1u9gmb84sGugSzQqM/BQmWVh0pwv52T8Ptv7ysn3GKiAhLRRwNsvZwcdiq+ByNVjKMQIK7gUkRC
	+JEFEnNNSlKnUwsZ5iGoMeCIIHFs/JwsbxoZ4PhmvwklJCAiz7VuPU2cUcgciYpU86cueC3Xwc0lu
	9J0WBYvWIe9wVnyBkujP1eXrYN81HUItPe0EK9q5xQnOTrWUtNJmt1DuOYZedjXe4TwEU4fSEWi+B
	Om8MPQfB259v8p6naDr3M4Ym07xqqMxo5HTNX/OSvewAZZWwTRtc1v5VfwtSrn7UtDrEi0mLmmqpn
	oQhD0Dsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wth5z-0000000DXhr-0TBk;
	Tue, 11 Aug 2026 07:40:23 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wth5v-0000000DXhY-072X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 07:40:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2UaKxJipLpPfFvv6BArJuqZGXT9Pu6iR5SAiWFJFjl0=;
	b=SnqCgbEgm7tAjqzLrNGfO3YDkAxZpCQsJGZfHB4y9HuXMxqv9Ofr2yjskzCTgJquHDanUFP0k
	w+fhrHWFFIfqlePMrjI+caZhLjvks/IRMZ2Njn/JJD9uYAH6Y6kx6D5dego2PGyE+WI1ZgeYWaD
	VBf3I07VzT0ZGqkSK1p1f7U=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hK3DM52QLzcb1N;
	Tue, 11 Aug 2026 15:29:55 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id E9D6E4057F;
	Tue, 11 Aug 2026 15:40:00 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Aug 2026 15:40:00 +0800
Message-ID: <6ac531ab-2a9e-430d-822c-9528971a5cad@huawei.com>
Date: Tue, 11 Aug 2026 15:39:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/45] arm64: interrupts: Add common exception
 state helpers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-13-vladimir.murzin@arm.com>
 <e93ae08b-64e2-4128-b1fd-910c4d197dbd@huawei.com>
 <86ebda30-26ad-438b-9f98-2ea9e3849cd8@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <86ebda30-26ad-438b-9f98-2ea9e3849cd8@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_004019_703644_116973C7 
X-CRM114-Status: UNSURE (   7.75  )
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



在 2026/8/3 17:40, Vladimir Murzin 写道:
> Hi Jinjie,
> 
> On 7/28/26 09:20, Jinjie Ruan wrote:
>> Hi Vladimir,
>>
>> Using two tables as below to map different contexts to the hwstate
>> status makes the code appear more concise and clear. What do you think?
> 
> I think I already tried something like that and IIRC it hurts code
> generation...  I'll have another look before posting next version.

Thank you for very much.

> 
> Cheers
> Vladimir
> 


