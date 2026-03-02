Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E239D58E47
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 03:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6qxHDNamani4Rg1V5azVGzGRjelNSeNo5w5yKlUqHQ=; b=kUeaGWdKQGC7zdYcSExFWzMhFU
	conG+qwcm9DehYUrYztTcmNmQYyOEyADeUFkJMcNadgJNI6s0aH3OdzJkeG+DP0uHlHC421lkXe4a
	qudxa6WLxzK6BgaZfFx35MZWS48yBDWebsyycKQSsHGBB6vgUpLuCUIOjIUK2ya3b569QgItyVB31
	NYT2hWy7ewWqi0+yQ8+kdliRHl7glwGqd96F9jya3Q3LxA9NNLt1jZ0yICwe18MZuW2xRTalBcmuw
	hLqgEFkFAn5lGL2qP2KCaCb5wFuEhd81K8M94YOx832KRLW4pKaVAKLD7bMGm5SL62BYGoNACH6QH
	H1bzwGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwu9A-0000000CBo0-2TNC;
	Mon, 02 Mar 2026 03:40:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwu99-0000000CBnq-0jSK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 03:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z6qxHDNamani4Rg1V5azVGzGRjelNSeNo5w5yKlUqHQ=; b=OVbC41MT/xjfuYerUcOaxLW6GH
	O1pLsGuIUV5B3N11Je/WxnNhNI3fo3zRgZzN8tMYuF89LfduHDMx9DfLBnqLICsfLTWpHOBT2auh9
	gh4Y+4Vh3KJkewcSMSme2+YiU1l/pAsATMeonmM+cX0i5oUG6knfym4o9BETe+9HZI3wBr65qQySS
	mVNXVL/rjUbd8PM8RsoVPihBKYobQhf49vq73Cg/S3EOh0X5Wy++bk/y5RyK3gKZXhqckxtqp/2pq
	X9AFDos70ZQgBmBiUfX97dn8Yn05j9jZM5Wd4ATJYVRZ2gGNu0zdaI2Ua20IScKQUFBV9pDSoZKYs
	r7CdCeAw==;
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwu95-0000000GkMC-0KeS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 03:40:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=z6qxHDNamani4Rg1V5azVGzGRjelNSeNo5w5yKlUqHQ=;
	b=JVS6HrRxQxci4t6bQUaAwzn3eLdmgzPn9moU1lQdLRPZmjcKXZyTq3nOdTP8GHP8Lwv03hF4D
	miWYwmvSxwLb9ZxiOXInxGM5291im/E47ssBnrAE/S0hticPBWXA0unJpK1rQ2zQLBEkZANOXMg
	q8ryAQvJO+tVd86EP9/pHKQ=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fPPhZ07tMzmV7B;
	Mon,  2 Mar 2026 11:35:26 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A924C4056D;
	Mon,  2 Mar 2026 11:40:16 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 2 Mar 2026 11:40:15 +0800
Message-ID: <f0caa8dc-86dd-49fb-a879-a6be6caac400@huawei.com>
Date: Mon, 2 Mar 2026 11:40:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftest/arm64: Fix sve2p1_sigill() to hwcap test
To: Mark Brown <broonie@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>, <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260227031933.4103333-1-wuyifan50@huawei.com>
 <20260227031933.4103333-3-wuyifan50@huawei.com>
 <aaLv_X7SihBUX5c_@sirena.co.uk>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <aaLv_X7SihBUX5c_@sirena.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_034035_551259_294A1271 
X-CRM114-Status: GOOD (  15.03  )
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

On 2/28/2026 9:39 PM, Mark Brown wrote:
> On Fri, Feb 27, 2026 at 11:19:33AM +0800, Yifan Wu wrote:
>> The FEAT_SVE2p1 is indicated by ID_AA64ZFR0_EL1.SVEver. However,
>> the BFADD requires the FEAT_SVE_B16B16, which is indicated by
>> ID_AA64ZFR0_EL1.B16B16. This could cause the test to incorrectly
>> fail on a CPU that supports FEAT_SVE2.1 but not FEAT_SVE_B16B16.
>>
>> LD1Q Gather load quadwords which is decoded from SVE encodings and
>> implied by FEAT_SVE2p1.
> Ah, good spot - I think my search for instructions to use got confused
> by them mention of SVE2 in the description of BFADD.  Since this is a
> fix it should really be patch 1.
>
>> -	/* BFADD Z0.H, Z0.H, Z0.H */
>> -	asm volatile(".inst 0x65000000" : : : "z0");
>> +	/* LD1Q Z0.Q, P0/Z, Z0.D, X0 */
> That should be:
>
> 	LD1Q {Z0.Q}, P0/Z, [Z0.D, X0]
>
> (the existing asm has some issues which we ought to get round fixing but
> may as well keep the new stuff good.)
>
>> +	asm volatile(".inst 0xC400A000" : : : "z0");
> Verified the decode with objdump.  With the above change to the comment:
>
> Reviewed-by: Mark Brown <broonie@kernel.org>
Thanks a lot for the review and the tag! I'll update the comment and re-
order the patches in v2.

Regards,
Yifan Wu

