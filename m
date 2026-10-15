Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E92CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfARhd2Cd5D0LKCfKmBfrYamQ5SQ7NPlyQwh4TIucTA=; b=Kqni4mzCZK80UC/OsbJHG4mUwa
	PpQMRgPkYM20Bcv+J4F3wMCG1RVQfNW/TehlEhVO1qKkcXwRP0OJhMhQjOIBmJjyTQp7xThw4e+gQ
	UcDMbR/WTJyAkcbPJQixd8eHTWlV1OhLpmNuyG+ISIQIEcg6rBkxMNrtb4iP5GgOTHQcvJgak5XKJ
	aXRPeEEmfhx0ze9FXjtDZqtVayWa/T5f81uI5as2U9Hbw4ue8Ubc1w63ShB92o6p/wSrwd//K3AS2
	xl+IyhNy9Yts/vhCCDbJsQIIlLgyZXQxPGFYW91mfoaiR6klpy/yZuudxEJ1Fl5ygZzTRJr6DHwUx
	/S6xkx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL3U-00000000CK4-18ju;
	Thu, 15 Oct 2026 12:59:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL3P-00000000CHh-2xZS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:59:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPtOK1596357
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zfARhd2Cd5D0LKCfKmBfrYamQ5SQ7NPlyQwh4TIucTA=; b=gRFs+kSwo4bhElst
	CbIafUGx7J/x8C1Lyyxcz6NHyXlcYrvy13gc6IXt0rTRmvxOgz01Ko+SYHtbADJu
	ZiirVWp+5sRRF5QtdA3LRjEXmLLT23Ou5VXV9KGUq4549FuYGgLoiJKc2Sqe1Zyx
	IyIu9fRToDuZvN+LTHs9Ga+BrnREu7qLjnuYw9v8IzMLS1TVo55suSFxgbl2Lg/b
	M71vXb2p547b0qf9b7dykGjOQXf7Ij673MGu2Wz1lu7wZFwAC+Ub+8L5OxgSBvcc
	csn99ynv8TCyT+sEtaonpDCf/D18ZZUvJumDUobMpldIMNz575vaymCYm5uf2we3
	L4xSlw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v8hqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:59:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8dd9b9743so43989935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069166; x=1792673966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zfARhd2Cd5D0LKCfKmBfrYamQ5SQ7NPlyQwh4TIucTA=;
        b=fqmu63KPBu23P3HQEmAhNoai9IxNWLIcTJf/aAcEP/wLYACyY1EXUjOQOg6XCctq2i
         McxyiBVkt9UGuBavNhzV/ZnsWfusNW5yx3L9D0yAuD7XPeSXyjScnYfITIsRA/0Z65cI
         eX5wy33yp3IsC69uW1d4J5dzc5taM7EivMezYfEpw2H1KhxeEIf3jT3OXoSXodH+B/P5
         9ePMTtFtjNmof9U/fbZQB6giX/H1jcvdehMmy8QWOQ03gJ/dZYAn2/GhMSExx/6ntREr
         /dHPdWBkQf+If8K4ZJDfsF0kRiGmW9X0fRgn1TscidxrCupKnBsA13EX6WFiSz0qmLdM
         8tEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069166; x=1792673966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfARhd2Cd5D0LKCfKmBfrYamQ5SQ7NPlyQwh4TIucTA=;
        b=1VEhL6h43qsrkb6AjWjiAB10KUOiJ1BC4oxgQSlsPr2Rleb5FVCIp9HNRlbQoZDio9
         FKNT6m9spH4G3udrrulxxid72cFmgV6NoexfORDzA4geRImQROjcXSdW+fpkvHgPyEtP
         K9RX8g52PrhfUXyPdMeSKjJ+40IxLA5Bl8mWfo+WVnw5dsLCcD28yuf6qkNOQuVaroup
         amYcYv8ZkDLxJi2PSAvnO6zbRyp9uGXUpAewmTjbrH+7JpkZrIVKKB+vm5in09mFuVs0
         RD79yNzuLsl8bQwL+mOwDa3uVlLQoePlg7/6vVE5MAtQiNKI/BDL6Bj1QIgEr6sHLTVq
         inrw==
X-Forwarded-Encrypted: i=1; AKwUvByc/09HzmKPNd0TQSjYxgcn1S/XBlD9pgUiXL1cLgG6b5vhtZO0ZqWUdUo5g2HPCmlN2nx5UXDmJ2/rhzItf1vT@lists.infradead.org
X-Gm-Message-State: AFq9FYJgwR2Hv5KHWc0iHWYfDzsovTxcbuUOGxYyDRotpLc+jyb8G8vr
	kBNCij76EHrZqR+anzBPx/xbawUc4FEJuhYDowETnyCOJzsTS5BZhiFTFIKISbbTq5l+y0Kd/rN
	nmmO+9hYUkgp6rWgCbYOlnyMo2Xpjlo1CzdKHXHhFyW4/t6CxLlNiv4Z5XvwA04XuuV3aoA/EVt
	feGg==
X-Gm-Gg: AYBFou38acQ4TQXij06WT7qRu0EKVK7gMllWWfx5+nzWWCo4dDI0IOMKrUoVcWm8K4J
	25dOsIAEJe9UOSbkkOpSNJeqsIt+LiYftk9ty/mPtCz0VrnKo25Tfi314a2XLG8Zq19IwK4lgMc
	s6TzWlWy6Lho9vHSrJAWAXsRwA1+44+fa+JSSJdxhQX772y+9Gt7QUDNAx7e/TiZBjiaCtr98qq
	jZJfUB4U9/HUwaaCGMVPVEx3BoStqGrf515Mijww4UR0NWWMq4KQ3YyrGpAp+pB1uackK8uYVsG
	0Xcq/PV5r1fW4og+IybI0FZCvowIkca14gZNd81UQns6KPoLs6nkhpg1PLf8JuH+o3rVfqIj5Qj
	45gfX3GG5VZCfZUlj2Eivz44+iyYgPeP8Zg==
X-Received: by 2002:a17:902:e744:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e842cef77amr177414735ad.60.1792069166492;
        Thu, 15 Oct 2026 05:59:26 -0700 (PDT)
X-Received: by 2002:a17:902:e744:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e842cef77amr177414375ad.60.1792069165928;
        Thu, 15 Oct 2026 05:59:25 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:59:25 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:27 +0530
Subject: [PATCH v3 7/8] i2c: qcom-geni: Use common GENI resource
 initialization helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-7-5da1096243c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=3039;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=H6ntn66f4ef9aZvMPuSRQhRjCjfBwkRDzsp/XruTxpI=;
 b=iuzorpln8GRBCUKljGM4qKH0m54f2xCjz0e03AcfAxykORWve8VVaZm4I8yUUdhoZntZmIDlQ
 7Y9wUHGY9ywCQPbLwO2IW6dBz/krETNX9ZXurLuuHE68LZmU+//AvC1
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfXzhRsdfTmgaJ4
 2cxtmHouOKpbNCqlVwhvx0YH7k1YsJpuV2+7drNzWXz/SMiYJeOmgASjkJIhrMy/Z0blB2Dbmog
 nfvvOaC5Ul56ey+HjY+CWdmXf2lS+pFARNZt+Orlnd9tEg2SltsfcwJPE/4PZWGrfghs/We+VAe
 YWY6ukyxygHyVCv/dTSXmM6kY8TWDoE6SU5AfdCPXH9PerDNQBVcS3Aoj1b+rLe8Y4qh5MB/ptl
 Sm/NHaNfdaeZNtQoHBcR5kVxZ1Y8E+CGek97FxlVOP7HymAErwfiUvSx5/BMJ+Y5EAjM5DldgjW
 /39cX3uWJfKRGos9c6yZLgDjwRlHaoN2SXoovAz/AMjOfz4LUKhXz1/4w2SkJxjhj75cKNnTYD7
 NDOK8MV2KAqqmUrnR7yea331o3Sk8Td9JMXMFvudQzZyO2GNM0dIc+VHv3EDzltR7MQ58b4EXZA
 iKdpn07yHfOoM6ChKgA==
X-Proofpoint-ORIG-GUID: 8HBpBjj4MS8GdMm4yzEl_DUc4OOGQhGO
X-Proofpoint-GUID: 8HBpBjj4MS8GdMm4yzEl_DUc4OOGQhGO
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0ce2f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FF1tyFs_GJ8PAB6o4BcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX5GDkGJaJIR7i
 yG/dRtJLK5DGOjHpcPZxmjrzXtzua66XPmNo3oyHKayWFqUAZDvww7VAkORh/XnnojNVEESChfy
 J4se1HpPqKwGr377zB40rciVuOQAYxE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_055927_786495_3FCE6D14 
X-CRM114-Status: GOOD (  17.62  )
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

The driver implements a custom resources_init() callback for clock
frequency validation and bandwidth vote programming. Neither operation is
required for resource initialization itself.

Move clock frequency validation to probe and program the ICC bandwidth vote
from qcom_geni_i2c_conf(), where the bus frequency is configured. This
allows the driver to use geni_se_resources_init() directly and removes the
I2C-specific resource initialization wrapper.

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a6fe89d0934f..dbe344719b86 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -275,7 +275,9 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	trace_geni_i2c_bus_setup(gi2c->se.dev, gi2c->clk_freq_out,
 				 itr->clk_div, itr->t_high_cnt,
 				 itr->t_low_cnt, itr->t_cycle_cnt);
-	return 0;
+
+	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
+				  Bps_to_icc(gi2c->clk_freq_out));
 }
 
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
@@ -1167,22 +1169,6 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
-static int geni_i2c_resources_init(struct geni_se *se)
-{
-	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
-	int ret;
-
-	ret = geni_se_resources_init(&gi2c->se);
-	if (ret)
-		return ret;
-
-	ret = geni_i2c_clk_map_idx(gi2c);
-	if (ret)
-		return ret;
-
-	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
-				  Bps_to_icc(gi2c->clk_freq_out));
-}
 
 static int geni_i2c_probe(struct platform_device *pdev)
 {
@@ -1251,6 +1237,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = geni_i2c_clk_map_idx(gi2c);
+	if (ret)
+		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
+				     gi2c->clk_freq_out);
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
 		release_gpi_dma(gi2c);
@@ -1353,7 +1344,7 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 };
 
 static const struct geni_i2c_desc geni_i2c = {
-	.resources_init = geni_i2c_resources_init,
+	.resources_init = geni_se_resources_init,
 	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
@@ -1362,7 +1353,7 @@ static const struct geni_i2c_desc geni_i2c = {
 static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
-	.resources_init = geni_i2c_resources_init,
+	.resources_init = geni_se_resources_init,
 	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,

-- 
2.34.1


