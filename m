Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004A0FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 02:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SY4HL1Q31NXU5+qYtKsFt8Dgw34W+B4o6sHJJtNRnI0=; b=lwbbH8fQ7+FDVFPy4Q9XDD1t7g
	3/pHvRHEkk9O/df8Sdn/90nnUMs1hbklfJEQGZEQU7dfidMPYUhzUc/Y0AQsYQgPSuPz6PJGP2NIH
	QRCr23bG9VSSaKOD0li1FE2mY8yPiMoEuTFsgtPS40OnZttAWQQHCdYGuqa7ADT7ByumL+oYRlDuF
	T9eBam4lk1/qP03yn5IEbIfu0Mp6oWv1mc52+cWZZ89cEpMQlp2MDh17UlFFyeivEb2u8LzQgbzBW
	ULoVPhBrL+2ee7BGyLims4Qnnamj780sxaoBIrFMi9MnLZDqeJ9kXoF2TiFS7y299O7arBwgaGpBg
	9RswnlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHY8c-00000000RaC-1M14;
	Tue, 28 Apr 2026 02:25:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHY8Z-00000000RZq-0DUM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 02:25:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S0ftv2440834;
	Tue, 28 Apr 2026 02:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SY4HL1Q31NXU5+qYtKsFt8Dgw34W+B4o6sHJJtNRnI0=; b=g2/zU88ydP1AUX07
	zVeETZoKY9FVwxt0+fjT6zwsex8X5QWE10UgzAyQRRxwQK9iFZVNPwL0Q7jb6urC
	ZMuBHPVD6ChRdESz19D2q+3OVmJw41ZmLn23mKvJb53QWYxH6LVaUESzSkUj7dXb
	oeh40fF1wTxg1IDh9LTz81/VerMvrTu227+rw4oAis6y9da451mVcevd4LMKyfbl
	AS0pWEap3UFrlIa181t6rK+pMSXIpV/wEK0svt23qq3nsmeFDgOkIMKyyudZdK+j
	5gd5JuN50EcdTJF5Eo5r/C9Dg+xD2DAdax/ti7vzc+EV0uW5NoTl3m2JIR5ruIV2
	sAMIcg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac426t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 02:25:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 63S2PGTv008643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 02:25:16 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 19:25:13 -0700
Message-ID: <b20a2f7c-4838-408f-94ed-ee9656d451c4@quicinc.com>
Date: Tue, 28 Apr 2026 10:25:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
To: Leo Yan <leo.yan@arm.com>, Yingchao Deng <yingchao.deng@oss.qualcomm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan
	<jie.gan@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
 <20260427165913.GA16537@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260427165913.GA16537@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-GUID: 24W6bERaWBtzOlxtIPhM9WA-Ufe-drQP
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f01a8d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Z-dFwmiUG_mZBFzb5fQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 24W6bERaWBtzOlxtIPhM9WA-Ufe-drQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyMCBTYWx0ZWRfX4kMcDI8OxvC2
 3VSlvrrI784qZdZY+Wt/YEVfL/6BJpH9cHpRtZ50KsJa2rfLkSlGxGNpPwaVmay8mMgR2DmjQB7
 cpZ+n57DE8UyxqhWzlC50U90V+MYyd60f6kJ5H0SYWoIit4aD70/ODGr5bAs+P7y5D1gROiDc4o
 5F12PVh2wiuf1sNsgmI9s1PR8p/DcoFD5DjIBfXZ/yrHFJJ4Dx0NfL0j74hco61PS1iPJ3IWIsM
 yN+LIeSxJKdhpdJDvjtOTpbEVdQJ4cTXia2BqlGsA1EKRWE6Xugp0U8KNqQj9xlNF/3BIw4jxFJ
 TINWEKdIeZCsW826r3Y3TXrigYSYPmDlBzXmYwFyJfJEZsBt5b4XgIS2aK7LmjpWQQrZ2ZDwC5A
 C3vzzYVm4fdnm8/Of2L4Q3161pJOZhgSM/pyXIorHY5zmlziSi7EpckN/LHZeNXDcfIgW5eVsDZ
 veUyf1ckzrymNGh2taA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_192523_109633_4BEA270D 
X-CRM114-Status: GOOD (  17.67  )
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


On 4/28/2026 12:59 AM, Leo Yan wrote:
> On Sun, Apr 26, 2026 at 05:44:38PM +0800, Yingchao Deng wrote:
>
> [...]
>
>> @@ -316,23 +316,33 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
>>   {
>>   	struct cti_trig_grp *tg = NULL;
>>   	int err = 0, nr_filter_sigs;
>> +	int nr_trigs = drvdata->config.nr_trig_max;
>>   
>>   	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
>>   						     CTI_DT_FILTER_OUT_SIGS);
>>   	if (nr_filter_sigs == 0)
>>   		return 0;
>>   
>> -	if (nr_filter_sigs > drvdata->config.nr_trig_max)
>> +	if (nr_filter_sigs > nr_trigs)
>>   		return -EINVAL;
>>   
>>   	tg = kzalloc_obj(*tg);
>>   	if (!tg)
>>   		return -ENOMEM;
>>   
>> +	tg->used_mask = bitmap_zalloc(nr_trigs, GFP_KERNEL);
> Here would be:
>
>    tg->used_mask = bitmap_zalloc(nr_filter_sigs, GFP_KERNEL);
"nr_filter_sigs" is the count of entries in the DT property array, if 
the DT property is:
     arm,trig-filters = <22 23>;
Here nr_filter_sigs=2, so bitmap_zalloc(2) allocates only 1 unsigned long
(64 bits). set_bit(22/23, used_mask) still fits, but it's logically an 
OOB, and any index >=64 would
write past the end.
>> +	if (!tg->used_mask) {
>> +		kfree(tg);
>> +		return -ENOMEM;
>> +	}
>> +
> It is likely this will have merge conflict with the new patch [1].
>
> You might need to rebase this patch on the top of [1]. We need to
> give [1] priority as it is a fix.
>
> [1] https://lore.kernel.org/linux-arm-kernel/20260426-nr_sigs-v1-1-3b9df99dab97@oss.qualcomm.com/
>
> Otherwise, LGTM:
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Will update.

Thanks,
Yingchao


