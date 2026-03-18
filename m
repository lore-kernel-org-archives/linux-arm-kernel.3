Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0511088E46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 22:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfPdTTKFeIrqOaOP9gRV4ZVqTsDeuSzuEH83cPJoqOo=; b=rVZihrwYgWrIa+yKWos48MGcvf
	UHU0LmQB21RsyLT8UzJJ3iJI+XxWvrm9oOanryDnTrNlhqykH3oAdlt/4zUkpAqOJW2/fGQqcZkA/
	o96ODWSydSqELmD6qA4/zhfCBXso8ZHqkI4nbUa8MJhHK1USDD+bpdqKepRPwJn3M5AqmWoIMnqaJ
	RHPUXqsRSy7g/c3Xx3e9kJ2GikgsRAo73YC2ijiLbN0yGuIUBFdd0BzvnPNlMsFSc7tkAq3JPKiic
	qUk8HfgiKD/owWEP8GEHhxnaJjo4s/vjsIXz0qmXojpUZ40EN+lUGRf/J8jB5V+W/Qb2QRi+7cxEy
	M2sioR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2z7h-00000009Pv3-28IB;
	Wed, 18 Mar 2026 22:12:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2z7e-00000009Puc-3ASr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 22:12:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFh2xe551669
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 22:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wfPdTTKFeIrqOaOP9gRV4ZVq
	TsDeuSzuEH83cPJoqOo=; b=pN0BTH956IbNpzhiCfIyryXAETBTLYRK+va1QblI
	uPVPzHuAsZdidVMzHb0ZlRq1C+WVLohRCpKyFHQZNC7bX0n0jGatOA8qdiO9I3Kz
	EDoDokM+grH0gdgqY2yYXlX9/SlZqNhNBFGkB0saihVCLau/8+DqhcDPwrpL0GXX
	o46hkX6hKKMBOt+VVSNbu00VH7o6GtahG3S6WhTFXYP/YIk6s0AO4NoJ1lHRvmJ+
	galis3GPPV1yljFPLpBaMtvRcgnkG77WhuFyJUm/Qym5LNb2zFV515z7/4FVUIM4
	lDf7RL083RJN4R0deOPbyCLJr5NlTnKFkXMOBg5hOstiig==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g4hed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 22:12:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c741a9ef5f0so179201a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773871934; x=1774476734; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wfPdTTKFeIrqOaOP9gRV4ZVqTsDeuSzuEH83cPJoqOo=;
        b=GJML5p3kLi3xIwflpGvhfsVa+KsfkQVz8LgUu3JcDc0qgBDGyHXAvV0ZfEyaDBf1yd
         XgV7zeRxSbmkS9sX7uf69PolTd/JWjVgB0zdVziHdi68rrmz0wyMHjC/2BLM2v6w7hEF
         MQWjEN8yQV9GdLLSLz4nCGnZqBep9TcZ6w0IDjZ6KftmcXt6DL1/6emH7nYVF2Zosows
         4xhGG/qg4oTyyiXBrFXjLdsMV+hNNjGmdw0bdpbfGjYffpFFJhj0YuO8yd/9ulmmtKXT
         K4H2iB7oaFgpZK60TFccC3oo7hBXs/2xvcuVQaYpb0296NAHYTsXaLOuuPJZsHsICXyv
         tf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773871934; x=1774476734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfPdTTKFeIrqOaOP9gRV4ZVqTsDeuSzuEH83cPJoqOo=;
        b=ZMxDPSRKAVoH21K2UXaiiSDhoYrkKJABnpBHc2+Knkumb4ei108Z/ryuGfnE1ydkk6
         mjrIdGaRWq17q7Rmwflln84b5oQuYOlJkkbRo8KAmyHE0TcVJsmgUZova2dsCo83RHWh
         Lq3Y/AUxPsEb2IUeT9PGvrh5iCbatqjGdbVG0wjJ/n5WybgKldJCJgvg1bQlWZ2gQLAr
         oTsIIFJzA6dPr+a4rRFpYU+AbWO5J+hEEr/MIuPS8JhOWlrzWY3sv4yIdn1rYMwtf6HO
         kMoUOy64XCS+KVyj0Mn9fOe9PCDt7JPpNoEJNTKqDce/QrfKYyFAkb38RDBT5qEJGVL2
         vZiA==
X-Forwarded-Encrypted: i=1; AJvYcCVpadZzYLlOk+3OBCsj8qd9iJO0XivqJpW+gnRfBsETeGQddPVIMs7SgQ+m5FyvLCtqe44nQUsg5w33fXCknQGN@lists.infradead.org
X-Gm-Message-State: AOJu0YzHy2h3rX2cu+1+fP4Vq7WG4YScOjkkg8S9CVTPwg4CM8ke+51P
	m/m4SDftF4T3Vs5Tziyr+EALGHlF2A5Yx8pFS0sffgG78WKYOMNdyAiw4aswqGDbOlrlyl/WSuL
	7Wb4EsdL/H3cWXXp5/UPGBo5YKiW9xDmMkYzrUlhfptlob20bzCFyUE5VXzy+g5C23x4kiOVvVE
	r1/Q==
X-Gm-Gg: ATEYQzz4wvjeeu64cFWmgofU6bc85nnz/16BLBLT8OQRXbMikZinFqYpDwOcAuB9pC4
	DUbIc8ARFslWbPgUtY7e+C+iD13EHAVmaJi62h3qze9mmdnJSP0i02FwADYLqkZUWub888+kdBb
	RuDjyWVRM0aarXirIha07OF+CkSbEmkkiH1ZGYw2N6g8OYy07Vh0NJPDbB4SMhmVgQMyjtsPo7f
	DG0BDoGBdZxeVPMFiwiYFAhDzdyvOmnqwtCEFg9krP5L+EyhBaSliikUl3FR3xNj3EBU6aaQ/Rp
	W09XxOKPZxef5xFNtzKv/Cl+O4Zy+SedJ640EJamvIzrv+VliGtunXBfEwhPWZtZAjx0gaTxWWb
	NJ0HsnuuWb37cldje1/U/twgBmY678JffoRQ=
X-Received: by 2002:a05:6a21:6b02:b0:398:a41a:371f with SMTP id adf61e73a8af0-39bb2498f6fmr944723637.20.1773871933407;
        Wed, 18 Mar 2026 15:12:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b02:b0:398:a41a:371f with SMTP id adf61e73a8af0-39bb2498f6fmr944692637.20.1773871932733;
        Wed, 18 Mar 2026 15:12:12 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b56ac50sm4778552b3a.16.2026.03.18.15.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:12:11 -0700 (PDT)
Date: Thu, 19 Mar 2026 03:42:05 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
Message-ID: <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ablpxwGks9m38fhM@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69bb233e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=9Hbxq-cn08ijON1ErxsA:9 a=vUQH8iars7gmROI7:21 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: XcFAjfBDgzBk22_sdVns-rYFMw1OW2nO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE5MiBTYWx0ZWRfX0rqJkMPgNGyb
 CtGm5NUeQ7XfCPz8bEjeyy3I9yktmGLYP1qsI+J3Rk0gMgjzkJXjIlvhfcrSTMTTtQMGnd969Cj
 mpKX0hgSlbHvs/LOebdJOWO336tbnelPaEDZ7egUO4QqiWeV++RUStZoxmE8gqctkbXncV+folM
 VXpfjA8jD89tVNL0CALPlQF9Wbiyic8iNUMF19X/3eEecFfOIZR9sU5KK9qv0wEuMEKQH35QF+d
 V4I0MtTyJ7ZXOhB1G3lBo6WoxhwkkcbRIf7qnODpCqgwycCsvuXe+9G54SVFOdgBX2m0GtBYGyD
 2acRVZ7MbbzVde7IV+8xxvNfEqIcRbbw8ij5zmEnHE2CGLCKVV+zhcp7v/p76CQUgaxQoCi1B4L
 5F4dTd+3UKzGObjDnd0lcCAU6AsAhWeB7YtF40qwtm3NqRESurEpGTyO0KmNibEAozRFRa5Un35
 6ApkG9EYfsJo9/w3OKw==
X-Proofpoint-GUID: XcFAjfBDgzBk22_sdVns-rYFMw1OW2nO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_151214_796718_7C363199 
X-CRM114-Status: GOOD (  19.06  )
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

Hi,
On Tue, Mar 17, 2026 at 02:48:39PM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 16, 2026 at 01:11:23AM +0000, Russell King (Oracle) wrote:
> > This will be because we're not attaching any PHYs when phylink is
> > being told to operate in 2500BASE-X with inband, since it thinks
> > that's the media. That, and, because stmmac has a long history, it
> > needed a special phylink_expects_phy() check added in stmmac_init_phy()
> > which his what prevents the PHY being attached.
> 
> Okay, another idea that I hope will work. Please drop the "net: stmmac:
> qcom-ethqos: enable inband mode for SGMII" patch so we go back to using
> outband mode for everything.
> 
> Then, disable the call to ethqos_pcs_set_inband() so inband mode
> doesn't get enabled for SGMII - as phylink will be telling the PHY to
> disable inband mode.
> 
> Does that result in functional 100M, 1G and 2.5G speeds?

Yes, but with an asterisk.

 - 2.5G works fine
 - Shifting between 2.5G, 1G, and 100M are usually fine.
 - Booting up at 1G results in link flapping (it gets resolved if I
   do: ip link set <interface> down and then up on the link partner).
 - Similar link flapping also happens when shifting from 2.5G to 1G,
   though its not always.

Attaching logs of the booting up with a 1G scenario below.

	Ayaan
---
[    8.650471] qcom-ethqos 23040000.ethernet: Using 36/40 bits DMA host/device width
[    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
[   11.569262] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
[   11.577988] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
[   11.586665] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
[   11.595357] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
[   11.619882] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
[   11.629468] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
[   11.640202] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=288)
[   11.649691] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
[   11.680117] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
[   11.688517] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
[   11.698080] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
[   11.704633] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
[   11.712966] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
[   11.721115] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
[   11.730157] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
[   11.738748] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
[   11.763778] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/1Gbps/Full/none/off/nolpi
[   15.215445] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
[   15.226572] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
[   15.234297] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
[   15.242902] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
[   15.251044] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=03
[   15.276661] qcom-ethqos 23040000.ethernet: PCS Link Up
[   15.278115] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   15.283364] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   18.317922] qcom-ethqos 23040000.ethernet: PCS Link Down
[   18.323424] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   18.323977] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   18.329375] qcom-ethqos 23040000.ethernet: PCS Link Up
[   18.340467] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   18.356522] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   21.358679] qcom-ethqos 23040000.ethernet: PCS Link Down
[   21.364183] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   21.364745] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   21.370130] qcom-ethqos 23040000.ethernet: PCS Link Up
[   21.370139] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   21.397194] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   24.399108] qcom-ethqos 23040000.ethernet: PCS Link Down
[   24.404613] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   24.405168] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   24.410563] qcom-ethqos 23040000.ethernet: PCS Link Up
[   24.421657] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   24.437636] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   27.439468] qcom-ethqos 23040000.ethernet: PCS Link Down
[   27.444971] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   27.445528] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   27.450920] qcom-ethqos 23040000.ethernet: PCS Link Up
[   27.462016] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   27.477991] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   28.026087] qcom-ethqos 23040000.ethernet eth1: phy link down sgmii/1Gbps/Full/none/rx/tx/nolpi
[   28.035077] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   33.336433] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
[   33.342861] qcom-ethqos 23040000.ethernet: PCS Link Down
[   33.350674] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   33.350724] qcom-ethqos 23040000.ethernet: PCS Link Up
[   33.360912] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   33.366768] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   33.386487] qcom-ethqos 23040000.ethernet eth1: Link is Down
Note: doing a remote link toggle recovers this.


