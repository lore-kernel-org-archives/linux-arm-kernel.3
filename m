Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A106FED9EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q7jsL4kfOR01N3u01XCOBmHY0kjj5+Rnj/VeLPkBFHY=; b=Rp46+7RAsF4Mr5
	OfHJbX6N/gf/1LmEpazCx0DyaSFk17RCo65HBFMlpy7efCBRDpf3f5jL1XuYhCEk6ey/v8UFHdCbG
	P3YQKD7Hlg3+qJHGUAnW0Lj9mqf1+lwxBNga2kNKez1h/FTyyqYtteXW1GWtPYF1wtV6UEMq15pFE
	TT7CK0PsHjK3uQhsJAhZ78B37C99CjDdO+ry97eKqA/mAotuR8FVCSBq4dDrswNwAA/mmoSEQXDbx
	1++7d1UPtmH+cZyRdm5sicL1Y9eodg5HRengL6TPX4rnYhWI1RBQMIzfo/C22twYed7Zp7Ni/A0dj
	xx/GC38saAC9ozMHefMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y0I-00000006tyI-0jyc;
	Tue, 17 Mar 2026 17:14:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y0F-00000006txx-1g7I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:14:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HD53xh669823
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 17:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q7jsL4kfOR01N3u01XCOBm
	HY0kjj5+Rnj/VeLPkBFHY=; b=fKi1oFx91Kt+EuYmVN33Ko0q/ALbTfi9PtQQWF
	zO+xsxFa/54aJlp4UOJgO2jXJBkj8g9Mbeo6UhyMw4Rx/xz+byDZ4qTzyiOgcjsx
	V9cfat8UorvJd9Dc9uDHwc61MfKszME1jkmpCmQ0pg3UO+bE1wipReiDZdQ5AwtS
	7/ORx/iAMzIuz3Sb/c10/Wn+obyzOvEaPRX2A79OVjR+hE34fUBRzcaccxCI8pnj
	VJUwxZLDFSaOC4HO0OQT2EOqkaZfsylTdaBlpvXgj1WgWbBwMBJy1LSWuNukm0z7
	2vEWsK8TRoWmn9e3DG97yVaB+S+DzWak50jKr9EP5LFomNYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy7he10dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 17:14:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aec8d85199so737975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 10:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767684; x=1774372484; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7jsL4kfOR01N3u01XCOBmHY0kjj5+Rnj/VeLPkBFHY=;
        b=acqd07ljSEDfOFkHsIKZnQmir+bMIVjbflsvxH3ONBoky/umHuXpDfreGZyQR+9dcB
         YCVWwiPyUJyf87k5mlkRVXDH7yO7Wrshb1EH/8XhbyZL42PDQ5vivqYx5erD1/Uk1Kqf
         fBYRXIh97YlV+AlGqcx+pbLjmdhfjX1950mwTBxdlPEKhG0hl+5itr8FzpQ5O8twpNEO
         pgUJn/TpfAMtLSdKvmhORSQ3e595HlBkNpActMcw4Z5HH+yrFyjYthwwo4c5yqQ38Dki
         xkigom9Zwb71+Zql3yJzd3tFOAtxbsgdeHafaSDOp6gZS/rwd39ZU6I09AuJxPUJyk3P
         wPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767684; x=1774372484;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7jsL4kfOR01N3u01XCOBmHY0kjj5+Rnj/VeLPkBFHY=;
        b=HnlOkHSPsOehs3oJMaECviyHNTlNDtH/wwEv4mVRxb5zXV4XEYQCbmwLLtQkWPBcMX
         1NFJC8cdd0P5vFEyumpfGMYIvu2VQlsBXvDVZ5KpFzs1MLY4gU5hHo/T/q9Dv0RoC0Do
         ZPK7wzr1kt+jEuCs+xDCQWmZpV70NjJGxGeVVOrSZ901+7ZSISWRi9iABdKqmv9YtUWl
         cjRYdZTLYTbxIQ6RQ8Mv79/AYfsKThgkaG73w947KRn2XhPd4QWE4wdCx9G43ZWkq2OL
         Fxau1WrgFLJCc8pB91j7mMRp6HHWTv5uYPxpSftW3Ga+g1WnHA0vsrsQhvTw+eeh40pO
         UO7w==
X-Forwarded-Encrypted: i=1; AJvYcCVpCuQJk5/oeVjFw6+HqKDG26Ute6fyKKwIN8cJFyFr26Xiy9PUoKm98lvz2dutmJa4dKrknVpKrWKkZTkjqs2n@lists.infradead.org
X-Gm-Message-State: AOJu0YwFywFw8FSvRMd010zE9v4aXb9mvaextjgsQdFIe2kYwNJs6zZw
	+q4BVDWoT8DBIrSDgROCzx5R/oJfw2UJuO58vit7dfsHgRv1TcCQIPHgsGJEWmBHJ//2l2yfjhK
	2o1/RYZp8EzPdjL/Mr4QFohPXz/uxDlGhRKZaXTRWilrnd/k6y/S3ZLiufd4/DTL0VGAqtCElHP
	oFhw==
X-Gm-Gg: ATEYQzyWUw/4IUJrV2RKnsrhH+9Rid8IIlnTKWNhNl3wiTn2V9WiHNRLLWDJslULRFm
	+i57qdybpnEaMDcEWnafjB048ZX5XATmbZSaFF1lGvPzbY/Szi8W/Ttrv0WezBpnGXkii3wPlqp
	9jvm5O1BCn47CLwHSkad2f80dumWEzZd13bMRlVhWGLkVdBbVeo6p8BLahUwnxPMAhNn8n4w/kf
	z3B+1Syz2N1CybPWQluf4RSPDeY04jqvuiw6bPAR/9Aoo247clVRV+6urW/8X3uKgNphDuAGmQv
	NnCEmheQW6nU9asG85vbDYmgGY1qwrMJWKGvu0gfm3lNYD6PJBZPWg/qAt5qobtxpVZcMZIXMFv
	788CDT/96xOY8aGVEZioV8yBnRPfjUpCzO1pbQKL8cr6/Pw==
X-Received: by 2002:a17:90b:4e8c:b0:359:8957:7285 with SMTP id 98e67ed59e1d1-35bb9964818mr360753a91.3.1773767683988;
        Tue, 17 Mar 2026 10:14:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8c:b0:359:8957:7285 with SMTP id 98e67ed59e1d1-35bb9964818mr360731a91.3.1773767683454;
        Tue, 17 Mar 2026 10:14:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9f1cb48sm28919a91.0.2026.03.17.10.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:14:42 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Tue, 17 Mar 2026 22:44:21 +0530
Message-Id: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO6LuWkC/yWNQW7CMBBFrxJ53Ykcg3EaIdR7VMhypgO1sGPwJ
 FZVxN0xZPOl9xfv3QVT9sRiaO4iU/Hs01Sh+2gE/rrpTOB/Kgsl1U5uOgMU/L+zMVoMCS8W0zT
 nFAJltqUDov6kkFRnpBbVcc108n9v//dx5Uy3pWbm9RSRmN07MzT7tSI1nK8LouXYGy1tUVA0S
 DC9+lTjVo5Sb74Sc3tbXMAUY1vn8MqNjglej5+HpphWQsatOD4eT+UX+sXoAAAA
X-Change-ID: 20260317-eliza_mm_clock_controllers_v1-ee8f2ce21705
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: Fbo8UYCgghUQjIG894kbQkkiSXQ3nTV_
X-Proofpoint-ORIG-GUID: Fbo8UYCgghUQjIG894kbQkkiSXQ3nTV_
X-Authority-Analysis: v=2.4 cv=QsVTHFyd c=1 sm=1 tr=0 ts=69b98c05 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O432ggMcIDbDob6sqXIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MiBTYWx0ZWRfX+AFpT7/ucVJw
 xee6n35zIPKkCeoaQA7+31bbJNrwwmgsVULKm+Tn2nS99VMt64ZKVYmEQnmRDD4TaDEBPuvL35w
 zCYH2nlTaVFOVAVNZNSAxt85gR7MEh0ovo0b3BeChD0YD/zW2Gkvhd/NOOXdW29iOmmjlo1O5Pq
 Zp6mN27ztkeyzjS6JIdkKu+Zzr8pl4tJqXJoOAftcGibFyLBsRqX0s9eo7jqlxXiwnZmX40JCID
 NLzpyRP4MqFuBkvuYQUCnracaFLv/TIyuK8hy4S436apvjpfXkQ4qMmxB/TenIkm+awfnqQJBvl
 prN8LcG4QnbS5mKxHnIuYMaQMfKT8QbZmJTbi0ht/wWCW15fkEBFI/gRvNWzjbEfHHTPZZFaKyg
 VHwKdhPgEN7A4cQWKDI1JL5JSSeQgeKCgIFiD9ntVfEx0bRpx8e0Xemd7a49PrEYY51rI+CLVSh
 +01j7brkaYt34JgPEEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_101447_580561_DDC6EB40 
X-CRM114-Status: GOOD (  11.50  )
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

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Dependency:
https://lore.kernel.org/lkml/20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: defconfig: Enable clock controllers on Qualcomm Eliza SoC

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    5 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |   16 +
 arch/arm64/configs/defconfig                       |    5 +
 drivers/clk/qcom/Kconfig                           |   28 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  467 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2805 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  630 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4638 insertions(+)
---
base-commit: 34cb4f916af10153c87fabaf6c34e4cafa170427
change-id: 20260317-eliza_mm_clock_controllers_v1-ee8f2ce21705
prerequisite-message-id: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
prerequisite-patch-id: 6a8e7d82a3210a06ca00766dcb091d9ccb0ebc35
prerequisite-patch-id: 5705b420f0f4987aa8dad89118aa0c354c6a3d6d
prerequisite-patch-id: 8f7f73eb125f508dba66bf2373280048f62e44e3

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


