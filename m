Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DECC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 06:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJtqmRjoumc2ISMrT27MKjQkUzD5+VvQigPSswUASss=; b=wJD2Gncyh8YQGO6gotspv/lsJc
	ZYJtnDFM8itTycEEt3qpj/vas/34K4MrAKWhc4DVf4n9Xximr4XpH/jHm5CeDL/CepPTCncVSJWP0
	FuGVl3ZenCB5N8QN/ZR0wfH5Dsc5Y0kP/RMKIQnLOX9NdAdULFS3GUOUomkDaY4H6RIJUiWEt+cfE
	dT3PbB8damLe3anaIx6SwGLVNVE7L+wXluM+QoVBZveO7TF8gE+hlblp6PXW0ufeW1rTpf3l4+9Ip
	eAhMXCwt2O1tRuO9UXS3UJMK+lBVkrNSjfOjHTRp9TF3aNrq5LXvHg2btjYAubGakITqmtGnK8yWZ
	txIDWydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXjB-0000000EPqU-1wGg;
	Wed, 06 Aug 2025 06:34:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXfB-0000000EPXC-2dld
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 06:30:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765FcXR011113
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 Aug 2025 06:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJtqmRjoumc2ISMrT27MKjQkUzD5+VvQigPSswUASss=; b=O3uz2cyXuhDQmSYI
	K2B18aK3qg+AYb5RUumOXeQX8TlyEMv4wrP5kqlkmPqdxPu4ZV6yh2ra+opLHoP/
	PzstktAU/jK0CevuBWUc3ota6WEgTD0n3vHoXfnsilhbNee//np2ZBxwQftiRNWF
	EI4aPbyNknCq/ytOGbZFrgY345vD80R9yeDPG5FRdGOWRPYVqcgpGMgEnhtvD8lj
	UA3MsrFpLicOEdGixkbSYKhMLtRbwoTSFKvtOxEMkQUUcckJHXpP7Vu0X3bFaJDK
	rVolGXECH+LC1uQM70gS/GcVlSfEmACGwah6E4GuLT+cPhSMEu+pT6OsgXBxlRR/
	Hi3zwg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw31q82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 06:30:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31f74a64da9so7230687a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 23:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754461810; x=1755066610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJtqmRjoumc2ISMrT27MKjQkUzD5+VvQigPSswUASss=;
        b=TdDx/q4idx1ejJvUJ5Oli1+hjXiovMkpF/Xon4ekLRM/VXY8+WFbOwqZGBhDnIxv0u
         OVqFdn+/bzLzXW3ZbeiSfG1m3YBhVFSrrpz8xEleX/qkbYks+wytDSEN5ac59gJH/GQB
         fGOYzzukKdm0JJ1iiqunuqyDLgEVuG/FRH6BpsH35h4K13Y1re2DyOhFc+EaiFn2l84c
         zO6Oa18HNQxfCuBfFFpavfIu7uTxpT/o/x8lsPX0Qo51BitfKoutxC+jJRddmMmQOqsp
         fFqs/xqKEBLMIC2QYv8ctc/eN3lZ1ET3FuEBkgWsgq04X9a2QInMxeqIyJnd4QSB9UEp
         wFqw==
X-Forwarded-Encrypted: i=1; AJvYcCVJPbefyg/XnrMkrehuUw2RUUZ5bEkNsbcviDra/MlcRUWqlcqRYCd9fMTPCJg2bncB1HFrdXQbs9k//5nL9u+9@lists.infradead.org
X-Gm-Message-State: AOJu0YziR0Rg5FU0hZx4My5LfsfIW5c2YcB7QM+1EiJOzxOAn5GJuLDx
	B/NBqwIdcata9v09Y6NJdBLb9KNDTiHDnc1VDxiBpGTN1pS7cyBut/G16bb+dJCC1xzHmiwah44
	yJcy8Vd5/SanToCx2rSezBExRZmg3GrcYyDb8Tlv7BTBfWOtSrnEKZj104X1KYPMGgFCne0Fhu9
	i/tA==
X-Gm-Gg: ASbGnct+TalEUQILDg4oYHS7fasv4fsbkR3vUMA8DnCfIwxI+1yYJFfNHiq6aswzx6O
	5SuLN41AELkV9M9FfcfsrEu8wkPfskgA4PdBVZelhrjyj/KCiA9n4Y32xDEoGZ62S07v5fBJpMl
	aDfZozEw4JbaR2g8/ocn6mS3q587wRSmD7u9bt6tvTRpTRcdXikDKDGprtCwrkjlpcqAcrUNZHE
	wzW6AT+DpdGx5SFb8mD4DqcP2NLNgEFym9X94EMRNUPwa7z7owEoWOa7nTnwCdCFJ2DxA39kVlj
	WZlf/vzuOX51M3pLQdmO3umDOrLEcj5cwKqYGGaE1wKcFfnhnsqSTsHYZMdF8XBgli/VptVswhQ
	4CNTGZXlQDw/ShRfmJP/xoKq3
X-Received: by 2002:a17:90b:5706:b0:31f:6d95:8f76 with SMTP id 98e67ed59e1d1-32166cca3e0mr1947009a91.29.1754461810375;
        Tue, 05 Aug 2025 23:30:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQzfZEJLHL6MCbJYYh45x632/2CHYTmprEp0TtYcsp2qKJGyhNfr/FhP3PJd1HyC3SEDMGfw==
X-Received: by 2002:a17:90b:5706:b0:31f:6d95:8f76 with SMTP id 98e67ed59e1d1-32166cca3e0mr1946971a91.29.1754461809894;
        Tue, 05 Aug 2025 23:30:09 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d86f7sm12649913a12.24.2025.08.05.23.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 23:30:09 -0700 (PDT)
Message-ID: <70bf0c0c-4a78-4caa-ab86-76a2c99c113a@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 14:30:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] coresight: tmc: Introduce tmc_read_ops to wrap
 read operations
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
 <20250725100806.1157-6-jie.gan@oss.qualcomm.com>
 <CAJ9a7VgYTUsBn8=qtfwmkoS6Lib-8LgESLBDxXrRVqLnScLKZA@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VgYTUsBn8=qtfwmkoS6Lib-8LgESLBDxXrRVqLnScLKZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXz5SuG7zraMra
 A0jmjASK/Mk9QVbIIW7/SCkOrJlyC6i77ggfctDf0skORiM0+I3N5ENTNA9GR7REoo8FD52zf/0
 KFUTwkxhtNjg3fN72e6Wzom0mQf/sBuuiDlbhSPMPqmbOLT9ha8nHHVHSG80Z+y4eT8wjzGkVmy
 AsF9nxlSmK7QBlljxtBwLm7USo+rXgbBUvP/QKA7D1BIu8KcbYWYhHq7RNfHM1WEwM3ZTuLuNQQ
 3i6HN6BdHcmADnIvy1waB4vqdS1QZzYzIos66osO4vROkoFrTBKHmlTLRJkvdJy3mS0h6J6Oarq
 bK/D5CIk2biqZNyZJLzj1kd821XcIO2js8mdPN2A12ipsmXGe2JuTeKo2PVBBqsX6FMdAb7G5aT
 EK0ya8ai
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6892f673 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=eQTT6voJP-nWTqyz9zoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9tcut78jf3C5sP_ZwZZ5cN32hZREX3fX
X-Proofpoint-ORIG-GUID: 9tcut78jf3C5sP_ZwZZ5cN32hZREX3fX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_233013_794642_7E356601 
X-CRM114-Status: GOOD (  23.93  )
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



On 8/5/2025 6:55 PM, Mike Leach wrote:
> Hi
> 
> On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Introduce tmc_read_ops as a wrapper, wrap read operations, for reading
>> trace data from the TMC buffer.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-core.c  | 50 +++++++++----------
>>   drivers/hwtracing/coresight/coresight-tmc.h   | 17 +++++++
>>   2 files changed, 40 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 4d249af93097..f668047c5df4 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
>>   {
>>          int ret = 0;
>>
>> -       switch (drvdata->config_type) {
>> -       case TMC_CONFIG_TYPE_ETB:
>> -       case TMC_CONFIG_TYPE_ETF:
>> -               ret = tmc_read_prepare_etb(drvdata);
>> -               break;
>> -       case TMC_CONFIG_TYPE_ETR:
>> -               ret = tmc_read_prepare_etr(drvdata);
>> -               break;
>> -       default:
>> +       if (drvdata->read_ops)
>> +               ret = drvdata->read_ops->read_prepare(drvdata);
>> +       else
>>                  ret = -EINVAL;
>> -       }
>>
>>          if (!ret)
>>                  dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
>> @@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
>>   {
>>          int ret = 0;
>>
>> -       switch (drvdata->config_type) {
>> -       case TMC_CONFIG_TYPE_ETB:
>> -       case TMC_CONFIG_TYPE_ETF:
>> -               ret = tmc_read_unprepare_etb(drvdata);
>> -               break;
>> -       case TMC_CONFIG_TYPE_ETR:
>> -               ret = tmc_read_unprepare_etr(drvdata);
>> -               break;
>> -       default:
>> +       if (drvdata->read_ops)
>> +               ret = drvdata->read_ops->read_unprepare(drvdata);
>> +       else
>>                  ret = -EINVAL;
>> -       }
>>
>>          if (!ret)
>>                  dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
>> @@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct file *file)
>>   static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
>>                                     char **bufpp)
>>   {
>> -       switch (drvdata->config_type) {
>> -       case TMC_CONFIG_TYPE_ETB:
>> -       case TMC_CONFIG_TYPE_ETF:
>> -               return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
>> -       case TMC_CONFIG_TYPE_ETR:
>> -               return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
>> -       }
>> +       if (drvdata->read_ops)
>> +               return drvdata->read_ops->get_trace_data(drvdata, pos, len, bufpp);
>>
>>          return -EINVAL;
>>   }
>> @@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
>>                          "Valid crash tracedata found\n");
>>   }
>>
>> +static const struct tmc_read_ops tmc_etb_read_ops = {
>> +       .read_prepare   = tmc_read_prepare_etb,
>> +       .read_unprepare = tmc_read_unprepare_etb,
>> +       .get_trace_data = tmc_etb_get_sysfs_trace,
>> +};
>> +
>> +static const struct tmc_read_ops tmc_etr_read_ops = {
>> +       .read_prepare   = tmc_read_prepare_etr,
>> +       .read_unprepare = tmc_read_unprepare_etr,
>> +       .get_trace_data = tmc_etr_get_sysfs_trace,
>> +};
>> +
>>   static int __tmc_probe(struct device *dev, struct resource *res)
>>   {
>>          int ret = 0;
>> @@ -818,6 +811,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>>                  desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
>>                  desc.ops = &tmc_etb_cs_ops;
>>                  dev_list = &etb_devs;
>> +               drvdata->read_ops = &tmc_etb_read_ops;
>>                  break;
>>          case TMC_CONFIG_TYPE_ETR:
>>                  desc.groups = coresight_etr_groups;
>> @@ -831,6 +825,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>>                  mutex_init(&drvdata->idr_mutex);
>>                  dev_list = &etr_devs;
>>                  INIT_LIST_HEAD(&drvdata->etr_buf_list);
>> +               drvdata->read_ops = &tmc_etr_read_ops;
>>                  break;
>>          case TMC_CONFIG_TYPE_ETF:
>>                  desc.groups = coresight_etf_groups;
>> @@ -839,6 +834,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>>                  desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
>>                  desc.ops = &tmc_etf_cs_ops;
>>                  dev_list = &etf_devs;
>> +               drvdata->read_ops = &tmc_etb_read_ops;
>>                  break;
>>          default:
>>                  pr_err("%s: Unsupported TMC config\n", desc.name);
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
>> index 3cb8ba9f88f5..2ad8e288c94b 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -223,6 +223,8 @@ struct etr_buf_node {
>>          struct list_head        node;
>>   };
>>
>> +struct tmc_read_ops;
>> +
> 
> declare the entire structure here rather than later.

There is an issue of declare the entire structure here because the 
function pointer needs use the struct tmc_drvdata which is not defined 
at this point and it will cause a compile error.

Thanks,
Jie

> 
>>   /**
>>    * struct tmc_drvdata - specifics associated to an TMC component
>>    * @pclk:      APB clock if present, otherwise NULL
>> @@ -259,6 +261,7 @@ struct etr_buf_node {
>>    *              Used by ETR/ETF.
>>    * @etr_buf_list: List that is used to manage allocated etr_buf.
>>    * @reading_node: Available buffer for byte-cntr reading.
>> + * @tmc_read_ops: Read operations for TMC device.
>>    */
>>   struct tmc_drvdata {
>>          struct clk              *pclk;
>> @@ -290,6 +293,20 @@ struct tmc_drvdata {
>>          struct tmc_resrv_buf    crash_mdata;
>>          struct list_head        etr_buf_list;
>>          struct etr_buf_node     *reading_node;
>> +       const struct tmc_read_ops       *read_ops;
> 
> probably should be named sysfs_read_ops to be consistent with the
> perf/sysfs differentiation within the rest of the structure
> 
>> +};
>> +
>> +/**
>> + * struct tmc_read_ops - read operations for TMC and its helper devices
>> + * @read_prepare:      prepare operation.
>> + * @read_unprepare:    unprepare operation.
>> + * @get_trace_data:    read operation.
>> + */
>> +struct tmc_read_ops {
>> +       int (*read_prepare)(struct tmc_drvdata *drvdata);
>> +       int (*read_unprepare)(struct tmc_drvdata *drvdata);
>> +       ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
>> +                                 size_t len, char **bufpp);
>>   };
>>
>>   struct etr_buf_operations {
>> --
>> 2.34.1
>>
> 
> with the above changes:-
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 


