Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2EAC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 19:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHFVspy67XU4/PWnp/wa0Uq1rcAcE4MHBcwb/g66OxA=; b=SfaBSQVN7sD05VZK8Un5XQ0qnp
	hSnhdTJ2y7Oqdd/I1ekvqQJINoWV18A/A90ZsGSU+Smm9bd7eZWWph1isYeaV8+HpIk9d1S8QE/ut
	HwGKSJRNW+u2uxNgTkawCpjyu6gBsAVf/fDyMb+YqY+bFy5QX/HFN+pwMo2IIx+9cUaoOy8+im/19
	zHlYOeE4QrqN4wIaMGHDSgoxthhIxV4z0clplisuQ+PcVkY3r3mWx6f68ih0DjTAr7rUxK1lUL8GM
	Loa88njH+YT3UVp+hxowjDQu3LJuDT5Edme6qqfZM7l99kHNveyPo1jwTDQgv6yBrwk8JMHmlBt/I
	29BLQgiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLHX-00000002jWO-1P73;
	Tue, 04 Aug 2026 19:58:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLHU-00000002jUl-0Qwv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 19:58:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JmO9U435733
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 19:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHFVspy67XU4/PWnp/wa0Uq1rcAcE4MHBcwb/g66OxA=; b=aSmgC9Au1DKE1XOJ
	FexsggIJ+mMPiECRoYd1RBnaupA4mPpsyHwk8ZtGCppG6or3bvP1KtLQWwkjw3hn
	PDbdJJ5RtaePuj+nTzDQJlEJ8My5FMuYdHv8vzA6w8v6moFi1d1iSpxW2rRkz4ij
	ZP5c3czCDhLjx6lqqb77o4p//mMMbdfojQapBOjAZoAcb2jO9mnllB0iYb5D5qSo
	K/gCIit5puzJjFZYqSuzSmYh+F/3NbT3hc4BiQ3GRF9kbiEpqezlv4Nu/lrZTUXO
	1Hzjy5UFY+nZmO8ZQufxOjkGeKxuZ+9sZN6RDzGOBcV0XYjaavQlPUlxBHAo/Hkg
	ZVCx8w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum568uh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 19:58:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so144890a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 12:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873510; x=1786478310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHFVspy67XU4/PWnp/wa0Uq1rcAcE4MHBcwb/g66OxA=;
        b=ZQ4l9y+xtcRa5vipqfarwiin+xN6YuqE6uPLRpGZvyzLQsyzUM+PWHbJjaF/TbPDFE
         1ngUAKldf413CZgGnQGc9Fb8peHLvLf7kndhK+ZPlST3k4pYs5ed0u+aF+uDwdcLa/6k
         P0UGbxoSpbHnngAOId/DX8y2nuP43GmPPcF6+idD7nQIfyXEEKjbcFFqbMj7qAu+wDyp
         iaJ3XoiNAM29EGYg9sK4T4kEbMXEHt95K9Fa93jWzqrr1rHt80KRilmwRU25uShtJRsz
         +/wOgFguTW0fHx7b77OyUTRMamcBvKJ5E8H7FgzY9KNaBjb34BGSO+Ef6dkNHw2u9BVm
         zpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873510; x=1786478310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHFVspy67XU4/PWnp/wa0Uq1rcAcE4MHBcwb/g66OxA=;
        b=avH0TMP0GsFNbL6iqCyQQ+BocLDtBa5EVlGMjTE8PQP3A0J7hSNnWvfVaP7c+wuwcM
         tblpK+4RFPk0kFD8jTRIbZOxVeKfWWVeulTUdxcWmT3PEm14YcOkkiU+ddRvV+ZWJ6A3
         Vox4wSAlE33RpaMUpIQe9mnWrtnKqFLW3EGh2PTPAaFxbg4iV2vMw7TloqlJVtpFYRS0
         6S76R5jIthoBy1ueMASTpA9aNBnxxQ/WzbspD/6YHW2q2Tbs0EqtZeURXHRUJYNsKvT8
         hlR9KkXkc3TY4p97FYU/DMXaqRidqjwNu7mj7bv0YHz/0oSJJcQHYmT/B7aas+uDPPWl
         wVDA==
X-Forwarded-Encrypted: i=1; AHgh+Rocvv2vDR1JU0H98y/qtvcPu+trNqDhRvmijc5q9vELAJ7pJYQsQdq9L16WhSlR7+8n3aMLLG7Aw+zVzmIIyKlc@lists.infradead.org
X-Gm-Message-State: AOJu0YzlOUkA4WuQHObaDHxgSZbZaulaMq1BkFDCPvB/ZRkWbvfpWEE7
	0FzEd4Bh88mcGWKYLn+WvkW8TWmR2I5ce9g+kOFq2x24pIJ1u8jPcNLBlUkC7jEY0Gz8dMJBtsG
	IlS0L+R5a2KHZayoxQG4QfcR1LqwrENCb0wHZA3QxPj+41vJ0ibWP5AnFOmG7k3i5+l0JvLKb1Z
	kXHQ==
X-Gm-Gg: AR+sD12IwBkyLyhPO8cY/fFW+fMAGex7+EZCQt1XQOiIA2+myZj0wcJAy6F8XjuXJLp
	1f3xU36dDMyXIlmX7vuz5FUsSEsZvJ0QywTFt6c6tNbqI8V4aKpikxrsKkDOtFZ49rcr6/SmOLu
	LJj60af3BnnZoHq8WFXdIUV2j+Fj55hXt071St7algm9a5Ju55PcymDNNh8XmRNuekBp4JIHb+h
	JdSf4HK1Hus9H34VMoSM0ux1sRWGQJzBcuDnnXgBILL7YqrQF2ufmgc5VaExe3sNp9FyJQcX7we
	i595TRsscbfXFP1TKsr8gtD5S64PASTp07fW7cGa8RomfmtaEErBxLm0iXXTL9I7YlXg8KT+Fcx
	OcD35qBakLuzuuygjPBjzKzcZSFMsh5E1LQ==
X-Received: by 2002:a05:6a20:7350:b0:3c3:f371:1ea9 with SMTP id adf61e73a8af0-3cb85df12fbmr1244062637.10.1785873509889;
        Tue, 04 Aug 2026 12:58:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:7350:b0:3c3:f371:1ea9 with SMTP id adf61e73a8af0-3cb85df12fbmr1244031637.10.1785873509401;
        Tue, 04 Aug 2026 12:58:29 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm12316636eec.25.2026.08.04.12.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:58:28 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 01:27:42 +0530
Subject: [PATCH 4/7] serial: qcom-geni: Use geni_se_set_rate() for source
 clock configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873474; l=4780;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=FEu5Wj/gdb1pkJZnW+0/Hj1a/viGsgLA7fb1NYBorE4=;
 b=1xxf2D4WP4Iyk432GQjmqyJtyjVtVZJ8WaRIgbdkv/2bnBKC2G3p4HN/Ai+M7RWQuCiMorxQs
 TkYdNIors2bAmHG8UlPjBB2/WQz9ddMwufxkzwnyeHuOY2ZHvbWS/9B
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX81inyKYTuWkF
 9jtA4LpLTLPndLvmFi3knLMzBAXJgP8NJowlETB1Pt99LlujYEYvAEVkRrVcI+H7894mhKE3Ec1
 laR2nKRXmd8XEIdXtHgTofmwlznpcHPdj2vSqvTXvNp4TIBSqAxsbHed18I8mRouuk6aP6icQIP
 Vp/s6Y0RD2Rez9b46/VKw/Y4+cUGVXS3x//MERlj5FEATqyjEurZxBUbZyw6P3EE522sQnpcRVt
 uzsxCBEBuahVenHfoLRURRolWhBgWATs7s/b0uydoO+GpexoVs/qGtsXZ9kqG8egJGYVekvQAug
 WYuXBWWEY1eZBaibbVatyBfAfdyPkMP1o5Pfdu33CncW6su5U1j4F4V60o9jSrZVNeImNOybzqk
 KREWN36LA2NNRFXPG6t5karD0xHV6SfoElBUZ9UAokDk0b2c/jMMkdQy5X24TlTqsF1oUoOxMoe
 xCMJRfO28CoffzSEmnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfX9ACf0nJbyDgB
 qcIuY8BL9PerrRJNsO4xYKtG6C/RTLJVz9Kczr7vciyao6PMX1MSUwOczDftVJ501CVbPhYKllk
 NNfnOjQRp75zPVl3v9X736q54JOQYuM=
X-Proofpoint-GUID: u-JP6jjFIrhaqdNjIT9sr_wjNG5FF26g
X-Proofpoint-ORIG-GUID: u-JP6jjFIrhaqdNjIT9sr_wjNG5FF26g
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a724466 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KQElQ6Bo8OdNfGCL3dkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_125832_281957_9AD25E14 
X-CRM114-Status: GOOD (  20.44  )
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

The driver calls dev_pm_opp_set_rate() directly on uport->dev to apply
the computed source clock frequency, and dispatches baud rate handling
through a per-variant dev_data->set_rate() callback that either
recalculates the clock divider (Linux clock managed path) or selects
a performance level via geni_se_set_perf_level() (SA8255P firmware
managed path).

Now that geni_se_domain_attach() populates se->clk_perf_tbl from the
perf domain's OPP table, geni_se_clk_freq_match() can resolve a source
clock frequency and divider on the SA8255P path the same way it
already does for the Linux clock managed path. This removes the need
for a separate perf-level based set_rate implementation, so
geni_serial_set_rate() can be called unconditionally and
dev_data->set_rate can be dropped.

Switch to calling geni_serial_set_rate() directly from
qcom_geni_serial_set_termios(), and use geni_se_set_rate() in place of
dev_pm_opp_set_rate() so the frequency is applied to the correct
device (the perf domain device on the firmware managed path, or
uport->dev otherwise) without the driver needing to know which
resources_init variant is in use. Remove the now-unused set_rate field
from struct qcom_geni_device_data and its per-variant initializers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..cd1940eae084 100644
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
 
@@ -2040,6 +2042,8 @@ static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 
+	geni_se_set_rate(&port->se, 0);
+
 	return port->dev_data->power_off ?
 	       port->dev_data->power_off(&port->se) : 0;
 }
@@ -2047,7 +2051,6 @@ static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
 static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 {
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
-	struct uart_port *uport = &port->uport;
 	int ret;
 
 	if (port->dev_data->power_on) {
@@ -2056,8 +2059,8 @@ static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 			return ret;
 	}
 
-	if (port->se.has_opp && port->clk_rate)
-		return dev_pm_opp_set_rate(uport->dev, port->clk_rate);
+	if (port->clk_rate)
+		return geni_se_set_rate(&port->se, port->clk_rate);
 
 	return 0;
 }
@@ -2116,7 +2119,6 @@ static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_serial_set_rate,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -2125,7 +2127,6 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_level,
 };
 #endif
 
@@ -2133,7 +2134,6 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_resources_init,
-	.set_rate = geni_serial_set_rate,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -2142,7 +2142,6 @@ static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_level,
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {

-- 
2.34.1


