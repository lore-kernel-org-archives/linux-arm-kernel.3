Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524A6D60075
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 08:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cbqgsZsZzYjG6c8Z7Y+xn7QVPEktoe77SFvmP4EZP4=; b=1hn3SA7tjdisZzOG6VVhaGqbYL
	fGqpVTwJEoc/4kR15uifIzrEFqcoPs9PM/qsxPzUn2u0ZStnZxgqzdOQ517NoD1YyyEfCo3UMmPIc
	BoqhsIvvSqDMRmmTOfZu5K3lX6S2rHoMjJy5e12CgdY4RTT/0Z2OIAZjlgW73tlJioRKrp4OuiTeW
	WelMh9OpZoZ3T+PVA1gVc5n4mG3eIQsPsYPARZNY0QAECBmqFcu6PKh+P8JT1BR6zncBsLyyDoJ/Q
	ku4wbN4F1r561TfbANo1o1XCuAKYMH6jNjGbBKk53Gi2kTdeWL8fg0bhVBxGjdCGrPxTOR2jp2152
	SoI0VAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJEi-0000000Bhvy-0RoY;
	Tue, 19 Nov 2024 08:05:24 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJDj-0000000Bhme-3q2K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 08:04:26 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7lLJM013174;
	Tue, 19 Nov 2024 09:04:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1cbqgsZsZzYjG6c8Z7Y+xn7QVPEktoe77SFvmP4EZP4=; b=oY1IGhx6wbhHg/Xx
	3q7UfFhVqrLsldqkchqS0xGna7I4z4XsLiKeSrHPeT/xA4F5zU1hUnswk0Xr8G+r
	SQy2fKlYhUaCTWgtwdmiaWBhuAuT+tZyYdYpRvXauOiiyYIEtftlzEblWe/siibQ
	R4PCSN78bEZEapuiFX0HbPfgKoW4GV7JYMl+mrc/4dkhr2RQdKcmEKmraK8iY5fQ
	miK+hjkDQmB9+Mu+urYT0g+GMKZYxPDGuF7YhWL8xu1SUArXO/EppnTqxhf71lqQ
	D5IaXtLsozmqhR/6rmuK/034bOIR0ZzRIOMzrzBxSNZh8K+jSJLdwgRZQXH+x4tN
	BTRevQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xknw2xyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:04:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A763A4002D;
	Tue, 19 Nov 2024 09:03:05 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 655ED251A69;
	Tue, 19 Nov 2024 09:02:18 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 19 Nov
 2024 09:02:18 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 19 Nov
 2024 09:02:17 +0100
Message-ID: <be493536-aedd-4253-ad42-21821d080f41@foss.st.com>
Date: Tue, 19 Nov 2024 09:02:16 +0100
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
X-CRM114-CacheID: sfid-20241119_000424_486502_870DB874 
X-CRM114-Status: GOOD (  26.64  )
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

hello Mathieu,

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
> 
> 2) Call rproc_load_fw() in rproc_boot(), just before rproc_fw_boot().  If the
> call to rproc_fw_boot() fails, call rproc_release_fw().
> 
> 3) The same logic applies to rproc_boot_recovery(), i.e call rproc_load_fw()
> before rproc_start() and call rproc_release_fw() if rproc_start() fails.
> 
> 4) Take rproc_tee_load_fw() out of rproc_tee_parse_fw().  It will now be called
> in rproc_load_fw().
> 
> 5) As stated above function rproc_release_fw() now calls rproc_tee_release_fw().
> The former is already called in rproc_shutdown() so we are good in that front.
> 
> With the above the cached_table management within the core remains the same and
> we can get rid of patch 3.7.

Thanks for your suggestion! I will try this in next revision.

Regards,
Arnaud

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

