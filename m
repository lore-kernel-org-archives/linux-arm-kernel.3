Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A48EA71B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 03:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtl+6BW8W96h2knkFuBlb08onlTQOueBJrF/qpTFCGo=; b=LstzUA7PN9WpwdV7IEIOC6KAO1
	bLVNTbg+RI4M4yVXfotu2M+h6hnW77vtZOv0U9mQNErfVzo6Lbe2JtSsmu4IVUoW2qLCIOYXPOF7h
	bw7sSUwqwG3IUo+FMSMgLZkKaBq3M9WRsXCNGFXu4KcxlmMT3fjP4hI19VGcS7rLqUuO5lDUy4W1+
	VasDvHXxcRdyQw+UNj6k4NXImU811fTfPP5bmZ/LhUjStIw5PFAJZ3hW0HwcUjtKh82Pj9vX3TXQp
	ma4fh2KLwuAeVJUF7lSOJpUDEtljhzdAMV0KDWeDlxFEC/n7GyBKsWFMJDs/pOz+EejVS73xYLlpR
	gFWX4skw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEeyC-00000006LtC-3vYI;
	Mon, 20 Apr 2026 03:06:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEey9-00000006Ls5-3NQC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 03:06:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K2IeRh2729383
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 03:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rtl+6BW8W96h2knkFuBlb08o
	nlTQOueBJrF/qpTFCGo=; b=EeAm3O+xDAnsqjBWSwWHXLk5w3dFL5VST11xec3M
	cJUYoLpE/IFBcdaW2/WljOzUUeBxyoKuGjdMM6G8j1dRsN4CFMGXyZvBdwnTr/rE
	7GOwa4sBPnBAmAFG29EyLqaSwdYlzw8WZAaAc5VeW8H6UVf5kvs4Cc81H8JvE0Xv
	oRiUSzF9UPLUhbGVZ52mWGcXfFBY7c6krllIcr5bJr1J+R5Z0W6N2n6RvMeydSN3
	A50LJttDcwowVNGL+wS95T2fADXR0GOyCkaOWhNvGXzFXx+iwI+2XE/56qmLNa3y
	LxivIIS/zArdFaR5TDf/ANpnmhHnSHoBzFhVFsZ+8rR8yg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr3x94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 03:06:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so1251841cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 20:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776654400; x=1777259200; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtl+6BW8W96h2knkFuBlb08onlTQOueBJrF/qpTFCGo=;
        b=Op1/IQlskcuQeeF5gO3hL0Fr2kwASPqCAetg0gfMk2j1CeCfXz7k0hHoBRudgw0f4Q
         9WxPT0u0RB2kLAyVa55zLKMHQK/GLEVrj5KMqhcFk9l6BGkxjKLvRlqM3s7gTVvJIjU7
         Bw5xsCbEtPwH9q10Zr5z+VfLm+rpXBxPbqikRrJ7eTNe1dtoLWG4DH9nbhGdinlKgel5
         kKgLR6q6bA5L1gEmNG8Ede7XdQP2E0EbOjdsTL/ZbBOn66eWkgFkX/TFwYmZa1Z/Q836
         CVpMgkZQhD3BaTBGfAQLzmLjb/HnLxZQ5vhEmQiIGbGxDBTAk22GBDwvQ106F29pGmOH
         K1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776654400; x=1777259200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtl+6BW8W96h2knkFuBlb08onlTQOueBJrF/qpTFCGo=;
        b=cQYiePpJr/ycPkIxVc+ctvafRwXaCAsDmqAtPwOD1ya/rslMW5nYsB2beeNqCd9y7v
         jKunQK2nlhZHpIZ44G6dWwSVSt7yHmsOgnhb2LwUaCnYtG7cByOVVCLx1B+Akqpgq329
         BG65e5yIprOOeXxygwES4+2Yu6mGu92UXRNFy4TH3FFaZehtfIUfTsCiZEO2EaztrAVf
         PIPawzMAi8a4NNZXJ26aBfzGrdOr5LzjcNzrxD/KvOP1RlSLRNJNLY4kEti/b1cKrW4o
         e4h5bw0uhOo/SNRpOl19APGCqBv98MUmf9lQpqJjT1aPqDzCqEn5J1+3qy+6CMvkIspI
         bSfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vkwi2dW4Yni9oYek/34XdPpkrIib8b1u0DiN9Ligb0wEQRPZBrNaY+EJEDFMfY/TPjgB4rdked470jofjxRfX@lists.infradead.org
X-Gm-Message-State: AOJu0YxoD+OXML5cUqrGf57BtCJVwjYXJH6G24kWYLfzdiC7Hhzz6R6P
	EtcEqECh+0S6Djri6EIbMiL2yRL4LsUdxRJB2ZFSoeA5fpv3iNBW7lTcfGufbSp5eTnw/cr/sCN
	aT2J1zzzIMonaUj13LoWouyfye1j1eYwdjPq16Luv5BVhbvr+wbCUsYtcR4xurYSVAYe0NUQLnf
	9/jg==
X-Gm-Gg: AeBDieveDuDnHjMqyqbVDyXSikyc4i7kN4893Y72CbBrIl4CqvL+QSLWCcv1TmLmdl/
	V4Fs0osPO96LrQ71Q9GV1Rc5fvgbgf2zbAuAOm8CDGW92fcqFXTqjyhDYTkWQqNzG+1b0q+dqJ+
	L79yDNo3ON0v9UdpmNZ1/gwXwzZZVxncVx0gcN1mUxqJ2H7cpbBAZ8rjF764jPeMaUpNYeo+oGy
	N08Almmq8lgyuVXvd/Y1vICV1uZ3ww+FQ5TGIZQbstY1BxN1OSmTNiZY3Inl0a8EW8tFVdKf6NV
	tzA2jPrThDTxJTBIN21HZ6s56DHGTLWDokFjAG+cpEZ2MxdKKgyYGhdb3vXKxHf+WdPEWdXqeyU
	5N8g5h81Lom0FdhrDaDjTG0PfrIH+RAD/JauLZ5KZy8b6P+5/FVMopl66hG2T67+Qf1POomNCwG
	cDujcXMjoQLQ9TyK12OA9zI1E4+wJxg/Qt0luiVg+TPC460A==
X-Received: by 2002:a05:622a:4189:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50e3693d07amr181294581cf.16.1776654400029;
        Sun, 19 Apr 2026 20:06:40 -0700 (PDT)
X-Received: by 2002:a05:622a:4189:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50e3693d07amr181294201cf.16.1776654399547;
        Sun, 19 Apr 2026 20:06:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1116sm2667146e87.54.2026.04.19.20.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 20:06:38 -0700 (PDT)
Date: Mon, 20 Apr 2026 06:06:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dennis Gilmore <dennis@ausil.us>
Cc: Alexey Charkov <alchark@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        FUKAUMI Naoki <naoki@radxa.com>, Heiko Stuebner <heiko@sntech.de>,
        Hsun Lai <i@chainsx.cn>, Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jimmy Hon <honyuenkwun@gmail.com>, John Clark <inindev@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Opdenacker <michael.opdenacker@rootcommit.com>,
        Michael Riesch <michael.riesch@collabora.com>,
        Mykola Kvach <xakep.amatop@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Robinson <pbrobinson@gmail.com>,
        Quentin Schulz <quentin.schulz@cherry.de>,
        Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v7 3/6] drm/bridge: simple: Add the Lontium LT8711UXD
 DP-to-HDMI bridge
Message-ID: <ilprfltw6ju2jpo4hrrypscljrlw3xqi7h2mf5sv2k2iy3xeu5@4d76innmpoav>
References: <20260414214104.1363987-1-dennis@ausil.us>
 <20260414214104.1363987-4-dennis@ausil.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414214104.1363987-4-dennis@ausil.us>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyNyBTYWx0ZWRfXzumYkRZAVQ6o
 IlSuxzNH58jtn3cy+hPWLwp727fnH/jGqT8NDDlnmvKZfe262CR27PcWzGH1mULVeIrfYLS9utj
 ZBTVQSxD8/8fsC5C/6/iEc392o4/hhP0RnoLp8wonGa6SnTZNcfWIhJazQIkzy/sQgBz9HbSky7
 kZpgzQDTUm85PyV/MbK8QstHOWCNS6liARbOQOS+gzEj0fYyBxI1u7oEUgUn8VR99LMhhC5u4aN
 IQDHoDSOiDJpVodSr9FIwgVZcAlR9VaYBLOyGsZqGx1iYcQLd5gmOM527nQFBLK6LVVjBOb6Eo2
 xUMNSPTygTazJMmQSSr/ixJ7A88fCaOJATSgAGJduL0UAemlpFN00grdACj3UDZnn6UrRhZKi/x
 4cHJoYOLGdJqwx6G9F5XHh4l6dj3/d8/wU0CDjPofQfPLBNJ+/P4l6kRp/6KvfLbBh40PE78RKx
 yxbziXr75yJN7EZ7fGw==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e59840 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=R0GiLmRpmYWNx10LZcEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0SAZj8rhEqgrAfPrmK6Gu2VkZKs3PNS_
X-Proofpoint-GUID: 0SAZj8rhEqgrAfPrmK6Gu2VkZKs3PNS_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_200641_876150_E6B0DD3D 
X-CRM114-Status: GOOD (  15.09  )
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

On Tue, Apr 14, 2026 at 04:40:54PM -0500, Dennis Gilmore wrote:
> The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> to HDMI2.0 converter, designed to connect a USB Type-C source or
> a DP1.4 source to an HDMI2.0 sink.
> 
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

