Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD14CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oVCtfvOAMMbqkNqCa+q9Cb6hDsShNb4EGCU/ePnP6H0=; b=3JxmbNTD1cWHyc
	EqbZ20Kofh5M+Z6TvICDSYiZNFUjDSaEDfGF2XaLHWiaCjj0Yg7oLa5S8dSy/MuEgry+CpJFstDwN
	c0/LXwAm10xiJfIU9jfAeRMwbl6rT2pI/vv2S5WjF37bPO5mMFxgjA7saZ6Mb4dc2vWnyyLPNHTBC
	A08KFXAOEeaH55dnA05Cz17c63eEiLuI44jrCvc6eaxqLY9McXGo/ZZGSjbcruy07BMPJyhKeupUO
	rjg1vnNoYgFBQ9R6N10xZgLxO72lHAoA1XBJJSVUSHM/uAUP8dslQn/DaGZEmAlSNQaNDApDED1y7
	4137oHXv0qfaTNJahh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7ED-0000000Giaq-11kt;
	Thu, 04 Jun 2026 12:31:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7EA-0000000GiaU-3bSg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 12:31:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548UX951132208
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Jun 2026 12:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oVCtfvOAMMbqkNqCa+q9Cb
	6hDsShNb4EGCU/ePnP6H0=; b=H3NI3kj4ZuurxfJZVm++bRwxL3cJBUp3YZlXUY
	MwZqAuxKRSoKNb7pTolPXWLrEWW/mewM5klj2kkr0E4YieQ7DnsM15srCgkkAVHl
	T/6sm/yKEJZmxZ9QfqkB+Fs1zLKE8yVOYPR+Hs9pvkW4D6xJ2kp0qHU0eSP5P2tQ
	T/WBDbfO71UaczluEjEdzQC30KtAKRwwrLv5FvS2XakzUKvTtB4uRzgX1SpjESqS
	mHXEmjxcXdZBkAPtMO3XKa/yHOT2xyE9L/2rP9HUdBT0/6jV5x0ztjhY16t1GkWs
	4peHABjNr9tIVkG9kF32L/BNUOk8/yqOkNIScjj0ZhqJMQrg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsgw4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 12:31:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422ca754d8so515616b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780576273; x=1781181073; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oVCtfvOAMMbqkNqCa+q9Cb6hDsShNb4EGCU/ePnP6H0=;
        b=CPKPHYkG/eNkGx6mgjt1sNr6pVt55jGWNb8zmqye+gYzoB0imqVzT7hv1IAZ+W6mHC
         D8ubsrLcLU6PKGMyiZlsuHM7BHmen+GUQOrt6rLXD6JnZ8+Xe5u92DGsK5yZ8UhhBcg3
         dHD0ebkN7l8OxN61KuF/25ZKUdoK6MruewMaohGbhelw1FM8ES8Lb8HryoQfTTsEd79v
         MXF96TcU6tFB19swZR+WTDKMFsTpAnGDar2bhGu8MFaBJBOtv6EgIZ/KmEGZ4WAr0eu3
         LeF68ODdcuu2E0pwIqbu7oNmUVQsRFZ2qP+hIG02Sw9M+F6dUjLzEDgSF0Y2X6o/etvP
         OZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576273; x=1781181073;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVCtfvOAMMbqkNqCa+q9Cb6hDsShNb4EGCU/ePnP6H0=;
        b=hX6bGMPVQe/j0VKG51C0lziNmMNu61+SaRobM+G73wU6LJCA07SEgsKM4XljXKI1Tx
         tX1Dks5NQt/Mi2pg1NXYf1fTMqla93ZWdr+/obFX7Y5s/P/B8RLetMCq85ObfqSZW1db
         38fDOeh0SSkL6//T1hQOsJtiRUbH8p0Rpy0Zb1ZP+bj7a7CBUrXZbruL2cPQT6ON2Dfw
         KbtWH1L8OPDOmDToIO0tL5aqxyVSl2DdR1SJ/y4BC7o0gbAdJyT6RF7R1XOn/HOeETGv
         UGaqdVKn7HbjpgdCOHCxTDOUFnQjk54CYUhwUxXoqTGBeLjTvWGH1ZbIj3YlJ722yxqk
         YERQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5h6Ry4raxgeyGKi1WKj7Hlo9IOXKvGid/a4GxBptP7mIJdpYKR85Qg304BS4p+1AiC44o+DruBXb79ZCgvbJA@lists.infradead.org
X-Gm-Message-State: AOJu0YwWiwJ44RpTnNCHDFx+VYcXRg6u+BQVuDqDNjXVDGB9RlRWV5vA
	WRd1KEpXmmU0Ib0fE0KA07WkASt35EJodFBszXFYCEBEHs7o8/Lx21ZbotAMWFjl0MNur8BELiW
	TKtsPl5nwLub47Bpmq00hmvqv7C3YEupoOZSJPJDomULgWowRkdOMtIQfm5+OQbbbpadpDo6Ofm
	zAYw==
X-Gm-Gg: Acq92OHq6UbcVwhBQvEbZbZG4ZQs3kEoN4xaQy+ZU8fPU80GunnQ+FCregO2MkoRXAf
	Vr3XeuC8WqaB6HbU2m9XfgE/WcR5PIifc6G1SK0jzB2zLQVlAK02VyPMnZE4NEQYQ4HrNjvqwTV
	wvJ1glpeitPvwF4R1nDcwUJQ+sjgDxmlzNr4AXqAbIdNnB/AgFvw52fe/7JWm1gMz6HRGBGx5Sm
	s9VPVwtB7MDvaUrQH+Cnblm5ABfoLpFbNv0RMbMx2aThzOMV7YY1UfrvuI25wSft+ctE5I4janW
	/hzeH7aXigEvLbpENIa//z/CCvxBP7cHygyTsxAZIvRZ19EB01LcXjvsQYwm30++n8XmSf+hnOP
	bb6/66P5Didyi5DiqxDIomWCCfD+MEsRrs7Z44ialBjT8mAwiXLymVFEcl88=
X-Received: by 2002:a05:6a00:368e:b0:841:dc85:1638 with SMTP id d2e1a72fcca58-84284f53d31mr7173814b3a.42.1780576272429;
        Thu, 04 Jun 2026 05:31:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:368e:b0:841:dc85:1638 with SMTP id d2e1a72fcca58-84284f53d31mr7173753b3a.42.1780576271868;
        Thu, 04 Jun 2026 05:31:11 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm6015917b3a.34.2026.06.04.05.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:31:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Subject: [PATCH 0/3] Add Shikra (QCM2390) display
 support
Date: Thu, 04 Jun 2026 18:00:46 +0530
Message-Id: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPZvIWoC/3WNwQ6CMBBEf4X0bMlSDRVP/IfhsJQiq0CxC0RC+
 HcLnr1M8pKZN6tg68myuEWr8HYmJtcHUKdImAb7h5VUBRYKVAopnCU39PIoK+KhxUWC1qlWcK0
 xAxFGg7c1fQ7hvfgxT+XTmnG37I2GeHR+OR7nZO/9lc+JBIkWTVJmlxpR5445fk/YGtd1cQhRb
 Nv2BfxvrkzFAAAA
X-Change-ID: 20260603-shikra-display-07767208fa90
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780576263; l=2713;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=BzGjWMm7NOWQTFGGfvZVv4acRcjMzGDbIyUMsF+f/Sc=;
 b=DMPp/3/P7p0mXsQD7I5mVa3XnUwoOu1FC9g/lOw0Oil7tXRLfw36d3FtC9Vm0lebimbzZc3mx
 2nZUxp3Ljv9ArLU9lP93ovjQqDjl059xpYQ4hTofSNFsZeINsNo4k+V
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: QG5HQ3J818tgjuE_ULcdWFFfJKy9P1Zo
X-Proofpoint-ORIG-GUID: QG5HQ3J818tgjuE_ULcdWFFfJKy9P1Zo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyMSBTYWx0ZWRfXwTPqoNDwQZiV
 jcDoARqHi6db5hc7spCfM5Klw27KEOJb8X0Qds8v+AHF7WDFvMliB54T46cXADYDH91r9MdkOQE
 NzAsiPrco1VTBWfjZPLutArTVu8MhJbQk+75dboMfD8fbI/8Nkb1i+TesJiLUOiECO+81vhXPbi
 ZZ9lf9PeIp5P+p3c22ntlY6zfWufXNlI+nN4zFahTGs/xzGSTIf4D42bQxpaEsxacl5DKzO5VOd
 9Dw4CCA9USktHaQ7PoUylQQq7JeSHIpI5U1BtAFyZRT9zmEeAbCixzCKV1qWQb0GHxa+BxIubDI
 SQU6KsNLo+5AL1qOPKVNAvmViRHRe+LQXDsw6rR2coMPyS5OEzl8nZ94eQ1o2TpW0u4uAbw05fQ
 FflNq0VuylK1ZtDUX4W4Vg4yCdFYC+ZzzWyw80fHBQchgejLPkvXbvKudj42W6BtmAlhBdrJ7St
 e3oin5HRycwHADfE6HA==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a217011 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=3zM2i4eYArf5VB82j9MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_053115_034629_0F49B8DF 
X-CRM114-Status: GOOD (  16.90  )
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

Shikra (QCM2390) is a Qualcomm SoC based on the QCM2290 family that
reuses the same MDSS/DPU 6.5 hardware as QCM2290. This series enables
the display subsystem for Shikra by adding DT binding updates for MDSS,
DSI controller and DPU, arm64 defconfig enablement for the ILI7807S DSI
panel, and UBWC configuration mapping Shikra to qcm2290_data.

Driver and SMMU support are covered by the existing qcom,qcm2290-mdss
fallback compatible string — no separate drm/msm or IOMMU patches are
required.

Tested on Shikra CQM EVK board with ILI7807S DSI panel. Display
pipeline probes cleanly and panel renders correctly.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Nabige Aala (3):
  dt-bindings: display: msm: qcm2290: Add Shikra MDSS
  arm64: defconfig: Enable ILI7807S DSI panel driver
  soc: qcom: ubwc: Add Shikra UBWC config 

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml		|  1 +
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  4 +++-
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 34 +++++++++++++++++++++++++++-------
 arch/arm64/configs/defconfig							|  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c					|  1 +
 drivers/soc/qcom/ubwc_config.c							|  1 +
 5 files changed, 33 insertions(+), 8 deletions(-)
---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
Changes in v2:
- Drop drm/msm/mdss: Shikra support patch; driver reuse is handled via
  the qcom,qcm2290-mdss fallback compatible string (per Dmitry's review)
- Drop iommu/arm-smmu: Shikra SMMU client table patch; not required with
  fallback compatible approach
- Fix UBWC config to map qcom,shikra to qcm2290_data instead of
  no_ubwc_data; Shikra shares UBWC support with QCM2290
- Refactor series from 5 patches to 3 patches
- Link to v1: https://patch.msgid.link/20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com

---
Nabige Aala (3):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS
      arm64: defconfig: Enable ILI7807S DSI panel driver
      soc: qcom: ubwc: Add Shikra UBWC config

 .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 ++--
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 38 ++++++++++++++++++----
 arch/arm64/configs/defconfig                       |  1 +
 drivers/soc/qcom/ubwc_config.c                     |  1 +
 5 files changed, 39 insertions(+), 9 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


