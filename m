Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4760CC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 14:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFxHaff8GjmyQ0vJusoYBKz8T8A+c6M4ZjObeJKGagM=; b=4tTkM0yiLJfU7X1kFbr5/A6sMG
	0gHuj/IpVlHhYkHOy4Q/7dTWdGb7N2nAY8CbhGugT4kbHVPMqFey2xP17L+iMDf7+bUK+antBOpo8
	iiR9Np8MdDmlPGZz5TF1CDuIX98i2NnvDm74LQF5Wb0QxS3u+VN5CgozFP+tIPdSgjj0Uqsr/gWDG
	Si3/VTHFms/JsNI40AptX8Z1Nlqs/g841+zmcJHY7HHRG5CCdfQY14aaoxYLytOqUJJ2PGXNQnbaT
	MgGqT6QTbjN0jvoJrIcCe2SdG9Ln7bCLE0Un9qFVz6omvSleVwrY4f6krd9fNcGX1NBX/JVNZp2pm
	Ki5onZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyW8V-0000000GqZp-30N6;
	Mon, 24 Aug 2026 14:58:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyW8P-0000000GqXR-3WTI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 14:58:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvBv02006814
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 14:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFxHaff8GjmyQ0vJusoYBKz8T8A+c6M4ZjObeJKGagM=; b=eHIsnj/yq5JMQ2R+
	dNhTfIz13oV7n3oaDZKdBTdgJbgt7jSIMcsWGDWO/D2aoncgB6DrtEz43kHfdB8E
	IFL9ar0NnPKdT9aSnhppfTJK+ajptnbjmouPYeDgNbJrysQQISoeM95kkTHZCJZo
	8BNwjOxT3RtaJUbVe74MevZ3LHysqf1H/vnGjVqCMpBOZ74allL+uBGsjFJluz29
	MSm0ps+P9Un3rtN4/BiZiqDg78n/LQS7UbwJWR/RgLYU57lpgJqcOdMzHXeX8U1x
	qKU/Cqo8sux73oofpWTscX8fY6CVv20KyevS7oYmtbZwYUIta853r3iCFVa+eROZ
	jxEt8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv798h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 14:58:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c19493ac2so44539641cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787583526; x=1788188326; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFxHaff8GjmyQ0vJusoYBKz8T8A+c6M4ZjObeJKGagM=;
        b=Xz9xzioCmgKh1yPYlU9SZdu3sUPDgbR8BvXqfkZj3sxjJ/Fi4BANQjMOwc2M3XiA5Z
         ANzqjCVZ0aTZSLa3vYyovHxbQtJ+gl7hr/YhNBcXEkcHToeknHSr4qhthZ+8urhpdr4g
         StdIt59hQGDO9v+RkEn7detJiPsPEu7cWH2vkTjwuAHkQhH2bOgo7m2ekqPI6cEvL38S
         RmzlgZME+wi9li75zg17sq4vY0MPeAHBbb80P2014UVFZPdtFcz4jHRP6IMxV9HvtVni
         3YvN071eBY5FmsGoLbvxO2C7l1jrJSI696/V088idriCfLXfknhoC9mxRxEHvnCvpEg7
         AVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583526; x=1788188326;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFxHaff8GjmyQ0vJusoYBKz8T8A+c6M4ZjObeJKGagM=;
        b=Da/8iq2RbkZXcjifiQHM2vxwVOVCTbpKnPVATx93/+QrmIQXqSKB1uuDcxunDOwHWH
         XACb5dQX69vMSEA3lsJ3BsD6ytdQFGfXV2Qd1WCkX4J0F6ByYqCbPS5uKDdZx8hZACrP
         MRcqFacZNXNyfewBv72h0aBkdaRB+WdP5sSz7IS38MONtxc/cxWKqowc5MCcOD9LWAgc
         gW25qDR/sY8aMMdT/01Hr2q/7VlTtY2noycs46K4xkmRSkl+i4aKKSNvuaehgtLLwlAi
         5guJRIw4v0ONy3GQjUj+2bUP5l138k8uUVEgRTYWOp8PY/Hp8HpdJnqfla/iIybfXoiJ
         V/5w==
X-Forwarded-Encrypted: i=1; AHgh+Rpq5hjzarErfFldzVoJAPkfFp2ESR4To2jd5W2J+W7nC6mRGs4gBp3yg9Bwvrcy8UEBaiGxs6ZQAq935355OMCh@lists.infradead.org
X-Gm-Message-State: AFuF++n3Oyy1K603wX08Bm59BheCPOsUIcqpwLmxN+iH9yuXORdSJzIy
	Md/j1IP8pE81kYngOIFjNM9/rIltqEYjI3DoD/gF0i5uxGDppk/btGJVB34lqCdG941Y9a4RYXw
	aIrjeH6hpZlGmoRwdX8QWfbX7MV8UvsY/yPan760rHLFBxy3KoDh3E0Ee9M8am75rnSNReXDNIE
	w5AQ==
X-Gm-Gg: AR+sD13u9hi3l/u3cqRVcFqhzMN7IsktJKdrEy6Bd59m/OL2SSoPJt7YqMdRvul6sfg
	DApgH/cAXdYDvcpwW27PsNTz0/RaCrwpAKTC4td+A5whQpdU+rDClg+Jq2Kcsdl7S3r8Wvv4HtM
	WVvkwZo1qpeYXrAggKnWyntJJi9uYO8m4OnrlqaNKDBnKJvZVEmduUM8ZYI0syWKoil78OWHJPN
	9wiVQp/PO5c9pZYE9IUALnC8aHltynkL/x3uRnaF9jZ6tOvQetDy9yEiRaqlMVDgtkYQsV0e2eP
	eBU6ghJAu0KwRITqMYWDCw/KAQqkv/NXULWKPulGKy32FPSmG1jFRnffBVY1mpaCQKeSpZMDM2y
	rWBtVvsPST9UjclPNzGhpkhh0m8pbwVXWN5M3AubzmgoULEzi19h+QLCTKNQfdAAJkZAT0jsdst
	A9u20bt1egqDnl6UffBtmMwrfmIhYkORkdcOjQriVHQpOf+qknKfle/q9CtGsKlqjUcwk=
X-Received: by 2002:a05:622a:c85:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52df5a3285cmr289911501cf.22.1787583526030;
        Mon, 24 Aug 2026 07:58:46 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:527:f4d0:4bb8 with SMTP id d75a77b69052e-52df5a3285cmr289910721cf.22.1787583525431;
        Mon, 24 Aug 2026 07:58:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm1253359466b.15.2026.08.24.07.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:58:44 -0700 (PDT)
Message-ID: <1bf5984a-d1d2-4763-bb4c-b17ae8360192@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
 <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
 <aow2GFAfy84k-N2B@monoceros>
Content-Language: en-US, nl
In-Reply-To: <aow2GFAfy84k-N2B@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c5c27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=IpJZQVW2AAAA:8 a=OCaCXozdqvtwCLTCMOQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfXxcGgLUq2EzpE
 L6BO+zeGx1vIjdRWhaMqjZJZaTThh9RcX3pbS+hVUZvAHhSA9X+joemLBBEqbkTNorcqRob9iOq
 pRTtPsMiZSXFygKKwK/QP+UUMezuV3A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfX/Pu9nF4mCGRn
 o6153l3SM3Yr8Yc9o4MQDxi94JfuWQtvoxWOO+WxmUKdGB25c1GdHkrkpseCFuEo4QsIr2Yo5tP
 KHImVU4Uc/OVPQ9bMkISE/qJDH47LbhzG8P4tlGq7C5z8PAgohZMXi6hEnjGZpWJJSA+MWbi89P
 t9Iu6ZVIUKWtINUeVXKzMvOifS6RiSwXmczblRMnfeYwrrN8kgvIfH8Bz9byevEwjo2ngweVKmz
 rDFFwkW9I7VwNCH4fNIpEFWziCbqIEfJR0MtROUor32Dkk7oLhfsXIZX/yHCjJ3iz3HuyCJLkvC
 4lRD65uUA5xfdJLhS4EbHqQf5SNnJj9EDtWL6uE+Z4eKD3jMG3/Bi84Boqxs4KCgojNX/fkK0ng
 s0bO194OrPpwpyLcqlmD4q+wNFYS8xw+C7IuSgSJPK/dBJQlpp4zytFUkcJgtx+nE7Z1ReuKMhI
 fLes19dnu9G/HvjN6Ig==
X-Proofpoint-ORIG-GUID: 4bVG1-A2atIALl-KXGyb1aubqMYHAyti
X-Proofpoint-GUID: 4bVG1-A2atIALl-KXGyb1aubqMYHAyti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_075850_009667_4D616D9E 
X-CRM114-Status: GOOD (  27.91  )
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

Hi Uwe,

On 24-Aug-26 14:22, Uwe Kleine-König wrote:
> Hello,
> 
> I just replied to v2 and only then found out there is a v3 already.
> There is something wrong with my mail filtering, sorry.

Not sure if it is your filtering, v2 is somewhat old
and I only just revived this series.

I'll add you to the Cc list for v4.

> I'm forwarding my review comments to here (the part that still applies).
> 
> On Thu, Aug 20, 2026 at 09:48:48PM +0200, Hans de Goede wrote:
>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>> new file mode 100644
>> index 000000000000..4150481524d4
>> --- /dev/null
>> +++ b/include/linux/device-id/scmi.h
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>> +#define LINUX_DEVICE_ID_SCMI_H
>> +
>> +#ifdef __KERNEL__
>> +#include <linux/types.h>
>> +typedef unsigned long kernel_ulong_t;
>> +#endif
>> +
>> +#define SCMI_NAME_SIZE		32
>> +#define SCMI_MODULE_PREFIX	"scmi:"
>> +
>> +struct scmi_device_id {
>> +	__u8 protocol_id;
>> +	char name[SCMI_NAME_SIZE];
>> +	kernel_ulong_t driver_data;
> 
> Please use
> 
> 	union {
> 		kernel_ulong_t driver_data;
> 		const void *driver_data_ptr;
> 	};
> 
> here instead of the plain driver_data member (or don't add driver_data
> at all if not needed). This yields better type-safety, see e.g.
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com
> for an extended explanation.

Ack, I'll check if driver_data is used at all.

> 
>> +};
>> +
>> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
>> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
>> index a397213bedac..d241421c36aa 100644
>> --- a/include/linux/mod_devicetable.h
>> +++ b/include/linux/mod_devicetable.h
>> @@ -49,6 +49,7 @@
>>  #include "device-id/pnp.h"
>>  #include "device-id/rio.h"
>>  #include "device-id/rpmsg.h"
>> +#include "device-id/scmi.h"
> 
> Please don't add new includes to mod_devicetable.h. That header is ugly
> and each include makes it worse. Just add <linux/device-id/scmi.h> to
> the modpost source.

Hmm, I did that at first, but that is quite ugly also because
file2alias.c, does:

#include "../../include/linux/mod_devicetable.h"

So I ended up needing to change that to:

#include "../../include/linux/device-id/scmi.h"
#include "../../include/linux/mod_devicetable.h"

my thinking was that the purpose would be to move other
consumers of mod_devicetable.h to directly include
linux/device-id/*.h"

And keep mod_devicetable.h as a file which includes all
of them for use in devicetable-offsets.c + file2alias.c

But I can see how actually getting there will be a long time
in the making and in the mean time this will cause longer
compile times.

So if you're saying the somewhat ugly thing of adding
linux/device-id/scmi.h directly to devicetable-offsets.c +
file2alias.c is the right thing to do, then I'm happy to
do that for v4.

If I'm reading your comment correctly, that is what you
want me to do, right ?

Regards,

Hans





