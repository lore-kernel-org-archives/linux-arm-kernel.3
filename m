Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F767C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 00:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33MEykrm88kW0tV7FkI7VdS3PkN0kWkKi5leVAOcx7I=; b=oY7PXo8lsOfUZ7Q1Z6VHYHNd2o
	G3kHNS8n234mD2Pdgr69Yu/TsXT3UWjJUk4/+ld55ZB4oJbM4vTluFAI6ymBAhgaqAHylrFGDsVY6
	D2ZGHQx20K0mcTYvTPrJ+R+vcp/NEg1RJFL0ibaJ+MYGGbg2KYXU+XdNURnlsAvTuUxpRKmsi/pgl
	8tGHdrO+0xAPmB+L4qryHvYVnWq9Prdt77zE5e7ursH30aBOUSUmwuCIgnX8RboKT4UG2s1Sjeat9
	cj2vIiorLi3OF87Ba7gr9Q3vKHTwFz5BfZOVmFgW7H6Yt+D5w7cEm8xsgeJ0pNhxzyqEp3DZg6VFI
	GVjsMdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSAX-0000000E4Qu-2LE1;
	Wed, 06 Aug 2025 00:38:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujS7w-0000000E4HB-1qT6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 00:35:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I2lDD011088
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 Aug 2025 00:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33MEykrm88kW0tV7FkI7VdS3PkN0kWkKi5leVAOcx7I=; b=B65sNT6tUln5L+Qs
	d/+rAALmOdK5thEabiQx8Y/L1NbeHfP33qwYFcm1bahj+zeocE43Y5r5k0vP9hNT
	Id6GV/it7D9cF2dxgYr+O3weWMlnBugPSxaYRvXOyqkgARoA3uLnoIwo3SiEitEJ
	I8d9Qy4C5Kt9j+PeecobSnAPRRyTbhHbnMEraai7KdK5tEbzG1gaQaCeUFgFDFDr
	qHFyogMhugB149SC5xZsRgkDikHvYdIdOaFAqRvj/pQtj/+SqUGwotnSp3lLGtCf
	+zHrDr4Q/MpkdSsPbJNhXgUyoVlQV8GEsy7spL35hEFzHn1Lsd7DLmehTZShp9tR
	ONHYWA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvyrv9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 00:35:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fed1492f6so92145625ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 17:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754440530; x=1755045330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33MEykrm88kW0tV7FkI7VdS3PkN0kWkKi5leVAOcx7I=;
        b=JyCGZy0bmJgTd21qfjhtPgbiRHDVmO1clsWQp3nvxHKo9NtwFSht0w2LNqsbbv0vHj
         vT6zRtgAf+/k7ESLn5bm9GiZK5qzDJ6fpEBKJM0APor+nLZiS3EPlh/S4rWuBP2Xpbrx
         ooUae5Vqysjfd74MZ2x/kPGMfuFYGylLZLszbzuNeinQdDM6KAmjKQCBB6RFixeZ+TxL
         dzOO7D1EkYSCG+lULj8Al91+mkoSxJJBhN5DECZ5rklEa95ve5LCIU9JHAoj8fI4WH6n
         2L4dUARwT5DeQmdDwijnqhwir7WEFkqkosWRs6h12tcyFIplC5sF8TE/R/L3DX5UwWoW
         seGA==
X-Forwarded-Encrypted: i=1; AJvYcCVO14vDanjh927YRagUgHhA3Bk/Z8zuv2VyKV0te+XMgwjYO9llhNacrrOiutec8Gry9fjirqPWsCAR+As86+yi@lists.infradead.org
X-Gm-Message-State: AOJu0YwPklRtATJ7wRT4hpB3Pr1JM40pN0Ul4yMTOb3p9fVKHoZdmU0s
	qFwqU2xnaGGvDLJDnrgn9wuWYS1c/ko2AbPb9RrDUq7rCwevhSiMi6u3/CAs0Su+GL2iyt0VndL
	i8TOn7BaGqMm0uj/pKXN8yvU+iT9crjHxuvWpFlFoHAExFIoQkcPd7yRmUh15HBTJY4rNYwUObu
	RC8w==
X-Gm-Gg: ASbGncv2xknWQ1yKjHmmQmVDXaJZEgs3osMsyo/SY5bvBbUb7edqerNxv3L/vumTkRL
	EyLv8i+7dBhukuCUPIi1KKgVP/z56bwh88tp9l+dsT+dVscgjoFBcRvFtQOK5QRWFvINJhP5uUe
	3O+KwvvMEI8cxsAqq6lILHa36ecfAoUfShtYIP7/hu7HSse3Qe7i9nhsTEX/Zx2ngDblF75O528
	OEcJG4AO2jidw+I2Qpqyei645VMOZ2+ypccN0QV+JLWcbdAxmzDAXjdESNCbe2zGcimiijL7wMr
	6RfndU23yS/HFZnM+FtdKRH8Qec83oMB1PmWPEpwejHXjb1BtWGarDKQz0zNYpAC/e8Llw7TEN+
	6K/O8TDRPUdFR2IDbALP36yps
X-Received: by 2002:a17:902:d4d1:b0:240:8c85:4299 with SMTP id d9443c01a7336-2429f2eed79mr17648495ad.17.1754440530006;
        Tue, 05 Aug 2025 17:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIyv2qaOgUJsQRonvOcznN+su8mseW9S0RJwVuiRWZ5xeiOYmIdDYzHuuX3sCRo0xPN/m+Vg==
X-Received: by 2002:a17:902:d4d1:b0:240:8c85:4299 with SMTP id d9443c01a7336-2429f2eed79mr17648115ad.17.1754440529509;
        Tue, 05 Aug 2025 17:35:29 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef6c62sm145444965ad.4.2025.08.05.17.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 17:35:29 -0700 (PDT)
Message-ID: <40c8c2d0-1ac3-4944-b509-d23f21687476@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 08:35:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] coresight: add a new function in helper_ops
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
 <20250725100806.1157-9-jie.gan@oss.qualcomm.com>
 <CAJ9a7Vi8qpHH2SjmKNjgeY4gdRXY9wnQXhkjN71EcbYSKqayuw@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7Vi8qpHH2SjmKNjgeY4gdRXY9wnQXhkjN71EcbYSKqayuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KK06hWNXJX6XJI1OgshUQXuOzsjQNHuC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDE3MCBTYWx0ZWRfX2BQDF36H1220
 HccjtUysirmvW6RX1BD2ShJ1ELCQzxAjpgam6IcJB6O9Z5ZJbzjxyO/ZI5eQuDJ2DbbhyJd5Xl0
 nq5tD4NfMJy4fXy6PijgAzPg9U56iAk/0iHPM2AzKsBn4kst7QzlWo1e0cA+7dAaFm6rq5nbbYB
 d1IiLI4yVErSncMA0IFZve2sEemFQYTVSQ32xHi60nuJTi3aaLphnuWEwKF2vkRY1R9FqwDiAB3
 m4oRPIk7BJ+5CEKJtuLb/6LqOIBeH//oQuK79bSktfvg/OoL9BXXLXEmLvGLCzSsbPcTBCZP1Bh
 OCC86PQnIqN3cmFdwV14dnGXrarqHc3OQ+xAMXBR6KT0cJ1YjM+rlisZ1F4qZTJLR2My3uBakco
 bjnIKppGgWzjy12SmSB9PhaAgXd0OrEDsC2M92iX/ukvQ5bCGC4kuEBK4M2taG7PkNitFMqI
X-Proofpoint-ORIG-GUID: KK06hWNXJX6XJI1OgshUQXuOzsjQNHuC
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=6892a353 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=fbnrgmdL-v3imqFNrjgA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508050170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_173532_606340_909324E6 
X-CRM114-Status: GOOD (  27.14  )
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



On 8/5/2025 8:30 PM, Mike Leach wrote:
> Hi,
> 
> On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Add a new function to identifiy whether the byte-cntr function is
>> enabled or not in helper_ops.
>>
>> The byte-cntr's read_ops is expected if the byte-cntr is enabled when
>> the user try to read trace data via sysfs node.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../hwtracing/coresight/coresight-ctcu-core.c | 35 +++++++++++++++++++
>>   include/linux/coresight.h                     |  3 ++
>>   2 files changed, 38 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> index 8fc08e42187e..dec911980939 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> @@ -234,9 +234,44 @@ static int ctcu_disable(struct coresight_device *csdev, void *data)
>>          return ctcu_set_etr_traceid(csdev, path, false);
>>   }
>>
>> +static bool ctcu_qcom_byte_cntr_in_use(struct coresight_device *csdev,
>> +                                      void **data)
>> +{
>> +       struct ctcu_byte_cntr *byte_cntr_data;
>> +       struct coresight_device *helper;
>> +       struct ctcu_drvdata *drvdata;
>> +       int port;
>> +
>> +       if (!csdev)
>> +               return false;
>> +
>> +       helper = coresight_get_helper(csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
>> +       if (!helper)
>> +               return false;
>> +
>> +       port = coresight_get_in_port_dest(csdev, helper);
>> +       if (port < 0)
>> +               return false;
>> +
>> +       drvdata = dev_get_drvdata(helper->dev.parent);
>> +       /* Something wrong when initialize byte_cntr_read_ops */
>> +       if (!drvdata->byte_cntr_read_ops)
>> +               return false;
>> +
>> +       byte_cntr_data = &drvdata->byte_cntr_data[port];
>> +       /* Return the pointer of the ctcu_drvdata if byte-cntr has enabled */
>> +       if (byte_cntr_data && byte_cntr_data->thresh_val) {
>> +               *data = (void *)drvdata->byte_cntr_read_ops;
>> +               return true;
>> +       }
>> +
>> +       return false;
>> +}
>> +
>>   static const struct coresight_ops_helper ctcu_helper_ops = {
>>          .enable = ctcu_enable,
>>          .disable = ctcu_disable,
>> +       .qcom_byte_cntr_in_use = ctcu_qcom_byte_cntr_in_use,
> 
> These ops structures are for generic functions used throughout the
> devices. Do not put this function here.
> 
> This is a specific ctcu helper. Make it external to the file and
> declare it in coresight-ctcu.h

Will address the comment in next version.

Thanks,
Jie

> 
> Mike
> 
>>   };
>>
>>   static const struct coresight_ops ctcu_ops = {
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index 4ac65c68bbf4..b5f052854b08 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -419,11 +419,14 @@ struct coresight_ops_source {
>>    *
>>    * @enable     : Enable the device
>>    * @disable    : Disable the device
>> + * @qcom_byte_cntr_in_use:     check whether the byte-cntr is enabled.
>>    */
>>   struct coresight_ops_helper {
>>          int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
>>                        void *data);
>>          int (*disable)(struct coresight_device *csdev, void *data);
>> +       bool (*qcom_byte_cntr_in_use)(struct coresight_device *csdev,
>> +                                     void **data);
>>   };
>>
>>
>> --
>> 2.34.1
>>
> 
> 


