Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D79C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=; b=sSx7OzmFtlQWeKfJGAlZ4spr8N
	OdsuZl8TI3THxd0vhiH4nDlZ5B+9p72w83QNSIeer98SoDNw1JwbwJPSeQTq3P5b4YOBw8L08QzwZ
	k1O7YeVXHUvNgI3TofGqDsrZESrp9tHrD5CK9xRHFv0DYZ0vrtwGnue4KL77FUowusDT31MkK2nM+
	X7cns/4I4CFX+5rsgWE1o0BaEkpQnnobdeS1X4dGoZPH+74ARzjTMsZfjRcLWMXvb6jch9/Qjnrzd
	pccloXn9eA0F0C0OmZgPxj12aCBD2tLbCy5C5GSuX29ZVt0IUOwWny+NCSJuRdmhlCZ0vLGoj7Pgv
	eGodt+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7c1v-0000000F8ki-0Txk;
	Fri, 18 Sep 2026 17:05:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7c1s-0000000F8jv-2Tj8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:05:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IGoEGW1666279
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 17:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=; b=WMMuEWXHWJBv/taD
	f9QZUlE46GdUzuTjYYf/C3doWA0kR+Y5MgruXgzoDKrnaUUWblDlcnoq62X0pGZb
	/qbl9/Nh08g2JIywKdvQgqoIFODG95dmBYMwKhKE8pfH/9GV1s9uiIZ/ny0o1Ct9
	AxCx/8lN1sOSKnfJuvaS1JUg9GiNW/atd+A2FpRM9LBALe3ZTIKYfBJ7XUzkVsAm
	/0Sfv53h7nA91Txh3LNTG0XJ02vyxwLdjN4jnrj+2hSOYEPJdtabTGR3PdaWxCxi
	qwYwhp2WIMT4a5wkgjtCyWIgf1y9m/+GKe3lh+g7l4PT8AQ6cRmW8HyvIVAcaiX9
	oOwVlA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2txtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 17:05:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so12720375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789751138; x=1790355938; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=;
        b=Vetpj/tiVLqzL7FOj9EQBe+Oxyervk+1e9W/mfcb4QMGlc9mSoQwcvYz4lgJg0QNie
         ATMdsV1HsBf3M/anLwdyuPmJ1WIifp1Nw5kue4Lh1ZVNPrv9/7yaOIocOSFDAiZmQl5R
         rG9wQXTdOj1H9qnAYWVqLQvJbR9iq/SQjZKbatScGVJN6CKl5YJB+MAriVPunEnpFcDM
         g5npgDWhBjm/83Sr/yBheVH9cICpi6PbFtA4V9T0J3yNOHtP43mmkX5+eUENbDtgQXEy
         /gcDB3MkVLFNxSoMETvg36rYN8gPua6bn0BG41/TSGIjpangkbdTUdhc0MmQbcRXQPSr
         x0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789751138; x=1790355938;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=;
        b=J0KbGQnik0DMPlw4z/rUQXbydJ1vj+/mF910Djjwm8mw3GiRxpSJoySMKGMQOK2CIn
         4uxqt5EgjxaUPOk00mdgyJmyB79kI9ukYiRw1dGNezx1x+BIg/dQMagIYyBqa7p111bi
         95/cAwW1lFDw3Q7nezdOL6nDKezo3NzQ6cjmzGdmzRQyAuFo12FzCccy5xbcfsCZsPVW
         EC6Je/7fH/CE5qnE7o7jyDX5a7qau3+J+uwBH4xNSD2iPkaXGrYEcgOU4hTP5dhnXfQp
         VEWqh8m8RjX+a4LB0/Y6vzNN/o+aTSvdpHGhFQWKsNOqqPTaXEX0rrkuyQqJoemYMAtH
         mlLg==
X-Forwarded-Encrypted: i=1; AKwUvByJ7iuZXBb88V/CYN7u8BxwEd8wRWz+JB7D952Yu/8LW4zB+vqUp4zqL+mg8NCFgnjEBBPfYZJzaBHTq1lZ3hOW@lists.infradead.org
X-Gm-Message-State: AFuF++k3oUGokPagFtRpTCx6+FuXHM9EMDNRIGUr4aA2LPtwHfZDYgk5
	UGN80AxKKhnNB/tZ0V1opAZtKQCMLYhp6iWO7Xh8xTjAaL2NLi1/SPchVi3ygw6TEUakhn84VW3
	BazkqrT93tN1+h5f3KJjV7Lff/KTUDTZkb3o+RJ3BhTk7H5gvocoDsB/bBJzRCB+VwdB7vDmH3k
	wxVQ==
X-Gm-Gg: AYBFou1kh7ROk5XSxt4zCGCuJDv0PEMyodVFCQ3nvdto7lzl/NQ9QgbTDYyeFT1ZP1R
	nyZnFx4krGfsQnaRtCbBcvPliQTtAbGJB6M+Y/p2Z68ytzDJ9fb+QOiOnlEbVODD8Zv11sCvFrr
	ApsgQtWRL4GugW2a3FUr1c7kFczbAUBr2Px3IMuq/XFxgvZmlcNG8Bi/5KnVH5VREHHK4bOKBNy
	3VS5YfMbTJgJZPbEN1j42F2wp6nvnU4XiHHK/WNFqd6ndgSgT58Wlrw7u40sY7WyA25KFp0LIaB
	DmiOX63UzlPYc+E0xqSfKiNjtXeFHKixW4v+xf4fmoSJwAnU2IopFP8De6awIkThVqUdsAocYs0
	wQWnuOg==
X-Received: by 2002:a17:902:fc50:b0:2dd:c053:e0f6 with SMTP id d9443c01a7336-2ddc053e13emr7876585ad.37.1789751138499;
        Fri, 18 Sep 2026 10:05:38 -0700 (PDT)
X-Received: by 2002:a17:902:fc50:b0:2dd:c053:e0f6 with SMTP id d9443c01a7336-2ddc053e13emr7876085ad.37.1789751137947;
        Fri, 18 Sep 2026 10:05:37 -0700 (PDT)
Received: from localhost ([143.246.51.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75ae73csm11519845ad.57.2026.09.18.10.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:05:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 01:05:13 +0800
Message-Id: <DLILTJ12IX36.15ABZZEUMTL59@oss.qualcomm.com>
Cc: "Ze Huang" <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin"
 <abrodkin@synopsys.com>,
        "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew
 Jeffery" <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>,
        "Philipp Zabel"
 <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
        "Marian Cichy" <m.cichy@pengutronix.de>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Maxime Ripard" <mripard@kernel.org>,
        "Thomas Zimmermann"
 <tzimmermann@suse.de>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com> <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de> <aqpJKSSKunElnQ3o@houat>
In-Reply-To: <aqpJKSSKunElnQ3o@houat>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI0NSBTYWx0ZWRfXzP7+i/yOXHkl
 R8qUEUBz8xmH+n2Cmblz9rRKt1uDdalw2Av/mkaid7iwYWxyrMbd+2+V91EUHL2iz5+2cdzl+MW
 0fa3scksoJgATj7Ak8HmfxdkuB/UJYk=
X-Proofpoint-GUID: lSPj9lZxkpligTbYaxRDZquX_kO7-Fq_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI0NSBTYWx0ZWRfX8BoJxyzslr9K
 YmDGg2WtYJRz5D+iCpcGIyGhFK1FkUl+acr9aiWB5hEBHQZzfSQ72nKgeC3p3x8RYzR//a/RmT4
 3CjRLi5/kO19p7ptPnD0trhPUMvLyw+v2X891136ky3Qc7hY07C1g5dGKpVUtX8Q/cAilXrl1Sx
 iFp4hoP7OKZcf5BacZMJa2qIPI+i6qRuZj4OSq9YaVQiaG5mqqjdLO25DV2GIsx2iBX5qYz9cD2
 lA9xroCdtT3llnf7QPVvNmjG7KcA4THXwqHQsguqxruo0woRg2tbQK+j3zH+E2UnX/MnZ7kDuTG
 8UyY1ISFweDIU9WBx2/bgdBje8KXVBwQqq7ah4eE4bGczQeHUAt9lZTR5tFnXki7GCgyyo1YPar
 gsXYHuryMrVmsIGT2noRTOehotsIGV9zxsDeVq78rt3tNkCS/jJN37hIP8jaaXQh8A+uhDlt6Pk
 P6dV2UMiNnFkpZC4CkA==
X-Proofpoint-ORIG-GUID: lSPj9lZxkpligTbYaxRDZquX_kO7-Fq_
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aad6f63 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=IqZAcGRvIuv5jEvzszIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_100541_029212_0DC38873 
X-CRM114-Status: GOOD (  13.89  )
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

On Wed Sep 16, 2026 at 3:46 PM CST, Maxime Ripard wrote:
> On Wed, Sep 16, 2026 at 08:50:21AM +0200, Thomas Zimmermann wrote:
>> > +static const struct drm_plane_funcs imx_lcdc_plane_funcs =3D {
>> > +	.update_plane		=3D drm_atomic_helper_update_plane,
>> > +	.disable_plane		=3D drm_atomic_helper_disable_plane,
>> > +	.destroy		=3D drm_plane_cleanup,
>> > +	.reset			=3D drm_atomic_helper_plane_reset,
>
> Also, this needs to be drm_atomic_helper_plane_create_state
>
>> > +static const struct drm_crtc_funcs imx_lcdc_crtc_funcs =3D {
>> > +	.reset			=3D drm_atomic_helper_crtc_reset,
>
>  and drm_atomic_helper_crtc_create_state
>
> Maxime

Thanks for the reminder. Will do.

Ze

