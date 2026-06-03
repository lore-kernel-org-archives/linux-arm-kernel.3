Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44201CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=; b=2eqDq+OfL+i2BuYDOpnuSpJAw4
	GlD29wUI5QFX/fIpxtOPu9ZtNT6ZNsz6Ccvw/OUVU/gWuYCN/s8LMqnd+1A8HyfC/CBbaJlYvHv0p
	iKTltLwSLU5WOMZqUuyRVws2MmKEiZp8mH6xQhrTfU1Wv2xUVE+Iy6nCwQks1z5Pp12Icn7haME2Z
	kI1AWwFNADDUv7le2i8ZnYthIaEjsE8387RzbJC4UABRKohmOL/0Bbd9iEQd9PO2FWoACeRFQox20
	GH2yJjoNQyZiOONonLKbEAqdxM6TlbA+35DbpE8nSkK6ZXQ22hwoxC0Fg3DL4S4jQ4mPqFIzm4Wod
	cdq44ofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4q-0000000FJZm-1c2t;
	Wed, 03 Jun 2026 15:00:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4g-0000000FJRx-0rJl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:00:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653DYjL81755356
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 15:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=; b=GGS0WfoCZgeHzqnl
	hw8vxIT23xX19xU1PnDB2cO6B75LrHO87VXfv1DKd8XjSbhNH0kwKiBv1UoOeo3f
	ssrPtwoOOEBHX1PH+wVbAtGsS/0Xwho7H8jgZGQzE2nCWf3BnujxZOLELrwl+Nz1
	K40mw2BBnmDFTAndAZ4Djp4UpMEoxfDxUdWax/x0YQb8Ie4uxItBIBvY7q/iKMoe
	VFQxQVLAA2eTrOwe2ntQibVK6otdNWkUT+F9/LbvC5lHfmH/lsjfOrw9M+TYhEmp
	90pT85AWiTWdQT5odpQiRn4MvWhSEO+t1sLyr7zwKqaPuMt/X+9xpAu4jNHwtMXM
	W56/Tg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff01x9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 15:00:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842211d6e48so5681483b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498804; x=1781103604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=CH+t4S+OHN8fSg82AUU+xqMOTA4MJzHMk849kNw7DsgZRSP96ZcUkDjbIQR1fHdULd
         rN+FN2zHQgW4IOY6iLvz8VjY8AiXxJ+/JdmHYsF+TFr3VJH3jn8XTifxV81mhqZCKO77
         jwU6IDskbQHWezNutLEtzjXcWHI4Ymr7flIjiw4KfvwK6sa6iyCRvBk/mGUfSIPBipyL
         D0roq6NFuI6AyjNZIySX2w0a2WXfHexO8qVYwBIr43sr3TcAarVYlfYfJ0VVRndtDHc9
         7lDGSgw6oTrnqyzPG8v0JnsLwdu3e2UWcFl7CBSbEOL/NAf6lEbOZpudZ0AIq2tstNWj
         /A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498804; x=1781103604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6UZz8IjVdVITbvOPHhdrUuJW0/kbNYyuOsWRAfVo8o=;
        b=tV9KrMXk0VMBNMBUAciGZd6NbtdZJ5ij00Tj1zPYI4vlUAOj4qpPX38Ym2USZGA5Vt
         Dgv2T5OGjkrvbYJXrltYEojYeZsULTUNBSTsh9rohkZlkVLrM7A7xWRItMtEioDFGJ6y
         kxzcfnI3fEMvoR/CdYByHYRf3RL6ByVhWOANBYs9XORiCSks1r2tW2YOqlB0X19t97pI
         YbiAhzOMu1dS7Goq9NFDLbhXWZ55prM6SSEu1CUP15kSN9IxXG2j8ibCND4rg0IvpbFJ
         nOBYTb+BfVdhDCU6LEcAl84srYrsJq+zKc+a4AdaSdHnnBZCHfq7/O28WpqBNLrAcpxs
         uKUg==
X-Forwarded-Encrypted: i=1; AFNElJ+HIsaz3tLsMturp9az0Y8KvQU6/zLM3kpjieK/hK+NjlfJvO9m2zpbUW8IGffx7DlbGjS9qC6dO9If95scT1h9@lists.infradead.org
X-Gm-Message-State: AOJu0YxBfA1KvPU+9c+21kDyq57+4Zcm5xS0PNuVCudEaC1V+e4UBIQO
	0VO6wPPjqAcNuxKAeWtkLVFJAE7pPUpLxT4e1RPMQuFY3zxItAizb04avSJUIqMIiy9eNzxCwUZ
	ZJVKt2ZQnY7Tvs7hbAa5VbWZsR48mMcilddTFNQZNRDYPRlHhUxQqFupHVctymXlPm6ljhIddMT
	Fhsw==
X-Gm-Gg: Acq92OHcwTX5pCq6ObWD5c2N1k9VhvCUhXjLpLBUXTw8+FnDW59alnYTPrpCtnfF1QM
	lChdLt/7GuoUxz3u+wsuQMj0VaVqxDqkLQqNwTApCPEPH1RmP25wYGoWLXWu931U0hGIBtIuPGV
	aVWlQimqt7LP6wLiqVbbTKG/BQF59pPBhEvnwsTMhawVMYkpiFr8CH6VjtEdsd/UoqIT1TYopnx
	l5xFrzCq+aULfHtRtU1AljqCFOX5NpTcFJke/aVsHkGyDpAnDOGT0leCUBFkjbKIA2T0eYbR4LM
	sEk1uZNTCv2ow0GR0JMgh5pkp5aHvgspO0tD0uwMel/diQfNw5N/QUePpz0ZltRFwazOixeJZR0
	zPj/a2YZPKBHpnS+whgHgo5tBk6vqkaJgpLFmvWS60irAhMnLuRgf7StxJdA=
X-Received: by 2002:a05:6a00:3695:b0:842:48ae:1d43 with SMTP id d2e1a72fcca58-84284ee8c92mr3870628b3a.23.1780498804265;
        Wed, 03 Jun 2026 08:00:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:3695:b0:842:48ae:1d43 with SMTP id d2e1a72fcca58-84284ee8c92mr3870595b3a.23.1780498803819;
        Wed, 03 Jun 2026 08:00:03 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.07.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:00:03 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:28 +0530
Subject: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra-display-v1-3-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
In-Reply-To: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=708;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=SCs9KQKBtzRapnZIGqIOvP+xU2+TnEvlesLmeM6sxt0=;
 b=gUg6b8DX/BHqfCi1J5KoY5oWrnsM+HG3We+0qp76rEwPG/U5JUeiHQ71ZupKip7+1WYpddQA2
 CnY839GbgoyCf7ysCC7p9za7OOQ7Q8Ys5N6TLLl+YlfMU9KTqS7JKzv
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: oB0G-ZJ5B7sdTOIawyaom0zQmgfdDZbn
X-Proofpoint-ORIG-GUID: oB0G-ZJ5B7sdTOIawyaom0zQmgfdDZbn
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a204175 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfXye0hnn5l8PvP
 Ax0QFkVqloH3+zRJar/1UfC0sg+FerR1iJj2dQVbdjMQ3a5tmmdnAuQ6VElC/p07Nc4Zg9n7yIa
 O2nvHbz66tb1GtucickOuwUH/wx6ifM4Yzhu3HGKaeNX0iW+CKQGDjnTcahFrG0foZFWn9gkWjH
 Ar8UH/edVVJrMO4DBEesyQInwppfp3DqYvDAcb/JA39PXUoD3JcsUwyYisT3fSutoKK4suwVVGD
 XQXGV0x44X+xczY34YMypXkrz7lFjP3469v0ZNOK76wzgTyc9Pll8sJIX0Q0Jc1cM+QwRNadBoh
 JPBcrbXAdHW4AdSd22SxdMX8FBYMJ/sImoIXF4GK/W5DNI6lyRwu2OmO23V90ojuiwuKUi7onr0
 9wHzN7d2i73KT6GC2v8npBfznD3wIWZi6y7+6i6KErR6QkBU/SlwrH+F8/+0hTr8WNcD93AQHFl
 rWgM50MEGDz15iYBeHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_080006_403618_0FA9E3DB 
X-CRM114-Status: GOOD (  12.27  )
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


