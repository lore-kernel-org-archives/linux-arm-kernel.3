Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82F8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z2nwhIw3fRC+5K0tp16aG9nKg7dkSFYFnTrRZLkyEKk=; b=E02UuZscnGBpdm
	0fHn8M9fQAUEyVrml2DoGxINyifYWMoInNm+WvBUBkm613JVwnJHm1aZGFnH1lduyk/tRwmIooZ7z
	ZOMEGOTcoLvE+BEL2a2NzlxblRgoIuhjNtPdiecq8O5wGKP06FBxKtPWPibQJQmYtD+S0DCy2u3pz
	tcj1KOQGYmfwfnakbhPjn9/E6nAhD8Yeu93Ih/20XL10gnz4+gvKbDi1WeTEyfxTXQjflx/LV3fdq
	2r8pPFaOGlxYOnC6uhQ+INrLutQYn50fOj6mqV9XnnwZQ3mwAvRkYKeq1ztYRR0eypzlT3FhTAHaM
	bywwEJhUmpCBYlXf8XMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zhA-00000005LT7-42Q8;
	Mon, 21 Apr 2025 22:32:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zC1-00000005GZF-3hcv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 22:00:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3uaX012331
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z2nwhIw3fRC+5K0tp16aG9
	nKg7dkSFYFnTrRZLkyEKk=; b=SGA7w7c2H8tQqATXgworC3W75ZnyyMAj/hvP0j
	7OlpYCUpUmDuNFQhTi9qW3Nm6lPjzY+aJWSydcyg21Kewcl5r7QxZRQvg7kenlwY
	h5U1WEZGgcLDNQIOCvj5HIB9PBtWwAYmR+E4WciSMBuZ3psKxGGjhbRc/cyeEvJc
	gkSPDU0n2zn1zDBTCXa8BGOvO6nk8rIQgTbrz1X40JHWBLHJ2kUnxYlSVRCmDT5k
	OPSkCmw+oafwiv3xjewpLp0Yb9qAf54rXFRyDloNVB8RodnLF+n9nyidFyLZx5bx
	PzzO9PzTA1X8EzW9lZz8vhcf1vsyOga/Eomy2I/IyRfCuG4w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426na40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736a7d0b82fso5371780b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 15:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272827; x=1745877627;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2nwhIw3fRC+5K0tp16aG9nKg7dkSFYFnTrRZLkyEKk=;
        b=hL1g0R1h+pYKmA9+6/3pvXz6mars+Tr/bWvr9TCPmEZcLNGJxxy5ivAw5ksWpFstL7
         uiZCfmyI8B5kW84EvAXmQvTTUcheXQQMD7JxynLh4dUVO1vjPpMhyg8rm8ISnx245vdi
         1ItXYCC297PXxPG3IJaOpKtvLPW7lOaoslB2gEIP5tjnvZxQavFJDq+yVuDKHnltkVFG
         j7LXE9VIpLA6w0viimZb/Xa/ZlKid6BW7NjTPg38lNr0r6N+TeFDQBpC1cpo0vGeMFPw
         e6vmCv7GL63x4cyIn6lgdy+NSWgMvI9V1/J4HAjAgdQzqTHurYmQNOIAKzv/tOb44fLc
         1xFg==
X-Forwarded-Encrypted: i=1; AJvYcCVf09q/B4tE++O1WQi/V4IJ2lptlcdk/+8KRcMJsBy9hKVyIQMS01OoBTr1DoSM1r2twXzFVPoY4WxR4N+WOttK@lists.infradead.org
X-Gm-Message-State: AOJu0YxyArj2iaDj65N4dvhqsGdz7gmVMQIio5920ChJ6Ugdplq3RnV3
	J/PJ0ZWz1p6bq2l7yXbIsaLcZl/0Nd7Y4+drfACuOnIZajikTNX1cw+RX6QKeV5TZzb3pseNZAv
	xKFrdlfq9HPeVLf2xzHuAz8rElo96xe9f2Or1pIckNIbUca28jmxqxQN6Rtif4B304nIUEcuh7A
	==
X-Gm-Gg: ASbGncvACwNZY0NchCJPE6WPbXZ+giOOEZN4TsZNaz+qqlHgwE3qgmBxlTkLvuvlawx
	CIKzgJWwzbJJ5DeA2Ze86dvVFxuOw6H0Qei7VnOnSPt65P/XvFBmGWwwkpxLTpvrW3cuoEOBwi9
	E7zY/0e5e0qfAe18Dv+lxvMQVpzzra8+3wfDoBmMu0cAGuV4NQEgoEQ9XdGa9RUB8MLa2cRAVjZ
	/2sNJhkm/t6hktDjFf1KXM8IQ7TIuxg1mEzCHR4DWqoQJth1A+dNi9YdR1LYfu8IhR5D6gyKNpS
	2tHNoEMVGdWYgqJ5GDXE+0tCoQKFLc7Dtfi5wrJxwHqPk2flHXNpWn4uPUMryT9wj5M=
X-Received: by 2002:a05:6a00:2306:b0:736:728b:5f1f with SMTP id d2e1a72fcca58-73dc1563b59mr18654553b3a.19.1745272826984;
        Mon, 21 Apr 2025 15:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEiNVceThK2Kg24uwBSmbvNtspxZujpUn3Tc0WF0tvmOGh7jcgXhL+2H7YtDA9KCnXcHNDsQ==
X-Received: by 2002:a05:6a00:2306:b0:736:728b:5f1f with SMTP id d2e1a72fcca58-73dc1563b59mr18654503b3a.19.1745272826494;
        Mon, 21 Apr 2025 15:00:26 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:26 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [PATCH v5 00/10] phy: qcom: Introduce USB support for SM8750
Date: Mon, 21 Apr 2025 15:00:07 -0700
Message-Id: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOe/BmgC/23NwW7DIBAE0F+JOJdoWTDGOeU/qigisDRItd2Ab
 aWK/O/FycGV4uOMNG8eLFOKlNlh92CJpphj35VQfeyYu9rui3j0JTMEVAJR8tyauoLzmC/n1ua
 BEg9YW/J10F4BK7ufRCHen+bn6ZUT3cZCD2t5jXno0+/zdxJLu1xUIMTWxSQ4cGhsIOEdVqiOx
 XOxc3vXt2zxJlwNCWrLwGJY3RiLpA2BfjfkPwM3DVkMIQka7Z0xwb8bajUUNFuGKoYmp1G4xlx
 IH/uc97fRfhejfUHzPP8B/D2Jy5oBAAA=
X-Change-ID: 20241223-sm8750_usb_master-f27aed7f6d40
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=3888;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=GqLIDTmASmJuez3f2Vh7A/GBPYbqnVXDs4axx1Uz9Tk=;
 b=tYfnsk74vDromhc9s0GbVU8dU+9G5b/XuSQBhXb5hAPU15cvy0cQga6yQgytgb07l5CoE8uGO
 jQg+85E99ThDOJ5bRmAyRV134xZxt+PKm7/CkuPKBNmpnzAWeD51FHa
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: zU--cWJ7wrE4VjRzt3JCQVNieF0fqkx4
X-Proofpoint-GUID: zU--cWJ7wrE4VjRzt3JCQVNieF0fqkx4
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6806c004 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=UZ4tNvspqRR6S34ExfcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_150045_967795_30DA06B0 
X-CRM114-Status: GOOD (  20.52  )
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

Add support for the PHYs and controllers used for USB on SM8750 SoCs.

---
Changes in v5:
- Removed refclk_src from the QMP PHY driver as that is no longer used.
- The decision to move the TCSR clkref property from controller --> phy
node was made in v4, and the refclk_src was a lingering change that was
meant to be removed.  CXO is the parent clock for TCSR clkref, so CXO
clk will be voted for as well.
- Relocate the SM8750 compatible within the qcom,dwc3 bindings.  This is
to take into account the change in clock list.
- Link to v4: https://lore.kernel.org/r/20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com

Changes in v4:
- Made some fixups to the M31 eUSB2 driver
- Moved TCSR refclk_en to the QMP PHY DT node
- Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com

Changes in v3:
- Split platform DTs into separate commits.
- Fixed up M31 eUSB2 PHY driver with feedback received.
- Reordered DT properties based on feedback.
- Rewrote commit message for enabling EUSB driver.
- Link to v2: https://lore.kernel.org/r/20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com

Changes in v2:
- Added new QMP PHY register definitions for v8 based QMP phys.
- Made changes to clean up some code in the M31 eUSB2 PHY driver based
on feedback received.
- Added bulk regulator operations in M31 eUSB2 PHY, to ensure that
both the vdd and vdda12 regulators are properly voted for.
- Removed external references to other dt bindings in M31 example for
the DT bindings change.
- Split DT patches between SoC and plaform changes, as well as the
PHY subsystem Kconfig changes when introducing the M31 eUSB2 PHY.
- Added orientation switch and port definitions in the DT changes.EDITME: describe what is new in this series revision.
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com

---
Melody Olvera (2):
      dt-bindings: usb: qcom,dwc3: Correct the SM8750 compatible
      arm64: defconfig: Add M31 eUSB2 PHY config

Wesley Cheng (8):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
      dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
      phy: qcom: qmp-combo: Add new PHY sequences for SM8750
      phy: qcom: Update description for QCOM based eUSB2 repeater
      phy: qcom: Add M31 based eUSB2 PHY driver
      arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
      arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
      arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  79 +++++
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   2 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 164 +++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/phy/qualcomm/Kconfig                       |  16 +-
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c          | 325 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 ++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 ++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
 16 files changed, 1062 insertions(+), 4 deletions(-)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20241223-sm8750_usb_master-f27aed7f6d40

Best regards,
-- 
Melody Olvera <melody.olvera@oss.qualcomm.com>


