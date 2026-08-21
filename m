Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EFBC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=; b=cuhzMzJVYJgcaArY69Uhl0t7yJ
	Vrbx8vq1/2BhZJMQfCx/82mRbCAeDsYLHi+ecRrRq82UQlpzLARVYkzeKqI9OAd7+N5fMDlWP1R2S
	3f/4PSv9EVn0U7IsuUrrCVFec5PYmYmHGdglmF23lpvymfEduoTkH5piZ+fs66sj55yxMbB7cMp2+
	g+tn7ortBLvU9mPd9vTzR7eG4h7QMRzUwUNKw+chjJU3DtJAzNZgHDtqfj+SZS2rZRhUU8UkItgy4
	a+0XUS5IknrsBS18jw2s3pgSm90s8j/qNej4AobSdyuDmlVmk7gHUDuP4eqmJFE3kV8kLFrSgvfVP
	yvglhmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRy4-0000000Dn8j-0uPI;
	Fri, 21 Aug 2026 16:19:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRxz-0000000Dn6W-2GIp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:19:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmJ8N3392758
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=; b=N71lhcbr5rc5+Ma7
	v7CHr5pI0zWKHpS5WKfVzmaKWSDa0qPLNneY6rafufgyARMVgi9FcrqVaWYBBHrY
	COagBa67FingibI8pSKl3ZwRQA9CnJ5QMJBs6Z4TjfF2GhOwIr2vp3P1uMeIIG4t
	qmYRQR3ydxJpNjiwhamZ4GfR6vuUGjPkmNG/wjhw7aue4GfQo+tL4uDY2pkovlLi
	+dcVHB5V7ynk77UYXI9igboWYJBlMlZ7vZXn8ML+KVjbaIDJLqogTXzyrh2tERZe
	Q6CfduM2rbDDPPMwB9E36inNdUhnSpN0Zzd50lct6zIe71nJpniAs06X+P+IOYuD
	gULumQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fuhjgkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:19:38 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-44aeefa1a30so2693362fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787329178; x=1787933978; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=;
        b=UrahhqBXaQU7CVG8wQsMvYtyGLRR8ngQs/ONtvYivDBLKBPxRKFwig3lM1up1BB2I2
         WOZH1ej5TlQdl+fZKvVWzwLAoDPo9B5fiIczEVfh0q6yka2llB0pqB7vmIXqduvGE9hN
         BDRmRzHNPSkib/zrdzzlaGmYrUX6FKPMPVR9NxFhpb9p6baQsJFwvLnlnYfgpNyb1+r+
         KJwE5XSiplmoHUbsNLsZ5feTY3S7lOosWHG1L1j8g8xBT0yuAV72eg0fh2gJTWLpjOWH
         MpCr6mhHiQqix4c65daptBfXuyk6JSTjeSWOchg1Czg27u8XUj6WCFa05g22owOl5VMt
         R2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329178; x=1787933978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=;
        b=dDAeYzzujKts4MSKiTqeQVscrkoaNF6RsKW+SAZISNg19PEysdHoKQ802QoM7rStAE
         18l13fYCos3O9/0JItx0cc1lT63HbRRmhY4YCrVjAzZ34gCRAeJtgrGcXC0MFy3vDzb5
         5U2Yu6Pf06vtz9wJM7tf9P3o2ZaJSQ9wggRxijyWvAPx3/UvOATA7zp1IqWObaxBET01
         FVvxU55PddttaXRAagw7Q4AlYW0wXsbxUVJ8NRL+8zmsb5AdqC11yLPfZdPmg0dQSICg
         C82d5H1giCaPXKHxFYk0ChzH0H8H24IZv8FW5uChJWMlkqODCvJNc/hPTuY28+DWo5gy
         zXmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPZeNgkjFc17eci4Dfr0wbPsOXazx5NC5NR3H8VFxxbNUMjDr2k585SfKktngtp5Ockzgp1S8z8Gpp+D1oUJGh@lists.infradead.org
X-Gm-Message-State: AOJu0YzjMCYil1a8LbFZfbI1wKKkEUPre9/eEoKkU34tiy3m0av+kFje
	vuDe3natLcy6I5oQMYj0We3MGXRu6HRzCwMUwEj/ydd1gUusNIaAlmAqSO1HLpVxtkX2ApfhVEU
	UYZFEDX80uCWO1hMTYiryc+SFH4TuQCTLEVGL8XdpeO/uN20MM5n4bH0Jbr061R+eeycUeYV+T/
	uGgg==
X-Gm-Gg: AR+sD126pTKj/JZdXuC+qRoFQCmHmuYuu9y+U6aGsosmSTyaVa6zLel50nL5Srcm38y
	luSPzTN0enpEBIXj5wxxZFsIG8fCu9RDqgYnlex0cC2+/pSeh/QLhyMBSpRK2eAOUQ1dh/Pj/HV
	naXppaOEH/ktcO9p5y1iXVDdGCk/NVj4bpeQwv7S7kjnckCMLzlB8VcS1Y293c8FxV4Y2KkXR/e
	XbKggaqBCkfsGfuLb3Cam+fKDG5xBAwNyw+2arijOLId0YmFcTmGNFZLrgkbYwHlkjO2ei9u7vo
	aNLxF+6PZkkT/Ema66tj5Yv7ftlpVTPbqqtLs1VJhEWvOL/NErmtrz+UBLO3QYKhsWGbr0Yo81Y
	JPi6+BYR0TjeA3uAAGKMkyy+Dp37n4NkB
X-Received: by 2002:a05:6820:308d:b0:6b1:681f:81a1 with SMTP id 006d021491bc7-6b1681f9275mr1606883eaf.24.1787329178052;
        Fri, 21 Aug 2026 09:19:38 -0700 (PDT)
X-Received: by 2002:a05:6820:308d:b0:6b1:681f:81a1 with SMTP id 006d021491bc7-6b1681f9275mr1606821eaf.24.1787329177641;
        Fri, 21 Aug 2026 09:19:37 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.20.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4632a6c360asm4738369fac.5.2026.08.21.09.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:19:37 -0700 (PDT)
Message-ID: <c82359a1-6b64-468d-9823-a196f291df0c@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:49:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
 <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
 <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
 <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hc7o9SBJllrEnRfEFsKBEPWP6xRReXb-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfX5nx4F3TqOSjQ
 3ZoG5HEEb/trPw8zIG/LO9YBV9lg33nNkd8hERC/GZEGKfIH0eHeQYL17xQTVu7x4YqQWdjCNz6
 eHU2B3YLYcNJzI0KVubCZNvhwZyd4Xo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfX1n6zVpeWy81Y
 Ty1O1qY6AzxFd5rXJy2VZ/uInlho2QOwr4Umsc51BasOuKamNxnH7tZ8UKwNw84HgTnhLlZJ1By
 1d2L6BWNjkHpGHChDxBlJVaU8sU/24zFpBdtF+XrBSBbT9LRGLM9u5Ns3CucJzmVsrKeD2q/f51
 xepaOpbCD4nnvD2WCAUIofjgESPUjQvkg16uRchOgpvH8ehNFkNbeUCuIfCXYFPdsvvE86BtY4j
 UnW1xPPdOgvdyOARl5UPft9tAJmbZyUn3Joh0OFsxsF2AVcPYsHwmwr0OAUaF+m6kc8Q3IIJ1Qt
 RrMH1AE4nxm6XipQaJ9/Ih5Y15XFDj3UfjO2eQ+pUHWt2Ssh4KpABbHnY1MP9Vjb71TpK4xHXMH
 Ypkm9WsyoUDI06+RdPvcmy+Cm6D7Jq+OWqVSPPcrVrffxAXaynTbK/9ITq4rpzihAGB7xr9aEZ3
 xgGXOkDd18cly/6MdGw==
X-Proofpoint-GUID: hc7o9SBJllrEnRfEFsKBEPWP6xRReXb-
X-Authority-Analysis: v=2.4 cv=UtFT8ewB c=1 sm=1 tr=0 ts=6a887a9a cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=+KmVXPE0btiop/5qwQKk0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A1cAmru4g_ti7Hb5znAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_091939_589959_523BA535 
X-CRM114-Status: GOOD (  20.04  )
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


On 8/17/2026 8:55 PM, Konrad Dybcio wrote:
> On 8/17/26 3:42 PM, Hardeep Sharma wrote:
>> On 8/17/2026 6:54 PM, Konrad Dybcio wrote:
>>> On 8/14/26 9:31 AM, Hardeep Sharma wrote:
>>>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>>>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>>>> interface through the common pinctrl-msm driver.
>>>>
>>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +    [65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>>> +    [66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>> Function3 can't be selected because of repeating names
>>>
>>> In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
>>> Perhaps there was a longer name that got truncated?
>>>
>>> Konrad
>> Thanks Konrad for review.
>>
>> It's a real qdss_cti_trig1 line - the in/out
>> mirror partner of funcsel 2:
>>
>>     GPIO65: fsel2 = qdss_cti_trig1_in_mirb, fsel3 = qdss_cti_trig1_out_mire
>>     GPIO66: fsel2 = qdss_cti_trig1_out_mirb, fsel3 = qdss_cti_trig1_in_mire
>>
>> Both map to the same name because the driver uses one coarse
>> "qdss_cti_trig1" for the in/out mirror variants.
> But these are physically separate functions, even if the mirror feature
> makes them seemingly one and the same
>
>> Listing the function on both funcsels is the normal sdx convention for
>> these mirror pairs - the in-tree drivers do it, including the same pins
>> on sdx65:
>>
>>     - sdx55 [16][17][22][23][54][55][94][95] → in pinctrl-sdx55.c, pins
>> 16, 17, 22, 23, 54, 55, 94, 95 each repeat qdss_cti at two funcsels.
>>     - sdx65 [65]/[66] → in pinctrl-sdx65.c, pins 65 and 66 do it —
>>     - sdx75 [16][52][53][56][57][78][79] → in pinctrl-sdx75.c, those pins
>> do it.
>>
>> Only funcsel 2
>> is selectable from DT (first-match), which is expected and matches those
>> drivers.
> As you described it, you found a bug (FSEL3 is not selectable), please
> fix it in all the instances you've mentioned.
>
> Konrad

Thanks for review.

Corrected in v3 : 
https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Best Wishes

Hardeep Sharma


