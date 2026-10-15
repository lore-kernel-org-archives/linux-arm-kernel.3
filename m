Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972A1CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzm6AB9lq0hXcWvlWTSDwsYy5uYcMWQNCxs2piz67CQ=; b=SAQD+LHRm30WcYV54EO50s0Pi9
	lFXBRg8J/5Sbf8f/fRMtwObjbg4Q5ho4/oDvfIjhw4FyZ9DSuD3Lmr+jRDkwSoLNAhRgdyf/2XrOp
	DkAadYVyFSDqOuHZBJ1/vyQRRUCO+lDld1n/tizGadaE6rBQYsxDDqWFxENZCubZsIZ603U1xkqTg
	zUXe3qgWkIzzV9+mgx7SwZIJX8bkSgYA/vA71Di7FlaA/CfW20wcALRdtCBlgOLuvt6sgQy5KBUxh
	lN1WHFvW6zE9D8l+cb3jpITlm/Nuiw01sTE4NA83r7ebwdb3AzVY2yP1rCS3cf2MZ7wa1DLNTaWMM
	jt8mCa/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL3G-00000000CBA-486R;
	Thu, 15 Oct 2026 12:59:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL3C-00000000C7B-1eiN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:59:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9js9a2417395
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzm6AB9lq0hXcWvlWTSDwsYy5uYcMWQNCxs2piz67CQ=; b=LBQGD8pOGQ7+Bk+X
	vxrJS9EIOW/N2OsOJTtX82fZjOIo8io4JKaSTQ3OOnZc7cpIKT+7SYttqpZDYAfm
	3gvp++nUAWigsDNAsBmVkGn3kOntEi2ssyFFXiJa5jbjI4/HnryfDzkwEK2WtDHB
	olZ3T5edsY6cAYp6q+ykVvAdEYvZldA6G3ARD5oHkcqAONrR31/i4x5xj8SXnf+S
	3a4ysdXs0nHShUHx+go/QnEXdm9TuAXP/lm2aYz39IL4Dm7jHla2TpUqaN1s/IQY
	GCRJbx68LPxJWvoCHvhsPiXqoXVW6T/wOZvB2nG9w5xpA6ckVF6Xp/6Zhu8i1TlZ
	vLZB2w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhj5q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:59:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso2144206a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069153; x=1792673953; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzm6AB9lq0hXcWvlWTSDwsYy5uYcMWQNCxs2piz67CQ=;
        b=hnQh6Vjtc8vnqgtitFO9iL1TWlGdcY5IgsPNZqm7Z4ZwXDXSHffkFx8h5R70NvJufO
         j9NC7oVCvnid5yDx4ghoodrraQiS5fdADOG0Kk7vSWpuxaU4ZpB8KQD8LVlnQ+KuMZVf
         j2+GqkvPUM8R7+O4zpqF8al0plYj8Vn9E0gyOmNAqF2UeI2PcPnqaayC+RAnK8Eush52
         DJFOWXnkz7P+W5a9Qc6kI0gP1JNYtRS0ZxggHxn4EhwLowZlaCvwwh0dMDl6Xy6Kq8a0
         +WvYUWVyfw4Uv2hLwp9+9FKufq82vK6L5Hw9+pXFKruUkZTrxasBqd+7AyXjUxH2U5xf
         IYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069153; x=1792673953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzm6AB9lq0hXcWvlWTSDwsYy5uYcMWQNCxs2piz67CQ=;
        b=1Zb6cg1tyf73APMT63G++adcHwi4NMNRGdEStnB/ybA6xK0P376NAgu7ggS7FDd1S9
         pztWjCHe+JwtltcFdRb7pM6yXjz7OLv9+SCdIiuZyRINbxdmLeMZ7u/97hjMFYv2eBzh
         72QJjqXt5TvMu3U1iBq8F/Bb+8g2XUtWYcKynjxhsGXLEDwNQ9+RCk7UTy7XupJH1byO
         SSg+2v7WZIGBoHxuQvBe6PGQcza4dqUo6Bgo4wWA7zr2RZHOenuVXULyr74ssvgzlIFW
         mhbK3dwl0w8k75O5H4ZoIdpyfgA/oosCCZirgZTsvF98R5ta6ncq+/AUgc68kEln6Y9O
         IOyg==
X-Forwarded-Encrypted: i=1; AKwUvBwvbc76DgR8ET7zc/kCo5cN5C7AuzjGd4AQzTfzBwDVnnETt21I4xMS/b/WUG1HyIvHwp3KxhzGpEQUkiX4H9kC@lists.infradead.org
X-Gm-Message-State: AFq9FYICVM/v4ItS26lP4AAb6dLU/MhWi0UUbZ3z6pR2amzWOQ9svZSH
	+C/v+rAFbGR81jH1UHtVnnlLgkKOvy3e7Yh2L3YZ2HpTLw4VdZ4mDiMDgQR30Kix5R1RW5jTlZ5
	fYgTxs/fO9luPHDJYSURGgorcbfNM6dP9kcGkUwRHEMjYE9G/8Pi+WKNGpoe7Tvfuh2ei8O8bEk
	VjPg==
X-Gm-Gg: AYBFou1fhbUKo10jzqZDD6I7XaUhO8L1yaCbN/flQ2jbsVfLm/jtWrns2gChUUsQ1mX
	JzO6a6fMkNe1g0J/xCc2PHN6YSKGUDaXP1lCQgel4hsBXq26RixYjkolipRuuKIoQqxWAkGxSG6
	jP5UlcvuNhOw2en8CwRhnN1wfjWLYyHIKcXjC7ngYEUCdHnf8VD6qt+OPBPAaVRDvImAbqgI8Lk
	K8vWWZOlHtClz0bOezZ9mo+BwlrBSXc7k0GPDAwEc2SlBClt0GjiWvc6to/5/lC5Z+gLWUMi0z9
	c1McU/PlAIXQLkAHnDL8vXhdwzUYIrO3iJK9bic9+5Wkj3SUL009g0Lo2IXjJFTZSw3q03uFEdO
	aVm1Fc1yhJmCl4GgSCSNPCjmPbqVlf2Ar1w==
X-Received: by 2002:a17:90b:384d:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3ac97bc59f6mr2382211a91.14.1792069152843;
        Thu, 15 Oct 2026 05:59:12 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3ac97bc59f6mr2382180a91.14.1792069152211;
        Thu, 15 Oct 2026 05:59:12 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:59:11 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:25 +0530
Subject: [PATCH v3 5/8] spi: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-5-5da1096243c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=3817;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=DFbeif1siwvLY3MMd4TdLfB4FjRIpjFhIHxBdIWFXfQ=;
 b=MAjUv8u6xRV0Xk8anMuKNPBJADNkMGHOAE/nSNJ7PYGexYasIwbbodDRwGZE82ThwEC0Ld4ae
 9ifbQpoguX3AWaObYGccS1F8ifkd8N9gMboimFft/lk2OsDFGizoY80
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX2/9R/r8qbrhc
 a/Z99yFPkph1BQK8SOdQ4krsfjYCEfpQiqejOrgUfzeWFhrbyM25xuV0IL8IgaNeLkBnXmsP++k
 q5ou1kSWTa8uVuJD7awygmC68Ybxu2G73YcRk0TLt+cmXx6XM35sPgQykTXyv4pCsj10LJVpKjg
 SEKZ2orPHozkqHmEwWuAytaZ4aalwtVN8KKw3Oo/PzeLNbYTKo8n3Y9NnRa0UbUR5xDr1r5DUyl
 yQWvSiXck8NWltasfBwetDhqFEsum3ZV7WaUFvO6ffX2eI+qFzPfaJSK+QqDPwYl+qrnPsfuW+w
 auLvqVCY3u+IPtVRbu9QO8AGeLmX1fTWAmLaVdju6NWETrgOeQh43zRrnREKxixF3o9O1KdnWv/
 3BPcJmYAyjqbmfE82o8VddbbPkWg8tYwTb6S+SseNEkAG/kYknMV6vBJ+zi43aZMxJl7rhrB035
 /JH1Ew/XLwJxDmiZvWA==
X-Proofpoint-GUID: G16gjG3ZkFn7OKUX8LEkwPmGDPdd-yXm
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0ce21 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=V8jFpX-JU2fdHFI84kkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX/ZK8299fsc4P
 EtjFYfiu1ViURpXVv6Mu2DQYzl8gHq4yyYmXS4bkW5Jl2YKoscSDO6lLkP2ocVgDDsZMxTmPAI9
 Ii1sGKbZfpIHGu2vw9kkAURt2/Jf+/Y=
X-Proofpoint-ORIG-GUID: G16gjG3ZkFn7OKUX8LEkwPmGDPdd-yXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_055914_723514_5E05F071 
X-CRM114-Status: GOOD (  18.47  )
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

On the SA8255P platform there is no Linux clock handler for the SE
source clock, so the driver has no way to look up the source clock
index and divider needed to fill the GSI CONFIG0 TRE for a requested
transfer frequency. To work around this, firmware instead exposes the
SE HW supported source clock frequencies as OPPs on the perf domain
device.

geni_se_domain_attach() now populates clk_perf_tbl from
the performance-domain OPP table, allowing firmware-managed
platforms to use geni_se_clk_freq_match().

Use geni_se_set_rate() instead of dev_pm_opp_set_rate()
so clock programming is handled centrally by the GENI core,
independent of the underlying clock-control mechanism.

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 91e75e213f92..cbccd6d8689a 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -18,7 +18,6 @@
 #include <linux/module.h>
 #include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
-#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/geni-se.h>
@@ -85,7 +84,6 @@
 
 struct geni_spi_desc {
 	int (*resources_init)(struct geni_se *se);
-	int (*set_rate)(struct geni_se *se, unsigned long clk_freq);
 	int (*power_on)(struct geni_se *se);
 	int (*power_off)(struct geni_se *se);
 };
@@ -155,9 +153,9 @@ static int get_spi_clk_cfg(unsigned int speed_hz,
 
 	dev_dbg(mas->dev, "req %u=>%u sclk %lu, idx %d, div %d\n", speed_hz,
 				actual_hz, sclk_freq, *clk_idx, *clk_div);
-	ret = dev_pm_opp_set_rate(mas->dev, sclk_freq);
+	ret = geni_se_set_rate(&mas->se, sclk_freq);
 	if (ret)
-		dev_err(mas->dev, "dev_pm_opp_set_rate failed %d\n", ret);
+		dev_err(mas->dev, "geni_se_set_rate failed %d\n", ret);
 	else
 		mas->cur_sclk_hz = sclk_freq;
 
@@ -850,7 +848,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	}
 
 	/* Speed and bits per word can be overridden per transfer */
-	ret = mas->dev_data->set_rate(&mas->se, xfer->speed_hz);
+	ret = geni_spi_set_clock_and_bw(&mas->se, xfer->speed_hz);
 	if (ret)
 		return ret;
 
@@ -1248,9 +1246,14 @@ static int spi_geni_runtime_suspend(struct device *dev)
 {
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
+	int ret;
+
+	ret = mas->dev_data->power_off ?
+	      mas->dev_data->power_off(&mas->se) : 0;
+	if (ret)
+		return ret;
 
-	return mas->dev_data->power_off ?
-	       mas->dev_data->power_off(&mas->se) : 0;
+	return geni_se_set_rate(&mas->se, 0);
 }
 
 static int spi_geni_runtime_resume(struct device *dev)
@@ -1265,10 +1268,7 @@ static int spi_geni_runtime_resume(struct device *dev)
 			return ret;
 	}
 
-	if (mas->se.has_opp)
-		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
-
-	return 0;
+	return geni_se_set_rate(&mas->se, mas->cur_sclk_hz);
 }
 
 static int spi_geni_suspend(struct device *dev)
@@ -1310,14 +1310,12 @@ static const struct dev_pm_ops spi_geni_pm_ops = {
 
 static const struct geni_spi_desc geni_spi = {
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_spi_set_clock_and_bw,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct geni_spi_desc sa8255p_geni_spi = {
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_opp,
 };
 
 static const struct of_device_id spi_geni_dt_match[] = {

-- 
2.34.1


