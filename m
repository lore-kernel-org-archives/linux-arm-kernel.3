Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E94D58E47
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 03:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebc2xyrRyErhkT8LzvrdxHoB7dac5yeu5XdhGFduWAM=; b=C1CoZoVhOEUd3ZktL3KW7DoGby
	SoTNqjUvTuu8cq1VIKlD3hpYD+andIBfvpLfFlKxajCOXLf+oTmwoNSqT5lNgOoGd4cTgct5Ifvrg
	nCnKIplX/0tN/ZhuvSicG9mE/XOB434ahWX7YA0Tx99nNu0jx+3q0wqqpEm3GZ/J1SDrjJqpd26MJ
	Qr1G2i/QLuHHC6nH897vBXI4X8rqGu73RN6DOb4YOoAUHI1udgrvxDGjOh9/6lTordZ+g/nmt2QjV
	Ong5/RA5dV3i2RN482a33s8CNEqcQfGiOb+msRUaQI6+ta/gA2KdV7Znm9x2jb2ItDkt7MabL7SR8
	Ct8no2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuJ6-0000000CCTz-3ALe;
	Mon, 02 Mar 2026 03:50:56 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuJ4-0000000CCTF-10xE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 03:50:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ebc2xyrRyErhkT8LzvrdxHoB7dac5yeu5XdhGFduWAM=;
	b=doUGLJfXUykL5SCzxoXi8i0ghUoqhoUOUz1xbYrq8TewnsQ/smWtiFkvjRR5gaA81FbnreBFB
	RUSVavbSKPVFfU00b/KLNnEQ3zB6fgu8ts8J324gp2KsSp7vDqZmQ9FQjUDMHMVDBMc4dqnN5Ns
	Zpcr7KPXJYVTqTpaRxbx9n8=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fPPwG4JnczcZxn;
	Mon,  2 Mar 2026 11:45:34 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A6DC4036C;
	Mon,  2 Mar 2026 11:50:44 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 2 Mar 2026 11:50:43 +0800
Message-ID: <3400c77a-8af2-4c06-8d8a-e718b6f72cfb@huawei.com>
Date: Mon, 2 Mar 2026 11:50:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests/arm64: Implement cmpbr_sigill() to hwcap
 test
To: Mark Brown <broonie@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>, <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260227031933.4103333-1-wuyifan50@huawei.com>
 <20260227031933.4103333-2-wuyifan50@huawei.com>
 <aaLsU2sBQh3nW9c6@sirena.co.uk>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <aaLsU2sBQh3nW9c6@sirena.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_195054_819611_8B65F8D6 
X-CRM114-Status: GOOD (  10.28  )
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

Hi Mark,

On 2/28/2026 9:23 PM, Mark Brown wrote:
> On Fri, Feb 27, 2026 at 11:19:32AM +0800, Yifan Wu wrote:
>
>>   static void cmpbr_sigill(void)
>>   {
>> -	/* Not implemented, too complicated and unreliable anyway */
>> +	/* CBEQ x0, x0, +8 */
>> +	asm volatile(".inst 0x74C00040" : : : "x0");
>> +	/* UDF #0 */
>> +	asm volatile("udf #0" : : : );
>>   }
> I don't expect it to make a difference but it'd be nice if these were a
> single asm volatile statement, just to make it absolutely clear that no
> instrumentation or anything is supposed to go between the two.
Thanks for the review. That's a good point, I'll combine them in v2.

Regards,
Yifan Wu

