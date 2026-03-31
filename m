Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3383A1061B21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYQnTO3P5TJN689qyQjjyJUE/WvHSMRLVAcSKMleW2M=; b=zpAsALCqooV9OsPdSoYciuC7jA
	eeh1vkRSVh2Tc0iE4pulfMRrt1xMK8B9N2DeWgfdfYCTk1WAmY5AjeXnMlyCp8cMdlcrj2zbm0SYP
	YLc/43MdL1l+B6p4wTfPEmT+xBexevyXYSBbWo3+Dd6DQY8BkviRdnCecPRLZzPfHBxao/ZluELGF
	n8eoZxAMMntrG0vWZPTn6UZWNPZy7HVzGJcHozm9q0s1BGRbELaQTdY7kA64Lqvkp1DqNbiYPhRU1
	N1yPLVR1UlH8/6zjkeZfbcY8TsSU5RlDeSJDqCvTa50VB+qdyX0OMVAcIAETsD+4jd9LnLWH4wUhG
	n+K7O2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WMZ-0000000Cmrr-30Vr;
	Tue, 31 Mar 2026 10:30:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WMW-0000000CmrX-3UFR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:30:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5aLEO1091498
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYQnTO3P5TJN689qyQjjyJUE/WvHSMRLVAcSKMleW2M=; b=TQE/cA33jnncrQR7
	9aueJB+7igAtKck0CD+hZbqvEQG07r8biZ1TWTl3u9vId9WGvZWEo0v+sgqnh3Yw
	v92NcOd3co23QDQ9jg9HEFC5EmKiH6wr9xDaMhxdPxODZry74YKbwBTy5/9P8sso
	annNJe4JblQMFfEJgWLZbVUCHc3FIatSfiCnn280jaAsoMfqwrvObLz4B6j9QxKi
	40ewi9Ib6IJHm/ky0V/idNB3tGxGYiqd9BLwF5xLH0jzW5tvxhNptxGavBgt6ZBx
	xgnWsfunLj3EhEJ79okI4Plrp/tuHuemCZD1vzO7QeG9DAsAo8nLREn4y2Pzl2CV
	8CKgOQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd496a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:30:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so22216156d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953019; x=1775557819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aYQnTO3P5TJN689qyQjjyJUE/WvHSMRLVAcSKMleW2M=;
        b=ZyklmMvvm9DyDQr2/P5JEV5iiuQs5WLvTZg+Wyo5921nLHwTheAPro/hPgNaXaO3gb
         wrOBWB0gSL1RjenSKmPEVN25sxLxBjhJnquWTmokn3LODgCFG6Y8SAol5HMTf6Zfovi4
         q/aljDT5i5IIhOH7hmuK6tKCZib6ijS/hbv07wC0SFaz2lQJZSKYwuauvJDvvVBoz6AN
         atpx1pDhOyogmH0Porb/ehWsw73sygujQaGEOVKmq5yrgq7blB8oZD+gZUExYVfYCAZP
         Wq+NJjLOLWflc8F+x8tsoUEJYWMNafBowGe2Vp66TXmya4YmQOXEL8Bw3kJHUFsOvD00
         Y5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953019; x=1775557819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYQnTO3P5TJN689qyQjjyJUE/WvHSMRLVAcSKMleW2M=;
        b=BGQXxeiko8hnL7R//yJkINQA/0UvxUAiuWwfLp9JYt8/njFbWj0LCUCi3AHLb5XTZQ
         lNoAcd0j5mGQMzzGHpoVTtc6jzLaAihvEv+76zTlsiPqAMk+/17blHDv1ZE58S4opgQ+
         Y2oyy3rnhqY9BKRBk9vbh7fxpXi5l9bIwsVZlVqs+HoBUg0r0f3BScwtf2l55DJpmSId
         dGmo+Z1FKg4T3ozZPY9HFnhq9om4WJXGHjODvX0ELz/Ko4duhfmWIhSkpdqAdOXhLLy1
         S6G7DcHRVH+IPgJ8pxWyV+IrePnU70VBR7shwx/1x4x8upukMQbS1STwi3RCs07gUtre
         mvKw==
X-Forwarded-Encrypted: i=1; AJvYcCXn86YGxIdxbHLlBnRuHQps3b2y/+av6NbvgC+GqN6o9sC2yEtognkXjiIEwCYQQSz7KcOObfj5bE7LRQrLzyW5@lists.infradead.org
X-Gm-Message-State: AOJu0YxYX8WBgQsQELFr0hchRxEa1/yyM4SNk3CnQ1LVdc6BKP/IdprH
	K+HvyW91wypj8e8lteIGA8WpDFl8B9dQ9EGDDe67/5srKJ+4SICmhDtKaY0TvQ1HRylbqC7iVoH
	CzkSa/KD4WUOHT7mP0XcQjEN+eSKvnHZXwZo+dS2ft+Z301Re8yANjXAocV2le97x/ZeJnc/q1x
	alwbhx9vA2iw==
X-Gm-Gg: ATEYQzzaa2oe8KH094xx2439OrBD+3PFsVyCw3zrMR/6OurniNlvyYVqY/a09ps+eqM
	CSXOE3WQ4jmLBBMa2BDE6n866A8/yMluHGYW5GScrFTU9eb7+WhftwidhDRSiY9lLXN6E0uNjL+
	ryZ3uhqmM97tiJ2Yq44zmj40/hHsC05bNFsCh1Mwf3pkvqdYAtgGQI0WNTArmY7we8wHFPME/hc
	1RiiJImJbq1xT3BpVZY8dCHem7OsqbabBYHuG1Fim0tofYb8G8bQhMGe3ptr4w9ux+o3htpetLj
	fT5McLRUv5SfmVGubR8vJayBxt7DiRjWA+m3NiVx8hGcUNJ0t474XGJVcQvH3PKl9NepekVBkwK
	xECWFhVKOxW2D1fmvrn9p3nJ8fXY51PRnRRIgb6sLTStwMuXdwxZq2YWYgI3XNNOr3jCF8ZNw/8
	xQ73A=
X-Received: by 2002:a05:6214:2466:b0:89c:e075:9558 with SMTP id 6a1803df08f44-89ce8df76b9mr173233916d6.3.1774953019020;
        Tue, 31 Mar 2026 03:30:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2466:b0:89c:e075:9558 with SMTP id 6a1803df08f44-89ce8df76b9mr173233366d6.3.1774953018470;
        Tue, 31 Mar 2026 03:30:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24d6bsm382655966b.6.2026.03.31.03.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:30:17 -0700 (PDT)
Message-ID: <da6bd52e-3bd6-4938-81b5-8bfcc6874e22@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
 <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
 <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
 <7fece0e7-31b0-4b92-855e-bd9e210cc651@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7fece0e7-31b0-4b92-855e-bd9e210cc651@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6V8nFQcmDL2EY-hbCBgL--EPpMN72sN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMSBTYWx0ZWRfX6ZKYnX2tOOKi
 izV8cWDXHSEQhmYi/pcYTq/rtocd4X8cP+9LIfMfa7KGIP1Jo2MIzoDXTpOTqA57BrMu3HwGqms
 J5PJLkOecjZCF5NT4ccJT3dH6FI3j62dYRdI+dQ950wgYWlJTU7XN9Ay6O2ikWAVm5hX/37zVXs
 WNJIgfGI8nQLUohe+K5kneMfneU90z4L698P93Jzvr00GOi9uurir02DwrV2o7Mdyi4S1i8ZWbS
 Bow8co3+RYcvgoR2ZbOFOSejAnGqi94hRbbBPz9sTr3c6jbHJ5HR6UnjJr0k5Gx/8D1d4rZWWdK
 AACmb57NkMnte0uC6ISEZO76/knk+SvN8m7yEgPD5u3KV1G5UNGp86Qc/eThQzdz4L9vppG195h
 SJiH1TKKs+jTCtATiswSFCs8bTf0xVirpPcb0P0WSHKc9zFM2/zeOcVVls86NX7dbAcrtndl4hO
 3ydRiXVpgoCUOq6TkBg==
X-Proofpoint-ORIG-GUID: 6V8nFQcmDL2EY-hbCBgL--EPpMN72sN9
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cba23c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8ULpatOiM0j0TomVWBwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_033020_904019_CDC59CE9 
X-CRM114-Status: GOOD (  20.43  )
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

On 3/31/26 12:20 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 12:13, Krzysztof Kozlowski wrote:
>> On 31/03/2026 12:10, Konrad Dybcio wrote:
>>> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>>>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>>>> and is not modified: neither by the driver defining it nor by common.c
>>>>>> code using it.
>>>>>>
>>>>>> Make it const for code safety and code readability.
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> --- a/drivers/clk/qcom/common.h
>>>>>> +++ b/drivers/clk/qcom/common.h
>>>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>>>  	size_t num_icc_hws;
>>>>>>  	unsigned int icc_first_node_id;
>>>>>>  	bool use_rpm;
>>>>>> -	struct qcom_cc_driver_data *driver_data;
>>>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>>>
>>>>> This can be a const ptr to const data, even
>>>>
>>>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>>>> they also could. If doing this change, let's make it consistent - so
>>>> shall all of them be const?
>>>
>>> I thought about it, but then it turns out that videocc-sm8550.c has:
>>>
>>> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
>>>
>>> So we'd have to duplicate the entire struct
>>
>> No, that's not a problem. Pointer is not modified and we speak here
>> about const pointer.
>>
> 
> So to clarify what the code is doing now: I constified the pointed data.
> Not the pointer. If you ask me to constify the pointer itself, it's
> fine, it will compile/work as well, but do you want it?
> 
> It allows only definition with initialization, no further changes later.
> All existing drivers would be fine with it, so just confirm that's your
> preferred expression.

I'm actually a little on the verge. Maybe let's keep the current
iteration of this patch after all, as it'd be a mess to undo if it turned
out to be useful

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

