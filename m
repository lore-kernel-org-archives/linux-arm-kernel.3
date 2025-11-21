Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EF5CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 02:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvGwMGMKZDJGNPIT1jLLqTNctl+weWy3Y4+e0H1IZtc=; b=EUuiCYH2EAjd4ocHadpihFAy+O
	CCXrxwwjx/+bTfbaSVEQyJLqVb/FpKDKkB7x5p7g+zWZb/xs2utvwCrDYp2M8dEDeqdfm0krFub4i
	GvrhEL58hRq/lHIKnFNp+wiD7XpmZRjt4IxllyrSTe4hxu/8qOe68qD2uiKaNpP7A1HXNrzRFvGD+
	va7VqtavRVNFGR0HX+eDW3WDw+E6XcV5oe/FbNZP0o9A5vRyXWzazaH2hk9IbEUyKzVos5bvlSa9k
	VmOjXr3pUeeDOY1eP7R0oZ8sBxSGtaARUKU3NDihSTlbIHTgDmT/sFv230AVIQInnAgd0QnVtdnF0
	uDqo6uFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMH4k-00000007hjN-3Kf9;
	Fri, 21 Nov 2025 02:40:42 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMH4h-00000007hiw-3L8H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 02:40:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cvGwMGMKZDJGNPIT1jLLqTNctl+weWy3Y4+e0H1IZtc=;
	b=GUv6hxJ8TP3+vZcwVdOKnGIei1bKOvWunHAFZXT4W/eDV/taZTzOV18gPMAyuIZWq/C8fc0HW
	LvYfCWnGsm1JYNWVSbEnDDll7321mLZ3mkRddHZcaWbNn6td+rMbr+3MiZGahHE8xOWl6US1kBb
	EbuHvPv5ukcS7VHpLGbf8po=
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dCKCr4410z1K96B;
	Fri, 21 Nov 2025 10:38:48 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id B88EC140119;
	Fri, 21 Nov 2025 10:40:31 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 21 Nov 2025 10:40:31 +0800
Subject: Re: [PATCH] arm64: acpi: Fix incorrect check for default console
 message
To: Will Deacon <will@kernel.org>, Punit Agrawal
	<punit.agrawal@oss.qualcomm.com>
CC: <catalin.marinas@arm.com>, <chenl311@chinatelecom.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251027141941.3089914-1-punit.agrawal@oss.qualcomm.com>
 <aQN0YWUYaPYWpgJM@willie-the-truck>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <3d79dd24-b11b-7a21-d24b-3c6f85d54c0a@huawei.com>
Date: Fri, 21 Nov 2025 10:40:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <aQN0YWUYaPYWpgJM@willie-the-truck>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_184040_378883_5424B74B 
X-CRM114-Status: GOOD (  14.33  )
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

On 2025/10/30 22:21, Will Deacon wrote:
> On Mon, Oct 27, 2025 at 02:19:41PM +0000, Punit Agrawal wrote:
>> bad3fa2fb920 ("ACPI: Suppress misleading SPCR console message when
>> SPCR table is absent") mistakenly assumes acpi_parse_spcr() returning
>> 0 to indicate a failure to parse SPCR and prints a message to the
>> kernel logs accordingly. In reality acpi_parse_spcr() returns 0 on
>> success and -ERRNO on failure.
>>
>> Fix the faulty check to output the correct logging message.
>>
>> Fixes: bad3fa2fb920 ("ACPI: Suppress misleading SPCR console message when SPCR table is absent")
>> Signed-off-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
>> ---
>> Hi,
>>
>> After sending a patch to fix incorrect parsing of SPCR[0], I was still
>> seeing inconsistent logging on arm64. The result is this nugget.
>>
>> Considering the pointless churn - I wondered if it isn't better to
>> drop the message? If others agree, I can send a patch (and revert
>> bad3fa2fb920 while at it).
> 
> I'd be happy dropping the message as it looks pretty useless to me,
> especially given that the current logic is broken.

Fine with me as well, in the acpi_parse_spcr() there is a default
pr_info() for the console information, we can drop it here.

Thanks
Hanjun

