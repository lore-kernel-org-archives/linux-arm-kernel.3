Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8436FCD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kygRY4F7eJ1NPjqjo+XnXvVIc/zT6FpT96y6RC3eCRo=; b=iNI3Ct0sqFcsQqCk20FWBihqmz
	3Y/ilecMvazDzoDp7O9qte+HFVkPRh3F4XaA2CIH1nwCBIinU/DHVtFZoMqrFBjHz+rCn7FHwpyXk
	AwtDVoufoYWH3Q75tMRgBz6FMArkhGzu2so8mrzll5EDweJR9e2QBaj099EKmCevRNT6+i0IEKVdr
	Unca0WjOh+EPzUoIw3RLdUIAUDY9wL8my0HYzsulkD1JcUAOnQivm726CApTJZhWZMZCwgHbZrSH5
	JcD6mMRZ6Xj5/JD6Cgn6o+qTDhuxwTdmxFH9/UZpiPZyKDiKX1pIcgwEKRPESj0GQOeFPVkd4V+oR
	jrRoMnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7kE-0000000Gl54-137V;
	Thu, 04 Jun 2026 13:04:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7kB-0000000Gl4Z-1xqX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:04:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548G9AB141860
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Jun 2026 13:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kygRY4F7eJ1NPjqjo+XnXvVI
	c/zT6FpT96y6RC3eCRo=; b=LYGFz4HC6QJIf95dQ+rkttk6BETSr1NO4PX6j884
	i1GC+e+8AwfzwdeAFnf2A09YFRF5Bgzbwsf55VHhjnBa5/usR53MnALGKwOnRH9L
	1HvclKZU7w8ZrvhbG9z7m+8pwlX4iLH7dtBy3svAUX1e2tpKcZ6i6Fm5fNsyXBbT
	0XPdKKQ1p2KWuDbq3pCNfJhckX9oB2B1JUriTePpqGxX5x9sWAlCU+rLL2LOs++8
	IbWLSW5qiApcqzMWdAaaDaz3+P+OEHAtMIS0HO6E/zMarcZcPAa58BDMpV5yy8AQ
	z2GiLgjfgTA1D52q4ES+HSy34wcFSjKtSxJRkGKObv0sdQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyenaen5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 13:04:18 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6fed63fe5so730518a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780578258; x=1781183058; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kygRY4F7eJ1NPjqjo+XnXvVIc/zT6FpT96y6RC3eCRo=;
        b=ahjQ2Zaene+c4ub6bD6ilklRVboI6U7VWM0rYcqXpIqFzO/rJ4HGnkRp0i2kiv6vqu
         bypbbq/cfVkcyJCnSSvkAzI8yOxg3JCiCWkZJaiEVG/y8yS0uypVIKeQ2maM2NwO6DIf
         PNgleEBmNSHfpqCFovVtmm+XM/CXW06oPHEwmeoOYPvKPP/BO0mty7pkVgHMCIs55Kek
         mefpOZkbVpZGY9z7P673POc+N9olcxO7iLXpFg4SKPiEbD2STh9NSrrvzCYjMF+Rdx8l
         Rb4Q97zR0bHMWLVr7lLo/VpvtSZyBiTWYwGE8aaQ7d7SAedRhbLDZglNfHMDSlH1BDGZ
         V5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578258; x=1781183058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kygRY4F7eJ1NPjqjo+XnXvVIc/zT6FpT96y6RC3eCRo=;
        b=TsK510jXtVmSIZLoup+zDacZxt3cpWQGPpGQw4CFa52zBRN3snGMliY1GSveaXHXO/
         AQFWZKRpblMGPvjml8mcAr+YOwb6Zn9nihD97IRxxhKOYeA5WaG2+Zx7Ood+CcVpsCUU
         A1npCTt3qb8782tKSZl87M3jnl7FuVh+qRp0mkmcOgrWwXtr+bVU7GxiMHUmNFDDwIlk
         Sr5FuhgjpHjF19ajwNg/A15jd8iOh4kQ1rb6odrX4tNIGgnJgY31n5Od1HLSEmVS1LzW
         actQraGU0Ah4tqyO0AzyvIEnnnw43cZ+uOT8Z0fVcrm2K0H/0CIF7GsiIcTV1tT5o0bC
         QiKg==
X-Forwarded-Encrypted: i=1; AFNElJ9YNCbpni/5L38WNMQx7ahoi7FRTM6xogvOI5WOYY68glfh/nBuZtc1ENcRyQEX32XkQHnbdm/Kpg9IlT02wbAz@lists.infradead.org
X-Gm-Message-State: AOJu0YzEc47ZrzIJcOXZfKu0GvhyX2SfGsQ2D4NyhK4P99bmjQwW58QU
	Oj37NuABQO/UH7l5mNbMZtH1HneM6cgeqbf4+PJLosgNpWqVzqzuL4wRj/ltEA2ZI6mcFgfblM0
	0niINJMxQwAISTEWYu3JoeeLdzEHTHP+RF5rswJkjomKBSYumOxAAK+TFUITjT/4IhdJsrDq0yF
	pmBg==
X-Gm-Gg: Acq92OE3IppMEzHaTLd8cWciSBHmFO5jMakdKN+4KJYmhH4osl3m8xiwyZn0RrUKhBq
	pZ+1dNPYCbS8FN7tQE1ezWUP5DhNKeKtjPeO3Y8yA+EeOLUzFuo+AziuJFTb4sRJRZgu6xt84Cp
	w3cZMDkO6FMUnQ1VHTaVdN2DPTyCJ4Y0RIlinItxXFzci9BZEEJlMQ3cJjUZIDo7Fvjbh0qglym
	u/X5hW8bQ4rij/3OROdrcLS0t9jOie9pInV/op4Di2bHEeMgEnAuo9NRFhETSpPRbqPYlpOIHOw
	NPn3Ww4stwE2Z4eaQSkVDBBotKZSk63mVeIW4p3XIodeWcAhounvxsKOp8atcTpIIPZxQRZlUzs
	YmOriyM/sIoUSDuZzrJtV6C8a+9shufy/6WkvvxYHpXlzhvM6zL2phtmKpl5gTIoaiOm0DvM7FP
	ZdA3/0qwM5LxrUMjOrzfP5vUpQn51KHEV9/QC2iLf/cwts0Q==
X-Received: by 2002:a9d:5e0c:0:b0:7e6:441:cb4d with SMTP id 46e09a7af769-7e6f91ca449mr1449307a34.3.1780578257764;
        Thu, 04 Jun 2026 06:04:17 -0700 (PDT)
X-Received: by 2002:a9d:5e0c:0:b0:7e6:441:cb4d with SMTP id 46e09a7af769-7e6f91ca449mr1449240a34.3.1780578256962;
        Thu, 04 Jun 2026 06:04:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907269sm1197378e87.34.2026.06.04.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:04:15 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:04:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] soc: qcom: ubwc: Add Shikra UBWC config
Message-ID: <nkzfcmzslcc4e2kp5fv2i2grb22ncf6ewd5pn57wy5tdth4zrt@ddrquhu4ijcd>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-3-b3c1b2b67edc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-3-b3c1b2b67edc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a2177d2 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2Uxw_1zm03w2ut2Jle0A:9 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: 7gxbFWUKxCRNDERoowhbLuO8rypqttON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNyBTYWx0ZWRfX9bpMqGPE2UgR
 SjRD+3R4ffuSzTqdvv6kxww81f1pd/hBe31DeMCmrsl/TqJp/NyOwtPLJY7nru2TdqLde5Z2LCv
 xLnYcebY8M9PXm2syzjRTPO7CV44avVbfIQw1XFVtG2Nl9LCtNQ28o6lbsf9LittV3VhIqBNsIo
 QzLUTDAPXqbXtEJUZqcTOoQeRMoCSojFGCt1Zo2/ZDgNwxILKo32IJH/3YVTSytZJv2wOZPdJI8
 qHT9x6IzcdEYpzrwF634uch8UQLSKqe00iAwIgWJZMxc8k/ewkUUc0CwRJ3ELVkQ8kjaHEX/1Sk
 ymEXuUOe17b3MqXyx3REh81gWhPBvpFdUQbZtYS1xJ4Li4w1xUCo+QPVyFkTHolJeyyWYuBaPYc
 B8dYgLzT1hXFFm+fOY5BMTa7Pq89cAkNS/wY9kCSKnCVm16DNwl90hwkCCFwH1+50aEooFmFJ82
 z4/KTmJhcH05W0KZMWA==
X-Proofpoint-GUID: 7gxbFWUKxCRNDERoowhbLuO8rypqttON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_060419_645980_888CFD7C 
X-CRM114-Status: GOOD (  14.56  )
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

On Thu, Jun 04, 2026 at 06:00:49PM +0530, Nabige Aala wrote:
> Add UBWC configuration for the Shikra platform. Shikra shares the
> same hardware as QCM2290 (Agatti), so reuse qcm2290_data for the
> UBWC settings
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

