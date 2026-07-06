Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7933C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51ioZRkWsr8YoDDsIq7CqvS9RZMTHGeh6Z7fA8LH+6U=; b=jzgGVN2ir6ByrqNOIoqr08GjVk
	Si6VD0LzcppzCJ03qoRnpa9xIPKeut9XCGmO/EpuTqF/Wlm6krJXTsPU5Y6ffzC7kucizPxEvbBOo
	prWPG0imRbu/IP7lpbe4+JyugqZwinIyKqleTJU4bOEdhrhapS9rEQg5oesA2sxG0PKGRJbhuMRM4
	tsO4lkuOZAdqt5L8vyN1Ob3RhRLaYlO6zLr1HRSvqSvAfh2NYA24oX/58Q32dt3h9s11XC5RAK6ZF
	9cX+xC6rcIVpYMgvr+ye7dn9rTnHcGuHMLjYsj6CYGv/i3A53yOoX8zOmJTJgZFMKpshBNAr0QG1G
	N5TShH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr06-0000000Degn-32Z9;
	Mon, 06 Jul 2026 21:37:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr03-0000000DegJ-3dNl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:37:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE4T51626325
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=51ioZRkWsr8YoDDsIq7CqvS9
	RZMTHGeh6Z7fA8LH+6U=; b=n/g9HkW4D60PuJ2NZSWDYc5hRIKJKU8BpfsglSw1
	tgDVNoy5flTOTKVlT92I2uQLIGcVUu2ceQOuCoueRx6rIxt2Q1eoJ27LvZq42NJA
	CsLnVxmG7WgXa1AdD5pCbmD0AsVUpfVNhuyW8ugquMLtNlIHlaFapc45+Ey6Ms76
	Pou+uFpaFih47E7zYwBfx9KzzuBFtU4rQEWG2qgVdzRq/W44hUCVTIhpTMqdVM+S
	/k6TUo3bPIyriitLltZgudduDaZlT2ADkEIglIEwQAlk6VkEm/UBWVYcQWXqNS88
	Z++6Ff3ySp5Kfn7BE5oLSq/bUjeCr8WYcPG1g8veWZv6qg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9bfbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:37:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9692d7bee20so2748865241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373830; x=1783978630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=51ioZRkWsr8YoDDsIq7CqvS9RZMTHGeh6Z7fA8LH+6U=;
        b=LtaSeNqLVMJqDtZ0FXuUu0nN2Q936S3F30lTl/Qcke/OCaXVtIA66Yxngj5NGeTViw
         m0WxP+NWgZ8ZAjkW0Bay/Z25HVOYz/74Oue0P4gaccRdraqVRSf3k+79PzLSI7BvRCZL
         DML7TP4GR3095G4bIqFmJ1dZdb2oCq3LIOhaP1EvqEc3N8iz6Musb12Cl+lR7+FSFf0t
         I+h1JbpkIGkdrsSrmtDG6mX8XtPJ/zePJFkxIV16OMW+TsBTLWNlbXSvkfSlwagZdVHU
         5lSeDj9s9gXZRutpgpKsCBiwL92HSTaSyWaIamGiCX/pqbsnZj1vOSstP3q/jhEqQ3XX
         gBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373830; x=1783978630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51ioZRkWsr8YoDDsIq7CqvS9RZMTHGeh6Z7fA8LH+6U=;
        b=Ob1w8LniPC03hx951E3i18M3F/NjE6/iOd8L+ba1IWKGYXjAvkJsoRteyQyrVoObRe
         cBGLcxR2Q517aPgxRJM1Fq4IE0oTysFhbmwMzRXzsw3qpaZVbDkSMvrXahA0bOH/IDrt
         AitZhTtYLuTyF4quiGFd0lzwo4PAqzno8or9Q7xWE7toMDJkFsqI72xKdkok4UtEg2Fr
         Y0WC3mGyQJC+ZWGeyQbekmu5CUQKCWa1oX900PG3DTqw3N9kNz8Gt3aaagYGkgl65/vD
         4AP+aHqyJPQk02ynF47BuTMlvr9QMeXDhDwdIKUMWIpg3gDz5ec2GsLIwoAQ13pcwmn3
         FZqw==
X-Forwarded-Encrypted: i=1; AHgh+RpxM5mifcCC6r4inFWn5kR7qUGVzJhf2nsqpEhZAeWOTQkrMBoA5cJ+OM4kenLhy6Is+XnQlr3w3AycsKjtHnps@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe6S3w1qmDM7KjETsAPSNDlib07lM0kkLK5KIQ5lx97Eg5hHSx
	2a/vmJwt7NLHQ55T6m2pMc7Ao4F3R+/Up8sdwLO0Tix2U5lwXvf68SByA3K8rhFDDIVoY8bOHrU
	bEiY5eoZMvmuy5D0mL4uPFmxutQVUkacGJsrrG+PhdlW97cyMST+KtgPoIz8xMFL0FacR5aXkBo
	VENQ==
X-Gm-Gg: AfdE7ck7CpgHQ3FkCgA4jEtl5MkAue2rzTW7Ne/75tE2GnYNRGTkHkfE9N9rGlFiI5i
	Qth465NwBPSDE949Zfa3oK2E3ppV1+M8PHnAIXZ1Y5Bwml9V06fzeGN0QFBxYLFGmWav49IES7W
	tEYv2Q0OtUKT8U32NMfcs46q902lxPxnRZwmTGZII+4ijOFlAsk6txl69HXIQkUJdZAmTKBfmyw
	kAbEZJS2xAjcx2chHYoswpcBApzERg7fwKNSvSsvKDQPao6GapdHfsfjD0qxmDUyBuYy0+MiOFe
	BX+seRaybxy4hjRdrRbfTufu+ndVil2JlM3HTIS2CaDQhyXSNibfKPaYrbeAF87QLbE+4lIz5U5
	pei2ZjuifV+/WOEUXS89sDlJ37amNFOVNsk9TUCJhI3HjbHD70VHuHzrJ+XabgdRkIB64aW5bnu
	WZLZLBV2LZfzHO7OopTlwsYpox
X-Received: by 2002:a05:6102:5e96:b0:726:cd42:d039 with SMTP id ada2fe7eead31-744b7e0bec0mr1289283137.24.1783373830236;
        Mon, 06 Jul 2026 14:37:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5e96:b0:726:cd42:d039 with SMTP id ada2fe7eead31-744b7e0bec0mr1289236137.24.1783373829228;
        Mon, 06 Jul 2026 14:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c3asm3167623e87.82.2026.07.06.14.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:37:08 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:37:05 +0300
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
Subject: Re: [PATCH 2/8] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX-
 variant register
Message-ID: <hahn2b6uu6bwzuext5jkb34zbs55yerrkfpdfqpd4dgzprywcy@wqcw6w4bkjtk>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JrCzz9j8ERXUNlICOcbgEvQVuXgzEN9i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX+t+uZp3otzEj
 857FWDK4pgKhNVGDKsraPzNSjsBni5lB9OF7HPUIP2jGbOMsgn7msWR36Xo+h/i0JzGA6pt53b9
 lqvgvf99c5bi465dK/tCZ3osZtWl/Tc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX7TXRiQgl1d1W
 nwEL8jvTDPhhS0F7hlIBDz8I8PESItG88qpAKUuhp4uNUTbvwcmu6sCnnBhfuq3dfxp60M61EfX
 45MPLfdKwfLLTNINjf8JUwyWrOX7dX8hmq0RiDLITrqHtUxQGlcEQ7DdiEDLh8NL8G4+j0G2vS4
 TV/053yft6eiV5xVzM+K+YFof+j68HWust/DwFdzf6LtfLTH6i0U9JwYPVdNUpewyqd94uanjNc
 MAM9VB7tU3ZFXVVSVef4/MIp0yr1mFwJaiLR3tWaDU91LVRYu5bU7ltw5lBdbw3ahJSfEjnbYkm
 t4q8q0GUhqswbLZIZkCdekoSrSObD/n6DTwUmHQc4VZS3lmOGEzsTnsXCAaoRqqI6zitbOF009M
 fZBC2Juq83o03qnabCS3ofe3uc77aVLtmmj1BO5y5oO7tfn7TG/0XaLVgCHHmqzNHlo5UTBLCNh
 3tBsLX+oYKdzHmRPKeA==
X-Proofpoint-GUID: JrCzz9j8ERXUNlICOcbgEvQVuXgzEN9i
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c2006 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3yiLn2T9MxZ6V1egYJIA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_143712_024593_A60E569C 
X-CRM114-Status: GOOD (  16.76  )
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

On Sun, Jul 05, 2026 at 01:44:17PM +0530, Akhil P Oommen wrote:
> The GBIF_CX_CONFIG register exists on GPUs prior to A8XX (it is used on
> A722, for example), so it should be tagged as an A6XX variant to match
> the register spec. Widen its variant range from "A8XX-" to "A6XX-" in the
> register XML and rename the generated macro accordingly at all existing
> usage sites.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 2 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c         | 2 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

