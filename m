Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4735C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzwaTdZYc5k39HsbyB8BJpnbkvc/a1QYt9rl+x/9154=; b=LEng/2tDjy1tw0bzuaTEOnJIxi
	/XDngFmr0+Ri8KokQk44B1/2hNFKiBunS0taSFnTIO9aX4iR3o850SKL3I8PSy5XpuA8eU1WbCyZx
	w55Xp5KNdb6desy/Biql0BhxI23TLlvbs1XvXk4ZdeLsYkuATo7fSyPvo5bnED8AupV7QOgHykYYa
	e8tBT9k4a8yaWsvhfWA+jOB/YUoeC+B7iuEuhXR6GL//BcqapjcgBZBJzbklgNhJ/6V2XBfODAVtH
	T+l82qPCVVy0yhHQYMKI5pplrvoMl6U2tyNVRTqrRje+GhFIDP9ZA0shNod5TVJ9stJze+YTr4bpS
	yEJAiztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgesq-0000000BrFU-1jPY;
	Mon, 06 Jul 2026 08:40:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgesn-0000000BrEs-3eOf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:40:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668dFs8048577
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 08:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzwaTdZYc5k39HsbyB8BJpnbkvc/a1QYt9rl+x/9154=; b=Bq1jokotQ2I1ybSW
	pG8Vbjp5cmexg06ZgOo7HnUcdoz++VQPK9jPrlOoDYzoLaJSiP00gdk3RZV0dGdl
	HcnOpMe8UkqIBbOu3ID5mXiOSHkWrGbn/o4RaCjxI7TUE3YgSMVyeOJwObJIZWFS
	L6e5Dw8FpN9uUp9oYfh03/1X7e1Pt8FYvReYZBaqUJaha7/g0J1nEXVeTp/lerEH
	7XARdYrlxEjVDcYf3Fy6sF1V4rU6mnKUJk05/6VmOOVk7oPy1wh80CgeekGFEm9o
	MGKW5oA9Usfw+0K616ZdPkKF8aVVNyBILDw3nWtqR7P0oqKYiMrsCQD7d8G0vY2b
	yeRsBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur078-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:40:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9106031cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327249; x=1783932049; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzwaTdZYc5k39HsbyB8BJpnbkvc/a1QYt9rl+x/9154=;
        b=WxN+uZAh2X4+Rw4gO0N40l22bBEYPCQ+YjU6jU/LxOrZ4WnSOtZkedITaAVtqBEi0M
         j55A91mW+HVBYTqzCMoi01PyN2mWaSBsoy2CTUJMeNXEafxPjIgb9E/S+DzJ1KF6B2Mg
         pN2gOJzszCwhzC2FwLn97hy86YnX5vEA2y8ccdRmZY9axc1576O+J+RnI3EOThO9m43h
         yN6YROURssLV6T2UOq/aSLHssv+Qg3/DDJd5uyEIsv6CT7CFUru5vIkzjqzjPlXw0OTU
         Tjps5U/MLhxaW1Lmsa7/80gAUrv1MxfWqB5S/9AhkvdedfOUuP+Yqxx/Wj4MQfOkcScm
         qslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327249; x=1783932049;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzwaTdZYc5k39HsbyB8BJpnbkvc/a1QYt9rl+x/9154=;
        b=tIC6OCzl/cU+VnrB/8M2Tv4GWYkbJVAJfRr/IQzOQgHuA8FCx9HhSMjBJbumYLdUGY
         RTY/1WBqPplfnECIR6MR9w5/B6o2RjZJmYK5XRXnQ+9LZouZ8AL98CaYN/YgbokKKy3h
         ctq8KuqZ4ZpH/6t/TkVGRdtE7KAZxffTDvWJvJP+6kMT6w22C81IgrPYdHDMiuWuLeq2
         oVsFO3A1THrQRrfnjRWgK1GW/WzgORmre3XexeVQNKPBlU4VfiLVkz46SemuTRxefb9L
         3JouHMUZSAA/ZVBxYOQTkbTWgExFJJkDRqbyfL1l1CGyDuCphtK6vRPwurVk12gjjPb+
         2uyA==
X-Forwarded-Encrypted: i=1; AHgh+RpazduA+JAiFqDnHhEs6VPEszeDUz99jPZfqwJj2v90+9n4Vszg+fs/18Yu8AVXWTJ/tTw+9suldp0TV1gUC55q@lists.infradead.org
X-Gm-Message-State: AOJu0YxmQVhly0aoBSzqUjgIsieUJEPDsAWq8YqiyAdwbcFhPJB8RsXN
	6VNLQBTuvwpPLjYxLf62xeGcWRCwf2Y2Y+kq+B7LQP5Ixx1trCI5eOCkTY/2MqspFolajn1bUKd
	Eq2abfKn6M/qiBxfMMMUcRwEzqfZAVr2qPT5e+a6u9zqaPwLV0pfS5HYP9+k4Ivy+6ZM3STFRgB
	fcMw==
X-Gm-Gg: AfdE7cmuVrolIZLow7gkZzkxcb5EMgZ6k2YS4cgOp3ttwY/mEtPkjfDI0KJ0edaXu2h
	Ux88ijzevk7uGR2g7H+yruUPE/2C2+3gmzxbP1q8KkDSI15YJtTp7rI0gkyNJiczDjUqT4XpvLd
	UrFiq8ClDDCkerc9z32Kbg7ciWeq7V3iyxT+Vg9ZhWRJPj9D+YD4/gMUQ/3VDdj+b3OmvPYEkl+
	p4D/Nqy/bMrHjzyhKxOKn75b6Kcxq5Hv710ejX42Sb2xpGzDTIFtoIXBHYPX5DAGneX51YH33uq
	WGRKHh+6g31qSXf0W1VWC2wmgIolsFQSFJguWo/nCR/r0Yf+wbkH3Kbeq+COIHa0acCscbLCR+b
	kTOB6fgcPa/hxdmWUH5JI6yyZ48sRA0IRwjY=
X-Received: by 2002:ac8:5910:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c4bf4718fmr84324761cf.11.1783327249244;
        Mon, 06 Jul 2026 01:40:49 -0700 (PDT)
X-Received: by 2002:ac8:5910:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c4bf4718fmr84324361cf.11.1783327248523;
        Mon, 06 Jul 2026 01:40:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4b52sm690724266b.47.2026.07.06.01.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:40:47 -0700 (PDT)
Message-ID: <0ae3a788-2061-4bee-835f-d08ecb2a1d39@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/13] arm64: dts: qcom: sm8650: move smmu sid 1 to
 new lpac device
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-4-01d50c3e0c99@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-4-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MZ4v78bds8A0Z1qiE0xe9Wvx_Npvl6J1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX81BCHDHhTV1a
 DUesjcwHMdJGtfO5wWuphuEYIWNgjQVzlGgaE22PwspXWLpP/CAyLip2vnBL3BXo1ehrdGYcggD
 cLqP5J3/KZwBtedPMP7FbD4hUbm+eEo=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b6a12 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=cDqsbA2g2SHu6s1Cd_QA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfXxOt2q+uy48rJ
 fsHwhZdXyzHeOTaTmD6f9i9W0gmnGnCWVI84TY43PJzsoNmGc/ZRLzjYNXViGLJutHOLApinYnI
 6xkT6ubTXHrFXDZDpi+fc34L6jZ3ZFV6Tm7gOHGdOMS/M1bON44a9y2dSZiXc7mmdGeR8F+SPxb
 oEROXuVwF1U54DPeWzNa0pDA55MNceZzfaeX8TjXG363vXqFWOV+PgEOfwxkvlLp/3DvsMJqWeL
 W31l0MckkuBxu/xGyrFaGHh5OFJ5/Eqsdmps6Gewq9kpHDMlaguX81F/tsqxZneEfzfPdvIi+Ik
 /84q+k4dNlrT2hXlhF/jkfxYZhQEuhtmFBY0dPx9gwyLTIt+bYpMyMueCm6VMzM7DaDH+60Hr1n
 ZLKy2bsH1gpCNxNp0mqi1mSosrbsfIhOfI3+BNW6HbhqFMGkRjEgXnCm9avOUm1UuYMoZXjLHNj
 Zkhi5r2uHoOIugn+ABg==
X-Proofpoint-ORIG-GUID: MZ4v78bds8A0Z1qiE0xe9Wvx_Npvl6J1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014053_919307_C08AC6BB 
X-CRM114-Status: GOOD (  20.09  )
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

On 7/5/26 9:13 PM, Anna Maniscalco wrote:
> Previously both SID 0 and 1 where associated with the same domain.
> 
> When LPAC is not used this is needed so firmware can acces memory when
> initializing using the same page table as GFX.
> 
> To use LPAC however we need to move SID 1 to a different device.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 1604bc8cff37..44e5f9d4b335 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4133,6 +4133,13 @@ tcsr: clock-controller@1fc0000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		lpac: lpac@3d00000 {
> +			compatible = "qcom,lpac";
> +			reg = <0x0 0x03d00000 0x0 0x61000>;
> +
> +			iommus = <&adreno_smmu 1 0x0>;
> +		};

I think this could work better as a subnode of the GPU (or perhaps
if there's no "actual" separate address space, maybe just iommu-maps?

for something also making use of the latter, see patches 1-5 of:

https://lore.kernel.org/all/20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com/

Konrad

