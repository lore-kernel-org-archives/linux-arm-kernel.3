Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED66C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 00:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iF7VyAktj1df9uStQYVjfJ1tKq1t1jAnCoxG1j63Og=; b=sWEu7U21VR7vEogyAlQJLEAB+g
	BqRB6GA8/VCy6Vijifpb3j+UbZJuNDrgSZ+O07+sIdo8gipza4MGRXhqYEg3YwNjiBH4IMOEUndLB
	oYJBl4W9QddLglmREkZfknj6gu3r1RjrP6qahC/CXRcloukK5eM65CsI8nZXoX/RHCySbfNU3m3pY
	9CpxBO/BD1S7o2qCR9S0sZ8TEu/3eYQpPIK14DHTJNR6Arg5IQsLJC+8rmkupq54q6Wgh8REMjJu6
	ODQrCV5zP0yyvFZzZtGgR7M7+er4iEK2Z/q11xVBR1en1T65SCiiLyJlOOSHcO2Xoq2y5oF4IGzFd
	fZDMfv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSKX-0000000E4yF-3mUO;
	Wed, 06 Aug 2025 00:48:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSHx-0000000E4ps-13dA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 00:45:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I3KjL016910
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 Aug 2025 00:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iF7VyAktj1df9uStQYVjfJ1tKq1t1jAnCoxG1j63Og=; b=Lqa7HURTFNlxNvtI
	M604CNroFqhwQv0SyDPFVLfZjZH5SG4e57qqdzE90SJ3n+r8o3a+i0lNiSs2QIYY
	JjCJRG3YpDGS7fpIKLueHnO1EXpK55ZjvyDoV01RhdhRJtXV8CriqXlLzqXOVGZP
	HLyJPLyzOA4IhSS9KQeNuOSvAJXpy9HgnVsBhPpE2Yiq6F2UXn+RlsOPrJDL3mox
	7eZQ6itChPlZUuPH1QbAsSZ66ixdbnVY+rK9KCez3GouHkPD+72jGiGa+cHtyqqk
	NhufmR9S3gGJi2LssloDK61t4Gbi5MfeZCNO+0Nsbt1lcFHwdKyZKiWBx7GMkryi
	grprMg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvxrvs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 00:45:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fe984fe57so69227795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 17:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754441151; x=1755045951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0iF7VyAktj1df9uStQYVjfJ1tKq1t1jAnCoxG1j63Og=;
        b=eAxdxNhZwbmrvJp0VtW8iXbT5zv4ILzvD/mi0SnprXjmU/8SLqthuH0iLhsgHYHb/r
         e+j0zfbppCie67+8H1BPRcp7NR1qdUv6JVVySeDXxnPtvx+2QvzdB9FLKqC7TPk/JOFe
         IXu7blNrz45i3xhILsIWk0Oc2SbgSEt403mL0PvX9SlqMnCw2WqXXgwwQo8Xdo6GL6CS
         qrufr4VtcbDO13AJqJSqXFS4OcyhBGZ3ARYuyTCyNddON0GY88ZsdI8gQ3tPiWZm0evS
         0R3sYUeBkkNp3ivQ+8eOqcXKbYmV+ImH9v9bHNn9lwuPSZLZjIwDkxRdnO6NMssp+Tu7
         OizQ==
X-Forwarded-Encrypted: i=1; AJvYcCUth7IBUk/LCXmwE9Ibm+WYrEegwQNn5BB6Y1AhyL1Fpzx2Y6n0dfIlgWne0f83x+54S+gWsnreXkYRA4gO/oJi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5k5vys3gvd3NIfxEUeKEAyKWzBcA+ElvItRW8WEsJ/6q1OY24
	Z1G+bN3nwFGj4BgtnDtXp4R/uJGdLOjSOA32l7nCepIzCsmj8/MkGfMlnXwqGCYrwbnMzp86uo4
	KPpJmZiqbNR2MeoKee/D/nmrJm2dQmYrsxWDyZBwTFc6JbQNUhH6+6F8TyQxVpU2UsE9cGgIwWE
	9oUA==
X-Gm-Gg: ASbGncv7/hvk1nqEIWMpWfd7TVRk85wgdg46PUojndk4gUIq8e/TA3xi79nRQXMMOA7
	8eEv7IEOXCWywGi9q2EzaqklZ1HgxAZxIuLrYOJAHxhnbUSAKf3f0oNnxfqHbYhhi5LKiRet/Qp
	UiwsgiSXn6nYd182VcMdAdWYN0WOTeEXo/POADsXwHDkcQ2CMymCMvK77/sKV3S0ywBeDCx0T9J
	0aUFYJPd5ZVEBSm+MRb5diKOCOjlBGTW0w4m5+Nk/6sqvuHxpGMV2OJ22DfATIkAyaa09SZs1dv
	8jS+s7ZWi6fEf89h9eKdR4M6qjWGK57TIux/nLXVxKevAP2jGoziKWJAmBzOZqsMUVQzkufOdb1
	A4uMpPbha67RbUmNSVs6fGlmS
X-Received: by 2002:a17:903:120f:b0:240:8369:9b9d with SMTP id d9443c01a7336-242a0a90da9mr9569525ad.9.1754441150821;
        Tue, 05 Aug 2025 17:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvEEsM420ujNnosuNHEbFJFINBlZS10U2Hkuy33LauXmSRAro+5w56Hd5w+DB2dVJIMtSXIQ==
X-Received: by 2002:a17:903:120f:b0:240:8369:9b9d with SMTP id d9443c01a7336-242a0a90da9mr9569215ad.9.1754441150382;
        Tue, 05 Aug 2025 17:45:50 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f0ba97sm18047477a91.29.2025.08.05.17.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 17:45:50 -0700 (PDT)
Message-ID: <d7960d95-d076-4c0d-929c-421480f330d4@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 08:45:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] coresight: tmc: add create/delete functions for
 etr_buf_node
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
 <20250725100806.1157-5-jie.gan@oss.qualcomm.com>
 <CAJ9a7VgOTfDHG+nrEUQ5+fxrcCd+ZaWWnxt_F8kavbHP38QCVw@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VgOTfDHG+nrEUQ5+fxrcCd+ZaWWnxt_F8kavbHP38QCVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwMCBTYWx0ZWRfX0lShMxtZEH90
 OdJZ6P3aRt/ul2rtWS24yV5x3t5NSLyQoRDttAlXZD1/XImFuy6mPlZFgbFVXTZ/05GH6x6VkdL
 t0jKmxDtauWXD5yXkhGHK5I/fVY7b0kzaEqKmHhQrE0zmVUylw5rhKQ3dQBEF4QIb9q0dBblzud
 yyJBATX9RB/HY/FBKfCoXLya6l9jbyOQ3SaHT/K254icMGyYqYEiuJnE5VcLrFILuVrWHJmGsFp
 gIYuLSL83wNFDliVA5i8R+Qirr6x61jqrRVKI1oaBbItZy2rHEcWGtgyucEihu1KjWUh4qYWQTo
 KO1X3mH+e4zu8XERlfwETdaN21juxzAx7ygFXrmE5iq5Mqg7RJJXYmeB9W+TdQ2h6nF7HWLJX5G
 Vajtk85tzWMnUHNBWWyBZiQt+EsWvzfOTNfAyIN1AfQ51P/5oYEIaDCRsVf83WGmqWbHrKaw
X-Proofpoint-ORIG-GUID: 5n-tu5zhUnos6qiXg54oIUzt2vuyZfFl
X-Proofpoint-GUID: 5n-tu5zhUnos6qiXg54oIUzt2vuyZfFl
X-Authority-Analysis: v=2.4 cv=U5WSDfru c=1 sm=1 tr=0 ts=6892a5c0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=_2nvVlcBbLE0w9leeUgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
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
X-CRM114-CacheID: sfid-20250805_174553_419656_3939802F 
X-CRM114-Status: GOOD (  30.01  )
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



On 8/5/2025 6:27 PM, Mike Leach wrote:
> Hi,
> 
> On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Create and insert or remove the etr_buf_node to/from the etr_buf_list.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 65 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h   |  2 +
>>   2 files changed, 67 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index b07fcdb3fe1a..e8ecb3e087ab 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1909,6 +1909,71 @@ const struct coresight_ops tmc_etr_cs_ops = {
>>          .panic_ops      = &tmc_etr_sync_ops,
>>   };
>>
>> +/**
>> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
>> + * @drvdata:   driver data of the TMC device.
>> + *
>> + * Remove the allocated node from the list and free the extra buffer.
>> + */
>> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
>> +{
>> +       struct etr_buf_node *nd, *next;
>> +
>> +       list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
>> +               if (nd->sysfs_buf == drvdata->sysfs_buf) {
>> +                       list_del(&nd->node);
>> +                       kfree(nd);
>> +               } else {
>> +                       /* Free allocated buffers which are not utilized by ETR */
>> +                       list_del(&nd->node);
>> +                       tmc_free_etr_buf(nd->sysfs_buf);
>> +                       nd->sysfs_buf = NULL;
>> +                       kfree(nd);
>> +               }
>> +       }
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
>> +
>> +/**
>> + * tmc_create_etr_buf_node - create a node to store the alloc_buf and
>> + * insert the node to the etr_buf_list. Create a new buffer if the
>> + * alloc_buf is NULL.
>> + * @drvdata:   driver data of the TMC device.
>> + * @alloc_buf: the buffer that is inserted to the list.
>> + *
>> + * Return 0 upon success and return the error number if fail.
>> + */
>> +int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf)
> 
> This list handle function pair look a little asymmetric. Is it not
> possible to change this to tmc_create_etr_buf_list(struct tmc_drvdata
> *drvdata, int num_nodes)
> so that one function creates all the nodes, and another destroys them.
> 
> In the logic that decides between using multi buffer or single buffer
> you can then use  a construct such as:
> 
> if (single_buffer)
>        drvdata->sysfs_buf = <alloc sysfs buffer>
> else {
>       tmc_create_etr_buf_list(drvdata, 2);
>       <switch in avail buffer to drvdata->sysfs_buf
> }

The lsit handle function pair definitely looks a little bit asymmetric. 
I will consider the suggestion in next version.

Thanks,
Jie

> 
>> +{
>> +       struct etr_buf_node *sysfs_buf_node;
>> +       struct etr_buf *sysfs_buf;
>> +
>> +       if (!alloc_buf) {
>> +               sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
>> +               if (IS_ERR(sysfs_buf))
>> +                       return PTR_ERR(sysfs_buf);
>> +       } else
>> +               sysfs_buf = alloc_buf;
>> +
>> +       sysfs_buf_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
>> +       if (IS_ERR(sysfs_buf_node)) {
>> +               if (!alloc_buf)
>> +                       tmc_free_etr_buf(sysfs_buf);
>> +               return PTR_ERR(sysfs_buf_node);
>> +       }
>> +
>> +       sysfs_buf_node->sysfs_buf = sysfs_buf;
>> +       sysfs_buf_node->reading = false;
>> +       if (!alloc_buf)
>> +               sysfs_buf_node->is_free = true;
>> +       else
>> +               sysfs_buf_node->is_free = false;
>> +       list_add(&sysfs_buf_node->node, &drvdata->etr_buf_list);
>> +
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_node);
>> +
>>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>>   {
>>          int ret = 0;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
>> index 52ee5f8efe8c..3cb8ba9f88f5 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -461,5 +461,7 @@ void tmc_etr_remove_catu_ops(void);
>>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>>                                     enum cs_mode mode, void *data);
>>   extern const struct attribute_group coresight_etr_group;
>> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>> +int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf);
>>
>>   #endif
>> --
>> 2.34.1
>>
> 
> Regards
> 
> Mike


