Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AADEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6kE8t5Yl2xYqtb9LtTwxOrdC5L10bLg5KJZZLPXHH8=; b=VP0+MbkM16S3NYoEiPQN64T5ux
	DirEkUUFBgdK1+exmPiuOWMaapIwLPi39iHdCAGx0T7teF7L1RtbFqtfi/8X8pi1C9el37z5pSYkm
	hu5Mn3HXFYcqy4DvQLgqEDJR+Nj5vTTgKZpFyrUO8U/FNRRUJxtvbbot88jQ3eR9z32n6nYd2Z+eG
	gaKakMaTs51CTZ/ZbMQhqu+IFiXi7KSQtCd2Ny/8t2tjGsp7WrpIwldNQrrwsOvv/5TS7HoQj5O9W
	2cxEasbRqrTJiy+bc4ZDVfzeYc3zd3O0+u0OXbwrTLUxcIPIa2p39gXu02ZCKuOf6GNFcjCu9oh3k
	jJdO+9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1qZ-00000003EKM-073z;
	Fri, 13 Dec 2024 09:20:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1oZ-00000003Djo-14rF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:18:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8HJvd026866;
	Fri, 13 Dec 2024 09:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6kE8t5Yl2xYqtb9LtTwxOrdC5L10bLg5KJZZLPXHH8=; b=gQN5K6N7y+x4QkmS
	Ok7PR6HbTic3wS7g7gqgFXkA/Kkuer+Mqh67AXjhs9vplaKwldwV+pyq/Rh1dz01
	4lXlwOZwcl6hGzlPqkqNR8hIL4G9FO4lpIShH2c5wW1brHfZKEu0vRHjU5RhcE+y
	szAeZ6sLem6Csj/TA3+JVE4jQ+swbALMiC0YsNclHKfHIM0Ru3yzDAuBi7+S2Hhg
	zoh/I5l4e2Ki/6RgUkSzpwZxwH62wWhYbHfhLWjZZJyxy2TxwmXKZ52QnKUZ5FmZ
	PH+a7Q9+gW6NHgXmX7e0PwO+8ZLLLD0ULBuUf2gAMms2/m9Ac70ILLYDpgjVzmNr
	fMXTxA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40ns6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:18:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD9IIAe019113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:18:18 GMT
Received: from [10.239.132.152] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 01:18:16 -0800
Message-ID: <1e99294f-b528-4cf7-a0e0-3d78221e6982@quicinc.com>
Date: Fri, 13 Dec 2024 17:18:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight-etm4x: add isb() before reading the TRCSTATR
To: Leo Yan <leo.yan@arm.com>
CC: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
        <james.clark@linaro.org>, <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20241204112332.3706137-1-quic_yuanfang@quicinc.com>
 <20241204151650.GA1976757@e132581.arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20241204151650.GA1976757@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p_9MwUObVSA2qo8Me6vwxP0ygYgJGMDg
X-Proofpoint-ORIG-GUID: p_9MwUObVSA2qo8Me6vwxP0ygYgJGMDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 mlxlogscore=902 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_011827_304016_25462E8C 
X-CRM114-Status: GOOD (  27.50  )
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



On 12/4/2024 11:16 PM, Leo Yan wrote:
> Hi Yuanfang,
> 
> Recently I just acrossed this part, so some comments.
> 
> On Wed, Dec 04, 2024 at 07:23:32PM +0800, yuanfang zhang wrote:
>>
>> From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>>
>> As recommended by section 4.3.7 ("Synchronization when using system
>> instructions to progrom the trace unit") of ARM IHI 0064H.b, the
>> self-hosted trace analyzer must perform a Context synchronization
>> event between writing to the TRCPRGCTLR and reading the TRCSTATR.
>>
>> Fixes: ebddaad09e10 ("coresight: etm4x: Add missing single-shot control API to sysfs")
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>> Change in V2:
>> Added comments in the code.
>>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 66d44a404ad0..decb3a87e27e 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -906,6 +906,13 @@ static void etm4_disable_hw(void *info)
>>         tsb_csync();
>>         etm4x_relaxed_write32(csa, control, TRCPRGCTLR);
>>
>> +       /*
>> +        * As recommended by section 4.3.7 ("Synchronization when using system
>> +        * instructions to progrom the trace unit") of ARM IHI 0064H.b, the
>> +        * self-hosted trace analyzer must perform a Context synchronization
>> +        * event between writing to the TRCPRGCTLR and reading the TRCSTATR.
>> +        */
>> +       isb();
> 
> As described in the doc, the "isb" is only required for system
> instructions case.  It is good to only apply the ISB on system
> register case:
> 
>         if (!csa->io_mem)
>                 isb();
> 

updated in PATCH V3.

>>         /* wait for TRCSTATR.PMSTABLE to go to '1' */
>>         if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
>>                 dev_err(etm_dev,
> 
> As mentioned in system register case: "Arm recommends that the
> self-hosted trace analyzer always executes an ISB instruction after
> programming the trace unit registers, to ensure that all updates are
> committed to the trace unit before normal code execution resumes."
> 
> And for MMIO case:
> 
> "When the memory is marked as Device-nGnRE or stronger.
>  ...
>  - Poll TRCSTATR to ensure the previous write has completed.
>  — Execute an ISB operation."
> 
> Thus we need to add an ISB after polling.
> 
>         isb();
> 

updated in PATCH V3.

> For consistent behaviour, a relevant thing is the dsb(sy) in
> etm4_enable_hw().  I do not think the dsb(sy) is necessary, as the
> driver uses the sequence "write TRCPRGCTLR + polling TRCSTATR" to
> ensure the data has been populated to trace unit, the polling
> operations somehow act as a read back.  And the ETM manual does not
> mention the requirement for DSB when enabling trace unit.  Thus, we
> should remove dsb(sy) (maybe use a separte patch).
> 

updated in PATCH V3.

> Mike / Suzuki / James, please confirm if my conclusions are valid.
> 
> Thanks,
> Leo


