Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1060CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 20:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnCDWQBx3MEUkPGk1nPDrYBk0/iZtvd9WsbeqrQ9y0s=; b=hFAJhEen3sgtBWHWexPaV3r8xf
	GGfHz+MU3R+Y9oO9bVIVGUm6nq/OoFaX8+sB7Acb3hqeJZPU2woes+NG0QY+XfmNyujkNgtRVViYM
	DnniDYnn8pcvvFBrmFSZ18u5VFSR+60q3dm9PkkxwgvbvO102tH/3CXoasEgkVGKW/5J6N7duImyq
	vsd8ZReAqm+WZTrStBa7MOAsgAcgClfc+RhyTW0/CafHRKjEqnHXxedFnAONvuD0E63izQhSBOa2T
	BUR1cSzybl724vkHm2wrts6AWg1lPwXQ8cGaT1keILBg85E93rutz8FYzehy/rbWDrwBe7AcI0j7M
	gNsLth/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gcC-000000068WI-1YnA;
	Tue, 30 Sep 2025 20:06:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gc9-000000068V2-0UDG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 20:06:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC8F5Y022345
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nnCDWQBx3MEUkPGk1nPDrYBk
	0/iZtvd9WsbeqrQ9y0s=; b=pPAcwORDhNc5V5kCVRdy1IZmLTHcRoUgyba/fmd3
	LsdcVm9mBl23+/rygXKXLx4xTmFejhl5BRVUieYfVrucQZuz4UUt1acQc6HyTIyO
	RPqAXMPfwf7YaC7RTcJr4ZV3JkbbSxBKxh5pPWHJSWSsno6VL8fubM/sxLmOXb6M
	lWHGcrG0XGpyEMF1ttNJPNALUy6c1JR8Qk24PVus9lvJdbntQaG2hFR+Ln+FlgUF
	AyOiJsXXSybd3jMHrCKtl4KLiRcraBsEtSM4sCTFmWu3LWeBbK5TpP8rLv+3bwAG
	By3BP5CkBKpniG/bunzzytaqAcm5eQROG5ldQf3aestZ8A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5tf1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:06:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d91b91b6f8so100232371cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 13:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759262779; x=1759867579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnCDWQBx3MEUkPGk1nPDrYBk0/iZtvd9WsbeqrQ9y0s=;
        b=VcFZ76pctdvuZQ/3wZLDaVPfhmwovQO3MxZnv5HJaO2QU5I1e8kOMN1Xo06x9dWpi0
         zUVi92chxUwd06nPIzOK7JJO68+VlLAca0dWGZ6QvUclbqW3OPzR3WFf1slkoRCxgdVH
         Iet2TKsUpPV/rhlxXS3VKkS4ugY80UKYrXuwPJaD4GzR3yfZVt0haFzKq2dc9UTLAfIh
         bT9v39nP+vD8SzgyFqbVOFroN6PJ6j0Jdy85eL8NmI5dCTsxRjw6kGsajr4Z9Zdlq7qz
         e/cE2qHG7S+d9i0nsw68eNY2S2sPGOnAaLmktSnDleBWuPc9+DbJqyJl19SaqWshcoLI
         hhtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvPx8aRKQlK2PxhIO0EoXfirO0oQoSdzhBRwkE/B6O6Qkcb16UK9mDVP3kD62Q7Fy9EyYhh7AAuQGRhTtkYasT@lists.infradead.org
X-Gm-Message-State: AOJu0YwFHuOtHVJxR3sSaun1GmYz9+zefgxtucg7e2nGec8FWumrOnLn
	mQRt+7xqT52gu/mJujOfrj1tR2/UtQfsr+x2ackNe0fHwLgVM7pvFR9P4Mcb/vvjgJqXlEU58Rm
	Y011wEXk2UCMwN+ft7h+tjeCj6Ae6qc0SBlh4rIf2lN9PVcADTya/F04j7OFzH/2y3PTrC7KV1p
	iSwg==
X-Gm-Gg: ASbGncsd7JnwU1v05/JzB8qoIzjw31kwWiqnQO/b8VZHSW4zg8yrO6IcO7Gn3uQcngA
	FPY7w4BSioshwfb8xGgw7ck2+E+DHQhMNigxdHy4xHMQVThfXb8HPT0pOG7ar5qjq/1vBSKabpo
	fqadNB0AgV5/X2FKyfIE08H0WOxHHPJajhuVnQ2fO2t1zTIbAl3abazhrxIbkm2FKCk62ktzNPf
	tGq50T9HsUp+KUHuYRoNMD4d7ogUN7FS+Pmv+H65sjuIVI4CDUhM3ou+RkYCKVoPofEA8c1y2Z2
	AMyyKj/GCp3drKV+ffcaLnoEmNhO9tVCdi90yi1xlQyrN4HTzMdigljcMtAohDREhv2zmZja2J5
	Vcsel/PBjohW85K1kvcB1cvR0oiCC8zpjr2hLZ04YjX8RFUkY1+wN827bmA==
X-Received: by 2002:a05:622a:1f06:b0:4de:8e13:2ccf with SMTP id d75a77b69052e-4e41ea169c4mr13229311cf.74.1759262779105;
        Tue, 30 Sep 2025 13:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExAC+gjWYrGkYGyC7iuQx0n8IkXtiwE5ml3GBXLD2rdjXMDvnTqbMjAoTH934KEvOlO8Ctyg==
X-Received: by 2002:a05:622a:1f06:b0:4de:8e13:2ccf with SMTP id d75a77b69052e-4e41ea169c4mr13228591cf.74.1759262778420;
        Tue, 30 Sep 2025 13:06:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586048c815asm3037274e87.25.2025.09.30.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:06:17 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:06:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
        linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] ARM: spitz: Do not include <linux/fb.h>
Message-ID: <atoda7fiaw6xxc3arfg2rvczt4ezhravwogbshvca4dsr5kjqm@vjj32eqjxkwl>
References: <20250930112651.87159-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930112651.87159-1-tzimmermann@suse.de>
X-Proofpoint-GUID: DM63e-Y8pdyJWhuMxoAbbibGTbTQnZ0e
X-Proofpoint-ORIG-GUID: DM63e-Y8pdyJWhuMxoAbbibGTbTQnZ0e
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dc383b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=al7qi2xbfAQSSKGDXgwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX3/xjMYmEDSKI
 lwdMQUdIYSAVsA5Vha7IfY1N39dMJS7aemKLezhPTLuJQ+tP4nhIBvkMk/CGm1tyOumPRyNqP5s
 5RpLUnTo7xY80bpJXkcVevmEsvlW+qrZrZ4NnouHiEhrR7YAfjuNbXzS1K3sqP09jS4+R6Jji5i
 0z/EkBNLCI7z2EFhYJtjdBTy3PiRc2rxq6vhjmsn5jIl4EoVzl9KKeu5IGpLuL1FLG0sLOroDiW
 w6drFfOwXYHGvbIcgvGRBXrc3ux91HFDzWMJLBeoV4GfSfue4AwDZZsR9VaNrbfRxlXXX6fUkem
 GZoARKdaaojW3ADLrFBFBeoWN4lu/vE548g1ToMDS0yi7r9NzIgj3dNk1/RUFWUGNgMiN/22FhX
 b0WpTG9bmcewVvnd5TrVmLSk45owxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_130621_278616_1E162B19 
X-CRM114-Status: GOOD (  16.15  )
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

On Tue, Sep 30, 2025 at 01:26:46PM +0200, Thomas Zimmermann wrote:
> This ARM architecture's source file does not require <linux/fb.h>.
> Remove the include statement.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  arch/arm/mach-pxa/spitz.h | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

