Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEA5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRiYWVeZhrzAaBhip5FSqu8NVj+JbFtrHaupfkSzC2o=; b=jQLJI6iv7ecP5AE3sy8WNGngX8
	2wq4lNkjm0L+7vOncFPkCcE39pKoZoZPDu15lm9sQZ2GvwtBioo/X3lGC1LyZcrEsTN7hxh3GDqSL
	jDMDB/aVd4CWyoRKDgB+RvCJbuoWkiEdxIpRup8R54WTu6KVb65Y2YDZjKtHP4gw8mYUatMFeSVIq
	m5zLjRbC8+veTxXZIMjXbv3EFGFiryM51Y8QuL57EdISmNRk0bR+2UNt07Do2fhG0KK6EboBmbN6h
	pvWhJhTc4VAKrLtrjAqQ/rhXhw7QXux5r4vR799UTGO9Ztq/Atvbi+BIu+lEvZneHudnUmi2fxlRL
	8cRl2PKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1Zc-00000008lEr-1uj2;
	Fri, 12 Sep 2025 11:04:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1ZZ-00000008lDa-3xyb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:04:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fOCG018735
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uRiYWVeZhrzAaBhip5FSqu8N
	Vj+JbFtrHaupfkSzC2o=; b=CuqdSLRNCdEV/s+X64vOANtGFRmvkltCIFvt4Ewy
	xOYei2Qeg/sF/VMSdAIlrYtP0/Ce5tdo3BTI8sjsWbQtVqOH7W5E7tPcmPu9iu8/
	eITClcBMzIpIMk2mIyA5aMxHzUroJLDOa4HqHAjHJZnLe1H+ZHZPZz6fh1Mre9dz
	rntPktZakUi3N9DjqD6Cmo/LpbDd3fq5URTE4RmTc8deNRHN1yp+Q9Fm4Bl+2kv1
	P3e3WY3zVsNLoVfrAzvtQ/RwG+M3sqJCf7iFn8Y/AkbrGmSFGK+Mo7YdzGM+Qu23
	Y4ghqbneuIMryL05pvUv4oEoRShSO1sKFxJzjgbgpMvmRw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8akdac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:04:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-76a9a9326eeso7731276d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675048; x=1758279848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRiYWVeZhrzAaBhip5FSqu8NVj+JbFtrHaupfkSzC2o=;
        b=Kcoe8DTfMhyBBPw6V6Hkb8QVTgo5OcHqozIOsIM4v2T60fWMdr4QgURUnAJERPTrYI
         yfzAYQOLjbCzLRMr4twz2PnnOgWPcKgDwANCqlPUmoiYcw7r5iHa90EsUlDvalmPKpPQ
         2EcwoJhEeFSMuH+D/ZPiBGwIHGUi20T0K4SIWUb9647oUgUF3j42pq80KsTT+do+lEyM
         yNC6bG3RKFijJrK42bMozOBVCgVabmdgjvckVlrvMhy41pXhFZhRrm4fWXlOPzGpvUc7
         y4Ls1OQgmc+4RegxCDq7ccmYTRnWDFP0Fz20NEkCevr5oA8ixuPypaUWodNw7jOeAg6h
         0HKw==
X-Forwarded-Encrypted: i=1; AJvYcCUsfHB6UuJS8koSydoQe6nuMM2SWV/ZqtoP6y7w67QQGxUPPr4+8nqqHh9KU0MMFbL+VR7+/bttbNV+DaGpm9A/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq0OgF2BE5nbBXN4WJWeob6pUWn6wnMMbloWpCCLPZ1HfwyuIB
	z0XoOcvLRErFzTCyeo8Vc/N7TG42LvAzWzyfZjse8pw666I4U8Lzg8cbDt1iClfyUcYey+FLWPN
	rgTONaFe14SI0QJOoWyyY8yDsOJ+cl+lekeMPRUZy10ZLxgu7ZItdVtsmwKt08JSW0IwDrFvc/w
	vRm06fD3781w==
X-Gm-Gg: ASbGncu5IvtGB/BNuewmCubmEVXoPg/ODT/x7+kYbOhyyGkaQZxGFeKGDaXelXCDyqV
	/d41mwes+gW/L/ls8tAogj8Tvs3Qil2nUCdIdedCFjQW+fUCbglM0OqBKxrN/6YDRkbv2ylUUv3
	+50UeAJVmjmHO7SbNwjaOyirqm8ZFdoOmhZWWlmiLhwDhmfpzIud5pflULhtkeJPiko0dRYJn8B
	GPcYoU+mFKRM/W3sBL7vFnDVxErGWtPf72tx/fbya+tkYXJ1zGhqa7P3P9aWS4nkhMrziQc/NW4
	9Qdn3raaCKuPrj71RcFYabo8Dlj0Zdp98dz6YvJ7BCus4ZGdIKZb5FVvRDK3QPOqccCoG32ELv4
	PkX7lE+35mty25cN2fmbNZk9Eg26zRKd77FZQ+gM/2PjapbQUNDuP
X-Received: by 2002:a05:6214:20a1:b0:70d:d8e8:c5ad with SMTP id 6a1803df08f44-767c50643c3mr31652876d6.50.1757675047516;
        Fri, 12 Sep 2025 04:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGWK5ie/2oncU/4OssIMnMH7lHSxzphQkEo1qeToGVNk2BXrTzFDbaZYLruQvm7dYwaukXQA==
X-Received: by 2002:a05:6214:20a1:b0:70d:d8e8:c5ad with SMTP id 6a1803df08f44-767c50643c3mr31652086d6.50.1757675046952;
        Fri, 12 Sep 2025 04:04:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b622fsm1079317e87.2.2025.09.12.04.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:04:06 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:04:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, dianders@chromium.org,
        m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 11/17] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
Message-ID: <xaasoza4346jao6ihbdb4payecfi73qekaynkfa2vqqdp2slb4@2onoar4qvw6c>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-12-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c3fe29 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=RmiVBL_TxkOMKIEFt2wA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: LJMlTT88iqGEhdOhy9nSrXjgyP6zg3Xo
X-Proofpoint-ORIG-GUID: LJMlTT88iqGEhdOhy9nSrXjgyP6zg3Xo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX2oTOhcb8aoAt
 gZy3MqZcDFBslOCMZvyUehD/vGf+TqYR6cTFoomw8Li1h4UMUgFvl6FVPrvLj8i1sd0xhnjK+Ov
 vGK7uss4sfI1W7wEohDtoBM2OGFBxhgjIDrHxMSv74I8v8L8asQKlo8WFzhRXbvuKhy78ko68Bj
 MZX2Cx1T6oE7SzqTG5VUPu9W2PHa9etz8x/Ev54oeC79XM4uBtdivf4tW7/iakcabZV1sVQxTOs
 Y74yM/FVcI0Sejn2nw8iL+z+IiUuf7kiZbedVDQldtg63sZIfkpUWu26u1VkaWeJj0bXjBksnNK
 h/FX2wkQ3t+bg+pEYq5xeoZVsSSz99yN3hg4DJo8DbJEn/3bfbGWWzMlcT24SnBT2YNOSumQcDV
 AZrqad7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_040409_982428_EE76FD92 
X-CRM114-Status: GOOD (  14.85  )
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

On Fri, Sep 12, 2025 at 04:58:40PM +0800, Damon Ding wrote:
> Since the panel/bridge should logically be positioned behind the
> Analogix bridge in the display pipeline, it makes sense to handle
> the panel/bridge parsing on the Analogix side. Therefore, we add
> a new API analogix_dp_finish_probe(), which combines the panel/bridge
> parsing with component addition, to do it.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

