Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C731CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NS2pUTAJCmRHLkgfAwlsRgGb53nRJ44v/R3W8FvO4mI=; b=H5BKpJeZcNi1QPR4RVKCz6OWgC
	JQF/tGH9T0j/A6AEvQOCW/2EeeKJd1dtmD8qD8EtvcSASkY1oNfTlk0aKZwOfIcQq+UU1ExJDnbpQ
	wrpqTzOJLao1mvaLK4vQCoau4tZDdBCK9TQ7l7wS03wEeZniWNues2Y27kA1/kyapaw5eO2IxHfVF
	VlpPJ9X0MoVHGDP8Yx/mBT/XNgbIGcZITOWagEEuKd3L482Bms7jfyP1fJqbNu9ixPshBF0lbVEgI
	rD44r/TCtsBI+3yyNpc4AWrW1ECood5bo9gf0JWhYW+XKZGbDqXCUbVP67QSrnvYJ0xblyDA5qDA/
	pzzmT5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL39-00000000C58-1OlI;
	Thu, 15 Oct 2026 12:59:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL35-00000000C2L-1OdL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:59:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kE8L2999157
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NS2pUTAJCmRHLkgfAwlsRgGb53nRJ44v/R3W8FvO4mI=; b=dqQmgL6vp4PFkhuC
	CS6MnN8QxsWP5+oi+CL+5Ppxaz4VgR15olqIliTcpLSHquVdu11wWamEaJH6X+rJ
	HzrazjJTKFCvmdZvh8csqzLkKmCOBQp5NSHtkqOAzUuODetnSsZ/3+ABPXvy2rHN
	gqObXhNofizvk/gbrmj4ZdvOk09vzjc2nqsBQKBdbsEreJfQ1EuMl4FFjuWrSTq8
	8f1HUkFWJ64sf3o3A0sMe36CJVq6yzqLpWE8h0lymf3YOptc7M5xsfw6LId/IxMW
	ae6qZaW+Cfqp9n4HCpJ6ImhMUnWkQuxGaCYVOLYdeWWnju42jcpUVT06qMDuifuL
	Sezoyg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm10rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:59:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so21324145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069146; x=1792673946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NS2pUTAJCmRHLkgfAwlsRgGb53nRJ44v/R3W8FvO4mI=;
        b=SJqLluGfjvYbWGitKNe6txWzIuf2OC8QROOvbeUYOq8TzAQlBn2GtcWc6A3ABbh8fH
         MsoDYZxH5zR8Vp4wkp9l70kDft6oz+LXyuiXldLBptutrJ5+3NwPw7NJnyO2bPGu1Uw2
         ffhlegfcJ1zjhw5S0ZH94824wSBJYaXc7efest6DU5RalnhJMpELmXvH8VFS7rFIVh76
         Z1KUaYikCd8DFdd3n1Zx/g+CZkuLCbnZUfXujFdNEw4xU8hSW6Gd+oT5vGyuFGIDYh89
         zxz0DemzHsutcxz7AJkt8Hw9HeDj1ffKgiUG7MvzX7Tzk7CxUQLkZfrUMhs23UAK9ZFw
         rW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069146; x=1792673946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NS2pUTAJCmRHLkgfAwlsRgGb53nRJ44v/R3W8FvO4mI=;
        b=smOyNVbvyAjDuXjnye6osZHw99Q+gDXVNyTAu/7R1ajLDj/Svb9MVD+KIJI1ikW/Tq
         7rfsKk1FUK2P42WMq7JJiIoea1VnPNHpianqDlnAQCQubNPQIxb6R3HLkjw2+a5QtTid
         Lu5CBw9n3FGk1Bk5Kqatp3+jXYykf7fUpGsZl1vc7SFoqtAGdyzOoG2CtyZhVfc+9IzK
         M5zOa/4LpdejEs4S17v/DmBmH1UpqP/JmJfC0gARXjZiR+D3sc9o9wq5uxghNAmNBjKB
         ooJxPj7Y21mkc7ZHZTEpvB928JodalMk5bik6DITzB8+ChzvmxFJzLZUuIVHeGBQQLGN
         WG3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzg5FILWTHXBt8lLqtGx/nNw6QF0NspgswpEdBWTkOOPJq+yh72oarmEE4LOXYqjNG8vuY/XSuhw5LqLee9EVpL@lists.infradead.org
X-Gm-Message-State: AFq9FYLe2cnwCyCNwkXX1QoLJXkKjg3/YfLSBdQyYtBytlWcCtzdJmrz
	FxhjvwMQxpC61gbAjmGzS8+bkRVKmlVNSsydcaQpH3lvfkVsTLf4wZ0DLl3yYydk7jbW5xxVpfU
	ZtkQqU8JMPfpB6YuUurnBk4gzjDL7EA5TmgyDX+QC8cQUgsQ1DRhGE6p+j5YnQSWIW8Tzbjj5Or
	/ROQ==
X-Gm-Gg: AYBFou3J389Ey7VqVdJgvndnRhiOZXtXJvwjfC8wIrihUHi7ZUvTnk/ej2KHncUVinQ
	cg/IuoPWkm9WQtErSdYuLWpdkCp2+vaYkGWGiI8/lib0sdx/2VmNx8bkGwQkB/ur6f1LTd0ii+D
	dVBCz5hRp9O4jhUbhMP4HBwXsNF9XYWieffJx7xm0IwP+JasHveV+GFJURJ57qg34TIsViLytOV
	LdlgEXTTYMPzgm7EdGq4ylJlc5VU39a13OgvT28EoMegbi4g8CjYWnVQbmJwkOaI/jDGAlNISLt
	gtOKWacwhUAvyrRLkP4imIFEO9lF+0ggItGTf5L4sTjDwRNrvFfuRlObmvCaqb9e8cdmZcf/6sJ
	WVlcMH8PbhVCX+vAvc5EiDzfcLEwpaUy5xg==
X-Received: by 2002:a17:903:950:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2e842dfd193mr157615495ad.50.1792069145958;
        Thu, 15 Oct 2026 05:59:05 -0700 (PDT)
X-Received: by 2002:a17:903:950:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2e842dfd193mr157615175ad.50.1792069145289;
        Thu, 15 Oct 2026 05:59:05 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:59:04 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:24 +0530
Subject: [PATCH v3 4/8] serial: qcom-geni: Use geni_se_set_rate() for
 source clock configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-4-5da1096243c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=4422;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=D5hDXPqe2PtFIqZaUJ2ZeOjQJToEsTsjm2AhJE0Nzdk=;
 b=Q4kkifXtTtFt+/FI1kJOZPyXpAvkQJINudlhQ791bX1hDNv6w8bQVqILWfb0Sqwd3nTpWAdio
 zufOgeYtOUXCyNV78WhYHNUkCWyL9FbCQlPQV+thGdv3SeN3VsB8W0L
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: U2VDOgL0U8UhhLCC_m8AzKltq5bV0fFE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX5tQpks4IOQvC
 ZpmUf26QY+skuTpyfvK+PNkwnu4YOGNPiT4cRbeN4CejcxLaQIZWaYwsitcgLHneBjxiXpNWkDs
 rC9ZWa9NdgduEwuiuKQBsPEfkf1ohcdZ+SwP1t3+MAnyyECgVaHnH9UZmb41Q+CWu9nqTo+hGGZ
 a1p3OCv3KuwbaCXFgUg0rnAi0ocBOBbv8Ab/4pIKJud8SFZE+gTnMddQMm+tG+NAF8i7uxe5fzT
 Nd7AfArRtOWQhDSYirrtZ31O5fL5DfBvbrSvH4ixsAhVH9BAIAH8A/i8j7KL+5HFl9r13XDTxU7
 IRHVFuGkF4bZPn8e2ZIfKJCI6E/7Uxl9kbvwtVLWTiQSRiOkj2xYmH8mZW/WauldZo3c7Nhxi2d
 eyD1EdIIB7Y9O07ywCe1yKdrlHHpRTqqxl/piOsyZv7M764z4Xcvtx3i09wScnU1omdut3fUgUE
 g+Ipwpz2Teq3L3XTX/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfXw9baIYBk58Rz
 wdf9ZLaW/hAmEzYzIIYH3MkSVldqDHG0bIq37Pw5toPudOf7BqKejpPck9mzFCNz3IkGCJpSqLN
 zwR1L/kkyoQ264CnkQ4Eu07O4V6HvVQ=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0ce1a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_eeGUSGHzPgYkwSUgSAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: U2VDOgL0U8UhhLCC_m8AzKltq5bV0fFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_055908_427086_1107265E 
X-CRM114-Status: GOOD (  18.57  )
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

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 4a6f526340b8..23e423009255 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -113,7 +113,6 @@ struct qcom_geni_device_data {
 	bool console;
 	enum geni_se_xfer_mode mode;
 	int (*resources_init)(struct geni_se *se);
-	int (*set_rate)(struct geni_se *se, unsigned long baud);
 	int (*power_on)(struct geni_se *se);
 	int (*power_off)(struct geni_se *se);
 };
@@ -1461,7 +1460,10 @@ static int geni_serial_set_rate(struct geni_se *se, unsigned long baud)
 
 	uport->uartclk = clk_rate;
 	port->clk_rate = clk_rate;
-	dev_pm_opp_set_rate(uport->dev, clk_rate);
+	ret = geni_se_set_rate(&port->se, clk_rate);
+	if (ret)
+		return ret;
+
 	ser_clk_cfg = SER_CLK_EN;
 	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
 
@@ -1499,7 +1501,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
 
-	ret = port->dev_data->set_rate(&port->se, baud);
+	ret = geni_serial_set_rate(&port->se, baud);
 	if (ret)
 		return;
 
@@ -2051,15 +2053,19 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
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
@@ -2068,8 +2074,8 @@ static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 			return ret;
 	}
 
-	if (port->se.has_opp && port->clk_rate)
-		return dev_pm_opp_set_rate(uport->dev, port->clk_rate);
+	if (port->clk_rate)
+		return geni_se_set_rate(&port->se, port->clk_rate);
 
 	return 0;
 }
@@ -2130,7 +2136,6 @@ static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_serial_set_rate,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -2139,7 +2144,6 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_level,
 };
 #endif
 
@@ -2147,7 +2151,6 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_serial_set_rate,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -2156,7 +2159,6 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_level,
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {

-- 
2.34.1


