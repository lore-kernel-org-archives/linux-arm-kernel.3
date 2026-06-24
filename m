Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C63CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=; b=Qy/1y7QaCFS011IXdr/E86d4G4
	nlIfMzhyHyiGyXE/U0xux0hk5DnLLTJuJZUIz6YAl36HKoeYF2d4NdTrdCL82D0TVvChXlFr1BehM
	pPTsWbP+8K+AYwnGdb1/p0J+ozK71BysfvxyoFVWSBFpeWNnEr5ZqP09D3m4VrFpTTYE73vz6/EHr
	pyYaLkqYutGRzXJJPCJLIGkcrzGV1YkDll5DWJciokLNDME+kaP9rZBrWm4KQG5dCdhIUUqcMOVoO
	6XQszUfvGvDjvzzaZaw2rDcMDegMNWedYJiWb85N2TZKUbmkMFU+iEky7U9Cw81NmmsyuCxHK2WQC
	hGxAL41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNeL-00000007p7J-0VyZ;
	Wed, 24 Jun 2026 13:28:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNeJ-00000007p6b-1eaI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:28:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OAO1uZ2845778
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 13:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=; b=iBbDXkocA62hP9V7
	NbHB4LoFdsZiL2otz5aw3jzwrXx36qQLZWf7/vqCY2x8+EXDDjspyiW0lzLq2L01
	qNSr85lYtheKTlkoJtUG+w3EzA7m6cfsmzulBKT2E5LmCqdrgH4An3LKSyP66mtT
	WkyAzW5uyKBlbeXGzIG6s9lljBO168d4nYdQOPT65UjWBoExCYDVOmj3ZzJXjhd5
	o6uAbLx74k8Zt872yfh+XavqcKECFWsHcbWTw9awIb+E/jWYgjAkEXzTbBTiHBiy
	Yv5LyOxJqzMm5kaod/XTqQrkm+Wd06p4uZVB3OIIR+FZ9zfT6edBhphdVHYrb0ZF
	1VP3hA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p3bmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 13:28:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dda2dc6790so3356216d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307693; x=1782912493; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=;
        b=BD5RQOji7VgQcrxIczJkyUHiXdcF128l2i6ZxobUgc5YOAiGOvuMbamW+qiWQuaEP4
         zhgwKxxOEB80SK43JTYcAKHsly3nfRWLUW7L71wdrIqJ2TDcL3byPJA7BJxpDpTpVbWt
         w8pK/m8QRw9gv0PH9Da62CZinHEm+w48kQAaMa2kjQTnl3snhu69rf46d36tH2p1HQnK
         PrW/oIkflKQj79dOHrwAK87bhxFu28tiSohpL/AgDDq5XNiXQJlxm9FNTmzmzUBX0AID
         Cqh+G2NmsmzhZPVfEBVc6pgv2Anbuq+0dTscySA6obPWodkCLNuV3+1jHZ3T3WIthnmi
         A0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307693; x=1782912493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=;
        b=NDIrvScf2OhmYeRBppcmfPI7FmZY+cQyhDtlKfOxbmqww9rx6eGtsYkM6JfuBWGLVX
         EhoK5ezEhjQZ3L4UQ2TjvJ/6e3bko5bi4XHTdT/P3D4eefR9PEsJjfcWYE1tbnAFD7+B
         427FlEc9itLwx3fm5CAcI5JCDjGJqjs0xmHyIKwdDQmOrQ/0Lfxa1JL2+BS9N3vw10C8
         bX8sizlIpOJG7+9qYyCi0622WKllp0DbS7gKvOeT4iLFd//xSeYDEmoiaV94NJrf8Xlm
         dxy5xWzy/PUWPJrnToOTNPs9kpGCLmhcD7dT/SbrLh6mv/PCRfSdnM/jlAKglNozCuju
         27Lw==
X-Forwarded-Encrypted: i=1; AFNElJ/vsqyYWO1Fn6l/3nkO/hXmnlYGM5esoMNjbnkOzXul37px8uYRDsuZgSBQyoo1LCkppwIhWIBqshzi54lqONuv@lists.infradead.org
X-Gm-Message-State: AOJu0YwUsQQbWMUY7G7dbcY/APZLCzxkJU/p9nh9XUrrpmv21UPQbBtl
	bedKw5aBC7O1GJIItwYBpzY1vLz3JrRTWXHRL6bcjVBdmclyxspacHg7gfiMeDuBFWqedRzAGMj
	egT0Hx2iiVuxxc7nISIqI5Pw5gZlKDhrLhwNLmpcNytoawAPWNo9usVmtMyFpiPkXGy47psDdgs
	O47w==
X-Gm-Gg: AfdE7cnmPByjyYZjpi8vcEszFFK+bfW3SC+RxSh0/sCmqx3J1HmfsCOey/pNX8BDw5X
	Yz6rygXxFJs3ywxKF7cxZJ+yVstHXyLlUIS+qO6bzrdaSNWJcHWPB5zQsWuveveLUfLx0yUs2Kd
	OOXa1X/HmGg/fjjXhzqOKe6GXj1KG12DhBLw8+RVbUE9aBCRJiYfnMkX56Ii7LYmwh4z/f0Rkf6
	2Tovw/U58wr+w2Ps8OYCXwgXNt9Dy5QbA9DM26Enu3ezEViNaj/nVXW4ZGVzRY6KKePWG+au7r5
	eo6s/mBi2RtejTrvJfGXWXV19+EMk9WYReZBzXq9+ZasaRRgpmDqWVSl3S52exq1GdZDAaqIjC3
	XsmTXSQegfkFqCUHHTkT/yTbKAwPPKWnDEM0=
X-Received: by 2002:a05:620a:3185:b0:915:8197:4490 with SMTP id af79cd13be357-925c95b2466mr942761585a.4.1782307687802;
        Wed, 24 Jun 2026 06:28:07 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:915:8197:4490 with SMTP id af79cd13be357-925c95b2466mr942759185a.4.1782307687275;
        Wed, 24 Jun 2026 06:28:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac7c1bsm661168166b.33.2026.06.24.06.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:28:06 -0700 (PDT)
Message-ID: <53cade89-1fc4-4ba7-aa7b-815b9e26d88b@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:28:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX95dvGD5wgUOu
 3g/Rs0ZwjJgi6W7IS/CDMKJ1WSkfr5MYalbxsLjR+I9jYz1IHnXXPRwyjKBsbvrNfgg1eVZA/yL
 fjw2o+R9QVEBEk0s8gCYHbdkOFpxqJY=
X-Proofpoint-ORIG-GUID: 9wjXyvOFOTjGC9yJ6prdPGmPHIcYK3Aa
X-Proofpoint-GUID: 9wjXyvOFOTjGC9yJ6prdPGmPHIcYK3Aa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX3P9aGj0cbMWp
 Hx/qsyMm8owCxV+beAAx710eo1xvno3SJXhDUpP62Jz8i83EZj6SlykVQmv+4mkbMDoqo+VqZlc
 8T/djtKpw/ONJ7qLEkA9Oaxlu6FFYq76ew3E7FX4lftvuOhu6A1wq+x1zRj/mzTkgf2u78A7dwf
 LTDBoBGzAvg+0IErl4td/VGAOs9EFlWoS1B3B0hY3c9MI4GWno9267DJ4BDVAM6obySLB2ZWeGV
 ainYTsxY4niT1wQXvOtvtZEppkEJCB+b3PK4eUYU4O9iR5Ra5W3dEYL+v70P16RWRZhKVtBU76c
 fksjS9ai9SRspOp8U+CwPoeVlHRaYYNeZ5Lb06o36Kh4xd2cl1+v+d3I1O5r2oYo4laAq7kxWSd
 zB3bhJXBUm2nYTp8E10Rh6+MmRIARw==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3bdb6d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=oK1bmnR47wnCuWhRGskA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_062815_577463_BBEA74B8 
X-CRM114-Status: GOOD (  13.56  )
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

On 6/24/26 3:26 PM, Esteban Urrutia wrote:
> 
> 
> On 6/23/26 7:03 AM, Konrad Dybcio wrote:
>>> This is mentioned in the memory map description, but is not part
>>> of it.
>>>
>>> I booted up a 8450 HDK and it doesn't even have MTE, so it's
>>> probably valid
>>
>> i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
>> trapping it.
> Then, should device trees delete these memory regions on a case-by-case
> basis, or be left as is?

I'd delete it and reintroduce as necessary

Konrad

