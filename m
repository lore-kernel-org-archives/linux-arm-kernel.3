Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0C8CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 06:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWZPw+Dpps6jokruu2kK5mo0seIUmSLFHBR/QVxbsPI=; b=VpZYzeOdHQO28J6LOmsukek+Hc
	qOPGqGSJM1TNYoeYul+G4GI/oi7Pa0TiakBfmgXkGRFmyxtNbiAsj3uJYDsE/mdTzCYtMEkcvB/m+
	RVi59ErVUXbs5DJpgXwfoMekfuT991oN2i2vK7gI1XgbCTGighqPjU72gbXQ05+SdRb9xAGYFIxWv
	UE7v+o4p6F4MarwROLtKrZcVR7fFRDoqp+yNsSDjyUBq2dXjOykQyTkBP7w7zxwJYxLzMaZZ/4Erx
	Btd03nKnVafBVi7fwKCWoXy+p4fOJ2Ov1wMLFjTfGMyBCQxrOus1XtPUPWSyBTTHFTvvptI3D16+p
	lMf34/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoG5e-00000009ZVW-1cPW;
	Tue, 19 Aug 2025 06:45:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFxc-00000009YIx-1jxe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 06:36:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2HW4P010055
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWZPw+Dpps6jokruu2kK5mo0seIUmSLFHBR/QVxbsPI=; b=ZW++GaR6r2FuhTkw
	9b5wRt5o8NYv2lIEhyRloLp1OufW5ndt4sDKqW6IbiUGfuJghLP/y8yObQhdQ8BV
	JLidfzkhERA4FNb3mqGOzKEwnG2JacuY9azj6mMDlZrfyHn+5LXWcecpvhZw3CYf
	6Kejwh9NwHSRnLAcxlnFY2vedyVkCdvC4ZFkd2w+cX++mpSqJok9c0pZKqr8RKxy
	Jn6VM2NoDbkvOuHKM8hH7CAGA+QEF2AT7MKelyp8dRkZ0VYmlLcVYcKqxJgCsJVL
	ksmBWCgKDWd+uRZr75vwdgdbHX+B7i7M5oqIdALqfEZANG6g9ao/66Bal86onM5O
	DsGPYw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagydx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:36:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458121274so59939135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 23:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585402; x=1756190202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWZPw+Dpps6jokruu2kK5mo0seIUmSLFHBR/QVxbsPI=;
        b=gI5gSor3BKw9pLplGI/IUAEi+3D1rWaEohunxnHY8DEbN/EMTNkKa4ahC+n3HsZFPv
         /RjPbQgsC+1qvcDvTrGole99zTEdfml/3UA24ulghNmQ9LyrCWZktue44XLUZujQpicn
         64fWOrmsY+s+9rIwpGogFn6eXzw6YqMSfJN+FFmn2j8tqy8PtVFygCDGSVAT96Nl9h6I
         2kotmoXUUCLzpEef9IfMhVpFtYLSajovJ8Ozs1mGFuJ3nn4ShLu3yA+g+ckzACJnW6FF
         egquRXwWgvylAx/aXl2eEKpxEG9QmcBx/LT42vzRnzJ1lg9StQtjhi6zv0jX8l3fC2w8
         +Ppg==
X-Forwarded-Encrypted: i=1; AJvYcCUIclfNds/filq+s5jU2DiNbpPJrwJi3VuKefIBgEpLRppoTMFnCZ6QV9k5Ypo3Y2YHJNTH4xTY7XRDqO0sNhIp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxek+A1q2laskX/oH1GxiMsOfEIf1o5DpeLW7CSm77XJ8G16/IR
	+JWwPC1PDU4mxHz1qg37SEqOUm1rZh8a115JHkSFZHDZ0V3vyQbOBkszZe2i3g4+TXNureF+Q67
	TynMiFxO/YlFcdwuh3i9VGsvc5SKGEGMXtHUKqPoDRvjtIf4ChgwP7vKhup6ypE68p7Oe4H3XdI
	rVAw==
X-Gm-Gg: ASbGncvurrpL7Cjg6KtUfsl72NAW4yPgDLkgQOxUDndvtGLrvaVd+7Vsp2iD1Fzxnf4
	WKr5wwxtzWobFsIxFnXw0pmetRLNQENZ/M37t180inF4mssqQ334cOHetvRcuqz7FUFjvNw5ofd
	NgK9M5TivEEWY4T0hRW4ePg/ujalBpzu6/YkJxCAmgx/YhKJCqLPIlgkKPjQcS0S6WHmT8xD87m
	CSh5tbP9Pcy7po6+sEZ9VniRK+dIKzvxYtajEYdny1fMjiqI4C02oSrYE1D2jNCXLlluPlhSbjp
	Cx5ApeZwp9S7+EZTsy0BK7Lh8ExLPFjO1qRmo5dmk32gCUR5MzgKr4Lpxd39P3CrLk+BhDJqWYE
	5NnMBSByfHXJPVusEj0XR56uZGD7CSHJiXA==
X-Received: by 2002:a17:903:234c:b0:234:cf24:3be8 with SMTP id d9443c01a7336-245e0541d6dmr14369025ad.28.1755585402146;
        Mon, 18 Aug 2025 23:36:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl/lNABQK/kpg0X2OhEKp4HNBmGeNVvVA1WkA/paFD5ccWwopJ2tFxVPde1x3VdbYJUHJCYg==
X-Received: by 2002:a17:903:234c:b0:234:cf24:3be8 with SMTP id d9443c01a7336-245e0541d6dmr14368825ad.28.1755585401656;
        Mon, 18 Aug 2025 23:36:41 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:36:41 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:56 +0800
Subject: [PATCH v4 1/6] net: stmmac: Add support for 10 Mbps and 100 Mbps
 Ethernet speeds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-1-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=1721;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=rgkE1DP1easYS6YslKYK9Bbq9OWK3nty3gdcQhkYooc=;
 b=lAzLbqBZgwScoYObFRiDqWfMrCAW8S5NgGjq7r08AjwHO1jUwef1A+841LP3ckCJ1R1EY5YEH
 4cuvivCRLNeDSw954otmMxHK0W9KcjsGR/NaRz4uxt+wTDkP5NVaIVl
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a41b7b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VHUZ9mhHZOqmV8q2ncwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: LcNTtfh_8YazGobIsa6DTW70wwz_8ws8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX0aIcO83Rd8lg
 4E7Q93fQwSXIM4fs1eBG0D+APCcqEwHYhie1DEb1Fp+tOCwa7IN9VGl4jaUs1Bry3yrFLv71l+/
 5NBiIc5nYkGvJGsQte0Jj5u9gPm1OATtYiQfAo+x2Laik0xxhI6UWxGSnV3ibnoTVMR4WNcgEuQ
 CNCQn+oKYmai55UrbRgcBjdm5BhDDiZNNLzcr2ciU0VChv4tKudDp3zv8F8XPvH4OxQd8vccnt7
 /UCrdT/o0rpAMtIHW996W+ob5fH4Js9nyblqtSXKCGsO82HY2FsnK42CX02r1qKf0UvrjbFxy+q
 a+ZS7t5T9DdQUGYJaUb7/3wvBJvULtFCe+tDSp59LvklZeutA8IyIEdjEuFHn32C4nSZ8qUVVI7
 RZ9Ljfor
X-Proofpoint-GUID: LcNTtfh_8YazGobIsa6DTW70wwz_8ws8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_233644_664935_029568A1 
X-CRM114-Status: GOOD (  16.71  )
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

The DLL is a Qualcomm-specific hardware component integrated within the
MAC and should be configured in bypass mode for 10 Mbps and 100 Mbps
speeds. If not bypassed, the timing delay will be incorrectly applied,
which will disrupt signal sampling.

Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d8fd4d8f6ced..a4ea72f86ca8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -64,6 +64,9 @@
 #define SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW	BIT(1)
 #define SDCC_DLL_CONFIG2_DDR_CAL_EN		BIT(0)
 
+/* SDCC_USR_CTL fields */
+#define SDCC_USR_CTL_DLL_BYPASS			BIT(30)
+
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
@@ -609,6 +612,17 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	if (speed == SPEED_1000)
 		ethqos_dll_configure(ethqos);
 
+	/* The DLL (Delay Locked Loop) aligns the clock and samples data
+	 * in RGMII interfaces. It should be bypassed for 10 Mbps and
+	 * 100 Mbps speeds.
+	 */
+	if (speed == SPEED_10 || speed == SPEED_100) {
+		rgmii_updatel(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_DLL_CONFIG_PDN,
+			      SDCC_HC_REG_DLL_CONFIG);
+		rgmii_updatel(ethqos, SDCC_USR_CTL_DLL_BYPASS,
+			      SDCC_USR_CTL_DLL_BYPASS, SDCC_USR_CTL);
+	}
+
 	ethqos_rgmii_macro_init(ethqos, speed);
 
 	return 0;

-- 
2.34.1


