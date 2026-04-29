Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08347FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXmdKJboQ4WcUugws6/caCpUtXI9i5RyoXh9+3aBPtI=; b=IFLW82OJDMRYKxKffasFTTI6UF
	z5tzrngZjLAW+GzwMIMAhjZ39wLU8pJeJ3Uo2sjGL/8UAs2HjgSsEvwlp5nDvDw+fJqwgGA3m47/8
	XSugyVNNJNBZhn27WVvNfhR9dNYDDjJ3/pddmBKeRISziXPHKi9JWUf/uXGUK5QZ80HdLhFc2yrBf
	XNLOSFmPNPO8Z/8geczyIWYSet4UYrgunciwsIlXEHDymE7ZUrGtG+MRPbYxH4ni2YReAGqJ0sOfK
	3EB+vfcbWQVB/+/JTm4pniB2Hnkh7juh3qhjBl/9ntV734LLZjmusEjPNiW4ZJihcQUygjsZCDg/U
	Fx2kg4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1DZ-00000003Ks4-2v7B;
	Wed, 29 Apr 2026 09:28:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1DY-00000003Krl-32XX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 09:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sXmdKJboQ4WcUugws6/caCpUtXI9i5RyoXh9+3aBPtI=; b=Ta8CPkj8APTJsz513LUHWCI1bz
	0SLJzkumjMXZmmNUiGo2lasnDz+gkZTW4aNOlM+e0GLWQzxYYRwn/InxjBspv8UbimE6FMpfLd11T
	WrRLhCXyfwNKNrbwjNmNegD23E/iaCNALq2ZMA99pgXZIDMN5+/hrlg6suJ67M3IgOZyF+r/1f61Y
	j6C1cMTbUT47v62kpbm+pKYGaZfxHcDQkVyHIbFCrGSJU7ngLfO6joJBfnk9N09Uz/uNi4ysGM/no
	e/bFpOmJMZGwif6r/jmTPxYv+ZheGwXRWKGNDqQ7xX065wicqIeDye8IXNgiiNDat4g5z6P2BTABh
	rlajb2uA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1DQ-00000004yHL-4Ac1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:28:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qVlK2889776
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXmdKJboQ4WcUugws6/caCpUtXI9i5RyoXh9+3aBPtI=; b=mVlNCbXHqL1LHjl8
	7MwMLHWJdDPSE2nFrwG1mhc9yVlMyz8UJKRJwO0TeQjH610bJi5zHFTogyhy5xU/
	Uu4BxVA2w8YwYHIYFUgk5FZ/vRbEvKHrdHWpuSBpxiaSEWMT8RS9eG7K+dfEARpJ
	o5hBynVGeRDlDeGyxllAjbA78+7IuAu8pA9YVeyYpsdgfbjMB2Rhw3jgDkpDCVZh
	Oi7xG55AEvsJKBsmzQ38uH0ficGf+ljmyVhvPFD9iC/XcYXq4oUgcQMR8bqOXWpI
	GLC+/x2ay4G+4y2BiVu6v+lH1qPag82EAY0Dhla4h1EPCWwNUEW68QzVSuB4LE1n
	Nx6ahA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqb7ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:28:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-61060ad8deeso750971137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454897; x=1778059697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXmdKJboQ4WcUugws6/caCpUtXI9i5RyoXh9+3aBPtI=;
        b=dQnlEMpoOodSwhZXYmyl8cdg4onO+jN5hZx0vSWBwoKKRFvlyF0rlMpryMuV0adaYR
         2OSYeshqID52aC/UuEIRf6B1TxZg+zO+E7wZ/pQAdYG8fuxZq7FWdMP2TbrzEtLhMACA
         f8l+QIMFzy8yWBUXT0KtfG3PXu/xB0dZuUQuScO6/018LhVqOrwJ9NDMbULTsPYQUvFS
         ompyoI/2OD43DzgGsitqJ5ogiroviuu7PguEGrACKoyjksmoSA5Y9R1cQkfsSAZex+L4
         t0TGHTOIiBxcBASA7DBneZoHsN08jagvrx47m1bCqACUTm+3QVPKiHmJ83Pj9JPqlGzd
         6Zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454897; x=1778059697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXmdKJboQ4WcUugws6/caCpUtXI9i5RyoXh9+3aBPtI=;
        b=b3qicge2aI68ze10atNvkK0mr3pMbvXNouJUzhqhffo9gysKVdxQMA3ixVWnMfuN3p
         lIxB4d0pj1P3aQqY+f0p7sInCP4oLdMUR5XIjxFexHVlQBT0lgBDlrnLwJ9pYWv4z81n
         BqTVzylyFjjAPAJGlO8Zc8pQ7pK45W8BwDI+k8bNrULxr7C2rsmTEUhcNtHXTx2F9KPe
         h9LGXrEbfxd0/A218xswhg2YY43F/3rNLhxnPVnqPwNNyIZtESS1JJ9tP3RGrODGD+DB
         FH+l4wF+ajWRCA/p61+iKlbBqfkJgxmJ5B5MhVw6vOZxu1GF+zmGnsH/VVV4JsA+ew7U
         ifIA==
X-Forwarded-Encrypted: i=1; AFNElJ+LPIaOLOJMz+qQBtdYKu40CmR158XWElZ6QEm3cngw4YlH9VWKfzMLw6gooGEK9uAI+PzfjmL45mu93r+IhlAn@lists.infradead.org
X-Gm-Message-State: AOJu0YwCZxXSKCOl94eXUFfIIyf+iAgshUy1qe7idscW+V7B5NrcWdsN
	aZw9CvePBdUMehRIh9zAGbhl7kyCXVAHJdCBHGxDdXe8Ab5lEEtmF/q362VJqtuR+T05t4lH/MX
	a8VkIPhqFf+poaPCAnvYCGnEtbJ4zGODU40i113++iHNbtSy8OUw89FLsRZneOE7adJHVRYGLZh
	An0w==
X-Gm-Gg: AeBDieu7jf115+FmZrl4JdQ85P2HN6KwHdjumMJ4RqSaKxSnaUcBZga996b6JuCIK1x
	tKhiUSPGdXV8iTJaOnVTYyFj6JWuM34oayXXXc8TyCHO30ZXQUC51bLmFjqIbP7Ya+7kxKJI95C
	+LVQwkBs6u0Al2N5p+lnqkstqr+EvQqICibjpqRmm9gjknK0awB3PHJk1wSr/XNkBK1fnuqgehX
	QUhVIyBfmnP2mV9JewOrz/jx3c77BMxvtRspySSowf2vxrfqGPrf6EDHabx1syBn1cPeXTfbJHx
	t9PL/ob124fMGPgEFcIhrXtIOWzfKi1qMjqpthiB+vKLbhd98arrI6m5iFh+x5iSY9xQ43qhTGl
	TK8Dtqwo77rm68QFUacefEOhd9Omxww0Rrye+6IEy+zTErP1u1o1Ot4lIMysla+uYx38+Ny8TCi
	KljzySZ+qFRiajyw==
X-Received: by 2002:a05:6102:240e:b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-627d2c7c122mr1110781137.1.1777454897336;
        Wed, 29 Apr 2026 02:28:17 -0700 (PDT)
X-Received: by 2002:a05:6102:240e:b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-627d2c7c122mr1110774137.1.1777454896850;
        Wed, 29 Apr 2026 02:28:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb981f3ab60sm64675966b.26.2026.04.29.02.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:28:16 -0700 (PDT)
Message-ID: <82602963-6caa-428a-9b39-e0cfd42ae87f@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:28:14 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-1-69ba540b3fe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qu3KiTcPeB1ZUCqAq4tjYa6Q-j_uIGYZ
X-Proofpoint-ORIG-GUID: qu3KiTcPeB1ZUCqAq4tjYa6Q-j_uIGYZ
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1cf32 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hhlnhGVR2evONxH1gqEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MyBTYWx0ZWRfX0OWYHS6yRjPX
 ZqIrNyUDaKyT2r7o1qkychxF/s+1dHNhMIVmAejaXX3s0LFd/65oaKPoKZw/CkvKvBMDbXrdvQ2
 6+0BCtUpx2lqkER9JdmZWM+evkpN8+ewN303xsXEVn9Q9EV++vVy+rFNsZRUJ8DHFl5tcKMBIaG
 nRICvIpuMcOoctvB7YtKqv5VoCXkSO0eDaWn4wPW50cP5Em58ccnt40KLkhdD6NkZia6mNKzKgJ
 avpVMBAEn6Y2xC1zxSpvF6P+lDS2rxQV9DStR+Ohtlwc3oOK0a04qFbu9t8CqXdvkohqWmf7eTI
 PDfw+CxY9o8/GCyzWj4Jj2f9u+pIcDXv+4nNzzAAGtTCHq3Y+6OILsPO2o5K2BluPIGBcda9MEd
 ncrJ40ITWjtsMK9ORxoxCSL0F5jEP6NPU3nxgG2ykCHwhAQ6TzsZOmQ+CGio0kaCeIHgblSixJx
 pJDfT+uOMKLA+nSqIAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_102822_563647_37D18BA8 
X-CRM114-Status: GOOD (  15.18  )
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

On 4/29/26 10:56 AM, Krzysztof Kozlowski wrote:
> Switch from a simple menu to menuconfig, so all Qualcomm SoC drivers
> will be under one selectable option, allowing to disable them all which
> should make kernel configuration easier when preparing a non-Qualcomm
> kernel.
> 
> This has few benefits (functional impact of this commit):
> 
> 1. Allow compile testing of QCOM_OCMEM, which previously required
>    ARCH_QCOM.
> 
> 2. Hide behind ARCH_QCOM or COMPILE_TEST drivers specific to Qualcomm
>    which should not be available to other kernel builds:
>    QCOM_PMIC_PDCHARGER_ULOG, QCOM_PMIC_GLINK, QCOM_SPM and QCOM_PBS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> +# Options selected by other drivers from different subsystems must be outside
> +# of the menuconfig if-block:
> +
> +config QCOM_INLINE_CRYPTO_ENGINE
> +	tristate
> +	select QCOM_SCM
> +
> +config QCOM_MDT_LOADER
> +	tristate
> +	select QCOM_SCM
> +
> +config QCOM_PDR_HELPERS
> +	tristate
> +	select QCOM_QMI_HELPERS
> +	select QCOM_PDR_MSG
> +	depends on NET
> +
> +config QCOM_QMI_HELPERS
> +	tristate
> +	depends on NET

also:

QCOM_KRYO_L2_ACCESSORS -> drivers/perf/Kconfig
QCOM_SPM -> drivers/cpuidle/Kconfig.arm

Konrad

