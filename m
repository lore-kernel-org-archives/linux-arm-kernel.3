Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A055CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxCsAUhNU6df1F1I++Z1eLGUQBDjhswursX1dh2wRaE=; b=xYx+YfDPINlvAqTHwVIEBO7Jae
	teAzgo4UjlSPW6rRF2fzUKpHUzkZTRV75Ox+4sXILUmMb7DdKRCxymyHms1g9PhzNE60gVfEl0633
	tv5m+F5vXrbTnzFaMhdeJxp5v+ITuB2bG1pyLveJvwACaYqgshXTKu/AqxOp0vmr8jC/D/Yl/1Wlo
	bACb6yjNwP1wopS9x0pV5wsszQhlWvQWbOFn4OVMDAOSnAoBvKrHmkOPpvrkIWWgUoTFgZKWt0ERV
	ZSUYSR/MySuNh59/sPRgzxQyeZqlgbTM2qq1pc4ORP5IFWniaW0OFJvbwz6pyApB3nrHnvktK2DJj
	RLgT28GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoX9g-0000000C0fL-3haw;
	Wed, 20 Aug 2025 00:58:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoX09-0000000BzTU-43ZY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 00:48:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0u6H030362
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 00:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zxCsAUhNU6df1F1I++Z1eLGU
	QBDjhswursX1dh2wRaE=; b=DS4DBU+fPa9WHAiMUOpGkzofSujP9EjK7ZVT7lbu
	ONhmP2pBEeUTdtOz50SsGdGJ5CIDDsPI+US9g8QewnxebslM/ZUGgm0MHkwlhT4i
	+X+rbSfB0BHj6HKDpp34G/ScZ0wm/6HOLWmXLm9mPZD7eNUB60qDe8QqO67/Ztja
	jBiZ9C78m6VZAXN46HIW03DOnUFBA1/mjGQvog1c+t/QZ9DMCu+D+eVHJhdyPb9a
	dzgDklgjRevYt6Oop7c3TP3L3VA470/vkYWEZQPVbHbK+rAzv3wC0bLoTPL3X742
	Em5AvC26KypiWz37J8cKk82mSY7AF0kJyrID2DqQxTC8ZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tdrd6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 00:48:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a8b32a6e3so119155476d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 17:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755650908; x=1756255708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxCsAUhNU6df1F1I++Z1eLGUQBDjhswursX1dh2wRaE=;
        b=p+HgxVoXnWYyoZSP2MFprL3M40VrFnv6JSK9jxNL3snT44Mu5tl/JhMgDg178H7Tzo
         /fGtid3GmwWsTJKtJgjZ/tqJage70VtXuaRUVnRPhffs8FfhxC21YbOWPMNX9tLTrq5m
         QlJZcujULpAVpwIfahZrBIDKEQqHQHFCb7rIYYDkDcMk45JzK22pVeJqLJDcthVVLBWp
         1oiiOyJ6ht43oijfWBrq7rzrn6ebVZKsGNfPMDgXDKqUyCKHH5SVi6Al1uBt8X/xpj1f
         OVWrHcHI+W8O9eiW1R6tQQ6hr17H4seNN6l5LCZ+mw7CaYh57VZAiigNUy6jOR5AXGi8
         GEQA==
X-Forwarded-Encrypted: i=1; AJvYcCXrTCro9NU+jAzV13c2DHZUUQrMMAA7PEMBOr8K7sQ/xEIZjQxbqshvMqgoUamioF+88w+llFmWP392Cm+KVMzi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5LDRpSkDyGHF1uDkIW/B+iSDT3TZxXr7pxu4K5NNxZQvMxkn4
	gXSG9blXm55HAoZOeKXif8JbAM03Ur9VgBMXJJybHAywXayr+msbrECSd9EP88Xf/XLMCaTv3ty
	bPb0/+m47OaD721q2xO7VfSLo7oJ/s0v9pu5nZyC5rC+fDLK2tgu0GfnnhuXbgYMak5fHofnMru
	Zv2w==
X-Gm-Gg: ASbGncsA2zTjuqTIiyXEgtUpLvsDJB0lscup8YqFi3AzwiK+mei+w7UVaYGMPHxOV/w
	Ax6t02yf4+QXDB+YnxzfvdRtHPOp6VEXgdGoYhydVONoEDQh/blRXpyI9zKSiLqpnYYmpWJ8S6O
	YurSKWC7Ezq+PxPXdptGaydn542aTMRDz6O5O7Twzl72s8UZlw4deLXzZ8zlOMJpSWVAQUQHtTM
	osgptHUGS9I9nFTnkuFFUp+KhryVjjkntCCP9Ssd+nzj6eTlYef2kl9Rv+sck0KtciCeW3ED8rC
	g20nQ7ltItsTfbga1BtrZWOXoRE7PgdYXjhgHpM96lYvgGbx6HFhxCWX3t+xJZ0GKRsTfKd357f
	SNcsP/OE2rHqJnjSAiex/UhVULP5nI/Z4/23OeC1vmZY/zGxWdCkC
X-Received: by 2002:a05:6214:4119:b0:70b:8a30:ecad with SMTP id 6a1803df08f44-70d76f5d7bbmr13343166d6.7.1755650907748;
        Tue, 19 Aug 2025 17:48:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3X2dMCwIgfJclfhzbEeQSa5AZSTe1W3Eu1uTsUTeRfUaK1fqK3+wI212pgSqH5x66KOuXag==
X-Received: by 2002:a05:6214:4119:b0:70b:8a30:ecad with SMTP id 6a1803df08f44-70d76f5d7bbmr13342796d6.7.1755650907272;
        Tue, 19 Aug 2025 17:48:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ccaf1sm2411211e87.94.2025.08.19.17.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 17:48:26 -0700 (PDT)
Date: Wed, 20 Aug 2025 03:48:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Kory Maincent <kory.maincent@bootlin.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] ARM: defconfig: cleanup orphaned CONFIGs
Message-ID: <shrn6yrf6tmx2jog2z2qvwmic3vl2tsauhj6a2pdtodnjcciyz@wssbxvgsrjir>
References: <20250819231652.15938-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819231652.15938-1-twoerner@gmail.com>
X-Authority-Analysis: v=2.4 cv=a4RpNUSF c=1 sm=1 tr=0 ts=68a51b5c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SBwMwNJHQgdzs6wY48kA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: _lq6AlHnWe-8MQKUggXGdqreW70G44sL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX9BTGg9h1fdU5
 K7eFhcPhcObXWUVPP1Yqu1kz5MRiGTjpjoeEc1UHNEesV7IB1MxclllCAVVGuF37UfZbDJICmFs
 sAdVnvM6m6hkJe4wuZzS7IVcQXj5CQUGG705S5pplrQcKFnkdqs9VoVP07cUtzUOmXMhJzjybla
 g3R67mG3MC5wECPP0Ka54vxIWFfD4IVZtNyPA15OLV/YS6931D0vscJzdCuF21/3tljGMHkrtb3
 yEAniJ0aaChA+t0GWUHZEB7vWJd6u2GkXmJDlexIijTCbjSpvniKn1rLRrpXFdYyj8DZMJD6vF0
 tKtqBxQdWLKweMgJi9SBUCk5v0TJRQj/DQnIcCb0vWMVenn+3qQ6H3r42B1Mjn/rC5l2V0rPBhY
 e5XWTpqEhVVA9fq0D6hJrQ3i9oY8Yw==
X-Proofpoint-GUID: _lq6AlHnWe-8MQKUggXGdqreW70G44sL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508190196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_174830_122730_935BC20D 
X-CRM114-Status: GOOD (  15.35  )
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

On Tue, Aug 19, 2025 at 07:16:30PM -0400, Trevor Woerner wrote:
> Drop CONFIG_ARCH_MSM8X60 and CONFIG_ARCH_MSM8960 which were removed in
> commit 99497df59427 ("ARM: qcom: merge remaining subplatforms into sensible
> Kconfig entry").
> 
> Drop CONFIG_ARCH_MSM8916 and CONFIG_ARCH_MSM8974 which were removed in
> commit 85148df36835 ("ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes").
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 4 ----
>  arch/arm/configs/qcom_defconfig     | 3 ---
>  2 files changed, 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

