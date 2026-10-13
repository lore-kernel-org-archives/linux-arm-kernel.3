Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BC0CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=; b=espXS+jgkYO8vDqEGqzplPCQjm
	1IqmQap45RFnu4KxwMvf2zC9ZcINncTqEaddDzwXAunsu4I1x9CnINtzDxhiSB3nfyIlC0uORvqSI
	BnVTHNZJkYAApRFG/7dkXvYEfF3XcJYgWRfbaaXHu9pxOy3xkf6BZvIpCy4j6XK8kEyccHonMm/Xn
	e0mvNPFCMDpgPW6VPLfOuZRSg4rXBEn+WwEfZcVuCfC8zMvbhwnLOewnRCPiQzhvfCq+Im/ukp4b6
	kMr6dd5Ia2xbFwhWvCwb1ll/dMTmb5C/1mm260J2wTCRHAfTEp9Ui2EIxa160n711ubZrZvYqL8sP
	uipjQFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdQE-0000000D4zZ-00XH;
	Tue, 13 Oct 2026 14:24:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdQ9-0000000D4yi-2NuO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 14:24:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE43nN900319
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 14:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=; b=WbCqkCaVPtk9UIzR
	KDKCSMaLmcYdP1tdpf5tOpRaO0mn3OH1PnNolvBIODrRshpHOQfeyiC+HAXuuXSb
	NMa9FhyDweL/7ImGGK8oKAqobGVozeO6L87r76PpKW+7iisKT0zS206/mAvQ7DOy
	kyQZdimk5uqwwh/51UT868ZFKMrZOTn4+EN5b/SxxASJqRgF7BfceQ9oa5t9/VIo
	K6LiMfrkkofmAUwth/Rp08/e82hXilLVyHidvYkaRGkAA1aVu9T1JaO9O+qDHZ4F
	XUPdAnjZ67Sz2kIDDaDH8cdmpxJclU/KNn0vRPg4NpQRLKwZ1pGsHfr8ygRY8WOI
	bvlirw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uhq9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 14:24:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so369786985a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791901440; x=1792506240; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=;
        b=gwu9TWAlIEDWt1BMut52C4XGd8JSPDM+G6EmG5yizcfOxnU9D1kCjUUI8Nf2Yri77t
         GFnMeC9UKl9RCUTWMPGAURnjYS3gtFNG1fI6Zfmmo6HJmh9S8rrRyva2mpn2I2fHYbSC
         QK9NXivejPqkbH8HRMCMOQZr9AcKME5ByA9FTvsVjOHJqHSDQbda9kWnMDRJqvnRaTLF
         4pGD1BXJZCDULX4tX96zBcIN0pK44Wfw4qNEhnrWsV2VhUuXOnnBDI9d2seQjCseAqsp
         /sq91gi/Jzi1Rlu+RtRb+pEodEl4JzFKL6qWW9hixehl6ElA+AWpENAWSG5MMsdSVT6U
         xsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901440; x=1792506240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=;
        b=Xpllq7M+UfYK0nfmYsxD4kz8nSBQO7o+6j1f/O9hwM6K48jl4vyQS6gmKEQiiJFABe
         DnwKNsxuNsEwMFNPjBGI6Qzdh+1Nji9Zhoj0gTy/aVU1S0tHIVfWrOTQptkoCjIqd4Du
         dOtQkkno8Zt42hv4/j/TccLhxSg8cCVZ6B+wGxKingUCPME62IyWFM/6nAK4oMtZfIyD
         UELcxU7Pt6NRKiphC/GLlVWRHENcL6NPJEmFe5h1IZpKCvV6FO/VrlVPbRTI0pIePJ5e
         oHSJE+nYPe6/bkMMPj4IkQWjUPCAkvAmP5tU+ztKrLFZHf2nBLIgiQLj/cLeJQTZFqq5
         Z+9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwC/LBre0/Cs9vNBguOX22jADZoaNloBMOKOO22WPiml64++Tj8VNtEgKWHsp9y1j6yQGBvpRJVmxNJJV90gwky@lists.infradead.org
X-Gm-Message-State: AFq9FYKuQY6yMkOQxikjf81NRNLAjPK5Y1VziqZeKGj/lqE9xjj9p4dQ
	2/TEVtiNn4a/m+Hp7KCVk03fBrbhkKfMO4NRFg2SF25V0Eq7+b/0bkjlKnJw5xPBSYlVF5/ICds
	5fMMXyLz1cEgRN+hzcQI6BxMIFMf57TRNZgeK1mRXN78hcogtmk8PvOG896/1lh2n5QTonS3o6v
	b6gg==
X-Gm-Gg: AYBFou3DG9nmBPfVgTWfYZmBc1D/wTQMvcNZWAW/IlwvSrWznIH3fAyj5EvvMNSi7dp
	dcF4CsCUxZVMkPpvw5F6oX3eDZ0x5zWI1dAB8jVoCMo9Yg+lWLUSdG9zzro28aHWEwC0+TKOLzX
	md8Cp7oc4sZQzMF7Vs5/iGRBHdr3WVctSfXdu756DSRZqcYSm8ygMr86/1S9+SRELaM1/nQSOsd
	jBNaLfm7hMRlFevGd2PocPbAxc+6Up/MbP2i64pQcvRnIPi168AwKZ0VFoyknMVcx/t3RGC5M6C
	EHmcv3VurrsbEqndB8oRJOZquDmW2Q2VKDCG6nnKQ3xnXp3MONLeTT/NL8IEptK5DN6NvdPmMLV
	2LUt4jlOezbbCiAbC
X-Received: by 2002:a05:620a:6081:b0:93a:1fa7:1afb with SMTP id af79cd13be357-93ebd24d180mr2046717385a.42.1791901439806;
        Tue, 13 Oct 2026 07:23:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6081:b0:93a:1fa7:1afb with SMTP id af79cd13be357-93ebd24d180mr2046711485a.42.1791901438883;
        Tue, 13 Oct 2026 07:23:58 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.4.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab48a7sm5417001f8f.24.2026.10.13.07.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:23:57 -0700 (PDT)
Message-ID: <5cf4bf60-00c1-4aa3-b264-aafba8af19bf@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
 <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfX6uWOpJnwnIbZ
 OGEaxuaJWEEokPBogR1xEAKOO/rk0R3QPldIyqW7MproX3Fcwk/9nnXwT9kZBLmanCW/OX+U6I6
 2YeAiPc+TSez229xuJDL8pa8Q/AplUkTHdl+ca0UfOAhmhtLcJqKHNRNWfi+gRIqgwObN+clWyw
 LepDBB0zHERHtFBNHfS3vBXMpmxCcSHAumdxTVeEdr9BZuj9PnN2Awyz/nld7jdZ/m96pv+Yhkg
 G5l8jToZYDFfQsOLJzBYJHE9JJJy06sIzlp2D9sR2JbhBjx0rpk+Jhx3C8dkMz/6fCASf4TnoR8
 zpwC9U/12bedNCTbyJK+SZoXZnnmFxFnmB3GOzR/FITptHoX1tkqn3/ZLDYn67IwuJkM8THjN+K
 BshNYjXE4verkzZKyYcLJV3CCCS4zD2f50VQ3apySpccowUalD13ay8VMLa5mJD+gZt/te0qAjc
 2icjoRHdN9eMdPvtt4A==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace3f00 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Pwpi88Ktxb2v7RWwfB9ReQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=4bmiNBAiDDOXaXc57RkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TpEemTznKTxoGRYp0-CCgYAHpaVtsELW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfX+WS/Rxx9zJEV
 GifYaMbSCjZDQFCbeB5qPoEybBteIxdCW3RG+WddhKCeh2aT5ejAGUUuBiYtl50C4QRHk/zTVv0
 pmlvb5EgzZhIffDvD10McwmnhVbLcNs=
X-Proofpoint-GUID: TpEemTznKTxoGRYp0-CCgYAHpaVtsELW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_072403_922030_F56690DC 
X-CRM114-Status: GOOD (  13.36  )
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

On 10/13/26 16:01, Krzysztof Kozlowski wrote:
> On 13/10/2026 15:33, Daniel Lezcano wrote:
>> Hi Tudor,
>>
>> I noticed I picked up your series without notifying you
>>
>> However, I did not pay attention but picked also the dts files.
>>
>> Shall I drop them ? (AFAICS there is one comment) and let you handle
>> them separately ?
> 
> Were they reviewed? I think no, so that's another reason not to take
> DTS. Anyway, it must not go via driver subsystem, so please drop.
Yep, I agree, I'll drop them and keep the driver specific changes

Thanks

