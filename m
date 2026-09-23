Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E0FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqAd5JNFcVVUGGHw+F5n3YPtLs+f6/Hd4jYN9BmnscU=; b=PARkcze8kHTHy4VlhYkQyFp7Tp
	5Li/LEYVnmyMElVtthdlyT9N/my2iuB2p6OqnfBsCpD++lM3xMMmnX+PebsKfGgCVlgYsMvfmKPfq
	jU6w3oLeQvSKD8c46Ft5wvXFsFmOJT9cRU0YkWZHM8T6A6oVr6xsxDJEgfFgn+wmxnDLvdCyYU+M0
	4o6IgddfXZBJxcNQLuQ3piET4hlZhdnmynFdRw85dyjLpUXwFAaAUHcOUMjmdsW5tBsvdbdaqUivy
	RbW73+T0Q2R0uQmJWAZFBzPzsur3cKAUaaMrqzmxj+2SRBD1conOB9afzmtV8rveBLg8Prm6ekNC2
	qGQCNvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K8s-00000007stD-0Z9a;
	Wed, 23 Sep 2026 10:23:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9K8p-00000007ssH-2DsG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:23:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2f1A2429421
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 10:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqAd5JNFcVVUGGHw+F5n3YPtLs+f6/Hd4jYN9BmnscU=; b=TaRJB3UVujqW9vZ+
	voiYv8TnbmOdQJMJ2l/dGQPlR7mYByH0ncy5tgTWY9lxdqGQF21m8KsAWFoCVrbO
	jK9qM/nQPGluIb6oUi+KCLZhIo6r+RNSE79lWPiDv0Z/jhWnASyjliAKrW7FfPFT
	CiaP7R9TPfVsK1QqK+RCRb463A5GnEnH13R/GjGSTnYk14LRcRGcH9LtK39Ht8+q
	kDpp2V6IRUFAhCzgv6Sr46WFTX12CMLQfrLyJyEPtREeJSAEAuUbkYsDxwnNaaoH
	zDCIWWcDRaEk9W5PGnIBVIa38Vko1S1W6zp12LCsyjtm9O4LOLLLn1SmakLHsYxn
	luB1wg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqh1s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 10:23:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104eedb5b0so16070016d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159033; x=1790763833; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqAd5JNFcVVUGGHw+F5n3YPtLs+f6/Hd4jYN9BmnscU=;
        b=hICeh6DNiQEwgw892Y5/GGfsERJzcKw2jKKt+78w7m3l1chx5Pfh3//4QLbdw/cq+6
         mSC+pbjmzPVFzJpNFCbvf6Xg5cgXZnN3k/HaUpyXOThatcdx60nMopfo/C0Xy8LJNDjp
         rLFrBAH3axkeN38OPlVa6hRsZKIQUTFema36CkAj7HkhRhD9Mcp6yT0rLkc66Aq90nQ+
         y/GhfXW+Zi8mW733MVGIDyMFP6lDFEo6mm847WyvsknuEYl2acEpAQQ0SGvR5AGlsptX
         L66KDGHtqQrn25FjOkVGttZ0VqzckEM+Ax3G0tq/cje6YxJ2AVS3Vun/j1jkoXXCxtev
         hsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159033; x=1790763833;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqAd5JNFcVVUGGHw+F5n3YPtLs+f6/Hd4jYN9BmnscU=;
        b=vxRf50M8iqj6KhT8FNwQ/K+/EB4oxbnmNdM6JN7DRpF/DrqsqniKHQy6gJt1BYsxHL
         g5r45BVeUlcVrAhJm6hDgJsq6l5e9kG7G9cEWJ5JYwieh7QPWDpjS4MWNZ+P9d59veHX
         qmsPYA0ajyeTg8h3a+5TbCq57+VG+K034Z79Tpd13H2pEB2AlQGPGvigaPGBhiB5v8OC
         CSxngHqg2daxPCgMOcpqcfb1855/la4gvOELaO0yDUdftgEmmlg8otKXtD2L0siWpTsy
         9BfcBMTg4l47yLT6UWCItNQiV5urBqhusTZ6GTl9P1NEUc7h2Wot2ZQ0DvRyBYhOgRkM
         2Akw==
X-Forwarded-Encrypted: i=1; AKwUvBzkFxbBdiAu31ymxAW9k+oGVNvZiHyfUuQgK7QOkf86jMTbF/2mL6Rt8xYSON7iC+JeM9bHh9IH7WbMYh3i2Nwx@lists.infradead.org
X-Gm-Message-State: AFuF++lQbjgoEZZAtvi5Gx/f2e2BMp/k/eRyALJtQ+5Tpgi5zY91qOhM
	n0BOHfSWevh5uHmTHlvxde6uAZ1AFq/QcenQEnnT6OPyjEwzXh0R1RQwijpbPtgmK7SvViE0NgD
	k2M5nbxPhnPDgaixNLS2O/iLtNdcKARErYPtur2QwXZqdmzw6Y9WN64HUUJNXq+96J/zXhlO0wX
	9f6HV+S7mKzA==
X-Gm-Gg: AYBFou0ks4nitzFNnb6mNDFaFg24f5pxHmSpDbi+yRcJX0yjqj+Pp35HIqR7C2nU1xH
	QeHOZBHJ+AjsmEJu9EVG0lkvY59l4WJPIlBF9IqnMlbkbOshfawVfhBjuO8WPgpasAbh85vowQg
	Twc8YY3NrD0JSSPx1e3rSfLDTcpGdBpkZSG4Xp3H/6rJCxG11DrhevKJusfWWtu0gpfi/xKeTcJ
	DAvYJKgihDDdqYA4OtpVe5Hgb/Y5dXEmdybyDUkMuPpW73CzZT1loT4Fv2Pv6W0Bcth7T9RxF8I
	lBPdxdkzqbEY0VNMqfhIOgz3sXiIlDzxNXvdAG7VsR09xmPIj4kzo5vCeOTCx2B7bhaPUVmoAa+
	sWv7eWqA4R2J6eb6nfZpiWG62oxnOTWPiN2ffAzI1qNIMDWnfC668J4e82X7bKg+kQGJjvWzEyS
	5G+/+bYvDupCyGDCuBEH0GcKoXnCY4z0IuSabdT/0SM6ErPrWiRXnnFSCEmF6cmIO60LRS0f0xk
	gXP0A==
X-Received: by 2002:a05:620a:29c6:b0:93a:34e2:b7b4 with SMTP id af79cd13be357-93c250971a1mr331001585a.15.1790159032945;
        Wed, 23 Sep 2026 03:23:52 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:93a:34e2:b7b4 with SMTP id af79cd13be357-93c250971a1mr330999685a.15.1790159032492;
        Wed, 23 Sep 2026 03:23:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6610a6sm86540666b.39.2026.09.23.03.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:23:51 -0700 (PDT)
Message-ID: <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:23:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KxpBwfjbtq9uTxrUZ0p7XJC7U_h9ZL--
X-Proofpoint-ORIG-GUID: KxpBwfjbtq9uTxrUZ0p7XJC7U_h9ZL--
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3a8ba cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=IBvwG5UjtWMghLoup9EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX7t0VLMOcIRXN
 AWbqdj8t5841bgLtmbUoLEoGlvVhxZX/3t3JmomXQ44bbw7zHYb7/+r4EAGXxEegZPQlrmz1qvV
 V66Sr74At5+PZuGpwc8wLvXeqtmREHM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX4rayRuDdAY33
 OCXOKaS9yECkQSaDaNHWxuRVjetzhgfoJxt+gY8dmG2wbGLN4moQT5f7rE0GlIyN1Kl0dBniqwJ
 Z0u7A0mbDOw95gDAHf56ebzKiPQMoRpKiesdE5T2vQDCtMywvW6z2LzmbuqO/xKXPNtfgrp1yve
 2sR/CoYhC0qS/lW/IfhhLp9gb77eWxDuQWWkqG9gnpU9NwuH2nfpHpti453C54Aed1YP2uu4pAc
 g+8p4ELkj0MaK5daRBKie5F550UfGUGrhaX0jZHcZe0v9TAl8WuYYBovfBzlVRxz5e/tkg4yXuR
 BaC4QYxd6vGDozVIlpvvwRuqoHWSZg/5Ww37+BEw6jRlpTmogO/e+zVNp/40MF8yqV7BpLLJmRO
 r0+GwusV+ZzS04KEg+Reu00f7yE+jlXIqz0q17vPQ0sjz+NkCW6AUTpEqTnyk1sekjQSW97aNIB
 d33EiW11G4RRxQPW9wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_032355_580601_DC6533A4 
X-CRM114-Status: GOOD (  30.28  )
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

Hi,

On 23-Sep-26 11:07, Sudeep Holla wrote:
> On Mon, Sep 21, 2026 at 05:19:45PM +0200, Uwe Kleine-König wrote:
>> On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>
>>> SCMI client drivers already describe their bus match data with
>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>> aliases from their id tables.
>>>
>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>> visible to modpost, add the corresponding generated offsets and teach
>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>
>>> Use the same stable alias format for SCMI device uevents and sysfs
>>> modaliases. The previous string included the instance-specific device
>>> name, which is not useful for matching modules.
>>>
>>> Assisted-by: Codex:GPT-5.5
>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> [...]
> 
>>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>>> new file mode 100644
>>> index 000000000000..1b4ccfa9dcc5
>>> --- /dev/null
>>> +++ b/include/linux/device-id/scmi.h
>>> @@ -0,0 +1,17 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>>> +#define LINUX_DEVICE_ID_SCMI_H
>>> +
>>> +#ifdef __KERNEL__
>>> +#include <linux/types.h>
>>> +#endif
>>> +
>>> +#define SCMI_NAME_SIZE		32
>>> +#define SCMI_MODULE_PREFIX	"scmi:"
>>> +
>>> +struct scmi_device_id {
>>> +	__u8 protocol_id;
>>> +	char name[SCMI_NAME_SIZE];
>>
>> I wonder if you tried to keep this a char *. ISTR someone did something
>> similar recently and they claimed it worked. That would get rid of the
>> artificial name size limit and simplify this patch.
>>
> 
> I agree with this. 

Ok, so I checked and no other include/linux/device-id/*.h file
defines a foo_device_id field with a type of "char *" and
then uses that field in scripts/mod/devicetable-offsets.c /
scripts/mod/file2alias.c .

2 device-id/foo.h headers (dmi, pcmcia) do define a "char *"
field, but then do NOT use that to generate a modalias.

So scmi_device_id would be the first to do this.

Despite that I still gave this a try. Things do compile,
but it results in a modalias for the scmi-cpufreq driver
of: scmi:13:(null) and auto-loading unsurprisingly does
not work.

TL;DR: using 'char *' instead of char [<max-len>] in
a device-id struct field that is used for modaliases
does NOT work.

So I believe that this v7 is ready to merge as is.

> [...]
> 
>>> @@ -1491,6 +1502,7 @@ static const struct devtable devtable[] = {
>>>  	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
>>>  	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
>>>  	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
>>> +	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
>>>  	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
>>>  	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
>>>  	{"slim", SIZE_slim_device_id, do_slim_entry},
>>
>> I wonder if this is supposed to be ordered alphabetically ...
>>
> 
> This may be hard, just the best effort unless it is cleaned up first.
> 
> Anyways, I plan to send PR by end of the week, so I really need this
> in by tomorrow worst case. I am bit worried if there will conflict all
> over the place in this file as I know couple of other patches that may
> come via other trees touching same entries(one is SMCCC)🤞.

Thank you for the ping, as mentioned above I give Uwe's suggestion
a try but it does not work.

So I believe that this v7 is ready for merging as is.

Regards,

Hans



