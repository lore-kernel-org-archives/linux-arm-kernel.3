Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CAEFF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5PxjqeUHEa6eLwkA5Rfm1TAmpNQwAWliF0o+hYRZHk=; b=zHvqduDnwOP6ZDXSFDsHdqfNCl
	WJcBYQCOmCWgB4wrKK/wlkWkxvHiGVadr/mJ6AzBZBAR3S9aKcqxZFXkjO3Ft6il+wcIJtukRKMYt
	U75ZIV6qU+/ljLo8plbmGyazMdOzMt8RHw9IofwaDT+xfeq5DDxdqDm5t7WYXRI/28X7N1Q0/Zwuw
	ZGj3dd/PQDcQJmtFnwpBIfCd84oOIwahhmaZkoxB6yNc1eksRfOzXJjmkfvaR7jUV+Ea5YvTVo6fB
	wrnRI+MDEnD7pPfVUnpOAPrpbdUQ7vV5+LCd1DY/wWOWL2I0b6DAjZ5mSjrf8uoMmpp8wqj0QMIpg
	2OqpJjNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W2I-0000000Ck5e-18Ou;
	Tue, 31 Mar 2026 10:09:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W2F-0000000Ck5D-2Uws
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:09:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7OT3I2465187
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5PxjqeUHEa6eLwkA5Rfm1TAmpNQwAWliF0o+hYRZHk=; b=DLT4vlyhYAUOZ7Oe
	ugaXYJ9zmCj03KcfX7/2wB3sUs4Gy/Bq+v/4mxY5oEfrW8UFIlpk6wiSifoOQdPg
	ErcX6GzG95TLk+GAIP3SblP5OVlFBHOsl/RIaOYSZJusDVXmnO3Tch4cRLUu/r2f
	vn5zGEQcpS+Z3tk9Ky+ZAXmXCDKne1DPXHPMSOF+sdoBXv0KsIanHrGQAcCemGnl
	OugGjqxCjENqZ6Myhx2Yi7wT+4OPSviFrYHIBcBEGPJcdBVVz2opaAdUahbIoBVq
	bPxsaWHTxa3+AD5qzm9AbqkWQVwXjR2hekXfdznuoyx9TSjPRrikwkiNb/4jPuwe
	Le3tLQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ut8q91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:09:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b52a2d70cso164024141cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951762; x=1775556562; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5PxjqeUHEa6eLwkA5Rfm1TAmpNQwAWliF0o+hYRZHk=;
        b=MMvMLfetIx4iJhdSHbj7svlNMqy3UaCvSWPb35E8C7ub+n3GN6oJupFE9AYqQVhZvG
         61zR3SpEl03GyLJyd83nYwkxZh9H+/qmL/KmhHQBKfOu9VoBvztBhNIX8YDiUg0mqbmi
         wpB6i7l8w1yIcU2QiTdH9RAiRy8YFI+zVk7p++ivxuG7vBdHfeLkntb6J4Ov1qnB5lOn
         NLRHRkVWF6gNO14vvTf7xEF4X+HzkX7RqkJBT5SrSNSxBSfWAC0ASabU/ieoWMRCAb3f
         Ff7W+mVM/Alj5RDmA/V3XDMkOHjzu7J9VOlSrGMXB9eP5VYeQpPXAAjzSlB2KNvsLrwI
         n29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951762; x=1775556562;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5PxjqeUHEa6eLwkA5Rfm1TAmpNQwAWliF0o+hYRZHk=;
        b=S1++54HM6q1fuMOvvkfOVgsJj4rn13ih2cEEleYgzdTpQzRZxWY/FZpNOJE++Qy094
         3csT7gusdBo+mOOfU2U8WlXlgUP3wX/MS0MecMptIvHCbXX5sMM6I5EMSA+5KQsTrzcA
         6HEsPq/vgLWE1wSGUSMmAjxAQbKBxL/nskwVEZs6qwH85fRYtQMh5qCKbGKTDAXr+IwU
         B1VKIHjvZiU9irueb1kBRjhF4n1yF9wxAoaNEw9IZBwaj32kzrF75LfCKcAPM/C1n0ON
         ygAgeLSTi2T5w1BPPB7DFEh6abfaKbBXiviEFDqcqBu5xTaXbA6enRlKlQLREcpy0A6g
         v3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCW8/OHCwGPJcqjB3SwkaoAnyZ2ASCWjCpqt96T8OgXnBucu55vG1cwyit1p45bL0nYdM4FNY5u5ec7AjNkDeNlK@lists.infradead.org
X-Gm-Message-State: AOJu0YxXOSuScNoITTtvV7Cm+PZthSliZpE1Vh5UE41jlJOkWio9fthE
	J3NsCuUXNBNBjq8qfYed0RkX7AOUjtx2zi+SrUaW9PiXg/yJWQ2ijh5xQhg1R3QqDrxL1gFkBs3
	v1s82Vb9Ch9NueUFzpc4kyuCIBIp/PvQDo6D87hNMnZuyUsMW4Z0oJrzFsupOjGyAUwHFDRoD0H
	P+9A==
X-Gm-Gg: ATEYQzxcsECyMPloOPFrSpi/uL/5f0c2ZhXFa9fA3NUdRu1F6Izl98gHuMJfxwRA/Qo
	8O0VYFVHchRDtERbnlr25HWEZT58wNzcEOYTBxFtmuTjji3sRVVe6/9NVdX0gwtt1qn71+A8Wkr
	K8t8kLDu/828JGlWf255x7lTNTCTnSQSOiwIOvT/SMRhHq4Yzqwz9QU9arSbA54V+kj5STPqm7M
	wGxHV1gpZCd7HVAMySmVfyVMdqjDKPMCqK0VuDdQtOPncldFNzZkzyEOR7wfxdjbOUJxwJRiBFC
	FR8kWW5yOuh663VGoNPr64RDZtwg9dxvfZc/kelgPZPHb0SMSbIoBJm/dM9WJcz8yxybGonOCrz
	wD5VoyPhU/rt3nGCuyv4IobqEyx3a0Old3LjljDfO7+0hpddg
X-Received: by 2002:a05:622a:154:b0:506:2041:13d6 with SMTP id d75a77b69052e-50ba39655d1mr207868611cf.50.1774951761820;
        Tue, 31 Mar 2026 03:09:21 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:506:2041:13d6 with SMTP id d75a77b69052e-50ba39655d1mr207868281cf.50.1774951761447;
        Tue, 31 Mar 2026 03:09:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e72da6csm49983705e9.0.2026.03.31.03.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:09:20 -0700 (PDT)
Message-ID: <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iFLhthM-pUTtAC9E_MWkGIzt59W7vrtx
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cb9d52 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oW2FW_nDJJYFMtiP85gA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: iFLhthM-pUTtAC9E_MWkGIzt59W7vrtx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NyBTYWx0ZWRfX2Ubf1coZty+3
 V4QVu8iY4d449UILBQ3F841//sev0z/zFyFtghMKMJsNKQZRru5m8pgzMVqI7YaTkIsVAItbW/q
 dlaZFvVv687YaBxGp3S5VoDZLYsN5u4Y97a/50EOpDomaCDdSA5nLv+OjevFNyBoCXEpnu4Kgyx
 elA+ctqC6EPpRXVGnw9FZgpApxHEOnf4hpeno7Uf0tWvaN9PCkdFobPEJXsXi7zZ4dFVy1Pbq1a
 i3QYrdpOAv3teJg0H1WUesDrJH+JvDDRZjxYwcJlysBB51X1bgnze2kGYzRsshm/eaLc7yFatVt
 0A9/NkY7SEz4Fe5DL7AvWf1nSgCSHU+jzfVHjFCWDn2qD/uftW7R+sjyy8dTOw244W3hEUKyY6R
 7AQVbCSI9bUe1r0ugcUwUnQvQBeQAUxWm35S8O23MknjK3S4lU8yOKYosVXoxw+MFFk7DTN0PPx
 gSz5aXGyzTM+eRmHgAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_030923_758774_E2C9C9B9 
X-CRM114-Status: GOOD (  15.60  )
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

On 31/03/2026 11:33, Konrad Dybcio wrote:
> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>> and is not modified: neither by the driver defining it nor by common.c
>> code using it.
>>
>> Make it const for code safety and code readability.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> --- a/drivers/clk/qcom/common.h
>> +++ b/drivers/clk/qcom/common.h
>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>  	size_t num_icc_hws;
>>  	unsigned int icc_first_node_id;
>>  	bool use_rpm;
>> -	struct qcom_cc_driver_data *driver_data;
>> +	const struct qcom_cc_driver_data *driver_data;
> 
> This can be a const ptr to const data, even

None of other elements in 'qcom_cc_desc' is const pointer, even though
they also could. If doing this change, let's make it consistent - so
shall all of them be const?

Best regards,
Krzysztof

