Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00DCCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQibd2wtxQ5ewlVOIxOvKR5n8ge1nvsqrt3PVQvMLrs=; b=o2XTZZ9tdeqa7kuELH9idCzYAV
	BU9ryj7s45oktUAxituRuHklAkI8+29xwiBbxQ8vUlwCATJZIPNFoZEoLWtAm0FSLq93BWyZz8B4G
	f9AhOhefCVi+RD9rNjdU2b2/Uc7UsEpxMXkqdyJgy1gj9eN//rbBjRTBlZ76jCmewIyoh1/EEcICZ
	o0ToWxJ7EQrzp0C1ZLleCHNkBcTsaPsIhrOBuIqi6l2fgpq/iv+xEgpMmZ0HNXJE4EyvnHminZZD2
	AkOQ1twykst7wuH0j1Q8Al8G7EK0g4K0uYbaHnAv4PZvgwjHh50iTdeJ/vCfjEkpMY3BuRAdLLJRE
	4ANLOdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEuH-00000007B67-3jaM;
	Wed, 10 Jun 2026 09:07:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEuF-00000007B5S-1Zyi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:07:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hrKD531016
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQibd2wtxQ5ewlVOIxOvKR5n8ge1nvsqrt3PVQvMLrs=; b=FLtFBx4jFf9TAwkQ
	jxRyjDHEDXAvL5lqHoYobIGWqNN4AkH14u07971RY7RYxj9OLQytXFlQDWik+c8r
	mFWwLaQMr5Q85XTs8XtP4qHiomH+29mXqQQSkJKaBHErH5TZdwguaKW68JjwlDqT
	Iulr8tvVEE1S6zOq0ZkZWbM5AuT+h3lI5wQ05AYL2Eh6mA2RoivEU0NbAWT+py08
	QjvFq2h2YGW7TYhLY3G93zIeulE4jnP3i6uyTVxZF1m/aIvjlF0ndatQ5YQkJnJo
	VPyxICyA7VyIk2BUuwuKLMTNJTCR5136/iYnBIsww6uHo3o9DNWECmHSWD//9TAu
	9Dvyjg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1pmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:07:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176ff55dc2so10971911cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082446; x=1781687246; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQibd2wtxQ5ewlVOIxOvKR5n8ge1nvsqrt3PVQvMLrs=;
        b=JrgeWQbmrWXjGwE5XPQuo/hZHJlylsoffBlIEA/Dt3q6ZQvACIhIs2yxPPAHk+ZIpk
         YqLyXTvoFEZJlxpzDHOedDcy2vpig1Yi68uhTSUmwsm1VN3SVDbzziSlmrniMaZ2/1zF
         iaej064x0kva0ZR/woqhaXDzu2ApbMUVtWv/Bvld3GcgzeDsX5w6ewXVnt3jO/bruaTd
         0fsnuU+ktFhXzQtlxr09umoYbL/n30c2OmAkT31KKIkI1VipVWdeZTzxpJKhAPM2q8Dw
         41S3nOTxSgb5b38gYxjLLZdLzw9aEmdshvgzuFMw/dkAH1EZJPD4WD7gj+m1mRCxXLRR
         Vptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082446; x=1781687246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQibd2wtxQ5ewlVOIxOvKR5n8ge1nvsqrt3PVQvMLrs=;
        b=TIYYNu6p7U6AOlLqybFe+O1U4X/PVVH0LJpuGqLV73ZkdAgSz1hc8I52NmcDF5luJ6
         dah49EUYeE5jTx0nIhcdDMI2nABd9xYjam5J1F7/RcMeNDVC2StQIJTfQPX/0Wd6AzhV
         DJsv0WPBWOyCFBfuckNf08BuEZfVGqqx7Xbg0nnLwwU2HF7lYPeCfRNJ7pGrQ7kpv94u
         +t84/sw1vUp5M9P4tNRl/vUYlfqLV1ypj21TO/dzFE/zqGTOGWl9jsad3nvUK5lj+CXy
         dhn+q6Twb9/FCwS1fFSZFwDZAVxC0Xr1jhWMTmOR53ZybguP4Nmp2o4NIR7J2X4di2Uz
         crrg==
X-Forwarded-Encrypted: i=1; AFNElJ+5KLAQd5PCKpQsVXeoF500n/qaEmtH4ZwzPqrMKKjrPcT0E474lc2SRIYNSqBCysiuF7V7wQu5KVA4m5Q/eJIs@lists.infradead.org
X-Gm-Message-State: AOJu0YygMhIK+cj1A2PUlRYhN31JGeiDTPom2eDJECtGQPzExYTZKvmO
	EaXzvoUcGdZ182rohHgeYXTePp12Sr2b6DODTakbKLLgv1VU6Rxrrt/y5HxK1xR7nW6T2LV43Nt
	tzLQFzZYDnTfld+mY3+TYPXh6HXJgd5jB62Vog0dg4YdXimppn/N7K1e9BPlaDChdlKROOIsQnQ
	GXpZVSeC9ykA==
X-Gm-Gg: Acq92OHP0eqkL/bRH1/vA7s6UZIJuaMrUY03Wld4tD7EH3mTB/ctSmaTZyTX2LZlD30
	B+EOf94b8e3+CRBPUNJtsZ3eVnuZV7RX+5YsU8otagmar0Lr3b7QPSJuYlgwUPKXNyRnyd+UXZo
	GhhZh/RvDxp83DY08f8ROvioC5+ckJ0VjMy9gLERlpHKpQqNc3wXs7LNIWgO6Fp2h4L1EGCkxpS
	uX0EcEtlji0mV+WEaWZdNG1sHTysoKfH0qEQWrMazhPZMNiC8sUQ56xjiEO9Yuj+y5RygNog9zI
	iE81Qxy6gbFDUmzbGetyPos+qN8QgDF3CUb2IcUKblzOAn5lQghuSE9ZyNg+/YOyyCNyw6QVh0x
	DreamfzqVaH8P0wtFP0AGuCR+aVJ/h4IyeU3x/mQD/KC4LO6Jv3vTboWc
X-Received: by 2002:ac8:57c3:0:b0:517:5cbe:515d with SMTP id d75a77b69052e-51795c4a9b0mr211515051cf.5.1781082445805;
        Wed, 10 Jun 2026 02:07:25 -0700 (PDT)
X-Received: by 2002:ac8:57c3:0:b0:517:5cbe:515d with SMTP id d75a77b69052e-51795c4a9b0mr211514711cf.5.1781082445307;
        Wed, 10 Jun 2026 02:07:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0558f3885sm1149831566b.54.2026.06.10.02.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:07:24 -0700 (PDT)
Message-ID: <02b45c77-200c-4e1a-b84a-e18cd58d9530@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: qcom: Add defaults for desired arm64 drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-5-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-5-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX/a4J+FB1mURQ
 PhW/dmwuHv+ZXaAe/Tn0fa8/EXpcwqcYMTne+IhDzX/7p51/3CLgEZH4BntwOjifeCo0ppsp5Ew
 graF2KJX+fKdKSLdAZwssE06afTW1AD0PmM/mlk8RW21hbtDWW1Q8TlLhEqU9LE20L9yDO0ptzI
 SqGvfOAN8LYjwOiXcTqX7AKl3SU1fhXAZJKMMymaTzuvwDZwKLWHVOzFwhUFiGWfYAKVELOon+p
 LsS7EKvqsKtaFZvnPX2HgEVXvcXXZBu93sNOi/yZSvHzTwjoP6Xibct2xqfcvfJzxVmVAp2mZTY
 6TzYkI39VhtjL7npGLJWJZegzN1gcOXW9xx2vE/6LBJxxrqRm7cokZWwK7JIJJ7wBkQdvfP1xvh
 N4k1DoMQkmSgQVXhSUwA8tADaqNzuTRU8EvIuHNt58BKhDgx7R/Tuj9sSJBA21ygyUU5VXQesFw
 TAlR5fcEtUeM4VlnUPA==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a29294e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=G14gXSJJWdPwksqYDHwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: RpO1DNm_3QKI9HVIj-lmUxF2E9SZvr8I
X-Proofpoint-GUID: RpO1DNm_3QKI9HVIj-lmUxF2E9SZvr8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_020727_422783_7CF091CC 
X-CRM114-Status: GOOD (  15.90  )
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

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Enable drivers for upstreamed or being upstreamed SoCs, which are not
> yed enabled in defconfig: Glymur, Hawi, Nord, MSM8976, MSM8998 (GPU CC),
> SC7180, SC8180X, SC8280XP, SC7280, SDM660, QDU1000, SM4450, SM7150,
> SM8150, SM8450, SM6125, SM6375.  Note that main GCC clock controller
> drivers are usually already enabled for these.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Add defaults for: MSM_GCC_8976, MSM_GPUCC_8998, SDM_GCC_660,
>    SDM_MMCC_660, SDM_GPUCC_660, HAWI
> 
> 2. Drop the Konrad RB tag, considering above a significant change.
> ---

[...]

>  	tristate "SDM660 Global Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
>  	select QCOM_GDSC
> +	default m if ARCH_QCOM

Drop the 'm'

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

