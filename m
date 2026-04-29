Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C758FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOaQobyn6UPCXWT+acc6cZj62BqBzpWkmQ3adO+ANdc=; b=IVPRqFL1c24mzZIbA6eloDk1JT
	Wrvn2NKY6wF/gn66tQSm9PBJEMKgLIpHb7D86EckYYmQYOd+PsGMw1XqTC8xH+ajQvxK5mCitxaY3
	OEkzdVDgbd35uqlYNqCUTrMx6Md8cfFBm+mKcs7h36TLL1A9Px0VfHA1TfDztAr5bVikkYvWWP3yF
	Kpkdg+dr5+ZsJ854/tCI6u3K0Qu7J3RqZusTz5CrTpVMBg5+V2LCXRoeCeafI0dRpI2WSaNi36jEO
	XhOk0KEzbZuExSe35HNJg6KiiU+gRxm23kCOBfYEhX8d2mUR+imj5zEHwG4VCenPPXBKO9s6WmWQl
	v9rKlBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0sR-00000003IA6-0Dwz;
	Wed, 29 Apr 2026 09:06:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0sO-00000003I8t-2mzT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:06:37 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pqMr1641530
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOaQobyn6UPCXWT+acc6cZj62BqBzpWkmQ3adO+ANdc=; b=khqvgwsW986HC14e
	nurskZstQHRvZabSobQspE5Rb/Ltp+3q+AHMLF8HKVTV6P5bG9U4BoLeJ/FYDy9g
	GMsTU51XukTfmvAwqhK4v/Tt6B6PD5v8JBF8NPo5kXXhDyT9F5/EfIYfRk8d11f3
	rxlsUriEqVE2DSJWfkOBNmbMb+JRRQtXlPFGskR5JZhzZRenleuvGcs0jkSS8vBt
	FVii+vevWrTxNM74TCxkJTTt5NZCkGKrI30iNjpIyoKzS5if1Ew6yhGWb+VtLu28
	5wNvsr9507nhZfaZoo4vWkVbMEvpHbpLUZ+LpKAT0RHCeHUwPf7O/+/iU0lV6hmf
	5VqV8Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj80rb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:06:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56eec094291so846908e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453595; x=1778058395; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FOaQobyn6UPCXWT+acc6cZj62BqBzpWkmQ3adO+ANdc=;
        b=HCrFc9yFV/nT82D02yqV+QImNmFSlA5vgaYq5aVMYxb3Pzj/r4YvO8RqhhA/bHEJ3G
         rREalce3V9kOV0/oxDff/87BclsGBrfKn+3p3thchKiCNe/hTvOaByhDjgOcfi/PCITn
         4QhZkldANN9CE0O+rMYnX9HMoVxqhsigj1ZbW79xerVR04hMQtYrXx52rjqrsJsA2sUS
         xfkD669sRLr3ihUDFDdStoQzfnWDZLwuNx+vK+8BB36SaX7EYqhosZCKq9c4Bfy2hFML
         ndM3F7XwAJjoEGH0khd2cyCSEq86ImEj+B028So/tjUoYJaK8uQCyyJlbXrvSjOhLMCm
         jP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453595; x=1778058395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOaQobyn6UPCXWT+acc6cZj62BqBzpWkmQ3adO+ANdc=;
        b=ZR0Cx33YM/lkFtiWEJ0Wt39IhfmtqBb4udufMZ2s/Ucdwpf3fcuCTf3Sy4MQXCK4xV
         KSQnXG8e+v878V01Nscljkq7V5KlOWDnxTK2DitnHmU+XXqt7gvTnPrJu/p0sq4SiXAG
         bJ6eezU9AUDQpFHQYRrQcVsULXuR2L20ZuIwR0tJzUS8geComaTfj0uF4vPHLzODDT0o
         XDzzDzOROjJyvidRYEWEZP+2v2zlgXHEJSsX9KwkCHCJsAwyFfzJpmxKodKzA8ImQB/1
         snamXTFXuFcrGWEPHMBnrJAE1k0EDLNDgRSrWX16fXQufNglWlF21WvorHlqvox/PkdA
         KbsA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZTUR8w/A7Yz5Gnz3DrzDZ9VQZEfbZIAJgI279eTI6AhYd1BeIEQJN6hV/eZAtIDIKekyAyrVSvvFKzCYHaly7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz18L4OBrQZgLR8CpD5V6mcPAeYhqcE1q6OphBGZOzZGPB42iEb
	v8gUCGxCX9pBxsOQuH/0BrbyItcY8ghXBVDA/Jy5leIg7n7nff0xA1lLGHGuLrWReHEJVUiSQEl
	TQrpvayvCFB3nXtyM5lB1gnay/+JzqijLWr0SSSkKJvZaY+sAINGkjo3oQmJ/C17JOsD67hqN4N
	ZoSRKAeFv5pQ==
X-Gm-Gg: AeBDiesEWku5JUJFnZf/uKUi4NH+brAejHQ0HO+6+WeKh2ykdBc68L9nj0nApQ7zaYJ
	vBVH4KOgOR+22guWTdTtwJPFAntwle2AF5eKGhf3AoYnYlSBErQXGBo0uPGQp3uWjxXXhW7ccXH
	Qn426n5D+ZoMU+QB68Y1bnVMrlgyz0dkRkibY3+aoMyPMcdMJlStexvzSwJCmrOMGTJphO6ztG/
	5A24n40Ei+6LVODXH9I5uGWZc5BOUQMHuVJHe6sMl71Fn1ddr0eWb1za+/XzSFLQgW3Z+oCbBmn
	UGrhs/DfvVTtkKi/Zg/ByeioL4NK1MajkK7bh0mCK1HQzIw4EnEzzooBROEUj2Il8B8tsegXJmC
	Kamm9exagVkskQ0SnaTjVSwzVb7PTDMnDWHfm/pb+77GYz+jcCcXGQVV1O4PEuFH0HI+MHfnjbK
	/BuPu6bo3jIl0Xzg==
X-Received: by 2002:a05:6123:5d5:10b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-573abb57fc8mr1005731e0c.3.1777453594887;
        Wed, 29 Apr 2026 02:06:34 -0700 (PDT)
X-Received: by 2002:a05:6123:5d5:10b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-573abb57fc8mr1005726e0c.3.1777453594520;
        Wed, 29 Apr 2026 02:06:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb985e250basm62494966b.53.2026.04.29.02.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:06:33 -0700 (PDT)
Message-ID: <48c84ad0-7d6b-4e2e-8bd3-511ec679462e@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-3-69ba540b3fe9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-qcom-soc-kconfig-v1-3-69ba540b3fe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YJIu0xarrgQF0gifNz2pu6nBBDFSH-rM
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1ca1b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oiTh_mz6bHpUs43kViQA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: YJIu0xarrgQF0gifNz2pu6nBBDFSH-rM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MSBTYWx0ZWRfX0D7/btPADXNv
 CGWeNm7xVrY+rdRQTp8l+a36zM8JzKet6D9ZxDUmWP0n+CrBJZ3DJezDdRS6cI8JfNaTnuy76Ya
 7lKkuJfTcep9oA2THZLmrspn9FXS+dCjwdcbJ5/G8/xYqnAmafknoR1QzHx2spuERw3RcanwWqh
 xg5FDWYZxFOP5YF9YSErb3gap2DgMjqW/EeJTguR1Yz3+u1w9suMmvudYyIjhyfBUz0t9E6ssd/
 XprzkXWY1zBfmV3YZV3ZcemIpwLFccGtF63MPGpCCDkEbynZFxtWtB+4F5qUf70XkID+umkLa4f
 s9C3x9ScpP9JNTDt2/siNV/9qBt681kyat36JcK5mnxewYzef3PiCJ4OkCYFE1TZtLAF/4U5Unk
 sQRZKTunTXMyVNIkwSwQfEVRLqPbcPUqx2SXH3CwERIsBROMsZdTuOgoHlAEWjagoMgmEilaBR1
 fsdx8q7pBpMCOy7yKyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_020636_831044_443F4478 
X-CRM114-Status: GOOD (  19.18  )
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
> The drivers for Qualcomm SoC components are covering a basic or
> fundamental SoC blocks.  Usually they are required for booting or to
> achieve basic expected functionality when running Linux.  These drivers
> do not represent any sort of buses visible to the board
> designers/configurators, thus they should be always enabled, regardless
> how SoC is used in the final board.
> 
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch most of the Qualcomm SoC drivers to a default 'yes' or
> 'module' for ARCH_QCOM, to match existing defconfig usage.
> 
> This has no impact on arm64 defconfig, arm qcom_defconfig and arm
> multi_v7_defconfig.
> 
> The change will however enable by default all drivers for arm or arm64
> COMPILE_TEST builds, whenever ARCH_QCOM is selected, which feels
> logical: if one selects ARCH_QCOM then probably by default wants to
> build test it entirely.  Kernels with COMPILE_TEST are not supposed to
> be used for booting.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Please also add:

QCOM_RMTFS_MEM (required for modem)
QCOM_SPM (cpufreq-adjacent on some platforms)

Konrad

