Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466A2CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QormqeaF2HvP9chRO0iezT1tVsjAj1s4h4tBLJETsh8=; b=QzNn82wowLgbbNZWx45M5/wq9n
	0oGdHZqOVMpoo3Q9hY8FboI7Ns2WQHujsCi3O3vGyBEZlZbMJ8iixucZ96wJHIRGL1EGW0kXJ9jh1
	hQ7pOJZ+MFkhcTACzuNUc/wYyVHUiKbJEPC/QNELK2Yl/7pBFwkGhZOVelyCFvrxApG8jWPrEPCnn
	VvZllubNGgBtn+IoyiQMKDAhwN3wphFGBLoBgsw8tgaFPpEQ20pc5KqMyzOfoY1bj8zVrBNwfuMYr
	u3iklfN0JyFSPpyqHNMLHI065nJgtkdH23oqz67y/kktfB07r6HFZAL2xB8qtP2PYe0qcSQ03gE3Y
	OWKrbHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL3O-00000000CGh-0cLv;
	Thu, 15 Oct 2026 12:59:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL3N-00000000CGD-2gAl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 12:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QormqeaF2HvP9chRO0iezT1tVsjAj1s4h4tBLJETsh8=; b=e0vqqaONQAyRDMrfaqi8pAvRVo
	QRHki7jHn6s3sL2r9ujTgEqBjZc698yQq+yFuNTQpnllXNrbgtrULYAFT+mbYVYl2c9dWl2yCnDj+
	5S7O71MQvNlLBCi4XkeIb5VMDj9lHHrWbeFVjo+Zp1UzNfLOBtaW7vk1zPlMVhcWx0eDWeHb0vxlO
	VicSGGG5FPAXczz4zjCJ3qGHR6JmwnZVtNrd6SQVScU+OGuprmYBJCwNAYd6BDwNIT0gWqX6PuBoh
	IwwTkjuQf/3UQDySRCzbW6C6YOGxt02WXMq66RSTwHqKAWu/xOztqskdLWLWVoZbnRNlFxwaJK8Gm
	oEfDz66Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHL3K-00000000O7U-244h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:59:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdqg4100189
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QormqeaF2HvP9chRO0iezT1tVsjAj1s4h4tBLJETsh8=; b=L0s0nXuhOFOa8Y/Y
	QPhwbeBBr3Xn6MxK973ZKUL3TkmEMeonGoBQNNi7H1h7AJSCmmWtMwt7PhlcVN9I
	a129SPd99NmTOXWyMoyPFcE2oMwi6NL6dTfWfKtRyU9oAWwAav5zx4wuRc4nk1Fo
	EnZjPT44PcZcs0S5twjrX6JE+LSTzU+ytC1I4BjmnP8nsIE8zEIklyZEvyzedRxy
	WyC1UkodDa3N7jMtkoND3UI2XLuB45OZLT4kwBWE44HwPd+f07ppmCxXwkXO1Jjv
	HI1mkSrfBB2vNy8c77w/+IYWsTMCVoLrYIsI56o7trsAiVpVJghvyRpVaxfXCHBl
	TmJAcw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8h6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:59:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e941532594so17903445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069160; x=1792673960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QormqeaF2HvP9chRO0iezT1tVsjAj1s4h4tBLJETsh8=;
        b=VxuTG+LodSp3smDc7bT4OD/5UCvZrdpGgE8z5jHhAJYYWvsXKbhlWiwYxqis4hG5rv
         50MHHFdHZjmDxR4Ddoegf/03KPm2h2SOk9krg+N3cB8LNJiT2b07+VGVD8zO16/Dg/Pj
         VFuZVL7rF7w/mwxiQAxi0LnBEQntJHN1+BnpTE7sSBPbDgZYSZnI+UeLDfT3sCobquNT
         4L5HAL9KU1rhZ7UxEZxpUm2Wv/2P8G6+v27SuhW06Q6W7CpqlVTuarWPOyPVt8uFQc+5
         6eG/ivxsziau/JSLzRpgGanfwr8Om/mgOvAntRV8aH3e+f1rYun3YtE/AT4/2XTA9sSl
         JObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069160; x=1792673960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QormqeaF2HvP9chRO0iezT1tVsjAj1s4h4tBLJETsh8=;
        b=2QAxsHJyJloDAA3zJal56jkgVUtoPz3Q6N9NPsyCsGpVu4lJw4l+FVl5pi2zzjMvj/
         /dCJ4HiRc8EJe4rgEk1Fo/6kBLLJ3Y7MEBFNUqTkFXTolfb8+2198KFzYC4ppsrVqPCz
         Me9VyA446H2TK5fjhe9TvnRd0eFQSi8qXRE9WpTk28WfM0lkqcegXTiCMObBQdf+OU6J
         e5l0bGABg/pU0cHgVL3i5r2a8IvqwwD3mBRG+4A9UcBE+1cOh/QzlK2OvCmUny/pfise
         tH7+3dkxPM7tJyJrfZg8Jc8aUMy4CFMaJi0P9G3ZSXNY4JFt3KRqeRLvzXgClbgDEafr
         Vn6g==
X-Forwarded-Encrypted: i=1; AKwUvByjwYfCGlx7xMdfaeoGD18ycU8d3WDX49JQDhmftZ6lLuXLkN9N4xz70LfaspK1WS4ykUbLkV9oQH9GDX1unP1e@lists.infradead.org
X-Gm-Message-State: AFq9FYIlzPLnQOmiGUqfiHpEf1V2iWnEje/11CPLuAYmnelv+J+YFlEC
	eZ0VGC89i4nfLio0K9D2RV4BhnCl1Kqu4G7HRkYNjUKPkdu2E5ISdsnEoxOvcQqx+ylQ93pG1P+
	XTqcB/zcjrxJy3X+TnklK2928d5Idm9CqqPpuLZlGeAvchb/3ueqQOLLLN4hu2Yh5k0Mg0stNSw
	WNAA==
X-Gm-Gg: AYBFou36LHdmFqkAgD3WOLjqSpAlem3CbOHYhMy6qckQpjGlGBpsb0TvzoZwrVIYUVu
	XyyjWJMVmRg2qsric2SIpdx5f5gMel8kyuMRZdBfXeivd0JHIM5WOmxpDV20KMYP5g8VGB7bogm
	AtDloUjZhnTwNdoiQBRCsKB9XgV7JkYN40cf8JfKYcWiraNOSipZLBLXQCSIqGl0U5o67q6H/nI
	0b+oHdd6PJrtd+ql4XD7/Pk/tFS/i556YFOFhJJXrlceuRYULJ1vMq8fvJDj8gwzUPLbRlSON6F
	9tOzForMIjPPjyX07gymP4NTl4I7e1b8ZMkeR2K7X7r/UnjBgvaNgh7Ke+rVuKrqVdive9TjdTQ
	8sD/+en26YmZ+YsszS9UK+Q6QvSEwgPV4Zw==
X-Received: by 2002:a17:903:32c2:b0:2e2:d77b:e586 with SMTP id d9443c01a7336-2e843141ea7mr177350885ad.60.1792069159676;
        Thu, 15 Oct 2026 05:59:19 -0700 (PDT)
X-Received: by 2002:a17:903:32c2:b0:2e2:d77b:e586 with SMTP id d9443c01a7336-2e843141ea7mr177350495ad.60.1792069159130;
        Thu, 15 Oct 2026 05:59:19 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:59:18 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:26 +0530
Subject: [PATCH v3 6/8] i2c: qcom-geni: Vote for SE clock rate using OPP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-6-5da1096243c9@oss.qualcomm.com>
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=2981;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=qkaSYVs1A1FfiNbQRwSWq7z7OVJjlWk8kLkviqlm88w=;
 b=GfjgqsLnjivYglSkQthZAmSd6PQDk9KHCAFEauzeRzX/MMiVc7VnZLc7GKQI8jgnR8TphMhYv
 0FjUmepZUxjDbOHySEvh7hXEWFaXVlfWLpAyXD3kYlrAwrO+Ltc5aqI
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfXylGjnSY4IaNX
 D0glfamKvkBoWfNzYivtuqZrPXKmMzqrrDUIT8qq0v+VtHSuSI158LK849woeWlNgFYt7FQhSEg
 SJKMwnO5jbCr9catJo4Yr/T2XBmVqdE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX1JsyDyS4ZyLS
 dKMYNqTl+j3jf4shnmevnBzkbiog4/9fF5f79DbygcxndrpJEWLWVFlIBJ+cOhq7yVr5bP5pAm9
 hjmafVgEsqgTrYAGtbeQDgsineeVTQrKa1cNJ1dPA8pzIb7qn3Rr4K7pIw5iSE9XcKHT3snV0e0
 irqQ7hm3942YhWVuVXALmXnipaRPBqHyqB4j+AyvWfknZqZUVEUbiXjtn6zoPvGo6PsnMeS4BfF
 WTFXuZQinHQEfoMx00qo5q2VKzYWdVGGu+QM2xA7EH8svXpcJGkOUGnDlwVIFNk8SSIbtSvJrAR
 /1W+kkaGCXBcKCg5ND+/ZxJVAsLU+wLnzWPBm+2NUK37xkSN3jJATVM3Y6O20jfalRTVWMAxA9c
 +CQQ/ilc03OfsgqSWMNyEWb1NOjH4yQKpwBfpTkTMplYlFToPzyD92wZfr2rIFDjbjuGynpitDF
 gnccVKTDCPt+y50C1JQ==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0ce28 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=naqKnnrhZPCzqLgBruQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: dwBoKa6NvQnAsJWc96VSw0r6E-TEVRVB
X-Proofpoint-ORIG-GUID: dwBoKa6NvQnAsJWc96VSw0r6E-TEVRVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_135922_972437_FF671BAE 
X-CRM114-Status: GOOD (  20.84  )
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

The GENI I2C driver selects a source clock based on the requested bus
frequency and programs the corresponding clock selector. However, it
does not request the selected source clock rate when OPP-based clock
scaling is used.

Store the matched source clock frequency and vote for it through
dev_pm_opp_set_rate() before programming the clock selector. Also remove
and restore the vote during runtime suspend and resume.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 5f3d260a3913..a6fe89d0934f 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/geni-se.h>
 #include <linux/spinlock.h>
@@ -136,6 +137,7 @@ struct geni_i2c_dev {
 	u32 clk_freq_out;
 	const struct geni_i2c_clk_fld *clk_fld;
 	u32 clk_idx;
+	unsigned long src_freq;
 	void *dma_buf;
 	size_t xfer_len;
 	dma_addr_t dma_addr;
@@ -206,7 +208,7 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
 static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
 	const struct geni_i2c_clk_fld *itr;
-	unsigned long req_freq, res_freq;
+	unsigned long req_freq;
 	int ret;
 
 	/*
@@ -223,14 +225,14 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	}
 
 	ret = geni_se_clk_freq_match(&gi2c->se, req_freq, &gi2c->clk_idx,
-				     &res_freq, true);
+				     &gi2c->src_freq, true);
 	if (ret)
 		return dev_err_probe(gi2c->se.dev, ret,
 				     "Failed to find SE source clock %lu Hz\n",
 				     req_freq);
-	if (res_freq != req_freq) {
+	if (gi2c->src_freq != req_freq) {
 		dev_err(gi2c->se.dev, "Unsupported SE source clock %lu Hz\n",
-			res_freq);
+			gi2c->src_freq);
 		return -EINVAL;
 	}
 
@@ -255,6 +257,11 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
+	int ret;
+
+	ret = dev_pm_opp_set_rate(se->dev, gi2c->src_freq);
+	if (ret)
+		return ret;
 
 	writel_relaxed(gi2c->clk_idx, gi2c->se.base + SE_GENI_CLK_SEL);
 
@@ -1286,7 +1293,7 @@ static int geni_i2c_runtime_suspend(struct device *dev)
 		}
 	}
 
-	return 0;
+	return dev_pm_opp_set_rate(dev, 0);
 }
 
 static int geni_i2c_runtime_resume(struct device *dev)
@@ -1300,6 +1307,12 @@ static int geni_i2c_runtime_resume(struct device *dev)
 			return ret;
 	}
 
+	if (gi2c->src_freq) {
+		ret = dev_pm_opp_set_rate(dev, gi2c->src_freq);
+		if (ret)
+			return ret;
+	}
+
 	enable_irq(gi2c->irq);
 
 	return 0;

-- 
2.34.1


