Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A05C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYZXn2rMd8QXiAaMCeSTebeopGesML12+K9l8VKCmk0=; b=xatqrP+01N8m9wqStWg7/LYLDT
	sdHJUOBG+RYaLaPzC9hPgSqFcyTs8kHZDrkp/R6MdD+tCib1xb1mJ/Dlb1yNX18fOyBJEKjIcxQKD
	8bzOEOPHHJjn2b1GrDCmlzDstX0026rvWGNynvwAF6ymvTGA43ZTAAwXmkyfHRJyNDcUSfdMMVl1b
	nHf4gsQa4CATQFFeIYfbCdpvaMoA/0sRTceLbiXOZw3prsddEA+zelWfHrSH6W69QHFwvyMcAWqoD
	9gfhg5rIK6qqhQO6Ok8GDyQNsE6G1YQY9PjaPiWkIZkzJXBBCrjJEYAAykqp+h/cWFckDiBF5XeSU
	cCRWKnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtBa-0000000EKV7-0CBi;
	Thu, 23 Jul 2026 13:10:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtBX-0000000EKUN-3LK5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 13:10:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvYVq3951483
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYZXn2rMd8QXiAaMCeSTebeopGesML12+K9l8VKCmk0=; b=YWytQw4b2MYXel2Q
	85vv17LogPADiM+DaizyMO56OnUI2nzuvizaz8+Im84V8WwOw3IPTyJ9kJGMilt2
	7SsjU5BqDz252feWoCjph6gH9h1DTamF8TWk4rGeVV8Ka4exuIOwVm3WVaTJMjP1
	Y4Z+zsEW/4D1zUX3M2F1wlAtvAixgLGrC6o8AwSqaSUfc1aMasM3yDoA+hpuWbx2
	Y+3KqmlGZIKRZaKx3yow22oY8ZcwFZmuLTvGI9W33tVzbMgh2T9tAl0NeP1C3ssA
	mvwjMUc+r/yk7qQltiAGIe2OFWnytcXCEOqIeQ0rDmS4MM8C60vqotYWweWl2ONW
	u5X9nw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu88jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:09:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-739a588fadcso131870137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784812167; x=1785416967; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYZXn2rMd8QXiAaMCeSTebeopGesML12+K9l8VKCmk0=;
        b=aMKpFxTXDUaG1GSILpcIeMpqrNxGgqtwFQ0kk6T8VjXn60UHG1qKlE0X2QxeMCulLI
         YeTMuC9QNwOLcVOC6vhRSpDxNx8h5cuX6P7ETE8PKtO+Nx95edYwHx0jej1iYdZ26mJj
         ng7jAbAHjImrkBP3oRAS8Fx+pRRnGcgCKhMrZAMvBi1l0ZlnUod98FGBxeEO9RHN14Cw
         epAbE1CRDOe2Pol7Vj2R1y/yh6Fi0IuTuAp28DtoBmMZIbgc1b8sidbSpXmzyg7CCWyr
         U+5TrWDzqTWi0n0TrLhecMJKPISZs9vW4JrlglT+UbLVduk4RLDPgZvPDEkVXv0Me6fl
         pjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784812167; x=1785416967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYZXn2rMd8QXiAaMCeSTebeopGesML12+K9l8VKCmk0=;
        b=oE8S/3Pg3KYpKKsVkCzKkxJQjN949oxlfvwNIdFD81FwlIh8egsA/p3IURburdeECu
         HLMxNFwbkoKS7c3jEBrpr+kSQLytrDvbPL+g2wEeAGpaahhjlbaIC6zB6LIo/z4yuc7r
         IwMDQZV2hTIl6snSHkppsEk6lzGEcnLmeQayblZMJL4dJLxj4rJuP7bMht45py3DZu/B
         SuMYuPyDc124IR05FPg3CdxTzLLXVqk47VwbjTb0Sd6JdJMs1Ry4uDll27W6glD4gmzW
         kn5FLUHyp42XKhwZsh3p0Edmy14wbsLaskqK01gipHw2JgMIpIdEz8O7vOx9xMCqeRGA
         uqMg==
X-Forwarded-Encrypted: i=1; AHgh+RqawSbhrt/gjMTTwbA2QxeKgGH5g+Gv3YtV2l6bBR8jIjiit/EDPYApBUbTNAbRyU+Z+0gwLlidoS5zWfXW9ucn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf4UR8BDbYeMvON1rE9ygypoQmGzuF9DZXd9O7TpTxSfW5GPuY
	cDK7aAsn6ms/dDZZh8oRvGKm8lnI6Pc+9zXuelhpkjqSHMMAeC7kxXtiN2ef6CtaWEp89zzg2oq
	usvoP+h+7Hdx0NqAJVT8uz0rRoh4sZVq9DF/o9Rt6R5gUOaqfy0oZvpXgI+74Jb6oTJmfp94vAq
	cMog==
X-Gm-Gg: AR+sD13MP+pcLKf+tGFv+QcmicK8HibUOWTe+qXflae/z0DyxSJacijQRR+TpOYn5G+
	9G9q4Xhbcwsz5cbcqAIyTcaE51eQD4+76p6dEyz1Vc1FGHrm3kVoSfQKlJ5bn/Bb/3NDCKS2bNu
	qQja9KjQP39XD9hNwcnXo8hhmikIrre1Eg78X3vw93pXdXiiVKqJlSXz4ZEO7IAiN7B9gKMTdOX
	6bC+BlOMAbwJE1Fa/8ZahcOXWyuFiD+4ej1UYd5IxKz620+HnnAu5Y5QMDPWoXg+/TZqYq8TR1A
	bk6q6+cDV3u4SAzkxowe+adhC9G7zdSQT0w53hNou/sEd2jl2TVkOY1rxToXSey8oDyDusWT/9H
	bngb3oxBTH0g0OAeFZowpA4Zbk72hecF7kh4=
X-Received: by 2002:a05:6102:2d0d:b0:740:2d5f:e37b with SMTP id ada2fe7eead31-74d61016d97mr1173159137.29.1784812166903;
        Thu, 23 Jul 2026 06:09:26 -0700 (PDT)
X-Received: by 2002:a05:6102:2d0d:b0:740:2d5f:e37b with SMTP id ada2fe7eead31-74d61016d97mr1173098137.29.1784812166476;
        Thu, 23 Jul 2026 06:09:26 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9774424ce26sm4513322241.13.2026.07.23.06.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:09:26 -0700 (PDT)
Message-ID: <d859dad2-b9d2-4d1c-abd5-bf007af0ebd2@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:39:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
 <0c55125d-5304-415d-86c0-a589c612babf@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <0c55125d-5304-415d-86c0-a589c612babf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UQzzD2DlxD_tT1jO_9u3-Xmn5bEtdmMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyOSBTYWx0ZWRfX331ZNoArnuky
 sNObS/USzIb4z5BTOj/uQlOtuHpIN/D0jWkCWxP7B0yJwYQ4V+h3Nbv10zgkJxikbSsvqmwbUhZ
 fs/EJMgwv+gF+Gc7HcRpkLOVw6/a9bT+WvkCvsXT6dX55V72zxLdzhNW7REgEqAQQ+jMDUJLeYy
 HRnBa58DdRmitqg5f8UGHMBDE92d0dCnAylJQ3nzDX7irN+jeX6ndvKukRWHij1tqavXeWQVPZg
 paHzg+WasqsMVQimdWqpvB21YCb+zvsxsx9Bl3hmZTGPoKSwo3hs/3/wnCk1O07F2lNq8XSJYiP
 CX/rh9bTBiHcYLGE/Luq9kXI4bGJxXR2EEii+YQjxZLutSMNLEK1qai53MoSjf9wsoott+pey7C
 hjd+XLV4C7T5Zfh6afavhohOIfY0wl+8cYyF6jSvdVSvJ7zaY/0gzjwPBXQtsqJyAaraOmdZL7b
 rYbIcvbX6ZxN/qEHNZg==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a621288 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rfji2Jk2iV-f214sYr0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyOSBTYWx0ZWRfXzviChvXqaqxn
 RhB72luoSdDdIZvCAvTlPk2qwAxb5gtRNfkWIwn1hk71kY/Z3k8LQm+Ch4wraa6d4dNXluUJHFi
 X09Z07yVLyvBDwo7EHlR/s+yo2K1TpA=
X-Proofpoint-GUID: UQzzD2DlxD_tT1jO_9u3-Xmn5bEtdmMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_060959_913233_DD24C3F6 
X-CRM114-Status: GOOD (  23.41  )
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



On 22-07-2026 13:10, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:31PM +0530, Shivendra Pratap wrote:
>> reboot-mode based drivers can define a reboot-mode by adding it under
>> the reboot-mode node in device tree. This limits such drivers, to define
>> any predefined reboot-modes statically within the driver and creates a
>> dependency on device-tree.
>>
>> Extend the reboot-mode framework to handle predefined modes alongside
>> those defined in device tree. Drivers can now define their own
>> reboot-modes and register them via the framework. A centralized init
>> call has been added to the reboot-mode framework and adopted by
>> existing drivers. This ensures driver state is initialized together
>> with predefined modes.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> @@ -195,35 +264,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>   			continue;
>>   		}
>>   
>> -		info = kzalloc(sizeof(*info), GFP_KERNEL);
>> -		if (!info) {
>> -			ret = -ENOMEM;
>> -			goto error;
>> -		}
>> -
>> -		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
>> -			pr_debug("reboot mode %s with zero magic values\n", prop->name);
>> -			info->count = -1;
>> -		} else {
>> -			memcpy(info->magic, magic, count * sizeof(u32));
>> -			info->count = count;
>> -		}
>> -
>> -		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>> -		if (!info->mode) {
>> -			ret =  -ENOMEM;
>> -			goto error;
>> -		} else if (info->mode[0] == '\0') {
>> -			kfree_const(info->mode);
>> -			ret = -EINVAL;
>> -			pr_err("invalid mode name(%s): too short!\n", prop->name);
>> +		info = reboot_mode_create_info(prop->name + len, magic, count);
>> +		if (IS_ERR(info)) {
>> +			ret = PTR_ERR(info);
>>   			goto error;
>>   		}
>>   
>>   		list_add_tail(&info->list, &reboot->head);
>> -		info = NULL;
>>   	}
>>   
>> +predefined_modes:
>> +	list_splice_tail_init(&reboot->predefined_modes, &reboot->head);
>>   	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
>>   	register_reboot_notifier(&reboot->reboot_notifier);
>>   
> 
> This splice here makes me ask why we need separate API for registering
> pre-defined reboot modes? why not extend `struct reboot_mode_driver` to
> pass on the pre-defined modes and let `reboot_mode_register()` take care
> of both OF & pre-defined modes.

so something like a struct reboot_mode_driver should have a member
with list of predefined_modes and this member will be owned by calling 
driver?

> 
> The semantics of `reboot_mode_reset_predefined_modes()` is very
> confusing. It is not clear if any client driver needs to really call
> before unregistering? The unregister it self is cleaning up these
> pre-defined modes since they are spliced.

sure can try to align this using above approach.

thanks,
Shivendra

