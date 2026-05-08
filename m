Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C047CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=; b=ET9C2PEJgNpEtaJrX4jclTWsh/
	xw60gGuM7MnnAv+BQ/9iG42T5NyfS7/TXZjL49I8E3n4nVJdqKCCliyJLKOXzQeRpChYcgpaZa76B
	zhW0vxM9eoscY6qLHakl5B2k+JpwLQxQLLnDXG65KGNYSWu/Qa/bqQ+55UzLdmoUW6Fe3TwfsIPh5
	6aRZQsvsBpE7gYHko6YYOOVJCKOrlLb4ARyCeigtscVY8deZ9KC3B6Lq60quEGkgG1pJ8hahJyJKF
	9bIecZX+Baxg9VnJV9WbHtKFy683A0FkeF0WvD7BwmCeEecmbBAoTPjzD4chnUt8KCy+M54trd0jJ
	dTKEDQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJaP-00000006N0t-1Z0P;
	Fri, 08 May 2026 11:41:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJaL-00000006My5-3E2E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:41:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jhJC260579
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 11:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=; b=GROTOrvtWA91ya+I
	NIjaF3PW3PCAsgzZsy2oyd2C7Vd/4dk5qmzcPtNztQxDdFWO8IOSkldBjfZCmJ+m
	fl8XmvU9DK4jQbhlM1ABMg2GVID6sagid2m3qIDiZ9ofop60FiK2Sui6dKR/03Y+
	sFEe72L3B3yUxM7X8uLM5hmlEDgjHhiR7RomqqG7Dskj2JV4jMMe34EPlTJeIvOR
	NUa8OEln/6whOjFKX/KJTLNp6l/1sh7xM4UlSB73ujmissSmoklFuSmg/g+wWJTI
	ivc2OmWdlaAdm1Q0BQ5VyVRYK88ScfE9jlLpCt8SAn3nB2Kki/pLEz32tgA0tcSs
	azLRVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueh3jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:41:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ed2c173d3bso362195485a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240496; x=1778845296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=;
        b=DR12u1pvihAfifl5CBJ8zgM0VufgHMNkxEPKV7biPWo7RUsXgFgmzHLNKtZY56nK6H
         R6EwTloz/y0ozL/Zbpw1OvXKi7TGYmNPqOVn9qOjt+Xb7ikqhfRafDsrtmaQFw9BvuPm
         2lS3Ku4YoqQleDumgNtkDqtHOt9riqlxCuoP4GIwlYzJW3NIpDZX48Of8XYN3okzPv40
         yg+4LMQXuj6AAcw68PmNhI8FZmHwjWu1D3mW6Sr+7fG2c1UvcQ7MHcyca3Vmq2iH3OCU
         pibWra6cGWAL72pMfgXJ+hHNBHu4pleN2+/tpbpyKP+fM/VYmxzvXSmH734OIzhUcny7
         cInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240496; x=1778845296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=;
        b=VB7t5h8DVWrXoOq9lvmlqH5EU99gN71OiAJV/BXRrTCbPMpukHY/IVoRRaxz/6PSbz
         j04GjIiH4Jc0W0mScFScXxTp9RQqP33Y63FmMgMOpgcb582t4Zea1sUfZdugiAFhyveq
         iwrM8mIzBonS8mLAvLnlOPYUCxJjYlwjL0VPOTPxAhoeYgJKQvmr91rLcYRqGBz+CNGU
         5IdMTXJDTzb+HSFRPpa2wJo7cLDTWtYBMvb+1AOuweL06WAzu94aAruU9xnj688SAKwv
         x7cylJ6q+q9Ir2/gvZf0dPkQAc35Aihn8erJdJhHdzuXhDW/u0yzNm2g1AmtptNa9mLp
         ESAg==
X-Forwarded-Encrypted: i=1; AFNElJ/vy9cj8wcN/qKDgpf4HnisQbJXErEzGSNYk88Nkj1kvPaH7KmiQlteWTj9EtP5XsJm3Wx8/Fq6sexOVr0BE06J@lists.infradead.org
X-Gm-Message-State: AOJu0YxxNkIU/RXLPfcTf6/e86KEEwnLMUh2XI7cObT3A1ozypVJLQuW
	x1oqQMZHuO5Mc69KrzuVRZXabfqSIaQcA11rm5TUerpWHOP2mnBSNMOwneVupPRo2t4JY1X7ArE
	nSOL3JyzHS7IQgf40lGsN0emrFvfBi+lmhSCubzD8Cq393+Tjtw5l5c3YhK4dzYPVBabN10WMvx
	glxg==
X-Gm-Gg: AeBDietIZsIK53B6Pe2uhcp90YG5qpDGXCbS5vN3iKhfItQELrnU6bckM++UAdCYlTH
	289TuoPW/siLPoVtm1crkSZlJ0pK0SyltYWNUigWAYtegy+WahbE/MjzqGmhq9T2CYOLTuVNfpg
	VryZbX4EA75aRXqfuvZ7Jig1F/uA9Ad0dyjXHltGmuteMu9K/bI6T4g9gGdUovU33hEPz+pOqHs
	OpQHgDHtLzKjOFXpimMC05qnse158cnSQZ6dLOc0/N73l3SxFZJyAQaKytxOHpZ8Xs5kZ3B+MQp
	jvD2lyhuTNRDtCuJKLoHHKQdeaGtpxLCrMTUpzXuGjQB1pyo3GTo2oBpplUbOmCDVxSsPDnFe4W
	eP0AeSn+5b5waZQCi5BW2NrMwD1J3wrlKgfKbGhtAa/JfBh1t3R9h+0H6KDMsi/LdIb/AjPkzgx
	qC32NNEY0nPRDb
X-Received: by 2002:a05:620a:4451:b0:8d7:e3ab:4c17 with SMTP id af79cd13be357-904d64e8cc8mr1794329785a.41.1778240495879;
        Fri, 08 May 2026 04:41:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4451:b0:8d7:e3ab:4c17 with SMTP id af79cd13be357-904d64e8cc8mr1794325485a.41.1778240495351;
        Fri, 08 May 2026 04:41:35 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:34 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:01 +0800
Subject: [PATCH v2 5/7] arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1588;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=4icgvbXTmREACRNwNtLec/LL7hmKBfhtcMJvtLBARXM=;
 b=CA1/7Y7o0nrqBZMiJFg5zW+YvMWC9lI4uYv6wvbhS3Hi2zKo+2rpb1GtKXFI+XgOs67OVIK5S
 MZTOB/rA+OvAoRCv5/tiwiIWbm6/BowPi8q/rYzmtiQ8jdGcn9W9EZm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX0cw5l6ueLbNG
 PAn91wD1KLkF2F/GG2+AqBSuhIGe7QlrMFiAy/946gVKvcZYSv7Cb/KGIZlY2HszqTfFdepLgXH
 ONCniDCDcRYMTReNFrFpbUCgCnN7L+5L0qIiqh5NiMloo1itHYJvkidvDhtKakwQCBzo63b3Es9
 qtuG7lwc4Ipmaty+O+OuGG0CFmyW40MTbfzHP+f5yN8np8X0Y3nWvgGL8XHyLy0/pre/U6rhkAU
 bX+84fp2I/wNBQigsd6RQ++mcgvelgzNAmaVgTcWOyfi0cDLN/dAEd+cg8I4rItReR5es69Mb4k
 vqy2ieIaDpJEJSaUxO189VSvo/FhSRpmI+V6CQPMqjNXYSfvMisRtRQ4EfUhVuziC53kWqnJFKu
 q+FNvn7Ks5WT0UPhhmtb+9vVH0iLl6sljqbCL64iw+mE5UAKWVlJTWi9/bshN6LCBP6hmkwtakw
 GpKso0cTfbKe9LUxoSg==
X-Proofpoint-GUID: vVIK2PknDdnqx9MyGkQ4Efr_iFXUMvzf
X-Proofpoint-ORIG-GUID: vVIK2PknDdnqx9MyGkQ4Efr_iFXUMvzf
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdcbf0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MjFiaTNPcx9fmn49iVYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044137_936927_A9BC330C 
X-CRM114-Status: GOOD (  12.72  )
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

Define pinctrl definitions to enable camera master clocks on hamoa.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 086c94217eee64756b734f436f1f0b49d49dc582..235076c808e6f6b5f7861dfc5d2703ee46c6ae9a 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6462,6 +6462,41 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio97";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio99";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio100";
+				function = "cam_aon";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				cci0_i2c0_default: cci0-i2c0-default-pins {
 					/* cci_i2c_sda0, cci_i2c_scl0 */

-- 
2.34.1


