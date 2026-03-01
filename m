Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED535FD0066
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UcRkJBE0jtBQFdXiHKQOxpQDNuNb8Xo48NuOCyPK4M=; b=NZLNUpeE9bIAu/etsksT4Xe7Pc
	kRCLRCsxlTthOjQaOh5sQciAHAUEQzKkqtL+L3BRGOM+Td6tt2wbweYZf3vn60eAKN4ylXbF0ZZEj
	fCYLZARzB5rRDPIy0TD4YlZBfuN+bzZv1Xr/bCGhat/BZvgeLv/95tFu6IjYmmyTYkpC5dTMSgzcx
	qnDIRh/P3ROhY9UyzQhFiv0oR80w0BwhGp11HhNbZc/e3B+EO+s+WyERG5VqwjJM+a+D0q5yH1VB1
	3iTDwIp7NXdm6pHKMvSZijkzg6RaXuNuR8LrsdsdgPAxqSj0aZCD00CHYFoUiOmUT7sXtvyUoFffh
	bHPMYTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhXX-0000000BZAL-3h49;
	Sun, 01 Mar 2026 14:12:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhXV-0000000BZA0-1Oc2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 14:12:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621BIdGh2337791
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 14:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UcRkJBE0jtBQFdXiHKQOxpQDNuNb8Xo48NuOCyPK4M=; b=gzhR1CEsiPToMS+t
	ALjjry+gPfH0t08cE7CUFbacxuSiL8FKdtA8sApdCKEGAhGmnGGC7dfx7IWnDXT0
	77BiLxg8g4CIx2EwHSoCENgozLzcq6jp/FZ6b6jlHRpeDBQ5wtjbubdWNzcSZJqj
	3BP4434qzk69CU3NoKPA0d9B8s1FbYlQLEFpx8X9zbs+pZWCOGiKcapjCvs/albq
	j/zQ5vyU8gEAnm6IARyFMhxOsEgBoYF4FJ31hz+UTI7OiD/IsKizSRMNUpSQCN07
	OpLkoNc6hgI3SSYq5F1pV64NQZqLS/WUizbnl9VIHJCgeIW4hZ0vkOdp5ou6nzja
	3pCsJg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshcjv1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 14:12:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899fa82ebb9so11715276d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 06:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772374376; x=1772979176; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8UcRkJBE0jtBQFdXiHKQOxpQDNuNb8Xo48NuOCyPK4M=;
        b=TsbRZX4Zk5w/e8sMSW4rkxJU+XyF7lq8SOCS9fqZaHpNOujOIQNQh1NZpq/OZwl0kk
         oV8WShCtMFSCHelYCjiE8vdZ5MvgtTwCTxAZz/iPhgaTor0szhc08cbT7wZqvRIBy3Lg
         y4FSClh11sHR6125ZpwfX7cQJu4hHBJGDwoo4jN1LXfCJ21Zh7khDwxHlL2Jb7alImin
         L1/WAcr4mGp/Ew+RJwDMivfTwjDHcl0SyELCgH/uf6h1NhoWXkGLgBAKpuSKdgL1fIhW
         qzl35xHCxn0ubXbRd5j8lxiXJ7mMfRoTQtHCzvwNtU1YgIQuCNUD/ES+ivY8nCDk7b9T
         FMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772374376; x=1772979176;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UcRkJBE0jtBQFdXiHKQOxpQDNuNb8Xo48NuOCyPK4M=;
        b=WSyeRgP69sb2TSk/79g0OgkV8FYmONMbzcfw+R9vdDPWLs6f2unDx4LwksaHS3/J0K
         MdzBJES9ZAI7wf8fXFIAdLIc29LvEjYIDVyzaraeoPv22EBEZ3HDgxVPi++wu14qeHbN
         nYReCKwqnnAjLrgeRSXJPPtSyjzrLyhLAOIZeAjJvy48ahLhyfQFOgYq/rOFRHWHQvcm
         V9EqpDUk6CxDqafKAvJyRufxxqMVo362DFLESIzjXiIyCy2De4kwJXxkwfl1pxl/3Ltt
         ZeQU0erMTbDwA5Kc/3KGB/1Mf9BiEeKsGtXHyxMqgWNfzy0QMAjsEYEHGp7fHt1Ic/b3
         xzqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvchK03Y9rkgrMgO8SJdc5qkrmWX7daTkhobRD98GMgu/EwkZki+HcuTJLR1034RPK85lCGvqYbSHTa9/Yx0Rz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5v52Me966AUXdSoprp5yaMmpA72VOMsFrdm2jzIjeRsVeDNPn
	+A2L48fzAnKTW9g6O0IJBnjs9QDkuv7dtReSyhl2m/f96x/q/rXl3Iigplq6D42LUFuR/QW5M4q
	c0hzsyu32rXP7F9yirERTdlGQWNei+u1rB7d+RGY9sGNSOEYRIBi2DWPBSek1+tfC0dG79U4rPw
	Mx8Q==
X-Gm-Gg: ATEYQzwzzxT08pakR1C1XpEyXObhJ33jNBf8nVcVAnSh4vZnowZIiSsKZbHIDxtklPn
	YVWkgSoTRMnymZNITnZ9ltRBTgn0VviTmkrpi8jxrjQvR4YA6dDDZzESPAJSsjNaDGb1Cln9Uzz
	C1lMggjJhkHreQlXI5BbCb/90TjK23fcfQLGSp9le+n+plqqMRBm8s6uTDf8UhUBpOPn/RmIrvi
	EyL1CPmPFu7a9IsdT+UegeEaoFfMDNP/oHHLM5XGlMFkyidmSB9S/hAiOTX4iG0DTUpKIBbgJMA
	qVsz6iXoPBff0MlCOp/qOOnMLFHVyaEI55cryH8118UwMSY5YNiXi5j7sfRU3IIHp+nTwaIPdkC
	qb9OEdf7bg4eu4hkZu7TTQSbG2aQ2wrn+zEUXS2PTyaWrB/nX
X-Received: by 2002:a05:620a:f14:b0:8cb:5477:5278 with SMTP id af79cd13be357-8cbc8d70ed3mr1178937885a.7.1772374375844;
        Sun, 01 Mar 2026 06:12:55 -0800 (PST)
X-Received: by 2002:a05:620a:f14:b0:8cb:5477:5278 with SMTP id af79cd13be357-8cbc8d70ed3mr1178933885a.7.1772374375359;
        Sun, 01 Mar 2026 06:12:55 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b55df68dsm2509164f8f.26.2026.03.01.06.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 06:12:53 -0800 (PST)
Message-ID: <767cafff-1ce1-4291-bcda-7a9027efc32b@oss.qualcomm.com>
Date: Sun, 1 Mar 2026 15:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] bus: stm32_firewall: Use scoped allocation to
 simplify cleanup
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NRM7y-iv1mJ6OEIV_KG8czXNfvrPmKiC
X-Proofpoint-GUID: NRM7y-iv1mJ6OEIV_KG8czXNfvrPmKiC
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a44968 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=55d_-0XgqAmJSplXZjMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEyOSBTYWx0ZWRfXy9UhdBKl6hGI
 AddflMFDOsjkZNK8vkdGLYydfFNvcxLCnG5gmkbkwMCv0P4n/2i0dwiAsLWXWOZitP+dVJN+NRG
 KtO0dFlRMRrkMQGcZkJyLLUkIC58HgfiBgpEUEVDVCUoQKQE72g3p45VEF0AmnerXv9uY6Xv1xo
 9uLooLAzgU1AV8E43Sr1KrqHaM975MLSSV6azSh0joGuvB2m/7RYMezEI928AtApUijTqM7IqQA
 seOBGicCtdX7sqPrzDJY4U/oNYqNe8pV9qCm6WpKTPyAB4tT9BKyXYVi6ZjwH1A8SCgg4SBIzfn
 hhQ0Ic1Hb6YAVoF8gk8T4ZiXqbxklAe8eyFjgtQzdSB9Fj5D5i4NDF5jZ1K3OJFRYi4J1LelqfT
 30Ya5eqyTgi8qi862HQBrXjbDo85okx83oS0CeluwnA3eHcAbrICcUdc8qZDjaJUTEdV3PZgXYp
 +kHIKALtng7dEwdDnCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_061257_384875_B593B45B 
X-CRM114-Status: GOOD (  13.91  )
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

On 05/01/2026 15:37, Krzysztof Kozlowski wrote:
> Allocate the memory with scoped/cleanup.h to reduce error handling and
> make the code a bit simpler.
> 
> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/bus/stm32_firewall.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Is anyone picking up patches for stm32?

Best regards,
Krzysztof

