Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0F0C36013
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfNrr9IWXB5j/RFLxcg5ak0n+LLaTpY+LShrMT5MZf0=; b=uNZe6ZsZ0yWZ/zM17bTfBRaXN/
	M+BGC1aADSqoZSZ08IHKkPwgIDuKbZqKv2n1EogDwP886N4GkxssaZUVM0s9AG78O7F0mSUMdiFDP
	+69/toBNvcTQcW1bcDP0fah+AItCfPF94qw0jv/3HOJ2/sEEC3Q4EYPbqubXrba0hBWIdlvi+Tizr
	YCQYHO91f6gEdeaJ4ehJEsoyZbiZYLn7gcARI3rSC6mAXywoMclmg8WTtAMPSbZErl3LskvGxQ/uU
	HVIXLqCKye8i6Yf71LNhfStIueesOhpm8PB2WrsZc8WbpjEJpqHJrgOEqhhPritDYU071o9tHIYr9
	+nkNzRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tywrX-0000000GT3B-2Epj;
	Sun, 30 Mar 2025 17:54:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tywpn-0000000GSve-3bXX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 17:52:37 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UEK2lx032338
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 17:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yfNrr9IWXB5j/RFLxcg5ak0n
	+LLaTpY+LShrMT5MZf0=; b=aFUec8+YWE1jnyv0nk/UwcyIDxhVVm/YbGUA+jt1
	kB1+g/9hulsP7Th5jWEjH4OsgzywWxhXU2h9XSZCxl0pdUCwiey4JcpYzLXajBlf
	JqcWj9i+knFv6i+zvuoUJApQ8X04Gd5XxAYMlyESWeLU1v1lH0xYDOHneldKer7h
	lCjIm5oza06P6dRV1pUFXEWCtzhnBaZhyyS/azLyZahyIBZULLBcju3jKyJTxOSz
	Mrm5om78MEYR5cIp+DBoZKMuwp8EIZQE+o4RGVjzXoM56bFC9/PuQGSJIUiL6NjA
	C++vGODQhgxbE0WaScqwObvkDfm39Uo2V4r6HjYc64HDuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9892jp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 17:52:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c549ea7166so598839685a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 10:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743357151; x=1743961951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfNrr9IWXB5j/RFLxcg5ak0n+LLaTpY+LShrMT5MZf0=;
        b=vBfJmJzSTZbZtZtR+MxyySHdJBhhntvxS9BRdudRabF9kpTs7/gJqHf4g/a7HW2Ur6
         Xj+jyDZH8Ro9lJT98Rwcr2SAUYBx1fWIhA3+ENISmGaPLbAQAJ/dx7AaXcgQpzN4IR03
         WlL/lJTn6Plkwhlth1L3foAmxdnko8OvxBJ/ENTDMLrHXx5koJ1429EjHIZwHGKclsSX
         2CdNyTxRRy6F9SbpyN5F6AwUP7plPT5ATKQCItYutyBIY9wT6rmjleQbwCYTJDFmsR8X
         9HGhSAuCuaWujxIJLDiQwJNxK5tR0C3HGJdpjh/JJT9gNzgkYfpa/HqhKiVSb7COnKxQ
         9yng==
X-Forwarded-Encrypted: i=1; AJvYcCWIpDpiQRabj46qwHO8oR3Pk9NutseBDKZ08/GohFr8ArRUFsg+i0LlA/onGAtas3+TBx8xrMIxjJ9PQYOGabDU@lists.infradead.org
X-Gm-Message-State: AOJu0YxKwmcapXnAxO+iEOBD7Sxe2MajImifsQ3T4FEfeIFhiO3FBr09
	oB1dqu1H/vNrQLFgAmq0hfSDESmw47BdDmpTxvACFbCiqRUFKIuP19Ew1wdMO0THklxDdZngZCF
	4/VA2CCQ/GFQ9HKio93RUFHXc9LoZcf4azsfPkQY5yOxtaQUqXZVJYXM4zs7IhqsVSPsX2XvDqA
	==
X-Gm-Gg: ASbGncsUhVR9Lx4h9pLha0XE3G/anwRTeYx3PTNPuUwtvFJNL9cZZV1Ni8MWeFLLwve
	I0AovPMbMSgm0TI+om5tZ3/1knv7Mp+fwAXxIQFnxq11QM/NB2LBmutxp16AQywvDrGQNpcUF4X
	ck1kZwNzAONpbo8aePLbMqRS+CknqK9T9IOuNIK93AjOSWsP9vdRhuUOVnkV20/X9/Df02Gk86Z
	cjMziBPi5oY7my8lXYEN2UG4igTxMPeV/rlKcXIO4niLRK6HHuEL5VPKiurYTD2LyaWhbrKM9Cv
	97bbUL/5qVRORp5bemkpp50WMPcqA9mgVJAhQi1bBfSWHhZGFomIV3cChedigAHZ/sY/krbNbVc
	7zyc=
X-Received: by 2002:a05:620a:462b:b0:7c5:e370:5c3 with SMTP id af79cd13be357-7c6862ebacamr786300585a.7.1743357151445;
        Sun, 30 Mar 2025 10:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy5zLBvgqZ9PHFag3iQjcsiuGTjpjVXIsJR4FiwTqbGCjzxceuXoViknNhd3e/sRnunh8apA==
X-Received: by 2002:a05:620a:462b:b0:7c5:e370:5c3 with SMTP id af79cd13be357-7c6862ebacamr786299585a.7.1743357151150;
        Sun, 30 Mar 2025 10:52:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b4cd28sm11640941fa.70.2025.03.30.10.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:52:29 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:52:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: victor.liu@nxp.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx: legacy-bridge: fix inconsistent indenting
 warning
Message-ID: <444lkvxa7iuymc6wx2gmcsjm5zv5wa4nq7dyhf4nkxmtfaxrhv@tm4hpcsoxo73>
References: <20250325075503.3852-1-hanchunchao@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325075503.3852-1-hanchunchao@inspur.com>
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67e984e0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=F_93P0QhAAAA:8 a=EUspDBNiAAAA:8 a=hZwuMZaz95D9sbrnA4gA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=v2fne3mUlQEKA94IZ0Od:22
X-Proofpoint-GUID: WhGftBw6cb1Do7i1A7kuyoy_tR91zIK7
X-Proofpoint-ORIG-GUID: WhGftBw6cb1Do7i1A7kuyoy_tR91zIK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=728 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_105236_018132_2C2D999C 
X-CRM114-Status: GOOD (  13.27  )
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

On Tue, Mar 25, 2025 at 03:55:03PM +0800, Charles Han wrote:
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c:79 devm_imx_drm_legacy_bridge() warn: inconsistent indenting
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

