Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62061C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZMlnY8BYR2NJHtTMgElKXRX8o21D4nyviqYLbRcalE=; b=T3FjW2vrD5+GRZjuy0xWgei0kk
	fEi/ftOFpOt8qPsOKhTkCsK/kGSa3/8rQnsw3F4YVi8uXZmbBImryxt5lVi2fSLU7LbFlOfdbsoyP
	aVDwKX9eJv/nwgRBa4V8tIDLX+AgSkz0sKj4dMnOAScVKBf8rh6ARsORqbWFtOeG3Ps7eWUJYT3L9
	mTn4a4/HpnpYHx02bxxuR/IIAZUw44TzVtCoerZHbPFmvqgCWXtrqlHWQO+jxcoXYi2SWQ1vMOEvL
	blwSY3lb2+la0/NUdR1mj7vglpdCJtCdJq7P2uOf+vkv/KGIid5O4OcBRH7exFbRC/XMbl7wTasth
	Ij90tvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTl7f-00000003ZzE-0Hg4;
	Mon, 23 Jun 2025 17:38:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThwJ-0000000309x-22Xe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:14:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9RYOk032591
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 14:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wZMlnY8BYR2NJHtTMgElKXRX8o21D4nyviqYLbRcalE=; b=P5YqHr6MEH8Mx9NB
	/WYUbki4mLK2IqtMi4oqNA8F76ApbOVt9fG/gMv39Td96PfzaXZHfVdcbyi9d8lY
	LgSt97mPI5rvnDUC7a2kyvPIwvkbtm7hbut8Rpji80JQ/IICE4+Zx/aRB2JgzaQC
	WFgZkhvtNq8K18mTI/bW7USM9s+KoGbZ/4x6QHLhyplCc/xdgqAFmUaWckdYAhRz
	+x3u2b/YE9Ub9h8d7p2XmFqR8cstAcXXzZ+mfSVL8FPQZI765U5b8pVaBRSeSjNi
	bYB6XNwbvBfgC2ZUEYGhScDIrDB5K+ko5x85KNIRvJC8zP5XILZTDDp2koJ5PzVM
	sOXn6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7u5tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 14:14:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2358de17665so36396715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 07:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688065; x=1751292865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZMlnY8BYR2NJHtTMgElKXRX8o21D4nyviqYLbRcalE=;
        b=U7WMeFdGwlzEzw4ayjY4KQW5GSxoE+yLNt3V9TQG2EYdvHxWOxTKB6MS76eYz78vJo
         BARxrCGDZbB2pUmYcrE3e7xqCyCtYbkxyhhK1Ho7o70Hy/uSi6BpON5E6YIu17GBQNwF
         CSJ/X30SyLgmEnI4VgML82iH3+CsnG1RoaqdyiX3v6BxWq6ZBjqR8ZtWbo3ASPek9s68
         WJmupSUhEnoMu+LE/MbGFpjXYKkPe5TwYM0ZvPM2cSIzobgOlS2WxrLJRYXuFXT04ip1
         I0+1yEpoUxdP1JTmdRkNI0cTG9NCneHcRd6v90Lx7FkQSJrJvzraPQcIN/9RhYGtrfvS
         LODw==
X-Gm-Message-State: AOJu0YxaLtfgiiI1U8Daq3cGleLQP7L97v0IjZxHZKdUyUS2LnEqVHn+
	Wzhn75m95wB0u2JCGsKuDbbGg5vV7S6d59GrvCUV5UFIhLA6+TSTuFcx1P8XhBwoCHnJ0bube/k
	sOZD5Q3+5p6DH2add/p2BK8n4FWMltc/77yKXi66PaFdLRy92C2yYoeOoCo1/7FB1fXsnRImO9m
	bzaQ==
X-Gm-Gg: ASbGncsbAaRomjUHPMzUWzs4cO8goWSMBJaJ5K3PY06bkqQ1PObexvfDbaEhMSILMrD
	KvquMmGRlkPM4vJ0SQO8ngnc+skm6wVCkEIhUqy18f4hxlbS5Ss1bnuid0cBwogWoHK1WX9jfL5
	v0NeDnmWS94IylxRU0WMMWU5xSIdBhGuRC6YpFTCqfzeLgaP43FWrLFGpcxFBj4bWxa2j3LrtPY
	dXYu0nImAk34UcTYxzTh4hzRHcrNHpfewPx0RGghPTUGK34He6By3PqiKwZ0hvg8wncLs5mrwEa
	Oj17TxCjT8y2bFCrC6CgXkCH61iExSHA
X-Received: by 2002:a17:903:2381:b0:235:779:edfd with SMTP id d9443c01a7336-237d9aa9e27mr198761115ad.39.1750688065068;
        Mon, 23 Jun 2025 07:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJYwVOtji4ivszfg3dCwr+wwwtTLGvgE3mvwgNUp3nkK1wJ0Yg7CyP113mzC0FYbbRpk6BeA==
X-Received: by 2002:a17:903:2381:b0:235:779:edfd with SMTP id d9443c01a7336-237d9aa9e27mr198760425ad.39.1750688064536;
        Mon, 23 Jun 2025 07:14:24 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:14:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:42:07 +0530
Subject: [PATCH v4 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-x1p-adreno-v4-2-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=799;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=CXzUmqLlLPgJV9fUhlYdmN7WEdQrsY5odxja3TUwO60=;
 b=4uyHJkQisGznH0LxP67gAcDDVSB8DRWaZ/k7WS/BKOKxwSHsZEn2+ComoaYVBYm9FmzCZNeKG
 czEusA45p6KAGXSG+1Cj3wlPTXnM/Xmw3CDRQojl9WKtXxK9jjDoCMb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: ClWVtZD0ENxONyJwcZsJQWo85rqTlc98
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=68596142 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=GAw9eemyJ_aXAIuB88AA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfXxERdID5tUnLY
 Lup8xNpxepPr7aTpoPeHoNGxPOnU4OMdhoxJRSOfLzNCDDKh7KVaVczaICzEnDLjdfhqVM+rR0h
 M9WBsEZEeM+uSwY2Sc1/J+4PKUdD2aN1X+AC9DLIjeziaTbgvkeQfXr9tGD8nPWBfIsVxyqUND0
 U81LS23JcUa1XRl1AWIZlzpb4Mnpb31VXxmcxD/CC4wxFjtusrBQ4ngltDWXpo4SxwotjiHj717
 wpPudGkoYHNUCuMN3RSBVtNovrBd3FvLGNpWrB1fC7ngDOmq6RPXLpiXoF9G0gYhu2mSWzp0Mmr
 m7liDmF0hMU/zxfl95483JED4m7TxHsjbb+zUSa9HbHa/zrHDmxNxylOYLmjLDZVQgFHvEFqjZn
 8Gk5MLMVjY1Y7+R1Q3eVWdGsWWl0WE+qrs1Y5K3i/2AudHXRhFaHXffPickkvIDIiMit9WC6
X-Proofpoint-GUID: ClWVtZD0ENxONyJwcZsJQWo85rqTlc98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=554 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_071427_656818_FA627F5C 
X-CRM114-Status: GOOD (  12.71  )
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

In order to enable GPU support in X1P42100-CRD and other similar
laptops with Snapdragon X1P42100 SoC, enable X1P42100 GPUCC driver
as a module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..c381ec0f2b73233cb3b4a19a214b69f534b3f519 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1348,6 +1348,7 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y

-- 
2.48.1


