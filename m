Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC109D65C49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=; b=bu50+vU5ciW9PQDcFrTRRyqX9B
	BFtvBooWIHyBoyBnC5eEAlNfYwXSHx3PbfEhr5tr5Qqg/a2t7Nr3OiPYA+2Y6+zQ0dlcn7C5iyuKP
	WBjW1Ayt8xM8rbom7PyUAKSfjjFdtGOMMlb1r2izBNWqIRpadD9qOoiMu79Fktn9S1NoYXjULgxfq
	jSwBM1PvvTqDwqzRFcn3FFQ9Pv6++7XLIDxyP6ekRnTPv2ayN9+qXDAvcaVoWD2n2KWPtv0YAESXN
	LQaooO/06cUIu2XBe5Cf5QSs1cA2Rjwf/wfMJ63h13hP4ylGSJfNaYziPHAA9IgtT4v4exoEpUq6/
	0ODO5dxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrxC-00000006t1d-2SjT;
	Wed, 17 Dec 2025 13:52:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrx9-00000006t1I-3nVd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 13:52:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL4Ta331028
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 13:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=; b=IilCwr4hKN14NE4I
	1siREeR44j54HJR1QBX/8we3n4wgCQr6ZmKT8NMxp6BHsqt9RbpktPpTJWfGLqKy
	t7OWuDEpvSdMe5lXZihFb3rXDZEJEBvtsYxDnAE/eidS/xvHd8Qc6xV5QlLGy1+k
	Giv6yLboDdA79j7/bNSnbhwMUmenZcWDqtd9LWT/1331gfscwuJ/UdtfagI8Sf9J
	iR6+JnCmhynarrOeV9/ndcjoU4xmRdj2IQWilw6j4FteT0JsnWEg4dUT/IGO5wD+
	0+sv8rX3t0uM+wpkbbsjJRZSypUMwCFDJcz3zRhlqcnVLtTPM3bYmCv1KPO1FhbX
	9YACYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e0mwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 13:52:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b5ff26d6a9so83599085a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 05:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765979550; x=1766584350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=;
        b=HEFjwVzIsqM0PaSSNSTHlQ98yCIPEPi30webCxqenULk3VtnUIwB5QqtfEMg0YMNha
         jEh54q3Gn7dLfyY3I7/mNOVaQtb/d89Kwwf5kbA+i7bOckFMt0F1sbZ5kfeu3chABup1
         dhx8omG4pQrIslL/ccrLyYh4PG2OAHPoiH7WR0TqAtFwD97FTOQlNvjuSdvkGZqu2DtX
         pqr4l++p87buTBfFoIokSGx2qK3QojV9XjpxqcujsEgBuEHysRwEuSF2KLujzX6ONTPO
         45o9jlv9Xt7vF7HDGPXITPGL4mN5oIpTOTyPhMORUdeJQ3wfzWf0/vzhrXiv782pZ6/C
         xA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979550; x=1766584350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=;
        b=OyJ/LRmaIY/qdr0F47mgMppKYukTHIezWiU4NYxsaVlVnvC0TT0Xc+fvQNWas/qPhw
         cF0AfMldi6eq0fjmPzj5bGCYxAg7gzuzXMcVR+DfiBbtgrCZ38NKWiEiWZ6NREAjKW0t
         tUhf7tbI1XzDxndb9gTCowqFxlbgDw1pwHTr8pENNq7ELFPL3T05OMwJuYhywmONp+PU
         +kMmZrH44zsxaDOHrIcru5wfYBRYqV7IY9+EuPBQTx3mmlqtL1FZzLS7jXCHhf8FO2vz
         yVVLgIVr0Kw84kPFvxdxZtMxKN+nikzVL+/+z5l+5EVe2MbDYxlGvC2eRkXup5+Sq6BV
         H4WA==
X-Forwarded-Encrypted: i=1; AJvYcCWYNcmQu/aemWHLAhuB52z4kLWTSE1w9y0NnoIm6KRO/TR9sU3d8PwmOmVAKDkdUAHBmvCoxnri2q+Q19kMeTbP@lists.infradead.org
X-Gm-Message-State: AOJu0YyW0encB4LQEB9XEou9rzZlmF5mBISSnMgT7rmi9tQizESuZLbk
	wVWmfZsjDsKrHfXaE48Wbbk77bwIqTd8Ht6/lRosNRZmUMI3gE/MxDSO1rNzAhXPiCvXRXo2mnf
	4MDEFFUTJtUa2jw6DVnZHiDuMTCzsLoO4vjVgvYRIgR2SJan+ft5EMlz2g8SqYStuucpIwhLp1b
	xxbw==
X-Gm-Gg: AY/fxX7AKZNIZL2RjhL9ekWFwkB/XMLHC9ZyKGANmXmgcajU4xyj4IV5inKeayYNYRi
	gFuqxP7lZ0sbedKBbklJd1EpiKZK1gQt41ewHsUdIeGJn+t2t5u5bWdVwzL2w4PsOEveGkGyEJ5
	acsf/QjnF4n82xey/2x3ztZ8zF0s+a/RqF9gfaegJ6bJjNEb4L6h3fDeJvnoDrqDLxxD/GXpaok
	0oQOFfRce1uIM8BbZLnhTHzIL2qj653BXyvvIASqKwRbizzIpNJ8VBOsUfknXjhWUhpI/rv7oTY
	jS90/1f69qobYTKeZgd7ET1XvgVLHPZTPdSlPR8DcnHRuttrZ95iEqgE+qSs4l/q9rQpNtdG7KT
	slE0c3hfbg0dAj/6MNBqm1OXCVRkEe4vGYDilS8H70HEAbxEAFWRLMTnlb5SnKOppMg==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f1d04e6df9mr194857981cf.3.1765979549951;
        Wed, 17 Dec 2025 05:52:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHn8FBGFvWlziwKU5p3n+hs/jstKbKvea0UICNhQkpwL2yQQ7Zau1SiOTq9MXzcJTbdWmhfw==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f1d04e6df9mr194857621cf.3.1765979549545;
        Wed, 17 Dec 2025 05:52:29 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7fc04f6015sm1054089766b.50.2025.12.17.05.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:52:28 -0800 (PST)
Message-ID: <5dc3d3e0-a338-4f2f-8987-5705fc1fde51@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
 <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
 <faau2h5z53frwfply57oh75zr5gcz4gf3za4vflbyht3ok4zgz@2ylcwcqcl4rt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <faau2h5z53frwfply57oh75zr5gcz4gf3za4vflbyht3ok4zgz@2ylcwcqcl4rt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwOCBTYWx0ZWRfX+Pk46+e6DxaC
 mjmN2oGw9UE94RPlLI28aZvPhmbXtZKoD6mU0aYbEqMpscx1B41YhIdC3ez2XQDLFXegcuPJ/iW
 GVdp75vlP+/izwKeY8HFPAIxrFERyk/gLsavnBcmzeal+G6q/xQyZWuOT/rcJdfim+ox9W3+2+d
 t4d+LeQgM+E1+5Zcy+QqMbfieTZE48pxZS3bItHMEq+2lSM80fIEu11qClt8wMEca99++FyZ2jp
 Ughx/jHAx2pd4eVbtnM7lCn+hx42y7f0ai189BDNIfKI0xd7Nlymq02yh5JQlJ/UBPeVx3KIhDp
 V/BxAvJP7tz4VyOqpoPzuuRNDOJ3uydFG4Zlts+RvSsS0tZXcgfBl5QLXglMcVkmxc84/RXPpmM
 doTf7tH1HvSPh0blaVD/vxH+8OoYvg==
X-Proofpoint-GUID: _rgLJSw9RKRyc233xkXJ3YwmnEkb0Gq0
X-Proofpoint-ORIG-GUID: _rgLJSw9RKRyc233xkXJ3YwmnEkb0Gq0
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=6942b59f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CW_yPJa_05T0x9ChYMQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_055231_957884_931435C9 
X-CRM114-Status: GOOD (  13.90  )
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

On 12/10/25 9:21 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 01, 2025 at 02:35:44PM +0100, Konrad Dybcio wrote:
>> On 11/25/25 11:56 AM, Mani Chandana Ballary Kuntumalla wrote:
>>> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
>>> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
>>> on the Qualcomm Lemans platform.
>>>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +			mdss1_dp1: displayport-controller@2215c000 {
>>> +				compatible = "qcom,sa8775p-dp";
>>> +
>>> +				reg = <0x0 0x2215c000 0x0 0x104>,
>>> +				      <0x0 0x2215c200 0x0 0x0c0>,
>>> +				      <0x0 0x2215d000 0x0 0x770>,
>>> +				      <0x0 0x2215e000 0x0 0x09c>,
>>> +				      <0x0 0x2215f000 0x0 0x09c>,
>>> +				      <0x0 0x22160000 0x0 0x09c>,
>>> +				      <0x0 0x22161000 0x0 0x09c>,
>>> +				      <0x0 0x22162000 0x0 0x23c>,
>>> +				      <0x0 0x22163000 0x0 0x23c>;
>>
>> The last two regions still happen not to exist
> 
> According to the memory map I observe, they do exist.

Hm, you're right, I don't know why I couldn't find them in the past

Konrad

