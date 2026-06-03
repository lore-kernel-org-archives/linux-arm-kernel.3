Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAAACD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 23:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VM7re91kygzVwItS+ciTwBT7UhZcfvCtwxBR7/9Rl6k=; b=PIWbnNLnqNaYzYnla6xmtEwmWg
	xt6eyZPTYyw1TCheWA0uU7EVpMNfWHsVLxi8uUViWS638Bv99HDLy24mJcpXqDv+SRthESFJTcEr7
	rr5IvxCRU4WpY/SxJcPDqg6QcZfLI0pGbCI8nqpHv+h8ONkHIha/WaKtAoIF9VBOIixr5Tp9LwEPl
	ldXpX7c7E58i7xGdIPHNOM3XM225zTgvud3t0VhK+4Ociu/rywIAhmANrox4oenf1hmvUJbABCdad
	+bvs43Wa/CBSHUuwmUmMwNU25/AnJb3KmbbuUAlRiyoN3gPUNaykEVd6DARoXIQ/IxiT92sQWlAkM
	/L1nusiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuii-0000000FvAj-19Od;
	Wed, 03 Jun 2026 23:09:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuif-0000000FvAE-2PTQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 23:09:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653GoCD83552136
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 23:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VM7re91kygzVwItS+ciTwBT7
	UhZcfvCtwxBR7/9Rl6k=; b=ItHNQFCVXlcr3sWHBPrR/Jiyl4WNsdz75NYJwNVA
	u9QYRBhxqmnTBQ6F+9QHJfy37sA8aw1eh+flWW0DcMAOSAncb0ALAbwf2oEwVI1P
	QA6KKlRW2F7birwA6SoFimt7A3uGH4cy3TNDkc2u6n8pcpl0nE5G4aFicrt82W53
	xwnuayjo+lnqnsFItT+VXwZplDO+BbvxbXdnVLYbEXLtVZxdSA4mVkzaCLFzh2Wr
	0yed7dV3ssEW8dSjmHN5h8X+Y6Hvh5/HOMMoOOt0nM+u1LXpkSwQUJOO8aqtxcTa
	3G44XaKRDxj2JxBKRuPcYPc4UVmMz6FyfZltEbPOipE0fw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mu3jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 23:09:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a10923f7d7so1952327e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 16:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528192; x=1781132992; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VM7re91kygzVwItS+ciTwBT7UhZcfvCtwxBR7/9Rl6k=;
        b=huIoeDB/avzphDzZP9owwKopGcfMFCt7WZtpnj6TaaCC4+38C8875J1kR4BBfrk7kF
         gpvhfKAaVTVsUeWNqL3yz9uEXSMyezShptImMtdLNopWPsv4k8jWJwEUdXMXjd0iNeBz
         9fypxI+KS9uw6PM6DZYiKte1NJtkPaJwtNve2VQeAirNfPjJ3bvpOb3QEER3aqKeySQf
         Dt7HkmmVwfhH6oSbntUf4NASC/Jm4XaHiNcdncNZLXAPYSNL2i7VwLpp3CMWuOvbH0pp
         MiPPwIAvh38xoZZM0VdVAKi4FyZLBlsVYQ2xBZamiDB6gvOVuq7auREdGrNlbz3t72DM
         dDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528192; x=1781132992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM7re91kygzVwItS+ciTwBT7UhZcfvCtwxBR7/9Rl6k=;
        b=I5VbsJg80X4aTsR/+ZvKRaDdtwzsAKFAIr1pXHYfL2rehSxOc0cDW+P80mJGl5Y8D9
         KJLJ3dgKFCrLoVJ2oFVKOpsbgAX/aExNPiZEWJiOMzLV0IWDg7dRn5wNlxJ0wkZf4FRp
         IUBUEvjY62Song7HCOS/ppgAEtDMhBhHidE5ECZa6u67D2Na0/OLOEP9TvqooCs9dlOa
         fYwo2gZJm/gjWOoU7w/3FEOV1YLx1GYNLQR7747Rbk6Sj8SwcxfL2YqD7/WTV592Hbxq
         cZX0g3IlVs+IOCBibYxc1gKgl7piC3RR5xCWThh4jJgteJj7yNqkl46n2+zithK0kLNA
         dgWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4VMiEw9Szk2sab5cqkx571sR01Gi0sjV6/yyLk3kVD1BRNhqBr7xE4H4VJwkdzF5fOfslJ4iqqA76fCbbbaaq@lists.infradead.org
X-Gm-Message-State: AOJu0YwwWcGzNkoihhyPqt+jbtC8jrpPsz3kLeRh2Z+UrpQ5mjZjuRcH
	iTAnX+tcc/3tGJaj/nNIU0pIiDjosnsxCGajwpRkSkAhgebQIOXJJJHYcC9LSpiGwvStzNqNpvu
	fAsewh1Fskv8fZroPlzCS/lOpuTrnlYgN89iRhKmG6vPvXIoi6uxJQK27Y3kCK9YZcoR+TEiCgY
	G0kw==
X-Gm-Gg: Acq92OG7/7Aub3yk9mLx9NJlrc3iJTrl38RF7Y7+EDUaZoswB8a5PB6JYyEfMNMBU6b
	0cpmveT+cDB/EP2TWVgrfRJP8BE/jvF8STMs5LnUsrHLZ5AFEGSDniPKqKcNXro1ixBy+D6qAkh
	d9vQCJsmux9X0OZx0Y+jM7Lt939QukO/9FnwM6crz7yPOxHULLl1XENxT4qSy1qxTTDtZYmWWBv
	EMpc62OwXLwWdh/MoHZBZ7PwPVXkQi50hiki87l3KdYIwc+/1Qdwti3Fk0F2B+gUhbNR80pNbLg
	SEXMNUW7NfqrmHU65q83pSBVbr4fvCiuE5aOwDP8HhptKN2J/rg1i+ZL/tn+0TDcHd+cAUqyvg1
	i+xtrbEGmAsb+GTrkHIsebBZ1lEKZzYJL0MCotQxkMds6ppxNQmi3kTshiAndo2rFJ1k9R7tgW1
	wWBNhsu5IqKKnr1BbR+ktra1T+NzsS2t/iTMxtt5b9NwQaig==
X-Received: by 2002:a05:6102:7:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-6f5512f0f18mr606523137.19.1780528192029;
        Wed, 03 Jun 2026 16:09:52 -0700 (PDT)
X-Received: by 2002:a05:6102:7:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-6f5512f0f18mr606503137.19.1780528191675;
        Wed, 03 Jun 2026 16:09:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9082b7sm883863e87.36.2026.06.03.16.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:09:50 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:09:48 +0300
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
Subject: Re: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <bhq7pallav6wfni7l3xtalv3ophpoa7offdzdhfoqk3a6lj46e@ke34hu2ukig7>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-3-aeac1b94faa7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-shikra-display-v1-3-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-GUID: 4cZby3pqcXNFiRPhuZzv41lhVpKxIWMv
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a20b441 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfX0RoeihDAHYxA
 uZil9QE5QGrDJnFoJMddqIZZO0z0pQYLJlamv8GuR+2XjYo4mpNlZ1IvQQnKjM+xUzkGIFiDUAD
 eRVlMhRMYLlvUkaosHMfN1O8QVcSE+ZZXGCtD2oJmMVpZDWOoC6SvDYxsd3cLWjP5H0I8lzxz13
 dFvSugWXdL1t8t2H9GJekJFXGuZ3rM8R/itGe+Ttm5yE972Zu394RXON3R9uPcS+ryeRsq4WB+7
 WNGelTIYYunU02QEcWv3c73d+MKmmO4GHYEpxODrT3SMh39N2s1qcYG0yrPELE3LZGKNPfWddMe
 OPqx2R/kTh6VtOyyqQwypoK1NolM3B8LDf9DLRBQUiKBPFkeXQIS+fYY1YbXWYGIle+qot+ynMM
 fk8C2jeztd5l/9cZLLfGLsaNrL8F1RU05sO4PvESbU2MXcfDToEMtA3f8zkHEFHTPKes8/wh1bv
 fFx1V1W9izuEgycqMXQ==
X-Proofpoint-ORIG-GUID: 4cZby3pqcXNFiRPhuZzv41lhVpKxIWMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_160953_626923_B2AB7BC2 
X-CRM114-Status: GOOD (  14.69  )
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

On Wed, Jun 03, 2026 at 08:29:28PM +0530, Nabige Aala wrote:
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

