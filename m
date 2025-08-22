Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C0CCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kF+UHt3RQZ9sKwYUnht3JJb3AN4kfQFQklzuuzACdw=; b=YjnioG7/gSqlKp6Hv+PyxJkH4/
	S2IGYEbQ1xPoRe3fyoDbfC/ClqyVm6fvZTlcd9vdymm9yTlUWT9xJrDOvszURjLbPmayx7Q5bfsdE
	q8iGNppqeDVgeGACbZ2EmzGFVjDJUdfskyAC98lLMHGc9WR9+cytwiBm+6GmlrGtegoWoquTDd3nm
	xrrGwPN9ChpnEmToMCiAQChkdrcg3/eDkY+X5Eb2VJDuiyANNS8rj+VGjzbqpzc9Oz42V/OPAde7P
	n8RiXRTUxmCIAtF36I6AUrZx0LGkekGal3Us+nAbVLYS5pXJHe71K+UX/QmegpMDYBuNx49RUALif
	upBt/KHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphxh-00000004Eyo-2OCy;
	Sat, 23 Aug 2025 06:42:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upWYh-00000003JcH-3R0n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 18:32:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHUjYX030174
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 18:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2kF+UHt3RQZ9sKwYUnht3JJb
	3AN4kfQFQklzuuzACdw=; b=HKw7bP4SgHZje4mEEpfk1z3YhOK/4j7A8Fbaw8Tz
	6kTekaTVK50xtp+mTMkKWGprk7V4i8P0sQf5OjbCSXWdLGDPBye6e4Hh6fBp1dMz
	ewG1ZZXU9izkXM7D9Pp2cI3SzrodO0rSr3TMaXkT/pycqmbaN/9VSohd6q+keLQ/
	9CPEiWVBInMyX6j47qsl/ihYz6zP67lWJS+NqpmawHwpJsoIHlFWRBwroJbZ3COy
	YsuXRwXtV7QhvgROmphYmH1redEOuP4Al6568+u7qq1a4BOCOZZv5L43i+4fPTWG
	i7pzLbLOaeezuvqMUh48mTxmpkRSG7SgJ9WdfwlsdBUVog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw0yr67x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 18:32:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d7c7e972eso56248306d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 11:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755887534; x=1756492334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kF+UHt3RQZ9sKwYUnht3JJb3AN4kfQFQklzuuzACdw=;
        b=py6I7tp7JFzrVTHQ/GX3W+V2gF3H/0FmbQ8fINC3s7URpgQ9RRibT/C+Mtsjjt6q4a
         AH2+NxUdk2rJ3o3NOPYGHavGmyLx3GTxHE4lWxQSXKpIOnAopWBVqPcf1QMoiaF3sWLz
         0EHaYR2fsC7bD+ePbZad6yw1bkVMkw6N5pCQjowBjX0j1zhro/t48DRYUb00kpThsGs8
         eeZT1beSWr98r7TD2jzXZJga+nUhcO6sE9arzgDrJrj1ip/NN4kvKcqWee1MYu9P0Dxc
         pWwGd8eC2lmlrbx8krwFeS89Tl+PjLb152BMaDX0SIBNldUZmij3+dPf4RGG5fhilPlr
         RN+g==
X-Forwarded-Encrypted: i=1; AJvYcCVcqWa4w/WEd3zhc/OSQxPdzn5xIpClqmyW/Qw4yU0oU7c8abxgE+vHLiwE/R1xAET5n8NaB/8UOH/iT+ZfVzK+@lists.infradead.org
X-Gm-Message-State: AOJu0YztfeKiHaqVDQaBCspUWjpFlcW/yhMc1qVDCQXhTCLcgnsydaur
	83R1LNN9Q9a81xbU4cDR4zoJI8lvTjZ7nc6O0iY9yerLJMPt6KL85IbI9Zwe/bnQyhJpZLYf2uC
	7Ka3cFQokQDdaxbiyP7SteGVJOgLVGYnG6lJ3s1bfAxDrTS67vMms3o3wRojwGtgXYMdJVdu7Ou
	8/sA==
X-Gm-Gg: ASbGncvfTAZLrn2KWYUX/cnpdSbFUcH3lf+zxB82oKDInZHL/yg4AIkJfb/xHHlOb46
	Z2g8yYkYp3pzZk4y4/p9CWZlT/8KjS04TRds93o3d2H83B33DmSJeq4enn4CjJ2jS12r92+Qw7V
	H8Kg9+neW6iHSvursTEwpd1Jg1Qle/IpHK/H3KBM+hLpPgfFtosVTTax4Ead5sj5rWwyBe8z61v
	Jrm+r2tfpCIlXGt4UuJtK4IUdJt1wjk16ZIdo99vCmRdj3fcxuGtzOdbZ43f+cXILDtTs4cZ02q
	+OBjctAHiYwslS4YI/InHhhjVMyhgcQqNpySFsLD6fBoZEyxRC0iGQQZakY83wEbuTPtQ44YmAN
	rm95FaMh7Vnb7doVJeGDJ+Jihsoyrqoc6lrYagpKiYvf4zmd/an91
X-Received: by 2002:a05:6214:2463:b0:70d:8549:a9dc with SMTP id 6a1803df08f44-70d971ecba5mr45207826d6.46.1755887533678;
        Fri, 22 Aug 2025 11:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGUwecfBarwnXQpcnjnUt1xcMPQBcCSeakWpQc5KmvE+AdTu302f3u+QjNzhIWHgctycCfdw==
X-Received: by 2002:a05:6214:2463:b0:70d:8549:a9dc with SMTP id 6a1803df08f44-70d971ecba5mr45207446d6.46.1755887533192;
        Fri, 22 Aug 2025 11:32:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35bfcb27sm96296e87.19.2025.08.22.11.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 11:32:12 -0700 (PDT)
Date: Fri, 22 Aug 2025 21:32:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] drm/panel: simple: add JuTouch JT101TM023
Message-ID: <4gyzjoshra7mwkagkhbk2uzxsfeb57ufkr2qilppunka4cem7n@zf7rm75hdd2n>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
 <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-3-b492ef807d12@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-3-b492ef807d12@pengutronix.de>
X-Authority-Analysis: v=2.4 cv=Z6bsHGRA c=1 sm=1 tr=0 ts=68a8b7af cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Acj4BH8ZA6BBt8B7gSkA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: pV6KTu8RlXF6Z9uAtgG3W5a5FyJpvIhT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX4eq6vyYFKB2G
 z1k4W0SfjijCUZOuyA3LLNUGy9nn23EsweR/usZimqF/DjmXuKoYOaVL7Ig1uFj9QqH9yRrGMWj
 HXwFeqxS3jALkYMgufMwOkHhiFQofI3CtOcCpP9J9es2VxYGzKuSmG1Ww60ZbsIuOC42k5+Ej44
 1BucK5LdFtseitD8hhDOAPdeDOvEPjd7W52b2Tbzl9KS4rQiCRQ4fsgnscHchV8FA7T37w0VLUx
 nDc/woNdOYmdueOhP9R6vn8DdIr0ZTwFom41sy5Fj500ljgyO/4hjoySQfU5JeR03OU4vwhfjEd
 Sw7w5hQtQn84EtTntredjVYqEtq5t42l7UR75tVuhMud6IDufUwRgP6LU/dKnBFH9HkcEBeb5dK
 q5Auaz3w
X-Proofpoint-ORIG-GUID: pV6KTu8RlXF6Z9uAtgG3W5a5FyJpvIhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_113215_859956_59423E8C 
X-CRM114-Status: GOOD (  14.54  )
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

On Thu, Aug 21, 2025 at 09:55:30AM +0200, Steffen Trumtrar wrote:
> Add JuTouch Technology JT101TM023 10" 1280x800 LVDS panel support.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

