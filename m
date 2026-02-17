Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8F4E9A031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eqYZw+qW466/zd9o0hZO+WrbSIyZjH1x8DDDr0yC84=; b=ddkFXI3eS6nlj/upk/R0t16dFm
	+OJ7xoe4hKK8DapqN6muMxgjdlk0F/rlZPmjRVmU573TBDroPYxEbt6tNsocyvH/FNSjXtNEDYqPz
	welpiwS3dgMCs1lQ8/gwFbmpamjq5S3Q9uPvSGiZK3nJNnyMUdStFdWX0Skswi3mYjVsm0cJqYIy2
	Nq9jfRBpxiz9/jHGGg/kH/iymZ8NVrKgZlsvIW+VaEtZ0Z7kPm8wUf6ZBihHtitpuzMTVRYA87MOc
	Jf3JwSdjBDVFMo5l0IF0EIkVXvoi2XhyDAUJKR4x62rbqjR9fttbw1hvqOmHrKDya9z3zLF/Y25uI
	/Q3+g7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPzl-00000008jt8-2Rdr;
	Tue, 17 Feb 2026 18:40:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPzi-00000008jse-3iGU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:40:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HFbrFL288287
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4eqYZw+qW466/zd9o0hZO+Wr
	bSIyZjH1x8DDDr0yC84=; b=JOqpjRYupn9Fjgx6aUFYuSq+vqZrEJFB2W4Spezz
	aaDKrAUMKpj14T1ZnKXaGfIOTd50gSSYLFNaayjCIu8h+Io4msOmYBioT6cth/PS
	+IA8j2gt+eG1CVUxqloETCK6/njQZ6CEraP4BXqF+vjbp2kCm5thAOSuOTz68j5R
	ZFgTam9zOQR6DhCgOp/GruFXMeVTGG7NzsA+XtMmrfvM+/Qnwlv572y2zyEhNZst
	H8B8N9SGwgLLH14/wzcjVK4g52PIEc7SZWX1l8m7NrfqSN6VKftAGXkP23pmqy1e
	4e9vR0BdxdkhL5ZB12damwFeE4YLYzUePkKd13oH2Cn7MQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrug5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:40:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a946c0e441so45545125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353621; x=1771958421; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4eqYZw+qW466/zd9o0hZO+WrbSIyZjH1x8DDDr0yC84=;
        b=Zw/+yMFC+zl7IKi7pYhN+DMGbHbXGOxGlUPn/LbudVorE07k/3ts2esvMLHjv2F5zK
         NlKwRgMYrJcOHDdVw5047W2cj9nhFqDdFL00DJtb5VwPJfgjrTtt68LCm6NzAIcHt9Dr
         PuGSODEfh/Wv5x8UDPREq6Iv/sIxCAH5oC8BPT0NQbiyTeKxtNyL6Ogmny69BhM0U1VH
         tFMcfwPdM6K6Ql9XTFb4GYh4Sepf/c5FuznVLJaC94kaaT8PdiSJR/LGGaDLmHX0BXEa
         p7s50CP9U+oH+H/rYdnYTga96v4VQeA7Sx/lHldtaaOGS7r2lEkohCS2MXSrU4GtNk/+
         Kq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353621; x=1771958421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eqYZw+qW466/zd9o0hZO+WrbSIyZjH1x8DDDr0yC84=;
        b=IEYtUPxzsv+7abzFrGzd+d87Xp43+dLy3IKJk8Y9UghZ3y1FGuE9kefhM91jnewHjq
         P8aH3QF5mFzog/JX9WDX43QPwFQFV1UJHMiKRNtdo/8MgVXXz0+S0eCe++RXYULrHB7X
         GNz1kM/ywOm0UTQxR5svkc0hacVAVLOSoagwX+CimjguKQZJqLdFZ+25p5uB59M3cwhY
         qG1aqWPqks7vUmzxO7NwT0WHECC8FEQGhd3ltn5tHlqREeN3oEw5oq7Yil7Bt7lAnPmL
         ir3lNEHFJX4FIpuCWkYjhV0eihJo03VkmyKJXFI6+qcYlSaIZI70g8zVxev/0KQmC9/0
         jf3A==
X-Forwarded-Encrypted: i=1; AJvYcCWuOvVTSdz+QVNMI/lBLDcxJkcS08dMqkcBbJYX/NHI8aSD7AQOxRveXghbgy7NdgQjNS/05v8ZfbBywnegqsHk@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ0GrvRaeFLCFHxJloDeEfDw5QZA98K/O4FaLjEryuIZAX2WXi
	WfI7AwMlsrI2wogJpkB0XngYQ68ZOj+soSeBUsL2aZvvJPwbTiDQtoRLoCZJypP7b3VVSd41Obv
	MUlbNBb9WAL2YNPtxseCAX1Oo67HXsnOsf2y0mpygAsN2nYi4hsDmMQcd7ylDzwTuojT5ij4aNs
	QgCw==
X-Gm-Gg: AZuq6aLigWT1rSusJH/qLzDOtxwIMCT9l6EkuzigW6u8qH7WnHfYwqrT5igG7nTACyu
	QtfK+Ex+N6yeMcuKC8QMsjGDmAg9yQEd/AYHLaXu8/iI5VA8UcS6HEcfc41qkddwGn/UAaCnv1s
	1A9ux3ggvc8giVFYWZjYxdg2bgCqVFPGd9e8UY+gwhGSgz/WH6GZsfFbWVYvCxpKSckG/B112cL
	+NgUM2kt7hk3t3s69TuUJsclpMeo34L3mz24/7SmZqRlbFTVZ1yH69OdjKS3UZrA8/HjO8Tie3V
	GqzYf78ivUpzc2XGzxLrg8V6Yk6U+kZEkVRd4iYCsDzFAZs1Gq3J1sZ5eJzfEgbxVSho7AgbKQw
	li3AoasnEvnVTmb8ibffxcCci8o6XaSIUoRo=
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id d9443c01a7336-2ab505a365cmr131982365ad.42.1771353620401;
        Tue, 17 Feb 2026 10:40:20 -0800 (PST)
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id d9443c01a7336-2ab505a365cmr131982185ad.42.1771353619915;
        Tue, 17 Feb 2026 10:40:19 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad416ee045sm30863535ad.90.2026.02.17.10.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:40:19 -0800 (PST)
Date: Wed, 18 Feb 2026 00:10:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 8/9] net: stmmac: qcom-ethqos: use phy
 interface mode for inband
Message-ID: <aZS2DAd9KQYHML+U@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPV-000000093mr-3iT0@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPV-000000093mr-3iT0@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994b615 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=z4Hhns87Kg07ZqANAhsA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfXyCiPoxq2vdeS
 TWE/VgxdkI5VfjCjW8eqzPOT9pmG6NoiAxDtzeF6W0A+BhjzMiuu0ixTSCghUg2dIkHqOgwih/I
 Ngquo2Sxb98942Sj5Cb4g/aNQ9bNlSyYZflwBESCj2pyXORzWe1l5MOOLoRg3KlFSRgscyQmTjj
 A9i59oYkIfMA5QOg5ett3SGLfy4lmTsanzoHW8kgC0NNU+jpBOou8CdeuYaS9mpnFL2QcMg3qha
 v/ndq9HmdMz2CSYjaybXfVF2S1a69ukaW7Azyb+jMn/13yKFypxe0jdtevFvQ0PiLizK8bp7LvY
 6sJr6H5mCZ+H5q2JutA7Ug8nth6k+IExnQssdDwoAilq43zUymXJXpQPWLNBvSoQNXg77CirwVT
 QUNtw0p7HregQ5hjbpajSLsDokFE33jpRaLKNcVf1GS5ud1QUoM27ZPxmaybKTp5SSsdVHTviww
 CszcarzSY8yzd9b9B+A==
X-Proofpoint-ORIG-GUID: Hhr0Rn1afKoQHFY338UVYLL-fHPdXRDe
X-Proofpoint-GUID: Hhr0Rn1afKoQHFY338UVYLL-fHPdXRDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104023_714236_0161ED3F 
X-CRM114-Status: GOOD (  12.41  )
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

On Thu, Feb 12, 2026 at 12:18:21AM +0000, Russell King (Oracle) wrote:
> qcom-ethqos currently forces inband to be enabled for the Cisco SGMII
> speeds (1G, 100M and 10M) but not for 2500BASE-X (2.5G).
> 
> Rather than using the speed to determine the forced inband state, use
> phylink's PHY interface mode which will switch between SGMII for the
> 10M, 100M and 1G speeds, and 2500BASE-X for 2.5G.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

