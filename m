Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBE6C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ax3dNThhsQFQv1KqRutPvEbeoFGjs6CAg3uERSNArtw=; b=bNUhhoIpW2GbxR5mR4VKJp5WuC
	zYlaBMuGkCuL9jk0NmwuTAW3cTZde1YaFUte5XVBzw5Zt9XzeTr16nyRBugN7UA7oiPCoKeSgMpxL
	bXG64iDXIprU/Ly7UEGElA2hPSNoc5cbzDklUagt/6beq1N6UdmXNl0PgciOc7KK0modPvGR4B7fG
	/dt+OUtMHN/sEIXyrhENrGH2FY2zbRA+qhEQ7WN24NeeKA8MSDFn9qbe+UUcvh6iVFmdZn8i6femH
	qhhT7jKjCUtHmhoRFJgOuzROe8oMICYwA90UdsCzkfCOkN762vU7oIEbDILiLasOqlHri/YnyunlB
	Swdz4KSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjR9-0000000CtMK-2wg3;
	Wed, 04 Jun 2025 08:25:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj5S-0000000Cpmk-0Wxg;
	Wed, 04 Jun 2025 08:03:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540FT3l014030;
	Wed, 4 Jun 2025 08:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ax3dNThhsQF
	Qv1KqRutPvEbeoFGjs6CAg3uERSNArtw=; b=TcIN7Eq8m09iPz1OL9bZUST/Rqn
	j9nsw0o7KQYfBu5BTRp1xO8wRPzQwmkFEYbxhAIhGTU4M/FpK/GrJaFYhXcEsQcg
	/4+Xy4hQ2K/LzFi2xgmaWdm8i/qN3DItI51VWKtPv+A2Yj1H1SBUTD9jcpJOtLxF
	LXXgPtmfPkGkvcRBmzHvTXGEGY6zFv7XDTfJ+Q8H1CWSXnvWPsexw/f8DPwuCZoo
	CV/DU9YnqWKldDqdqXA6evnp4yonv5jh6Q/05gU+slFWUqZCs3mnMpVYZDFLLCbx
	1PnJ8s63P3GdCGQLb0ufowUh7azAwOYLXubPg26rT1a509DuGqiQ8XF67IQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be810gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:45 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55482htg018772;
	Wed, 4 Jun 2025 08:02:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46ytum6jg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:43 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55482hng018764;
	Wed, 4 Jun 2025 08:02:43 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 55482hLc018762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:43 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 246A540D25; Wed,  4 Jun 2025 16:02:41 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com,
        qiang.yu@oss.qualcomm.com, quic_wenbyao@quicinc.com
Subject: [PATCH v4 1/5] arm64: Kconfig: enable PCI Power Control Slot driver for QCOM
Date: Wed,  4 Jun 2025 16:02:33 +0800
Message-Id: <20250604080237.494014-2-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=683ffda5 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=XEm5LDYL5XlitVSwr20A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lNdDJ3Y1azeL_vwq5Iqhj_UciF8_Sh1j
X-Proofpoint-ORIG-GUID: lNdDJ3Y1azeL_vwq5Iqhj_UciF8_Sh1j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2MyBTYWx0ZWRfX0XAwizpOpzaE
 lCLIBXDtyIg6NVo3Fgn35z8dazpnroBxA3f9jyzvGGQSQE3aOaV9uF+jCiXtODMpgRgA/bVre3p
 pn7Z1blP5XEpgFxPvSWa4Nkw8u6WLBbDHFUys0VsOUTeYwSL5l7NQujOC6NFMJU0pD+cnSX+O3I
 C1psGXmf1D8r+ZUyOjjXaIW2FJwxQyOlQomMvohdTmKd43LNakZsSJlhdN2cf+LHvV9XkdUR2v4
 uGklqFGPjK3nWUlcTFL1JCGgXI/oBwyGtc3H2DkqMu0EeIvy4E2dshdVx/i1PQTEsKjGQxsyy1q
 /jMEL8KTZWfLF1wPpNUbOD29VndZZbruAzXQGHt5dH4aTQAYaZClLYj/fqOph3xnEVspEPzSOKT
 2rXpznsL61ozECd4AcOq2n1iAZ3za77dWEvzcQFc91la217fP1vxpw1r+9uf1cmgLaOX59pU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=803 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_010302_167981_9DAFD790 
X-CRM114-Status: GOOD (  11.75  )
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

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

Enable the pwrctrl driver, which is utilized to manage the power supplies
of the devices connected to the PCI slots. This ensures that the voltage
rails of the standard PCI slots on some platforms eg. X1E80100-QCP can be
correctly turned on/off if they are described under PCIe port device tree
node.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029..0ffd65e36 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -270,6 +270,7 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
+	select PCI_PWRCTRL_SLOT if PCI
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 
-- 
2.34.1


