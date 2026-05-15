Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5BDCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snB6+NanlzO5ED1oSn259BAYEDB5oyVPbZktkbp7PMc=; b=Qxt1w2cY3i+RaMuxmIdrdSVrnL
	37U/H6QabgewtuYzlLBWD4R0BtNLizdzN+64ZqrC45PUaCUR/QXpW7lQV2xfTWepH295EaDVvWmCy
	N14a9wZkheovFzG5WzLSyp+DXY1Wjg/0y/A0H0ttUe8G3xTBFXxT/W6G+WII7LAYu2C6lulGnJ0Ky
	eKQzTuPOoZ8l6ymf7xaWi5vdhr0ZdhymASQMhZzJ36IIsuQTo9wU1M5A0dfFFwdCXE/Orzv/LRhTm
	f8T3sQnWMYfmW5Aw1hO3dTKiucjNuQsFKvYCGh40iaOq8+I3e1GcMdIrwElVSAYG9Og3EBQfLgKr6
	OCxezSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqpb-00000008D4k-0hkp;
	Fri, 15 May 2026 11:35:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqpZ-00000008D43-0hBi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:35:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAc4Q0655391
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 11:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	snB6+NanlzO5ED1oSn259BAYEDB5oyVPbZktkbp7PMc=; b=Nx4t/S9pQwuenA3U
	RlxD0W0Z4YV/A+0ijB+p0RX07CsFvk7o7cuXa7udWA6TruXz8MCnTwpRUIFfMQ0L
	Od5kjttnzniccEMGw9pLxNmQN+YNZROdZTYfk+FkjxVcO4znZue6FB0BhYTm07KW
	aPDTi3BI8CAMHapzADl0Kov4hkHzeJAUtT4hfdn16arBAuP2ZZUNupVmEK285Nwx
	iQWnU2tYj/5xZp8Nv0E4Zy4l4Z4huK67r1g+dpEiET1piT4TgSqJV33jdQxvQwLr
	NjeRWVzhksbuQ8KsnMR0dfJ/CvgNzHqLAX4XX3aHuyG0m77EIjT5Y9j7h9SPZhM0
	sVcCYQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu48y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 11:35:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5753c3390b3so771163e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844947; x=1779449747; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=snB6+NanlzO5ED1oSn259BAYEDB5oyVPbZktkbp7PMc=;
        b=fuvsSBdNN89XTQEDD3smKlq7tRx3a1xfLNaPi1zrRRI5KHYM5X97yPD3rqjSaVKJwf
         Rvdfrl7XXnG1sBmkXT6eLbz2NPetRU0T9+KO5EX+brVE0QjdNK10RoDbBDPXTTXTtXd4
         SlP6HpmdRFnfTuJhh+dD3kL/vY6xMZILN2vkLrl7yT04CcK6k6CGvQMgmVhgNuPlUFWA
         I4nWMaXuvQfwbhO0fSwqfz09zO22td44tZqWa+PdYQl5TyeV5KrFTQiJHn+PUwYehqNx
         ZsXxlvBbRFYgiSG9roZlnPO+7ItuaJa/1h9wGVP53zJpuySmO4wKrvimM/OYKiS8FD5F
         X5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844947; x=1779449747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snB6+NanlzO5ED1oSn259BAYEDB5oyVPbZktkbp7PMc=;
        b=BotzCgtC7xNHzL+FYB6ylfEHjVXfLaeVmgxoFa6PIwpXkR02B0d1GfsvGUeuDPh3oE
         nWHb7mHneyJ5xyStZFv8W1Sls+mT7OR/6mh75TPu/d5cxuwbzKQgLOxiIjS+LaeEGK2S
         bGJBM7KMviuGE6BczSWKsVv3lLAWy1QGvfjbbu530egM+5LGyHt3Lk300qnv1EzERb9X
         lmlbdfaG7bMEcspS4rSLvQRV1Cm4XFWin7HEXTg6efD+jpxgvtWUDHctuUnb3AaWTsKq
         zH9bjHOoW0blVmz2voiKUtbpEMVji0qSrmuE1wfxIq+n+FytqWAI0NlqHgvJqnDV54u+
         0oEg==
X-Forwarded-Encrypted: i=1; AFNElJ+YK7TecMtIgA2UTH31oKfdMYBtwG1tOlYYEqPqaf6FhnlMXJxwul1jKbkpQN/osnvwwdFIp1Nyd5uhTraGtAzZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7JGpE7NFdtYLTbAEDNOGBrRIiAc3npTeam1rYZDUgrUhQRSL7
	kuL+x5gG3B6JBgKAH0g2HrqgNg75xoddlP3fnBIINeWQ5+v3xjHWgxlx9I7k8DNTkr4lVUMREfi
	LM/KrPF+Eufjq2hmrgiE9zHqIP3fibSdBXUl4xVjlAMwgR4Rdnpe4Ec6rYGTmApRPHy2L0MkEXl
	2EjBLxx+Lsqw==
X-Gm-Gg: Acq92OHBiCm9uxW4o8q9Q5NlqwMjPcbPlWgSIcx4jUu46WAAYQqnTdTRsMMSquAhpIJ
	/41G2XFtob6lMhMDMv0dINXTk07gIlKeOshcOpsRUZ2f6SKc6rOkoXHJGZE9YjuXDtBXJGT4RYn
	0Tc5IR41Vju2IbZhsSq1UTF+bJ6FlSvDIlcfbXBihZ8ysmWP1I/Z/wErXLcQV4UDt9hQyW8k3Pk
	Vgjf9ToPlIHUHm3w4wchfo2YxUQ6e2k1ld3Aj61BTG7WkDYbC+Q4rlG0o8JD8vE8VHfjVbt7i/z
	lU31CByBkJeHv05aak0XuRaMePoOftY7P86E6R4h7er0ZHIyz/nqfcYLNbJCir2tIktgR6stV2K
	XaYjTBceNxTgZ3/6+0Lmm9VCtENKXh928I6+txXREGeb316vcCVUPp7ajx0bDCxKt5v88x73pVo
	viqUI=
X-Received: by 2002:a05:6102:3f14:b0:632:c8af:8a89 with SMTP id ada2fe7eead31-63a3f9a3a08mr733503137.4.1778844947561;
        Fri, 15 May 2026 04:35:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3f14:b0:632:c8af:8a89 with SMTP id ada2fe7eead31-63a3f9a3a08mr733493137.4.1778844947212;
        Fri, 15 May 2026 04:35:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e21b1esm213939866b.44.2026.05.15.04.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:35:46 -0700 (PDT)
Message-ID: <5d68c5ed-f777-45d0-b955-571fc192f1c5@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soc: qcom: Hide all drivers behind selectable menu
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-1-69ba540b3fe9@oss.qualcomm.com>
 <82602963-6caa-428a-9b39-e0cfd42ae87f@oss.qualcomm.com>
 <daaf1ad5-5ba7-4978-9758-18caf829def7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <daaf1ad5-5ba7-4978-9758-18caf829def7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EIrRwwvA_0Va1mLJ0-8NLAITBz7tOADO
X-Proofpoint-ORIG-GUID: EIrRwwvA_0Va1mLJ0-8NLAITBz7tOADO
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a070514 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=heyWJjdQ2MjHc7PzJnwA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfXwo3bBjA6u7Up
 gIYNUU6jxniZDXVit7fAndJ6XGb7vQN9XLFn7VamQdm/KQt10z+l+unYg7cBRbBz2fGmoLLauMn
 hDSnEKpuZNuDT1xUjAbEJVvNSi1ilEoLQ3ydPq5j2vpj+CsJR7u5wm8wG/tHAi0yfnDtqv2dK2G
 8UYyRSNWIq3myOnKswFBywvh67T8P756t1w8KKHgWxxWVwe7wCa/1I7ukLRoOyGVrQ5sjlKMLxK
 QEsnpiiwrGoxgd3vbq2t3UlKamxpIPyjfBuUyEY1+PzoZm2eECRpYJH3jBugDqs0hM92f4jGvYP
 a7UX8j5UnBE7hxGaWMMd4VJDBI30vzIo2OZTT8rBo9ryx0DPtAygoIC9sv8jSEbbWypvrOgipYv
 3B59G3fktDAl2P4/bb2He3yT5JRkCYyKCRJiPimZvUXuURbCXdrAsxl01TIDgy/cyHA65YayuSQ
 IhFK/joW3emhcaik3Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_043549_214266_32F5458B 
X-CRM114-Status: GOOD (  14.09  )
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

On 4/29/26 5:30 PM, Krzysztof Kozlowski wrote:
> On 29/04/2026 11:28, Konrad Dybcio wrote:
>>> +config QCOM_PDR_HELPERS
>>> +	tristate
>>> +	select QCOM_QMI_HELPERS
>>> +	select QCOM_PDR_MSG
>>> +	depends on NET
>>> +
>>> +config QCOM_QMI_HELPERS
>>> +	tristate
>>> +	depends on NET
>>
>> also:
>>
>> QCOM_KRYO_L2_ACCESSORS -> drivers/perf/Kconfig
> 
> Ack
> 
>> QCOM_SPM -> drivers/cpuidle/Kconfig.arm
> 
> Heh, that's user-selectable driver, so I think we should change the
> select into dependency. It will make choice a bit more complex for arm32
> - the SPM cpuidle driver will be hidden if this is not selected. But
> alternative is that this driver will be outside of entire menuconfig.
> 
> Does changing to "depends" feel right?

Yeah

Konrad

