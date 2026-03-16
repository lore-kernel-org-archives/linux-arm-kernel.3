Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6C0F4644A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 10:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oES8Gpa9IGsbE249rQxahJVZ5GFUEVg0kZsqaGmBSo=; b=FJTrh6g4JUNCnPqnYn1ESMiO3M
	oTS0zPFkK5RIOaMvXNF+uiMVb+KuqTsMbE4gWJ9rVm+ORDdPnQCQVsY0ufcNSggbot72kxev/Ahiw
	vSQ9/0Bldc7Lin0HN36EyxhHeTHVBVdGBimsEeDPYYj0i5MbVgTRxdZpSFueAwGCs/knmhLzgQsEz
	e7C0JqAj0ILEe6vJd766a18o6bklLH+vHMIlh5cpnDN2YQJwUP9OdEdSYflpkqQg6MO6cddsQPNYA
	ZN25w14ZHmXeJ8XHIVhLvV8h8ZmfGOSwBkJvU16YX417d2Gg1iIbmKnoNfE0hOvbOIkLMgXKcNPTZ
	VKH6xbnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25CP-00000003kpY-3mHw;
	Mon, 16 Mar 2026 10:29:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25CM-00000003koX-0Grg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 10:29:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64bpl2672146
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oES8Gpa9IGsbE249rQxahJVZ5GFUEVg0kZsqaGmBSo=; b=UpJ+1mC28jUirm/Q
	xUVgEBXbh0nPKCvxJyaNOIwptSMaak2rKSQByPKauElcFPa7X5I6DpZHe/dMUe9Q
	FANqBQ22Mhgb2i9l5a8b+sNgiPJTB5+N9oNiQ9P2wdJ4bn3BszYEwBjzXbSf9PBz
	TcvDMhynX0oj37YPBZk4GU6rESXDiEHklYVYj5x92pfLS7sDc+0mTHuuI/ClArom
	E1e7ch/jGBa/HSfgNV7OXHGsbogZ04FADbzt732aG1mTp2N2/tTDn0ftoDTi7rEO
	5w+0dUPinQmEZxahsFm2DkIoApnnsNkaOiWS6GtFARXQe7KB9EYtCM860sPYtxh+
	vnq8Gw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xn92v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:29:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aeb90532f6so53243045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773656960; x=1774261760; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oES8Gpa9IGsbE249rQxahJVZ5GFUEVg0kZsqaGmBSo=;
        b=jW7wvON1XyWbut5UaQBrpli0sUudx2Nd5KgRv84rHGT34FEpPP+6fFJmHsjPFkWt/k
         jVFOkmA5rmOA0sQ1XKEoTuyY3r31KybbTNYC7dvPguhTDEw+/jWkXtxbkkQK6KOCBtCB
         yiYk6/KggPiOn92Z5IKuN61aS/QDvSwNXjeJ7pjzqh6lZDiZGMsvngVlUORi+5dZu8y7
         7h9FH77oJZ8we3qp3pTP6rTd0rJPqXlcHds/q5qA/ZkBNXPjm7uDfvG5faFNPm/QkA5j
         Ldfw88ZPLIRMtUZ8KwrUhA3G97xo8zkjnH9RhcaVyIqCBL9+x+a5ikgSSc0WPjqA8sbI
         6Epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656960; x=1774261760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oES8Gpa9IGsbE249rQxahJVZ5GFUEVg0kZsqaGmBSo=;
        b=eVpsVF5o4ZbbcA8qKiXpzV22jwM1QT+sqlVAMc6qTkHBmC75IJzuGKKPKmldTjcEuL
         hOl1jrELGHTS94nNe4G2RjWevO+GyQ82FI1VxSwIdSicrxWWNguJSdme2MTQVIuPeDLF
         vMojNUGmoElTY7QWUdsR0nSwbHwHa7Et+mq5AFxm7PugNJouxSQJIJEEYGAaZguzFHs+
         lRX5UKm9LSYcMyLyjmHm0sezkrLqVIFG3ULw+xRaEhcHX9T93TPZVyi0mm8KYBDmf5V5
         qgJTKev2gAM7MH+f8ZCkZeijRhHmH2FdzEE9tqteOeReOErY6cVtqrVpYEY+xYre+HdY
         cahA==
X-Forwarded-Encrypted: i=1; AJvYcCWGtopTlQuEOq3b0qUrPtOjCvhMWgW/cMQkFOBIJmF473356JyUvDIa6kz138qmdfAuLH9jsNyvABR2+haoxpkT@lists.infradead.org
X-Gm-Message-State: AOJu0YxM56WxIaaiF22aaVOdbhy0eH8CWlgC9fjyTuU6n+XMbBSTHpeh
	+agLu9IczX3KnOdqs7hiaXXtap2gQUNVvFajXQX5A6NH23FVH6+NfD3m6s8RMDZnkBcqluHoue5
	5Pc08ir4s6mwBnyrdBt0Cf9CrkeH8pTelgkDSbAjaHAO1j8PfQnfVVpA9IiT+/LyRRYL75iLFj4
	WvHA==
X-Gm-Gg: ATEYQzyj1eA11cC67fFNhIQNyRhLq0sDKbow17uZT65X72s6uA1W++FG1DEQLc3nExX
	Y5Hqm2h1oPi7BomaZ/sVRQHFUAr4ZT8gU/w8ZB35GuifG/hdKYjmtFyslIk4H7COPOsuX9NXUMf
	mA6zETix3HAqrFMpCbST8KhcRZs4krCBRzgdvTO6VFaX/c4TnlvdCZ1ulwIlaGj1ec7PhjgsR6N
	Xvpd6ObqmUhoyl8Zsai+m7PAtuPYQos59OL+EjfhxGvyNtIXg5k+hyXHe/SiCfxpYoYD0DsoI4p
	+XKu4w9hfkAHx6g78bzxaCbm06HxTcRPoblK/EPFDusHtPIZAyA83sHrkTcdQFhj5LKH1iIJUou
	/E570W2wVT8K5CTM9EEz4QpkSl982/g163DJbRPSQLSB6ifzTrq+VlNUdsGyzYLiCBpG7K2Xwca
	89/ihKjWbPkYk=
X-Received: by 2002:a17:903:3c4f:b0:2ae:aad7:5811 with SMTP id d9443c01a7336-2aeca9a908amr142064495ad.11.1773656959800;
        Mon, 16 Mar 2026 03:29:19 -0700 (PDT)
X-Received: by 2002:a17:903:3c4f:b0:2ae:aad7:5811 with SMTP id d9443c01a7336-2aeca9a908amr142064155ad.11.1773656959317;
        Mon, 16 Mar 2026 03:29:19 -0700 (PDT)
Received: from [10.133.33.135] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0542909d8sm48209605ad.31.2026.03.16.03.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:29:18 -0700 (PDT)
Message-ID: <8f37ae07-f211-4d43-bc01-4ab17a0d1f32@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 18:29:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: tpdm: add traceid_show for checking traceid
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260316-add-traceid-show-for-tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com>
 <a503ecdc-53e9-4c7a-b228-f697fb9c0ac6@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a503ecdc-53e9-4c7a-b228-f697fb9c0ac6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MCBTYWx0ZWRfXyrZs4Kiu4SXl
 Z9t7aLhLBck81l/qVER+sotBizoJjGrvIiBdBBILmaM3ZcENDsl78qpSmBynp1aGrw7LwOgC6lN
 SDtEGtGF8YfPIJEs2HK+4kKpBOFAaVnIFd9G5QubZbCFyfpgph/550TLPSqOgn49zU7C3SibTTR
 Uc6Kuy1VPvFAVvHi8l+01DK/1cSOJAjx81A2tiqgEhBHDj5/p//i55KsCj/nGdOQ4ypof8i3xIS
 uM+NimSdrmuc6V088zovBfRVSMIDMkid2kU5EC9nJZ6oWhksEp4utlXeMMYxKUGqN5yOvd6C+s5
 rl7rHQEWC7mzhRVdHiRLDfdSqgW+ep0+HFpuRtsKm+2OckiRCWtsjslZnpWGuDr2ikHB7YSLKPF
 7YA5IE/qwjSs5ynHhtDJUQJrZ0xnXQcdU3+JtjQq56C5b81doxDXg00xAqwmoJlwSlQnoZLrgHc
 oNue/w0qyJiAIZQBoKw==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7db80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bGktN_mo5dDm-SOVuGEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: s4tCIvn12NpL7_KIfLS2yrNPS9T7aJtJ
X-Proofpoint-GUID: s4tCIvn12NpL7_KIfLS2yrNPS9T7aJtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_032922_828189_9E2A478A 
X-CRM114-Status: GOOD (  27.60  )
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


Hi Suzuki,

On 3/16/2026 5:32 PM, Suzuki K Poulose wrote:
> On 16/03/2026 07:23, Jie Gan wrote:
>> Save the trace ID in drvdata during TPDM enablement and expose it
>> to userspace to support trace data parsing.
>>
>> The TPDM device’s trace ID corresponds to the trace ID allocated
>> to the connected TPDA device.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in V2:
>> 1. Use sysfs_emit instead of sprintf.
>> Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show- 
>> for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
> 
> Why is this patch required even ? For each TPDM there is a single

It's taking effort to retrieve the trace ID of the TPDA device because 
it's not a source device. The trace ID is required to identify the 
origin of the trace data and is essential for parsing the received data.

> port in a single TPDA in the system where it can reach and that is
> fixed for a platform. Can we not get this from there ? Also, there
> is not TraceID technically for a TPDM, right ? It is all a property

Yes, we dont allocate trace ID for a TPDM device. The TraceID is 
allocated to the TPDA device.

Thanks,
Jie

> of the TPDA ?
> 


> Suzuki
> 
> 
>> ---
>>   drivers/hwtracing/coresight/coresight-tpdm.c | 31 ++++++++++++++++++ 
>> +++++++++-
>>   drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
>>   2 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/ 
>> hwtracing/coresight/coresight-tpdm.c
>> index da77bdaad0a4..774a63def817 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>> @@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata 
>> *drvdata)
>>   static int tpdm_enable(struct coresight_device *csdev, struct 
>> perf_event *event,
>>                  enum cs_mode mode,
>> -               __maybe_unused struct coresight_path *path)
>> +               struct coresight_path *path)
>>   {
>>       struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> @@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device 
>> *csdev, struct perf_event *event,
>>       }
>>       __tpdm_enable(drvdata);
>> +    drvdata->traceid = path->trace_id;
>>       drvdata->enable = true;
>>       spin_unlock(&drvdata->spinlock);
>> @@ -693,6 +694,26 @@ static struct attribute_group tpdm_attr_grp = {
>>       .attrs = tpdm_attrs,
>>   };
>> +static ssize_t traceid_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    unsigned long val;
>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    val = drvdata->traceid;
>> +    return sysfs_emit(buf, "%#lx\n", val);
>> +}
>> +static DEVICE_ATTR_RO(traceid);
>> +
>> +static struct attribute *traceid_attrs[] = {
>> +    &dev_attr_traceid.attr,
>> +    NULL,
>> +};
>> +
>> +static struct attribute_group traceid_attr_grp = {
>> +    .attrs = traceid_attrs,
>> +};
>> +
>>   static ssize_t dsb_mode_show(struct device *dev,
>>                    struct device_attribute *attr,
>>                    char *buf)
>> @@ -1367,6 +1388,12 @@ static const struct attribute_group 
>> *tpdm_attr_grps[] = {
>>       &tpdm_cmb_patt_grp,
>>       &tpdm_cmb_msr_grp,
>>       &tpdm_mcmb_attr_grp,
>> +    &traceid_attr_grp,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group *static_tpdm_attr_grps[] = {
>> +    &traceid_attr_grp,
>>       NULL,
>>   };
>> @@ -1425,6 +1452,8 @@ static int tpdm_probe(struct device *dev, struct 
>> resource *res)
>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>       if (res)
>>           desc.groups = tpdm_attr_grps;
>> +    else
>> +        desc.groups = static_tpdm_attr_grps;
> 
>  >       drvdata->csdev = coresight_register(&desc);>       if 
> (IS_ERR(drvdata->csdev))
>>           return PTR_ERR(drvdata->csdev);
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/ 
>> hwtracing/coresight/coresight-tpdm.h
>> index 2867f3ab8186..befecbb896f4 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>> @@ -300,6 +300,7 @@ struct cmb_dataset {
>>    * @cmb         Specifics associated to TPDM CMB.
>>    * @dsb_msr_num Number of MSR supported by DSB TPDM
>>    * @cmb_msr_num Number of MSR supported by CMB TPDM
>> + * @traceid    trace ID of the path.
>>    */
>>   struct tpdm_drvdata {
>> @@ -313,6 +314,7 @@ struct tpdm_drvdata {
>>       struct cmb_dataset    *cmb;
>>       u32            dsb_msr_num;
>>       u32            cmb_msr_num;
>> +    u8            traceid;
>>   };
>>   /* Enumerate members of various datasets */
>>
>> ---
>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>> change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00
>>
>> Best regards,
> 
> 


