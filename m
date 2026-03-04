Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A14EFCE4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 23:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V50tlCURGOSWEpUNVC/f5JBGlAu9WVw1+uCs3+cXy8Q=; b=3gpwCqkXIiC/uF9zHMgJ+hzhZa
	uoPeLJxUPpD3VNZS8/nE+1cQu5SzUoZdu+DyInkW78qfD3FcgBzgpOKRO9fpvUBpPtt/UK8HMwhGi
	cau775JTEn8QeQbELAp+DHQ1upkpgsw07S6lN77N0LUgpDHW9s6iIxO0vIl23LN0sxzLfPEunKwX2
	QJ8vU6rVI+bomD6LXF5XuNJXNSyKlA6GB4M1B3hhVdZe9TWsEpoXdg+Xbotfmyssh7S4moAR9Bzor
	ImjHCNUjSgeSfXwnMmX2mJe0MtHFCvv44mHTlVLD8+MSX1V6ea4c82hHx2IhRhBV02F0DQ246A4UE
	j/cn2Zxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw2C-00000000eUD-29Vn;
	Wed, 04 Mar 2026 23:53:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw26-00000000eQ0-2gj4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 23:53:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624NgbDS029422
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 23:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V50tlCURGOSWEpUNVC/f5JBG
	lAu9WVw1+uCs3+cXy8Q=; b=bHnTZhnFYn/tiIi8J4ULThpsgbab7UrmgW5OOJJi
	m7XwaAv8gzL5i/PPJCFmKWpARNfKhBWcj2eQ98Jty0ias+PktBjqdKCkXAPaELNj
	a0Gl+BUEEowrMPAKllx/ORmbxKvdbnv06gsWNMRC4vNwMWDRsN+/Umbybcd+e88B
	r/+5sfU/Jr5rGByjhLIWV29LUZnpLgy3RQf4wS6C8MkG2aHm4Hpng0Hc/lXMymq8
	+xAymHfPQW0I/zSIuwudwEu/Xyt9EGrksONWTgra0NIIeQgGca3xHZntcQ/B1uyx
	S9yybI9F7OtwJgszxO8ID4FgfjHXJVcqqpvfDRNL7lu1yA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fhqw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 23:53:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fead92c6so243239196d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 15:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668417; x=1773273217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V50tlCURGOSWEpUNVC/f5JBGlAu9WVw1+uCs3+cXy8Q=;
        b=J9wd2uZWy5gz4IoBFr9hzd30sSQmVfnpABgYEshS5i7mAGrqQRmgj+AZ85/5uW4mhF
         FMhI+CuRrw3Ah1E+50Aq0Su3VVY1mcD89uueMdQibZXWG6xsybzjXoqbJANSs0dskjv4
         V9VhSUACbpxZ6lQKatwtw52qFPny3q5FxpNueabHOM5sQ6VWBDOFS2aiDNzmkD3u4mxf
         IsxLbi8wtMG3gzAPa8CgcAG0obDJeuomuCUGfbYTXS5Hac3HpvCZyknKhXZnMqo177NZ
         jtb6Tghxr41mCphqhY0jgAGrFq/CDToRWzMTo1XCTm4DHjpT4DnUAQsMy50VTxTo3dd/
         tvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668417; x=1773273217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V50tlCURGOSWEpUNVC/f5JBGlAu9WVw1+uCs3+cXy8Q=;
        b=gOx9w0wrJT6GVlRq+hXfuximd1Y2Lr0p//XZ7FfT8zTWnPw046obRPu0mKPiDOjyZe
         fo/8Tjp1rcuAhZmAMqw/oUBEWvgSj66Si2DVwK1TdxMQIHM5Fp0rKaHJz/+A1im2JUUS
         6o0rnMDN2uvXD3YirrIhYx/eVxHQ0DqWK6RSVxUTgcTBv8uCjYREFsY4dICVhekR/9+o
         /SQNaK5eiysWefyUCxmZuTD1uEBR67n6WjqKUnvtrgeTN12ASASoW55FjKbI7HgLwNpd
         kz9MYAXAyCFnY/5TVAsaSu+Gu/P8YuD1QmXtAh5jnSxkcMevCZtKkABxD9lzP0XosdBx
         CxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLZHx4ixgGR6WffLaprErtzV6jtosnfQeBEngVSCVfORjztnn5eYJGbzrO35aIFAN9Bc5QJpQLswVgmcHT3oFJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn5d4gLU/2KdFsHSSnJOX24y5GoWYGfo+MbTjzzZF6snHW4sB/
	Tpg3Qub7SmFjFntLvwPoQGpOR6KJwLGJTsjNnk6pHIE0WM4yKok+ZkDzlDJZjmY7qZ3bUOB5m7J
	74VI6ogVCGllwSX7jYGLF9eFG2leU3YraTDMel11iRGlP9WQ84SJEikV1OyJIUZWtfI8CSCP8WA
	jIZA==
X-Gm-Gg: ATEYQzwFu+vvtmy00UsFKQ7axKzFcrtLtxUZOOwRBOUolN6WITcc8ZZY0rfcY461amO
	IHpXdc5r2Jq8TOgSZCDBCsPkDDI8FCdctyIX8boNGsg3QQJwicwzKxv5PlD/gxHRFCqvG4X4pxQ
	Q88lawumNaXql+9368HEKLN05z/eTq0ZdcG7qaeByoVNehG+JiyM1D9e5z3RmEVD4JW4zCljWkc
	hSAlw5IkEouoqvbmulxAyZxakGwnOhr0Vod/6853Og+JfOFZiFUPS5Bo80B1psydZSCoDU8LQXR
	JXChIgljOlXETadtRS8u8oLkmg+uuADxsE58mh6z3cKNBR+yBZnjrWee6tZ95Tv+ZmYq4jBnSWw
	8n0IPD7BJjtQEgArEeirMgpVUmNQixUlX9MfCcqpoErEN9Ny9Xn4fDazs6bLSC1LGmlTy0goddF
	egW0OUun3wu7yJ/4pz9NZDPCxfU0YWHqfsDYk=
X-Received: by 2002:a05:620a:3727:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cd5afa6707mr498610185a.59.1772668417080;
        Wed, 04 Mar 2026 15:53:37 -0800 (PST)
X-Received: by 2002:a05:620a:3727:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cd5afa6707mr498604985a.59.1772668416537;
        Wed, 04 Mar 2026 15:53:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1296993a0sm933837e87.31.2026.03.04.15.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:53:35 -0800 (PST)
Date: Thu, 5 Mar 2026 01:53:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH phy-next 11/22] drm/msm/dp: remove debugging prints with
 internal struct phy state
Message-ID: <esbforcln7bi4e5enmgwqj7d63usdyoobxyo3hwd4paou56aoc@kjlizz3ubksd>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-12-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-12-vladimir.oltean@nxp.com>
X-Proofpoint-ORIG-GUID: ivCHLxU3gJzodMeKtZ5GBvm5Llx75dEf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5NiBTYWx0ZWRfX9l30lY4pMaC/
 xBLQ+Jv3JhT4QCIkYqh4c6QjgE8p1GWBZMp9WcZV9iNPWklTl9sQKiisdGWTmB9n1MqMEJzdZFh
 BTKWo4ZB6BoCM+RL0rMFX75o9D7QmjwHNuO5zOR5XasgHBXoR0Ky34GUgULDoni49fxu4l8hj+d
 08jfa+X3P2wNolB2BKKH2QO3+JF/3ZJV7WEZnjwOIq9GlbODrD5yKJdDA0VV6Yy4Ug8GjBXh8Hw
 +h+SFM1wGlsyEp/7Znt2k2yX+nD2CVrUkb44AjAvvErPnKHhVFnEDAr+7QlLH+1QaPmSTtyiEDS
 2EfyelJs6bKbVXQqGTT1O/UMwTLaUoSRtWwQv5uc9xpcgwriytEvl/7+V5qV6R5jtISGqYn6DO6
 pcYHg8IPq9NqEIizdI2Qpx2ZHzY/DBCeRNz4GomMNevtAJ+nHLNz4A5/dnHcuzEdbY1AVPwNkU0
 2X4WXZir3H9ozLsTjuw==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a8c602 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=3ogKHO_BN1K2bhpmqR8A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=ST-jHhOKWsTCqRlWije3:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: ivCHLxU3gJzodMeKtZ5GBvm5Llx75dEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155338_692082_C0F56381 
X-CRM114-Status: GOOD (  14.43  )
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

On Wed, Mar 04, 2026 at 07:57:24PM +0200, Vladimir Oltean wrote:
> These do not provide much value, and will become hard to maintain once
> the Generic PHY framework starts hiding the contents of struct phy from
> consumers.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

