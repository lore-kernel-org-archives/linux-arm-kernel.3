Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C46DCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYBJoUSY2tXC4JkVJCKKmh/DGRM73qQJsyU7sSPqj0k=; b=ze1LMoehiGfjx241sj6pSU3OsC
	OVwxXqY+5em2Fjf9l6I2jRbCrG1FCxViQKoTJt/zu4RHW0rWmC72Z6QtfEhhMsDYBIcWiHcdpFS8/
	TotWoecFSqAxB3SZApal+0etdP6nyCSeTXJwFwDw1EvbuW0ETh9GqqVkTKnCfiY1Papq637saLimx
	4GO/7zbF/9pnr5LDcbPpYdPNpfVM82R17MXV5dBm9cuOqePG5XvL98QMEa9vwLZ6TgbUNpuaEfeIl
	ZxUTzUVeDXfB6mQOgYSYc5yA6WjporUPE61rH/oldOnBFEXGyc5lZ0WBORApTFhcDuRrH9VrifJTF
	v8dsjtuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRszP-00000002CHY-0BTW;
	Tue, 26 May 2026 14:42:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRszH-00000002CCi-41mr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:42:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsBs52554528
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dYBJoUSY2tXC4JkVJCKKmh/DGRM73qQJsyU7sSPqj0k=; b=d3DrVQ8kibecECdq
	5e8AI8zdo2z49Yhp3ixD41bW5GK89MCHb7kbrptCsrcIp+1YpGJ0Gs0+7DvYhrEw
	Hl7KSKUlnqf1HnMNcmHEpOnowuvc335bffuhItaxn117uNjFupmtrNeuvLiUcB+M
	wk/TETWCa0Mg/mkZEpM0qaD4yhukAdCx59cfIRSsRpeVE//c42S2ZhzWN6Jv98AO
	gJRd7VkcbJcmJtsqwo2fLaR1awMJODS8CXXyRQKqJ4pHxLsqPPU57GwvOYSXWl+O
	HC74Pl69Zil8WBBaRFLYiIDTzV0XqJ7+hf3IlZi4Rjc3C4ggxG80mL9Nz6EFtIG8
	9VNiGw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3tc0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83836443305so5239318b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806550; x=1780411350; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYBJoUSY2tXC4JkVJCKKmh/DGRM73qQJsyU7sSPqj0k=;
        b=jLcoFjxoIqQ+HRpYxc9xnYXgRnsdlUcD4yMguymVnIMNhZJyUdiAanrv21SI6Lza1d
         2UJ8Id514ICVV8R7T8ob78rJ66JhPcq+7bP4ZgUEPExCuSR9gCbfBWuR40T7kqjeTDMv
         1a4fUkZVpEJb65Lvw8ePqFEHkTIuRQW8HEk9IefKgufJxYSBSl6FH4BI2qXd7uFFHUyS
         MMSxFqlR7CGCzpjjS/EoPPloxRqXromJwqVCsnde8GZFLq3KYdWrAseywnlly4IPnjGk
         z9Kmerbkrk/xbion0WGq0PQ5tS6uY2tb6RMzwSbW1r01/Fq4a/9JM56vOq00EIIEPmv2
         56sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806550; x=1780411350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dYBJoUSY2tXC4JkVJCKKmh/DGRM73qQJsyU7sSPqj0k=;
        b=iUMqwIQJ1DFx/byJjbGktKexWLXkVftX3wC3HFH+GKrFQ0s8RJVQLJYEFRxJGl+LsM
         JGTqmL+/0PVYUBlpb8yJc1YirXIJVKI2g+8IhJaEuBk7vGq4f7k1A83aOLkFvwQr77i3
         M+90/BdZjiUzM/bIuDl9v8QDb/w6rww9jWtrisU+2DSknrsqECaYth8XeXv3/9x/39/7
         4N3Aka6NE9UBpwhVTFDDjtaR3NY87nGfFoPOzMVYhoxQxF2Tv7kzrZVC/a8SKvpJ2OxH
         sYfZwPoLrEuwDzNr4pn2o2/ThuhlJnVsTUtvyv1/1ezea/kEYai9GtpP/ehv1mjkX3ys
         IFcQ==
X-Gm-Message-State: AOJu0YxCeGjnCsIDPChhFGAUJPP7ySj9eytCS5jYwhlufqU0iaQeXh3z
	aMSlFeXE81MqbMdg3lVxo/Hsrh5OU2rMvhzFX6dpONwihMJiE+hffsTInE50a4jEtGjS2d0bFt6
	e/VlNS//hZ0gs5Bz95NB7LEJJX1IRb9jWURFt3WxwLNy4VDoJQvnAVZQQxLIrux2em95d13IxfV
	1cIQ==
X-Gm-Gg: Acq92OFqEzJnVeKMbrxEPByY/ChSHLylKRNSDks+N83Jv9SpodJrfErTKsHvB3WlJIS
	RovW+Xq0FOQcIFyQHmEN7Tpo8BWn8fANngzzP5k+y1Rvqkpbf0nyzWIUoYbTBEhwJw/D+ZZ1t+k
	1QoaieyqpvTqQefTa8IYRKoIpJBY3E/nyVYl6HgqmiUNRyTFo5Wjgs8WWuqpTvhyHGxeAmxPX4X
	Eghqv2KU40XuY5qqhDfvxczG+4oj5SdPHNDAgwFJ9g4IfDKkmJkwVelCLaBEi/4HMA+n1Vkec/0
	qSevdYKTLkIkga1BXnfWY2iAQm2OkfgGAaDju1mhdG0Tj5PeSjKGVvO7fAF6shHeu0UDa64T6Nl
	KxyE2oxXtJoWcSaG+NtD/mR5n8ApYvbnwxJAlTAhEFx9PMBHxb6kC
X-Received: by 2002:a05:6a00:b486:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-8415f158b74mr16699452b3a.15.1779806549968;
        Tue, 26 May 2026 07:42:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:b486:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-8415f158b74mr16699430b3a.15.1779806549485;
        Tue, 26 May 2026 07:42:29 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:29 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:05 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: lemans: Add GEM_NOC interconnect
 for adreno SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-4-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1122;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=7CPjDV3gT347BVwRIdRiO+KfIxW2/766GVcN3yxQ6iA=;
 b=A/MmI4Ssrmi7OC54VaSN6M7oYxKCp7bADQdsPSx5UgsPBDQc5G12sWOGN7601WKlO+UYo08og
 Ad8Nd/5nmSyDIpYtetjAHcaFmeiSUGJK2WBXQkcB8NlOSmxjTTSqPgT
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX7uDhec7XGHyy
 hkTH41olRX/LHAOioiSrdG8+/2tQAuTJF+pe8QJTwvZG+Wk4coXCOYtUsXS0sg4ZRBqTzUYzlje
 r2my2njZkDHSZYYQ44vsz2/Tpxs/Ewa5boPwmfPlF9K1VRCNwltQIx5jGbYt9NR5d7N6hAbjQmP
 P+oERVcPWbiOGQEqGf3npEjOD3opyWhPUL1xmLpxLbaFG/k4UqnKYsE5/mjLPukyecB6WVbjK8n
 c9uJLKHdT3SRWYCAJypKm4cop6uHrTTqK979IkfV3d28WkNe6I5MH9xLEoBJFrZxSSSA7z58w+J
 G16b1V9v8dE3amhrdj09Nfrz4HcDzpMC7fJC+QxcillFzNIm664r3kNtke6DRvP8Mf86DfIauvq
 t+oPIDd37VxQAl/msxWaDDn+IKdcH+UAqeZg8KbxGhlOKYcJSV6oiMg5IZP5j/r1IE1HwEU2md1
 gw0mcyEffkL5CK9+6Kw==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15b156 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: VRfMxLyUeGkZkr3NzNPnnpjEIj1GPC7y
X-Proofpoint-GUID: VRfMxLyUeGkZkr3NzNPnnpjEIj1GPC7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_074232_126593_6B19C16D 
X-CRM114-Status: GOOD (  12.55  )
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

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 522ba43836a2425a8612506f5f7113f291f34706..ac9f529d2719105609d997874a6319c7d04e1655 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4796,6 +4796,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		serdes0: phy@8901000 {

-- 
2.34.1


