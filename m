Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4128FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 19:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMpNvFPvt2cMAKNRFOUnF1jAyCuM7WFPijqR+Ei2D/0=; b=S25ziICscBj9Y0+ENKXaaZbwvp
	Bc3Zh1gaGKJGXtIhLUgQdYott7BlwLZA93Lpz1jFrP5mHww1H/oYnl0r6rNErb3boAT1dO6HRx4RE
	vcFPtSplVeAA74LcQxggjECNFo6P7UgQDqby7vzcHh/rMyPV2EbQWsa1O79YA1ODxhB6MQngor0bC
	//z7OccPqURbJSnBWKMyxDzspdG4xaGr6qpGU7rMVYMmRem1JT7TeC0rUfIUQ4mgKxW1sy+Xius7u
	gaN7GP+YMRSpo1bjMAIdpMBA+5EfIUeh6cNAJNgvwpk4ubSAakXqfociTlNOLT7/FsdcrPFyP6azF
	4RkUUMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCHs-00000002Gfb-2Ati;
	Wed, 30 Jul 2025 19:16:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCFO-00000002GRd-3rMg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 19:13:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb9m7029203
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 19:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aMpNvFPvt2cMAKNRFOUnF1jA
	yCuM7WFPijqR+Ei2D/0=; b=F+tBuQT8LTVPb4S5M+db3HHjBSYUucF1a7lRQtWt
	MIR9SkRhya+99V5V8/lCkZ69XUEV/WfkivHNugmXANg0r1P28+MM2JyoH76OU4yp
	TbYNkbUDeC8lxyKLRmncSo/Tv1OzyRPECGa70SVC/QkPzqjCCixFMMjhKsCehjac
	v6FVx4Zb6O92UC3KAD68jRCtmr0WCwmlFwoCXAxa4yeU+J5q+N+SCJ2WJzwgkUTJ
	5hQZ4/5/16sA898jwCJ0JuaW4Xj1h+vRzRlEpLuCQbQINUwExDgOnUdfHc5Bt08t
	NCt1x7voA+9p6OoZX9Znl7ZxSX4iMQYdS7hIjKYGKz1RDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcrd8au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 19:13:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7075d489ff0so1455356d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 12:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902833; x=1754507633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMpNvFPvt2cMAKNRFOUnF1jAyCuM7WFPijqR+Ei2D/0=;
        b=BI4J0gyuAshVP+LltVtnUeowmXoVLf3VlZTqHW28FH4DixdO6NERh7Tz89IbIZL4XO
         ycM8lUHY6FgvW7CEZzJYbozQXDEwygNRfl28bcTsH2kzjdNYIXruTUfdegmTuNPpXSBt
         ueHsdbF/+2Z6jm4OICnWaunolZl0MyvN0L3fX1heHLiuqYbqh6pox1tVjDlyGpqfCsoX
         IbR34yxAzhkCZOzwuRo5iGWyL987TdKSkNo8yCVXIzLFQTbYO/EclBpeGAVtpNbsG75B
         cIEZMP4xhFk87UK9yajpQlfaw62KIvF4K7UtQjotn0FBiYlWjLWQPn8zWNVVKsj5zmOw
         ip8w==
X-Forwarded-Encrypted: i=1; AJvYcCUVI8lSgohJCxVs4TL/Tdvx8OvbS7pNOgsdyAUnZhxTojfBSZ2ahMrddaumzefw1GrX6aYZ4p10qrwGhwD0G7HF@lists.infradead.org
X-Gm-Message-State: AOJu0YzbyLxY1UCUBZJ0gsJ6DUCuVxdxFtapMNkrgXzaVZphQEdtf1Ir
	vpw4E4ag0sATWGmYoDea6bWq+kCyfA/WY2ayr+atfOfaSYDm/k9cJncFzMslnFquHJeG0c4CE90
	F9cnT76S/zTF/MbIbXa45yWbuEKRSZeTnon48eQZFzFirGmflw5INKYY8bDtyh+Kk+61YQpPM0S
	O59w==
X-Gm-Gg: ASbGncvmVR1rvBB1i2/HyYf4/pwE+q5eYFPTGaHDnLyEBDs3cdhqp1zc6GlTcyvbaaz
	IAD/RXVytq1+bry+FKyt4vACblTVJvLQbj/qYzOxBy6F4zq5ImB6smjqsn2CWmpR8rv4gznV3xI
	ZfBxvRmcoUaABLj5dUOB4K86sWBYpPUL4wMd0RVUMKRgACmuCJieUC4k/cGXIIyx9wrVPcCnW/a
	j7UltHKyR4ukQtnBPDcAL8YT6NOmPtdpsTcV/+X+FjxKokf/KEhdjbDWMREj5jfb+XE4UIlhvXD
	wos0qA3/2Dp+IW3NkrDYwEhQErbRwdUTx0cuN8aYoDHSAYU5zT44amayXGmx3pr/+ukPOBEzDqZ
	wfWRUIC56hBC7t+s0VKmjnLOGzWGO8ffjb+8JdLpLNZ/4uP7MjscW
X-Received: by 2002:a05:6214:5010:b0:707:3891:a072 with SMTP id 6a1803df08f44-707669f8c80mr67431616d6.0.1753902831457;
        Wed, 30 Jul 2025 12:13:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHgmYSqHWL1JQSbQgLX/lTKYei8dv1aftQo53r3fvUDU06KrOX+cc9BvRo4AKOH1ZPMuJ35Q==
X-Received: by 2002:a05:6214:5010:b0:707:3891:a072 with SMTP id 6a1803df08f44-707669f8c80mr67430436d6.0.1753902830418;
        Wed, 30 Jul 2025 12:13:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f427c501sm21257541fa.77.2025.07.30.12.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:13:49 -0700 (PDT)
Date: Wed, 30 Jul 2025 22:13:47 +0300
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/5] Add Type-C DP support for RK3399 EVB IND board
Message-ID: <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
References: <20250729090032.97-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729090032.97-1-kernel@airkyi.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDE0MCBTYWx0ZWRfXztD+hnVBZrmI
 8glkd/nOs0rjOihSw7xi38wYMHFZSYH8i5cyXdqNeK/nS1CnjID5aiNKWMrFpRZ7UOTK6ojfo8p
 6e9IQnBp8/12004ThMBQ/b/LBsHaBlD8+FaXuBxE7ezd0/pBZz1UoqZ3aGBZtBGCoIYsjPR8JCJ
 bUy4M9MYzWeKZqPVuZE9t/00zhHZhwJVSz8E3RJLWwyZTmDbOOQpTp2V+HOrEerKd+rJEuv3r9f
 s1JBwHU8RNaaCjOVxrBdcE0F/dezyykArizyrL+q3ZTGvRhIPrbEmKDq4LlfvIHyx0Ie8y/GZEh
 kiusLI4VSngql5GBjvsOWRQmp00iTXd07Qqoo38ek+a9PPUt/4MPlNSSiek/hCrUNFFqAA3ghae
 iI7xDGDvu9tWnJVqGqLqSFyCm8pgtpOwEwp40CpD7tMb1cBNI2u8ch2LdLf7iI9CMX4QjK/1
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688a6ef1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=14ipHPXA7Wsnq1XJWM0A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: riJAkKqgKNxQHL_4pLmTbu0miDixDpKo
X-Proofpoint-ORIG-GUID: riJAkKqgKNxQHL_4pLmTbu0miDixDpKo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=908 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_121355_070911_FCB16508 
X-CRM114-Status: GOOD (  25.53  )
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

On Tue, Jul 29, 2025 at 05:00:27PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This series focuses on adding Type-C DP support for USBDP PHY and DP
> driver. The USBDP PHY and DP will perceive the changes in cable status
> based on the USB PD and Type-C state machines provided by TCPM. Before
> this, the USBDP PHY and DP controller of RK3399 sensed cable state
> changes through extcon, and devices such as the RK3399 Gru-Chromebook
> rely on them. This series should not break them.
> 

[....]

> ====
> 2. DP HPD event notify
> 
> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> the CDN-DP can be switched to output to one of the PHYs.
> 
> USB/DP PHY0 ---+
>                | <----> CDN-DP controller
> USB/DP PHY1 ---+

Could you please clarify this, can you switch DP stream between two
USB-C outputs? What happens if user plugs in DP dongles in both USB-C
ports?

> 
> BTW, one of the important things to do is to implement extcon-like
> notifications. I found include/drm/bridge/aux-bridge.h , but if the
> aux-bridge is used, the bridge chain would look like this:
> 
> PHY0 aux-bridge ---+
>                    | ----> CDN-DP bridge
> PHY1 aux-bridge ---+
> 
> Oh, CDN-DP bridge has two previous aux-bridge!
> 
> Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
> state between PHY and CDN-DP controller.

Does it actually work? The OOB HPD event will be repoted for the usb-c
connector's fwnode, but the DP controller isn't connected to that node
anyhow. If I'm not mistaken, the HPD signal will not reach DP driver in
this case.

> 
> Patch1 add new Type-C mode switch for RK3399 USBDP phy binding.
> Patch2 add typec_mux and typec_switch for RK3399 USBDP PHY.
> Patch3 drops CDN-DP's extcon dependency when Type-C is present.
> Patch4 add missing dp_out port for RK3399 CDN-DP.
> Patch5 add Type-C DP support for RK3399 EVB IND board.
> 

-- 
With best wishes
Dmitry

