Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B75CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 01:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1T6q+bU+4SE3b8DbUpUDY+ZGz+nJwHqsg4RxW3JE0Ug=; b=dov8RpOzHFY7Xkbj7sS+lR8E+Y
	5oe+6qLWymgAydgzKQ5LJSYBaiSFm6LU43nFBEdibdzCwT4qIBhmVlc0F2eSY1WtaY8Hrjxslt+LP
	C8tD+G4uieU7L+v7X6wilb59E4nPzfkRvSYvHnbkV91E9S/6ADxnMlz4sGt08J7nktgcMkGWxdP4N
	8TukFZsaYFQQSSA1wA+OPLydl9azizO5Otv4cdBK9fTS86vkSiHMBcaDdTwh1ISKg6WPfP4a1mpw+
	hTe5dt/xpsLvUqg9tTMOqSL6mRkuJpdxf040F8gSAnBqxkCIapZvd/0GSVqObXyQhfyZ2N+YlIZLR
	Dggw9E+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTrsS-0000000A2JT-3BEY;
	Mon, 01 Jun 2026 01:55:40 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTrsO-0000000A2Ic-43YU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 01:55:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gTH0D21PCz1cyPZ;
	Mon,  1 Jun 2026 09:47:40 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 9254A4056C;
	Mon,  1 Jun 2026 09:55:27 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Jun
 2026 09:55:26 +0800
Message-ID: <1a12e1cb-d30c-4da9-81d1-46b1bb4a30d2@hisilicon.com>
Date: Mon, 1 Jun 2026 09:55:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] devfreq: Factor out devfreq_set_governor()
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>, <cwchoi00@gmail.com>,
	<cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <tianyaxiong@kylinos.cn>,
	<zhangpengjie2@huawei.com>, <lihuisong@huawei.com>,
	<prime.zeng@hisilicon.com>
References: <20260519113251.3745140-1-zhanjie9@hisilicon.com>
 <20260519113251.3745140-4-zhanjie9@hisilicon.com>
 <fdc3886e-7e5b-46e3-a1c9-48e2c2b596c9@huawei.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <fdc3886e-7e5b-46e3-a1c9-48e2c2b596c9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_185537_342410_1A1CC31B 
X-CRM114-Status: GOOD (  18.76  )
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



On 5/21/2026 4:06 PM, zhenglifeng (A) wrote:
> On 5/19/2026 7:32 PM, Jie Zhan wrote:
>> governor_store() and devfreq_add_device() contain similar logic for setting
>> a governor when devfreq->governor is NULL.  Merge this into a common
>> function, devfreq_set_governor(), to reduce code duplication and unify the
>> entry of setting governors.
>>
>> This also prepares for further changes that get / put a module refcount of
>> the active governor and prevent the governor module from being unloaded
>> while it's in use.
>>
>> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
>> ---
>>  drivers/devfreq/devfreq.c | 117 ++++++++++++++++++--------------------
>>  1 file changed, 56 insertions(+), 61 deletions(-)
>>
>> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
>> index 53c40d795a13..9e3e6a7348f8 100644
>> --- a/drivers/devfreq/devfreq.c
>> +++ b/drivers/devfreq/devfreq.c
>> @@ -318,6 +318,59 @@ static struct devfreq_governor *try_then_request_governor(const char *name)
>>  	return governor;
>>  }
>>  
>> +static int devfreq_set_governor(struct devfreq *df,
>> +				const struct devfreq_governor *new_gov)
>> +{
>> +	const struct devfreq_governor *old_gov;
>> +	struct device *dev;
>> +	int ret;
>> +
>> +	lockdep_assert_held(&devfreq_list_lock);
>> +
>> +	old_gov = df->governor;
>> +	dev = &df->dev;
>> +
>> +	if (old_gov) {
>> +		if (old_gov == new_gov)
>> +			return 0;
>> +
>> +		if (IS_SUPPORTED_FLAG(old_gov->flags, IMMUTABLE) ||
>> +		    IS_SUPPORTED_FLAG(new_gov->flags, IMMUTABLE))
>> +			return -EINVAL;
>> +
>> +		/* Stop the current governor */
>> +		ret = df->governor->event_handler(df, DEVFREQ_GOV_STOP, NULL);
>> +		if (ret) {
>> +			dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
>> +				 __func__, df->governor->name, ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	/* Start the new governor */
>> +	df->governor = new_gov;
>> +	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
>> +	if (ret) {
>> +		dev_warn(dev, "%s: Governor %s not started(%d)\n",
>> +			 __func__, df->governor->name, ret);
>> +
>> +		/* Restore previous governor */
>> +		df->governor = old_gov;
>> +		if (!df->governor)
>> +			return ret;
>> +
>> +		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
>> +		if (ret) {
>> +			dev_err(dev, "%s: restore Governor %s failed (%d)\n",
>> +				__func__, df->governor->name, ret);
>> +			df->governor = NULL;
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return sysfs_update_group(&df->dev.kobj, &gov_attr_group);
> 
> Here is a little problem which is not introduced by this patch. When
> starting new governor fails but restoring old governor succeeds, this
> function will return 0. This might lead users to believe that the governor
> has been successfully modified.
> 
Yes, good catch.  This suppresses the error code.

I think, from a quick glance, the path of restoring the old governor should
discard the return value of event_handler() and skip updating sysfs.

