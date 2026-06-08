Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F22CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 07:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GQJ43BCxRXT3sj0FEby1LKVsqp3NgRy9qYHkeoXHJ+Q=; b=vQ3bY2y3mukUM+
	o9/HCRhL5wNPnF66uLDv8TdfVLLhXihwF5fA2r4EuKWuPDBbxN0srn2COBnn1kQkAFmoVkHqqjevK
	y8IqU59j9szquRNrxEkp5i3fjdGOzlm/Tw1+XGG/8lkxiXf7ppWBRspWsz5/6X9zc5FABfHpvBB4K
	CyLtjVjvzG/akqiB7zD49zX+VVP0/Rdo+2dwv//U1RtLsOOXYtinYMMRV9mT2zZFvGihDmItbTopc
	TqSejtbBmE+dynhwg+Y/rW1yEgWdopnbovKycJeiJ+EZNM3inp/DW9WdrFnr3meo5gyCcHqQiCdcU
	jQR41bDMgVVavZ8GPoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTzk-00000002w96-0OzW;
	Mon, 08 Jun 2026 07:02:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTzh-00000002w8V-2uje
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 07:01:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ou0m2384605
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 07:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GQJ43BCxRXT3sj0FEby1LK
	Vsqp3NgRy9qYHkeoXHJ+Q=; b=dq1qXWvzVvalAJasL/vbP2x5I769P5VN64Yb6G
	R9SCxURObCDupJhqTu9kS1BN+F6oqm0jOtLrGAQ/edcecX6v0q3EYKsMZoMcwCcT
	o5w/ttOlT1hQq6RwUWTeGQrEGY+JtYnKFlpr8bw7GX8Mvs6a3jQtN08QxggxQbum
	qRG8C85BDtIKMEj/vh/mdTz6H27vgGuu5iHwLKT6JASWtbyVYDQThDw2ftgGazjm
	z/Xe5M7I6OgKbXzytR0zR1xY4HLawoqsEy1OI3kelQv0XOl4PIVWfrszgq9+E4Kb
	OW5Imw+NvANpY8vtugmqUGIer8iB64ABptv6gSh1MSi7LzqA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1ea0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:01:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8584e80bfcso1866139a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 00:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780902115; x=1781506915; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQJ43BCxRXT3sj0FEby1LKVsqp3NgRy9qYHkeoXHJ+Q=;
        b=B9r/zWI0S0qaeSq/J202GzmLKhYo/3AD6H6e4Grzd60ymQmNTG2z7bmgBGVAohN6e+
         0ptRdnU2Hx7Uw5Nffl2PNwyKrIGAOh/yYdXXXinf2ZrMVHUpz4enMAdx6GPVvpR5KmtU
         xrGo/4ZastVeEMG795jiKjPnKorPhaIx8cMCYiIDrJzw3PUwxJdNqnfGuvAEMFccxRMg
         qYpHWHA2fzMB6tmXnE+DM3r2W9443CQ8z9cxScye1ZK2GPBq1HjAjDRKOx3OacquIyC6
         xk4e+WvW83WVMnqvMGRc5bMfXexs+l9r2PO9XxhAL2hl/6xX9z4bY2tYPDW61XMUJVGB
         WUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902115; x=1781506915;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQJ43BCxRXT3sj0FEby1LKVsqp3NgRy9qYHkeoXHJ+Q=;
        b=q3swAIPajhH0FSQ0uC69kp63dc8WMWWuOwzP+d2ZRDXtHvNFDXbmP+Ci1RkVJCg1od
         qLSRiqzokxuiOwsKvUYHKluEbXcac6i5F6dzUQGgDnx3mj0YrzN34RTa62PaQiNeidcH
         dfur9aNAk26Ij2sB8MTH/o5BIzdkrd59qmsMHMwhTvpcbmMUhDMF9F1CZJ2DmrjMra+3
         XtEelTOsIDcYRGi16UnU+aGdsM+yBhUFn2hZaj/cUj1q0u1QzR/gC8J46vsDG4tVYW0L
         8QqhB6wF4/S98ApWstSmV1PT6BUr0n+RumsD3X6e1hWHEifMbhVMWngbZNVeRG7wai5m
         zFLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FvxQMkIMHJsCNoPLUUBr70WolYnEmkKMtaLbi7Ivh1911eRwV9R36qlTimC4gK76YkaeH1qYkj7N2zcNoby7O@lists.infradead.org
X-Gm-Message-State: AOJu0YyTfaucUGBQrvQkP7zXfUp+xdZPgteMAf8drlUs04oDDhHQPFuc
	JtjGHsoAbJNCVoEXRVIaEpBxu63G7Uf/UkgI3fyg7wh19xdXLiINUOpi39L5E4R9IrQYlKQSVI1
	60P6QR/Ox4WgExWn5m0ClMZ4Wf4FQNGWaFreg5vRJrRCXKaJvV4hOpDJh40p5aILtAAEBzl9Zxd
	rIEg==
X-Gm-Gg: Acq92OFeHqgd2aOFcqyyK8ZfQmO3OQoLxOtwVIw28+iUYA5g8myd+iDTdLzjKge327c
	PcWydMG1POvECLiFYtf6iwm4I770j2GRojhKM+bv6pG/RODMwWajxhv5j+gJdDs6uERL2JJkJDA
	IM85g5e6MlRzLrwhlVA2c9liWiwiUxqxkSxYdWF/TA3cwcnzh3Gt8zoIXQrXR/QkvGuMFot6On2
	yQrYb7+Y4WPU5MvP7EFCMRACFiEyx6oxPcPp5zUXmCQdWIjGBIpZ25NP2Gk2dPKLSiPrd8Ut5p1
	ZG9QpGhHNiY8FTcVlsSX+IFQrrUcQCxXFKrfzuuepSOi4DgTMzOOMM2DUWbpFmw8SWhGAzCbtvq
	0a0oMrY2kosAlBErHcNHNPxr3DtaCznU9IPpB5fcvomjl+0cOvLzMSUbcR/o=
X-Received: by 2002:a05:6a20:be86:b0:3b4:b24e:27a2 with SMTP id adf61e73a8af0-3b4ccf7fefamr15902090637.31.1780902115321;
        Mon, 08 Jun 2026 00:01:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:be86:b0:3b4:b24e:27a2 with SMTP id adf61e73a8af0-3b4ccf7fefamr15902049637.31.1780902114854;
        Mon, 08 Jun 2026 00:01:54 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86151154a8sm6267723a12.22.2026.06.08.00.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:01:54 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add Shikra (QCM2390) display support
Date: Mon, 08 Jun 2026 12:31:41 +0530
Message-Id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANVoJmoC/3XNTQ6CMBAF4KuQrq0pLbTgynsYF9MySP1DO0Ikh
 rtbcEOibiZ5yZvvvRhh8Ehsk7xYwN6Tb68xZKuEuQauB+S+iplJIbXQQnFq/CkArzzdzjBwYYw
 2UhQ1lILFp1vA2j9ncLf/ZOrsEd1jUqZG4+nRhmFe7NOp9xfvUy44ILjUllkNYLYt0frewdm1l
 8s6HjZt9HKpZF+KjIpVEZFWG6zcH0UtlfxLUVEpi0xbyGvUKv+hjOP4BvJD/NZRAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780902106; l=3551;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=qoPjmohCj+qt+VnuKdYhqh4uHy1Ot3eveLLAi8iChK8=;
 b=GggoWg0wf8qT155TttrTaciEjH77CjKueLHxsW41Jlb4McBcfrIRBKW+Rytru5kPA/RgJ83qb
 BUv/XSFcBNWDOtsjCayphHwV6JyhMvY5Cu1GGuaKEUk+Xkdannknxzg
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX0dO/c3r+P5X7
 0QjmtZFdnNXs7nPzg/y5L53wk71W1z98f5xK8VYJNkpxqzdChZwj6gw+5BzpzwEG8ZbE3M+hk7l
 vXBxr3wpPMvKP+aTKa0PGOQBxWSrBsEMyLYQRJIR7s0WtOVR1YEHTWjgg4J9HkyBU/mZLVdYC5r
 bxf9nN1OZk5O+JaW5nrIpp1Dope6TztP7woqgHmtJPM0+dKPMN13rVItle+8OOqUV915XciZbhd
 eBeOaMeXN2EKEBuWV42Fk7eh8v0WCHYnrl7H7VCes44zanLwiYmYtoRjZZYR4+5OAJJGJwlOIkB
 yUhyGIUEVzLjjqrawjD+wH4UtsLaJ+CAyGuemJtHlmTdhZ0Bv+2FIypo6cjLLvAPFSzFwaYufuz
 zuPWY0I/zBl+DS2H7uAPVMfTkd4EHuJeJVyHm24fzF75bmB3Wwf5Xapf6f/cP2xx1aobDcslSOD
 X5cJasgYzXkuT+d24Vw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a2668e4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_X6I45OPZ5LLD3mXDKYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: -FaAejRrCtsH_x4QVqRcboMhu-4K5ZKk
X-Proofpoint-GUID: -FaAejRrCtsH_x4QVqRcboMhu-4K5ZKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_000157_865909_F789D85E 
X-CRM114-Status: GOOD (  17.69  )
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
DSI controller and DPU and UBWC configuration mapping Shikra to
qcm2290_data.

Driver and SMMU support are covered by the existing qcom,qcm2290-mdss
fallback compatible string — no separate drm/msm or IOMMU patches are
required.

Tested on Shikra CQM EVK board with ILI7807S DSI panel. Display
pipeline probes cleanly and panel renders correctly.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Nabige Aala (2):
  dt-bindings: display: msm: qcm2290: Add Shikra MDSS
  soc: qcom: ubwc: Add Shikra UBWC config 

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml		|  4 ++++
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  6 +++++-
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 19 ++++++++++++-------
 drivers/soc/qcom/ubwc_config.c							|  1 +
 4 files changed, 22 insertions(+), 8 deletions(-)
  ---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
Changes in v4:
- Fix sort order of qcom,shikra-dsi-ctrl entry in
  dsi-controller-main.yaml
- Replace oneOf in qcm2290-mdss patternProperties DPU compatible with
  contains: qcom,qcm2290-dpu, consistent with DSI child node pattern
- Drop arm64: defconfig: Enable ILI7807S DSI panel driver from this
  series; will be sent separately alongside device tree changes
- Link to v3: https://patch.msgid.link/20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com

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
Nabige Aala (2):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS
      soc: qcom: ubwc: Add Shikra UBWC config

 .../bindings/display/msm/dsi-controller-main.yaml     |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml        |  6 +++++-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml       | 19 ++++++++++++-------
 drivers/soc/qcom/ubwc_config.c                        |  1 +
 4 files changed, 22 insertions(+), 8 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


