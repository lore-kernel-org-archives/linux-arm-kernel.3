Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8527DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFycPb6v8NKaDe6FYB2/8x+ovkGxvomJsSjcJN9pEKw=; b=tX5C6+iObfUIhxSV39cfiSIHLZ
	U/Z1yVNJcX2ope+J/fUzs25hZ2089vO0KPq5vYixAt8wkD38hUCZ3ZSvDL14z/sSitdVIf5GZRNjx
	Cx0JxC9m/HfoDqQiVd7z0O8f9ifEVaxqL5AOe8UUMdA6jhfyQQwYR1/etEt2Yiv1WjmfIA6fKGVrg
	aQKJw2kThOJR9jvzUs/W4nhPKqVWtA0X2VfY3t+iS3ODDzZly6IA8ulrS/w51t5x8x96n1R/jrUCb
	K0zEcwUl4hh1iYJOT/IYaLJkcppd8Q5QSbXgR/qNRrLDiY3bWGgjOdFuHIx8RtZmPYcYU40+L5cDy
	Z1UN31Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d3o-0000000APlp-47hC;
	Sat, 11 Oct 2025 17:07:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d3l-0000000APkE-3GI6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:07:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59BFHpFj030288
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 17:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mFycPb6v8NKaDe6FYB2/8x+o
	vkGxvomJsSjcJN9pEKw=; b=pn0h0OcIRdlCvpvf8AjJVH6nVCXg8NEJeCQW75q2
	dsToMtpqSi+FaPkkcRIipiaBow3F8Mt0xdph6Ty33wqPLR2jpF+MAGyHWJFRDBVc
	2g6SrzzItdXMZJs4RIo5yF3mVzUscJ5f/jt/1v16S4qXdikK6xk/2yBSH6l5Grxa
	AQvyG2gx0K+oz9bWCm3Wd2g2wskZ6FpJ08hr+IkKiXAJKtNQQ2ZENVco/RnbZkqP
	0ycpTVwbCwXLwDB2OXc/DxiGSnhT3vqtijHOw7tdwBYTXNeYQdUS2/J9Fih49Fi9
	a/UE+LUVGdC+a4YIb1jekPmVYnHt4wT42DujL4yWW+rGPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfby0ydv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 17:07:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-854bec86266so933163985a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 10:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760202428; x=1760807228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFycPb6v8NKaDe6FYB2/8x+ovkGxvomJsSjcJN9pEKw=;
        b=QAtS1ZaE5RijGOkG+vgOG8BP0EGoYp1ETput8LHkLUiOkjHSB5o5B26sFx/NPkM58y
         DoQ+eT3Kv7W10N6Oo4Zkfotex8tXy3PZU4+2t58FBIA049SR5YlczHLoJo6yPzjZblok
         10khtwHTacauNkLgtpJAzTmI0qYXs+/wnLZokO5ecKfXGlVO1VGJnBUI9c8+eAAoswU5
         ThWhBwklzaZ1YCooleO87jXnGRu9tjjKKhJgNUPhzUfyjZ+JGDfBJtfJhdGjQvKQtKBg
         qRElEYcY+ftl4ONMvpy5oaJV5zRdsrDFRn+A+bKtWTCjsvTc3o4kKcRiOF7kp/QLXHaJ
         V7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXqVEC605kpRzUSmyZN8VxFzLAY3VWnqifQQxYSSG+woVYAAXSrR51ESuHxOaMKDgQpfzeiQU/8TLh3KatNVEXZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs5XTszL4vmJMSn6c2AKKcS4Q2fBAH19XXRfntlP1ipvYiXQRk
	PKR6wCDt3MN31y8Rlu2HuOGUkXxheP+BJnKUrQHoSWTu2kLMtRN+XSnNhipoaSzkHUyRONvIlJ/
	1v+G57KTdbihSR94oQEpqlLfhogMBHTqZWzXgc+KGUz1H7Pbxf1baVgFRCo18Vtg2AC/e1QybGS
	bWTA==
X-Gm-Gg: ASbGncsxZJSllx1PeLWLnjcDo3DtPHzM9RuZ/9hoELjspwRy6etrSroW6lx9qbeaK0U
	9M4DnbpM6RhdQCLz8meNiqG+NIgpiI2dBEDj5NEbITSi2vNER3nIuGPt5Tmf59Txu1UwBIAxFIE
	ikHkAzaupu/1UBfMv/mf96cULSEEwV647UmdrHDxPNEk6N/vLyi54V7Inrawp7bZiJ6iFpCp9SS
	/z2duEBV8eRx4FDlGLLh/1hZN8/L4JGRkmTSjLn8SyQ+1qJw8k7lQUK/AuOisSp8Aktvt0xEU3c
	to1eH4v42mntV9OF8ZZy4Sl4Tj5kpZ9VPKl1kklffcpmZ8WxIfbojBH27CEQRbAd4RJ3tVVRxqY
	QkmHpRjdLVbuQXpuvfn0u96lN1YRt9LEvKKwjLhMqry0V6+UkgOWv
X-Received: by 2002:a05:622a:4a8a:b0:4cb:102c:56b2 with SMTP id d75a77b69052e-4e6eabf437fmr231238571cf.0.1760202427572;
        Sat, 11 Oct 2025 10:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGnG/nUOQfuTmf4P38ClaQ0pqxIsVT4KwQ6QvBre1kD+zoeTzKlRbXjaxIWC6ayUXFmCULHg==
X-Received: by 2002:a05:622a:4a8a:b0:4cb:102c:56b2 with SMTP id d75a77b69052e-4e6eabf437fmr231238041cf.0.1760202427149;
        Sat, 11 Oct 2025 10:07:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59092ed98d9sm1244485e87.24.2025.10.11.10.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 10:07:06 -0700 (PDT)
Date: Sat, 11 Oct 2025 20:07:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 4/8] phy: rockchip: phy-rockchip-typec: Add DRM AUX
 bridge
Message-ID: <jcmn6n4nbyjsmpvg4q47wxulgddizhiwax4dcb4dokrvj23eur@g3nvwkssg2li>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-5-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011033233.97-5-kernel@airkyi.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8BokhoZXq0aA
 i0x6QMfBkFK3p2eVkV17aRnapAjBxg/QSMqdgGc5mc9gqAVnVufX+SCTHybHcTdxvN25NoJcAty
 SmdIy4dIG8AfNqoTT6upzoRCM9nJqrdG5PoSFeAtIW4rfV0PGM9MFnDN1G0L6/e5Ef/wX4S5fMa
 Xr59/u7RKQhyQEbE+m2HINMFFxgqwfGHuq0vN2eeLTpByG1KwGBGSnx8NmSQnFEjK0gWDMzb9a5
 rcWYx/lEz8fbVOdILtbif9vvYjwhLgmEFGOKEuoB//L0IVC49WoabOiAOkhEOZhFcuHInw2jNaM
 OMP54DCaIFmzkH3qFsWIZMW/nNkojyyK4QbWMNaT9m0EF/LDS3jU0dg1CzEw0otFIUEBelVB9Mu
 SiY+gXjEMWz16DzsmrNcIk/VMaCRQQ==
X-Proofpoint-GUID: riwmoFwcTeVsjRfM-6KnbgopMh-OIch_
X-Proofpoint-ORIG-GUID: riwmoFwcTeVsjRfM-6KnbgopMh-OIch_
X-Authority-Analysis: v=2.4 cv=A+Bh/qWG c=1 sm=1 tr=0 ts=68ea8ebc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=-wB9imSA1xWJEod_rSAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100709_951591_9506999F 
X-CRM114-Status: GOOD (  14.39  )
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

On Sat, Oct 11, 2025 at 11:32:29AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
> device.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-typec.c | 52 +++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

        depends on DRM || DRM=n
        select DRM_AUX_BRIDGE if DRM_BRIDGE


-- 
With best wishes
Dmitry

