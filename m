Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABC4D6C285
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5WAuWYpPyf6x8hsSizrHjQGWA6SpwYTf0LqyhF0bQg=; b=CikXFVfT4TV5iHiF9lZebvvV04
	vRdaJXHFQKTZTzBzNYYJDe9Ayq09steWh+Ddg5N5y8asdQveunELNgomzWeU/21AiQnnjmfJWG30z
	ZeYgiESp3eTvd1a1D+PI+ULHC3D2Vaah6HyMX8DKE40+Y9qKkda+/G6FUrj32bWAXB1pOso8a0FVe
	+SNzpypf5jMCiXjXmbAzibZSvdrvK37BauyMqIb7/HmNg8I/wb4oV0m0t1SjJkiKHyXCY7joGiodR
	8kCgUZkMFzGWiP1tIsZcrKzwczr2HD9XLxop7LaJVPZf+7bkDTi3u1C9eqIMWgNsrJyZBA18wzh7r
	8rXKFbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSld-0000000DLyH-2FBF;
	Tue, 19 Nov 2024 18:16:01 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSkU-0000000DLhr-16Jh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 18:14:52 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJGMaPP032500;
	Tue, 19 Nov 2024 19:14:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	U5WAuWYpPyf6x8hsSizrHjQGWA6SpwYTf0LqyhF0bQg=; b=L+vT/u5ko/LfoxQO
	Hv0gs33R0cqdctuSkF3hOC1J5R6S3xX4jKCAwrHiZvrTxKdusx2+nI+042A9B7Jj
	djACs834r+T+VjR8xhovwoJKq4t1PTeMyZkqM6cldKRgiTDt3JzG8Hz2SI2Gkd4z
	tEnf1M1FmjJUTuVawpUwfNo7tz24J432RApl95bWBIxd0qdEaxWEpQDwvgitwe8l
	aS0G0Gwt7DkBngRNr8EDjuJwylsxECmlJqf08yisUtqwSJl2namTrcncTwQpN+ot
	NUkGUlJwqR44z87LRRGS4mkmQBTrX18NsvWIDoSaeKK4d/NqkwmY7/xZDhfDF78w
	tB30pA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42y5u3ud1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 19:14:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B84A440048;
	Tue, 19 Nov 2024 19:13:26 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC9ED29ADCD;
	Tue, 19 Nov 2024 19:10:59 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 19 Nov
 2024 19:10:59 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 19 Nov
 2024 19:10:58 +0100
Message-ID: <0d9075cd-68c2-49ec-9b9c-4315aa8c8517@foss.st.com>
Date: Tue, 19 Nov 2024 19:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/7] remoteproc: Introduce release_fw optional
 operation
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
 <Zzt+7NBdNjyzWZIb@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <Zzt+7NBdNjyzWZIb@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_101450_820675_54E80FE0 
X-CRM114-Status: GOOD (  28.24  )
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

Hello Mathieu,

On 11/18/24 18:52, Mathieu Poirier wrote:
> On Mon, Nov 04, 2024 at 02:35:12PM +0100, Arnaud Pouliquen wrote:
>> This patch updates the rproc_ops struct to include an optional
>> release_fw function.
>>
>> The release_fw ops is responsible for releasing the remote processor
>> firmware image. The ops is called in the following cases:
>>
>>  - An error occurs in rproc_start() between the loading of the segments and
>>       the start of the remote processor.
>>  - after stopping the remote processor.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> Updates from version V11:
>> - fix typo in @release_fw comment
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 5 +++++
>>  include/linux/remoteproc.h           | 3 +++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 7694817f25d4..46863e1ca307 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>>  
>>  static void rproc_release_fw(struct rproc *rproc)
>>  {
>> +	if (rproc->ops->release_fw)
>> +		rproc->ops->release_fw(rproc);
>> +
>>  	/* Free the copy of the resource table */
>>  	kfree(rproc->cached_table);
>>  	rproc->cached_table = NULL;
>> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>>  unprepare_subdevices:
>>  	rproc_unprepare_subdevices(rproc);
>>  reset_table_ptr:
>> +	if (rproc->ops->release_fw)
>> +		rproc->ops->release_fw(rproc);
>>  	rproc->table_ptr = rproc->cached_table;
> 
> I suggest the following:
> 
> 1) Create two new functions, i.e rproc_load_fw() and rproc_release_fw().  The
> only thing those would do is call rproc->ops->load_fw() and
> rproc->ops->release_fw(), if they are present.  When a TEE interface is
> available, ->load_fw() and ->release_fw() become rproc_tee_load_fw() and
> rproc_tee_release_fw().


I'm wondering if it should be ->preload_fw() instead of ->load_fw() ops, as the
->load() op already exists.

> 
> 2) Call rproc_load_fw() in rproc_boot(), just before rproc_fw_boot().  If the
> call to rproc_fw_boot() fails, call rproc_release_fw().
> 
> 3) The same logic applies to rproc_boot_recovery(), i.e call rproc_load_fw()
> before rproc_start() and call rproc_release_fw() if rproc_start() fails.


I implemented this and I'm currently testing it.
Thise second part requires a few adjustments to work. The ->load() ops needs to
becomes optional to not be called if the "->preload_fw()" is used.

For that, I propose to return 0 in rproc_load_segments if rproc->ops->load is
NULL and compensate by checking that at least "->preload_fw()" or ->load() is
non-null in rproc_alloc_ops.

Thanks,
Arnaud


> 
> 4) Take rproc_tee_load_fw() out of rproc_tee_parse_fw().  It will now be called
> in rproc_load_fw().
> 
> 5) As stated above function rproc_release_fw() now calls rproc_tee_release_fw().
> The former is already called in rproc_shutdown() so we are good in that front.
> 
> With the above the cached_table management within the core remains the same and
> we can get rid of patch 3.7.

> 
> Thanks,
> Mathieu
> 
>>  
>>  	return ret;
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 2e0ddcb2d792..08e0187a84d9 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>>   * @panic:	optional callback to react to system panic, core will delay
>>   *		panic at least the returned number of milliseconds
>>   * @coredump:	  collect firmware dump after the subsystem is shutdown
>> + * @release_fw:	optional function to release the firmware image from ROM memories.
>> + *		This function is called after stopping the remote processor or in case of an error
>>   */
>>  struct rproc_ops {
>>  	int (*prepare)(struct rproc *rproc);
>> @@ -403,6 +405,7 @@ struct rproc_ops {
>>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>>  	unsigned long (*panic)(struct rproc *rproc);
>>  	void (*coredump)(struct rproc *rproc);
>> +	void (*release_fw)(struct rproc *rproc);
>>  };
>>  
>>  /**
>> -- 
>> 2.25.1
>>

