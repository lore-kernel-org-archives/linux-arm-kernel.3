Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D015C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Cf2vH1o8rKhsUCAj/+YO52CfKDA5k81QOXxCwtWa1U=; b=i5n33OU9iSSN90Q9MjB8bQDyjW
	QHZEETOP75ye1J6rYAEZ+snIH1bvI9IlqMc5TaFMHqN1rjDL8r2D22YSQVO3ZtzzWobWjbKREMQlV
	IPAh/90TuMlHsBrgxT/aPs7GIZgb0pJf379xp1aGcU2PKvoIERdvlOhAa7+SO1Ub71mv8L9C2fcdj
	8F6t/ioBFMDQrxRh7Apfa56rDThGt4E0e2fU/HcAvz/V40X76jekYfz6WA0jFFkRB9KDTjFBcBdW3
	dY9FkiBMlZIOvygQyhAy+lk8xk5HNb7IpH+yZwnntiqemuuXEtSM6e8HU5rOhA+T0bZxpystXmkMd
	ABHiKjfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggYu-0000000CDE3-2aK6;
	Mon, 06 Jul 2026 10:28:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggYs-0000000CDCH-08sY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:28:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EB6D2454;
	Mon,  6 Jul 2026 03:28:18 -0700 (PDT)
Received: from [10.57.82.104] (unknown [10.57.82.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 584373F85F;
	Mon,  6 Jul 2026 03:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783333702; bh=aQrU+SlZhKihLrlFpQQQT6TjJOACS1gGhsITIhYIznw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y0IJAohhsjEaePvuSwntVbuCsrEHaIiins8ebwXRwXsmunGwtLGT/t8S19iJNRoRi
	 ct5GZFZBX7EW2xFu6Do1/m6NeiKec4SD1mjrmD/Msfjs29Z5jjVCsS8YrKM3ReU3p1
	 NtbZLbEmV1kF5KHMi/z6mR33bPit28OYOdpe6Ch4=
Message-ID: <f5541259-cb61-46fc-bd76-a1a07f625e04@arm.com>
Date: Mon, 6 Jul 2026 11:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] perf/arm-cmn: Refactor event filter data
To: Leo Yan <leo.yan@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 ilkka@os.amperecomputing.com
References: <cover.1782830759.git.robin.murphy@arm.com>
 <d638212f5a5993eae5e262dd5be596b8d2b8fa5f.1782830759.git.robin.murphy@arm.com>
 <20260705154438.GA710301@e132581.arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260705154438.GA710301@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_032826_122316_171A6CE5 
X-CRM114-Status: GOOD (  14.92  )
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

On 2026-07-05 4:44 pm, Leo Yan wrote:
> On Tue, Jun 30, 2026 at 04:19:18PM +0100, Robin Murphy wrote:
> 
> [...]
> 
>> +struct arm_cmn_filter_attr {
>> +	enum cmn_filter_select sel;
>> +	u8 val;
>> +};
> 
>> -#define _CMN_EVENT_ATTR(_model, _name, _type, _eventid, _filter, _fsel)\
>> +#define _CMN_EVENT_ATTR(_model, _name, _type, _eventid, _filter, ...)	\
>>   	(&((struct arm_cmn_event_attr[]) {{				\
>>   		.attr = __ATTR(_name, 0444, arm_cmn_event_show, NULL),	\
>>   		.model = _model,					\
>>   		.type = _type,						\
>>   		.eventid = _eventid,					\
>> -		.filter = _filter,					\
>> -		.fsel = _fsel,						\
>> +		.filter = {{_filter}},					\
> 
> This patch might break as the "val" field is never initialized. Should
> it use two parameters "_fa, _fb" instead?

Ah, you're right - this evolved through several different designs, and 
this line is still from when "_filter..." was the whole varargs, but 
then I brought forward more of the changes from patch #5 to try to 
minimise intra-series churn, and I guess the fact that it didn't 
completely fail to compile (as I was accustomed to by that point...) 
meant I missed this subtlety.

> #define _CMN_EVENT_ATTR(_model, _name, _type, _eventid, _fa, _fb, ...) \
>        (&((struct arm_cmn_event_attr[]) {{                              \
>                ...                                                      \
>                .filter = {{_fa, _fb}},                                  \
> 
> Although the issue is fixed by a later patch, I think it is good to
> correct this patch for bisection.

Agreed, I'll fix that for a v2.

Thanks,
Robin.

