Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88066C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=; b=XEkET2wqW7kD4N0qVEhjy9epNB
	iKsKUDRe5k6zLViXHUTVp8rkAA41qCZay8ZL+fuwt0eNwn5faE01T+o0+yLVPy36/487VXjW1XHHv
	zhRuwi1njSihzitPStdJ5Xv0ckIj4a6yZlhfJY8IuvI07GYBZlvdlKznTTahjIO3lv3wVqb9fSk41
	JiV/E2h2k8zxfa/4nFGxc3V04lGYN2efB9GKloanfA46vmz7J5549+W/OpOUTe8NyJeJk4EshD0qb
	jSnsRn/sD4BgaaczNjROAK4N5cYrHdb5QztQKfeYnjHr51xZu+l0tbhTuKhvRuwXT+0u+88zdVhAY
	RjsGgh3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Vam-0000000E4Qn-3sBU;
	Fri, 18 Sep 2026 10:13:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Val-0000000E4Q5-0MC0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:13:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9daAq385329
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=; b=GYrEFTaVKgXlmTVL
	FdIUe/gOgfaQNgoApN9hwMcMyZYpiVb87js0w+jlRw5HZTJt2YA12liBgJ5avDWx
	w6jnDY6sr/HfJ7qG2RRYllo0Zjc139ZmNufJTxmE9A3HhCUmyLtoCv/ub5l6Uw92
	Ym9/7PYxLhrNPNpIQGCgSfOb1dlvJ56MlVo/nX8rsOG36fxRBbgYqhPHUaWZ4aXk
	tr4/8JLjw43i+58RgJfNK2I0fFnPEK4eYzZFAVT3l0xAmZSAvCO6Ean2l4R2LbGV
	heOvq67fpXSaHWc5nqD9HFOsgh2pdtMuX0juKA8vFnMB7I0F4f7cedysaUBjulgC
	ei4tLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrsdeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:13:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53000c06184so16171061cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726392; x=1790331192; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=;
        b=YOdHsgAD53CmBo+pFPBvMWulGIOZhXE3iD7dTR+fatIedKekBtc2JLJe2pjveH0JKj
         7SMJbN7l2NU/QIHnXr0Ep7rN0ZDYhmbqS9YFOZOb6W6IYWJlWSwQPcW+YU2NBAf9PG6G
         rF9oAxibOIjX3fLLwR3wl6kKZlIdte31CyNbPu+Dgpy6DUHDzovrW9KO/jm3vz8ZS1IA
         W5OuEjTJJQwhOc8YQOkzRD/CAupLDDCLRthBxBkVsCVceyUHIDyKmjLd2OnlPiypwO4Y
         0J2MvWI5I7HTai3ll2Dzxxbyv6Bvar7oJ7jHpVOhT5qoPz8T1Srevi2N7zK8VRBCTDuN
         5klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726392; x=1790331192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0Yw7Fx/hFGe8hAKBYaSSc1ucE/f9f698gB4GVeKBZ4=;
        b=GD6yCc0JjeJJNoZdY42Vzxidm74tV8uXaD9SOe+c8TqtXhcw0wM+supkRp/w4Se0if
         OCsYz5fchkwTTXc1UMyOADC2668a75Hc36Jr8DZGEkhPwWY+ZZwiYXXv9fLGlzPGLzds
         KlmznWmOa0euLosybflv3RSXSVoh5nSBfgATM47R8yU+u8cGS82w9gL1a4yHpzxf8nHp
         mDF5UJkVgZziOvnpg6tNBp6igVXpYLgnXjQOoQtIoYEBUVCsomoqEz4opVpmmXqypTk0
         HljuvYrnULJVQt5K2ccWDHsPB4voVbZUjsS8jq3lbwgBl2BI9XhLMGFSQkF7T1v8WeYP
         r4/g==
X-Forwarded-Encrypted: i=1; AKwUvBzU2rvbRvSr2OtSTQMy/AJu+dZGF02bOwJz7QAWhIyijFkhzRV3rnSMVAL8LkUUE7V6ozk8stS2KRwyzU5Xp7Gw@lists.infradead.org
X-Gm-Message-State: AFuF++mFcEK+9M7zb5d72EhQfIJ92POSVmj5RrfuEjyYrNKAh1xBho/W
	dFii40oJQp3VYdH2Hew7pNY5Aa0ubgZLKGgZLpiXvAc3g6bjwFx7lfW06Ix9AslC9bEUYW3NKhY
	YZpNEpntJEIpFB0XWCwodeXDIRqS3h753vGd7QWdEznWjV5lEZLkwyfQt8l7RPWMohNY27odd9Z
	JszQ==
X-Gm-Gg: AYBFou1sGFyi7B3ROhLY74z3tneiSTGO8z8bXVbvxJhX5+bYGwVu6lr15xC0tRMebIY
	4xr2RWvk2t0zNMYo7ItoKmIlcPl/CUXOyCKEuqhNiWah+XT28/36WVsus+VV+wbbVh3Q3hDnBOV
	Ys1jb7C/eFOeEBKRQQ5sP/eMDzIWwPT5iWXKDiGdCilHPSY34C81IejbOj8S3TH2zLTpYfW6DiU
	PZI4eAOwBAKuQjyZ4rWqXHJUAVxflDJ7ksCPQcM/MYlbDVUhM0tPhE3vXLNF1KHAanri4Cq1aL6
	JdYRWfOgz3hBUhxTYRTxu8YQ0/PuaroEokYO70WyDWZeptmEJKbpGaoyLm4wZ6Fr0kbAylHhkYQ
	MhVZn9daD52/IgTBDyu7rb17ZotbljPziALggHMceDBhE+k2kJstmdgXfv2N1sys=
X-Received: by 2002:a05:620a:27d3:b0:939:710:536c with SMTP id af79cd13be357-93bdc8c8c09mr231184285a.43.1789726392459;
        Fri, 18 Sep 2026 03:13:12 -0700 (PDT)
X-Received: by 2002:a05:620a:27d3:b0:939:710:536c with SMTP id af79cd13be357-93bdc8c8c09mr231182085a.43.1789726392001;
        Fri, 18 Sep 2026 03:13:12 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7b7a6d9sm36299205e9.2.2026.09.18.03.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:13:11 -0700 (PDT)
Message-ID: <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
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
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad0eb9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OcJ0dzw6xdPU1XpcOr0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX06v+ftXGD3tD
 XN19OG0QLECGGB9+c5hMpGwQOEQvDcA9sG1ccb9zgym0l0YYpICCxUyQ0HZZeHtm2nssz7G++kb
 aPSyA3R73zYecL3izJxrq2X4BTonao/xt8V8GMPoAhvWDvAaJYK5QwdmQcOv916J6czoIS/oqml
 I9MdmDX3GvkvxAbvRJf6Uym1S81bn9QaZoSLWkKpdaTCRdrZ1vNiTDWhScy8stUcpOl31bM6yWK
 AamGYC21ylDTQlIcAq1YboFj4cIgAigOkzrbJvraI8R1SmmCWwk72w4sENqE5qBDqSzLnhvNFD+
 jcRQQHDKRo0y7xuxHmusEuK7c14iVpYgEd/s5IqfnypPHwNK67pf6p4IVT8JHXsVXQOuAppqVI1
 bXsjd8XM3315aXQ4rj5sRM0o8aWn475ojLkG5IBdewknPNIxd8dO2HQr2ZwJmAVpqutsvCajI8D
 6BJv/hFYHGM52/SWCaw==
X-Proofpoint-GUID: 8gobBD_CzhErh81s8cpz1o1InKTK17y_
X-Proofpoint-ORIG-GUID: 8gobBD_CzhErh81s8cpz1o1InKTK17y_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX3lvFcn2Jetol
 OprFax2jrWta9+q6Gjsg71oUd8/++EVJe6/O67L+OWDTpSKZhxwviYXAQOP05Go5gl+4NTU+dYp
 VWV18mwZfNV9WWMhDLsJC4phc6cFTas=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_031315_125000_95C6DFDD 
X-CRM114-Status: GOOD (  19.23  )
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

On 9/18/26 12:02, Hans de Goede wrote:
> Hi Daniel,
> 
> On 18-Sep-26 11:53, Daniel Lezcano wrote:
>>
>> Hi Hans,
>>
>> thanks for taking care of that
>>
>>
>> On 9/18/26 11:29, Hans de Goede wrote:
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
>>> ---
>>

[ ... ]

>>>    #include <linux/bitfield.h>
>>> +#include <linux/device-id/scmi.h>
>>>    #include <linux/device.h>
>>>    #include <linux/notifier.h>
>>>    #include <linux/types.h>
>>> @@ -951,11 +952,6 @@ struct scmi_device {
>>>      #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>>    -struct scmi_device_id {
>>> -    u8 protocol_id;
>>> -    const char *name;
>>> -};
>>> -
>>
>> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?
> 
> Because of how modpost works to generate modaliases inside the .ko
> any string buffers in device_id structs need to have a fixed length.
> 
> So the truncation / name collision issue pretty much applies to all
> foo_device_id structs in the kernel. People should now to make sure
> that any strings used will fit inside the fixed string. And I would
> expect the compiler to warn for overly long strings.
Ok, thanks for the clarification

