Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F53BFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixUuUGkcS1ogu+Ork+yFuS7WctoV+chAiSQKyR8/7As=; b=YR+UQxLl/eNu0Hn5cZ7rbIxV5P
	DMAmRn7RR6nC4A85j87w87rEHDMuRKT99WSEfLat19xEE3xlc9zf/2VYlnqz9a4ZyoGduLcx2IRKE
	t3TFlK8foc5ak63JRFkhDJtra8jBce8PKdV43PRhEaKo1LCOupw/fgOiRcZUYJgZIYChJVUq60AOQ
	aZtC4Xp+UvQZWZr4IWlfLdCY5irSqwGMCPQhiE0vDLVE587QxJJdCQPjTPZW8X6MGvkLxuREtR4wP
	GJJlULfC4Uj0U5HbEF0xGcMGShq8zQFWs2SwAFHnITorLhD6i/s6ksMBOxfDI00DWmvJt44EPL41f
	OoPoiADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdvs-0000000EVnW-02MJ;
	Sat, 25 Apr 2026 14:24:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdvp-0000000EVml-0FCM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 14:24:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3K30o1728372
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 14:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ixUuUGkcS1ogu+Ork+yFuS7W
	ctoV+chAiSQKyR8/7As=; b=LV84CZbJ73kJp0FekAB/P5MFtE8cPCFmomVJgA8/
	HltgsE2+S3s8RndEDZoWzufhFPhHv9rrTgYsJVLsGLo9EfW4ZKo8Uy/7t5E2xpL9
	r/Ul/d435zV2Ukr6cwrKZi7VfHBAROBA35u8rKTxC95sVgHDQ5UeGZssUWcjIoal
	IkKHCnmJZJZA9T/XMO6yG8pOqkkf5cyJC04dmRMJTe+iyDuiAPrcutLRx2ixA91i
	nfrv/Mh/xsbRLLxxbY9tErJ8BxDhdbPMPHU36B9/DROKtbLukDyzJNwhu/SofGbU
	E0sK/QMRT0pTpQgi6e5k19Jh+GTVN3UScVIEEyLx3+Ef+A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx94d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 14:24:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b220c72bbso220268101cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777127067; x=1777731867; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ixUuUGkcS1ogu+Ork+yFuS7WctoV+chAiSQKyR8/7As=;
        b=IvS3pEjK7RngPx+g8z03laG3p/PjzqOJkw8a83q0XoLYkVZ86QmVzH4AE1sN6rge4c
         wW2auzI8AuMWe8rpHbjBDbepm8i4SMCead7GC+bA0GvJVsSjNOqJDG+SXpA5xbww0G41
         xb97Zj2UZS7+S84nda+0eAEAn4J35CQiS05nvHmgrMarspb2sl3cLH0P2Awafoch5vlS
         l7WkZ+Bk6lFAGNmxNH/3dKZoOuT5OhBM+Ez1wUS3fLScwNJEmIizDe5oX7I3StfkyUHy
         Uj+YqWmh2QzB4lDPFWMIl9LY2K4RX7yTo21DPq1k+P1HVYsAVOyzYqjVN9Hr3KoqsXVG
         JPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777127067; x=1777731867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixUuUGkcS1ogu+Ork+yFuS7WctoV+chAiSQKyR8/7As=;
        b=AJLE+G+49nB3v3Pi8xrd5MegoaOwUlCxsPFllmVr2Y8V6RWocAzh1EBjv3zxcmGrfA
         ORYnN1+5rxM6Bofl/d7piHiosajMi1Z6wFpJVC0CRmDYHYYcP8smmxF5gwtQdhkQi9Q3
         WV5o4F3Yd2TXw615FDts02/IpUDeHwsUsZUQgYcoXEf2VYbq7oJDQ/OWlk56Lhwj9vSB
         hLXm+uhxR/4spkCM7hN0dfizcWHeKe5ispm3jCWW/SazaltVpxdFz4BasmiPXzQ2I/Uh
         3tkVB2XOx5fAMrF4xRADQtMbR9dAZg0gAikgVuvZNSXCAieoOgzZx6tPcHa8zjb3e6UN
         F3lQ==
X-Forwarded-Encrypted: i=1; AFNElJ+z51Arsro21ZD4D9CYjuiaC6FQog6NJx75rAQo3jwVovZPcXX0+moq16jqXICeyV8asIbrpwhwcp07wjEyNW8o@lists.infradead.org
X-Gm-Message-State: AOJu0YxOrDB2F0MkG5/qc6DDURQ0ZDCIJig2hwwnGUCSmZJWb8ZMcQvX
	8jhtdHcWzxV/cguDCfrprS4WNSChVLNWM++XsNZn7N1BBeIZBeZtj6J+GCUtLie8PQTxMVq5iNz
	nbjroWuY6j644wqqqlXdNY5chS+P22ex0HcP9O/ED59ZMyT7Bz0R9AM3PEuhhpP/QzkwehvtxMq
	eRRQ==
X-Gm-Gg: AeBDiete8To3gB0LHjPQxD7Ub6wMarc/kM15uQzgjz0lcMZhW5noPcxwtEnx3jxejdk
	602rlChlYPJkW2H7hg6gBkLwlU6ukWKJCkKSs0JPR/iW2gaZ0SO0D0UWtmZKGdbWRdBuFc/HcBL
	8KtW0RemqJbc5pMICu5PiMtF5KuxeArk3d3xfosE/yQq4wMAELkoJNqwssRtJRXXFVi2CXKf4WT
	+VtN2EYMqENwiqd37t9QO9B92uVI6BtpJf8D/woJDSrCXG2l6rWH6AD3lQ4vdVUjutHViuR1u4X
	KdXo1O7UM3VQQp+ajcFKaH31L3gfpGIzUBPc645T8qGXmFg/dOPxwVXbZxtoipo9U71xm+7xZ0+
	Aka1XEkqIYYsajuuF8WeKyWsFBeYnbkf9y5XT/vImEr0gum7sSjRSnBDfOcXbOpS9VwDW9zc2EE
	0wxRq5/qq+P/a6c17sE7Nlh57N885WOYBpGCH+HOZ/IDVKDA==
X-Received: by 2002:ac8:5dd1:0:b0:509:965f:888f with SMTP id d75a77b69052e-50e3669f7a7mr531573821cf.0.1777127067113;
        Sat, 25 Apr 2026 07:24:27 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:509:965f:888f with SMTP id d75a77b69052e-50e3669f7a7mr531573301cf.0.1777127066688;
        Sat, 25 Apr 2026 07:24:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1116sm6909552e87.54.2026.04.25.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 07:24:25 -0700 (PDT)
Date: Sat, 25 Apr 2026 17:24:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dennis Gilmore <dennis@ausil.us>, Heiko Stuebner <heiko@sntech.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>, Alexey Charkov <alchark@gmail.com>,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/6] drm/bridge: simple: Add the Lontium LT8711UXD
 DP-to-HDMI bridge
Message-ID: <45evt7lkzuykoqsc2z27hsvm7fasmn6sr6gbjtdnme54jauehf@dmvon2o5emzd>
References: <20260425031011.2529364-1-dennis@ausil.us>
 <20260425031011.2529364-4-dennis@ausil.us>
 <20260425112844.GB2964234@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425112844.GB2964234@killaraus.ideasonboard.com>
X-Proofpoint-GUID: 4ViEzOwXQF-NXtyuYeKvFQsl-AD1ZirK
X-Proofpoint-ORIG-GUID: 4ViEzOwXQF-NXtyuYeKvFQsl-AD1ZirK
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ecce9b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ssO-rxKZoUVbP6lRNB8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDE0NyBTYWx0ZWRfXw6AhYENz8KyD
 YcfcJxP1i0UtOEfLW8hYqsp7UscZwJpajrLL1mOyS/dRBTgPyijdBqyRLhfN9MxOSQszC7p0tei
 EgpeEM4KEFfhYiSdQlRCt4GdFTY30qaMZNPXRqTDjF6cXRyyKcD5Py9wgQ/9HwxVc7ciUJslKoF
 VR+750ey/A2RNpN4660TOwEL/9bqMuzQ8ab03G4KgMSLCuPYSEl4VAMUiuU+6CM6982Da9kh8Zt
 ht9uUD93n7s3wNajgoIlD5crSfr6zZUObRaSe7oqk/AFxKY3ZwuCJdF11nVJWfzVkejFamyOzC7
 SOly0UrkeldSgFydpDz/8VsYRzUSlFzPRUwZYCNmyqqtVT8N8VoRMufu1G+UhJjO9wtJOLoEQg3
 HdZzqyAg7hE5+pIw4BjymWKX7ZklKd9mRvTcWzm++zsQ4n2/Y+xjTxJSUj5IiIDiA8UB31B+cOa
 tRBPmye7A5BEMFoTB7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_072429_206777_17C35C6D 
X-CRM114-Status: GOOD (  26.93  )
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

On Sat, Apr 25, 2026 at 02:28:44PM +0300, Laurent Pinchart wrote:
> Hi Dennis,
> 
> Thank you for the patch.
> 
> On Fri, Apr 24, 2026 at 10:10:08PM -0500, Dennis Gilmore wrote:
> > The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> > to HDMI2.0 converter, designed to connect a USB Type-C source or
> > a DP1.4 source to an HDMI2.0 sink.
> 
> As far as I can tell, the LT8711UXD has an I2C control interface.
> Shouldn't it be an I2C device ?

From the datasheet:

The device is capable of automatic operation which is
enabled by an integrated microprocessor that uses an
embedded SPI flash for firmware storage. System control
is also available through the use of a dedicated
configuration I2C slave interface.

My guess was that it can either be an I2C device or it can function as a
simple platdev with no I2C controls. Please correct me if my
understanding was wrong.

But now looking at the schematics, it seems to be connected to I2C6.
Which means that it should be desribed (and bound) as such.

> 
> > Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > index 8aa31ca3c72d..42c1f3d5ba0c 100644
> > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > @@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
> >  		.data = &(const struct simple_bridge_info) {
> >  			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> >  		},
> > +	}, {
> > +		.compatible = "lontium,lt8711uxd",
> > +		.data = &(const struct simple_bridge_info) {
> > +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> > +		},
> >  	}, {
> >  		.compatible = "parade,ps185hdm",
> >  		.data = &(const struct simple_bridge_info) {
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
With best wishes
Dmitry

