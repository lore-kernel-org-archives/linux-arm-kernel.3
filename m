Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC765C5B542
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzRhl64Zv5yDqBHxQZ3cj4CWJj0+v77+Y3Pg3G7a3BU=; b=LIwkxHUI1py0AuSkGOekJcIHkj
	at8bIOlWQ5GQmRkaLX9vKrMLy/lNUorvc2aw1lBJVwc6mas3Ouz3RdvLWy3Al/OjHFfcERBKroh9K
	/HO5PyO5Z/RkvUp70N9CkO2R7uLe77KgZja8CqgdLST31raQlTvVLjgg9wLfX1jXY7xJThs/bNr9H
	xDZwgIpGUAf8p/88OsOfDSOrBB4dxZuBNQ4p4Eh8bXv4PLo4ruoyZ8CQg2MfvitD9jeoPH3/dG31w
	kuZuhfzgzwipOmH4vDnSpvb4aKYCPcBpuwjFrAiv4bakisryq5Qr4bpHpx+eLbHdI3zn98NI/Uwst
	rG9ng2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1gY-0000000BaWs-1Um0;
	Tue, 27 May 2025 21:18:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1Tq-0000000BYu6-3znO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 21:05:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RC9o1U005281
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vzRhl64Zv5yDqBHxQZ3cj4CWJj0+v77+Y3Pg3G7a3BU=; b=ku8XGyGNM0cD4O2p
	e/nfCt/gQVj1hNBbSv7MvO8P4az+FAp6b9N5ArvkdWR2iW8Hdv6/rvgkpecyuhFJ
	m3J0qfvmSsvPyRmJFA6Y9reIlgYRPoCkzRCT89oK491XFQBQPRJarRMRxVhBkQ0o
	zku//xs6drP+5+obIpRr+iMBYeXz5lT1M3RlbH2nkwX1xfpDGd/HoETNq9goUhXW
	KUxwj9tf+tHBWQdkFJUArrC3WoaaTu6w/0xHk1EOec29EgRILnNtPjRRaGRXkoOt
	T5n+Myo2nl4tVqLczaamkHpP9xlKMPZYUDc0bRVCwFfXcFkjjI13gsFzcjAsZAYa
	yNGXjw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p88vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:05:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso2786337b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 14:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379901; x=1748984701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzRhl64Zv5yDqBHxQZ3cj4CWJj0+v77+Y3Pg3G7a3BU=;
        b=KT9QrWVvtU+eeQ31KmC3p4ZfqOnN5NjAbNWXQgGF9nsTbzVPW24clk3UFmUSesQgOu
         jBCks/jmCRRkR/BaacXHg1ZIhFjn5mLvUM3R0uOCPHXYKUIP2r8mN3y2koU1Eu5fgSv8
         RvMXmhT1hzgTFdqSf1MZr6wvdJrxbjg+gIj/yNb/sUFUicCNuAkKU7tjj7LsfU+9ubSi
         7yLls2rJ6uTtJzPNW7VG0lilEKZVqtStxa/QkKCZdP8x7oEHMI3fiaQdormiD+NF6qHG
         v2firSgPS9olI3UwvQylksIXMKGM5z5YlgUPEMsvc7Buja9jDfzfzaQwtjSvRurQpUe6
         4blA==
X-Forwarded-Encrypted: i=1; AJvYcCVI3vr6ONT9o3u6923oewosGNljc63/HDd2j09D5e5jBDg6RZHUoztR8qlQv82h7G+A9PS4BQ4n8trsVPQNHxmS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2sIPXWygcxmWRfiZYhYXfL+mxbYbX6UFR/7Lhz65trLcAJJWc
	OpCd0vbx/bh3i4vkzioaCsxDnivwNRgmJwauY6DgCZGpFtAGEuVb7ycV9RnVe4VV8WAhrqPO0MS
	hGlXhJmxyAtPzF7OsR9d32MosnYAD5R30mJORIsWXRTOCgkoAW8cNae/n24umtQjby0nhuPrqvG
	9q5SOCadHkKA==
X-Gm-Gg: ASbGnct2XUJnwwaZnmEFvBb9SYNSw3zUstb9hOXfwyFNRHFciCQ1BDo5rKIvIhDImaZ
	fwBXuIINRp+Cn/iEj0kMbc7G2yYrFv6Pz+ihpQgMxFWxl829k+r4kXaYsJsqpdHdC4Tr0up7Jiz
	ylKKXuSPCjft/db7UDgdQbkBhk/fjjgIkF8r2HhJQHK1Y5kCTQAoD+RhKFYjG98XdeNXAwWCmcY
	KIM5EuDVApdbw+9HerGrI7WHIBSC8eeKhBUR+kJ7CIbBRFjT6wVSdpKje3jjiAAYH0QxcLmsE4O
	pNmb1fNPGpfWdI9On8pIJeyVSquG0ddhlHjK876hyx2tPciT33a6V3I4bW0yLSNE/a4=
X-Received: by 2002:a05:6a21:3305:b0:1f5:87a0:60ed with SMTP id adf61e73a8af0-2188c289ab9mr22294729637.19.1748379901394;
        Tue, 27 May 2025 14:05:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP42zUWXhEhoQN5IEHJjKv/vMbeqty1ztD8a25bRQwLQO3Db3gW3dczT8C8Tba1smWx7q+Lw==
X-Received: by 2002:a05:6a21:3305:b0:1f5:87a0:60ed with SMTP id adf61e73a8af0-2188c289ab9mr22294694637.19.1748379900997;
        Tue, 27 May 2025 14:05:00 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:00 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:41 -0700
Subject: [PATCH v6 05/10] phy: qcom: Update description for QCOM based
 eUSB2 repeater
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-5-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1426;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=2C6aI5pd5BWhSTEhtHBak51NwjHm1CBTcKGDwCW84eg=;
 b=+RgrZ3qByHLV/U1fiMG21YBXz3FH3SWPCbcDLBDzvXvrqIQqU26M7grdrJWa2RNyA/AHze4N/
 vb6chONnS/6B31yW7+693rVPVIUjPxlrSEsHR/5RkqyBCWY66Oqo6R6
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: zmVIk4FWfSKurExxjspE6wGvMbp0irCA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX1ien8ZV4RGWK
 Z/MDNR/NWhSUKbPQy1MmdArzVe30OzlHjrP1jz7We7rUhn2c2OifFCt9ZshBZ+xl0q87ms0mh/y
 ozYh2+AYhhI5/v+kG7i/8/6Q35edHXDimBbkJ49iMAmmaITOKq+oKwzl0Jt0nKYatTQV5hi4qmT
 5R1AXGB9DzE+ZjuxtHj+9BxoORKScFfHyTHH36Zx8yAoBvhP6Tq1xAWr3kkFK4ZB3+n2FuhrElH
 ujxr/1CBRCCoOKyTyL0Li/Iml3ZYnRZ4KinDCTAeoEqWN0AXWd1P69DYk0XzZURWEhJjEQkQ8qO
 0OCOWWn+pQgQR/+ID5WLcG7bAD5NII1IbuuWs1J2sGGuxmlB8nmtcRNu2POtWDdyy/4Oh2LjH8m
 4ydVjACmrC3RApwK4lelpMwMa27vyv/YuWC05HMOEbCg/Vi7IE/+Axot/Bq+utKTi/+wGei6
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=683628fe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=2IHzoM5ujN45o2WKKn0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zmVIk4FWfSKurExxjspE6wGvMbp0irCA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=992 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_140503_006392_D14BC902 
X-CRM114-Status: GOOD (  15.37  )
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

From: Wesley Cheng <quic_wcheng@quicinc.com>

The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
needs to be updated to remove associations to a specific vendor.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index ef14f4e33973cff4103d8ea3b07cfd62d344e450..85581b40e598814cb27d954e8c63eba809702622 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -126,12 +126,12 @@ config PHY_QCOM_QUSB2
 	  USB IPs on MSM SOCs.
 
 config PHY_QCOM_EUSB2_REPEATER
-	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
+	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
 	select GENERIC_PHY
 	help
-	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
-	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
+	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
+	  PMICs. The repeater is paired with a Synopsys or M31 eUSB2 Phy
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_M31_USB

-- 
2.48.1


