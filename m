Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1E3C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=; b=tfQ+IKJBM+rk/N42cXg0SLRbC1
	GMf+yfTg60Vnp6B12qFh9Epg2nl9MIO1oqv61s398yZu1Y8dK21T3JjqZSCh45cXJu9DZJ84JR+Bp
	I8CXjbmQQwOunnn+u9t/xA1ou/RXg+UAcAoq/n178L3SSmpEruB7mOh6Y+8UqH/QcsZAoXixzBMAs
	vZjVb/rtt5AqL2RA8hbZ2ZeXFyP8OwnatqIyUuepm3quP95QvVRsiBMw5lwkG76mFco0VKQ/mP9Yy
	uvS17Dpo11gXq6gLK5d274VOAV43Km7W2Uclo4g7hhLcU0C34pa9exQQXKQNaoQ0IwbCo+P9Mnxre
	nA8uAQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VQ1-0000000E20O-3wQt;
	Fri, 18 Sep 2026 10:02:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VPz-0000000E1ze-0tBG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:02:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9eOVO522718
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=; b=AqKkK2Z+nF+Z/dGt
	FWBPIBa9LfPCRuhIMDS79rzdtAonoYumPp1/erhcFZxnlhFx2qXcCfasS6QCaRzq
	PhJXaQ75jatiT5KGqZlOElNbKQgH7nwxVEuyHjgrEdJAwC8oJ9fGmXSwkOUx95Mv
	wL3HE7/XAeLp33/7aUlJ3RPC/daRq2zVZrKDWfeJvzou1Cun6Gsimf6vDEQxTfRv
	g62tVzKbpRzjhexa76EFC0MrEzbjEwUKX3WhiKKFSt87TGbCmTnqAMqa/o7sLVqA
	KK55FrH3OweXu3HkaexGQ6aJ9mMoYwLaVNuxbgDAhx3nwHn+sLQzHPBmcxsuL0YO
	CiAppw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqebc2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:02:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79129463bb2so151309137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725725; x=1790330525; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=;
        b=Hb7Q+VawOqMC5nHgMmo++gMPJIHTMfp+6TR3L9yFvcQYQqSAKSJRzBRJwzjQIrzazv
         7Ttv/AhCuwA5wkxO9vXGXY82vB4mE/etTVWvFdSKpH9quCa9W6Lar6rJSVO4MfuZ7Isg
         vR5hOUMky6IwwDrgtrpHXQCHZdYbBHP4dJyvTfnYsVS4aLNQkxsNHUMXu5h3nhuIDf6Y
         1ZN82RHCEKoAyRqwcnrA3C0svzmqbJa6HijLP0HdLKt4Ec66510xRwpS/fPn2nRcte1C
         2vjFh9lCAcOQWpusQkE5wv0gdk8OaqOpDuUGzAH6+zMKCwrsIyPEgr1Qsu/axh6RnrGT
         S9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725725; x=1790330525;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYA58SCxkPQpuxebyIQOtCSJePOccGQb1BNaM1QCZVY=;
        b=g54rhoBrsNg1rfjkX8T8RP+kiC3GJabXQ/Ao0UeinLoOgn99rPjkikemuIu5swp5Gm
         rC/RvPViJx7uxvv/DpXGyKqImBdrNtrXqeONZU8NYTPDguGuBelkBBB6vL1kSwz1vZWD
         9jsCtFj9aW/ne7WOXoV1hok/X2UqXsI+ufKHpwDas4bOy7UTyMeksndFNe7hreYmWsxW
         E1FhjmCgXaKjj5GpnktllFcYUBbjunAhr2qkybORv5rWsCIFMTtcolZQH0oxK4VUM2kM
         TlYWghiY95lqXwYis2DczsfpRUkqnhZXMpQvcrfq+4/yZNioe6gQjzNDRJaqEwNbkIdO
         Hk/g==
X-Forwarded-Encrypted: i=1; AKwUvBwoP/KTrQFmJmpj/B0QrzktO2DtQtcqN27eApphQFA0w5EPnJCbsfCvo01tcid7FrWGh7JaNyppbMa3aHSygy8i@lists.infradead.org
X-Gm-Message-State: AFuF++llDXUtA4tkIbHvvyMHZNxCnyrkLlWO/uJKNu1BemPKVAznRYyX
	UxxpCLNv7jK1ptj77DqZMwYJJPxQB6NFx4RxiTcYshorbD4DhKQbBB5pFhXED+dki3phjEpXiL4
	NNGyfud/kx8JjKDIinMoTTNi7ALPNsZkmjr2a3vS01YP8VXxup84kpRfxRJ088Jw5hv/nhpvMXc
	aGTg==
X-Gm-Gg: AYBFou03yoDt6LBNBgtEf+RFKmAOvLsggbYfMoMggocukPfOjTfftSMBhlABreCRLUE
	nRvHkf2I8SXa3dBH2X9CQD5bEC/zwhRzo4zvqey84QMsT0l+F7V1ZlkNCNNQp9evZ9zPOxcurBm
	WFAne4IihG0WE0mVNypVQytoQKvk1K+Y29Jgd+RvM50TmhJiMv/BtdKypTpvMGsrVjPVcRxHxQk
	bF+M3Tt1cS+FseIwHPWyNXZIhlk/JX9u/s8R1A9UlOJrI0EWj4T9iBai6tGLiTSSWwHOslsjAbF
	r3BzR7q4J0wcz4fHNbzZd1DdkpPjpo9hv5cZVYuGgpH3Hsd8gyu6eDZv+3SRlqKDQ0phIxa2P1K
	ldTL/LiYXoIs5wBqEdhrTe/0AxCahzZZp2JxT3ruF511V+MDyBXia2uzJLU+4EH93nRevx3LH3h
	wJgvScQfeGgoTvTnLR5gqMhoKaXUazhB8BRSctEe1zxuIQ2QRiCblYzX8kfn1CWU0IyQ==
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id ada2fe7eead31-7a55af2df71mr615821137.4.1789725725441;
        Fri, 18 Sep 2026 03:02:05 -0700 (PDT)
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id ada2fe7eead31-7a55af2df71mr615773137.4.1789725724990;
        Fri, 18 Sep 2026 03:02:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a88sm37992566b.54.2026.09.18.03.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:02:04 -0700 (PDT)
Message-ID: <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Frank.Li@kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: heLbm_XULNYw57NUq9rWMYHXPA-S-aJv
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad0c1e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9vOhfBaG-gSLgbD7qJAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: heLbm_XULNYw57NUq9rWMYHXPA-S-aJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfXwjY/EOgubArh
 oCqdGjtLqQHq2UdgNdTchhOCpLHI3oPuH2K4cc4VKbH5twPD66dkf7k7jRzY9s/9NqcauGhJmfC
 6YTwGjIQmUGaNB/xdtpECiLNSMor8utu3qWZjoyw+JMA/k7iQIsULF62556/FB7lk28vob2QFS0
 7DRyGA3dwzSDRdB94/SXLBlogwyEKoKM10Rr+mHxApZEaFRiInZsjUNtPjMoQTNqaGBvM1EFqva
 0IzdrntcWX37pNj1UhleAot59EonQIFPqSSO9TQHfsly3eVq/VsAZUIpuLMX5dPSsrrfCffsXnF
 SBoANZ6Az5F2YRfp8N9+1Z9W4UERhAZn4gexrdDyT7MtLNhrt89RrN/3X4VGTPt9TSGqa9kXMol
 ten95hZ3tihYQSxC5U/hSn3S0DfcHMahfBiM+BI5cJA+yFljwpfBiIRjJk793VqU//ZgEjPQYeX
 hrUH51uEqgXEJY3FzIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfX0r9BNQZqguaj
 Tdob5pxiHk3N62zUsYR5xRy7d/2ZI97E08YUcOntKjHZZ3gSimQsXzaTLXktgEcsoUXQJlfhOgB
 G6eX9CK4FPL0rtBhhqU12ZuQAlMIit0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_030207_365579_EDA1F6CA 
X-CRM114-Status: GOOD (  24.91  )
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

Hi Daniel,

On 18-Sep-26 11:53, Daniel Lezcano wrote:
> 
> Hi Hans,
> 
> thanks for taking care of that
> 
> 
> On 9/18/26 11:29, Hans de Goede wrote:
>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>
>> SCMI client drivers already describe their bus match data with
>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>> SCMI device tables. As a result, SCMI modules do not get generated module
>> aliases from their id tables.
>>
>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>> visible to modpost, add the corresponding generated offsets and teach
>> file2alias to emit scmi:<protocol>:<name> aliases.
>>
>> Use the same stable alias format for SCMI device uevents and sysfs
>> modaliases. The previous string included the instance-specific device
>> name, which is not useful for matching modules.
>>
>> Assisted-by: Codex:GPT-5.5
>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
> 
> [ ... ]
> 
>>   -#define SCMI_UEVENT_MODALIAS_FMT    "%s:%02x:%s"
>> +#define SCMI_UEVENT_MODALIAS_FMT    SCMI_MODULE_PREFIX "%02x:%s"
>>     BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>>   EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
>> @@ -185,7 +186,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>>       const struct scmi_device_id *entry;
>>       int ret;
>>   -    for (entry = id_table; entry->name; entry++) {
>> +    for (entry = id_table; entry->name[0]; entry++) {
> 
> Is it possible to rely on a NULL sentinel?
> 
> Here if the id_table is NULL, entry->name | entry->name[0] dereference the NULL pointer

The NULL deref on id_table is NULL already happened with
the old code, which would deref entry to check the name pointer,

This just adjusts the check to check for name being an empty
string since it now is a fixed-size string / char array.

>     for (entry = id_table; entry != NULL; entry++)
> 
>>           ret = scmi_protocol_device_request(entry);
> 
> [ ... ]
> 
>>   #include <linux/bitfield.h>
>> +#include <linux/device-id/scmi.h>
>>   #include <linux/device.h>
>>   #include <linux/notifier.h>
>>   #include <linux/types.h>
>> @@ -951,11 +952,6 @@ struct scmi_device {
>>     #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>   -struct scmi_device_id {
>> -    u8 protocol_id;
>> -    const char *name;
>> -};
>> -
> 
> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?

Because of how modpost works to generate modaliases inside the .ko
any string buffers in device_id structs need to have a fixed length.

So the truncation / name collision issue pretty much applies to all
foo_device_id structs in the kernel. People should now to make sure
that any strings used will fit inside the fixed string. And I would
expect the compiler to warn for overly long strings.

Regards,

Hans



