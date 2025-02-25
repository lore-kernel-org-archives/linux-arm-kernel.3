Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C59C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t4C3DL+tGYZMQDFK92O7UUxkgkHHfg0P1fCk8DxIELs=; b=qPzJi6yInipd/B3zAdAP36aKSZ
	VKUmCnedzoai42QK/cXJnrUwh8xQIrBtoE3FgNV1lnq38eHMVXKELx2BkJMEaKFbkk6Y9qy8/VtyC
	+dbfZo0J7/7B1V68ZAfNPjFnHEJNr9wAJYRJF4Bv2bNg8IYNqJ3r2c+ixr2pTgbQVInvE4+zcxZlo
	V8pAPkY+FyO3zqOjWPlK+fgwpXYl/6xuw+eARYHtumMYifTUdNtW9QvQVuWgDBZhcU2UufZQsG63Z
	DLIcST2R+U1I1qLG0csBmuiRgxowCTYv6DyB/kfDHm5Nmq05KxXDemZuIGeOQMRkXgbUiwFBx4aUB
	W2CIi1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmt4r-0000000H1oV-337k;
	Tue, 25 Feb 2025 11:26:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrtA-0000000GlT7-1HYF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:10:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8GQC0029304;
	Tue, 25 Feb 2025 10:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t4C3DL+tGYZMQDFK92O7UU
	xkgkHHfg0P1fCk8DxIELs=; b=YYa5YrIhLrbv0Lmas4Usp7tD0rrXwkOu6fxd0N
	B0AsOkgoffNE5v1nk1IqIy2RL9zjW0l6Mn+xlc07Agonfs9AW/l9Y8BhJmXYywv+
	C5UdO1kdLPqGDh0SHzuWsgq1mzx43hfrHxD54IHxaG2mNYmOuLInKu/cPchK7jrk
	KBCsbBDiegcHumf5wedgU/JaKLNpUMtbcA8MySiDo25hnPpbJej0775I2DBB4lRe
	fthv4xuviiOfwmdixhQIO0bLLc0vTnfcO7si8nAbTyCieeirI0c+vmX/fcvmHY/b
	Ncm1YXIDJWAyMbYyb+7i0zUbfVGRHW036G6ydYdGPtzE7kZQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y49egmqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 10:10:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51PAA0L0016820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 10:10:00 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 02:09:57 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 25 Feb 2025 15:39:40 +0530
Subject: [PATCH] arm64: defconfig: Enable iris video driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250225-enable-iris-defconfig-v1-1-1ed49c8396bb@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOOWvWcC/x2MWwqAIBAAryL7nWCLPegq0YeP1RbCQiGC8O5Jn
 zMw80KhzFRgES9kurnwmRr0nQC3mxRJsm8MqHBQiIOkZOzRbOYiPQV3psBR+tHODoPV46ShtVe
 mwM//XbdaPw/LgdZnAAAA
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740478197; l=809;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=73qkubxYAKv8s4JCwe6ccYSBzZa/m+3Q11RVn1IbDtM=;
 b=MHys0LpHWsKNIBLb3lH0qKWgAjiuSc0LSS5QEvkWUdYYJELYAz7ZUY+SoSZTtohu5MhJoroUD
 RZJLO5+Rlu3B+QF0oO7Nu/Vi9veZX1gv/wxsy/oecI6qsc+pWp2yapH
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VANBj5h4EObH-bsSi-3qBEjP6fdnwKET
X-Proofpoint-GUID: VANBj5h4EObH-bsSi-3qBEjP6fdnwKET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 mlxlogscore=496 lowpriorityscore=0 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1011 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502250070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_021008_353823_17E99A6A 
X-CRM114-Status: GOOD (  10.00  )
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

Enable the building of the iris video driver by default.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..9cc06923c280 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -845,6 +845,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_ISP=m
 CONFIG_VIDEO_RCAR_CSI2=m

---
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20250225-enable-iris-defconfig-d6b8c2fb4674

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


