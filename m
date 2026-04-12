Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F897E937EA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5kVCu7I6eFim3Ab94eMIy3IyII0abjKhpJ4w4vtJ4U=; b=OCpv2B2baLM3pfsKbdvc1weBB1
	huugklWsVhIYfaK3AQavhXKgtk4M1j4hsAZaHJnXdry0gUYE0ZDO+QDRnpi9/rBiXqVPE/t0m/5al
	R60XHGG9clIxJ2I1GOhDPBEt64FAapvvElgE9CY1oxv1TUT4HJCIErJINTyOS5av+l9L6pDF8sRD1
	jzFj4FlZ+UnuyTNbaVOAU6ifg+osGr2+mPM2Hh9ecOgzrB4P//RCU5h8z0etXraAV4GW/BvDKYP3/
	T9TRcNe2MQi/tgRgJfuSTzpe9zIbUrMhIG/+Lvf3QUuwlAoiQZ2RSBz5Mt3PM0rKhp4uUfBHEGvj2
	kLlbRHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxZ5-0000000ETjX-0Z4b;
	Sun, 12 Apr 2026 16:21:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxYz-0000000ETgE-1OAO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 16:21:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE5jlk2663962
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5kVCu7I6eFim3Ab94eMIy3IyII0abjKhpJ4w4vtJ4U=; b=jAElOvsTmKxD+dHz
	Qr2bJ5zsUfopT8yDFm1gN6Fl5DSvNgrgT3IGhjTi8mUACJ7yIBFtwKA0sz/1FDTp
	4Xnz2Qma0ieguEZXB/thqKcwh9/WBL6fL8RVtr8idfjKwlxttd7fnItBeqlxpA0d
	nbsMMUzEN7cm/H72BEs9KYpW6cj1CSvZk6jRWu/YdvhvyAp/0vYyKnRpVb8KuDLu
	OxyXJKpDISHPw+Z9XIK/ZCNgcLXCF0RBmuJ5AsL9afoVMrwlp0LSqRu5LzgBRjKp
	JXsgHDj3LzBePuogpzUB7JCV5PDBVGuruge7F5/KMljGhry26gnglz9WKPOIEdGQ
	BffenQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexctmh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9a6a853bso90195061cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010892; x=1776615692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5kVCu7I6eFim3Ab94eMIy3IyII0abjKhpJ4w4vtJ4U=;
        b=UTbQHk7Akirme5EkqmXbKuImxVqdXynDigin5dSGQtROUuMtynU8oHRwuaMNA65kbk
         TldoUcHB82Gn5zo12sFAsI8pLefQh2n8+vx+N7zG8PSKNAKl5yGdt/T2WqQk9q2DaEp3
         ToRRCNEVJgjHPx6Lq3St2ze4ti5hqCRKYvG7O1CmQkDU+Ls4UCntWb3j3ygOyaBGqsY/
         zVZjosQ4Gk+SclymD90+2etxeYR8wRsKO2HXRmu7GNGoK2unRt9a+caCQUIKjuzsd7YD
         ro3yMwSrZJ+Jrsf2dz6LQxUDlYjx2L3fF6YThx08BMkKcMbu0bB+e2A2p6k32pTcmIsk
         4NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010892; x=1776615692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V5kVCu7I6eFim3Ab94eMIy3IyII0abjKhpJ4w4vtJ4U=;
        b=cppxO1PnssWk65EzSRFYN8AAfXFIp74lK2kdjZSmQtfmOBHSD3yzVAfepnCNQ07/l+
         lT3wzDck9aluVi9tjUYsDWAQXrCOSD5eD4tmD8EnnQ3DZux+2V5/blESU4WYAOBzzDpb
         mkAgx/VA32xfJOud13tIoNlfAeIWzjbKcQK7XTGXIpbu7WRTk7mkmT1Iw1SdXwOjRB8h
         DXnEVXtNk0FlEsRerbTQQqMs0EDpi5+FxRGArCq3y73nR/iAT/xAwNu+mZyYCqqi6EB1
         NzU4/GNfcJItB8bXbYxBbnPOhgqF8B1KPRr0CzgZqaO0+VNJfLnt2HzxQHBC60+okt5d
         MQQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7zxG2LZRA5WPGFkYv44u2nlnlSeaMEq4BkdT6kKv8bJRFfqSI9JR48bQBoj+Mb/LCAx+7+IPyxglfS7yBK3hX@lists.infradead.org
X-Gm-Message-State: AOJu0YwBHkyocqlpsGCd0RHaLxkcz8vV1wvoHqrnU+y2jefws9OFZuhB
	QhIUD7XWUq2rwu+YL9oBy7+Nk1O2+X7kxL6QO7ejAyQ9PKSDNctzZzOJUOKLo4VPLp6bC52IB5L
	jCddklRnZ5hLihITDdyjayETJ8zU9vOuBtykLwzlqJRvYeGKERdsDc5gCXFZxxz0B2j527QrZQN
	NEUQ==
X-Gm-Gg: AeBDievxPPc32aBxpNxTM+MeYO1LDXJwe6O+xjxADBND/PkanO4m79V798JCAvUvsU1
	k0wiWTdhyJY/qdkvhimY/fcVCefxXRKu3MvHcJbzLlUXc2vDBa+nB1apSUXylxQ+sGY2WRHR9V/
	tGcagHf1wMz0Nw7m9z8o254LI/NPB2PZwG64LE0YArcKZ8ohH1L2+wC+IXHKZ2LvEu4gAdUwNKh
	Nx/xr5pVrfhVN43NgB7GCgBHRerfo1A8U+gIfTnMMpT0sgCMWR9T4hJN0pCZ4K/b7+JxtGi3GzX
	tHBp3f9CtswHsx0UiBw0TTtr/w0qUGkneX4i62w8M34fsO9ajgEnep7x8kJQTuG9xq4l8WedPfp
	GD0ACehLx8FEqpUISuNYToAS2kO4DbE6uag6Dv0a4fFgP
X-Received: by 2002:a05:622a:1344:b0:50b:3895:fac2 with SMTP id d75a77b69052e-50dd5c02ae5mr164389151cf.61.1776010891652;
        Sun, 12 Apr 2026 09:21:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1344:b0:50b:3895:fac2 with SMTP id d75a77b69052e-50dd5c02ae5mr164388781cf.61.1776010891220;
        Sun, 12 Apr 2026 09:21:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 18:21:06 +0200
Subject: [PATCH 4/6] arm64: defconfig: Drop unused Ethernet vendors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-defconfig-v1-4-a46918286451@oss.qualcomm.com>
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3989;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p57QL94DUC2N2RA2ayDnsuY1vtfCHMCy3uf6V7BOGPQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Z5QjzuVfpztSYLfrMPVlsCxMIAlWXjyuc9N
 XQnXbz851eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGeQAKCRDBN2bmhouD
 1zAiD/9WmDEKnfgYidm9oU9i//4s3enb/xf6oIoDMGelpZXLRQu7+yUuuIabpG6tAVoXq7wqwAE
 Oz81H+A77OFm2OA6I8TvteGklhYIdGOZ1o85UcpBFopldbDT6I0I1B9SCPr7ilCVD9EFWiQ7l5d
 9tJfEcwuIR4rClCSs4vBMag2JdBqHmKEwH2CF9B4y2Hzd7bfPXXTYNimJlX5Pj55CrgbA8Md54e
 H/NuSGuDo57JfgV9WuNs2gxMOykV6G/HWiJ1g9LhHS3713X7nX/ISZFwX9tY+v1tR3WrTNmut6G
 kjivYj70GrqPIWvfzGIf6IugtU1YGNLf2Cw1w9G8jl398I14VI4aSzJZIURsQ4lJzzLbf09Ok7x
 BmovfKxiKDRg0uZCXKWTUILp1cGkbVW8cf0Ise9UKME0xDo60AVQKqHD+qJvxGm3pkNVPRDRUw8
 QsNcoCkp0954sRlybVx73pUY4NsdMNOh3mcsWEN9HMIVGZ/dnHj5N7sK/op/CU6Bv6pzEGbkaQO
 ofyZHfKos8VF4d5GM3AjTfUvcbhQnrtp173SYFYht5Ay3wuCJ7N50WD64o5lJmowg2JxqybbOn8
 9YX6cK0f2w+QJCyE9flslbKmzUgZS8rG07WfsvjT9O+jzcx7YH6akdrgPVX2SdGOucjhJ2+nQD3
 usNrqRkb0HCd3Uw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfX309v+n5P7vkK
 6xoh/HWupHGYrjgxHvm2Irio1H5elqVUhHSvZosJSB8v54y9QEORJiTps10D68Bk5bmlT4VGe87
 rNyeTiOeIyd3yXLLazRMSRaxhp8tRoYpnBIoqU4DjGGrULk4IMxQTOMFUkW/4Xpz1odx9brXfas
 uZkMaBDl8Ar+Oo8aJbujycLOiDD4NxRkrH0ht0AExhQglChKdjppXcq40L3L9VOC+F05Gerplyh
 xlub+kggaHqUhbUEp7ca2Aj+mNb1UhnnfTCSSq/OyCHtZxDbI8+BGyDm1YyivhJKz80sqgT8lvh
 3ylJbTXNxBBXNriORuHYlbriu2KLB9oQwX2VGFoG5RN2bE5EO6eHxRW5ogLJvgQiDbRBcreJdAb
 mCKXyG8BQjCl4JFSKUI3dYQw8qu4tPYRP9Y5OsgGMTK3UKZ1jsbpkLKKBf8T+a5NIaIDrDcedrJ
 FXUFNdBBid5Z6dwan9A==
X-Proofpoint-GUID: OOZV1HTsqMouSfYzFY5aEjeSS74DRafX
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69dbc68c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=s0ajyRo-FUR_dJIxqt8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: OOZV1HTsqMouSfYzFY5aEjeSS74DRafX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_092133_493734_FE49F162 
X-CRM114-Status: GOOD (  12.23  )
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

Make going through `make menuconfig` easier by disabling the unused
Ethernet vendor menu options, where no actual driver for given vendor is
selected.

Impact checked with comparing old and new autoconf.h:
  diff ... | grep '^-' | grep -v CONFIG_NET_VENDOR

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 51 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9f6d5d6ef69..79f6294fffdf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -349,15 +349,33 @@ CONFIG_VIRTIO_NET=y
 CONFIG_MHI_NET=m
 CONFIG_NET_DSA_BCM_SF2=m
 CONFIG_NET_DSA_MSCC_FELIX=m
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ACTIONS is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_AGERE is not set
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_ALLWINNER is not set
 CONFIG_ENA_ETHERNET=m
 CONFIG_AMD_XGBE=y
 CONFIG_NET_XGENE=y
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ASIX is not set
 CONFIG_ATL1C=m
 CONFIG_BCMGENET=m
 CONFIG_BNX2X=m
 CONFIG_SYSTEMPORT=m
 CONFIG_MACB=y
 CONFIG_THUNDER_NIC_PF=y
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_NET_VENDOR_CORTINA is not set
+# CONFIG_NET_VENDOR_DAVICOM is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_ENGLEDER is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
 CONFIG_FEC=y
 CONFIG_FSL_FMAN=y
 CONFIG_FSL_DPAA_ETH=y
@@ -367,16 +385,21 @@ CONFIG_NXP_ENETC4=m
 CONFIG_FSL_ENETC_VF=y
 CONFIG_FSL_ENETC_QOS=y
 CONFIG_NXP_NETC_BLK_CTRL=m
+# CONFIG_NET_VENDOR_FUNGIBLE is not set
+# CONFIG_NET_VENDOR_GOOGLE is not set
 CONFIG_HIX5HD2_GMAC=y
 CONFIG_HNS_DSAF=y
 CONFIG_HNS_ENET=y
 CONFIG_HNS3=y
 CONFIG_HNS3_HCLGE=y
 CONFIG_HNS3_ENET=y
+# CONFIG_NET_VENDOR_HUAWEI is not set
 CONFIG_E1000=y
 CONFIG_E1000E=y
 CONFIG_IGB=y
 CONFIG_IGBVF=y
+# CONFIG_NET_VENDOR_ADI is not set
+# CONFIG_NET_VENDOR_LITEX is not set
 CONFIG_MVNETA=y
 CONFIG_MVPP2=y
 CONFIG_SKY2=y
@@ -385,13 +408,34 @@ CONFIG_NET_MEDIATEK_STAR_EMAC=m
 CONFIG_MLX4_EN=m
 CONFIG_MLX5_CORE=m
 CONFIG_MLX5_CORE_EN=y
+# CONFIG_NET_VENDOR_META is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MICROSOFT is not set
+# CONFIG_NET_VENDOR_MUCSE is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_NET_VENDOR_NI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
 CONFIG_QCOM_EMAC=m
 CONFIG_RMNET=m
+# CONFIG_NET_VENDOR_RDC is not set
 CONFIG_R8169=m
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_RENESAS_ETHER_SWITCH=y
 CONFIG_RTSN=y
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
 CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
@@ -399,8 +443,15 @@ CONFIG_SNI_NETSEC=y
 CONFIG_STMMAC_ETH=m
 CONFIG_DWMAC_MEDIATEK=m
 CONFIG_DWMAC_TEGRA=m
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
 CONFIG_TI_K3_AM65_CPSW_NUSS=y
 CONFIG_TI_ICSSG_PRUETH=m
+# CONFIG_NET_VENDOR_VERTEXCOM is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WANGXUN is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
 CONFIG_XILINX_AXI_EMAC=m
 CONFIG_QCOM_IPA=m
 CONFIG_MESON_GXL_PHY=m

-- 
2.51.0


