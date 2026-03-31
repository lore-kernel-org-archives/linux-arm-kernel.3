Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA832FF60F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=27Tk3ffYPxPUfBBGsz7J58heCMTnUpLGBrkUR2F7Ums=; b=zxC5aLJKhTzn8gcGhr6HLLT5GI
	+urBVQT+gVapblZeQ5Kqxw/JsvoKMrNBdavh/+ge+5eNRzhV8K3AxaZ4xQskRvJT71MpvNNMJqBJB
	4RWSTQfUCJCGdUGYHpbojL4Lc30Ti1dIJQoQ+/w/9aTvPrjgn9PMo5Dpm6RnAGSJoeK50t/TyFn4F
	b1f7VCP0bRzUVM+AL5NvqHrfZJ5n5gZs8/1aYeQH0mPajMrA8/8RExDztq3b01qSU/cJO4vu4UBy+
	v1E/iVM5qut+pb/urQKeMrIvGIXGspLr9tQ50095WrUMmbSpw1H4aAlJN70PGvu+LOBstd1GijTjb
	0AIf7uuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VE6-0000000Cfep-2fAc;
	Tue, 31 Mar 2026 09:17:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VE3-0000000CfeD-3PZc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:17:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6xsnI2164250
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=27Tk3ffYPxPUfBBGsz7J58heCMTnUpLGBrk
	UR2F7Ums=; b=K3/9arNSg2eeAQ9lg3ebwIMS5xc7a+pMVUtyu2Pkab9mUYyb/9v
	aEg3xEylIO7E39xzySgIsYw5rb8hjFCRF4emNK+zRk1Hl6w1DjiwEmlKm2hpwkjT
	JCY8Q/IeOw60nu45NfwJ2dedYvsFZ0YkyVOAJIST8W/2kiwFBTea5wLJdYa5gbBF
	Xe30fjYkoQgpxeOxJhsm5c0ZABm5aHjuN3rNBYRJJQrm7S6lV84s93L6O+oU6zMX
	hUHuSSpfAGfQchykrc1Iu4QNyGj99POrTfyJjQyEc6zVScQcZnvKTUSgqlvB0dBy
	HY6hYCbCG7JWqpKsGjaCEc/mCrKy2YeRulg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga0kbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:17:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2cbe7223so178635691cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948650; x=1775553450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=27Tk3ffYPxPUfBBGsz7J58heCMTnUpLGBrkUR2F7Ums=;
        b=cM62mQn9K3vP2tj4xBkxfu00ZKpWn7CQ9ZWFXMPlNZeFpcWePtY1chtro+g2B4H2gP
         WXTWbBAanlmRPQnDbfNSEC4XX+hQ/gMv4Xwpfn/ZaunnyI9TThO+Ds/TQe1iB2t25yy4
         FRDdaBx/4VbEb8apVDOXhZZJu4AhxW+2biBLSOhA7mcC5C7q0JWu//aC95fN09KEep+D
         sCrcw3kBjrLHc90Uy/dTUwZnzTJVSnnJc80jlrHNy1z07ApbXDPGqLk1hB7zR9qNt31x
         mpjet2K3QUWJkaPeMa64CpSVLtkfF///gvBS5iVmxBtVCRSrK58c6yVcyKpX7N78SRTo
         6g1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948650; x=1775553450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27Tk3ffYPxPUfBBGsz7J58heCMTnUpLGBrkUR2F7Ums=;
        b=grkrl1wmO3OaSuP3uCC1HzN1xv15bfh5DGT9tW5d0uSUjTZYBZltxoctZ6z+SxwmH7
         nei9O6kTvKICjBbDAnx/p9dz2CtcXCjLG9OBWqsIPFAj+E0Ai4OqffZdhnIm0waezQY2
         CubqIbU0cAIhN04lfsEMyIg4VlIQ4dRFgwXwOonSdPYc7S0+IXKSY2FZjpBy0TyYKhda
         Jg1PzR034Z4D4jWr3YG0b0QHqD1ZJsiCSdb+QO2/PnW0mEqvb8O5q4sRdR6lVoqrPw1e
         KVf0f+9ahCbRp14Y6gsCAABwEFsXV/+WWtR+t1Od4lyVn/17tr4oTPhjFF/SWdwDSVAK
         DmcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvkQc2jlFzQijzBpdCb6G5qQvV9L6cQGbBlsjZltyZ2069eQwtwOFDSx1InICiidWioout8rjzdrWCHVDocWAv@lists.infradead.org
X-Gm-Message-State: AOJu0YxyTV00Tz/dZYB3v/m4nSxrd9uBug3w4CMil/MLicuCq3Iz0wQ7
	pdRwFyFiC6HefIYNQuwpH0AfeDCoJ1+/c5i6RW+lLKMqnhM0Wi5w28vY+7s5RFoRyfE9P4yFnaS
	bZdi7LtsWwtcKv8NJb9xNiVOzZbNrfJ5MZMtAsGRH90ljWGeBAc56LdTGBtQiV+nYAtJIWDhCkn
	3DRA==
X-Gm-Gg: ATEYQzx4l1hujBWLXExNL/BRN8YvjsmQ9cHaiL4pP8SnpoQ1jvPtaoIX8nzYq0RGfhh
	SROheT2/1cyiR4NYQ0sC2tRFM+NZi1VjmGrnlP40VqaZhVCa4zGC7/5CMC3/pZ4eNSGYwjO1wV/
	ttRwYCRX3AaXgKALjye10qOwBtUFfXlWw8o1rQdJN8xpCkGZwvRNOfocviyAIxxEP3UAGyld3BS
	ZpXebSrtjz6SAit2SJbN/KgdkxHXEkAlv7z8utBDmbdNWEUeW1nurin/nJ06fvL2VRe91R3VX+i
	36cRYX8dPtzpXig/ev6opj0fi+/MhgDhZyw8YzpfKEUrLthoEVSRLvpD016AYQcJvBS7j5rt5Ek
	tyBAvt40blympEC4Yc5cxVLLuRKkRgabdtshy
X-Received: by 2002:a05:622a:488a:b0:509:1b01:8926 with SMTP id d75a77b69052e-50ba37efac0mr197333911cf.6.1774948649777;
        Tue, 31 Mar 2026 02:17:29 -0700 (PDT)
X-Received: by 2002:a05:622a:488a:b0:509:1b01:8926 with SMTP id d75a77b69052e-50ba37efac0mr197333621cf.6.1774948649292;
        Tue, 31 Mar 2026 02:17:29 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48880946cc5sm135815e9.13.2026.03.31.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:17:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
Date: Tue, 31 Mar 2026 11:17:22 +0200
Message-ID: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22204; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=puBYKXZKqZwshdg9cKY8fmmVvZSJKudl/3fL6tVXyP0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy5EhuxPIqfZahjL4HL42IPqsNNkGK9YRhoBxC
 2U2mFn1vdmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacuRIQAKCRDBN2bmhouD
 16xAD/9xUeUhqeb92Hj7wGO8TXWf1NqvnOhXh/SGZ5IFwKTO7bBeWCg6mABHCEnm7tpD1N81fPh
 +DYil6Ha5ltXrPCj+cPdAMoIOlEAe7dUm3ZDkD4mEKHnWs27W9AKmOVgGPEuwGeeaZoJCCCTWZr
 QuYTCfgXS3fItFLv9NzJ/E6gJ0KV0bH4T8ejhH2PEwqZhRj3VHiRN8Rg1mFmmj4HU9vU+QYKKol
 vCXrq/2rdUDMdsT165fKXIqtTzr30Bfqo2SK25ejGy3yEA+Xh5sTaL/75YCKN4DMlif3V1OQ/oM
 AWpc0lDqANVqfkyiuyriVpGfXu/hEzJWvXY3AGMx91grEwXNQqCpq8IBrqMIU6xkY0O6Ds8/JnT
 UyevZ5UTIppENYl3m48fd3/1xH6/5MjjqHzakF8u8sKY+jxw8wT1VCzKD2vAqV3WsSibAeRZZm4
 GRKQkCKt+OwdBapdwf/HNu+M/Td1Q9RXH8AcMNZUWEuCyOJW089K/HbBub7Z1X465tlDbwuimkz
 UG4dC3Hfhw4MMgMPSy05A35IqeSotiUGB7LbCAUimE34jEw/JOG5IPH/QXRj+LoIf0f6GTDMMjH
 TRt17l5zwqVOkYxSDe3BjtwEeL9U8o+0lj1gFsac3GoxlXWf1+9Tj5Q5LKP0xASLXsj4ZRog0NH m9/+/BQpNyVD2OQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cb912b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=JrXM2f3oU6NcKQTzfV0A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: rAfAYpbUU1b87szGZvPqoGg5o6gses3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OCBTYWx0ZWRfX7K1/HAbMdomu
 8EuVNB4xv0LaRcZYsW2iwRzh0QpnhN1+FndXPbJu8sKGY2eF5uYrxVupPY+BCZAX8Ce3tNO4FXN
 nW5YtqrrHIBDtVt9PeTbdo9TOf3TeWLGVyltTtV8bvqfVJsMAr3eWULhHpJ8zesBC/NgeNWsqAT
 61ANCzjkOvYFRGnaLcWj2Ueu0Csj9VD0zZU6xhb7KnddkMwkLhszILN7E7BtVVJkNUt6e5wp4vF
 pAGMPG/mZ3YrxXEPfvgVgTvsbWXqB8HCArNyOAmWGiIiN7kZdMuFS/ZLo9sE96dT2ZcMRev664K
 5Uoa3ZChl2XULkMMwxty/zZ4MrVekO8kbEPx6eLq6NFbOutaHzXwl78uN9xME5pj5ck2k/n9+IF
 wrqMroiyN70oj2m98Kib4k3LywSezkthN9C1me+T0b9Oga/ul+gAVYCil7t6H4EXYE6Yv3wmE8z
 zr8l33CyRKhDaLFKfHA==
X-Proofpoint-ORIG-GUID: rAfAYpbUU1b87szGZvPqoGg5o6gses3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_021731_862926_F0F75C0E 
X-CRM114-Status: GOOD (  14.40  )
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

The static 'struct qcom_cc_driver_data' contains probe match-like data
and is not modified: neither by the driver defining it nor by common.c
code using it.

Make it const for code safety and code readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq5424.c            | 2 +-
 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 2 +-
 drivers/clk/qcom/cambistmclkcc-sm8750.c    | 2 +-
 drivers/clk/qcom/camcc-kaanapali.c         | 2 +-
 drivers/clk/qcom/camcc-milos.c             | 2 +-
 drivers/clk/qcom/camcc-qcs615.c            | 2 +-
 drivers/clk/qcom/camcc-sc8180x.c           | 2 +-
 drivers/clk/qcom/camcc-sm8450.c            | 2 +-
 drivers/clk/qcom/camcc-sm8550.c            | 2 +-
 drivers/clk/qcom/camcc-sm8650.c            | 2 +-
 drivers/clk/qcom/camcc-sm8750.c            | 2 +-
 drivers/clk/qcom/camcc-x1e80100.c          | 2 +-
 drivers/clk/qcom/common.h                  | 2 +-
 drivers/clk/qcom/dispcc-eliza.c            | 2 +-
 drivers/clk/qcom/dispcc-glymur.c           | 2 +-
 drivers/clk/qcom/dispcc-kaanapali.c        | 2 +-
 drivers/clk/qcom/dispcc-milos.c            | 2 +-
 drivers/clk/qcom/dispcc-qcs615.c           | 2 +-
 drivers/clk/qcom/gcc-eliza.c               | 2 +-
 drivers/clk/qcom/gcc-glymur.c              | 2 +-
 drivers/clk/qcom/gcc-kaanapali.c           | 2 +-
 drivers/clk/qcom/gcc-milos.c               | 2 +-
 drivers/clk/qcom/gcc-sc8180x.c             | 2 +-
 drivers/clk/qcom/gpucc-glymur.c            | 2 +-
 drivers/clk/qcom/gpucc-kaanapali.c         | 2 +-
 drivers/clk/qcom/gpucc-milos.c             | 2 +-
 drivers/clk/qcom/gpucc-qcs615.c            | 2 +-
 drivers/clk/qcom/videocc-glymur.c          | 2 +-
 drivers/clk/qcom/videocc-kaanapali.c       | 2 +-
 drivers/clk/qcom/videocc-milos.c           | 2 +-
 drivers/clk/qcom/videocc-qcs615.c          | 2 +-
 drivers/clk/qcom/videocc-sm8450.c          | 2 +-
 drivers/clk/qcom/videocc-sm8750.c          | 2 +-
 33 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq5424.c b/drivers/clk/qcom/apss-ipq5424.c
index 2d622c1fe5d0..1662c83058bc 100644
--- a/drivers/clk/qcom/apss-ipq5424.c
+++ b/drivers/clk/qcom/apss-ipq5424.c
@@ -211,7 +211,7 @@ static struct clk_alpha_pll *ipa5424_apss_plls[] = {
 	&ipq5424_apss_pll,
 };
 
-static struct qcom_cc_driver_data ipa5424_apss_driver_data = {
+static const struct qcom_cc_driver_data ipa5424_apss_driver_data = {
 	.alpha_plls = ipa5424_apss_plls,
 	.num_alpha_plls = ARRAY_SIZE(ipa5424_apss_plls),
 };
diff --git a/drivers/clk/qcom/cambistmclkcc-kaanapali.c b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
index 6ad912403b8b..77adb453ab21 100644
--- a/drivers/clk/qcom/cambistmclkcc-kaanapali.c
+++ b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
@@ -395,7 +395,7 @@ static const struct regmap_config cam_bist_mclk_cc_kaanapali_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_bist_mclk_cc_kaanapali_driver_data = {
+static const struct qcom_cc_driver_data cam_bist_mclk_cc_kaanapali_driver_data = {
 	.alpha_plls = cam_bist_mclk_cc_kaanapali_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_bist_mclk_cc_kaanapali_plls),
 	.clk_cbcrs = cam_bist_mclk_cc_kaanapali_critical_cbcrs,
diff --git a/drivers/clk/qcom/cambistmclkcc-sm8750.c b/drivers/clk/qcom/cambistmclkcc-sm8750.c
index d889a8f6561d..f0d7e3b7c532 100644
--- a/drivers/clk/qcom/cambistmclkcc-sm8750.c
+++ b/drivers/clk/qcom/cambistmclkcc-sm8750.c
@@ -414,7 +414,7 @@ static const struct regmap_config cam_bist_mclk_cc_sm8750_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_bist_mclk_cc_sm8750_driver_data = {
+static const struct qcom_cc_driver_data cam_bist_mclk_cc_sm8750_driver_data = {
 	.alpha_plls = cam_bist_mclk_cc_sm8750_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_plls),
 	.clk_cbcrs = cam_bist_mclk_cc_sm8750_critical_cbcrs,
diff --git a/drivers/clk/qcom/camcc-kaanapali.c b/drivers/clk/qcom/camcc-kaanapali.c
index c848ca99e9df..acf5f476955b 100644
--- a/drivers/clk/qcom/camcc-kaanapali.c
+++ b/drivers/clk/qcom/camcc-kaanapali.c
@@ -2615,7 +2615,7 @@ static const struct regmap_config cam_cc_kaanapali_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_kaanapali_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_kaanapali_driver_data = {
 	.alpha_plls = cam_cc_kaanapali_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_kaanapali_plls),
 	.clk_cbcrs = cam_cc_kaanapali_critical_cbcrs,
diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 0077c9c9249f..556c3c33c106 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -2117,7 +2117,7 @@ static const struct regmap_config cam_cc_milos_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_milos_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_milos_driver_data = {
 	.alpha_plls = cam_cc_milos_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_milos_plls),
 	.clk_cbcrs = cam_cc_milos_critical_cbcrs,
diff --git a/drivers/clk/qcom/camcc-qcs615.c b/drivers/clk/qcom/camcc-qcs615.c
index c063a3bfacd0..8377126c2cfe 100644
--- a/drivers/clk/qcom/camcc-qcs615.c
+++ b/drivers/clk/qcom/camcc-qcs615.c
@@ -1556,7 +1556,7 @@ static const struct regmap_config cam_cc_qcs615_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_qcs615_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_qcs615_driver_data = {
 	.alpha_plls = cam_cc_qcs615_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_qcs615_plls),
 };
diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
index 0291e2f3ea80..bd06d271928e 100644
--- a/drivers/clk/qcom/camcc-sc8180x.c
+++ b/drivers/clk/qcom/camcc-sc8180x.c
@@ -2842,7 +2842,7 @@ static const struct regmap_config cam_cc_sc8180x_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_sc8180x_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_sc8180x_driver_data = {
 	.alpha_plls = cam_cc_sc8180x_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_sc8180x_plls),
 	.clk_cbcrs = cam_cc_sc8180x_critical_cbcrs,
diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index ef8cf54d0eed..430b436a673e 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -3030,7 +3030,7 @@ static struct gdsc *cam_cc_sm8450_gdscs[] = {
 	[TITAN_TOP_GDSC] = &titan_top_gdsc,
 };
 
-static struct qcom_cc_driver_data cam_cc_sm8450_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_sm8450_driver_data = {
 	.alpha_plls = cam_cc_sm8450_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_sm8450_plls),
 	.clk_cbcrs = cam_cc_sm8450_critical_cbcrs,
diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index b8ece8a57a8a..8c42ae7544aa 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -3530,7 +3530,7 @@ static const struct regmap_config cam_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_sm8550_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_sm8550_driver_data = {
 	.alpha_plls = cam_cc_sm8550_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_sm8550_plls),
 	.clk_cbcrs = cam_cc_sm8550_critical_cbcrs,
diff --git a/drivers/clk/qcom/camcc-sm8650.c b/drivers/clk/qcom/camcc-sm8650.c
index 8b388904f56f..c0055fb08f62 100644
--- a/drivers/clk/qcom/camcc-sm8650.c
+++ b/drivers/clk/qcom/camcc-sm8650.c
@@ -3548,7 +3548,7 @@ static const struct regmap_config cam_cc_sm8650_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_sm8650_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_sm8650_driver_data = {
 	.alpha_plls = cam_cc_sm8650_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_sm8650_plls),
 	.clk_cbcrs = cam_cc_sm8650_critical_cbcrs,
diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index a797b783d4a9..9b6d49981267 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -2666,7 +2666,7 @@ static const struct regmap_config cam_cc_sm8750_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_sm8750_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_sm8750_driver_data = {
 	.alpha_plls = cam_cc_sm8750_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_sm8750_plls),
 	.clk_cbcrs = cam_cc_sm8750_critical_cbcrs,
diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index cbcc1c9fcb34..387420533125 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -2447,7 +2447,7 @@ static const struct regmap_config cam_cc_x1e80100_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_x1e80100_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_x1e80100_driver_data = {
 	.alpha_plls = cam_cc_x1e80100_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_x1e80100_plls),
 	.clk_cbcrs = cam_cc_x1e80100_critical_cbcrs,
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 953c91f7b145..69c4b21333e5 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -49,7 +49,7 @@ struct qcom_cc_desc {
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
 	bool use_rpm;
-	struct qcom_cc_driver_data *driver_data;
+	const struct qcom_cc_driver_data *driver_data;
 };
 
 /**
diff --git a/drivers/clk/qcom/dispcc-eliza.c b/drivers/clk/qcom/dispcc-eliza.c
index 062be01c1b01..60de3c743621 100644
--- a/drivers/clk/qcom/dispcc-eliza.c
+++ b/drivers/clk/qcom/dispcc-eliza.c
@@ -2076,7 +2076,7 @@ static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
 	regmap_set_bits(regmap, DISP_CC_MISC_CMD, BIT(4));
 }
 
-static struct qcom_cc_driver_data disp_cc_eliza_driver_data = {
+static const struct qcom_cc_driver_data disp_cc_eliza_driver_data = {
 	.alpha_plls = disp_cc_eliza_plls,
 	.num_alpha_plls = ARRAY_SIZE(disp_cc_eliza_plls),
 	.clk_cbcrs = disp_cc_eliza_critical_cbcrs,
diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index fd085cb90667..aae60291b55e 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -1934,7 +1934,7 @@ static const struct regmap_config disp_cc_glymur_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data disp_cc_glymur_driver_data = {
+static const struct qcom_cc_driver_data disp_cc_glymur_driver_data = {
 	.alpha_plls = disp_cc_glymur_plls,
 	.num_alpha_plls = ARRAY_SIZE(disp_cc_glymur_plls),
 	.clk_cbcrs = disp_cc_glymur_critical_cbcrs,
diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
index 5ec4d2ab6b67..ffdb4de3a33e 100644
--- a/drivers/clk/qcom/dispcc-kaanapali.c
+++ b/drivers/clk/qcom/dispcc-kaanapali.c
@@ -1907,7 +1907,7 @@ static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regm
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, BIT(4), BIT(4));
 }
 
-static struct qcom_cc_driver_data disp_cc_kaanapali_driver_data = {
+static const struct qcom_cc_driver_data disp_cc_kaanapali_driver_data = {
 	.alpha_plls = disp_cc_kaanapali_plls,
 	.num_alpha_plls = ARRAY_SIZE(disp_cc_kaanapali_plls),
 	.clk_cbcrs = disp_cc_kaanapali_critical_cbcrs,
diff --git a/drivers/clk/qcom/dispcc-milos.c b/drivers/clk/qcom/dispcc-milos.c
index 0a483fb6683a..17ff10cb2f6b 100644
--- a/drivers/clk/qcom/dispcc-milos.c
+++ b/drivers/clk/qcom/dispcc-milos.c
@@ -926,7 +926,7 @@ static void disp_cc_milos_clk_regs_configure(struct device *dev, struct regmap *
 }
 
 
-static struct qcom_cc_driver_data disp_cc_milos_driver_data = {
+static const struct qcom_cc_driver_data disp_cc_milos_driver_data = {
 	.alpha_plls = disp_cc_milos_plls,
 	.num_alpha_plls = ARRAY_SIZE(disp_cc_milos_plls),
 	.clk_cbcrs = disp_cc_milos_critical_cbcrs,
diff --git a/drivers/clk/qcom/dispcc-qcs615.c b/drivers/clk/qcom/dispcc-qcs615.c
index 4a6d78466098..21974e2574f5 100644
--- a/drivers/clk/qcom/dispcc-qcs615.c
+++ b/drivers/clk/qcom/dispcc-qcs615.c
@@ -751,7 +751,7 @@ static const struct regmap_config disp_cc_qcs615_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data disp_cc_qcs615_driver_data = {
+static const struct qcom_cc_driver_data disp_cc_qcs615_driver_data = {
 	.alpha_plls = disp_cc_qcs615_plls,
 	.num_alpha_plls = ARRAY_SIZE(disp_cc_qcs615_plls),
 	.clk_cbcrs = disp_cc_qcs615_critical_cbcrs,
diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index 06ee1469badd..9356c5bf0a03 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3050,7 +3050,7 @@ static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
 }
 
-static struct qcom_cc_driver_data gcc_eliza_driver_data = {
+static const struct qcom_cc_driver_data gcc_eliza_driver_data = {
 	.clk_cbcrs = gcc_eliza_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(gcc_eliza_critical_cbcrs),
 	.dfs_rcgs = gcc_eliza_dfs_clocks,
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 1a5d3d182705..7a199e1bd493 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8561,7 +8561,7 @@ static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
 }
 
-static struct qcom_cc_driver_data gcc_glymur_driver_data = {
+static const struct qcom_cc_driver_data gcc_glymur_driver_data = {
 	.clk_cbcrs = gcc_glymur_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(gcc_glymur_critical_cbcrs),
 	.dfs_rcgs = gcc_dfs_clocks,
diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 210ec7afbb67..44275bac095e 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3485,7 +3485,7 @@ static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regm
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
 }
 
-static struct qcom_cc_driver_data gcc_kaanapali_driver_data = {
+static const struct qcom_cc_driver_data gcc_kaanapali_driver_data = {
 	.clk_cbcrs = gcc_kaanapali_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(gcc_kaanapali_critical_cbcrs),
 	.dfs_rcgs = gcc_dfs_clocks,
diff --git a/drivers/clk/qcom/gcc-milos.c b/drivers/clk/qcom/gcc-milos.c
index 81fa09ec55d7..3438fb9039ee 100644
--- a/drivers/clk/qcom/gcc-milos.c
+++ b/drivers/clk/qcom/gcc-milos.c
@@ -3171,7 +3171,7 @@ static const struct regmap_config gcc_milos_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data gcc_milos_driver_data = {
+static const struct qcom_cc_driver_data gcc_milos_driver_data = {
 	.clk_cbcrs = gcc_milos_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(gcc_milos_critical_cbcrs),
 	.dfs_rcgs = gcc_milos_dfs_clocks,
diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 88b95d5326d9..35c2e9d555b8 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4675,7 +4675,7 @@ static void clk_sc8180x_regs_configure(struct device *dev, struct regmap *regmap
 	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
 }
 
-static struct qcom_cc_driver_data gcc_sc8180x_driver_data = {
+static const struct qcom_cc_driver_data gcc_sc8180x_driver_data = {
 	.clk_cbcrs = gcc_sc8180x_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(gcc_sc8180x_critical_cbcrs),
 	.dfs_rcgs = gcc_sc8180x_dfs_clocks,
diff --git a/drivers/clk/qcom/gpucc-glymur.c b/drivers/clk/qcom/gpucc-glymur.c
index 1a1d946347d0..824b4e09c3f9 100644
--- a/drivers/clk/qcom/gpucc-glymur.c
+++ b/drivers/clk/qcom/gpucc-glymur.c
@@ -574,7 +574,7 @@ static const struct regmap_config gpu_cc_glymur_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data gpu_cc_glymur_driver_data = {
+static const struct qcom_cc_driver_data gpu_cc_glymur_driver_data = {
 	.alpha_plls = gpu_cc_glymur_plls,
 	.num_alpha_plls = ARRAY_SIZE(gpu_cc_glymur_plls),
 	.clk_cbcrs = gpu_cc_glymur_critical_cbcrs,
diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
index d93d06067fbf..94f0feb254b3 100644
--- a/drivers/clk/qcom/gpucc-kaanapali.c
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -437,7 +437,7 @@ static const struct regmap_config gpu_cc_kaanapali_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data gpu_cc_kaanapali_driver_data = {
+static const struct qcom_cc_driver_data gpu_cc_kaanapali_driver_data = {
 	.alpha_plls = gpu_cc_kaanapali_plls,
 	.num_alpha_plls = ARRAY_SIZE(gpu_cc_kaanapali_plls),
 	.clk_cbcrs = gpu_cc_kaanapali_critical_cbcrs,
diff --git a/drivers/clk/qcom/gpucc-milos.c b/drivers/clk/qcom/gpucc-milos.c
index 4ee09879156e..7a8a3917db9b 100644
--- a/drivers/clk/qcom/gpucc-milos.c
+++ b/drivers/clk/qcom/gpucc-milos.c
@@ -518,7 +518,7 @@ static const struct regmap_config gpu_cc_milos_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data gpu_cc_milos_driver_data = {
+static const struct qcom_cc_driver_data gpu_cc_milos_driver_data = {
 	.alpha_plls = gpu_cc_milos_plls,
 	.num_alpha_plls = ARRAY_SIZE(gpu_cc_milos_plls),
 	.clk_cbcrs = gpu_cc_milos_critical_cbcrs,
diff --git a/drivers/clk/qcom/gpucc-qcs615.c b/drivers/clk/qcom/gpucc-qcs615.c
index ec6739c08425..8233136db4d8 100644
--- a/drivers/clk/qcom/gpucc-qcs615.c
+++ b/drivers/clk/qcom/gpucc-qcs615.c
@@ -485,7 +485,7 @@ static void clk_qcs615_regs_crc_configure(struct device *dev, struct regmap *reg
 	regmap_update_bits(regmap, 0x1024, 0x00800000, 0x00800000);
 }
 
-static struct qcom_cc_driver_data gpu_cc_qcs615_driver_data = {
+static const struct qcom_cc_driver_data gpu_cc_qcs615_driver_data = {
 	.alpha_plls = gpu_cc_qcs615_plls,
 	.num_alpha_plls = ARRAY_SIZE(gpu_cc_qcs615_plls),
 	.clk_cbcrs = gpu_cc_qcs615_critical_cbcrs,
diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
index ea20605dd1e5..4f1ad0db30e5 100644
--- a/drivers/clk/qcom/videocc-glymur.c
+++ b/drivers/clk/qcom/videocc-glymur.c
@@ -487,7 +487,7 @@ static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
 	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
 }
 
-static struct qcom_cc_driver_data video_cc_glymur_driver_data = {
+static const struct qcom_cc_driver_data video_cc_glymur_driver_data = {
 	.alpha_plls = video_cc_glymur_plls,
 	.num_alpha_plls = ARRAY_SIZE(video_cc_glymur_plls),
 	.clk_cbcrs = video_cc_glymur_critical_cbcrs,
diff --git a/drivers/clk/qcom/videocc-kaanapali.c b/drivers/clk/qcom/videocc-kaanapali.c
index 835a59536ba7..b060ee34e8a4 100644
--- a/drivers/clk/qcom/videocc-kaanapali.c
+++ b/drivers/clk/qcom/videocc-kaanapali.c
@@ -776,7 +776,7 @@ static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regm
 	regmap_set_bits(regmap, 0x8158, ACCU_CFG_MASK);
 }
 
-static struct qcom_cc_driver_data video_cc_kaanapali_driver_data = {
+static const struct qcom_cc_driver_data video_cc_kaanapali_driver_data = {
 	.alpha_plls = video_cc_kaanapali_plls,
 	.num_alpha_plls = ARRAY_SIZE(video_cc_kaanapali_plls),
 	.clk_cbcrs = video_cc_kaanapali_critical_cbcrs,
diff --git a/drivers/clk/qcom/videocc-milos.c b/drivers/clk/qcom/videocc-milos.c
index acc9df295d4f..012a13f8fb0b 100644
--- a/drivers/clk/qcom/videocc-milos.c
+++ b/drivers/clk/qcom/videocc-milos.c
@@ -359,7 +359,7 @@ static const struct regmap_config video_cc_milos_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data video_cc_milos_driver_data = {
+static const struct qcom_cc_driver_data video_cc_milos_driver_data = {
 	.alpha_plls = video_cc_milos_plls,
 	.num_alpha_plls = ARRAY_SIZE(video_cc_milos_plls),
 	.clk_cbcrs = video_cc_milos_critical_cbcrs,
diff --git a/drivers/clk/qcom/videocc-qcs615.c b/drivers/clk/qcom/videocc-qcs615.c
index 1b41fa44c17e..338ab803d56a 100644
--- a/drivers/clk/qcom/videocc-qcs615.c
+++ b/drivers/clk/qcom/videocc-qcs615.c
@@ -295,7 +295,7 @@ static const struct regmap_config video_cc_qcs615_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data video_cc_qcs615_driver_data = {
+static const struct qcom_cc_driver_data video_cc_qcs615_driver_data = {
 	.alpha_plls = video_cc_qcs615_plls,
 	.num_alpha_plls = ARRAY_SIZE(video_cc_qcs615_plls),
 	.clk_cbcrs = video_cc_qcs615_critical_cbcrs,
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index dc168ce199cc..acd0928be1f6 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -427,7 +427,7 @@ static const struct regmap_config video_cc_sm8450_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data video_cc_sm8450_driver_data = {
+static const struct qcom_cc_driver_data video_cc_sm8450_driver_data = {
 	.alpha_plls = video_cc_sm8450_plls,
 	.num_alpha_plls = ARRAY_SIZE(video_cc_sm8450_plls),
 	.clk_cbcrs = video_cc_sm8450_critical_cbcrs,
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
index 5c1034dd5f57..7e77822c132c 100644
--- a/drivers/clk/qcom/videocc-sm8750.c
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -407,7 +407,7 @@ static void clk_sm8750_regs_configure(struct device *dev, struct regmap *regmap)
 	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
 }
 
-static struct qcom_cc_driver_data video_cc_sm8750_driver_data = {
+static const struct qcom_cc_driver_data video_cc_sm8750_driver_data = {
 	.alpha_plls = video_cc_sm8750_plls,
 	.num_alpha_plls = ARRAY_SIZE(video_cc_sm8750_plls),
 	.clk_cbcrs = video_cc_sm8750_critical_cbcrs,
-- 
2.51.0


