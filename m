Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A608E6816B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=griD2yBGtJvsSfHR4B8iPotT2LwMerFC4LIovExWQg8=; b=rYobr5pe9uY9PKgFbcTl3e0koa
	OhL84il3YA0YrJ0KxGu9s6pytLNySYJ2QXLGoStvrCuk/pdN+nfDquOh1YXYmmo4tYYoBxzEYejPG
	E64P8DabNwAp1vcIcuOR5401c0Pz8k74zML5ZGcOyDRkBZg87VShAAmjnL32tMVVPNaqWPbxORUke
	RTigNimMOaURI2IjFt+Xw5TOcUAoh+dv9ceLoAqp8OrDnrcHarZqZ6Jpb8LVSvd2Vi8l5xCGTDVpu
	5wn0jIV92mXVkjmjpTqso22wB3YU5UFU4eACucTyuij+F+VvlAg9Uz8GEKTYFmGwBzethE2j8HSlE
	ReGYXaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJW8-000000088uS-0IFq;
	Tue, 17 Feb 2026 11:45:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJW1-000000088u7-2Ah2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:45:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H6sZ1X3393929
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=griD2yBGtJvsSfHR4B8iPotT
	2LwMerFC4LIovExWQg8=; b=WVpN1soU0qloXSL/kQV/ybLZN1WjCWY9uf82QTRQ
	Piu1ExW5v5uTNaaKSUZRR27nbiP3peO/Tg5DG2zYDvM4/rov0HyyBxpQmZEENqHI
	MyFBIRGGDBxXdmHkn+J92IvlI33mDJrf0aoy6A8b+WHpauhw8m5Xw9QP/PHstMJN
	ugPQtRm2cO/6aE6pwf/qxlZCGncKTDpSu3pMBYWpnV1Rcccok53F6VHFrL+GONG0
	pJkr/K2mepttNVuftZ3attk2jrFiBDn4Y7tXxcpJlgqe+6wHIy03xIMbzrDRLwbU
	6sYCZwdv79vYjqPVkapWEiyCZz+/MgP5pz4sdtdkRgJ+yg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5khabns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:45:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so351682785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 03:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771328715; x=1771933515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=griD2yBGtJvsSfHR4B8iPotT2LwMerFC4LIovExWQg8=;
        b=NvlVTc3OGnDuQIaDmb6kKJMoEEPooinAZ9DwTwxgibrLbkYlPLzf6wpSJpxPrbr/ij
         FgKIpWJ6n3ujwpsndoMddAK6++CSJFY4gnea4LjiE/Cy+85vPXkFtf2vJ1xwWuzCviA6
         Z9FJq1ZwIRdSG+TyDfHeAIXbdC4/Q3h0/Dub6ILVga7VPJfp5OqOUg3a/C5+WEA1b7ih
         RA8cDHNyckXySkDqfg1Sww4sfbCkzjvEpqoSHtrB/bs8Wp87EdhTt/zWsLXeB9UC7Hjf
         b7fN/UDftBvczFDLwsFbtsT0UAMhH9luSsU4g0b0AoKA7d7vyXJTfLXVz1W8o/OogJnE
         QbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771328715; x=1771933515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=griD2yBGtJvsSfHR4B8iPotT2LwMerFC4LIovExWQg8=;
        b=xJkbTFQoE1LBG31WQodYlBmLUhpxChn1zaJ7AfqwPLxhyWchJBP6OSseDWWPEIyReW
         xc/aec+94Igu1rzK9DbbTtF+bbdc3/7G7ZRKAU/6Yd+7nMUz6ncdFiTtETMYXyF4Kqhq
         gHuNz8EyrwYv4x5zxeahfJ+WOLgIe+/6x7qKuE7vC4GXbQpe29ZP5CZCyZPrcxXNezQ7
         A8z/xjI7mmhDFIoxVQzhIa6b8X972/HN58oufKneQRxALxxwTKhSk9dXWppisfXyFgIo
         PNLe8sD94rMHwXLYFOqoaDH7/J9ukyvbtHdJboHHfOd1kTuM6wHkyPd5LD6/m/Ufl0xB
         FY8A==
X-Forwarded-Encrypted: i=1; AJvYcCVAWccJrhpO96o2YN8015tjFrrjvg0MlUyB+RMKO8ybPN18RZG3JUfwMP3wUKySrlH0ootFKXJ8svXeIsNLCKc2@lists.infradead.org
X-Gm-Message-State: AOJu0Yycv03Ak5f8vFXeZ9s+SbfY3LOHzhJKiQgj6ILcVTtqUdDy72Mf
	c27zQ9IgLLR6rrkX723Snuo1j9bs58mDqL0R4uLBbG/wXlNHIINUWdzml97fc6Tgn9QOJDw8sHF
	/B+knFCOqpcaOz45u6xL5Ph1eP+sx/sQ90eFINq53WtoPEnTuN2kZonxL6MtW4rv3Q8G+R5NWDS
	CJwA==
X-Gm-Gg: AZuq6aJdHxl30hJSerwGwNl+w6IwQhfN5cZ5VdzYYTOFLWzrsBzG720bv51NGpWfbzr
	MoJFV5FE4/lNjvq7CUQtHpjZoOqHknlUz37jR/btOhVG+RlEL9ZXOwVH8uCnU9dV0E8uIMhEMsI
	8lnSNX6QrdSig6UnxGAY+RveeD1lAYPt9qAloQNLs7hnWWdPmyZcOO7nVb85u9nangF86p1g+tr
	jsZSx0UkMcZM5sbhnlG/LUXSYhpxXLGpZynbPvVO/m/aNdBbai3GVpOCapxK9LsQK4h6oK5POxl
	C0FzngK1J6vUqqo/FxbJSPA2JcvhEf3F+6lQAGIBqJo697k2EJM63H6lzi7qtmO8eukvOLZqpgK
	NdpWWSm8z3nZRFSkrxtw3HWjd1nyVBKENTmoF
X-Received: by 2002:ae9:f817:0:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cb4fa5ec22mr806118385a.77.1771328715428;
        Tue, 17 Feb 2026 03:45:15 -0800 (PST)
X-Received: by 2002:ae9:f817:0:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cb4fa5ec22mr806113185a.77.1771328714818;
        Tue, 17 Feb 2026 03:45:14 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abcda5sm38030337f8f.19.2026.02.17.03.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:45:14 -0800 (PST)
Date: Tue, 17 Feb 2026 13:45:12 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
Message-ID: <l3w6auudk2o63cc6m2vp4663lhhnraajbp3hngiykvzzfeayrt@bwo2l2newxtc>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <20260204-enable-ctcu-and-etr-v3-2-0bb95c590ae1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-2-0bb95c590ae1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=699454cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: qyx4vIqCsekApNMD7gU0n2UlCX0VZz6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NyBTYWx0ZWRfX2fLuQQnmm+H0
 J1GKbuyzR+QKhoacEYx4F0/qPEnh4xFWl0GE1noLqKOBXJrgxO7mPul1Uqfo0legxNDx3hqxZkD
 sNf4VtGvtN+/G5CI48fHjzGnNoUvg2u6MaGMeGjyND4KSooPrDP4/i5q4eKjMHh00L5vQJ85pRx
 Rq9eaUJ+otGmKlz1mFjk6JFv8aEx3RnFa5fM9WO4H1c5UwVKOOv5whNUANSAHp9c54ZDcE2i+O9
 zGODGxPrbUtw2IVYgM8PfFxq08x5afNAcysViaSWDprOONpCtf8OACVfm7NS/RgIQ/+7zMuUqbB
 rU/1s28qXWmX27Drj74YUbw/zYy1LzcrDBkDOEocv5yERTXw3QXN67nfiTbpjpOr8XDGmSjOxFU
 EkeYLY27IO6x/EBIQpFKTg3t+TsnKUKm/flWGY6FRCFGUWqGELMmtLKR9CDgAYTu/KSOTnEn3jG
 5wbDsj3Xll1NsfsvlxQ==
X-Proofpoint-ORIG-GUID: qyx4vIqCsekApNMD7gU0n2UlCX0VZz6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_034517_585169_97040973 
X-CRM114-Status: GOOD (  11.79  )
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

On 26-02-04 10:22:02, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device.
> 
> The CTCU serves as the control unit for the ETR device, managing its
> behavior to determine how trace data is collected.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

