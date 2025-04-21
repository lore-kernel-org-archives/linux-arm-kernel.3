Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2100C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxIreYtDs8PbxaWWNugh8dWagakL5JwQYhA96Zqa+B4=; b=SOIa/rWA5xks5b9n6vuB1wnLZq
	gyShhUCIU+JVuU7JRUwmx0B3Ti9HbfYDoWDUxPBEDkXXoO+ot44ryv5Zbg16tTRgcKe3nT7Lm6Bab
	7ClZfD08rqQ/KGy4c6flk76syXTR02Oc8XsfqWCbkAkly1wYEzPzMvQWpyErM33yugQj3ImOBQOcl
	bl6lKOA/yBJAMZXeX3bNBkO/2EtfGyhT/W9pmKPcEEsc8CKZluPSGHVZexq0ll/N4FI9A5tiMCN6D
	V7NCV7pv97vOHLyT8ahL/LbljexSByNXgE+4cqw6LVA/gQY34x8aAEsIfOk4thIJGPJXcne9aRZpU
	VoWK7sRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zdV-00000005Knx-2F9x;
	Mon, 21 Apr 2025 22:29:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zC1-00000005Gg5-23Yy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 22:00:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3sMV010283
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxIreYtDs8PbxaWWNugh8dWagakL5JwQYhA96Zqa+B4=; b=SPrIDwSfCZk8LcCs
	H7FS4181QO7ZCoVZcpL4inEKpDlj2RGbVk0bu+D8xnt1Wpga4CAMyP8eIBcy066m
	Z6lC/YhMVR2YVPOveBLC6k8a9pZCfyMTlaYLnET6yih4UGlvWbZx+IFgFx2uuJaA
	q61pNmlSrlP46frW97lSqkMPNLuDKRS/guc/4HNy6GM01eTUitO9e3jToSqvyCMn
	rPvPjQ9SiAViPofaEeGNhLqcw2y2PbZgs9TJvcosD2yASLwTNgdDAkbUfKNcRS7/
	01mnpViGTO9IXLLpDyO/XB40BU4xn6lJVPLm5tH3z9toOKIUSZQDT/HYdG/v2WEA
	CMk+Kw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jdd8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736fff82264so3331629b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 15:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272835; x=1745877635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxIreYtDs8PbxaWWNugh8dWagakL5JwQYhA96Zqa+B4=;
        b=gFHWhprqmeYZ8PQomYfgtG/soloe0YPpgW4jrTc4PQ1osIi9PucApO5/MXIDsCDKC7
         uemsHDUufDwBGdhZBE3l0xD9gLXWLgOV3hgLigLdk1JCZDL05ODd64ezpclW1pAcSjdk
         oiYxTeSfb5vU0Z+Z4Cdl8Wm/xyG/Isq328xECGdNUKPElZs1kDIVJ2qUU2DgS+QRA3Z4
         D2BXhkyc8l41qoQsIm4RAsug8qwoXUSN0E+lRho4NI4ho7s3FNBupqAsqVYT+6IexWkV
         ehb1sKPK1gTwbsJRg1YH2VhQFExkyQnJ1CEsLlPZRqKBJB/fKbbwztbgBEcwo5jiVZRq
         s56w==
X-Forwarded-Encrypted: i=1; AJvYcCUq8MGMMJaaBJ+eOL5Q2QMHCVyjyOdRQjQdYrLFhAAHZeX9hw7PNC2wLTJh7QreLDi+M/KYV/auhFsHTg47XAvd@lists.infradead.org
X-Gm-Message-State: AOJu0YxHQCdsYSJNsL22vbHA1PZgAxne36SftLfODgiS8HPvurxa+uix
	zpMhNrzBSZeJCvtoAhjxBbVzJgdLn6L+F17UeXjfibooujkOHxT6i7ZvbIVTOu+XNtIi7qRG9Fd
	3fYCC4jQema2ufh6LmVCOKhnQiAqRMo7R00VNfzNhR12MZEZfqJP4QsFCFyoYVK9nRQELiqBxbg
	==
X-Gm-Gg: ASbGncuNnN21WFN/XKUSJqPMNmbQR+vr37w5D5TYoqqB8s9evmCQ/WQifdj/INeSex7
	ncE6K3tCO5CinB89lvdaH3Nbt/CdCRS4IYG+vDwIrj5XyK/Tga3IztFwLREkkg8aUwVLkEs6uOq
	pFf8VNdia84yKF4lSAbwjj6V0IZa/C/OpYmJLt7NtjVCXQktFhx15MqnkiJ7fV/FxijOPghsw+L
	9jIAdE1CfilegCIC0T2ERen6C5WPeP4bCZcCSuUtMVaub9rNbQfuEMg+uh/ErREW1evZKJLEthQ
	qG789Qc7I71g4Yqbq2a51dr50b5Jnik2rZe5MEQwZEInNCcCOVZS5MoTXRKW9vKZ8TU=
X-Received: by 2002:a62:e315:0:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-73dbe601c10mr16714374b3a.9.1745272834775;
        Mon, 21 Apr 2025 15:00:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa4d/A0MdKe7wsQHbdyWdb8WfMEvnr8OJVqW1df+NeezeSlqtJ/whYCxmwSASSmgAQKiKdoQ==
X-Received: by 2002:a62:e315:0:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-73dbe601c10mr16714297b3a.9.1745272834133;
        Mon, 21 Apr 2025 15:00:34 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:33 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:12 -0700
Subject: [PATCH v5 05/10] phy: qcom: Update description for QCOM based
 eUSB2 repeater
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-5-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1377;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=+hImyIOsCXufDPn2hP6J7P3TE43wajo+VUahTyCkksk=;
 b=e1eWhBFHzDWXtYIz2cG0r2tDlIYq7kkjoByLMH3dJK3efUPNwqwPXRsotlSepEFtiK4HvWeYV
 56XvmXYuE46DxXiIiZYfWfv+gCA/1Ne3Xy6BxIOP+QrhBjZD2uOxJnZ
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=6806c00c cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2IHzoM5ujN45o2WKKn0A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OAvBweL5AlGQRporcHqFReO6hpngqv9j
X-Proofpoint-ORIG-GUID: OAvBweL5AlGQRporcHqFReO6hpngqv9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=981 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_150045_662141_E72F1182 
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
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index c1e0a11ddd76c2056eb2e72a287ece4def2cf5d8..3cfb4c9d3d10dce49bb93b241f9b56c75b934601 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -135,12 +135,12 @@ config PHY_QCOM_SNPS_EUSB2
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_EUSB2_REPEATER
-	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
+	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
 	select GENERIC_PHY
 	help
-	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
-	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
+	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
+	  PMICs. The repeater can be paired with a Synopsys or M31 eUSB2 Phy
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_M31_USB

-- 
2.48.1


