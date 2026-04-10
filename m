Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82B1F459F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 17:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuUqFQvGRTPdkWC7g/Q7W4VqEsaDgZfbJ0ZChsHFd98=; b=h0jkkjxzAwQhQxpgMj63vRT5+e
	7DMmUCR8oZq2bLq16orJW57Nr9j3LcWbAdLlmIARl9PVMIWzMkZl49oPrDj+6qWL+ymtmAU/vxPNM
	bdJRPQAdc0+93fGZmcHw9KvAqlyrFbCGv5x6lyXR3WP1P/7zcPdKIV4nQVpMkIaQyOWDpYXzKpvtM
	NsSL94F/QWEkochTfNmkGO/8K2xifTTHdNTpu20ko0NtSu4o4bFkau1o9qtTxAC3hDhOphJkO2ScJ
	cPrdLrpagypWCfK4LY63yYf/IxvuvkU/xTYsJtGDD5v6w2kGsbL1TRvj9kVW+DgdKxQwWozfMvMGt
	Q2GUTPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFTL-0000000Cbld-14fc;
	Fri, 10 Apr 2026 17:16:47 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFTI-0000000Cbi0-2PAN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 17:16:46 +0000
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AGb9fC881175;
	Fri, 10 Apr 2026 17:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=vuUqFQvGRTPdk
	WC7g/Q7W4VqEsaDgZfbJ0ZChsHFd98=; b=KpTr5mtkPCm/2+ufvYYJjZurj10i8
	pWsxMXYW+UFhW9Ar1FXuVvlVo84oGE+H2xNN07TcJINoma2fikPjvV4njuJtI3r9
	VEjsz+cOmBDuLmlSapZz6KlkLOMDrVUXHV4lmtlCDpy/MBCJg1Od+0KcOOBqO0JT
	AGJK76HGHUtVaZzZT9N5XpYhwp/nbs8qFgAQzlzZLAphD8rx0JeHQ8E48Z0XX3lx
	bjibnU9dWTsDh06vKKKomGHqdWdjaYAtqMo6z9uu7tDWSVQdMqjdOpa7rjQaZ93f
	cGzWvuaaqNDhoZZnRgY8PhQOdyio5OGUtN440JHL4cLPgQaRQJiJg7Flw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4df4vp0eay-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 17:16:27 +0000 (GMT)
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 61A3AD1EE;
	Fri, 10 Apr 2026 17:16:26 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id EA36A8032B0;
	Fri, 10 Apr 2026 17:16:25 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v5 4/4] arm64: defconfig: Enable ARCH_HPE
Date: Fri, 10 Apr 2026 17:16:11 +0000
Message-ID: <20260410171611.2547255-5-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410171611.2547255-1-nick.hawkins@hpe.com>
References: <20260410171611.2547255-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE2MiBTYWx0ZWRfX/fVEDZyWt//T
 ZLFGqsTLhj8IC+xhEiX2i9KvH6x4FNhYSsAMd2901OQi/b+cjePraLY2mUVkWGHXwo5bi7ukxjf
 wF6WCuqu2NQZZEt5WXPzhLfMXIsOUjUrwNLUDM0Zv1vHi7YyyTfzVx2h+BkKVOkM611dqPmv7Lu
 RTAGEofFMtgbM+QVTc90RMERGzmy9XdDwu6Gb7QR3burkqGMkMBNLbg6wSPggUIJOFxKaZDUW3Q
 VMATwnJtHFqN+bDxtWcj7E6Btor3B6zgUexfVGpByMHpnzdzOgd7UUoPWBKN74g1r5CS03JPiJZ
 ynQOmwQCmimYYFtU9VLtoF+LlW+GVZ8S+sNOqqjjU9+zuqq3KGftU+vSNbGXi26YNwHmLz14ar8
 u8BYf6KF7eoBRgFlRxPy3mYz+sS2B61W++EcGPEnJZWiQ3/sK3ORrFs0FASDlO/mlgSTwl27Rzk
 QFEyuXblV9cKS/F97YA==
X-Proofpoint-ORIG-GUID: CQdVjpHyzbwXdvmTUOxj1gjX8w3R1XKD
X-Authority-Analysis: v=2.4 cv=dqHrzVg4 c=1 sm=1 tr=0 ts=69d9306b cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=g3u0LPWLDYfGfufhFw6-:22 a=MvuuwTCpAAAA:8 a=eJgTY4hZ_eZb3zzOyW4A:9
X-Proofpoint-GUID: CQdVjpHyzbwXdvmTUOxj1gjX8w3R1XKD
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_101644_720009_BB52F783 
X-CRM114-Status: GOOD (  10.24  )
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

From: Nick Hawkins <nick.hawkins@hpe.com>

Enable ARCH_HPE in the arm64 defconfig to include HPE GSC BMC SoC
support in the default build.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index xxxxxxxxxxxxxxx..xxxxxxxxxxxxxxx 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -xx,6 +xx,7 @@
 CONFIG_ARCH_HISI=y
+CONFIG_ARCH_HPE=y
 CONFIG_ARCH_KEEMBAY=y
-- 
2.34.1

