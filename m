Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29616C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6gN3x8PKcm1sNfVijcrAK0H0yaVuRFKl9zQpFpFyM8=; b=HkybjNtThvUlJEppPkbhAMvd3k
	Qfpa9XwBzBMICNYtts8kRmqdhgAft8ozJwqJkRrek8269lgFlhAA15rKUFYUSHECH/61lD5B7n1RB
	7nHNtQcnXb5XZM6FVVr3KSDFmbwcVNkOpHg7MIMaSGP48jW82PrgXDcq6dLlxbCINcb6iDzg1V+23
	uP78Un+y0K/pTfXEQ1FgCBHCg1wM7EMLI2wQY+LmE2tgc0uIb1MZGNR4Eo9EvlmdjR3ValsaK7aQl
	HqPH+IBMIX8zhnzl+YlrXhEWj7q6imvWzCe6JnSaqt+TliPIDzzRX3mM6OrAz+q17r6y2a2amJ9oh
	i9jpYzAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzePG-00000004Xw6-1hhl;
	Thu, 27 Aug 2026 18:00:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeOW-00000004Xgu-2pKV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 18:00:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXqhK554101
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 18:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6gN3x8PKcm1sNfVijcrAK0H0yaVuRFKl9zQpFpFyM8=; b=pDQZIbHUJFoO0VNv
	eLtmuCZWX+K91CL/bR6Gxfkg3W00iGUL+3F8bY4OQ9aMJ+dUJfSXaPAcAOUo70x8
	kfJaERqNh+dD5h44D1P1of3B76gFEEc+xyfid8SvrUtgEKnK234l55y/URLtWOXU
	hz1MLLB08hffmyiExn94SkWFcdBWI5PC8ES1q33DxkTDF5IBs/AhzziPYglDV9ux
	zYpWLLfCVT1NB4RgoljWFcjRuxsOTokKAdmE3igRN97keIM4En4oSlAraqxL0Kn+
	Y6793eJlXfNSeTn2Ekwfm12EnyTZEGGu/dCuDqpCO1ZXaRs9SHVUk1nrsL+eiDhz
	WjhGqA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fhqgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 18:00:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so349738a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853606; x=1788458406; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6gN3x8PKcm1sNfVijcrAK0H0yaVuRFKl9zQpFpFyM8=;
        b=KYHzybsKmb9q1yrLQyi1y/NBF+rKkYC/WggE5aglE+guHKPZkOhT4YHYVnMV4VNnCf
         I3WnE4f6gSicE5Pqxkzaz0JEfIyNglV43pvEVbbt2nS8WzOUN4rh5rzgelLL1BAKGBsx
         2iI2w3Bm9vI07IXELe7zmHRyYuBquuBb1PCpRgbEQNKZCkWc8Q9SicjAzXrql2CaEDrc
         XTv99jyePeSkSCXg7LF8E0lxAeYg7iHzZEfAGuA9Uu7iAIOAXGGocOW9q0kGhkiXWw2A
         itSmqqKqctVKePBymMtMvscKLnz4mxW6OsW7236cn+WcrPjd48enrtxmvo/gEsZup47l
         9tKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853606; x=1788458406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6gN3x8PKcm1sNfVijcrAK0H0yaVuRFKl9zQpFpFyM8=;
        b=ScfUTdgVdfgxhUfoPqdkJm+Lq1WOm/5R/ngjmz+lee0qYtF/1/tq9nu1NDx2plDpv8
         R6/4j54V1S2X4DUU7AOyU3vpHZq50Z/fmaeJ5VW2jB4hkPSb/70mcN/vuKZol+MXffZC
         0lg00AmvA33DOOhTLIl8xdWnXBu8QjEzmD32qBWIBrMqnlnP3WQyag3tHAS/gmuSq56V
         YJBDdO2LCIZ7kzaDaZGwlS9MncerYqGm6cs2vuVq7tDoKsKvEMgxY4oyV4YZkzMWtsx1
         7czViYI7Q7SJd6uI2IciWRdUDu0lR7On4lX1MUETteXGJQmgntqmm/A/gC7sqsuGwrV1
         4Z2A==
X-Forwarded-Encrypted: i=1; AHgh+Rq3LWwg2Yul5yfvd6S3IOnOc8cAo3HUjfaM9iz51qf+SVAMBbSawACj/q7rxPAkQ5ngekCJEWRmF/yj1gtYc8LX@lists.infradead.org
X-Gm-Message-State: AFuF++kO3kQRciGugUee3omRSSPtXmTFeiEqTrG2UWJTFsq8S7meZWwh
	RiLI6ejWq74WSFWPOdvmG8rWb9HH0LAx4mWVWHGIoUdf9vLQ0oK6X74neVyWPusXiNeIEpGnSrK
	0v3QuBgGLAPUmzsXLwepiOhvqqOgbb53C32X5Lw57BRR8DhcrBobVAz0qyWY1W3YSSuvnFM57ad
	D3UQ==
X-Gm-Gg: AR+sD12T2WrZGgRWluICBR8DYgmDAfjolmv3uCeQSLZT85kc91plMb9tY6/Bh3zNXrG
	lOTprc0o4hl/PJCI63LpDJvcXyTmX6DQ0LoF8nEyXd6VJDRwemOGEGWifreJV5nWyu8Ma7L/92h
	m9AcLC8WjIRX40bmVdoZsDZ1OGgvh1oJBkgV21BfmorDVGMDhntAJG1mo6ESowsXSuGnvPAebk2
	xaExXuIjlVi2HQPOssNvz6p9wswqX7S0WicsQR4B0F3ZIcCHO7Kuqo4DoqxbavcnJmMoxzz5Lvq
	QU0dNpQB9Ai9a3sNBymDgEY2JU5Nj/zDOmcvmdaNHJSD+IDSH69mCad/aw0XmRhcJIJNULbaUd4
	xrZPADope1ctpa2YSAyNILr40Az4+KNY68A==
X-Received: by 2002:a05:6a21:a09:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3d26668474amr1671809637.2.1787853606511;
        Thu, 27 Aug 2026 11:00:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:a09:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3d26668474amr1671648637.2.1787853605873;
        Thu, 27 Aug 2026 11:00:05 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.10.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:00:05 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:22 +0530
Subject: [PATCH v2 5/9] serial: qcom-geni: Use geni_se_set_rate() for
 source clock configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=4351;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=FBDw/I4Waykly4lZ3CvAqJEIzFElSwmZ1beXrSZKiUM=;
 b=VgT+A7/GZ3REIZN+WvvXjm2mcwdMPEtOIvgaOslmKLbXnHIQq4y29ZStj5qCPOq4RYkmX7ljr
 HOmcb3nAFZ0Da7puZcMuSC0WA2YWZwrcgHSUyzzEkCpxqrXAY+WlvJD
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXxw0ZBQjScJPs
 ocT8MTYpTjjignBFQCiF9npBt5KyIVIUd8jwhswoEKg5pW8r3wWWNolpw8cwQnNkPmwoTlvdac2
 Iv9asVLLWInmHAi2Dmqr+UMyCOwfhqU=
X-Proofpoint-GUID: YAFA5Bh200KJO4ek5XGwOvckv4S6tkjp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX1+Y/I45bbfiq
 G60+YI7c+DsXfqBp5ciKBXnOQ8xhukbW/2GwX2PRxY2/bmluUtwoS4JOoKOfS66AobjlQgylIMz
 +WX+6ghl0AlHDwIasSPb6b3/Rxuv87lKjZnoPwlU1FniAhArncodT5hopS1nnEbG5CJu3ibPVWT
 shs5gp/PKh0mon6Vl8nfjja1ydkTzpH2L1HZxwa9eYNcydTcnZMvfqVRn8YNm1QvlOTU1LRCi2H
 4dy4PJxYB9hfW3DrDNywPaVK8PPUBqOvLUr4fd/hGrBGiEFB8D0Ta6eGn7hehM2YMjkbNR+NKcn
 q1CoK6PDbae3clnkFEpKc9MXwV7WOVyuIQKFtVCwch8rVGn+UtZ1T98HoI4HWJATdF4pCEZIxA+
 hmYpyJlGUAQvP6w7QhBOfow3T6XuCWjFmccSci+kzLDtJ+itpMsF50eQD6QkZAiKaVR8Wf3YHUf
 0CYVJnlOn9PXjvrG6wQ==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a907b27 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_eeGUSGHzPgYkwSUgSAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: YAFA5Bh200KJO4ek5XGwOvckv4S6tkjp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_110008_877106_8E57A55D 
X-CRM114-Status: GOOD (  18.34  )
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
source clock, so the driver has no way to compute the divider needed
for a requested baud rate. To work around this, firmware instead
exposes the SE HW supported source clock frequencies as OPPs on the
perf domain device.

geni_se_domain_attach() now populates clk_perf_tbl from
the performance-domain OPP table, allowing firmware-managed
platforms to use geni_se_clk_freq_match().

Call geni_serial_set_rate() unconditionally from
qcom_geni_serial_set_termios(), and use geni_se_set_rate() instead of
dev_pm_opp_set_rate() so clock programming is handled centrally by
the GENI core, independent of the underlying clock-control mechanism.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..23ecd137c521 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -114,7 +114,6 @@ struct qcom_geni_device_data {
 	bool console;
 	enum geni_se_xfer_mode mode;
 	int (*resources_init)(struct geni_se *se);
-	int (*set_rate)(struct geni_se *se, unsigned long baud);
 	int (*power_on)(struct geni_se *se);
 	int (*power_off)(struct geni_se *se);
 };
@@ -1474,7 +1473,10 @@ static int geni_serial_set_rate(struct geni_se *se, unsigned long baud)
 
 	uport->uartclk = clk_rate;
 	port->clk_rate = clk_rate;
-	dev_pm_opp_set_rate(uport->dev, clk_rate);
+	ret = geni_se_set_rate(&port->se, clk_rate);
+	if (ret)
+		return ret;
+
 	ser_clk_cfg = SER_CLK_EN;
 	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
 
@@ -1513,7 +1515,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
 
-	ret = port->dev_data->set_rate(&port->se, baud);
+	ret = geni_serial_set_rate(&port->se, baud);
 	if (ret)
 		return;
 
@@ -2039,15 +2041,19 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
+	int ret;
 
-	return port->dev_data->power_off ?
-	       port->dev_data->power_off(&port->se) : 0;
+	ret = port->dev_data->power_off ?
+	      port->dev_data->power_off(&port->se) : 0;
+	if (ret)
+		return ret;
+
+	return geni_se_set_rate(&port->se, 0);
 }
 
 static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
-	struct uart_port *uport = &port->uport;
 	int ret;
 
 	if (port->dev_data->power_on) {
@@ -2056,8 +2062,8 @@ static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 			return ret;
 	}
 
-	if (port->se.has_opp && port->clk_rate)
-		return dev_pm_opp_set_rate(uport->dev, port->clk_rate);
+	if (port->clk_rate)
+		return geni_se_set_rate(&port->se, port->clk_rate);
 
 	return 0;
 }
@@ -2116,7 +2122,6 @@ static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_serial_set_rate,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -2125,7 +2130,6 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_level,
 };
 #endif
 
@@ -2133,7 +2137,6 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_serial_set_rate,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -2142,7 +2145,6 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_level,
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {

-- 
2.34.1


