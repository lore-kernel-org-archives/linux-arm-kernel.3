Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BBFCC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 23:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=; b=ROMhiZ+MC4aznrfO79aWZugwc1
	ZdbCumtle3z2QqR1nBs9Py+STOC20vtseyudGJLrRNWfMN/77nutfYz08Ucc404o3IzdRD3pdJfKq
	4VFh8dvR3C3E5Sxi/+Y+Au8ix5LeYCK9MgRHfGIlUtskKmknwHSFvW4eI3/3/hHBtn2U9MJ07RhsH
	sQlz54ClhnvQzpfos+zNSlYz7CrgVFsdFff/SdEOCPBLyY/TGgYs8QaH6JU+yPpyMC2IEPoiAgXFE
	SzibkatybqDHUz/AefDpWJ8/N19Xbb01Z6sEYRt0wT3alqeiPFsj3a540a1pX367u6RosfHkXJPAH
	IcNWYA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8gJ-0000000GSsC-1KZX;
	Wed, 14 Oct 2026 23:46:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8gG-0000000GSq2-3bab
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 23:46:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMD3F61013196
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 23:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGsSHjvhagPRXiAvKSbTu3/S
	aEhQGd0uTphQRGhmwdI=; b=JxiEO0CryCiXsww03jKFnqlfHqxReTyDdp5kUXLv
	QULPpT3bTqj+lWLIHihri1ovAEzk4GyRNwUyYc/O1WY/L399eRXvkjwpN9Ee8tVu
	nhgkYjZjLiTdRDYUVYMLrSBTFDhmOGT3/Y28aeetbLENcyaTTlVKEuXjH7X/WcEj
	K2IOA8BZL0305lUDw7JTpuHTaDg91pAaoVRygueHQaxER3u2nvoE/fUO4GW53Gss
	j6cJAhqRwH7uSPC6qXxRXstO7FEHXCa34JNB7E20gEeMmSBsyrG7ZttvWpI2iU49
	/nvUSTC4mSVM0y+b4hcbwVhZsv2IkP0fgS2FvCf5K0Xh6Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80ctuks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 23:46:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917baea8e5dso83656996d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021603; x=1792626403; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=HktctQ374cPd+SpyLS3irbTL77aLqlJSX0vC/eE7QhFqAX5xlDBZtvy9BQP5kVkmWh
         lZTngvf2Cny83Vou2DLnSEpegqU0uVnflxuJAUdboMltuXCp0ZHwn1nGhCL4VujhvCCt
         W8cIrDZPhUnzMu5Xt8t7yg4BpCykUUkngpSnQE66In45B1130FntDUElX4wj5WSm4/pG
         1lQiaH+hYDZZg7ZMzVcmai9lCcoJWBDdBxeBZZvGKjliIFVNvlZbAkf4zCZmTH8hsFO2
         +CAILkizYsw27VnU1JI+kCeVtq9cc7Vn6+3hcMbjcYny9bkUAaX25RPgMfwisAzWs9my
         JdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021603; x=1792626403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=P3Mlz4vh7M+iy/sx27QcmDQ/rm4V65L41nfMBaG4y2uy9EE2fVAG7Uu3a9FeM/OPXl
         tCauREZeFP7Fv5IH3hb4E7Njv787uilVxADUI1cqZCOt91+bXCo77oE32+DUy+bZQeMZ
         n78bP6mx6dYCvc7pPhpe9MPm3kkHkMlcDxb1Cl8G1UAK3f4Qtxs9mMNapPR220TBX3Dq
         +3SpBT/nkfbayDtDtZneyZBOQtYkDqptvt2r9EGaqFOsQT0l6GsXH839+Aa2nVBx0NXM
         Oo+YjocDYN9nXVnIqac0n0CJVZ+D9RmzV0mIL7BYN77PN4rkLgNnB65pYUi8lolLKuvB
         FJUw==
X-Forwarded-Encrypted: i=1; AKwUvByLjEqaiC29ENXfZz+LnizyWt+/H4QFE60ddSJY4j4rTDsIvICG/jN647RZ1+JL+X8EwuGx0Hw0SBJFKm5rQmgg@lists.infradead.org
X-Gm-Message-State: AFq9FYK6w29mAHTO3JpiT+a+hUSYOvBJF+px5VM1w807MVwISV87Vzt/
	O7yLxTVeRPlUFft6l/vazRUKBg5jvaHp4aS/F+KFJjtJTtU/kwlD6xrgByveMhmpdx31ZQiZf3F
	6s/7jwcj8wFSGeN2WJThW3cZFuU0IBT36/6j7S/9SCjMTgA67n438tIqeM/N7N1L1VzKzwkMa7p
	AZBA==
X-Gm-Gg: AYBFou24PPTA6AsoaCOksfbo70f5UcA3KvkMFpTINcnzoVmBgT9xcYgVlSwcAS1dfiU
	BbZBD9+TIW6nkY9R0j7rMKXvS1EOCOgdbgPr4+YfZIN979Wzg5eJu1NG9e7oaSV0518ArvHmfbF
	5m+LU6gh+Moj1oYS5mPnqapEi6dI6qATFDTQlmmA9BR0FINwuBSYV9yA+1SM/NXtsodtYAod8Qi
	e1WBr5sHuRmRa4ZtELKtBRUg/lgqkqoGfROwWyBSK96hQTx42rqtLESRy9FshpThPebh5M9utkd
	MAuFtTx9oMUmMozpJWuo1TH96hlfjythVD/TzK7pK+poXa9OBBR/wiB19OQ9eGC4qYJC03k8rh7
	HWXuvbkomKxBil76WqmsiYMd89XrsrJVG/LwSKLcN8bUeN2crU4Bo6HbAUdMksZ0OIZYprY2S/S
	V/k822kK4kTsBX
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871711085a.2.1792021602937;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871707385a.2.1792021602398;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93e00sm939809e87.66.2026.10.14.16.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:40 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Use DP AltMode defines
Message-ID: <qgkw2qvqwmchclsdf3k5omanjd7qvm6wyxfjy7bb66w4koarnz@6s5k35dmqvai>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfXzeB9LYOy8aBw
 sFwORkLwuZ9/Bw1anHJqVsoEp+rH7WP4h3Qwh36B7VhRPOk/TYwcC5952/W7l30VBCcj+1FVVi9
 qaMEwq1Lj4FQmcvftS6cBPFbJqurpgA=
X-Proofpoint-GUID: SK-sjmzrI_GoE5aQzavElwfZw9vH_o-0
X-Proofpoint-ORIG-GUID: SK-sjmzrI_GoE5aQzavElwfZw9vH_o-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX82gSAo/7rN4M
 VrCENLUH1oW80FdcF9KL2XXCUKtATE+4AEbGTxBtOhzPDpuY8y0XAFPHxgugh/IPMcmLwB9S0ZR
 gkW/V1CoDkfWRSeI8j5WkOtUlP+v4pUnzMxJAhrmUMj6up7o4Fa7E8H2DL3/tWui4o02+iVapra
 1W31bOO8e0bv/Q2I6gs3H+W2KsxG7oQBsLOEJ46MzWsD23+KQPf6BZ36EeQXtwTb2hOCySCCdVQ
 UdRdz4ziDLhIYqsAT/gROa+6xAPxIv48/k1mms6RM/owRxJ3uh2q9X1G9d4QOgO1eGoQL36zmof
 Q4JHXNd1zwNEa6BbXN3r3Iw9dicG2utV5IYGZTDTnRl3fgqSkWnHJRNx0BN9fTTTm31NDIYq1Ip
 rwfLzbQ2xnL1kAnb+VZSl4AEteRrD47lskEL7cvpyRduDzEqHcwOKZQ4640YPdw5GHLIKj4ESWS
 s4Hg2C4eKyFTDtn4ZsQ==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6ad01463 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=oov9_tbh0Q946gG9V5gA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_164645_015012_A6D01ACA 
X-CRM114-Status: GOOD (  18.03  )
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

On Wed, Oct 14, 2026 at 11:31:50PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up announcing
> 0xffffffff, which is simply wrong as that allows using the port in
> upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
> above HBR3 or pin configurations not handled by USBDP.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 8 ++++++--
>  5 files changed, 30 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

