Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B29D6ACFB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=; b=QOulV+KA+hEjZNeec80q++iWgh
	RLm6ntEZ7E6lAB/lcG50wKjCjgjCoWrgUC/bQmtSvjByvXvwJp3yOgLjzhnqRep/ixpr9hzQwwdFQ
	mpoBkO5yOGEmvawKotmvdkb2+Cz4y9JY5t1Cz+FCjt5hqNhZKix6nwvYD/RkLABPasyB63m2ElmyU
	jL+drYoDQ1ntUQrNIhp7bCRwuDfxzT5k41x1SKv5NTwtnxz3uyucKjQK6bfmIRU5qh29d08nvt2RJ
	M8lEkZiR5MVA4Qb+iM4DYuu6Q3tSEhlLLDUldqMvsKSGklGY6Cmieaqh6UiSBU/Q/TlvJ8R1J8qeu
	7B96ZhMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDFX-00000008QeV-15PP;
	Thu, 18 Dec 2025 12:36:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDFU-00000008Qe8-2201
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 12:36:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9DcGC813844
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 12:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=; b=i5WubbSa44riyiyl
	9Cr7zftRPg0APa58lJPGyB3kZhakWN8hPhnLrAfeAtESdi12ku0Im9fs5tSHGAcw
	mlypYhdThrD++/Rwkd78eUMroJrwudGs4C3oxvHmJ3urkhwpRDWiVu5Nh98c48/6
	hf9IX2GAGhBClL1nbnmLzTvfjNJE6EvKtHC93nkSwtYikMFH9iILehx+tntQhGRa
	pJHCZ/yxV9Tv0ithUDFwqoPbLGWOz0jM2ChKFP/Pc4noli3JpzrjRmeefdM+hqQn
	EizDmsCzK4RpeRnTxS6JfCmWSXHJ2JLLNRDcyOu6xUCebviJUSpRH+BJYraqR+tU
	6ycJNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v7b1ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 12:36:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so1509041cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 04:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766061410; x=1766666210; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=;
        b=jqLinuVqatcfygY6BOdvPyKh2G1YwFdNXL0EJ+QMxI17kk9klqBFaZafPmZhloy22E
         lyeteR7yArObUBTrKuOGFz8PZRnGVUnjuCwXm1V85SyV28oUiY0+aLB5aRNCIHNGOZBN
         R7lzmLn1Ma1S3nT98yTBpBIwOVnxQgYlJMMDss5Is7oyc10MoWz0NTlWfWRibEEuLFUR
         J33m/OJRtpT6JOc3e8pu+5r55cU8rYLTQgZBeYc96UofQwur5akc4gPaU3/9803Y3N58
         1cuHoRC9Kc3K3OgHQNf88uCmpBQ4i0wu6KRt8nntYm4kffEjFJUiCNsy33+T+F7zca1k
         7IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061410; x=1766666210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=;
        b=dYqopvoJ4m+pTK0+TTmkHk30FYkKnBHWO1XspCp3uhbs7XtTDUnoPIQ+RAY5712YyX
         +rWOtk/g50Aw11gbIeayuKWrQX+Q4EtOzkIm5cXmv4BtVVhgTJXIR82e7BvL+QjQjQYZ
         Q5jybIShFGjApF2Eur9gX9BTqsIzjbj0rZNp0GfqcSmlqAmKonLKDzxoSx31N3ZUiisV
         zNX6/1deZ4RvwgHrI1yHcdup6s1r82GcZIlAAEFq17Ach6MEe0EdHaeMpKCasNt/nsuR
         MOlTSCI4hdiO29RNHvZC4hVNNXmOPbah9ed8iIY0YG035lH3iY5eKyOekRq8BmI2Xgh7
         4npw==
X-Forwarded-Encrypted: i=1; AJvYcCUKrEiqD9WihSWLIsK/kLHNhMf3Kwuf2qfJgn7ZMTARuyDW+/sV41C2ExkfYknGdFcebOQLX38VcNtvAyugnowK@lists.infradead.org
X-Gm-Message-State: AOJu0YzgSH/5Sw3KIDtVtGT43dhi/Ytw6vv7RW3j6MOmm/7g0s8GdPQy
	wNyTf9MTQfxMccByBoKCuUJnCKczAhLwh9hqyEDy7q6AOKhM1lq1W7wmIMefcjXG0YWKFbd4lQl
	MYGzSWRT1mYGeDX8S/Gf0tjMD4vCUnO2uSvKpgei6X9cJvbcJrjoPucN4xK5YqzYbG0aeslJ2nm
	dWjA==
X-Gm-Gg: AY/fxX57qKwzNaKDRZUA98TshAO6VJVA6tcAoYADg6tjWX8j6iEaSwQMtXMvPCnYR11
	VIYeSxhMlsnf9GY1Fv5TX4SpAdpHSzQhN+cuH306Djy3boEhGTWIjQiFdcgowJaEccxs32Zs30u
	ZDDwq9DiSP4ND55Athv/B/4C0r42f3z7PWimYa4cm3KMRS4GW5XbbG5ca6lzzNgTSmLLne1E4tA
	qsBgWEGJ9IbkU1kgwL6kLUcZXP5Uw+HahdtV9QQWS4Od0PmVT/A9hLrB3qdT9cwwP9HYTRAa+BF
	oNwzszg7KQC9YkmZm4Y1Hsf5mDloQp6fWfyslbXo+sTkYneykyjvGlIq0BjYRZ6oDn2gIZ4jkaE
	JHd1akdup9v5gG1EYoR3WwKNEPr1Q6dIykQszGkJ36kaVpD5C+u5UUHZOfI5JjAeinA==
X-Received: by 2002:a05:622a:178f:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f36108c9a5mr17885031cf.5.1766061410511;
        Thu, 18 Dec 2025 04:36:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQu2nnxqGUnQynFrRXz+BuL+HJmQqJQwR9k3URYcUz1hnRgEtf2TKddA/5Dpw/OBBUzx5W4w==
X-Received: by 2002:a05:622a:178f:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f36108c9a5mr17884531cf.5.1766061409643;
        Thu, 18 Dec 2025 04:36:49 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8022f9530fsm223265666b.12.2025.12.18.04.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:36:48 -0800 (PST)
Message-ID: <69ac0e2b-82d5-43d2-816d-d3ac31963077@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: camcc: Add camera clock controller driver
 for SM8750 SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wIqZ7G6iNHpK9Gyi5F8HXqfnIAjmHoRl
X-Proofpoint-GUID: wIqZ7G6iNHpK9Gyi5F8HXqfnIAjmHoRl
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=6943f563 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_j3VNrtD_Kzz85i8SO4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwNCBTYWx0ZWRfXz2D8bTf5YkfB
 Xn5c2Lz0ioHc7uSYKZv6Nz/Z1GAF+wS/1O1qPOisAjQDoDAAny2i07/lX8wlitrS9F4K+zPLygf
 RAn+mYZ8IB/5y3m2b+ujr6l85fkT5kyA3v9N8hWanwc2ii2HUjTEmFl6TeJte3Ok94kVUuqQC90
 jQqMt65fFC/v9QbhpelfnzV+M4r6fYyqvgJHKAQlMtVs0ILuxOrwdJk+/KwRTLTglLfyTiwaY1Z
 YV4LxQSF4cresg1k2RocMhmy96QZj1FysspMb9E2jpJ1Y/NpleNfuA63P/1tOMHrO9bjulbWoJf
 8QEC3F2NXvlRda6fmS1cEBhJjA455eH0ezpYkgBlJyUolxo/vVVB2DHsYGfWIgXUTRIS/kO0fne
 GVyc7lm56f92SfhN7ghkVwAb9mnRLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_043652_647705_F5F02DFE 
X-CRM114-Status: GOOD (  11.76  )
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

On 12/2/25 11:26 AM, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the SM8750
> platform.
> 
> The CAMCC block on SM8750 includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

