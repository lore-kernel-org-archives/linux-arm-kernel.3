Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E57C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=; b=symnroNPn3nTGLCJaewz3pGYSq
	xhZF7+xS/cZfayNXEWBdonb+Hd3teyZr0ZyiZd59ustLyHWxRrNHEjQQzDHzTxJEH98LoezWiMxa2
	YONeF9G6hVXlE9M9YICfE2HyMFDVdPiYw0aMPArBQEqtuMPKymSmtAL3gSD2RKOgfzvqVDv9FDDTx
	vB8DXee4usVMoC/lFIEctFRY79fAh68FO8V0jwDXgtLbQ3a4U4pbs/sFGgBLeYoyOLv7yLkO0E6ks
	0DGSDnI5Lha44hY7ANVu6DBJUlmPBYC7THxgaxv5Jvdc565WmY2ulko4lUcIVWBQEuMEtJWCesYo+
	aDVlE9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rF2-0000000FotU-1drG;
	Wed, 02 Sep 2026 20:07:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rEz-0000000FosQ-3aCv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:07:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtXM2209578
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOgl
	gLUq3iAA=; b=o8qTZHJ9wPF3L6nko83fbw4RSA3+laqGNZFT6uDbpl+YVhbI4Bh
	AiRHxzRb6pGr6xp1CtxCYePGu78jL9tipjO+GqINkNKz9aKmqQETyzIoUWGhomIb
	iHj2NQn7DXHMQGBwbiTG3w8x6S+gXIGWDSIGmvst6TY1qfC9HSx2tamypr9XuoZ4
	uxtI+2HSG/JmVkElTyVouC3zK8UcSsL79XGYNVGgsHptK9GY2nADRzhKHoajUrxa
	+OkIh/NIGe1kQa57LP0JOI/jkm6d3OdjCGYpl6KGAT0xozaNsl2RXZKAkvZlr6Op
	jeOzEpXx21MYBqscJHxbUbwqhNyliYP0sag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s3jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:07:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399311947f6so2710117a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379644; x=1788984444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=R67OXTA35rhdrK8zxkC40jOnjRBzSujbUYPq9GlDM/MquYJoY/XqbnAecBfdYg7n6y
         WeNnjfTkE4Tk17R6y1zvEMQeUojfx1HODif1OgqKflwXkypo/Dgi8DXis6DpV9E036Ml
         k+Jm4UmywbCiSlZ/JW2AoEMWwqjbNUyyeFcP4MXVc5eDe14ZvpmHEn+5cdASTPR6U8mH
         yYqKx8y3UXhxNF3V+nt7yy6MsjhZWYTbOO9t0zskPFRBxhhmBRe+0WuPioywBXK21AaT
         hvmFaJ0o4toSlUwtf5VXSP/KcXBCjvFJvZFzriLgNund+yiBQ4rGjWSfATUqRTaI/JKu
         gidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379644; x=1788984444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=izer8YzX6JIePoZq5mL2Iev86fjhyu4kGXTYsJ30dxn64yoqeVhxevbBoUhcC0YZ4+
         +3trZtZrOJ7sp+SfTPblKSeUGXF6DZarjt3gS5NJZtcLFhPtqSwZEpvlfzy4EIC/TvhB
         xx72Il7jNmW9IgqONjxpUbN8fM3ch4Hu/SJOakfwDEVlw5OLTnrAqUwSK5oeJKxvTZKO
         4IDPCMhonzYn13K1I+5/D82TdSjYrK/pHZpP1qARNAPDJw4llmay+kQPEFT8EnRua6Rv
         bCsLMG8yv803fu/KYyYQvoKMnZ0dC7RMAwAG+Ul99kos+pNF+oIyiF970FkubeUckTW8
         3d8w==
X-Forwarded-Encrypted: i=1; AKwUvByki6YX3Aw2l9PsPf82NVipnwSGJQBdmG5p/PRphyHYLmQGSQElsnUPECUht0t6rKzCE2Cc6QwtH7Jmg4lSg6ns@lists.infradead.org
X-Gm-Message-State: AFuF++kuWBSQBjTYAqJS/avC7oPfV5WtT9ydtlLWGRGtKhb4LkJJcZGv
	rV2T5PJCgGNfsiyGhKWRzxtaR95mKFcGlQiykVJgeIhBCcTQ2gv7FEnogjH3pxRAoYoLELn1xOa
	K4dNeC5Nt/PFZr+GvkRlKoNRzpTCDDylynzMoWbqK2jfr551ZQcCtsI5YOcJqdV4ROfnNcX0KQ4
	JhfQ==
X-Gm-Gg: AYBFou2ThXVUGQMqBAJqf5qhjCQRCOnL8cXS21wo6SNT/w5k463qoGja/IlaHfcneeS
	Q5wfoi7iXSwWw2dXTLL89td3jwzg7hrZEjuIum0GbKTIpminpv//IFZ3a8bLncd8MxvRR+6n7nD
	tmzcb5eeySyPwdUscbolk8jQnqeBpWjECpT5mtXzC5WoQ5MLcGhScNNMgvstllJjdkZIzDLRaa6
	5cRkhqBaRbJ3NjfrhaqFQkjMgua1Os6XYWuPk8a0ssAL3ahK7vdktxZzF0hU70wkKcerihIN2Fo
	kHRic74eZdttt4Z2Irv036BnClxOmaIKYbGx/pVvMRutdcQx5DQpr2qsVYgW9Ow439rH2ees+XE
	H8QfMMVtlq+6omuEsBSvFMYCpCk0=
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604346a91.4.1788379643454;
        Wed, 02 Sep 2026 13:07:23 -0700 (PDT)
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604229a91.4.1788379642783;
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:57 +0530
Message-ID: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a9881fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5ojLyFQZJBwMi_iZTBgA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: WQr9xpwnvEp-A2BHDycEeE_nOhY-10q-
X-Proofpoint-ORIG-GUID: WQr9xpwnvEp-A2BHDycEeE_nOhY-10q-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXxH3anfEJ2BMZ
 CJGIptIMgRDLDuak4UBc3Q/nFDs3w7WiWVr7M8DsVIrZOvgWPgYCBXlVlboxpeJqsGXcZ15ZW8m
 ZotQLWEn9w7/pzSSV6hhToyyUgKPDTOraUDbkXC95VyvxNR8KjRXV8lIcpruhfR6Idld3jSdND0
 t+RqhTLCaZ/YC12/WQn3a+XBsFy9iXJYa1Y2xIsQybDLdz8157s/lkTsIW6EYlF2Fg5zWLn3r2+
 2YhukJWMM33OjxLLTFmihO8azyGojYEuzkvMQ+eYqnljabiJT0GiFxG0aqAwrKZ31vyqr9RK6hw
 YDb/axyLdU+u3YzUsn0Zb4JPsGFJP4MjzFm3rjC0oRkj14fTGYvLTatjQv6hFuB6pKXuT2S+uRf
 5Atkq8tYp7oQl7G6adAyBr8vbP7thLSgAvcXk8XgV/Gzjga21xtVrDGg3R8MBTlAKGOUsCpYz2r
 dFIgLlIbMxYa0GtFWRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXyUK7G/EDbILK
 SrXUS8VwoHxrvJHykoxBP8YW/iyWwuQ5MPLF28IJ+X7Ui2mXsM9Pg+dSTJmDpidN3RYjxyOjPLP
 WnLrSrJLYx5lOWtdNuispHBBoVV++g4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130726_004878_D5CD2C78 
X-CRM114-Status: GOOD (  13.40  )
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

Several media drivers manually manage reserved memory lifetime by calling
of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
in remove. Drivers that fail to release on every error path between the two
calls leak the reserved memory region until the driver is unloaded.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
media drivers to use it, removing the manual release calls and any wrapper
devres actions.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried R-b tag if any.
 - Rebased it.

Mukesh Ojha (6):
  media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
  media: aspeed: Use devm_of_reserved_mem_device_init()
  media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
  media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
  media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
  staging: media: cedrus: Use devm_of_reserved_mem_device_init()

 .../media/platform/arm/mali-c55/mali-c55-core.c  | 12 +++---------
 drivers/media/platform/aspeed/aspeed-video.c     | 12 ++++--------
 drivers/media/platform/mediatek/vpu/mtk_vpu.c    |  3 +--
 drivers/media/platform/nuvoton/npcm-video.c      |  9 ++-------
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c   |  9 ++-------
 6 files changed, 14 insertions(+), 47 deletions(-)

-- 
2.55.0


