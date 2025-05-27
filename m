Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6285BC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 21:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bUgdbJ9307iGvajrrAux74w044pWeNfiJuOUqJnpRyc=; b=CuBrn2yTuMTZLM
	6nIsPZdpROLQLCraN+jT52Df+bPcUXzpdFORTs1YGeoXSU0ncCeGj8dyr+C5YSA4uPOzGso2K59g2
	WbzGemWdh3MiWWePAhM0EGPSHim7hFXkQDsS5LZtB1aoLIpKuM7WII/yK10NHPCLgWYjUEy+MRkeT
	TXMQNQSL+OBWagnqMFwi9U8nx8Ml/VZ5wCc1p1FzIAy53LEsF3NdW/2aaFczSAHYjky7zhIJxc2yu
	jSbNPdR7v7Vs28JEn8Uv1gXKI1sX9IoYIhuGR8aVMmzqvlgvsSD8zL9gRzAwQPx8Tis2J8zp2FQuw
	FnmfD9WjAcfWOcDBreLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1Vw-0000000BZLF-0hZT;
	Tue, 27 May 2025 21:07:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1Tl-0000000BYpe-0rrp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 21:04:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RD3GrI003683
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bUgdbJ9307iGvajrrAux74
	w044pWeNfiJuOUqJnpRyc=; b=DRbTNJar+C5jzTqjz0fhcFOQgRQwEmccbbrprc
	SyKZTwdfPF740nsBCno0MK+GANalIHP7oX4PNbRELPijnFfFv+Wdk6WePrrNXmTl
	5w76DtRXr4EdUmvyczsVPfY8ZFvbKPHvpbHwq+8J22LTLxIMxijWjsrDuomZZnb4
	GOnH2UE3IaCkVOu+aoGJWhjlggwLmgAdNOOTMo71faUHv4fRLuv7DRT1OQsRZkyU
	Nl6TugCKC7OD0yCwb6q7IyM1VQbU/xv7AmTAF6XU5iYiD0cAkIZIWPdse7GgpVlO
	PQdlXWBTNGSutKdW6UdgjwFUxQM/WDc9lxvjgGV/gQJG9woA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek0668-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:04:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7370e73f690so4565561b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 14:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379893; x=1748984693;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUgdbJ9307iGvajrrAux74w044pWeNfiJuOUqJnpRyc=;
        b=WL65JL07ShElpCwSUNBbLHipablxb2lraFiCVSxD3dUOZ83qufofRrd8lLVGJqcYKO
         jH1kpXl963Et2TmcQss+QU7v0QPbfcO/QnJf2HR9DJ5h2k0rkIzNBNuDCfFWf/wOFIn7
         ERfMB06DVXMUg7y1HoEG18PRuiyEhgWgw/oY8WduLUjFfI9T2FVNQ7U5FiV89BBGJqLW
         Ai06JU0oslqy3kF5BySAPJ2O7s5hy3jEodzjpFjnObfWDbcFunD6skPaR8shDrtRyaq4
         tr4QPUaiqZWU0N80PbEdcDvd/K8KZBC4Zm6bU48W9CrKzoLCyCYGfYRi1gxPDnb5iKM1
         +pnw==
X-Forwarded-Encrypted: i=1; AJvYcCVVsBB87aQFE4qpFTpDMeSqbhP35hRgelRPjNwSr1Gr/qzi9/vouUvs5v5vESBb27GxiWemgABItN8fGuIjCAd8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2EZendFRxUXxonk3SaG+AF5FnSIsQDf3lfp+39RLsbHK9PMUV
	5CKNLjkZ6q8aCrlyVXEjpxyEIOmIcJ8Wgr0y6uUVOViF19ZDPTBzlDVlM5gnDukEOsLFmqiSGuZ
	FN9dTe+qbkLSnv8lD6+cnAQ6CO3K6z1YZZjPyGofUbHDIrxQneiBzoz8KIdS/LV4R5Ojf8F2zPW
	RQsa2/gCrfIA==
X-Gm-Gg: ASbGncugM911KO3DIYYufoibzaE6sqZow50jq+4NIZpe77NmV8FK9JMUiOeBGwsWA0R
	7G8CGVZ59WPRsHC24iNSAXyRW5P7gVSTNTMhigmuqDqn+mQOEAphg5auUgYg7Vd9MQbzvh7vtjf
	42MlfUIk7rzRHa60jUcnW+l2m2N8dfCryV5LQJkVXzZ7KsZuO2w8YVT0ecsbPIHprKNXnK6OmII
	++ps/x8hgEM8R2KyjHJPEr3osYGP2nm+zP44Iar5u3kcbpYcP/HpCBuQa+PC0s22kvB7ySW9r2Q
	ONHsrJpaFF2VeQaQHbx3jrXwiNPcFoRUrKN/Z/NLCm1jcK/+k73+/vHeBKLUhETVsew=
X-Received: by 2002:a05:6a00:17a9:b0:746:2ce5:a491 with SMTP id d2e1a72fcca58-7462ce5a712mr3645274b3a.10.1748379893424;
        Tue, 27 May 2025 14:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdKiWLumEIDy3APCQkLZekdpH+dDZdoDM6L3VDfmiSlLCJgjPEV4ELcOqOm5byIoxyev5IRw==
X-Received: by 2002:a05:6a00:17a9:b0:746:2ce5:a491 with SMTP id d2e1a72fcca58-7462ce5a712mr3645231b3a.10.1748379892966;
        Tue, 27 May 2025 14:04:52 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:04:52 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [PATCH v6 00/10] phy: qcom: Introduce USB support for SM8750
Date: Tue, 27 May 2025 14:04:36 -0700
Message-Id: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQoNmgC/23NwW7DIBAE0F+JONfRsgYMOeU/qigisG6QarsB2
 0oV+d+L04MjheOMNG8eLFEMlNhh92CR5pDC0OegPnbMXW3/RVXwOTMEFByxrlKnGwnnKV3OnU0
 jxarFxpJvWuUFsLz7idSG+9P8PP3nSLcp0+NWXkMah/j7/J352q4XEjgvXcy8ggqMbYl7hxLFM
 Xsu9G7vho6t3oybUYMoGZgNq4y2SEoTqHejfjGwaNTZ4DWBUd5p3fp3Q2yGAFMyRDYUOYXcGX0
 hdRxS2t8m+52NboPkC4S8BMkMoXSNIQ/cAxagZVn+AI3etQ7jAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=4181;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=4Otq5/SJ7I4zFyhmnnZUzoYm2viVKcjqEocffO3PcQc=;
 b=N5YNjaqcDY7JTLuV4mDpZMezmd80Zbmdr5qoIeetMTUmjJ5V3glufVSP0s5Jx+8BXdoJCWBiM
 7rWoHD82fw5BVmhNiRwkJKfYYRBkOPyMbFSvArSZh+pZ8BhQMUVpisy
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=683628f6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=dNz1S4BQCA6GZfmXsroA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Z8mB5TxYkFVyG6Sf4iCmPM2NcIquuqIG
X-Proofpoint-GUID: Z8mB5TxYkFVyG6Sf4iCmPM2NcIquuqIG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX7TNPKuPtNqr3
 7FdB3qqe8ilifpIGU14mjPpdKkxG3D2q4LfuJlk5+OVPKaSgK6NTKFyeWFGI5WiRt6NipX1YUbp
 YDReRsR86QKBdm6DcMC3zcUl284Ite5hyVgKimDVbXehM/gFvCrvyDg/D+M22riXTUoJg/V9Oxj
 ydcypC9aoHMZphrUt7zU75TET/S+dGiT8tkYXoiVmSeY90HUue5yu3s7l3g0OlpzOrIUuMPqHaQ
 P2ipBWsYJ5+9tgbjcTa2ZVSC3fjpPz6NWPSG8Eo4uDrTR1q7ksq+kocx5Ga+F1A2A+mHBn1FPcK
 UnfAeqycuTjiJ/8i9n+1L/SD5N3cTjKZLFa4h9FejUvo80ycA4dJf6eldQX/Jdc0OWKqS31qu13
 o41v1bI5NKlp57BshRMM20HZtjw6MZduxeR51yWkv9SHqkCpOU/2l75/HIc1zqsNjdqgM5On
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_140457_361138_9F6767FD 
X-CRM114-Status: GOOD (  21.53  )
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
Changes in v6:
- Change readl_relaxed/writel_relaxed calls to just readl/writel in the readback function
- Updated languange in the defconfig commit to specify SM8750 as a Qualcomm SoC
- Link to v5: https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com

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
base-commit: fefff2755f2aa4125dce2a1edfe7e545c7c621f2
change-id: 20241223-sm8750_usb_master-f27aed7f6d40

Best regards,
-- 
Melody Olvera <melody.olvera@oss.qualcomm.com>


