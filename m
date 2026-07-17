Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED65BC44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6katBA3YYMgPj3qSfM8s5QF3Giyse2MBZ1kakUqCeyY=; b=yQ/wLb/SR5yiH9lkTcqIwD42gq
	/xk3KBixwr+2dCeAtKuuC39XhRliFoOyQGeHYfv2IgapF/cY9VWHrQgDUS3kpgW6BufPMKWc3KQa9
	tTcKX0XAGbQFvoaPI2UtMrbWSrf1OSQ8fzvKuPuP9mjlLShfeubBRG2Q41r06g+e+GG2pmvcG7Dgx
	NBKiATKA9sHOR4VGfWrZMWSyG6Rp7QVVxPOAmJqj5uGHWkFL9yqar3OPO6gkj9wxiufNfwNpqR74G
	k6Xr3d42gIC4zDryuQMlrwSVQKjyDQPpmYwtyJEejxvumEk1I8Ut/5URMK/aInqe4IERPHH25BV7S
	HOMKr6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfTJ-00000001v3E-3oIv;
	Fri, 17 Jul 2026 10:07:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfTH-00000001v2q-0fJx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:07:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6chxI1093033
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 10:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6katBA3YYMgPj3qSfM8s5QF3Giyse2MBZ1kakUqCeyY=; b=Q1953pEPD+/NGkVz
	ZccmSzyzr3NZxcAqr0OQHwGLh/pGmI4J/FZNOG4xpD2KI/TX/mD2UNjm4+T7S5Al
	L36Weu7MzZdrr8LOgN7Uv+Q/+LY5FPTfP+VY0HtwHBnPZlgyE1vZvuVvd7v6BMXK
	z2qLw7DL7Zd9zwZs7qYME601IWtkti2A2+RNuN2A2oOqjyljuvKsRgjQd2tWJh1k
	SVrrqPp1CotqPLOCRmeHRc6/LN13sIEFBncHOV1z+oxGTgwrVKicR+qMVL3IlGAS
	le5EVRjsTY6kSFbd2ycgBTtrDLXkxvZPtT3URSOyqc3GjmDk4PV67aDaNg+2ncEX
	jxzNhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0us3y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 10:07:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4ecd1ae4so130929985a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 03:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282825; x=1784887625; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6katBA3YYMgPj3qSfM8s5QF3Giyse2MBZ1kakUqCeyY=;
        b=j1Pi3lcfNgtojuiEdmtksOaOHaYF70Vkjp9cXKbQ971Fr1PR9kzF7xSlgEnMgzYmlR
         hj4GklxhMiHpapJoIxgd1sDcF4bXEqps6UKH7b6v1/WsZ1n+FJBTpSYoLuzbrvMqo9sj
         JMkvtBeLxMwYCHHeVxtDEPWgtDU/Btm63yLoy+E+frdbPTcLf5myzesbppTJWt20to/0
         lWNny0Ca4+m5RCw6HmJwchUUNJK5yWMb7hS7bBfGDcDIcfQCyGZge2G1aErqqVM1zluG
         eEX1LXcDckjkzDqOZKb2h1Ig5VhgzTj6pgQoDdW5q/tQsA/EEYnMjrOnqDKRhLcAuNXG
         MDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282825; x=1784887625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6katBA3YYMgPj3qSfM8s5QF3Giyse2MBZ1kakUqCeyY=;
        b=j1Ytk/1kCG6c2HIK6yZkcmRmsS6Gg8fUK8ahjEBnLC7kbBmhuE/iYM2GUqAbxn677d
         w2KHNbBnhZOtYKY4xSVGO+zfRi07oFnrWeX4AJy2fxuwya45AMvyw2/HJeS8Nr5KFpDr
         Le96+eo1Zl2pr5nczhT5dQA/tOdstPCfeL1xnBybzTOlL0kS0TH9rajlOMoFkOufN+XW
         DODcXnUNQMoQ0JbEV3zhOWMO7j1cG3uvqhb9lz8cEt6D0X5MsrXBnPnOb/pcBovn0/Wp
         ksmpwjj1oxPD58H6nN79ra8rwWrAryrcE7qrtnS41jX7DlfDp2r67OidGm4JFrD4Ml/v
         55SQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2I7x0IjSRTw9jBdqvSiPtbgJLaLCUlfm57SeEfWgsoZMr2bnm76n8e3BhOeWAodTOBorpu9Xol0lTjsurnibc@lists.infradead.org
X-Gm-Message-State: AOJu0YxMULLUY/CynJyr+TWb8DBvZ+Uc2goeQiahkgb79W/fT3L5MEwR
	CY5VO9FVF5WWYpR1pedv4FEN9F4XZi9h6O/nCTWdpBagrmnN1aEvO8b49rIrSoNPWo29STvckpt
	2s2YP3J6hSYXGMR29pmFPcof/dftfCjXrLVVkkNN5o1+5fN2qHacgh/w1Eak1SeJkRsLhaxZC3G
	4eSg==
X-Gm-Gg: AfdE7ck0zjGbURVy0Kz7bY+cl2gdORIhxznEnPOT2abZI9SprJ2/OO7jyB/Wwb+gLLX
	RBb+OBmPG22EPr/xT1xepgNHnwqKeXec8oD1j4cv+Ea3b6JtARwuuR+N8hV8cOrjwc1EJDxWniW
	EiZZdaoyaciE1fZ7VfXYQvqPlUPj3rl0FQTf3RbRdB7E+eOy2VvNBIMQus3V1XBvkqAebHIpGnd
	Cjro2VbVFtfv7QckPQaDFxO+zfiZZmi8DHFiIT6RSW1k/GNwtY3ykvlKbb04j7Rg15NyrvYFlWh
	LIMgWR2o79VUAjj+FZEK7lyEW4IfZ+jIE4kQeH+1iyTMhUoq3bRHlD+DV9GszsLeX0I3Dq4U6Yy
	I6cyehqjpa2p8damlUhc5bEG9
X-Received: by 2002:a05:620a:ab08:b0:92b:7420:bd58 with SMTP id af79cd13be357-930b3cdf523mr129232285a.0.1784282825261;
        Fri, 17 Jul 2026 03:07:05 -0700 (PDT)
X-Received: by 2002:a05:620a:ab08:b0:92b:7420:bd58 with SMTP id af79cd13be357-930b3cdf523mr129227785a.0.1784282824741;
        Fri, 17 Jul 2026 03:07:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a09a4fsm51391466b.18.2026.07.17.03.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 03:07:03 -0700 (PDT)
Message-ID: <6d12cbb6-23de-4e41-b449-9d9b6cbab342@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 12:06:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <2d9d6724-a3ea-42ad-8cb3-ef08fd0882be@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2d9d6724-a3ea-42ad-8cb3-ef08fd0882be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59fec9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=J1ZTZr7FdFypxrWY4IMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwMCBTYWx0ZWRfXz91MrqMpuDMu
 CosZfCXvPzTS6Z1VaQEnTUVKOYqFkFiuQVfIcKGtA5vGKrdyakXl41OcicrK0c7KCX1OWTeHmV3
 C2hcg6C/EPAqH5KWw3z3wizPu0t2gbMoJglo8nx2uy87yqGmDBHkFgAQt4f0PDJjk1h7bO6jl2g
 S5B6D0b4nJSh6R6J0OR6P0Lpf1ZFqyBBcvcrAvO4hYBQCFFCL4RWzQ8HadrlfPsE09vVqiv/mvk
 D+q0O0aiaxeiYRwi0WsojSz2LlF0jkkPjbGY0KmOuDaNZVyQpE2IWVUgn9k9g060u5zMZXEU2zS
 3KHNhFjZFTXkjSTK+OntVoP9wbQFEFK/Izx5M0y/GCHG0GI8tZVhOr30wFdSsGYrXiT10IlABaP
 bfNRUBUF0o/AmaxyOUjUUvJ2wXLiHp62NiBE4o4Ctf7ljbU1F6J9tsWN5RB/CZHjT7hTYWAkAHU
 HUtr8TEtU0zdHgtKvcA==
X-Proofpoint-ORIG-GUID: uEYWXs_SUv1ZwPT3CDh9zuDIFmrq88bK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwMCBTYWx0ZWRfX/4zDFdw5hi3F
 NNXdDx8Be7cpbHP9amiW4zoNrQJ5F2IaY5W075Jg8t6nrkTepRPyl1CanyOTdSawGPEtbiE4LQn
 V/4msbRFqsEKzlnEU1pCbfxPneTOjgc=
X-Proofpoint-GUID: uEYWXs_SUv1ZwPT3CDh9zuDIFmrq88bK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_030707_323135_E6C2BC66 
X-CRM114-Status: GOOD (  13.28  )
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

On 7/13/26 9:50 PM, Akhil P Oommen wrote:
> On 7/7/2026 3:53 AM, Dmitry Baryshkov wrote:
>> On Sun, Jul 05, 2026 at 01:44:23PM +0530, Akhil P Oommen wrote:
>>> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>>>
>>> Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
>>> shader firmware path.
>>>
>>> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>>> index 1374afd9d14e..b280d8e845b1 100644
>>> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>>> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>>> @@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
>>>  	};
>>>  };
>>>  
>>> +&gpu {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&gpu_zap_shader {
>>> +	firmware-name = "qcom/eliza/gen70e00_zap.mbn";
>>
>> Should it be gen71700_zap.mbn?
> 
> Downstream uses gen70e00_zap.mbn as this fw is shared between Eliza and
> another GPU. But, for upstream we can rename it. In linux-firmware, I
> will keep gen71700_zap.mbn as a symlink to gen70e00_zap.mbn.

Let's use the name you proposed. I mistook it for the GMU fw, which is
named differently.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad



