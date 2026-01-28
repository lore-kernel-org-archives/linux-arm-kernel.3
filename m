Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BAED3F082
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvScNCLq/go=; b=Yt0geJlsaELzvj5WQjYvxVhs1A
	lpe4mZmy7i3bM6cg88IPkadCmcuPwJ1D15jeMuEV65iyKv9FhoeySFvc2cbXevRzR2RLcy1Gvkcwb
	p/E9zhaGVRdbAhZ3HLkJlpIKF24bzNtYxcHIBZ2rEeO054v44I3XtqNMO3y59JQwkWW81Ze2OIQgH
	0mrF2y7B3HeHTc8PmqnehwpuAHi1zAonNij48frp8fxOL1zBRYfSv0wwGUL7U7zlFh50J4UflAWKE
	+dOY0S0tsHqrBFdvnEHu5I9Xfwfdav4wT9fzKTcqH0m90gsKzx3mUiH+wMqnwxqegnMs3/mNRHmgQ
	8z+FtxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7hN-0000000GJDX-2IJe;
	Wed, 28 Jan 2026 15:43:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7hL-0000000GJDB-26A6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:43:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFfk6Q254475
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 15:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvS
	cNCLq/go=; b=pI5MwmJIgCsNpLQMgIKMm77mkOWsaYQ8K1qX8GIeyLq7rkfQ8lp
	WC2zilQEJ8qk07yht+8SPVwfGZSt54mO0wC9cc7nPbR+Jy9FJtgrCTA06CdiYyLU
	lozTWufwmQBAatB9iXrXZBMkIdJI2xQ4RZPakz9i2izUURmKOmP3X2yawMkALrVd
	YGCec5XpK9Wk5QuK9o+t3Tk/Cft092gofZptDFguVgkabJnPxysFaNocv9r1mJYl
	Xyg2NP23edokFNyxLAYu4FPi2UHimGlLf0yv1BlnwM4tEutYWpE2q62tme1Wfpnd
	lObeRG77Sdi5XW2FzKzUnxXtHEAUxTuascA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y40dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 15:43:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71500f274so617885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 07:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769614993; x=1770219793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvScNCLq/go=;
        b=atpdJrdH98qUW8clzUVFfrQi7KhQmUmrS/j/n3WhC9k9U2elLGFAG0wdJyYPFF7qm9
         AGZ8LzC1VUreV5bOXrW2fe9pr4XcEY8M0Y/gt/VqIiB0p/XhEqs+noUwmBFbQN2J6Bwg
         Cr6doJRWL7V6IaxIPCOI4SqcPNK9/Cx5CyZ82j0SAW+yoAxx3IrUwy8W2pNO22TcJqDK
         rw/7CW+YaCIzockGMw2IZjBBbZSFBGBgJQKlOQI2QHYEMx1cxgMdXUB8xoeSRVIT+DPq
         1/Gwui8Y+xkMItVzdMUvquxXQubgLYgg28dVHG26qDgZ+2E+E0gW3SGxR2kjHm99SnDE
         VBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769614993; x=1770219793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvScNCLq/go=;
        b=qp6p1xy4w+nMSN2Aw8zHukmT0VyS9yx/CCYZU+WPUTRHjCMNH6OmLs1EppGP4WSrPv
         JPCHbCrTlrsMxuCMVsWeBihwDMa3bBbNbGuBLgyT05beohcgrdBBLld7SrsvYYalaK5E
         dwOwPQtjtZ0qDO++e0n6qqKlXc+S/kE91uCyJzZhPs8vavJ5VzQDnRFSPwMCvGYrAdYX
         fEvo7lXxhLPC3OjMss7HMWhSztYKXY/Hsa9Zyuox66zis4lZP3Yy13eBAzZC5AkyFJ7A
         76j1UhE1ebV5I84SW0jd8RcCmzrrEOBYt+djU0Y6oTxLeG92FiuKagQ9TD+0E3PVG49p
         C8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKPLa+Rjh7WLMefsEDQPuBop+4vwqOeIeMn7Y23jNICd1z6KNPmd4pNoZMmnOpr3I86YGts92Cp9QNLdQwYdYE@lists.infradead.org
X-Gm-Message-State: AOJu0YzZPf1ggOpSQx6HscVl8HS+fbDXT6uQUi8t9yUmrbkg7+IXr9h5
	u3G6TMvhCTgX5PTRVN5pB717tT8/5yKaOFyDd932jJZ+0qiVokThdNcvU0YXfCfsxp/1cpRRrDK
	6qxSsn/gIp0MEeNA5EexZLQV+EMNb1XAYoTTBPwHI5duS8Q2v+A7r1sHYOCw03ZeN2RMBEi/+au
	9kQ98RSTqdhA==
X-Gm-Gg: AZuq6aLgFGuihMvnA6fP0ZlBiULyyofwY1a3dk15Ksd/AyKhQey56oWK0WTQIg8eiE+
	6qZpUyKk4uUdjkJmpOlUTeeEXYjou1HzHrNQpi2JaEtIkTRojI0IJ69Gv0vjEjX3fqZLRC2MHa+
	L0+noc6U3Ew9ijHGdVi3H3EushPgOe16dYAZ9OIbP0MibtnuTKsS+MdR27nZ9aHDqX3Ig+HQAAp
	Zlhbp7xQok2KuSEvUMaj/QGMXNCRWHgjepmsoPUF7ySWB0IyaBMe8gofrbzwPFigliaG5KfUviK
	fk+ZX5Um4yyA+jrLsCUkdpzqykmL3GQ8bv7jbK4XNEysjLuo8WJa4Avu8HYDkmKYhKTLdfV61yC
	xyFrHB/0Fpb5hZQtHRYx1MB5BhA==
X-Received: by 2002:a05:620a:f10:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c70b90f77dmr676221785a.70.1769614993353;
        Wed, 28 Jan 2026 07:43:13 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c70b90f77dmr676206585a.70.1769614991262;
        Wed, 28 Jan 2026 07:43:11 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm8003551f8f.41.2026.01.28.07.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:43:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750 camcc
Date: Wed, 28 Jan 2026 16:43:07 +0100
Message-ID: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=uAdUi2PcEKOUBFsGcYGabugs1F7YktxD7G4E6g/mjeY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpei6K6nwUOJpgDl7kWWIEgfjSRExvZiycp4pGw
 WfIx5JujLyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaXouigAKCRDBN2bmhouD
 11PBD/0ZygzFDBZ9XPkkHolSm/vx7daUl7dBNJxgRosngJmB203l5VWqsZXQ/g4yv8v8/rB/H7I
 VzabTmmP4kzKBzfVQ0WL1ww92RpfDkZ29rJea7Zq6MC7UiMnO+b8O0mkszoghxJdjwCo/uvLUWW
 aRW1oP8QlTD9XP2xUfeNqLjOt95WzAq6zjCqwYrJz/GltGbgdTr7K1rtjfnafvsE1w86wiL60Xf
 MCN4atase69g18LHCtU1Br4YP5BxluqTT8XlUhd2L9Xvbq5Cg4GMno/uBXfuSdIDWUATz4Ay1Xl
 gnPF6WAC0UdsktUYcxUEH/XrXekTzCOWOvTl0cy0VaGXQc3tkmM145rLWPptxIW3vKpbRu+v2TC
 NFsCbL2RW9IAeCfVF0kQcFBldmWdoNNDS1/Xr59vg09eRR/LqhFkpIez1Q8OBLV7VqtJgJE201F
 z8KXLnIuWLhu65H8X39TBy88FsfNjUxu0pHucFIOq8sy8sLVokM1xSd7ibHNvUevoF2vb7lSBUy
 sl5q8WWctr/ZkbRaxh/UukLybUgKnNbn+0nYc2ErpR0cKQWrNMJZ4IjpmOoRH6wipwqIn4MSb1M
 wiYvnA7e2dQ2yLa1nuMuKQEAVPytnLnrNaZGisqLxoiKMF2u6vVPr5En5bihzfrwyQOQbu34kmN kSoH2O7xd0PyLwA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9OAQM0jNzq1aPGF2J24P34QLCPqSYpdn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzMCBTYWx0ZWRfXwkQTKUQksWOm
 uFNTTTlHhGZRTNTlIVKtMMUCgSMuuukI6uiyILNwq6GO6qvUufjFijBRxiDqGdx+//BvkHk/Ytu
 HrpiCyJVqi8U2NWrll9w7sbKontd9anBDDwx7jk0vMxAYY2+nEWCubZA4oSv/GxlPtyl+9DxBnG
 FM8vnf8mk7Vum0agpMy7IDUkw5gTopT2ew+amfPh+ar4jBYykwx2F+Rwkkn/lMYCqUtzT2uUYHa
 mM8ZF2qTYugpW9DkhHelVSA/J/nVvbhik35OJ5CSLLZ8QnLLPw63t0w4whn2vHaFhoxLeSzCt+N
 C0URmegIQm6CrFxCEqMMxHyFr23OrDSaUKQ3LfKf3q45pFhoZVl84gMZTax4JLQwd5m4IL9m2TP
 pIjM4t+1hMij/0ADA8b7kknISuyXb/yBJUsdwLVmBgnpyi3hvOQzWssks81MdC+gIq7jmGhgVqz
 NYBA2hW5sKJ0s5WToUg==
X-Proofpoint-GUID: 9OAQM0jNzq1aPGF2J24P34QLCPqSYpdn
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=697a2e92 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=euIjOI2ikgTaeCi9kv0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_074315_538693_D595A482 
X-CRM114-Status: GOOD (  14.41  )
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

'struct qcom_cc_desc' is passed to qcom_cc_map() and
qcom_cc_really_probe() only as pointer to const, so make the memory
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
 drivers/clk/qcom/camcc-sm8750.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/cambistmclkcc-sm8750.c b/drivers/clk/qcom/cambistmclkcc-sm8750.c
index 952581f86db5..d889a8f6561d 100644
--- a/drivers/clk/qcom/cambistmclkcc-sm8750.c
+++ b/drivers/clk/qcom/cambistmclkcc-sm8750.c
@@ -421,7 +421,7 @@ static struct qcom_cc_driver_data cam_bist_mclk_cc_sm8750_driver_data = {
 	.num_clk_cbcrs = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_critical_cbcrs),
 };
 
-static struct qcom_cc_desc cam_bist_mclk_cc_sm8750_desc = {
+static const struct qcom_cc_desc cam_bist_mclk_cc_sm8750_desc = {
 	.config = &cam_bist_mclk_cc_sm8750_regmap_config,
 	.clks = cam_bist_mclk_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_clocks),
diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index c09fa75be457..a797b783d4a9 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -2673,7 +2673,7 @@ static struct qcom_cc_driver_data cam_cc_sm8750_driver_data = {
 	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8750_critical_cbcrs),
 };
 
-static struct qcom_cc_desc cam_cc_sm8750_desc = {
+static const struct qcom_cc_desc cam_cc_sm8750_desc = {
 	.config = &cam_cc_sm8750_regmap_config,
 	.clks = cam_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8750_clocks),
-- 
2.51.0


