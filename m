Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E9ECC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m1Sj8rSdmb/pbigDyObZpWX/JDYcZPR3uB5iI75Xx8c=; b=FKXp1XVtU7dUE1CZna1V2wmYIh
	eyke2zFA1Yg+Kplp8EGdALVprdQ7/yF2IB9B7C/hQ/kDjYpsUOiqrh8kQ0UIUmnLoF5eg64iTGxI7
	br7iz8tiErFmQghvs3ojNelMn3cx81sTu9wdOTUr2KFlPd7ds7px2Ok6xNb1awhN/DbRhPxLnJxwB
	I0dh74mxRmjlNO+qqfuus8i59jNAGevIJJpaEgqIqfuk1j5DB0WdXjNycMpnEYVErUpg5QfD55ft2
	QQHETxSZdGP8HlyGsBlLn9EvJUOdeKa7Y+LV8ECL2OQFgDDNAYiixUx4vA/W0ijyuO6QMu61NkPjm
	GcQ9CFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMja-00000000RAA-3lA9;
	Thu, 15 Oct 2026 14:47:07 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMjW-00000000R8K-1qjE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:47:04 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6d68de53053so2315766eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 07:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075620; x=1792680420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1Sj8rSdmb/pbigDyObZpWX/JDYcZPR3uB5iI75Xx8c=;
        b=rbHFOz2WAJi47uiIRsR5lceLTw3dFxLZc1IVIqet7ZmGyRt2J/l84D/SRS6v8LARZ3
         U6XSsY2rRMB8toxuFrm/pR0juqIXJI8HjfYabraXQmAZtj7eYjG8+nrfqxsLo9nuNUs4
         S6xgzJCHMqvvE/UoesAyLkZGg89fUmFTKMCpeNHOZg+uX94wkZUSTSQaJCXTjClTvF8M
         f6COAneApWmrVHOalyKgsCcucQmjusZAhBj6+ktqMvHIg3Ve7qk0K3pu2zhi0j/d9lOw
         0yiCRsztC2O0RFkR+GT2CbXTHeBa0S3tt7EquxC+HR6Ghw4z9ECuOxlL+WwN2qw28ggN
         pgfw==
X-Forwarded-Encrypted: i=1; AKwUvBzlEvin/soNWjg4W3Pwj5ObD5ackU3F4VqBu6ehklrgk1aHQ6rffi4OyQa0pXjPlxAuzed1BdOSu/7NZRjRw3Qu@lists.infradead.org
X-Gm-Message-State: AFq9FYIRhiDZZIzXuTUonT/FiBoN7OsxxFi5Th+4BZw7+6F+e66TI2no
	QFZfuLu7ylWk5z8oMGFNi2A3OML8EI4Av4L7Wf/Uj+qeBWj4btykpsTg
X-Gm-Gg: AYBFou13c5ZCK24K2kKdNVQvgidjjrYCXdWeaVIHIR90uIPrVAqPwmxdFkAoRYoVhOA
	Q3+atqWseG9b/Y0rRhu3aCgR6zi3uqTmnFT+UedGN2PPAboWwLwKMbdj6eLureSB9WHUwRhlQAY
	Q7qlLshbCgS7rWF834s1IMpLkmPhcIdjmVa+9e7cZf+WgzfJ6JX+RLOPiY/LxPQJLKFM4Ui+RaR
	aDvvB5vIOREoX/uvZ5vm1NFXJKrgLGHXWDATRYsq34vCf7O7btUUn9XbwmfpIBEgorN7VmSyADq
	LqbbpzbWIByz7Sq5/TfisNR8j1e/dKNF19gXgW0vvKLsBPjmDbeye2cT8/s3ev/y2sWj5n8h2N/
	+wnqOHfwdjIOGCdit2qLrKvEcUYpHJiOLvojsL+0hgLDSq1MXs9TDIFRXEA3XtJqjhiN8+neYjj
	sIeKrpoq6CmCAGiYy6mQ291zsOPrQysc2E2NtakM5ZCvzEM3yoXggFJJ1VIVuEg5798B3bMikza
	NadjO1z+ng8prtRBBA7k1lOOX2it6p9x/ixXnrdvfS6/oUEXu8tPdU3H4jGPeULH3jyOlNWfyvM
	nEXX0DwpAahlXpn9eQqWegBE6fuZWwEGNGMCNyO0GPN5PbDMlkRAUaNpfVtEGhb2knqNEg885Lq
	6Y8tMDTOFNVE=
X-Received: by 2002:a05:6820:162b:b0:6f7:6416:a34 with SMTP id 006d021491bc7-6f764161ae2mr8416735eaf.41.1792075620353;
        Thu, 15 Oct 2026 07:47:00 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfc982a4sm4664115fac.14.2026.10.15.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:46:59 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	"Rodrigo M. Duarte" <rodrigo.duarte@ossystems.com.br>
Subject: [PATCH] serial: imx: keep the CPU out of deep idle while an RS485 port is open
Date: Thu, 15 Oct 2026 11:46:27 -0300
Message-ID: <20261015144627.2461915-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_074702_493002_5952E832 
X-CRM114-Status: GOOD (  16.81  )
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

In RS485 mode the driver releases the transmitter (RTS/DE) from the TX
complete interrupt. On i.MX6UL/ULL the imx6sx cpuidle driver offers an
"ARM power off" state with a declared exit latency of 300us, measured at
up to 2ms. When the CPU enters it while the last character is shifted
out, DE is released that much later. Modbus RTU slaves may answer after
3.5 character times (1.75ms at >=19200 baud), so the head of their reply
collides with our still-driven transmitter and is lost.

Add a CPU latency QoS request of 100us while an RS485 port is open. It
excludes the power-off state but keeps WFI and WAIT (50us) available, so
cpuidle can stay enabled and the constraint only applies while the port
is in use.

The request is added on startup and removed on shutdown, and its value
follows the RS485 state in imx_uart_rs485_config(), so RS485 enabled
through TIOCSRS485 after the port is opened, as libmodbus does, is
covered as well.

Tested-by: Rodrigo M. Duarte <rodrigo.duarte@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 drivers/tty/serial/imx.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 986fefb45c632..be05ed94bf0c4 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -24,6 +24,7 @@
 #include <linux/ktime.h>
 #include <linux/mutex.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_qos.h>
 #include <linux/rational.h>
 #include <linux/slab.h>
 #include <linux/of.h>
@@ -237,6 +238,7 @@ struct imx_port {
 	struct hrtimer		trigger_start_tx;
 	struct hrtimer		trigger_stop_tx;
 	unsigned int		rxtl;
+	struct pm_qos_request	rs485_pm_qos;
 };
 
 struct imx_port_ucrs {
@@ -339,6 +341,22 @@ static void start_hrtimer_ms(struct hrtimer *hrt, unsigned long msec)
        hrtimer_start(hrt, ms_to_ktime(msec), HRTIMER_MODE_REL);
 }
 
+/*
+ * In RS485 mode the transmitter is only released from the TX complete
+ * interrupt. If the CPU sits in a deep idle state at that point, the wakeup
+ * delays the release long enough to collide with fast responders on the
+ * bus. The i.MX6UL/SX "ARM power off" state has a 300us exit latency and was
+ * measured at up to 2ms, so keep the CPU out of states slower than this while
+ * an RS485 port is open.
+ */
+#define IMX_UART_RS485_CPU_LATENCY_US	100
+
+static s32 imx_uart_rs485_cpu_latency(u32 rs485_flags)
+{
+	return rs485_flags & SER_RS485_ENABLED ?
+		IMX_UART_RS485_CPU_LATENCY_US : PM_QOS_DEFAULT_VALUE;
+}
+
 /* called with port.lock taken and irqs off */
 static void imx_uart_soft_reset(struct imx_port *sport)
 {
@@ -1585,6 +1603,9 @@ static int imx_uart_startup(struct uart_port *port)
 
 	uart_port_unlock_irqrestore(&sport->port, flags);
 
+	cpu_latency_qos_add_request(&sport->rs485_pm_qos,
+				    imx_uart_rs485_cpu_latency(port->rs485.flags));
+
 	return 0;
 }
 
@@ -1710,6 +1731,8 @@ static void imx_uart_shutdown(struct uart_port *port)
 
 	clk_disable_unprepare(sport->clk_per);
 	clk_disable_unprepare(sport->clk_ipg);
+
+	cpu_latency_qos_remove_request(&sport->rs485_pm_qos);
 }
 
 /* called with port.lock taken and irqs off */
@@ -2053,6 +2076,11 @@ static int imx_uart_rs485_config(struct uart_port *port, struct ktermios *termio
 		imx_uart_start_rx(port);
 	}
 
+	/* The request only exists while the port is open */
+	if (cpu_latency_qos_request_active(&sport->rs485_pm_qos))
+		cpu_latency_qos_update_request(&sport->rs485_pm_qos,
+					       imx_uart_rs485_cpu_latency(rs485conf->flags));
+
 	return 0;
 }
 
-- 
2.55.0


