Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137C6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 22:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaWa4MGfpSWu+L1vhHqpxj3KPWIdAgUllBsZqFOfmBc=; b=xGZspAMxb05LdHUHa9hEBtDSmv
	1Tej7ep25aivugAm12WocumJghmRy0pza2Air6SI0DS/YgbCqXr46gf/8tOktmAykWdPXGzDgVt1Y
	K+rw7j1HUKBkd9VfITsgXU3Zm1ZcJzXHRiKtQYzI+biYYsLxkpN/nSCf8cT7k1wsZXpcCxuz/sTUp
	g9hI5HkM9uNF6cPJV+7eH2ghHWbQE82plU0LxEAN1hyYSku6n5MNsX2qx0pTME2Dp0Q9ZomAvKW55
	PV++qawWkyYUeQ+tocK5gDx8Vv1Ovo4oiWgC1iZBLMHUlhc4lvccq5il+2aCn5jt3dl3mP3QtCeVY
	mAc2xLhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgriu-0000000Dhys-13Nn;
	Mon, 06 Jul 2026 22:23:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgriq-0000000DhyS-3Q51
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 22:23:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE4fU1626316
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 22:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WaWa4MGfpSWu+L1vhHqpxj3K
	PWIdAgUllBsZqFOfmBc=; b=cgSK9ZaruPNrvWg45rTPSYJSJ8Dc3RHumZCRnjOK
	NWnu9BNkdVFvmhjtJE0lr2KMhV3K3FS2H3UWrrlOes/jZbpTWoVSK+7CQE+ZkEyB
	X9FuO7DgCt79QhhUiDI63AEYK6YH0y3ZIBhByuw8a1S/16ieeFh9DvJ5FmAnBbdX
	8NaX9xNzjALX25XL+rQWFDXRcOTnvPnOW+8h3NymVxY6mDYsgBxJ+8MpdOn1/mzZ
	yP7+iktuSg45691PNUAl7KPBHod6Ija6bHExpwZHYu5AcHFH/vMQBv1NQlXiWO+f
	bNKRCpazyauYqKT5BRdYbUg53iatMT0J1ArsC62QEY1oHw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9bmau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 22:23:27 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9693c6fe1e6so3358820241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783376607; x=1783981407; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WaWa4MGfpSWu+L1vhHqpxj3KPWIdAgUllBsZqFOfmBc=;
        b=Nfu84nmu3MUXhFQAoLiGH8gCCKg1pkwOAcvz5+ek6Tts01TB0sJmrFXFFhgQIBbEVl
         GINe4K7MVYRzfP/w9v+5N23bSd2FSBTE6Hi4r1inqT47uyFgEWLUSVDBSFUFkTenCYaW
         tO3BiIYJgRy2t67/mwNvxMkg//t9HAPsz/aChURDCgdtvxhinQiElNGjW5C0GJycCsXe
         tzHHnqk76Fj4Xxtv/qrNFzDxnAO7SeJVlsNLSWFG3GYEKwbM63NHgrxS5IHHe1kPCJnK
         9fpq1xzc5D9xtx3N1f5W1TKzxPEIXMDvECguXIrERwKyEBZYcoygOL6YHn/leYQPIG+R
         rCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783376607; x=1783981407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaWa4MGfpSWu+L1vhHqpxj3KPWIdAgUllBsZqFOfmBc=;
        b=shd10b6oSZwpfpms863ZgkXLwZgzUxq9tYiauYHn+fw3qgiSJxFRGlDBoa53rTVewu
         iExKQUPhDSDZygyzIELcp73hj31mjzAfFU8qD0bWUvf+Rc4fvib4CDw3Z6BQAySP82H9
         jJwU0lApLtKsfxffiFtNqjcSLQ3nZgLOSZB7GA/QyeG1P9wqlHBh5ePjnIvSRkyKauzm
         7j8issJZIe6uxyc1MDehyW2J2CC9Kojb1McDzvjQ6qHaUKJ+szAvrlcpjV6m9I/tZhRO
         ItqVepHKKFrZB/gMCVQWVHtwXn7vhSU/F+lIgw/21MjD14dry+eBGHc9TyPunxDoz90L
         SILA==
X-Forwarded-Encrypted: i=1; AHgh+RqXx2zm/nqXwCOkvQEaCd/D9b9mFBYos1BcqW6V4FOqMd2cRNl2gUSalDzpoZ1hJQhOJ3MTt9tU4FS2ObUftozW@lists.infradead.org
X-Gm-Message-State: AOJu0YzxVzKZjIhAPcMFdI+8sh6kAc/EspUgmFUHYsGqm5kqFghChXGl
	LEYT5Tn8jli1eEPtSeZSRVaJ6lBZYy5Xw7TCCGogxA49RWKEptfRWmLP5fHHex0WlFg4OaJUb3n
	UNJ47POtBZGoDohmcpIZOu7EEkR0p2/BPCMqTzSnhGpo6VMldoHAQTwmFMJbm7dlEX0Ip+GYpqT
	3kpw==
X-Gm-Gg: AfdE7cmaCUVZtXJnl7MEtZe+9NDJleP7L7wJq6ILKjeil0NxkmiyXSHETDNYvj7RyIg
	sPPSMP6JksNIuSCTs7kTGowg6lmscLBDM5Ol4WVbobvWz4OllXY4qUS3R+h1TgkolDsHzmOPuRg
	q8NKWz9GWRLGgsg6upYAIDcjOB0YtvCf5heaSGU1uXF4Jl5YxpKK860kLFz0bwxWyAKSQgDWqr8
	LdHkpzIK4ZEp+cEAID7SkD/otEPtIiEGD3dzXa5UHSfETFYIte9Yob1L007mdks9nvfgHNYrONl
	iG2ka0VUZk1rNmKt/slFdp4bSVFjfslPJWmrL6fdsv8YcKKkRC4ClpVOxnmbYFScHfKwc+Xc68q
	K6decWPcUV0LQWMnbK1XO9dcyb3FuBDznh1qap+dS3WUH3cVVuUc9YpZHokXwBnng7H/Ub/unzg
	1fIy5cvAPHuN50+0AcAErjrdYc
X-Received: by 2002:a05:6102:5091:b0:736:e4c0:cddf with SMTP id ada2fe7eead31-744b7b30a40mr1244160137.6.1783376606607;
        Mon, 06 Jul 2026 15:23:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:736:e4c0:cddf with SMTP id ada2fe7eead31-744b7b30a40mr1244139137.6.1783376605954;
        Mon, 06 Jul 2026 15:23:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839bbsm3177862e87.35.2026.07.06.15.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:23:24 -0700 (PDT)
Date: Tue, 7 Jul 2026 01:23:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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
Subject: Re: [PATCH 8/8] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
Message-ID: <clfy5lvz7vm3ogw7pvyyidiujqcjxftx55p67szwgc6ivsq6r6@xrrcbfdkqkjo>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZQFdGjhlXL5thjQ1DcTupCYvN4PBcUki
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIyNiBTYWx0ZWRfX9EOtXxxxfz1I
 0B9xPuH5lDMm185nQk7UPqHaWOYFd/dUL2YKmbpVYJtOEEhmXpxqJoUs7bSyhNgU0TMeLKmXn6i
 wekg2uM+zFkCrHiYlKi92E7jhbuL0pk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIyNiBTYWx0ZWRfXx5ZgGpxt/uHn
 7X/RdILqV4WjDfAOyDfRchaTCZ3YqvJwj5WMvLz/a1LJe5sxGLCl9ZgMWne/QaAWStYc+a35pt+
 MCkIVXHG3ihGSwRgvVRwHWUm61kFWwH45yk2kR2IL9DxT/23Gx8HNfkKsG3ZeSL/xqmBNmNGHIG
 tUi1Rxuw5wJXRDHMk9OlEx9j5IuENhF4H6FPTFVZXEMZctAg6eD8/l8vfxZlPHh9rzr9CD6BFht
 xet9mCWKiagL15VrAjP2bNkN4EAD9eiNqCDKnJ1IQsXWSgmzsBX+pYM1YnNq2hUjLRg/MjbbHih
 dv9LPoKeHGrBS/QaG69h2ovDfFVyuVD9AO5OJp7v+lyJLgNPmyPuUi21k5siYkeh+cNzh0vEAdT
 hkr396etDiGjnUXYfsaKLt0ylYDrm1AjxP1BkKmYUSiINtx/NrrufiT9YSx7BEki794ksxFg8O+
 0qHbiwvs7GKhmpQQ49g==
X-Proofpoint-GUID: ZQFdGjhlXL5thjQ1DcTupCYvN4PBcUki
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c2adf cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_152328_977368_F2A15D5A 
X-CRM114-Status: GOOD (  19.11  )
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

On Sun, Jul 05, 2026 at 01:44:23PM +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
> shader firmware path.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> index 1374afd9d14e..b280d8e845b1 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> @@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/eliza/gen70e00_zap.mbn";

Should it be gen71700_zap.mbn?

> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

