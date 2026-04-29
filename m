Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B13CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHRrET32SHTb1DTgOtLIV+Q9B0HVXrLCoeH+mBoYE9w=; b=ebYb+jbdiAAxCFouDblfxHRZmm
	Y9HOgaDC/YoIh8FbHa7nq7bTZMAC6UWr/PhsmSlC2CD4x1BBGrPQyrilJD+1gSt+yGs0T6ly2NttH
	3Px4r/hxwOi62E3lR2wvMciyc3th3H7sWg3rc/xMFrWREDBcdABM/7Gqz5U01vYYxkD7IyPkuGjKm
	jVAnrk0abbBwKO1L28HrVjxHRtNCqP7OBI3vB40NHowvCh8rvLFfM+9B1nHaiUUkxVEg3R8yfDUYQ
	eytpxLcaHoOztjNS/IX44s6TCvLp7ZPfuULtiIc0cJ6ILpQE6AyP/th1nxGlBbXlCJPTBCGB4s4xu
	m8dgDJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6sG-00000003rX0-3qaa;
	Wed, 29 Apr 2026 15:30:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6sD-00000003rWA-4BjU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 15:30:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TEjihg1641624
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 15:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHRrET32SHTb1DTgOtLIV+Q9B0HVXrLCoeH+mBoYE9w=; b=Uos2pxMSCeW96Zky
	zgv/apY3jYlg6UrZiRUBEevWJVC58Hv4opNzuRyjrNlcF12jjWIv4eHNrIu3KQht
	qnyCycnPFlQZ3vMU6PRDp/k+xo5WJYufy/sjgL2IieO0ApRV9eQvR59gdc2aw9jS
	ZKsXt3Ydfztlw3w2JzYHWf7C/igXhIMDGAAlvSe++Nm6FiH4LS0jN356PhftB6lY
	LqlTg2QFJZDnLMW2QwDbrlmkE2hXEA1dAMRk9b0qIratuusVIsxq6yLr6i5QeUeJ
	qIfbMWe73Ar1sPjwDeIoE6vFwiWPZqM23XisHwWpA9uDqgTpW5NxLCcCBlidLHs0
	xsD5Dw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj826ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 15:30:48 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-953bde1773cso16759090241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777476648; x=1778081448; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uHRrET32SHTb1DTgOtLIV+Q9B0HVXrLCoeH+mBoYE9w=;
        b=TXjDI0wguxYNIkbfb8gkTVxnKT0rhZOK4O/6xf09Kekp/hizUIt83fnL4te3jqE4Vc
         v87AssLScPnj23t8wakp1AUcyyti4lMIRdjDC8vvHkQwVdC03g+IUL609MZ0zxEacMJV
         JCspOE6TfesXcbqlDjhRrJwsuvO3i5Nuj0r46cx+S0yJWdSQKurrd1GRYehrjhCcd8D6
         V91NJ44sq9lw79uSE51vmmeuLKsJOOT+ejTE/s4D/E2AgKWTjVYEf3vmjji46tkFSctO
         Rs/uiEXUywMICGVhPTTM50TPvDceExc18cqNLow03u/b5n36BJesLGp5lUCaxmxHFSVp
         BmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476648; x=1778081448;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHRrET32SHTb1DTgOtLIV+Q9B0HVXrLCoeH+mBoYE9w=;
        b=gSuDAb/6q3+XliJE36SN05uU2j/kupoJHRo0A+WYBPRQJnJrhhEXtpCKEdznFUOoup
         7Q8ANfIeKL+dcw+vypQghRbduQ477ks6vMa/AC5cUO6pdmEpWm07IviCJWwskFFdOzbD
         bpYI1MhMZzAef5Al3fc6VLlAaJabwUV88D8xT2FUi+CE5d0Nf7K4gZ8UUEBuF8rlmy48
         5p0im0v1H8xFC9jetwi2bLXv1HSiDzawQba/5ZFvRdkNc1v8i8T4LgcZjZ7pNcOhqVKG
         UDRBhs4F+SCqdHl9RKOBEGSIhGSmMe1NnXv2Ie7dDfZ3qJ5SUthnRb/qbiZw24CueSuU
         3WjA==
X-Forwarded-Encrypted: i=1; AFNElJ/DWdXtWmWY/GP8PMEG6oemOc7aC+ETHwYH3scmUibk2tn+GYPfzX+h/VEcGHI6ZSajWQ4QCC97A/uQyQFlLBpP@lists.infradead.org
X-Gm-Message-State: AOJu0YwV9qr6WtmSqyhYX0Y+D8dc1V4MguWSO+P7U4+b1kMf4aL8ZCit
	qmqGy8GXjCN2Zat/1O4Gw0z2wqY3zYTfWscp6Yi6nUAgYAIC6gFCnbUxL/m/AJwGufmsJ1A/6V6
	RhobE2QQMr89EQObFVxXqfFYO72o623JZPxQydoM9zZaXarLIJFW47vDFpHH32QoCNj+6MfAU9N
	mYzA==
X-Gm-Gg: AeBDietwyFEm7BPgMRgOYg/K2BXI2gO+rUuovS1e/5odIdBt50P8ETEADdTO47GMUov
	yzucKNgOKfFgVncb5KZhXXKd4Mxb+FrL5PnQfD9ccgOx2nwFTKVRkHxJUbo8WH46HHvOk+Q0iYW
	B3zTUsaeGs2Aab8q+OGJmbUH34DCj9ifvleKFsUqgHyS9xMjOZuX1qUy1+DSCKfH639tuinTSOU
	3h6+yACFu9bnYbJh5+qZg6F5Nd6dOR8//DfH45mmM7iaEkWOLCM6PfZLmInH78lqeLFQ/OP3kJB
	nf+Xn1YxvzbJlDOmAOpTzfMAFFLSnYihCwrlgETAHkepnNssE5Q/VLYhwBRzsVaOlVBrOCf042Q
	OJnddq08jQbpkLgohQzzTUwUxsGFDbPPTA4Ci12XUOBI4I201ZXJpNq9bwz4=
X-Received: by 2002:a05:6102:c46:b0:604:f155:9374 with SMTP id ada2fe7eead31-6280a3af2cdmr4424589137.15.1777476648178;
        Wed, 29 Apr 2026 08:30:48 -0700 (PDT)
X-Received: by 2002:a05:6102:c46:b0:604:f155:9374 with SMTP id ada2fe7eead31-6280a3af2cdmr4424531137.15.1777476647584;
        Wed, 29 Apr 2026 08:30:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca6451sm6738173f8f.36.2026.04.29.08.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:30:46 -0700 (PDT)
Message-ID: <daaf1ad5-5ba7-4978-9758-18caf829def7@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soc: qcom: Hide all drivers behind selectable menu
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-1-69ba540b3fe9@oss.qualcomm.com>
 <82602963-6caa-428a-9b39-e0cfd42ae87f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <82602963-6caa-428a-9b39-e0cfd42ae87f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aqoEcJZkoejmDEsP_n1eecXS7uLgqx0o
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f22428 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=oqn4fRuYruEmQnGXFDUA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: aqoEcJZkoejmDEsP_n1eecXS7uLgqx0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NiBTYWx0ZWRfXyJmQTFOg7Qd1
 WOYzUUjB1p5TmK1bPRkazb/6G0OxGY9CKUNefBl82wZBUzKkIPG3cAFXrC57wtYfNZIdhN+ytzG
 dHiP6sSes9e7ZU3/+iRPxo1BF5Ij6wS53MsLJfnCNzCY4dEERt1KAKQa1nGJ57JFJUXpiS6/lnj
 4P1e71zaQs1QUiBaXwNvDFEatqDi6r/GSlsuc3wmoRsPMwJ2sxAOkbidavfBDTR3se0HYHN8S+q
 Qm9ax7i1dI9cmAhH0e1JWRIdQao9OHSOsAoTRPBZaXzxjeawFRj45QZGhlLMtpmo1myArDjLX0P
 1DlV/RA1NWrxbd2tUA4gWOOdtjNzW1G0ymEClYTl1MIEq4cWxCUl9AdqR/ZT3dlHFT0S1ebisVe
 eCYiK396tJRSGd5mb4QLbC7oAx3JiPgNaT06T0xlmzNAK5kXr0JOlFd+hwEZnkpHxFs86d9JAT+
 cr4y+wqH2syX0x/9A4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_083050_161965_F2B6A18C 
X-CRM114-Status: GOOD (  11.97  )
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

On 29/04/2026 11:28, Konrad Dybcio wrote:
>> +config QCOM_PDR_HELPERS
>> +	tristate
>> +	select QCOM_QMI_HELPERS
>> +	select QCOM_PDR_MSG
>> +	depends on NET
>> +
>> +config QCOM_QMI_HELPERS
>> +	tristate
>> +	depends on NET
> 
> also:
> 
> QCOM_KRYO_L2_ACCESSORS -> drivers/perf/Kconfig

Ack

> QCOM_SPM -> drivers/cpuidle/Kconfig.arm

Heh, that's user-selectable driver, so I think we should change the
select into dependency. It will make choice a bit more complex for arm32
- the SPM cpuidle driver will be hidden if this is not selected. But
alternative is that this driver will be outside of entire menuconfig.

Does changing to "depends" feel right?

> 
> Konrad


Best regards,
Krzysztof

