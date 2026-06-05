Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193C4CD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 10:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YdRn4DRbFufW0fmv7Xxdna0Xs07PVl1QBs1/OWzN90w=; b=nwaLtQrre2WRoq
	ldjeH5Y31MIt1BXenzdBhbH5yIlnH1im/7MP8sOHmBf0pFnKWkORIPr+1bRYAs2wb6cork9aRtEPi
	ldB2Af9IUZbuazJcqjFLJaJJuvbPtEjH8UsmPYmdA2nj+BfC97qBbNnbI4OWiu9YcU9TfkDlTXCr3
	wSzF0FQJ/S+h+yNMWTgvdLSzNF9MnRZGQM0zDOsl9GIXLRm/Q7cQwYFxp0uyX7Z2bqxYcglj8sNr8
	TF5tX3dqAkeo6ZiDe3QBIUZfLhE1GNKC0KVkMAGMmNHj3doQPHxrhwoUGk6TzVBCgzCSPx3bz91eh
	UJu+UT8HwG8RWSgKZxww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRe6-00000000TP7-16RH;
	Fri, 05 Jun 2026 10:19:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRe2-00000000TOS-46QL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 10:19:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6558c8ps1957403
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Jun 2026 10:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YdRn4DRbFufW0fmv7Xxdna
	0Xs07PVl1QBs1/OWzN90w=; b=CoTPCZNXVLY22xU7IlGWff9+nkN8NSABuqQK7T
	yhjH5HRfRUAC2nU5amDTJOTJ8/X0cepcrQnVE6naN3qswU2gy/9MW/sYS6sFkSNb
	k+mEyavpP9eznk+hA/3jVTMMVFf4IBPR4rqLBxNSPDXMVNqPVwN8RCWZP6U2KrBQ
	DWzeRwu8FgdX+upf4gWBXo4U4zcUj3+6MlD+oA+ZYF4aODv3rf4HV1ljjnVPMLDf
	danFRBdDSE19VvaI3aKe/oX/+Dfr0AiFbR82LXwJVcC8N4X5AMj3I8m5Yrfwgjhz
	Ejehl2Yxz9mHIaMac+1UCzRDut8xVTBdP2BbEidMeb4R3x2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekckpv4xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 10:19:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf281d523eso14365485ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 03:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780654756; x=1781259556; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdRn4DRbFufW0fmv7Xxdna0Xs07PVl1QBs1/OWzN90w=;
        b=DUGC/GmLNzELMB5oPFJLM6uOwVZ0/ivVhb/AJOetPkr0F8WqLj7L7gIvxVvrg5LR+0
         6p/4U9puQBSHK7TH/dN+pja1XR7rP33bLOEFQ79Ez88Z9pQmzYERp7icWR/k7r/+7V8d
         fAkrGjlDxB9/YZKvQVPp/Li6Iidaj9Z+z3M2uzfdsh0SDf506Qa/vdfa5+L04IBea0l8
         d0sVj/Oxe9qTpXT2DV5gV3RFDuL6EBpm5TcM/uOPGN3dvX7krQqQrGpYBHagTZDHAffw
         EFdYeWqBC42K4jTGnJU/+z+KQlS3PWYDGyGv4/xasonNsiByQ15fYLEdKxTxSbvngqI1
         vejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654756; x=1781259556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdRn4DRbFufW0fmv7Xxdna0Xs07PVl1QBs1/OWzN90w=;
        b=PqNbtFwTRoR8K4did04yLHIAuMGPFGPuhVHDvwYdK9eScQS1Lp/2lWOa7rpTxDsSV8
         HdFEXlDQw5hEVykruO8CZOBldUJHq2nBWtvkVJsU5Imt2FYb4RkNB3e0uOmlZr8ht3Uf
         Fw0QTZx8gPeN3vxSH5WU+31Y4X7w8UYQ5ckxp8OA/7TNBm4yR1RuJD8DsKdThnmHtEZ0
         +9FOzvNoYfxnJ9Aiz0XKYjK3Z78hEXYqIYWO/qNb8e3JzRjvq1GNdxXorTZvxm5ABMSx
         LqL7TasTpgfbGl1WgycItgrRNe1Oy7+uNJMflglXmO+o/YJC60+xRHf1khdpZ2TV9TxO
         MxAg==
X-Forwarded-Encrypted: i=1; AFNElJ9YAjb/VYpx0S1Nlo61n5WldTyD2xcKIdH7pYSC9m1ZcyIMdWJo5QIDrPuQH2lhWaxfA3GmhDmrf+CrCk51+9Kp@lists.infradead.org
X-Gm-Message-State: AOJu0YwnbE/ge0e9K1X0+fwO67m/DaRW7cjkB8moQP30rxujhND+xqr+
	IqSV9BUatEg21W7ZboT6yD+4Vcvx7fM5jNnagvV6wgDIGCKAqFpNWUsjMTKODhMmMR1/UWNpFmg
	JvtG9QHdRBhnfQiIVBgy0ru5i7R3uiFgGyeihc2Yj+xamQuOgVWny+CGXmgyNyss9G4n+dM+oBJ
	UKHw==
X-Gm-Gg: Acq92OGMKETW27aNEXF0NtSdmp3NLrgAnsdTF/pPI7+CwfbbFVAzSShtLhcU3kw9yxk
	7WB/D0Vw9oCDLtkBQF/yqUXK1e4IOzwXFOyKPQpNIPcQNnOjSJc8rsuqrkNBe32xHWj3p8xKDYe
	lJXkpbqI0NwqrJ9mBbmDUsDc3HJOGIU9VUqcGV04WJZblM5iwgCPGkyKU7Xx6Q/YwR6d8AwGLlb
	FiqjyqkivAqwrjvmesbBFwz9teQEEBLp8s4+UaEwi3t+8TNfVQOhEHkXp5gi2eFxNWQdft9EppM
	gyZ02eA7NQN0ZFHBJMTGIo+UAtijoJgwH3PLQdNXsVE84CZSLMBxogY+H2EKkB2f7mz+74+oDzq
	q5EZ/ntmD+UDSsinMmRw60xF6rGAwUWZg+5CjEfGaAj+jOUfUWdpUMc/F5pU=
X-Received: by 2002:a17:902:d58f:b0:2bf:195d:21d2 with SMTP id d9443c01a7336-2c1e7e44e91mr31358695ad.16.1780654755818;
        Fri, 05 Jun 2026 03:19:15 -0700 (PDT)
X-Received: by 2002:a17:902:d58f:b0:2bf:195d:21d2 with SMTP id d9443c01a7336-2c1e7e44e91mr31358275ad.16.1780654755335;
        Fri, 05 Jun 2026 03:19:15 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm89741445ad.33.2026.06.05.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:19:14 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add Shikra (QCM2390) display support
Date: Fri, 05 Jun 2026 15:48:50 +0530
Message-Id: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIqiImoC/3XNQQ6CMBAF0KuQri0phVBx5T2Mi2kpUkWKHWgkh
 Lvb4sZE3Uzykz/vLwS1MxrJIVmI096gsX0I+S4hqoX+oqmpQyac8ZKVLKfYmpsDWhscOpgpE6I
 UnO0bqBgJT4PTjXlu4On8zjjJq1ZjVGKjNThaN2+LPou9v7jPKKOgQWWyKhoAcbSI6WOCTtn7P
 Q2HxA3PP5XiS+FBkXlAuCyFrtUPZV3XF6jbTxkLAQAA
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
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780654747; l=3346;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=UjONg0NYj4XKMunIFJbINoDK3VSOgIFWYIBOvuNak5g=;
 b=NYZsTfhD6L1pZkrKqjY12HiGTIOPAad7elMOIEmgc5l650WfUBoPQwTaiYI4OYgsjDKjhuKBL
 jCLt2KM/JUJAy+tdw3EdLXgPUp6qTh8OMonqEGpoxLFIK4lrDHSxFSQ
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: h7XxRu6jWRQFdhZ5LLF4BaHiKpopEVHz
X-Proofpoint-ORIG-GUID: h7XxRu6jWRQFdhZ5LLF4BaHiKpopEVHz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OSBTYWx0ZWRfX15QjHZ1RlVRj
 NgIp2/6ieDGDozKzt5UjW8+8DjugWXVW0F8kURwB6gH+sQH5Ffax0xR7A0UDu1Z2pajs7SHmMQJ
 ecsVu8fezvBLpduZFfdGaDS17sUlXRU3r0OJj+UtVY4MffXKgulU6Xvc3sFo8V8nbuaOOFmPMTn
 f/JaLvpbXv01LmUVKN8XuqQFvN7yT+oUaI/vr/I+Sh7Y200IvkQAwNNEd7O2VJ0lFSUDBHQSbHg
 MZn1z5mj3gB1zcl250CNDMFcgBnY0qF9oWLcr0Rk3GsuWm5jm5txpRJqXbi/qhXJ/g2rzqtZ2Vb
 1t6w2Gnzs93oD1OCq0bWWfRMykUWJdCw7Q8mIzUydtDqq19enmsYhvlOPN4v2OU1I1s5Qmn1jLV
 iPHBIuq6jrSqcP6eKvjHvYgcNzTc6092TbFvRpTv4nyZV4TA+qpgptPFOTJ6F8UDnbwqks6ikLB
 gcjL1oaaIzvYe8vnVRg==
X-Authority-Analysis: v=2.4 cv=H9jrBeYi c=1 sm=1 tr=0 ts=6a22a2a4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_or6NCU1o4AAqT2-bvQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_031919_143698_5DCA9328 
X-CRM114-Status: GOOD (  18.06  )
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

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml 	| 4 ++++
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  7 +++++--
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 22 +++++++++++++++-------
 arch/arm64/configs/defconfig							|  1 +
 drivers/soc/qcom/ubwc_config.c							|  1 +
 5 files changed, 26 insertions(+), 9 deletions(-)
 ---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
Changes in v3:
- Use a fallback compatible chain for qcom,shikra-dsi-ctrl
  in dsi-controller-main.yaml instead of a standalone enum entry, with
  qcom,qcm2290-dsi-ctrl and qcom,mdss-dsi-ctrl as fallbacks
- Replace oneOf in qcm2290-mdss patternProperties DSI compatible with
  contains: qcom,qcm2290-dsi-ctrl to avoid duplicating full chain
  validation already handled by dsi-controller-main.yaml
- Drop unnecessary select: block from qcom,qcm2290-mdss.yaml; default
  dt-validate compatible matching is sufficient
- Remove self from qcom,qcm2290-mdss.yaml maintainers list
- Link to v2: https://patch.msgid.link/20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com

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

 .../bindings/display/msm/dsi-controller-main.yaml  |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 +++++--
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 22 +++++++++++++++-------
 arch/arm64/configs/defconfig                       |  1 +
 drivers/soc/qcom/ubwc_config.c                     |  1 +
 5 files changed, 26 insertions(+), 9 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


