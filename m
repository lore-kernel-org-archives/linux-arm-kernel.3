Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5380DC561E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 19:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpHJgO1V/4sAv63uQnIq4dASzlYb9B2GR2EdD6oSXFg=; b=ygOAESocCP+Q9aHe+ynMv06eCJ
	3GgYi0fxPwjpWFyGPEUuUAznRcY0vHAt+pA/1TgRgrCR1LMqh3dyDdcYsi5a6MdPkiQr4t+rSqWYv
	bv06uMemtVVVZ3jgTGfYWt4oa0IbvmtiWg/S976LsE1neYNpNubcQV6G0rkLdekTyqxcuKCV4qYhS
	yetDLIiTs5z3cxgcN93xCRo3OT6tT+2tgH9mRZ9cL58NCWKCgx54XFLYORmX3GgKGsTLKYhU/MR7k
	ZfVJ1kYbMlvgcyfUW2j7AuQwuE6GDrehHs902B6N0+4tfRNXOZ9KJRcX7ZJMle8cMfe5S/Vu9sRpT
	FBxNW7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLHm-00000002jf0-2MDN;
	Tue, 04 Aug 2026 19:58:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLHl-00000002jeC-0obE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 19:58:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JlRta1826847
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 19:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpHJgO1V/4sAv63uQnIq4dASzlYb9B2GR2EdD6oSXFg=; b=fIaKiKX01mNOB/a1
	Sy8oAkJeBryckX0ahyvUlp5dWd1hV51E2rErHMakYaNl2ppcMw4VMy4dmBv8k3BY
	aB7jvkegaULlaJQq3SaNCsLQ1HBh7pbltACET5mfF3IwzNRxhXD1bK10hBIyE1VH
	F88X7su5DWb8B0N+BFCuOcrTOiebmALLQYt7f7z/mXLe/X2zcP37H2HPeGjj+MBa
	gcgZEcO5vurNgreOIOaIosTKI7FK/KI3kPrvxakEjL/AuReV2I5k6yYmo282Geku
	qcmQmzVAswFbB/Aq707jBu6ZY3XMWX2a3me2UNmb7lfZdmErtPQi2A5RALOfLtw3
	y+fV2A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud1djyby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 19:58:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso132290a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 12:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873524; x=1786478324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpHJgO1V/4sAv63uQnIq4dASzlYb9B2GR2EdD6oSXFg=;
        b=Z/mS862P5wsd0v8MBfUD8rXVIBQoKC0g30CuNr4GSsKwGtF392cBiO/xof1CSSwnqa
         T1Av0yKt+MRNDSw6MeYofyb448WaD6H3seDFKH+OdiWovfG94Rb4inkkv6ap0rlW27Q3
         iSrh0d2OJRqldQljt06qABQUNZTwbo31Td1fGsdQbJU2HBxHF2BGBMquv7neuXcp4Yri
         7iN0tt8u3JKn/0ofZK8+3SGMFNHzScNW9BcfahgZHTMdYHrHOHYAmSQT8M4wpKlyR6rd
         k8iApHQgxpfmse14T+eae8GrqtpZryn1dDI+OTA6636hH8N9w0TDIXbvTxh2EYZ1G4Tf
         5+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873524; x=1786478324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpHJgO1V/4sAv63uQnIq4dASzlYb9B2GR2EdD6oSXFg=;
        b=OfJ+IrK0i9Rw+NEaceL4/zYBi99J4Sw523zHGvXN1cjM//G7YyLICwahZiCZWgZhev
         G75ijw60iMVwdybQXFctVJhkBLIxQEy1z87d7+iRxBhAUInhaQ/JUJnKwL/DV9ke+bMW
         BVFEhJ5Fvl4zZD1OqnNIlWk2E3ha5UceqmwofFmFdySvboPowqXhvllVtRZk93ChL6z0
         9XplbgAgPORddReZgYCaVs6Mch8vO0EmkacHBZrfGFLKMP53X58AIyNRV6Vl7wQQovIS
         qKBjwZSrX32BXLfqDZw0GyzsGbeGeiodecp7fmRbuCHR3rSsaQiJFwclsIB4iu3OwPpV
         jgrA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+urEvhFPM8YZLRS7M7ZEXG0LuVkrcaRr07W363oT3sojg+CA4MX3gbt8OkgG549ujD5RLTX3GABmsxf4WTKZm@lists.infradead.org
X-Gm-Message-State: AOJu0YyuMB6IshP76aO0KjbnpXLPjL6Jx/v9sz+hkD/F343hFUMyuZAu
	mBfrwFYnM4cbum8ZFK/nRM8D9Zh04OzAUZ+h08ZCjS2dpwTJcgwnq87TMDfZ3APEE/uuQUzLI3b
	2exfJdjX28XDgge1ROHS6zVxDXQE+pTeGP5iZdnC5yARgskGB7uvKBFwNqMhDrFRaBbhMD61jnz
	fhXw==
X-Gm-Gg: AR+sD13Hivfxt1x4JYZ5sZ/jmJ95GlXIxCFS0bC1EJe720fk/tD4avhFwCdrY0dOKpk
	NystIa3x+FNBSEslMt8MYtlcU167x/oyu5x24tV4mR2w2FqgOpY2DEdzH4EMCWhKh/U+3ipGWdm
	r/lq5r9CbbibeYpEKGbsgCRkx6N5nEpqRyGXPZndx4v8FxR5wRYjug1+D3as3XgF5AphM5ErYRt
	zPObFghAg5cnn584k45HiF9eIxhc7G2T6NeMaNFCypuKvqjK0YHKY9TR/q+Gkg8Y6iTjCry2Aia
	LGERTrEzi5yawhSqcnsER7SfVwvZteJmbP+G338i5cPSmullwf+Zz7w/lsYhy118Czmm98A9DY7
	nefGssY0/HLoLe1eaRP6kRzmazb5w6pxbyg==
X-Received: by 2002:a05:6a21:3a85:b0:3c3:9070:96bf with SMTP id adf61e73a8af0-3cb85dbd12cmr1203038637.9.1785873523895;
        Tue, 04 Aug 2026 12:58:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a85:b0:3c3:9070:96bf with SMTP id adf61e73a8af0-3cb85dbd12cmr1202988637.9.1785873523367;
        Tue, 04 Aug 2026 12:58:43 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm12316636eec.25.2026.08.04.12.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:58:43 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 01:27:44 +0530
Subject: [PATCH 6/7] i2c: qcom-geni: Use common GENI resource
 initialization helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-6-61171ab1cdce@oss.qualcomm.com>
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873474; l=3271;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=kPzOm1yNF2GSWJ3AQU+hUVYpKCMr/c+8cF2aK6E6Kfk=;
 b=BlEwMmGmdnL96YVYyWO8W4gJizfYcuaJusTDVCj2kLklLmnO0Q7DNPIEPA5R5plJuyZ4KrDUL
 SrUDtE2FutzAojctg5UwO2Ii/QrSYUr/8A7thKVWo/QzqkxlNUiQsaR
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: 7oXOxpqXhfp41pFvVP6VZDwpQjlxNLc5
X-Authority-Analysis: v=2.4 cv=SJRykuvH c=1 sm=1 tr=0 ts=6a724478 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZE09iLx1Z5sgUNS67XgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 7oXOxpqXhfp41pFvVP6VZDwpQjlxNLc5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX3kgi1QxoaEkd
 vQmaqB9LK3hAs+w8Ofc18Cd1ZXwhPaGdlTYZ4yNOgfNzo5zF39FqcZwlIrMO9+N6D+nFRaGfFq+
 umzAstSAwQqFeEM3vkMT/b5AKBSEmeU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX9yqVkjAZD5Ye
 DtBQ/5sB/3xPdXLJeLP50/hzAdXq+0mbwoKrAFHNZNicc5+vke0ZLqaPeVWkvHax3ToxV6zO+P+
 ityTYQCI7YX39uedt5cEGdi8WzLZI0r8iHW+Vt1xqMnVRmgin9nZmf99miHx3wuVEkxEGkLaRCL
 NyevPSyHVVBAmW7GzCVsCI36ZHaW9nxIEBcj6ZHqeuKS3UalGOCOT7iiwvkEcnwHesxPswXUHI1
 GhH5xRZCbmQ0l98wW+8xjrAT+h+4b1xFYN3c64Z1XCidr09qE86/6VEr1mEgIm6XWQMf827gOBz
 PDhkhYjwy9tifsHhIPHqsTbhD9+03L68qrbhJvZXMO6NJdkJup+s0OSKUVEvuNW6mGH4je8H9UW
 D31hPk/i17WnAYWWq7SjFndzwwRKAL/669jf8hP3bsZAkuq/4vH0lvYpM/bIIMXapKDTFQRpqZ7
 feuAR9A+2Qg+T+pWXNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_125849_249109_6DC51632 
X-CRM114-Status: GOOD (  18.15  )
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

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..a23554d101fd 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -228,10 +228,13 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
 	val |= itr->t_cycle_cnt;
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
+
 	trace_geni_i2c_bus_setup(gi2c->se.dev, gi2c->clk_freq_out,
 				 itr->clk_div, itr->t_high_cnt,
 				 itr->t_low_cnt, itr->t_cycle_cnt);
-	return 0;
+
+	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
+				  Bps_to_icc(gi2c->clk_freq_out));
 }
 
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
@@ -1100,24 +1103,6 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
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
-		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
-				     gi2c->clk_freq_out);
-
-	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
-				  Bps_to_icc(gi2c->clk_freq_out));
-}
-
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
@@ -1188,6 +1173,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = geni_i2c_clk_map_idx(gi2c);
+	if (ret)
+		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
+				     gi2c->clk_freq_out);
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret)
 		return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
@@ -1281,7 +1271,7 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 };
 
 static const struct geni_i2c_desc geni_i2c = {
-	.resources_init = geni_i2c_resources_init,
+	.resources_init = geni_se_resources_init,
 	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
@@ -1290,7 +1280,7 @@ static const struct geni_i2c_desc geni_i2c = {
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


