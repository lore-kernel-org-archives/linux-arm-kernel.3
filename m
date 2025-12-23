Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CE8E6B26D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 02:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2ebAFH76wuhU16mLw9Eh/b3uTuvQK1t9bRdgQD+sg8=; b=uvFv8Teqfz3HOjYOMtWJUsUDOY
	nyf/Y9TVQbScUHKCQJddc/6GtTZXtZOAS42dHIJm+teRDI5is5hQ9TRDt5wZb0CPuNXzyDKjot+3V
	m9mG5G9RhSJOSYt7ZSBX0TWUfy13rQzrnFLMrx+fO2XmTuqDVlpFDrCImffgne6R0EbyJC5otmkpS
	qe2AjNhEMD9VmO7zX5PtgkQ1qm0PTqgtMIISaJPZZaf/m164REyvKwOLbGpehsQ2XIpKG5FdrU3B8
	9crT6BIADDYL2j0n2j0C78mfx3Tyr3U2MzjBKb6gUFoF1+RtFfnk2IGGABOCfHJ6qIt90Bpc5obja
	Y3onxAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXrt7-0000000EPu9-2WEP;
	Tue, 23 Dec 2025 02:12:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXrt4-0000000EPtk-1xp6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 02:12:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMFkvF11356364
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X2ebAFH76wuhU16mLw9Eh/b3uTuvQK1t9bRdgQD+sg8=; b=ZGEfAq73x4J5gRRB
	YmwS5vRxtaTPzSsT/KlYReQm85OX6TUcbu2VklGLzjXEjJlLdePEb8LckM0zQfEf
	LYzHOGaD7HByDtpS42KGjlkVDu/grG4YcPWKJ9BIg6vVx65w/rdfRtXWpg8rFCUB
	NTphomTC+gDSUsIB/ILGh8NkzC/QiELiz+d6gtQoB9S1XbwLQMbj7HUz5suX14lf
	eaR2C580YznvilI/sWdwu/3Amls+e1MzZRgsw16989nQRJtaF8z6XOTTHWbmBRew
	E1qBA0D2tLc5yTt1I1oh5vjc2+uFjeDJ+6JGqyWaUUGupN+fHj1aGi0DnlvIGcgQ
	eDiCMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc1brk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:12:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f79d6afso64472925ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 18:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766455952; x=1767060752; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2ebAFH76wuhU16mLw9Eh/b3uTuvQK1t9bRdgQD+sg8=;
        b=DV9uU9T1U8FIFc7/E2RLobPKDQYM6B4b+iAYdz2wYJCP/ZWELMGYZMXc0aYRiv3eGl
         QA9P7LnhjBYh4XLpP36yeYvbP7Tet+TXUazy1goRzOl37TPCoGXEkaykRdJ+RY7XX7qE
         FFjt29gjkNDql13ufj6Z4dChUs+w7UQjZp6Nbg2Qgg5p255U+avxpjOILvSOeM94NW4L
         eRDDOaHM5CjgeUQ1DHFjfygZbiFqDI00+CuYeTCf6CxZ6yypLk+5c7g0KwqrMXeopQzs
         O6R4uCylHn+8LdnRWLO9J7yeMgIihaC2jrDvXkRomAhlwCoEzeRuSMFDQgI/9rVdY8Yn
         gLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766455952; x=1767060752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2ebAFH76wuhU16mLw9Eh/b3uTuvQK1t9bRdgQD+sg8=;
        b=PcV22jiQF0HzHz+58t3PwpWxr+LnsSF/rce3N2k6dLlUiOXgZJxq8kP7qkCvOMO2Fm
         Jfx7E9qEydWHJr1SswY9EQYizrMqq12vemjnjZkCx01uVuo2nWGkl+RafZ1C1XKbSMz/
         N/gJCtKD5Qp8spbMwIhQPakQk7vRy868ZLWVXRJBPny6uXMqBUNXoLlKiIPrzzKwlVYY
         lAKxepEO+p8UwcfVu9yGcpznTmB2GUAKSGJAdd84vGMhEQq6fyVES/j5Ayj8ekfYJPZs
         fIHaJlqYm3ClfdKWOLul9dznQVstLog4J4W0PT+K+SX4sDcPDQZLePqKcjvp+3e4y6Id
         FB9A==
X-Forwarded-Encrypted: i=1; AJvYcCUGcHiCPLQusoCp/kIiDobjRti44G7e1KUeT3TJOOGegXqMJJpZ3fxPA4cnM1/nxyLgovpo+fvSU2aeE7NGrGO9@lists.infradead.org
X-Gm-Message-State: AOJu0YxUqstZ6yuFm0rO/8TkD+tQJP8eG4iOK+Hn/Vvys0p12BJ6iY8y
	vSj2tu1G2iaAd9c4c6S4O2ss7wJa4C0fPRQesUx7xgZXLpNg4HKrmkevrKqTc34zrmpEYqjAKZY
	BWmWoKiTQRbj8ek0VytUALX2kq7b10Zxhzb3nozK4SqOLCkbqAH7iH5SN4iCQ2f00fnPeMLTnEc
	Eqaw==
X-Gm-Gg: AY/fxX755UqdvTcuVEM1UaVjwITfjSpWedWxA/e453dKh6Jy8/XDoPXSXsizIUYSfS4
	2ea/L8f694jtKZwiLzbFg3LWL8D+kPIxu31M2mx4SQmWlJ3sDxuLpmG916pm/uBDpp5E8m+2ZI8
	O7cHiNtYQKSVS2pjyW1TNXSXbY1YoJuRRGGlOJ188u3UvQhhENt6Qld+lVzAY5kEh9/8MR9jD75
	8BVwBt+jdABOsw54ziq61RYhSQApd+3sz85ND+nLQPvhs6/CzpoAEwwfCHlkb2yKNU1BrTZDl26
	fBVRdi3h7dXAOCVrnk7YrbIqvtELVousjuv+oUW6G6mUDRWDEv3FvwdG8ckgL99ioGaedt6ewUY
	psfA+nq85cajsgr8D6vovAvB7YMZQ57Z+yArSZgx0fkh6JtU5KZKKfH5chwSlwZOt59NM5iupYP
	g=
X-Received: by 2002:a05:6a20:3d89:b0:35d:4de7:5e8 with SMTP id adf61e73a8af0-376a7cf44a6mr12196141637.20.1766455951773;
        Mon, 22 Dec 2025 18:12:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDBaQrjWSSKeIY808OJ/fKMaC5VtWGDo1J7huk3DqtaPAAp1ctnsUO2t/beek1Q7sywk9x+Q==
X-Received: by 2002:a05:6a20:3d89:b0:35d:4de7:5e8 with SMTP id adf61e73a8af0-376a7cf44a6mr12196115637.20.1766455951187;
        Mon, 22 Dec 2025 18:12:31 -0800 (PST)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd6242fsm10277275a12.22.2025.12.22.18.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 18:12:30 -0800 (PST)
Message-ID: <9249de66-89de-4365-a821-3ca8718b38e4@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 10:12:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] coresight: tpda: add logic to configure TPDA_SYNCR
 register
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
 <20251222-add_sysfs_nodes_to_configure_tpda-v6-3-b27143d45c86@oss.qualcomm.com>
 <684e06d2-1d90-4b89-96d8-7458f79e3cc9@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <684e06d2-1d90-4b89-96d8-7458f79e3cc9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ej8fb0kPiDKOOFd29ywZmlQAPU3tenP1
X-Proofpoint-ORIG-GUID: Ej8fb0kPiDKOOFd29ywZmlQAPU3tenP1
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=6949fa90 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8-9xBe79CkFr4NHhixMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAxNiBTYWx0ZWRfXxWqwOol8+hEX
 tBprO/h7HNi0Un0vaqaknPYKv40AP8mmqMU8j71bBMK2Q5UWcJDYQosu2j6Es27wOY3d7INl5Kz
 YOc70veshKfSRFAbg0/WgUMQ2roKl4oniNezmSp0rtCXU2yTFhEMjQ20+mmjvH/U9gCMpTVsJtr
 EsQ9fdCUFj8i0QCN2AQ5p431/2L3XLSOJw67OLpEfcOp7nXsIzIA0n93nqVjOhEN7MCbCe50sO+
 S0hMlufSXC37GUuDRohquUMhJxrgd72m7sF0vi+7qWcNKn+3RzCGlNBjpfhUfsHks0uWxC/q/7U
 2ut6VuFTI2OsIEj64ZfbGVexxfT6P92NvtyG7/DX/xjz9lC0XysSmwjbJEp6hBtW7R0BWYN7KH9
 DelzLKQigimxGTo8q3nkwZa21/e+W3j1Hl/V1qIg0U2mNlwf21bJ8NkY+Whi03Lc4JBs49VILGB
 hNgY+rFc1JhXDEBiznA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_181234_633128_33B14EA4 
X-CRM114-Status: GOOD (  29.64  )
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



On 12/22/2025 9:10 PM, Suzuki K Poulose wrote:
> On 22/12/2025 06:02, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> The TPDA_SYNC counter tracks the number of bytes transferred from the
>> aggregator. When this count reaches the value programmed in the
>> TPDA_SYNCR register, an ASYNC request is triggered, allowing userspace
>> tools to accurately parse each valid packet.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   | 10 +++++
>>   drivers/hwtracing/coresight/coresight-tpda.c       | 46 ++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h       |  8 ++++
>>   3 files changed, 64 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> index c8bc7b19ab25..d359d90dca72 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> @@ -41,3 +41,13 @@ Contact:    Jinlong Mao 
>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>   Description:
>>           (RW) Set global (all ports) flush request bit. The bit 
>> remains set until a
>>           global flush request sequence completes.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/syncr_mode
>> +Date:        December 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set mode the of the syncr counter.
>> +        mode 0 - COUNT[11:0] value represents the approximate number 
>> of bytes moved between two ASYNC packet requests
>> +        mode 1 - the bits COUNT[11:7] are used as a power of 2. for 
>> example, we could insert an async packet every 8K
>> +                 data by writing a value 13 to the COUNT[11:7] field.
> 
> What is COUNT here ? and more importantly how is this usefule without
> the support for setting the COUNT ? Do we plan to expose setting this ?
> If yes, why not now ? I don't see the point of merging "this" patch
> without the support for setting the counter.

During enable_pre_port, COUNT is configured to its maximum value. This 
counter tracks packets received by TPDA and inserts an async packet once 
the specified value is reached.

I will add the sysfs node for COUNT. I didnt add it because we typically 
didnt modify the value of the COUNT, but it's better to have a node for 
setting the value when needed.

Thanks,
Jie

> 
> Suzuki
> 
> 
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index d24a9098f1b1..7baa8a0965d3 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -163,6 +163,15 @@ static void tpda_enable_pre_port(struct 
>> tpda_drvdata *drvdata)
>>        */
>>       if (drvdata->trig_flag_ts)
>>           writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>> +
>> +    /* Initialize with a value of 0 */
>> +    val = 0;
>> +    if (drvdata->syncr_mode)
>> +        val |= TPDA_SYNCR_MODE_CTRL_MASK;
>> +
>> +    /* Program the counter to its MAX value by default */
>> +    val |= TPDA_SYNCR_COUNTER_MASK;
>> +    writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>>   }
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>> @@ -385,8 +394,45 @@ static ssize_t global_flush_req_store(struct 
>> device *dev,
>>   }
>>   static DEVICE_ATTR_RW(global_flush_req);
>> +static ssize_t syncr_mode_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val, syncr_val;
>> +
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    syncr_val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>> +    val = FIELD_GET(TPDA_SYNCR_MODE_CTRL_MASK, syncr_val);
>> +
>> +    return sysfs_emit(buf, "%lu\n", val);
>> +}
>> +
>> +static ssize_t syncr_mode_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    /* set the mode when first enabling the device */
>> +    drvdata->syncr_mode = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(syncr_mode);
>> +
>>   static struct attribute *tpda_attrs[] = {
>>       &dev_attr_global_flush_req.attr,
>> +    &dev_attr_syncr_mode.attr,
>>       tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
>>       tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
>>       tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index 1cc9253293ec..1d2de50bb9f9 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -9,6 +9,7 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>> +#define TPDA_SYNCR        (0x08C)
>>   /* Cross trigger global (all ports) flush request bit */
>>   #define TPDA_CR_FLREQ        BIT(0)
>> @@ -36,6 +37,11 @@
>>   /* Aggregator port DSB data set element size bit */
>>   #define TPDA_Pn_CR_DSBSIZE        BIT(8)
>> +/* TPDA_SYNCR counter mask */
>> +#define TPDA_SYNCR_COUNTER_MASK        GENMASK(11, 0)
>> +/* TPDA_SYNCR mode control bit */
>> +#define TPDA_SYNCR_MODE_CTRL_MASK    GENMASK(12, 12)
>> +
>>   #define TPDA_MAX_INPORTS    32
>>   /**
>> @@ -52,6 +58,7 @@
>>    * @trig_freq:    Enable/disable cross trigger FREQ packet request 
>> interface.
>>    * @freq_ts:    Enable/disable the timestamp for all FREQ packets.
>>    * @cmbchan_mode: Configure the CMB/MCMB channel mode.
>> + * @syncr_mode:    Configure the mode for counting packets.
>>    */
>>   struct tpda_drvdata {
>>       void __iomem        *base;
>> @@ -66,6 +73,7 @@ struct tpda_drvdata {
>>       bool            trig_freq;
>>       bool            freq_ts;
>>       bool            cmbchan_mode;
>> +    bool            syncr_mode;
>>   };
>>   /* Enumerate members of global control register(cr) */
>>
> 


