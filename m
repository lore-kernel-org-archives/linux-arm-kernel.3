Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0D1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6CPp0iJudsU6L8wSjPuRWKqGYqr17Tm7EBF+oYdEIM=; b=RUPJtclV5Baw/90391yWBIXlnC
	yv1+6t78Tqg2KXThBrGp0dbnS036E/LYozPUxTpoWsNigcw3X1xMb1+B13GEnPSzwMwT3hoC+cfkV
	LB2usJsQTMknm2ufrVOJDNaGDnCWAWooU21OaCZJ2hbqh23HzsFfI0SmGuqfMKHSmjB8zBOwPlb8I
	DJTFC73HFKGtW6+eg+cJtZUCIt9TJ+X0rzODzUOeQ0xqmNaHQnXMbrxcrUPv9ThOVTta2k9kHbdA4
	jzTEuT8fLO5KRCOLmBG9MLCsu59lLLT2Go+iFOQrnpmr8zBN7Ng59cDWXW86sN07c1QamnXVXgNQt
	YA/UDYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvi5-00000008I3W-2vSA;
	Sat, 04 Jul 2026 08:26:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvi3-00000008I32-2TlS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 08:26:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6646hlg32293031
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Jul 2026 08:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6CPp0iJudsU6L8wSjPuRWKqGYqr17Tm7EBF+oYdEIM=; b=ZemKFxjO6AcQKlK0
	SCLwmrUnKICDVi4LvF863+RK7x0XoghxqaAI+vd2UKkMfM9GjsDYhEANFCMJqxX+
	5oMN+94676A8gao4D90SiC+WYIVk89xLAjPVeS5Mm8xHd2bqvcRqjw5mX6H8FnFq
	C42TDsuFiT0ZkYYskPs1QdAhaqIh1ZDvPye+EbsB7C6yRGTT4xs3PeU2phxTapSh
	eNdsY7dbeU+C6yQwcCBXuagTTOszxPEVr1fcfbnnnvUgwUF1IF64iS67VDN2YqdE
	prxG8NZrZQvPmzrD+a8Ii9XmJnS58IfJzdX//+AWlJ4Z0a/wkAxtEnCeOQO90dUm
	muosbg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td38ffp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 08:26:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe2607511so1990901a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783153606; x=1783758406; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6CPp0iJudsU6L8wSjPuRWKqGYqr17Tm7EBF+oYdEIM=;
        b=fE//rBvDwyYEA8c0S08+RLJyVnjOsvXjamhTrcafolMnq2OdXKuTwekuWp9YiLIq9J
         EduCTJNBlXb29Qud9dMArt00ZXam+KdqhQBdQ1ZX3sCfvTWKMd/uFUSVHKYYvZl2Moyl
         lCyGZsHYa7m183kXQH4Rt7D0mg2ih1rNsR4wzm9cWfJZpsqZ+0VUmgI1zzyvC9F/6h5B
         /wJ2buq47U1WtK7uiLPiK+tr7C+5aiSZq53XHVVDGWESGDHM69cw91AlKmgYzWhWEMqn
         cmgt+S+RPKpNiEwj7jZbsQhyH3fwtIbvwFOrxybtlOsp+zM30Z0v4lbucqPnelQxkjLn
         9QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783153606; x=1783758406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6CPp0iJudsU6L8wSjPuRWKqGYqr17Tm7EBF+oYdEIM=;
        b=DYEyPYPYnK3AHraqBmD+neHzmd5x152bxgAhFK1JR43Qo+IVmIwoZOKnzkPcHqJGPV
         VK8Cu46XzpPjBVG240seFRBrmeT5UC4PeSNMu+xNpsg1ZWZqaiYNRnDRQoLdz/46h05x
         Y7D79CA3eNR9T085waVWg9/C82wpuBFFOs+mO4JbVG452WaTUt3DLET/A6bngrLVDwCF
         jvre+CZK/oPCdvdO6vQf/yGlXApSKbWlWlD6wzWUsB6Kf8CjFQoDxBxFBdlDRF9J35kU
         9bYXeH8XSjXsv6SePMirv0iF2fpM4xlk0QpUJnwxF1kbZTJbbtH8D5xuxzC/ijqeZZjP
         Dxjw==
X-Forwarded-Encrypted: i=1; AFNElJ9TLGNUgfck89eWjwb21ssQRQTRUUCdOkCCHTwag4zZVEwTzhggR4UH2BKJekRSq1fimLJTyQYmhBt7ip9e4kWf@lists.infradead.org
X-Gm-Message-State: AOJu0YxLV9K/F3B02z6hf38CEeLcKy0EEFC1gdhfx+G6sQlDvvl2yHAT
	XV6PyQbVNF5ZJ/J/e/5bK013wqQjnEl+90gwJOucgEP5PRq45a79thG1PFY3bDyVJ/qt+H4QkS9
	Dy+5Z8RoUKJYcBVG0rTHzf1zoHLDai2eE5pCwRMaiQs6iHU6okYM/pbyjuQZEBjP0aZWj7Rqre7
	Ma1w==
X-Gm-Gg: AfdE7clbYurSDr85pbvK83aJF1xjBKlIlDapnJP1Ki34YkrZWWc3ScPsrElC9gQ1tOC
	QgmUCKgvdjucYIC7xMlTstnsdzBagw9lyzkrPq7s0XgNIiLn4/x22mf7TeLHaCfoz1TsepGTxqL
	omwLCx5bZcjGSxYY+0TdNpMPowWlVtKFsY1aw0F9409YB5CWNMeFKblDicmZNzzubKZRRjybLCB
	fjG7irD6L7DNYNrpVmdUFYCAel0l+QQqVnAnCKRn8tu4OYON1DBhmjdj0u91nVOWmpmyBo0s2ll
	W/WfI/ZutZNXvSrvjE1DdWOHzMMiDMrHbYBwbMGS9ZPxon2VTidvQY3Xg7N458qducJT/b6Dmrw
	ig5N6shERf+FDdgunyP/dfcTZRRepCjtJ5mooZBghESg=
X-Received: by 2002:a05:6a21:3294:b0:3bf:b5fb:d7ac with SMTP id adf61e73a8af0-3c03e1fa2f3mr2525751637.10.1783153605607;
        Sat, 04 Jul 2026 01:26:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:3294:b0:3bf:b5fb:d7ac with SMTP id adf61e73a8af0-3c03e1fa2f3mr2525713637.10.1783153605147;
        Sat, 04 Jul 2026 01:26:45 -0700 (PDT)
Received: from [192.168.29.91] ([49.43.231.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f376bf710sm10035822eec.6.2026.07.04.01.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 01:26:44 -0700 (PDT)
Message-ID: <ca8f3731-3f23-45f5-82ed-ba1a65514b95@oss.qualcomm.com>
Date: Sat, 4 Jul 2026 13:56:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] arm64: dts: qcom: shikra: Add GPU cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
 <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
 <opgj6twppqwhb77itqelmyzniaifcja3wdazyzeal5axstr25g@a7v634mnimbm>
Content-Language: en-US
From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
In-Reply-To: <opgj6twppqwhb77itqelmyzniaifcja3wdazyzeal5axstr25g@a7v634mnimbm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDA4MSBTYWx0ZWRfX/7WY6tl49qPJ
 JqF220+oYbjjp0cZ7S/6TdtKwAwLISpV4u65dGl/bfi+6gUlT+m4m9XEMZ0/5nXptZIfRElcBOd
 rw03iHvOSqtS8AR9+5cOikM7TE1LOHI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDA4MSBTYWx0ZWRfX9wk5Ta8UNXHA
 xiVvGsSQpDvllDCtUt3RLAWAOFRwi8Qm3CmtYT3XCL88y4ucH9e5RZLNQVZiDrTA67xo03X5lNr
 FTv11AL5WG2Lv8bO1BC3lsozqjjeUrtskd8n9aWTzx0BO0k70K3yx4idA1/zVrUKmfiOfV2oy10
 EqkHO9MHQxCVhnSAFQEDeXpcThdl3dmNOp1HuD4r1qxZzYAoqshz3HYdCPx/AH1QawAn6wRO4KR
 mm8f3HrrHukjC4bhwrTyxKpFWlSFJpXufwADDowUpNRPfjapsFU6INop/4lQYcj1ayFGEPeba/G
 mtNIbTGnnkfYqF+b1/+9YQ4dM9PXaKVG/lBWJPhst0EayyVU54jiHBJTRM0YUQ1lIpWk6wsx1I3
 Eob8yzaKL5kJV/eHYZgPe9G8nS7YkimvPOT9UkBywyC9LKHIGkSlr88bgSXFIdhGewz0wutSgzi
 102C+3clAtPVqyZ9zcw==
X-Proofpoint-GUID: O_hRSWbKV5M392a5BbgVpYwJbXyJEjts
X-Proofpoint-ORIG-GUID: O_hRSWbKV5M392a5BbgVpYwJbXyJEjts
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a48c3c6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=lXa6t/u14VstaBBXcWJ8zA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wGVdvqWwsIcFZm6VKzoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_012647_633603_430591BB 
X-CRM114-Status: GOOD (  17.62  )
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

will update why part in commit message.

On 7/4/2026 4:41 AM, Dmitry Baryshkov wrote:
> On Sat, Jul 04, 2026 at 02:04:32AM +0530, Akhil P Oommen wrote:
>> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>> reaches high temperatures.
>>
>> Set up GPU cooling by throttling the GPU speed
>> when reaching 115°C.
> 
> Nit: 72 chars. It looks really strange to see two paragraphs with
> different line wrapping.
> 
>>
>> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 34261221664b..eeeaa369d3a7 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -2510,6 +2510,7 @@ cpuss0-critical {
>>   		};
>>   
>>   		gpuss-thermal {
>> +			polling-delay-passive = <10>;
> 
> Why?
> 
>>   			thermal-sensors = <&tsens0 6>;
>>   
>>   			trips {
> 

-- 
Thanks & Regards,
Aastha Pandey


