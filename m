Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F74CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 12:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=; b=bTUsL8MWW3yxKYcre4uVhP9yc6
	Q0NCJVDnzHAeL+0VZX13K2M9vDzHubanc0kNcPSoSo2JHydnm2SksrDZMK9O+3mHZxj86wZKRZxcJ
	ShQv3iORkxJm3WuQ8F43WD8XlHlhyZG8t1iTZVcyHh4Rz2WS7bIFjhFiZD/Rrqd7vtK3s+UJ7bT3A
	WiFeTFsdzQhdhjM8sCYh/8e7rExCJgmbs8fyrttbFM9s2tSqxLj68HFtYlwfH3E9v/vGnFTzjfUHT
	EkS7nTyRIrWeU0ACs9DQa7doZn+a+Ls31vmLh1SmuKVU2sTD+mAQHcrRm9HoxEPrNgsJJbzczE/Ji
	laEMW0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7ET-0000000GifZ-2pLn;
	Thu, 04 Jun 2026 12:31:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7ER-0000000GieA-0193
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 12:31:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548CPfO140659
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Jun 2026 12:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=; b=MfoqlJm33MHz1RXo
	VaPPkj7+9L6dYSMphzMDlXqrUxYF/tjEoIaBQsTAwlti6OLji+gN+nAsJGO/pgOr
	e4NpL7icnywOddrjOc7u8ASzihLlaBh2FYSz0ImFmOBxThr2oVP4m4sD5PfCv02i
	FaX5dBYRefGXGmnzO0Tnz02AdXhHQlZl/Kk/9Iki20jVBtV4drzu5xcwRx8/YbVo
	edZGNzE9MGTpwvdaI3whUS+bByWFPVr6stI3/QNNzPNBbn/tFvxrkF+186FmDCGO
	fzIVCAyvweoGEd7bJ1AyvG8AINWJrj9Vyb1oMQtgIs+3kYleQcfTYXtadv24EWTa
	YiUnww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyenaaad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 12:31:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c850ff84ddfso880321a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780576289; x=1781181089; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=IuSRSam7LyMlii+oi9UfM+hDTUIuKX9adoZp+XBBYPka7R+yFh4bdrgTqptK3cXeeg
         GjGPZBe+5O7kcz16kziIOzqiqopRKJNQnGTUHvQ91SpQ0AGxtR28Z+k5hFKyPIe/u/AE
         UZtp9B9QA4n7xmsFIN81l9nkaJQSOhmY/utK0mkk0SYNIeNlOWkNUq64THboE8b+vu/K
         fR2HR5pZ8gI04gd9jUyq1ppcA1Nwipr7WL4Ea6sme7ChOcwOZIiHldsx5FJFYlvxht2O
         cQi8sdTYsUz7P2l0tsXSGREEz9Cfmf7Ju6rfV/al2xNiA0nD4uSlXEL1kgE+88wTDfRQ
         U4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576289; x=1781181089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=sBdLXPEAoZfAXaovMcRKSd77w/WEA8r8gClz3UNVgwzyi3A6kNIflX9v9S9ZKeAxbP
         cGkraoP84mwCRJl/7cW8PcbSV0l0fhbTTImvBr/TZhosaXxP2B0Nx0V5s0a6kAyAEI4R
         3Js152eo5IZBfgq5Wa1KzHhhpkq/D41F5Y+sHc7f29DorxHNXUE69AKznzkmCJaH6w9T
         Wqx67BnwhKAIfmrxUN7v2xhHfWGH+D8Z7SA9k2l06iU+FdQvuAJg1J+zKMzZv7Ab5bUR
         +5uZyrYSmniIefiabbCXTQTSAyIFP8uJRMIQICFjdAvj+KumRPsiBSev1qxSItTqtokB
         4WTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8aJ/xmRBR0Uvv0p1FsrxJrrOyh4K/58PQakLqcVZStgUi79li1GUgjkQA6B1Ej+64Egw0uJrmdzhH8pk8JdJWr@lists.infradead.org
X-Gm-Message-State: AOJu0YwaOQ/5EmQTOytQ4SWjG3jorhW1NzBRzzRcszEeUxY6YtefLjRG
	Rn5LhGXoPOWJ7h3ySxVab8nTGLmye4OyBGg17VR+J3Xkc8GI51TneGzlk6vuVqLsq372LIi/Rhj
	EiX0gF9GP8Y0cvf7IAmvmaDXh+21wJvMBLeQ5UDncpuWh6zYPmX2eNcGP/X/tmukho2VyDZ17OQ
	fNzA==
X-Gm-Gg: Acq92OH/GgDKgSNDvzUDLmpdcEizu5C+MSOCCbge+vxeOSdpkzQ2sMC1cbQUlRUF65f
	F2sLvHfxBGYppVlZvYY0yKO5ENWqaVLd5OIH7/wwkHTS5KjzpDrq2vtsrVgAJUFBZpBU/oNP0L9
	/RhotuVh6hdnIHJtegS8VUSANX4CQV3ffbV558kM7ZpWO+37Lztni3/u4c/pkEJuev7Sw35UdzN
	EWOe74MKgl+GXzJETUamyGNy/I/wG/jOo1NYsefNOs/IrtUjjCGE0fGUfNPqn8cEHHKDKtxx1Bt
	u+hk1oOrmV0Q8hr75++SXA9GprvIxwh/qbtn2BiiIQinndkvbcH0NxlKgkynbgD2pB3DbUP5EQN
	7/I+KYBBwfUMTGEQ6ncck+JATm85bfjKB6ul1v2u3FHIQWKaavIpdlvVW+Qw=
X-Received: by 2002:a05:6a00:6c87:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-84284e8e557mr7258380b3a.32.1780576288664;
        Thu, 04 Jun 2026 05:31:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c87:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-84284e8e557mr7258325b3a.32.1780576288185;
        Thu, 04 Jun 2026 05:31:28 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm6015917b3a.34.2026.06.04.05.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:31:27 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 18:00:48 +0530
Subject: [PATCH v2 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780576263; l=708;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=SCs9KQKBtzRapnZIGqIOvP+xU2+TnEvlesLmeM6sxt0=;
 b=m9yIbYKaT8kCKl/fs9wocRmDzoj1uNJswWvdoxbvdIWYfP842Sv1SMBB1G9LaTbU0FTO9Vdyl
 QvUjcv/T4EUC2yeF7PvcAc73PU1HzUvdE6d8SwFee05DqQT2ZjtUuHp
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a217021 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: cUC-iTiYf2o7FwNBnjUsSus71C4B1omA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyMiBTYWx0ZWRfX5uUUyM87Ug8R
 GkQPC80D5xG/qmS/lONDoVU+BNPnCZIixot0s9JN/IVGoDe6GsCargKn3A0DHwbx2PgAV4PA/Nh
 SuiJOsyYRdW1XcO9w4cnLNM51vkJT+oR47VhBTtKBifRbvtb7qs4dA+RjEMCYMEraLRYvo1IgXQ
 gCoXFRghpRIm6zyRQFmMijMcr70EtERWUnCo0693dbzXn9o9FaCj1zjeATo3RDfHtZ5PKHnfx0K
 aMbU7DlJiV1m8bxYaIYpBpoeHZoEIZhKFPkGyPvxOiSo7fqTkVMSNI37HkfcFPROwrp+vMUzMhr
 e/0ZG53PlPHUFaInZAmEq3KC0Xrb0yRWnFgdmZC7cpTHD4EMF60p+Jjsojj6lhLUZM+MfagfGwq
 57/MLnJQZp2wfrhO1CDVvuC1d4m2CuZsFPhBN9+wMBobwX24HR0TLGqDHP9/MVOoDX6BHOitDUp
 x+7t33Q0b+yIwBrHEbw==
X-Proofpoint-GUID: cUC-iTiYf2o7FwNBnjUsSus71C4B1omA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_053131_154493_91B83060 
X-CRM114-Status: GOOD (  12.35  )
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

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 909f3c188e75..a6d72ff63e57 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1005,6 +1005,7 @@ CONFIG_DRM_MXSFB=m
 CONFIG_DRM_IMX_LCDIF=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m

-- 
2.34.1


