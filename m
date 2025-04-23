Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E38C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDO88YLi7hpWsK2u0hPMTkEsgQvBzxRt+jPQGFOJ+w8=; b=cACzZ4qISFS58nQeDgdsAf2Ps0
	bUQhIAanycsMNg0/JxAfEPW3WTmaYdvUkhNiqLMabgaA0x4y+HRKFyH2OidOQh274R8A0b5Cslaz+
	vvZzneUPsTqCmk1aa1/C1KnoI31l6daWCSaqoNlqiYBr56Ln/Q2886CYrHYAHKfcGG4FhJ54wIteU
	0+iqVlTNBwsnJjezVf0HOYZtk2FwfVLkncRcXO5C4nzdjvUvTmWIz4SzuY5IS8nFoCJ3Bt2VN7sCZ
	bi3eeLwP7tEx+2gAH5yBxH8XnFYdpGjc4yMEOWnm4JBITkS/PNneGo+Tp54xCJ25KQNJZu+4MYzC2
	qYaFNYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eN9-0000000BRye-33ZS;
	Wed, 23 Apr 2025 17:58:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dkI-0000000BFIk-3mw1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:18:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAXjDj022437
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 17:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WDO88YLi7hpWsK2u0hPMTkEs
	gQvBzxRt+jPQGFOJ+w8=; b=IekQLsG2extxrqNLyKp5XBR0b6EvA524PJBBBKYR
	QEBc7W2dgxFPPFKocappfMI17JugezOKVFv1q0i5PgtRgi3QQD4sr4mXJof7uQV+
	+H7gEpHRlszCWegkZlyi1qRH01EnHuY+sanHCurwJmDK78nCF1Tlqs+du0HigG/h
	FJM6lFGCFvCvcLxMC9pkdZrV4ygOaX82rZHQQmgSNk1Blzuoad+mdywya3erwOwp
	XfgMlca6OU8lkgJuq98ORSXj3mvY0pFHyLF3b1L0m21EGgV/4bPtotEmyzjhx6Gc
	fgHLEZwGrIjzZ5jreKSGsLFHhwuxKEK81OdNKpObQCZSBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2aweh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 17:18:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c791987cf6so15949485a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428728; x=1746033528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDO88YLi7hpWsK2u0hPMTkEsgQvBzxRt+jPQGFOJ+w8=;
        b=Y3+5+aaWzDWCgTZmNFLCAFZGxZAT8dxwD65kbqbKRuPPohnkTB0QNSzK3hWvd3+G6U
         oK0DBvqgqpSooaNiKMtHtbOuf4qdwLkoXVo/bMF2KvlZ8ySZKMxwSsuhfElFttw0pPs8
         yNBG3+prF3ndklsIHRT1oBbm87NEVJhuINuGANSe4WKrh+GtzDiz/6JuuPEocGi3/sD4
         WRT6vnRZduEGduBN5k3P1/UsqfSNSjlyooHN9tRhkCGEl+nodT2sg0H2uEn7ZfVvWx/c
         j0hFnD4bF6cWQtrzt9umYlb8Y7+Ny9vWpNTemCJtMT2biZ9haFIP72XbIMyiEeQxVD0L
         gZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2wUbag3Syq/OHfILTz/nWkqLO/ZbA3QRDBwcE57kgz64YGgbwSgbTcje+97TeeMfFDs+9ET3lkoy5jddGCmqB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8XuJbQqFRvQ0iQmmTCs8cPOCxdkl9+jYbcmsj0f1mhxNliI69
	SdunfokxTx6hCS3cblkhDov3ZED6bab+7cmhReMZChiQFqXjxFghgojlSImB4lAAClwh2MzqkaQ
	2Vjc4fxLJaIHlHar7OB2/JFMST4kWE+1kF56hP1nYikKv3+R0+CRSXSTWwwef/735OXMPMQxKEg
	==
X-Gm-Gg: ASbGncu5PF6m6EaBBuvbLX3BIRdvm58shGMXESunr/VZZsFjIct1nM68NX7/PbcXYnO
	0IY30/+OeKz6KZjrCkhmWdC5SBY+mcIlRemBZaGjQDPqC7VfDiRtousXX5ze/xlVT0/6ROXQttI
	29o68bgQfA55dWwei4qcUqtAk/BLfXiBIHjch/JNBLlGLZtY7kbhENJJkEH2nLCxHxh6JELlwyo
	87mkIkWhGRsvrooa7Rs9ZNMLZW2zFZKAOCaw1K5uqnzBxeGTrtxH2MPKRU+IgX1/RUnYxbM3wjz
	EPNfC/DnrIwbSHM+IrDckFPe9WTzCjz2Rv0KwMbWbcnOUyCBub7UA+QP729bhfDlXD5fhcti9hU
	=
X-Received: by 2002:a05:620a:199d:b0:7c9:2612:32d6 with SMTP id af79cd13be357-7c92805fbe9mr3542965785a.48.1745428728653;
        Wed, 23 Apr 2025 10:18:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4YRFe2I2adKtjK/DTqagD31VvQyfxBA06e/fj1CyPoBrdGi/d4dL6lTARcuXkFMIqRSCSow==
X-Received: by 2002:a05:620a:199d:b0:7c9:2612:32d6 with SMTP id af79cd13be357-7c92805fbe9mr3542959585a.48.1745428728212;
        Wed, 23 Apr 2025 10:18:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090826cafsm18525361fa.69.2025.04.23.10.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:18:47 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:18:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Damon Ding <damon.ding@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>,
        Heiko Stuebner <heiko.stuebner@cherry.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: add CONFIG_OF dependency
Message-ID: <a4tcrxepuvvxixpab3txz6tdbh6janiedjqddl2ybfo6plhjcl@r5bxdabuhjep>
References: <20250423164422.2793634-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423164422.2793634-1-arnd@kernel.org>
X-Proofpoint-GUID: 0t6t1hH5jE0zFDVh8PUBZqh0e4TH4yOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEyMSBTYWx0ZWRfX4jVUsUwNejQl DVXYjF7bTeR7cTspUr4EnwTOKjpV0QFU5SBEXWPeE4Dzw4X5/ddfh7ygZ5TcNb5HFptdR3sjGFn hhmiwP+ipFrEpyw8at3iIVelzJYUimM8M3nG6hpWGx3X5F5Rn5ks4tIJOdr1mSA85aS1SBJqkp4
 XhTobHbZm61LaqnMzVzhqqZgvjx4gakAyR+uT27ZJGVhk+fkJHF73XZ4HkXIufVR3mFj/pqiWOd Wr0ryczbv/wp9EF/XqTeVCUQ94VLEksx9gvJJNKlWQyWZS6rmNmH4zS2hhynHdntx6sbI+yz9Vt 1jdrCirsXszvXfVtzLum1ETcbRv1b/dZJTlhxoTUcHuKavkxG/Y000v6zA+PaYSowGCsilCBI0U
 GCht8E/sxqj8ft4ZoBzok2xHJc4juC54xlUAtq4FgYaK30FddvpE+T0EeIhEMHLMA5hp9b6y
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680920f9 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=8SeTOrC02ZtG1eAnSgcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0t6t1hH5jE0zFDVh8PUBZqh0e4TH4yOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_10,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_101850_957933_F605025A 
X-CRM114-Status: GOOD (  18.67  )
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

On Wed, Apr 23, 2025 at 06:44:16PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> DRM_DISPLAY_DP_AUX_BUS cannot be selected when CONFIG_OF is disabled:
> 
> WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_AUX_BUS
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>   Selected by [y]:
>   - DRM_ROCKCHIP [=y] && HAS_IOMEM [=y] && DRM [=y] && ROCKCHIP_IOMMU [=y] && ROCKCHIP_ANALOGIX_DP [=y]
> 
> Rockchip platforms all depend on OF anyway, so add the dependency here
> for compile testing.
> 
> Fixes: d7b4936b2bc0 ("drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/rockchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

