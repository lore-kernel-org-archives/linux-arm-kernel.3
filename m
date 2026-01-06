Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF99C47BE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBd9QdiSFGxR3MMnj97DwQLr97txyM7jpH53AKOrBRY=; b=wBzBo/YYV0/vNNJVr1PlP0iro+
	nS+Bc+O9ooJ/gwBdNcmeVn6USuEDJ198R+2a2DKyYokCkqQSgrm66teIK0JAFGLhZ/7uqh3f+QvAS
	EI22ywclLEBR6C0xD9MOhT2aUG9W8OekFHSHP9FOOfjlve+aTDW1XI+FTlpLSlsetqPvW2mdV7+D0
	EUwilaMhBquqvekPUD2HxqJNFMmEzhiU07wHHiCVFdcD72UMRx0JlJN62/nmdkFE+Gi1jUeZFYopq
	FWy/vo6UxJiSbf07yD3+x4MxXAMBKoYsEedgLDBAL6PpTgyES1jtl+FVwEn00dBMp4FYJxMQj0w2p
	wyoEem4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4vp-0000000CqVh-14Jr;
	Tue, 06 Jan 2026 11:08:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4vm-0000000CqVL-1gzY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:08:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AgW7X1462299
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 11:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBd9QdiSFGxR3MMnj97DwQLr97txyM7jpH53AKOrBRY=; b=JRimWAwsUjrxoRGl
	yxDlXn9g8beEL0y8UJfeXe7lG5WX+284xAYI4pntjoWC7h90RDQGyIc/pjU9HfVT
	UfVe8TEZp70mUyzFaH1PXDgUUSPXB/Eva26tPhzsFOXTTthYeNeQEXQeFDPQyYjq
	skcYtqgBvK7P3aTV5TJcgbq8SlB6w5BcZMW4KQp6FGE+LTeA0yIAZg2Z5waT9RQB
	ZHAcwMhpD8YbvIEcYHYoblMC/XDXHPCz2z1wwb7v2ZNGNF4b/Vfe7x8HxnTuHr62
	nnlNOWyw6yc3JDHTAsEyXfxKrCsMbswOSmCJfwRzhgiKQi/FdoSDrMucIEdwMrlB
	dcYL7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh0vm028p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 11:08:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1450189eso9598115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 03:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767697732; x=1768302532; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBd9QdiSFGxR3MMnj97DwQLr97txyM7jpH53AKOrBRY=;
        b=Ks8PSzXT9qaTp3ujWO2DcCB5WduXKXXGaTzYM6NIUpKfTzWmyY6ysnkRAMJ5Qxqx83
         RV7TJUIjTd5s5gGrDJ6FaANGfvrk9ef3iZg+3bVQ8LkUCrTgTRhwxu6xiVFCmHOk/zgo
         vIlcf4kcOiJFV5dHiXSpDwlLsC5kP9k4+UfjgQqXLcfCMWVjiDp7/cvg8Kx3+yZCaebz
         J58pEWiw1bpkhWUYx3j8dL2gdEqmuFDAUBiEld7noYn/yliletOiLFYnrflEdhs4H1zk
         hZ68IJoig4aNHL4TLJ5JwBkzPV6h0FNwRKmfD7ka9axrkxXJwz91+HzJc8uxmKuLnoPL
         QDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767697732; x=1768302532;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBd9QdiSFGxR3MMnj97DwQLr97txyM7jpH53AKOrBRY=;
        b=B43TBvWzA2hoDfR12GIsGu3l53Ohu+CJiX0ONvwyn8vm8TItDjAEeMOrefPlVMvhZu
         X49GGBE84zSKU4Irfyq+Rjw8qXXmwdngOPCLv/2SX5ERKPuuEVxnBRKe9zuAtbiRyuZ9
         LjZC9nW2KFgd3z2TRUgoYlR/kG1GIWkf5rKG02iTB2yeYoXWfDbIx3ZuULsq3/q2STt0
         imaI5ByhP4zjKCHAtx7m5gEWCSCfiQMuAkxTb4J95sKPOoatxGJXm4ghWrT4hc9XcR9v
         qyvUnxaBmBI5OnzdQmetw0UMh32AP2DXJFTpAtgaPs9EBQFMnW+nJcRiPF5T0Y9jaLEF
         oixw==
X-Forwarded-Encrypted: i=1; AJvYcCVYd6Nzgd2hjvCJNMhdxfbOlLLkSLXXHThjbX0xYFxni/1MwPU+EAtbZC7RT41fsQ7wGx5ajTuolyH4IX+jvBMK@lists.infradead.org
X-Gm-Message-State: AOJu0YxbxCQD895pAX6w0G/8t7/Igsu2YSom9CAOf2DIjlb1FaENdLzx
	7v1dtMiSle6xFivtmlXurOMI751PuYTBCuTG0gxt59Eluvazi2QItWCMiscJfyGb/qr7/AU6452
	7x4mvDEM1xegmMm/XaCP+0SP0EfIAPD3uo4rdjoficF76xpxTzyWmK31+mx3bWqDb5CTqvlQ9NF
	1ftA==
X-Gm-Gg: AY/fxX4hO0csL2y2WwZDqO+bkd25GKxVnsQOcoIpM6FXeqv+Wxe1LMMC+6oxpKg4mjq
	m9BR8foyg5/eQybV+vfxVXL+9oIIcGMcWJdkqLBq0a8te2/fx21orpHdm//yt598oiw1GgMgiBs
	6kKc3tAGWInp/C3Ug1N0cx9OgTaMAHMlo2uxCI5YOVLrMGFmKTXdbfujEhXB5/Zj1YjQmu7UAq6
	Zd0Uwl8lY0nIAp39LWGJde08Pp2+zmOs0W0ig2+N/qLlPhUjxqnRvqEVYn2mDHRTfsz1idGUy/f
	r++YgsdybMuCHhnPWFEn/5t3GKuFaS/kx7jIPHCTUKdIvZMlv22ysHJDDCcYIuRWvvaMm3ehK4G
	LC8B8OrGxxLuiMr34BT76Q7NHz3yqIu2qkzLxKuGqPHmp
X-Received: by 2002:a17:903:1450:b0:298:45e5:54a4 with SMTP id d9443c01a7336-2a3e398ea48mr23772625ad.1.1767697732328;
        Tue, 06 Jan 2026 03:08:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIUEVMMLos07KtuVO9uUUfZ9AwlvV86l3kxYIqgvDKncwew/dqKy8p2uS605UwMchZJMM6WA==
X-Received: by 2002:a17:903:1450:b0:298:45e5:54a4 with SMTP id d9443c01a7336-2a3e398ea48mr23772175ad.1.1767697731813;
        Tue, 06 Jan 2026 03:08:51 -0800 (PST)
Received: from [10.219.56.177] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4401sm20028355ad.92.2026.01.06.03.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 03:08:51 -0800 (PST)
Message-ID: <2dcd9e3a-0a40-0dfb-29b8-99b70b73a59a@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 16:38:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 00/10] Implement PSCI reboot mode driver for PSCI
 resets
Content-Language: en-US
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Pa3yRyhd c=1 sm=1 tr=0 ts=695ced45 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=a2kljZzNjkS1AKnM1u4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: PWstJJpAGpIx_SGcYF8XRgaRF0oVSzN9
X-Proofpoint-ORIG-GUID: PWstJJpAGpIx_SGcYF8XRgaRF0oVSzN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5NSBTYWx0ZWRfXy3agJVjhfk7R
 gCSQtlnqRBRl+wFNgfF82BT6FhwxKh3QYrcgGhp/xwyGrRHl2CeudErOEdYNfVgz6VpXGDVnEGJ
 x64rno+pE3W48yMuhuCZi5m4iYwLTmumiJvYyviF7Ywpx96531ecYN5caiHAUaYIIsU/YBSlYTe
 VEQ9mha3RdV+GNbx/T9Uezxz1RBwDG6OvdHfDX/rDpIywd2XALJktBDto5I0dae5X/TQCSw0Ir8
 eFq2dCF6Z98v9vgTB2a463d22u5DyBBEfak/GdgDHQwldmrzcIb3AXG0Wq7q2RoFQgbthSi8yyU
 mZqmAkhu3nKS+o//F80dOOE5cXqtM3hmpqAEssecsaWUIzGRPsX62dc9Chebm/uko/FjY7+DG4F
 XmcRa77MdM19YrWFgs/C5BpU+CQhDdyMGWmzJKSOd9njTKRvEG7jdPb7/gLql5LiXop0L1Mptp4
 Zj/tR7iWg2bZ8NtFotg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_030854_466943_AC5398EE 
X-CRM114-Status: GOOD (  17.53  )
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



On 12/28/2025 10:50 PM, Shivendra Pratap wrote:
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that registers with
> reboot-mode framework to provide this functionality.
> 
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:
> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
> arguments (reset_type and cookie) by encoding them into a single 64-bit
> magic value.
> 2. Predefined modes: Add support for predefined reboot modes in the
> framework.
> 
> With these enhancements, the patch series enables:
>  - Warm reset and cold reset as predefined reboot modes.
>  - Vendor-specific resets exposed as tunables, configurable via the
>    SoC-specific device tree.
> 
> Together, these changes allow userspace to trigger all above PSCI resets
> from userspace.
> 

Hi Lorenzo,

Is this patch series now converging towards the design changes you
proposed in v17? We’d like to conclude the design so we can move it
towards closure.

Thanks,
Shivendra

