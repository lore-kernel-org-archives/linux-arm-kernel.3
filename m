Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89B9FC0340
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eze/1plM2v1qn5QnTvk0ysvssVshSt8k0/rXfQex3Xg=; b=Fo0J4FlvtAB1Z9v+79GeQjAWTl
	V7BUS9kwVoeR8aU+4qSqJ6bthdwUpSYy0L6Ek1M3elvywmETPs3tUwsR4AWY9tRYhHe7JGMbvoR9K
	Op4QVL7lxefa0vKHlBnw3LqUmoR2SGWuW1Z6lu02I5XSPgg0Naqnm9XyaeUabLF90Khfo1WYnpN6x
	c7yjaVHgr2vD+Zs4VTTKWyrjFZjo6OAlLaJwGN98RjgvNNF8u+FiP0wWJLfjP9l6G2EG44ndQSPTQ
	JEIiPsd36cBuVpO+V9W+5aP53o306hN3rGWWhzDtd8yoVMAvnHNr9q40Tg0xq/9+MYt0N29e8wvN+
	zGO6Ffcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvnv-0000000BrrP-0H3K;
	Thu, 23 Apr 2026 15:17:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvnp-0000000Bror-3Oej
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 15:17:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u2Cd366240
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 15:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eze/1plM2v1qn5QnTvk0ysvssVshSt8k0/rXfQex3Xg=; b=PA6gL6/3dqpWMUfW
	jEkt63+YX5zSJ4fDKeSX6I0cS9gGGPnzeX0g16rPwysV6c1G3Sdxr9/EHJgS61BH
	apN6HLXVpgRHrhjy35HCYO74wSh5ud8aQgRrhIXzQPhxd3cgcnO2z8OpxaN5qy2u
	PQGatrXMIpHgAeakubttffluTsQzVZbQfsMPtjxWs6TgwoSa4VFpwQZvKcTQ5m9x
	Xr77nDCX+F4E4QA10o08WcIcwVL6ERjkHSKgVCRoskcpUDop90IAJVlfIze1gstY
	egS/4r8ycsjCO7Ed0HaMQAahN0mSwVRKQTIWM9dghK2WiZNdZo32t3lTTZHLhceh
	uBnBpQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rc4gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 15:17:16 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-467dc3431cbso2854349b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776957436; x=1777562236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eze/1plM2v1qn5QnTvk0ysvssVshSt8k0/rXfQex3Xg=;
        b=Yp9xqOXEzUeoBX7N/3sqh3aS+ZEjNUPnrMg/+qmLhVuiLbz5XQhed6Ts1gTKzgMBjn
         IUWZbe6U63gTj1IXf/PlGRiuOHPvo8+vp6TJpYhhKeSnV+68gqeF+bIrlaS1tlVoyQ0S
         OrS8jFRdAEnpx+Ez3IahcArCXYQjJfHCu3vAb/Qv4GBLIGBdgZpL23/8OjH3boKOy2Ds
         yUcFcToSMtcmiUS0yRS87TyCKWvjh7D9jOfOEdQ4j7TskjRzeGKmdc4N/Rm0sEX+u0LH
         Qz++H8rKu5tAumdXgGKgqM5NC6S8NHu2xB00braRdYoZAnoi/JfidHQ6Eo/S11vbQWxc
         LqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957436; x=1777562236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eze/1plM2v1qn5QnTvk0ysvssVshSt8k0/rXfQex3Xg=;
        b=jxts7GeCk1qLK6K5iFmYJEpiqjwgvNhHY+BNlsA/HL2lx0+eF3eEiv46r3Qe+5j4po
         x2Y7iLb0DdsFNW9J65QV+B1DS1nijUymL8eETxAt9mCivsf9YFBxUR3gpDJGhwH1w2ss
         Uw5YPX461d4SM6MIfeoI5ykqdjdpI68nUpk32FvbP+lqfP8SxAj57C1lgoOFqPt79Yu2
         kIAGXxHrrOPW4tx/boXE0Pn9PA4/9Fc9P1iPyBdMCStT9SNVLC8s/oHnPvH5UO/qyuCg
         bI8PrxF6j/WVpQ0YRGBBx5HIG5PN4e4mRs3msBi/jOpqJkYRW0c/dn+J80TH38NsXo+M
         HAwg==
X-Forwarded-Encrypted: i=1; AFNElJ8BEVqZnDb+9B9dvye+c5XtAnQ9SPcjIm+5StDutGXVjafB/mu16gBbjXf7p70tR+Upa6wKVYJY2n+QnTpjUYIC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1n3RH5mUHelV8fW3piOzC7/SjelUfYwjGjRA7JN8AwYFZPbvt
	lmX+OgfQ1ZQ3zvliSsrwTCwapCQb5pRSDjiPXCtAYl9zDa7ZXNbfoW+CAALlM+Fl/oLchIDbnHi
	u6DlVuArZzgx9JIzSH5HMUqRXWrGlGCFxhvxH/v2ISM+VLS3iz3HTtRPj5IlPkrckEWNtbzAT8F
	TkGQ==
X-Gm-Gg: AeBDiesnoJzq6eerrz2bQyjUUcyTzXPL+Vg/UEDqop+q8+ELDGLPGQi1fK1X7Ang59b
	2J3a4iIVTVjXZ1DadsDlsptyULHVRnNiN+HosXIhZOg9QAAdqMPDWLCCdZxYaA5GsgoAUhavbSa
	T+iToykBMQvNUfOf77/XkbkH7E+xf0IF+VSlbnGitWuTy6LKI5qMTmQMoyEYKEevgxzANjwurau
	SnkMvfT/XV5mmYfRUniUNgV8hRm2g1VaXLXJTTpjFrwoasQQZOglIHE3iek2Zfj8nQlXlqnJY5l
	upZO1J9FiLtXp6nsdZsm43/esOzA/DU1i4LQOKWJSD5p4R9fkWldS0crhg5lG8wM8vahhwzyAlt
	/M2T9T++sVGfPM43zhRTFAP2erousGOGfyqyzYsPmps8z6CZKvk7YkCMH5PUdvN/bTd4pETlCRo
	En2ff4t7Thg/qSmx3YvZA=
X-Received: by 2002:a05:6808:50a0:b0:47a:8c2:a558 with SMTP id 5614622812f47-47a08c2b6a8mr4055145b6e.43.1776957435939;
        Thu, 23 Apr 2026 08:17:15 -0700 (PDT)
X-Received: by 2002:a05:6808:50a0:b0:47a:8c2:a558 with SMTP id 5614622812f47-47a08c2b6a8mr4055087b6e.43.1776957435470;
        Thu, 23 Apr 2026 08:17:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8a9b:1477:c29c:4bcb? ([2a05:6e02:1041:c10:8a9b:1477:c29c:4bcb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0b4c85sm502913835e9.0.2026.04.23.08.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 08:17:14 -0700 (PDT)
Message-ID: <8a4dcb94-ab88-4559-9027-49308ad02b73@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
 <20260421-add-thermal-t7-vim4-v3-4-a2e7215ed003@aliel.fr>
 <7aaa7873-9274-48d8-a6fe-cff4239b03b4@oss.qualcomm.com>
 <19d70883-21db-4963-841d-7c00505e0d9e@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <19d70883-21db-4963-841d-7c00505e0d9e@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE1MiBTYWx0ZWRfX/FhwYprYhW+d
 aiWMSuH3jF8yyv3uelosHDVbePuj7EsOpRzoDzSHu5dEYQt973z/dAmnYA7iaRnVcb9SgNG7LFF
 l/73yl2fZGvyIhUd8Q7h1bgMmax4clAsTazDXgIV4FhmS/x+57OeGNCNaYQuluPM4raIYJHFWYi
 xuRTjMXxRkHtYib7Irgg/mRozc/J+frVppF1ZOSrIMu4fHceEiLz4SjPWw9kCBypgsqYOoFZgAt
 wW8gFXVdRRQgOAgSl1pFv23AoiiJCkNA4YzN63CJCYndFXdhBTRLrVobMYfdmdqTG3iEQn7DVQl
 ZlMRkCcyeliqzQlDcwf6C4z4jadahhZQkzVZqaCCZ237TerOFDTxaMKSfvNal5Cp/GOUMhD84NP
 gqR/Nrqs6ruewiBvgZFuXkkq0xknEdHGlb38Io6nzXgn0sek0wXdFZp6IIlEVLqgEO4DMfm+Wqt
 PjYFcugg57VXUTQ5Jgg==
X-Proofpoint-ORIG-GUID: g8k-A13LMshWI3g0jctjKLPl6-pRUALy
X-Proofpoint-GUID: g8k-A13LMshWI3g0jctjKLPl6-pRUALy
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69ea37fc cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pD_S-A0WoN6OyM3pGvIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_081717_994551_3658314C 
X-CRM114-Status: GOOD (  22.45  )
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

On 4/23/26 17:09, Ronald Claveau wrote:
> Hi Daniel,
> 
> Thanks for your feedback.
> 
> On 4/23/26 12:25 PM, Daniel Lezcano wrote:
>>
>> Hi Ronald,
>>

function1() {


>>> +    if (pdata->data->use_sm) {
>>> +        struct device_node *sm_np;
>>> +        struct of_phandle_args ph_args;
>>> +
>>> +        ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
>>> +                               "amlogic,secure-monitor",
>>> +                               1, 0, &ph_args);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        sm_np = ph_args.np;
>>> +        if (!sm_np) {
>>> +            dev_err(dev,
>>> +                "Failed to parse secure monitor phandle\n");
>>> +            return -ENODEV;
>>> +        }
>>> +
>>> +        pdata->sm_fw = meson_sm_get(sm_np);
>>> +        of_node_put(sm_np);
>>> +        if (!pdata->sm_fw) {
>>> +            dev_err(dev, "Failed to get secure monitor firmware\n");
>>> +            return -EPROBE_DEFER;
>>> +        }
>>> +
>>> +        pdata->tsensor_id = ph_args.args[0];
>>> +    } 

}

function2() {

else {
>>> +        pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
>>> +            (pdev->dev.of_node, "amlogic,ao-secure");
>>> +        if (IS_ERR(pdata->sec_ao_map)) {
>>> +            dev_err(dev, "syscon regmap lookup failed.\n");
>>> +            return PTR_ERR(pdata->sec_ao_map);
>>> +        }
>>>        }

}

> Sure, I will do that.
> 
>>>        pdata->tzd = devm_thermal_of_zone_register(&pdev->dev
>>
>> The thermal zone is registered before calling
>> amlogic_thermal_initialize(), thus pdata->trim_info is not initialized.
>> When a thermal zone is registered the thermal framework reads the
>> temperature, so it reads an invalid value because:
>>
>> devm_thermal_of_zone_register()
>>   -> thermal_of_zone_register()
>>     -> thermal_zone_device_register_with_trips()
>>     -> thermal_zone_device_enable()
>>        -> __thermal_zone_device_update()
>>          -> __thermal_zone_get_temp()
>>            -> amlogic_thermal_get_temp()
>>               -> amlogic_thermal_code_to_millicelsius()
>>                   [ Use of uninitialized pdata->trim_info ]
>>
>> Right ?
>>
> 
> Yes, I will move the initialize before the register.
> 
>> IIUC, amlogic_thermal_initialize() can be also split and moved the
>> corresponding blocks to the functions to be created in the comment above.
>>
> 
> The SM and syscon setup will be extracted into two functions.
> amlogic_thermal_initialize() itself is kept as-is but moved before
> devm_thermal_of_zone_register().
> Let me know if you'd prefer a different approach.

In the initialize function the following chunk is added:

+    if (pdata->data->use_sm) {
+        return meson_sm_get_thermal_calib(pdata->sm_fw,
+                          &pdata->trim_info,
+                          pdata->tsensor_id);
+    }

I was suggesting to move it to function1() and the rest of code from 
initialize in function2()

That results in amlogic_thermal_initialize() to be dissolved in 
function1() and function2()




