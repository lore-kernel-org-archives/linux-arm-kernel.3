Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E63C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTTisIRrm1ikhDDsD0zkfVo0e3j+V+q/x3H6zj2yL0s=; b=VJHWkcRjrGRyIer2LkfLYwgQbg
	+bR/tjBxZCXTSLWhWFPPOtexR7gQvvlx6cLSNm4Y59+gS5ndfD7cbM7s2I2wsxQfAQW25HkNOGews
	zUAhZsbA6+Pfuegm4BQr2vvTlJbTtTwiMNhFuLwX0sP+lb2rgy+gQ3kg8RadI30Eg2z2y/jtKyvwf
	vhFjaneeJhImiEXXAKTNBVZu0NxKVVKSCPwWfhTyk0FNvkhxXyVbBRSFJ1p8yIEZnDGLn1zOK0aFX
	mrNy81KT33NHbq5UDWP9HgtbIN412j+5n0VisBwU1Hd8xFzEBowRhL+Spfvj0QUFVooAEfbArvHvz
	aCAkLa7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiDS-000000019Yt-3zXk;
	Thu, 09 Jul 2026 06:26:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiDR-000000019XF-0AgJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 06:26:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669602pu794125
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 06:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jTTisIRrm1ikhDDsD0zkfVo0e3j+V+q/x3H6zj2yL0s=; b=NqHIsSbpA5lvbv4Z
	47M3CAoj6uO6UEbJD5y0BQysq5L1Jr1rsf0AiPX313hzBYpS3K8LChKHvBfabvnc
	V9BSGWOrBDr2DZBQr9+B7/Pw+mjlVbaPKaY3ZTof7YB16OMWPYtTwsTmlCkVChBj
	P7lyNOhAzzk7GFFiC6wgEIsS3Bff7xMSxJlZXYrudLuIw+4puPBegSMEka9XgxXF
	la3aa+G5nxIGIfXjpCvN1m0vNN556HsMZgp0k9TETl2Ay1AZuCJPvhGpVEdKiOGD
	ya0cvjixpb/Q+TNZHJ+UTotRX0UDf/hKztHRgyPbpEln34SNELVk77g3jQkNYbXj
	rSHpTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1yds03t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:26:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c804e38c65so35569505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 23:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578392; x=1784183192; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTTisIRrm1ikhDDsD0zkfVo0e3j+V+q/x3H6zj2yL0s=;
        b=jqMVzerJiObyCE7z+yWTCX9SvbtfZ6kOlaBmN/VXrJ5oo1oipEQVfSeVnjLWS6K9IM
         gsc/For1W6x36/oP949FMO4GWSWWmesId8KIdfS0/L1fTntH3EciLNye5Ipm3/AAL4Nu
         G5JUIDS2yk21bcG9fR7wqbk5Z7CrWxIOSMxnheJDUayT6rt3UyGd8sBMQHeSInBL0bTf
         zN4XmV5uhlY/J3Jsynig3HnQjr1L+YuyroUul/fixuGt2Fvk5csRUK5DdgehtIq8dcn2
         SUEWUpcy5krPgD63cpfcArxJtslVTPgJVPirr/fUB1l0FxsWQhNzJADbzfyKRzQRcwNh
         Apow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578392; x=1784183192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTTisIRrm1ikhDDsD0zkfVo0e3j+V+q/x3H6zj2yL0s=;
        b=YrS2jWeBYPPNM2JCCJMPtidPgH4ZvJnsKdAEmIiHdjvI6DqEcHlQKWL7ibjSjInz+g
         KdW/busiYi9xdcd1iJkFXzOeZ8EEsC4dLVyzwMFocTcJaKTPU+MzVrml0v6Yo+3v64eO
         ivK7elpmfEattxLeVTctQsrkaZpWbCesbbpOvmOzcFs5xBDqxKEzHIKu/awHmCNArh4b
         jveWH6bZeW7FBsv7HQkvKoBIHlmSIdg63mFK6IebX4RQ0e8VUZYNskd2pZUR/5cBHAfX
         lkOIN7cQYUJ5IPp4vjMERP6GLjcCvdegp7FqrsHO5exvfK3OnNIMGC7AS4p/LN2En7bT
         wyZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSv6WJOZJ7UVUahct/HmR+zMpF4wPUDb9V0mRu7hYZf8Acmfz0UhH8+sfErZ2Ww7XTExghqS5jz1B9k7d2ekA1@lists.infradead.org
X-Gm-Message-State: AOJu0YyJkJNnSqFznbW+wZCajb9ntsaZrixwypOB4QUEO4LzmNBrdEel
	F/i3NsgyQHJFfQJ7frRicSaopcHl+F/2YaTiAs7h21aACLF2zphg7c8p9XfFEkTYp3CK8c/h1j+
	dnn4XMdm59TQSTYWHkkBlPLROz8a1zDWkAOafCSgRrKQ1e/E6Pw34MEQV8Xt3hPea5O3SAxjyKl
	XJEQ==
X-Gm-Gg: AfdE7cnxneCoGBmDKBA0TmOwSUMZP6C4JsGVBMx8ZrSbagi1KD7p6uo8Bg2sgzT1WRh
	RZTYzIWSpZ+hCODVK0Q2lJlvz6wRJxHQBQqvHenoMPIuHtmUlzu+0TOY1SypwR5U7T67lJMdzz2
	LysZtn+Nz1X6DINm2oeiI/KpgI88lQE0Sdeq/xGANPCx/cj16Gh+9qcSon9cUFMwLHAzmSB8Nml
	yef8+Ei2cZaZ7TC9vaNHp67Jlrs6yJTTvu/Q5fJIcYJK2ATTwTKPrbbde6w9e/5cx5q93rHDCfA
	xChmYbDtmTekHF0srjOFl6oNr/WteSfy4EjqT10VnKzKJfuCx0AOrIN35THobEOIgr/Kolzgo5l
	WbIUNAPoFc0rDdzrget/jB9D6yzzAqFkieOzI4phZWY5x
X-Received: by 2002:a17:903:1b23:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2ccea36a539mr62888735ad.7.1783578391538;
        Wed, 08 Jul 2026 23:26:31 -0700 (PDT)
X-Received: by 2002:a17:903:1b23:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2ccea36a539mr62888325ad.7.1783578391002;
        Wed, 08 Jul 2026 23:26:31 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:26:30 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:17 +0530
Subject: [PATCH 5/6] tty: serial: propagate uart_configure_port failure to
 uart_add_one_port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-5-e85c6ffa8ec4@oss.qualcomm.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=3013;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=RCVhJVzC+wYdvFevPUgqoSKxgJUMAgct7Wn34WkXRWM=;
 b=03mWtjLIQU7aWmNkLwR+vaK5fDe/SCxXzqhpbBs8b/Xb17vYTfEsjAwodzox5hzEhqv5I585X
 VlgTWl/svaRAQ3BHkI4jtOEcL+pvacYHbhDmbmUE3ytsKKBRXOWcuW/
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXylFjaBhRqcgX
 stSVeBYRS/RkektmH+JxZeX7Pi+X9LL3jpFdhvbr0izEHyi52EOboZULe5wG+WYQ27yIAuZaqJ3
 kQFvoDibLTXlRBJ4VIPXpPtqtTkoktw=
X-Proofpoint-ORIG-GUID: G-Cw8E6EOZNueT7icht_3rjhG81gy7nG
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f3f18 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ix9lyGl5LlKgHWL4iMAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: G-Cw8E6EOZNueT7icht_3rjhG81gy7nG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXx7VMBLMbN7xX
 C8/wb5XgEzXfUpXoFT6L8O9cMdXoIVJqXRQpjREOu0MoY9G5QTOb/XKiH5m1k9XkGoQyrGl7bXF
 JRObldAsa0fRiUoz/iEdrYShujEFQLPZNcHXATEBo8OYqo91PexlR3INBNdjthCILqp4jgP+5c6
 mHxHvRdi1jEwjJ9DfOHakWJ88V7jcKjXSx4vmfhsWt9Bg0dVGvlj0GlACB8fQdD5k3ImBEyUpjB
 IyPl7pANmWCuFPPIdurWU2MGKUQnLuIX2zc/6zQP63mxFjgQ7fJlE+R9AXHnbqr1ww7hnFW/QTN
 BNAy/WIMmgDqq31zcw1hMiVxO8bm/1a0OGpemxIcXkFT59k+5sXrJ3tRBXZv/KsvHx4QlaWlR7j
 36nzbEB0hjBJzlozU6AICeEfbEQxyAkuinT8CJ9k3emVCIkNGnXXcC7kJvOnpHoPNX6ZiUH16rf
 OameWzyAz/L07LI//yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_232633_096505_AB002412 
X-CRM114-Status: GOOD (  22.25  )
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

uart_configure_port() was declared void, so the uart_change_pm(ON)
failure introduced in the previous patch used a bare return that silently
dropped the error and allowed port registration to proceed regardless.

Update serial_core_add_one_port() to check the return value and return
immediately on failure. This propagates up through uart_add_one_port()
to the driver's probe function, allowing the driver to handle or report
the failure rather than silently registering a port that could not be
initialised.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/serial_core.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index e624a67a9395..6cb9e870ba86 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -2526,7 +2526,7 @@ uart_report_port(struct uart_driver *drv, struct uart_port *port)
 			port->uartclk / 8, port->uartclk / 4);
 }
 
-static void
+static int
 uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 		    struct uart_port *port)
 {
@@ -2536,7 +2536,7 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 	 * If there isn't a port here, don't do anything further.
 	 */
 	if (!port->iobase && !port->mapbase && !port->membase)
-		return;
+		return 0;
 
 	/*
 	 * Now do the auto configuration stuff.  Note that config_port
@@ -2559,6 +2559,8 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 	}
 
 	if (port->type != PORT_UNKNOWN) {
+		int ret;
+
 		uart_report_port(drv, port);
 
 		/* Synchronize with possible boot console. */
@@ -2566,11 +2568,12 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 			console_lock();
 
 		/* Power up port for set_mctrl() */
-		if (uart_change_pm(state, UART_PM_STATE_ON)) {
+		ret = uart_change_pm(state, UART_PM_STATE_ON);
+		if (ret) {
 			dev_err(port->dev, "failed to power up port\n");
 			if (uart_console(port))
 				console_unlock();
-			return;
+			return ret;
 		}
 
 		/*
@@ -2613,6 +2616,8 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 				dev_err(port->dev, "failed to power down port\n");
 		}
 	}
+
+	return 0;
 }
 
 #ifdef CONFIG_CONSOLE_POLL
@@ -3094,6 +3099,7 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	struct tty_port *port;
 	struct device *tty_dev;
 	int num_groups;
+	int ret;
 
 	if (uport->line >= drv->nr)
 		return -EINVAL;
@@ -3135,7 +3141,10 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	 * immediately after.
 	 */
 	tty_port_link_device(port, drv->tty_driver, uport->line);
-	uart_configure_port(drv, state, uport);
+
+	ret = uart_configure_port(drv, state, uport);
+	if (ret)
+		return ret;
 
 	port->console = uart_console(uport);
 

-- 
2.34.1


