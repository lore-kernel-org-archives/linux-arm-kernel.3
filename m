Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B473C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vHMuzOF/E7LJXY5/0s8/KcxzKly0C3RXJvgtavb1Eo=; b=zvY3kJMObXimqiXU1PJIHaQdaq
	3gA99+8ej3j3ZpaiRyRWdaMav+u7OUqupL0K/+Un2xapa2l4GPcHMfr8D3iJIyCU5M66aW+xVxEWF
	JWnAsEdbW5wKB6h3oFZ1CsXXEkxUzYElUSBEJ5nev4ZOwDae1lliDDWVgGKgHkWBp5nJZ/rKtX5ZF
	hZm2qk1eUp9obHxWQC5I13f3aA8Mj2o0ditieVNr1O3aeHUS3YoaQt+TGEeImzw8lGRMCoUZ4bfnX
	K7Tsp5wonEb+hfoUnrQ4MPzNLwVG6vEGFMZbi8GyXyPdn9t1MmNUYu6orz3QsATDCNLgmyYpZf3v+
	TceMUxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZaL-00000006eTp-0E9Q;
	Sat, 11 Jul 2026 15:25:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZaJ-00000006eTR-09jb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 15:25:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEO6cS4107651
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 15:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vHMuzOF/E7LJXY5/0s8/KcxzKly0C3RXJvgtavb1Eo=; b=lRmXonB4GBUKFvyI
	QADBqdivzcKi5e8q6cbs+f9PtLTlh3E2bPM+rybMxa0NFcjxHlAMu+QuDhJ/+sZV
	5IuiPfMH4OqreAm3dW1+JH9+0t93sHNgo0qXQ8ifkBzoGy31ibB3c5jjpTbkp5EQ
	gCxecWgqP7tNklYbVRugUqf00rTnvMbxeoh+18gelRYruWjE2Kin8ncqOe/+/T4C
	oMRqvvJd6HrfQtI0OV5giYj8McSlo+Y3oSRgEfkhGzOaKGGguIbZwo+sxa8Gv8nF
	G5u/HPg7alYS+M/g49VNbVFX5TojmfQ1mRUSdAG5PexdBl0gysLgtgwQcIIdCf+Y
	i1g/Cg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8v924v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 15:25:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0f45415cfso24619566d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 08:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783783541; x=1784388341; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vHMuzOF/E7LJXY5/0s8/KcxzKly0C3RXJvgtavb1Eo=;
        b=DbsKaKXD1oEEDQL7gSHJZS+hovXgwWBquyQHQbtK9rTfrpcIHdkpxHBsOmxVJkbevh
         SL3yTZFVHOFEhDZ0O7FT+RG7q1gCFYhOrJd0+G5tBmIgXpkBaBr/1UZ6mq+Ohviz/B0T
         WmeV6N/ZkxY1fobVm0y0IqGvzN79MtgTSX5jXmg32Vnx1qZulGtEBurhT9opNQZU12WR
         6l7/BdyHabMcAln/QdqPScz1f4tMqZGSordCYdBgM07cGynldhytQXVR61kEe5FismkO
         LTBVXMjoQY4VsEleNPj/ztWcEz1gapq9Yajkms2HTHh7ropEyuKvRwqgaKhGn1J7FwxY
         6/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783783541; x=1784388341;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vHMuzOF/E7LJXY5/0s8/KcxzKly0C3RXJvgtavb1Eo=;
        b=S20S66dBWX3PDOtYZhywFqBEEAupP9c9gUcq9DFkGYrqnaDVD5PxZnECgEEuWpC4yq
         6jIkOZOYooFKr29tcJIyWp7GQHGYNJBsFhTAC6PUW4Ju2qPKCBlCX2o86bctFc61hYLP
         OGJPn6R10Am+kqukhe91rzffswkHAAoaBU62rSdeqSuxR6bGfj+IiXRJlAPIy684qLxA
         KLBwdfzOyxD+0vWrK2m5YL8gQ6AQrQ5BK+UYx5IaSMPQH5VsGJIZlmr05FcecT/ABN/l
         fUw/Cpm3z+y7MDLaVM3mte9RYrqVsrGyb0pwuew9vxt0EFIssZcogroqjOWwV1/Ep2O7
         gQEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrJTcwa08YPv9V47hhd4rYJ3Gk7deeOP/TDMyoSmYeel4QcLA8rSXWwvU8uoVuVMOEML76fWXN7HwRmsiW6hzs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+NRMnoVZvl0Vqfm9289OIOpwKzi078ootiSEjVLSHjzSugDMz
	yXLKpp0zkbn58vjSyD3yiThm6/1dz/7qisax/kiA7IG4TiZIk11PZd5UWoowx1doydocE3RW1rm
	ET/PYiLXF6xGRWRGFzEx2WJNAstuuR5pXgpZ+SZsQrXLlHkxenQU7SsJ94bP+AhjM4UQZDUnsGT
	lPbQ==
X-Gm-Gg: AfdE7cnReZ6eORF3d8CkTC5At6e+cIJ5Vi7/f06MFjFoS1Ox9dFbr/UQg3qsTqiDewJ
	ZANg/H4aZZirgdwpzLI3FFNLufY6mGdzchRSDJEAO9bKlStGLHSZGf28/TIbzLwURSqWcU/YBxk
	+ylY3ZkgVjJIODCRc55IEwE+HSRWtd/a9G7WCsSMgwpVxVQi4y/gdY7PkQD0VAnM+vKtAmxj9hy
	FTfUM4X18pSH0eO7w9sRcamQx1j0eWt70oyJUIcvvXR/FCougi0tl+qm3m/3T2HcW9kJ6wdvTqG
	aiYHqQnuVEnDkIHNYCugZRptNdIHt1bDM9rvDM+oHZ5HYtc+u+DEQife+OSPTp341s3jWQmogLY
	S6qF3rQtVHsbp7ud0oB7IRDBtQMKbNz6lZyAd+w2r
X-Received: by 2002:a05:622a:104:b0:51b:9873:e379 with SMTP id d75a77b69052e-51cbf23072fmr30304021cf.36.1783783541143;
        Sat, 11 Jul 2026 08:25:41 -0700 (PDT)
X-Received: by 2002:a05:622a:104:b0:51b:9873:e379 with SMTP id d75a77b69052e-51cbf23072fmr30303791cf.36.1783783540689;
        Sat, 11 Jul 2026 08:25:40 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm200528975e9.9.2026.07.11.08.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 08:25:39 -0700 (PDT)
Message-ID: <8e8a5244-6df3-47d8-a8bf-f1a367e46b34@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 17:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] soc: qcom: Make important drivers default
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
 <20260711-qcom-soc-kconfig-v2-3-4a907e064281@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260711-qcom-soc-kconfig-v2-3-4a907e064281@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 23QauasBVJtj2gtPYimnvNZm4Qo5L4Za
X-Proofpoint-GUID: 23QauasBVJtj2gtPYimnvNZm4Qo5L4Za
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE1NCBTYWx0ZWRfX6TfbrOB1LYZF
 D52D01nEq7VIYL5VZY5965mKvdiMUq90rZEJ0iY4v7LSArJ08SrCT9nSx2mf9HxXuE14rtHe/kf
 2STURGyxR+8vL8U/L1pxoX45rpnvXTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE1NCBTYWx0ZWRfX9WmG0cmmWlJT
 ioeQ97NJutimre93Rjg21yezVkBYLUnkjP5ErtJQK7LyDR1tXNFuqZR9ch/Spd6xkiDa213GkKS
 9yZb+0Ex+ajc5667DxPzJalFQqiKxpsQwi+Z4NRH/i1e3JoROIXgsm+ZXPeeZlV5l/dER3cE591
 sAkrBK+wvPgsDGmjlwUY9ADApC5mWdsDGM7/qxnm8PRJalIn0omqSJHAlHdA2YRophzTQ9HwR6/
 PEUkrNIt0sqdHaE2CMZntraFKdmt9qu94vOOl8q0mHsVy+Kli2R4WaL/Clkq8hoaOWfhLenirOt
 7Qin4hqTPrdPwWvxbg/FFWmmEfCqqQ5hmqrq9ZeVLCxtnimRaTOFsVmY4S8wC8/sMAdgIIQL2nE
 kWYRSgJif4dpH68oKogxO9vK21974efWwhV5ZZU5nT+IabisbY531T4bZTo1vXrj+tyXRTvmI65
 ATMDgAaFtiMrORmF2bQ==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a526076 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=oiTh_mz6bHpUs43kViQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_082543_086248_072BC5FB 
X-CRM114-Status: GOOD (  14.66  )
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

On 11/07/2026 15:25, Krzysztof Kozlowski wrote:
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch most of the Qualcomm SoC drivers to a default 'yes' or
> 'module' for ARCH_QCOM, to match existing defconfig usage.
> 
> This has no impact on arm64 defconfig, arm qcom_defconfig and arm
> multi_v7_defconfig.

Oh, that's stale message...


> 
> multi:
> +#define CONFIG_QCOM_PDR_HELPERS_MODULE 1
> +#define CONFIG_QCOM_PBS_MODULE 1
> +#define CONFIG_QCOM_AOSS_QMP 1
> +#define CONFIG_QCOM_APR_MODULE 1
> +#define CONFIG_QCOM_LLCC_MODULE 1
> 
> qcom:
> +#define CONFIG_QCOM_PDR_HELPERS_MODULE 1
> +#define CONFIG_QCOM_PBS_MODULE 1
> +#define CONFIG_QCOM_AOSS_QMP 1
> +#define CONFIG_QCOM_APR_MODULE 1
> +#define CONFIG_QCOM_SPM 1
> +#define CONFIG_QCOM_LLCC_MODULE 1
> 

and that I forgot to reformat.

I see this was already applied, so let me know if I should fix it.


Best regards,
Krzysztof

