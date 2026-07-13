Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E177CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ucGZQxg2reJFI939JSAKmdJkAoKn8gx0mJoRPr4qic=; b=pkbR1lEwhLyz0ImSB3iRLDxasK
	FIkdidHDJhpYDxDiW3gU6+or7PpZ4qM0gGmaEc+/poabr6chlvG9iBakICU6iAVVZGbkDpe6qiaxS
	ELa/9ajXqrR3dHyQQJYjQzeFuEzYdMVgudUZvL+gd0UuBMPaNWKcglGUdc5PfyhzkLaEbXYPDzGI9
	axloDje3kMJwC9zmm+CEznAH1zCRpHIfbWgN4lJP0R7we2lmNEUX7Hu+VNwjHnK97LI+RTos3Xbgn
	A7xKAVjtvMMd/ymJFx0oSc2Itdvmn4qqE8jS85Bkwas2pRmbfR6Pf3mow4s2jJKZz8XgdGDFaMm4P
	ZkNWV4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMfi-0000000AKGC-1nsh;
	Mon, 13 Jul 2026 19:50:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMfZ-0000000AKE9-482P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:50:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9S8t2435350
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 19:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ucGZQxg2reJFI939JSAKmdJkAoKn8gx0mJoRPr4qic=; b=LyBk6hsU5QfSEQIl
	a7iKaaVJ5egLKv+CBOviDq4gAmwGWqnQFRWUdVXsrX8zU2EvXLEiI0U3NkuXTQB1
	5XJrafTzPcublpd/6SMcJd9MpBINSDU0ImV2FVCq0QRMZKUUFTm1Gdv3lR+1vD2e
	ibmSEsZG9iGnKsHvxw2JdzmMOIAAy0KolV3IbxmFe5PTM5no8OE1IxDcdkhMldRp
	Cem6cuxLQeiuu9BmOsMrOPW1XbChhmz/FX/W+FSWa8Q18kT2W41Mbih0RZM0er3s
	ICvrBCD6y0CsVOMNM4j7L4tqvce9Jc3bgALNRi7wCk3OY56Y3NEZg7FEHzCZW3fw
	aDwIXw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavtew7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 19:50:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ab059052so295614a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783972225; x=1784577025; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ucGZQxg2reJFI939JSAKmdJkAoKn8gx0mJoRPr4qic=;
        b=d/OpOhdYwD+BmiznKW+xkIiigGfBj/W3+gAZQzomMkcjFmUpYEZjTxF2sGjMI6LxLy
         kYZezoT6q3jSM3DfVrNQO/cju6RDSpMmzZweOZL1jXxr+etTMz8WDcKfQfvA0XzLOpo9
         mBzy+k4EmX4i1/1WCGcdb4jOusUCeICcw/fPWS91yY1Yj7zJrvTlD8hEIhKQXx9Md0vP
         Ub+p1TnojY4axYXEYzK+0qRmZYmQY+068Hty6lVOIMoewrbSyHh7u4/7A0UPgm2GEflH
         N1hbkKk1lYXXRWhIObOAKFYynLhfXtBO+mYRdQl51gbYmTawTIRj4z8dkQqBrR7145Ui
         ssJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783972225; x=1784577025;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ucGZQxg2reJFI939JSAKmdJkAoKn8gx0mJoRPr4qic=;
        b=hinb85QlKehUexjgYnQF/rzaowYDyArrCuieSteqP0lwhNeuAsrGD9jtPiMfEasI3l
         jX6qt30f9FfKFxYxGUqybJV2UQsDIVKDKDMklrOjbJLST6q/5BQ5rxn/mHEy5JOEhk+L
         b25jbp+R1kyZsA/F5LDFH23a2rxIF/xfHkaX9AdoufPAn3P7szEeRJpG0Xe+H7nFmAD3
         7bxao+vntgqPdL5QhFPdRytw93SrQk4ev9lSTm3i2koEi0ys6svJ0W/E7/+8oU1l9O7o
         tWQxX033kVtA2NAT33NGTgvI8IeN5PsQ6T9e+lxrGIEZTbeDBLgPxx4MaNZBJbLUSHpt
         nT+g==
X-Forwarded-Encrypted: i=1; AHgh+RqZNzocrXnOaJHaW3qCBHoqJSXWv39ZL4fGcPP7PWFxx1Y9VIFVsTY5LbZVACXMqeyHHpqakS2CRHMxGrN0BVJ3@lists.infradead.org
X-Gm-Message-State: AOJu0YykjUM18gNWtbr8PLjvd845DIW1wA64qoaKvgiwPCxamF2B9uDI
	HnZNUbWyxNjDNSVzQ0RhGdOcd8DffAbQw3vvzMqJ5rCkMEiSF090GUzXHe2dGW0l88Ai/4xK7w9
	mJCFGiS0qVJTGLoQ139tlyEcoFTcDBTDQOYPNSTmwlSaoteePOQSeEpLhsq4IAeVPFCATHcrq/F
	+blA==
X-Gm-Gg: AfdE7cl1Gw9EgwlcYnIiFic5ly67TWyGpqKJSxJ87a/AekYYacrii7BW7qRy8uZYR6g
	XmSgxVWCU4WmdyILSa3A7hAkkTDnJuMLUo/7JFJzS4SLnWMQh4/5rrxhg1TsVs8BR90WkBy7nFS
	sueaJqjndJxkxm8NK4kqO7a0VV4YMN91g6QRh4WZKuWyNPSa1Je7sy9+NS7rvHpLcqyUuIeav0W
	FXO2u1RsrLa0iuWa88oE3r0X1krxcYyckbZsXibTFmyx/iE+LZhRltGEz1jdjtA3aE1l66t/zF4
	I3XUlaiSKqGYxdIk6n7bw3NHAbzkgbSASuzRrLubGM7SDsLjqWQ36lnpFAbOX4+XYaMD1IiY+9L
	VcaBMwXPznNHhSUVDPwlrwYW1+yBaMqWv4r4=
X-Received: by 2002:a05:6a21:6e43:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c0f08602bbmr16998118637.2.1783972224697;
        Mon, 13 Jul 2026 12:50:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e43:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c0f08602bbmr16998079637.2.1783972224229;
        Mon, 13 Jul 2026 12:50:24 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm57081837c88.1.2026.07.13.12.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 12:50:23 -0700 (PDT)
Message-ID: <2d9d6724-a3ea-42ad-8cb3-ef08fd0882be@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:20:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
 <clfy5lvz7vm3ogw7pvyyidiujqcjxftx55p67szwgc6ivsq6r6@xrrcbfdkqkjo>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <clfy5lvz7vm3ogw7pvyyidiujqcjxftx55p67szwgc6ivsq6r6@xrrcbfdkqkjo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ejf2qT02hZWeKtNkhnTywHeQJ3eVes77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwNSBTYWx0ZWRfX/dqwSD5pQ/yB
 1KaQemR6YA/40o5lOZglrAwMJ3xct92wmc66w2eaxk3BS+JkPoBCCxw5g6PICwWbJ9870rYHoZw
 z0FHPLcMivhF3aWi1gSwTyzNdOxrWoAiHbfWYt13bUlgVQz5zgmbR4TuZxLUv0mN041m1LqSbW1
 wAC+ddt3wlvbFBXIB/QZt1pmyP4cW8a2cIgkKTwx2gT2wxwrqO2zOe9SzGiV9aRoaKkCVzD9dkf
 ZcHCRkf2tYmGl5raU3tJoMA6opx5iziebi/5+W1AKlUUYy3Lj43+KdDOyxUF+VAfz4VEpAjDPIn
 zjh0y5ejcPRjHUu1/RbrwdKA1n7N3+UGVgzAafZpF4SYdXOgdtnR6UTWBvUqsN0mtjjQwHmCfqD
 2JGQlKSNHan70iBWTsv2/254CVZcdSqFv0nCqSm+8yN6PrdnAkFzP94m00PSCKRAsakMRJNd1FY
 IfdAWOu1PrRkPVs17Ow==
X-Proofpoint-ORIG-GUID: ejf2qT02hZWeKtNkhnTywHeQJ3eVes77
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a554181 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=yNfbWwvibup9Ri9izU+P7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JoE_KpbED9LNO2fW3XkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwNSBTYWx0ZWRfX/EyGK4f9Y5sU
 XQkBFkduhuDmOnxoZBkvBnDPzjLYZcLzOhU1KzfsFKcq9uKljarLxl2eXl65TPCcREdhSqUy9AG
 Lwmw9pZlWSGMdxLAoY61RTQMtaU/OGQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_125029_516028_394EBB66 
X-CRM114-Status: GOOD (  15.72  )
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

On 7/7/2026 3:53 AM, Dmitry Baryshkov wrote:
> On Sun, Jul 05, 2026 at 01:44:23PM +0530, Akhil P Oommen wrote:
>> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>>
>> Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
>> shader firmware path.
>>
>> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> index 1374afd9d14e..b280d8e845b1 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> @@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
>>  	};
>>  };
>>  
>> +&gpu {
>> +	status = "okay";
>> +};
>> +
>> +&gpu_zap_shader {
>> +	firmware-name = "qcom/eliza/gen70e00_zap.mbn";
> 
> Should it be gen71700_zap.mbn?

Downstream uses gen70e00_zap.mbn as this fw is shared between Eliza and
another GPU. But, for upstream we can rename it. In linux-firmware, I
will keep gen71700_zap.mbn as a symlink to gen70e00_zap.mbn.

-Akhil.

> 
>> +};
>> +
>>  &mdss {
>>  	status = "okay";
>>  };
>>
>> -- 
>> 2.54.0
>>
> 


