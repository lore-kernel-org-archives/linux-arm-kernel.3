Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DB9E8306E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mi5bo05RB6v2dHGqgCtZm4yd7bhovE802npJty6f5bI=; b=hLQ70ubT6r/O/Q1Sl5iGJIUuuz
	Md2DseMYFqDTNgt8w0FGhOAc6V80rlf1vjzIysKtDD/FWhiFjq3/aJRB+1cOsWOnYCAdCnxrf5iQ+
	yyKFwuLZcVtVWJH965C08ksAoS/lX3bKFrfTGOMzuOdVMF15TaX1ksGMvxqrJj8VUM66zD7b+1ZNW
	i0AE01kMGADFUdG/aq1S007dPHJJOcDdwva9rgmnUgEsUab4jxBPK11t+cOUFokZj9ZSOXpA5UVQ2
	XsN8hmEenZ6otHEc30QikVfG932nfGkdcozXEAS6yQvCCUq/e1gc6pIRKMsnFRA2mWZic/6YlTkBs
	kfe7rUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD3E-00000006PZU-37UM;
	Tue, 03 Feb 2026 09:50:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD3B-00000006PZ9-3mwU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:50:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6135WB422101907
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mi5bo05RB6v2dHGqgCtZm4yd7bhovE802npJty6f5bI=; b=lLaoq70MAh0zrGXy
	D/YDaNsoKdv5e6NU4vHNHGiIXobkBmc5WguJHvmrkdoQnE4yTKBsnkcrhiUX6Qyn
	rgJqPyKd7BZa9N63gFtA6KL4P3bZ/dfQp4dIfviof06+rLlU9sTig80Xn/cMv3nW
	I2KQj9LUAMwOupJraR6w6AvvJxENjb19zNDPZg2dUrPu+1lliICd69oymvXldCAu
	TAtfS3uRqArZCg6oC1E4c2RBp0lrSoAeqfMs+5JPIPcHlgiBDsw4Oma/OggQAvNT
	ztBWjbqWz7Z5P7+2cmeQ3xA+i3nLDj0ihxAiPgvbDwBK/TE0NfR/gURfCdX4Mt6g
	xBdrOg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2t5ebym8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:50:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35464d7c539so2292258a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770112225; x=1770717025; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mi5bo05RB6v2dHGqgCtZm4yd7bhovE802npJty6f5bI=;
        b=OYd5vn3iEcEjmx9nl0Ege5q5x7v4tgoTvK58f/7NnFEo0Lp01OzIUbdnXy1nx7PmNI
         isKD3fsq52xgyju2DxEpx8RdxX6iPKqmnNfJY4HpL/zrrS+NL+dVYKkPDCXA4aQ8AUQi
         d65fzMv7+SFjghnIRSeqfSM2HC5zMankGcrFRkgmJyw1sLh0gx6CftoqwoF8peo3Yb1f
         3t8uhpSCLuzC37w3XIstgBlR1/jheK+GAs+IecpOI4nlNUbGAzknlJNQBCTZeH+p2/sQ
         Xu3YhrZbm4T6YsnspbRC85eayL1t7muGK7mLcrz2eHfZo8MSAPhJ2oDR9f9LJYDVLdXa
         aUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112225; x=1770717025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mi5bo05RB6v2dHGqgCtZm4yd7bhovE802npJty6f5bI=;
        b=dV6NtT02t3HdEcVGRGj8acHNaRSD1IClzBI7wzHzyfjyUPvQ2wvfyYTx8Lx85O/xrg
         rBDOyXH61Ps1sqXaouVX9BiPDbUs7xp574wIK3xMYlV3g4p6LgyygezyKANqu4bPocJE
         Ts38gr2Jm+4tlOlDt/ck1viEu6QH3HFrd3nNPgO6wr17SLW7bygSPC4mFmZE0Nvt6R1p
         D5+IgoHiSRNfTu+vo1hsgasfV7LzF6EGLak5sU82sxzP8nMn12mWbFxDf9oPAUr7TDLa
         6XhIspQtMJtYmUOJASAMnO/opN2Tcbso8QD5Tf2KFVxcqfobBbixJZ0cOFr/GCaNC0T1
         rmEg==
X-Forwarded-Encrypted: i=1; AJvYcCUoaMe0OWO9YL44pBefIXk7k6cVr2+X4cOy0wKV1UoB02AoHiPDDHRyRL717XTjNTqHkFFbZz99JEN9PJvAr0Bg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9+A+kQjCIi4RYIsNOyVglqgC2yd9riDffIKfNwfl6XI0vAJx+
	Z87lroVFfypKoy5p0neSH0eYsaPubA2Tfn9YJ8q3+qbLrr7XyFhoqzb12CbJiRaXrKk10JQ/chZ
	SVOpU/OSuhdAkrgmT75GLLuNghxYWOympa+fVx7X9TgqcWOV7jyOzo8wrcshBX4F9oCe1VPKnq1
	1oNQ==
X-Gm-Gg: AZuq6aJ7PEsmZR5dzvy0JRrg3eh9NqjCeAOWjIPRFDxFRLdxAm34T64CafQWEZs9/n0
	6Rd/ugu6Idv/gZUeaGcMFcppkHIVPC3mge84UNkHFmK2aMhGpzLGXS88QDRODztzPX4pUwXzNzO
	E+WtS0+5div1kymRMy+AjlcMMOmEFi3X0+CMp5EWLuvL4PF1A8E0Fk1/aCP2NNEeVHAESdvxKk5
	QFTFlaonZixXjYNzyrZSEywtoJsYoN/nMDUpeFGJ7H8LmhGE86HdsQu/0+zNScN/wIEKeWDMXA8
	qw5258MIn7Q+HjE2bPmFrvPJTES102eesVETmIj1OhPPf8axynMflf7hscMjWprfd8fW55xBTtY
	iR+7rKrx3pWZAsnwPknmnA5IUovGLIK9/8sobzo165oTAbw3kn40qaK98/EE/ZHyxv40SFBEsGA
	==
X-Received: by 2002:a17:90b:2ec8:b0:340:b572:3b7d with SMTP id 98e67ed59e1d1-3543b39824bmr12784268a91.19.1770112224666;
        Tue, 03 Feb 2026 01:50:24 -0800 (PST)
X-Received: by 2002:a17:90b:2ec8:b0:340:b572:3b7d with SMTP id 98e67ed59e1d1-3543b39824bmr12784240a91.19.1770112224139;
        Tue, 03 Feb 2026 01:50:24 -0800 (PST)
Received: from [10.133.33.97] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547afcd119sm2013991a91.1.2026.02.03.01.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:50:23 -0800 (PST)
Message-ID: <c14ba722-5195-472b-a4d6-3b8f6421df7b@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 17:50:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
 <c739da90-de92-4d84-bb5a-e653a9fbdcef@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <c739da90-de92-4d84-bb5a-e653a9fbdcef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NyBTYWx0ZWRfX02GVI74vQwLQ
 RzP3VT3QHfdj3BIqPbHTB3D6NDsclK6I6KeOA6QeFcVGgncShEdt+I2gWQ2r2O8h+oQRuhRpM8N
 uiCbJ2drzYEl+tHGAJdFM9d5K4Gle/Oe+wt8akChJ3hlbHGQYRtzC3B8rRdtN0bWLtNhFBd9iyP
 UvIEGOU43pj2qK8C6FkcNxoX1CT85K/X/iLLvG8ii388BsxPksbk8j/VWdsvgNspGiuIKN2xyxF
 fB57wi6DugGpHSLO+zhXoCQEABIFCRyYRKOyT4iW2eg2q7HDM03D+TgnWqhSZ0K8DkUJo1z0bik
 1GeQihubq7TFL8g+ukXbnw3z6zSXfA69Pou/dUAN4SlWWmyL7uPkGPZejyXlMe6n+1LlvK+05ox
 9DHBze1+MZBH0tL1ITitUELkoWRJ6WoRDk3iImwCIm5QE8VtV+dE+vqkwRtYEhVwb62+Gr42ODw
 OnnfL4QdF9mKR8rx4Xg==
X-Proofpoint-GUID: H4zo7HQMeWXvcyIjbNK-e1J6owEb0tQU
X-Authority-Analysis: v=2.4 cv=NOfYOk6g c=1 sm=1 tr=0 ts=6981c4e1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6DexCDkPx0JeSCrEoRYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: H4zo7HQMeWXvcyIjbNK-e1J6owEb0tQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_015025_974729_C0253AB3 
X-CRM114-Status: GOOD (  18.97  )
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



On 2/3/2026 5:44 PM, Konrad Dybcio wrote:
> On 2/3/26 10:32 AM, Jie Gan wrote:
>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>> tracing data from source device.
>>
>> The CTCU serves as the control unit for the ETR device, managing its
>> behavior to determine how trace data is collected.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>>   1 file changed, 159 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index db65c392e618..88ec29446ba1 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -6771,6 +6771,35 @@ data-pins {
>>   			};
>>   		};
>>   
>> +		ctcu@10001000 {
>> +			compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";
> 
> Sorry for not pointing that out explicitly the previous time around,
> but 'hamoa' also falls under the "had numerical compatibles" category

I saw the dtsi is renamed to hamoa.dtsi but we still need to use 
qcom,x1e80100 for hamoa?

Thanks,
Jie

> (you'll see the only hits for "qcom,hamoa" are "qcom,hamoa-iot-evk"
> which is a board name)
> 
> Glymur and Kaanapali are, understandably, Glymur and Kaanapali
> respectively
> 
> Konrad


