Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D824AC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzRT8jBvReA8qpY7iM9/dNV3pmOj1w0QrDU2oe70EEA=; b=mD2xM4xkU1wH65XEIOCtyuq1n3
	T8Pw6vkBlFCOd6tjCGzL998r/2H3fvUAN3UNQLtsm3oRwfEl8tU4SpBgd4oNx0OEURfQNlc+gKaoV
	vGcCUY845DvDJRdhOjl+xoSM6O5rnAA/zV0KD4bNNPoZQawTBZywqrm4CczbF8w6Lpc76R15QkSDg
	0cUCmf/nHmqN8OMvpfYruy3NiNLXTkNeo34SYFok/CqwWm4bXLeSbIExVe7/N2e2pODzA9sRatvYk
	LCGIAhENbJOki8C9Gwed5VBKoMyAwa/5RnX6W6IQLknUmzfJvAoAJZc9cjU623454ei6vFLeA3bnG
	bwoaJKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2Dp-0000000Dpgc-3lsR;
	Fri, 14 Mar 2025 10:24:57 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1xo-0000000Dmad-0eae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:08:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZDg6d5BCHz1d08f;
	Fri, 14 Mar 2025 18:08:09 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id C6C291800E4;
	Fri, 14 Mar 2025 18:08:16 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Mar 2025 18:08:16 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 14 Mar
 2025 18:08:15 +0800
Message-ID: <40b9c172-2bbb-a048-643b-1493aa874b65@huawei.com>
Date: Fri, 14 Mar 2025 18:08:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] soc: hisilicon: kunpeng_hccs: Fix incorrect string
 assembly
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <liuyonglong@huawei.com>
References: <20250314082856.3257783-1-lihuisong@huawei.com>
 <20250314100136.0000416f@huawei.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20250314100136.0000416f@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_030824_341501_44FD0A38 
X-CRM114-Status: GOOD (  10.21  )
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


在 2025/3/14 18:01, Jonathan Cameron 写道:
> On Fri, 14 Mar 2025 16:28:56 +0800
> Huisong Li <lihuisong@huawei.com> wrote:
>
>> String assembly should use sysfs_emit_at() instead of sysfs_emit().
>>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> Fixes tag?
ok, will add it.
>
> Otherwise looks good to me.
>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
>> ---
>>   drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
>> index 8aa8dec14911..444a8f59b7da 100644
>> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
>> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
>> @@ -1539,8 +1539,8 @@ static ssize_t used_types_show(struct kobject *kobj,
>>   	u16 i;
>>   
>>   	for (i = 0; i < hdev->used_type_num - 1; i++)
>> -		len += sysfs_emit(&buf[len], "%s ", hdev->type_name_maps[i].name);
>> -	len += sysfs_emit(&buf[len], "%s\n", hdev->type_name_maps[i].name);
>> +		len += sysfs_emit_at(buf, len, "%s ", hdev->type_name_maps[i].name);
>> +	len += sysfs_emit_at(buf, len, "%s\n", hdev->type_name_maps[i].name);
>>   
>>   	return len;
>>   }
> .

