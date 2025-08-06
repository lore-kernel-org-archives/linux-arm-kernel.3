Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA681C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 00:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCm1tUegqx7mcpc1Z5HobyZbVzfa+XlUJ4BJ6xj5K20=; b=IorqlmXSJOyiAP9TJ0rDdmB8YL
	yn9cVV2yOjlX/wM7mqgn5fzFC2OcMyseChXY9hhBKtoRr/D9lhvxs2zUTImefqYM0h865PS3zU3Ti
	ZIsLKx9KnK2SK9JvhPz2IeqWB/ilTu3gaYRVwQKrWne7aNoEjzwnuso8hfr0B8ZFZa2UNgxSAXpAp
	lCfp0pmZHucaMF5QhrV+neAHy05DnX3xAhFRPzMFPP+e97oqnEA1B1UmKoZNwRShs35yPDbulTHJW
	KSNvQDcnTlWvr41bl2FOFZyb+8nD2FH0grTIKXSh+Jr1NrFoIFtrBMN0hQP0FjwGyHjSO5kmWQDCf
	wWMBFmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujS7p-0000000E4GO-3HjW;
	Wed, 06 Aug 2025 00:35:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujS5D-0000000E48d-48ia
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 00:32:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I2eiI015576
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 Aug 2025 00:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCm1tUegqx7mcpc1Z5HobyZbVzfa+XlUJ4BJ6xj5K20=; b=gjlQtiz3V+w3xX4V
	6Qlfa6EC744X3TiAjzDrPMi7Y1X7eva4XAjQcp/4Nq3NXtGs6o7sLLLGs3I2hUbw
	o9wBHNAflOXDalxaM19AtYUnb8/fyu+7Ef6tgni2f9tt9UWmNqoctzoNjpRNnIbg
	tYEOokrh+dMS22M2+G/a8tv30UYEDhpnAc8eh4RcEDOANUDKYHBu8ET3Yy/ESrdS
	AjfQSZjB/TLD3v5QlcZkbhtVgi/8pq8Z7RiVSu/K88OqqVRP+d99Zi4+IkN2vloa
	Lx84ub7o4mKTGcYt5AQwwLWbmJFBHRAyngFCaTHOOdXqmfxziTpGjFBMbXG5bfut
	3oHI3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvxrv0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 00:32:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23ff7d61fb7so3141925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 17:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754440361; x=1755045161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nCm1tUegqx7mcpc1Z5HobyZbVzfa+XlUJ4BJ6xj5K20=;
        b=ZfAGn/M6EKFlAVJwQP9pOUqCfuTYDCvS7l4yp9ZLwXtLd5MYwyLKOZBiJeqkNT38MM
         iRJR5qv3byd4WzOqjhU1WAPMW4PCrfgNik5++74WPKmB6xFiDnOWBKiwrDa0VZUNWRK5
         VflVIdeBkVKk/FZmp0fw3P5vT35udlIl6IVV51827TnZx7tqghQ2PRLX0bv7L6tYEiWH
         0IT6zGVQVmKTO1rY0Yp9bZiPxKn9NZmYA/rtB0rM7BWQMi8ys9RfK8EFmM97JnpLojmh
         DEzNjSKB2KgFLYSaS0WzWrpONGrJYJp+vxypmFY2gjJWi0SydEBJRpOAewCoWwn1nuf7
         JNig==
X-Forwarded-Encrypted: i=1; AJvYcCWfh4v4zeS0oePcWgcKZ6vejUiZbkBCMMvlFdmjCjREKDmmmHGdmt0dZixa1C1hlpiVrL4gYBwDKdBGjBG5Bk13@lists.infradead.org
X-Gm-Message-State: AOJu0YzsGosWRdsez4EHrxte6Jja6fjQ2UtSerXx/ByF10dLvF+P1wtS
	SLlTtW6v3ckiyC7AZO71cbHGAo0gjMA2T1GN+I7Q1dh4m3evSl2vZH1x/uaBXuOMAsS7StpErFk
	z6vTdjKntuwmPmuCE3brPafx3FbMHxEJ78IlDIULv2cz6OmjEJ5J8Hfxig1w2Vg6I7km4qhMnrM
	U5YA==
X-Gm-Gg: ASbGncvvlzBsZSU+RrCvWkC8wgf+YJXC7JSZULu3EOIAciutCywQNGuCizX+R0FSOOa
	hZk7Ptrm0IZVbQLoLzU8EVBMguJPnmoviOGiZLlQTpN/360tbSiK/ySr6lDnEErVua268E9uKlV
	Jb+jTv+36HmCSpJCxDCwFx4JRGXUUNQtb3TjOX6aU8lM/GF7V6UN4+DyNIiXqgL9ls9Ay1HLtIy
	/7hMVFaNFGKkMNWsMFhi8F10slj8OUxzTMIzGTyaSefsPQniqK+GSYiw1lJ5B297M2Pk/dsYBGC
	mCq0HuFY+WQZZzHl8W7drf0ODDVTDa91OK8WwTZ1cndSLJaeInOVaFyuDKWwPZiz14IplzNndoo
	2dtqjWTZxSo8DELlOMw2bAnPF
X-Received: by 2002:a17:902:e550:b0:240:4d19:8774 with SMTP id d9443c01a7336-2429f98fc5amr10815575ad.24.1754440361516;
        Tue, 05 Aug 2025 17:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr1EmLymPDG9f6dSPFvoN/hEjN48sinKuRQr7dOOX0ZYPmD4JaThfNyEnAqIxOJ6qOmxz6bg==
X-Received: by 2002:a17:902:e550:b0:240:4d19:8774 with SMTP id d9443c01a7336-2429f98fc5amr10815335ad.24.1754440361082;
        Tue, 05 Aug 2025 17:32:41 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21be9sm144969375ad.72.2025.08.05.17.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 17:32:40 -0700 (PDT)
Message-ID: <ae3a482b-2b8c-4390-a950-f9612303003d@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 08:32:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] coresight: tmc: add etr_buf_list to store
 allocated etr_buf
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <quic_jiegan@quicinc.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
 <20250725100806.1157-4-jie.gan@oss.qualcomm.com>
 <CAJ9a7VijwFKiaZzKsSKPynWapA3ik9d7JLeE+yVNFB0T62iH-Q@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VijwFKiaZzKsSKPynWapA3ik9d7JLeE+yVNFB0T62iH-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwMCBTYWx0ZWRfX1g3FKI2SkGFG
 UERe+09FoshSho59Ebi9Xxmh1SsfEDkcrZVWsR8vcJSuxBXfRGn03eH+JNrjcmtKlVbxhe7j8CX
 wsDSc6jS0N/nmOx1CizyhD6SkeQqTOy4IaZBGR6T2gZyNulaJzsX94/inBd5XX4hzZb1JBRBDbC
 ajVISJGyVnEb/r3nNwDeubMlswz8zf8AGfRae0BdvLWbnSHy9qaxEv1yovk1gNbnIWVvR5jLNqp
 JSYw8hKfwU+toHY3teq7EitKe4TN/w4hT0QWoG2aLJUIblgJ0x4hG0pgn6Dhw74YbEFuQvi9xAz
 lBoATWhqCxPtX2dPUojNzL/H3GxOplkSi7FdeVe2I5aRpifHq6cPihRr/OPQ1Hv+JCXmYKwaY8C
 OgMcM+BXZMRcePeGX4HdpYjjPgEBsZQ8WdUd+yvrYvfRzL7i+XpEV18ANesAb0DuP3XnjPeQ
X-Proofpoint-ORIG-GUID: F58KOfNtV47DoGt9dqUuBuZhZlr6z1lq
X-Proofpoint-GUID: F58KOfNtV47DoGt9dqUuBuZhZlr6z1lq
X-Authority-Analysis: v=2.4 cv=U5WSDfru c=1 sm=1 tr=0 ts=6892a2aa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=U2YxrCIlBwdvewSZISMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508060000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_173244_149818_B015AE50 
X-CRM114-Status: GOOD (  24.47  )
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



On 8/5/2025 6:15 PM, Mike Leach wrote:
> Hi
> 
> On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Add a list to store allocated etr_buf.
>>
>> The byte-cntr functionality requires two etr_buf to receive trace data.
>> The active etr_buf collects the trace data from source device, while the
>> byte-cntr reading function accesses the deactivated etr_buf after is
>> has been filled and synced, transferring data to the userspace.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-core.c  |  1 +
>>   drivers/hwtracing/coresight/coresight-tmc.h   | 19 +++++++++++++++++++
>>   2 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index be964656be93..4d249af93097 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -830,6 +830,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>>                  idr_init(&drvdata->idr);
>>                  mutex_init(&drvdata->idr_mutex);
>>                  dev_list = &etr_devs;
>> +               INIT_LIST_HEAD(&drvdata->etr_buf_list);
>>                  break;
>>          case TMC_CONFIG_TYPE_ETF:
>>                  desc.groups = coresight_etf_groups;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
>> index 6541a27a018e..52ee5f8efe8c 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -208,6 +208,21 @@ struct tmc_resrv_buf {
>>          s64             len;
>>   };
>>
>> +/**
>> + * @sysfs_buf: Allocated sysfs_buf.
>> + * @is_free:   Indicates whether the buffer is free to choose.
>> + * @reading:   Indicates whether the buffer is reading.
>> + * @pos:       Position of the buffer.
>> + * @node:      Node in etr_buf_list.
>> + */
>> +struct etr_buf_node {
>> +       struct etr_buf          *sysfs_buf;
>> +       bool                    is_free;
>> +       bool                    reading;
>> +       loff_t                  pos;
>> +       struct list_head        node;
>> +};
>> +
>>   /**
>>    * struct tmc_drvdata - specifics associated to an TMC component
>>    * @pclk:      APB clock if present, otherwise NULL
>> @@ -242,6 +257,8 @@ struct tmc_resrv_buf {
>>    *             (after crash) by default.
>>    * @crash_mdata: Reserved memory for storing tmc crash metadata.
>>    *              Used by ETR/ETF.
>> + * @etr_buf_list: List that is used to manage allocated etr_buf.
>> + * @reading_node: Available buffer for byte-cntr reading.
>>    */
>>   struct tmc_drvdata {
>>          struct clk              *pclk;
>> @@ -271,6 +288,8 @@ struct tmc_drvdata {
>>          struct etr_buf          *perf_buf;
>>          struct tmc_resrv_buf    resrv_buf;
>>          struct tmc_resrv_buf    crash_mdata;
>> +       struct list_head        etr_buf_list;
>> +       struct etr_buf_node     *reading_node;
> 
> Potential simplification:-
> do you need both reading_node here and reading in the etr_buf_node?
> reading_node handles the logic for which buffer is being read, while
> is_free handles the empty/full logic - reading seems unneeded?

Yes, you are right. I checked the usage of reading. It can be replaced 
by reading_node in switch function.

I will simplify this patch in next version.

Thanks,
Jie

> 
>>   };
>>
>>   struct etr_buf_operations {
>> --
>> 2.34.1
>>
> 
> regards
> 
> Mike
> 


