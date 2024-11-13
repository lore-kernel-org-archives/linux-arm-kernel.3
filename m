Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F134BD41C06
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVqtmcxj4OORkQTSjePJL33yk5jd+tHpoRVoq3zp6nQ=; b=DpVl1lFQIve6yQx4AaLkY0OStK
	RrjeYNDycw3/hqgaHZHWsI5bYVCtb6nMHPDGJYqSPSEH11XlKF67sXJg57SIYpGtu+ppfCQrhK6uz
	m6F1v9BIxmmpQhfq4DN/lxYbxC3wOsH3ypRoRejOyNE3h7YQxtjNZf8fCBQs520jPwWN7/gvx8ZZ+
	MOf0E2wz8rtG9ssPIv3wmHT78eeul7LATPGP96+qIgNEiYUc1OXS3fETWyNjPwvqSWKjUbhj2ntMd
	m5x1ZRp+bDHqlL964g543rPM/BZHfR6brlZm/POXS82634XqJzqR6BVsnNf2JOn5C9Rqhbcxh80VE
	E+VjScgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCDs-00000006id4-2qED;
	Wed, 13 Nov 2024 12:11:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBwc-00000006eNt-0ysz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 11:53:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD9Qt27014572;
	Wed, 13 Nov 2024 11:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVqtmcxj4OORkQTSjePJL33yk5jd+tHpoRVoq3zp6nQ=; b=OXhQj9HMPte99F/i
	y90cbCMA/ONpqj3l57kszSWarhPAPbIxbkbQ5koVixeErHR/Sg8isc/lhFFW5sn6
	0zcInj2CUBXj20xv5eNhIbsZjKS6iEEkKXkQ0kCXXcSEofFHWJWhXmXVoEhYvPHk
	uckf7pS1XSvU6Ug9DNUXZbSzWERXLaI/bppsHfK20TPki7EB6B7qwMSCXNhnp2kZ
	JacyfwQocyxXIU/pv3lS2rYEzLAMSsxpkri5dc9eJb4f42mfqLjtjNXXN9e873Rj
	ei5aB4Nv9QDvMKVDksrgzmSCE4Cn1aVb91Fp9JBlPHSvj81cOUMO6zPwdgLjLutK
	uyE2vw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vsg50bx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 11:53:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADBrmc3030979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 11:53:48 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 03:53:41 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Wed, 13 Nov 2024 19:51:51 +0800
Subject: [PATCH v2 9/9] arm64: defconfig: Enable SX150X for QCS615 ride
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241113-add-display-support-for-qcs615-platform-v2-9-2873eb6fb869@quicinc.com>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Li
 Liu" <quic_lliu6@quicinc.com>,
        Fange Zhang <quic_fangez@quicinc.com>,
        "Xiangxu Yin" <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731498759; l=882;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=VdOs56Xri4piaaV5qvYXYFzwm73Lj5QH3tiEDao18/M=;
 b=wlpXoEu4wKIkhxBcrWWpR/RdPm3fWDxwmfrTM4lT4+DK724QYACs+P9RPgcE6zneC+oCIj+OB
 xtLungtJoemAHcG9P6xzGNtUXmXmQDvgmoc9UPaJ46xfXMacJynbmpS
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Jiw4ogCKbljuSvUnktCEeVCnGHC9xLY1
X-Proofpoint-ORIG-GUID: Jiw4ogCKbljuSvUnktCEeVCnGHC9xLY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=917 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_035358_318575_D2BA70B9 
X-CRM114-Status: GOOD (  11.01  )
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

From: Li Liu <quic_lliu6@quicinc.com>

For the QCS615 ride board, enable the SX150X to activate the ANX7625
allowing the DSI to output to the mDP through the external bridge.
The ANX7625 relies on the SX150X chip to perform reset and HPD.

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c0b8482ac6ad7498487718ba01d11b1c95e7543d..599a339a19435efbee7a5ef80c093b0e8c65f7ff 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -631,6 +631,7 @@ CONFIG_PINCTRL_SM8350=y
 CONFIG_PINCTRL_SM8450=y
 CONFIG_PINCTRL_SM8550=y
 CONFIG_PINCTRL_SM8650=y
+CONFIG_PINCTRL_SX150X=y
 CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m

-- 
2.34.1


