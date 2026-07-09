Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C50DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr/c6JHynGsswndL259fRuQJwMr/ocAoxfWbLWGTSg4=; b=v5HuF8KZD4BZ+QzVOtI/9qJy18
	w1RG1BiZ56hm0j8RrRZOqWbpRaCB1YcOnLHEBDd2L2WTNXr3YgRMfan0nPX2n7PUUMPIzZL60XrQV
	8yteBS2FI3dL33hcN4HMpnHKSUXZXq6PbBaAcop/VIMQ+TE7hLYNoIzK7vaXlUlxDb6kT8eNqyOX0
	J9oBypBVnk3YYqFSrMDSwClG/BBedgxKP2OwSHLza0uoLQprfvo3Q24AAxDDZ7xyaUyZQ5l5u2E98
	dWjHyiAWMW+1CJurgBTElxAcaI8XGtC+zEx2EY6Rwo7lH93t2GSEObZk4GW3UJOBxin/Fly2fUzpP
	Ks3JJMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiCj-0000000196w-3scO;
	Thu, 09 Jul 2026 06:25:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiCg-0000000195g-2e6l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 06:25:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960KmZ916660
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 06:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mr/c6JHynGsswndL259fRuQJwMr/ocAoxfWbLWGTSg4=; b=eCga41p1wSaTnZyE
	z8hbPW2QC3jtrskzsNyEIVI9/1yQiwqXo7Z/VJzc9LaCMQXaBHcihK+f8r+N2yhR
	sT9NAbYz2HQh1lgI/YY8djiBfU1/6vRazEhnOA5xrYvKE2G28TG4Mt8AujabjRY+
	1LiH6LUOH08PBaPxxLNTJ0Z5qmwXyq4RSQM51T5YwGg9yphTSLIs0RY5OPHCXprH
	o21S78RV6rhfCVLr1zyPr5R/xkbuoqp0T5TkFPK1TzlwgCMcWfcaJZQvpd1Tq1n7
	robAYxr3paWdWPWHZxQhe0TZrZnXyJYYaKviOP1xAV9AQBqoz0Nby02DjPcjR/O6
	3IbAHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv57kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:25:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9ed5caa3bso7270665ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 23:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578345; x=1784183145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mr/c6JHynGsswndL259fRuQJwMr/ocAoxfWbLWGTSg4=;
        b=cgjdSix/JMW9LOJKYSPu4IqjrbbuaYqn9Lgffynz52bdD1Y6cqhmh0dkZiWZI7iPUU
         JVeSDOU7ZeLAaV5cf9hb7ZODSiV8VKlR9f0Be4NjUqSKb09mBaijQkNmwjL/A7pGIn90
         TCygwGzqDeFl2l1CIAdVVh3kPKlmVkB+VObxvNxHV4FAKAuFx4lCbld1XIUQEngOgEh+
         5ja0qKUtIIbjL+ZRlB1A4oHkSj3Rk9KUFnTYDu2f12DEO1gw/yS6b54x3yocUpVi5p+9
         EQWCWaQu6uA//pzCKl/s/a/3fyCutYGCxz5rxJcm6KU2PTYptlclDZqdYYcCpC0nSDbW
         OLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578345; x=1784183145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mr/c6JHynGsswndL259fRuQJwMr/ocAoxfWbLWGTSg4=;
        b=k3FXgS+MaA8TqupoIkIckunFyy0ZMqPMJfehWTFyLhj8C3HZfzGMWo8/Syx5Nm3WmJ
         5Q2Bas5nCIxIwHGbtt6xIQF5fRS3/f+dtFCpva2H0+UlaibkeC13ooyR0xdh0RlMrNgT
         /KlWw/7uvNQoZp85MrhOeceRoLzKHVgubUSvwoSWvlbx1LL1iGNA3kXdkPBmbN1ZfYof
         yokbaVeqycCQKvHfqqpzzeBFE8S+phuLUHFy9LcES/ocuTRFmV9AsWW10KyGDukLNl2N
         I9u51AWvibitHYwk0mGbf1fArLkOjNGErClgtq3uNhaUZ87zrscWV8YdlGfAU8Yr5TVH
         I5dw==
X-Forwarded-Encrypted: i=1; AHgh+RoYeBahUp4zD8rbuaQJsvOv9bExNNl5Qtzwh5ezWNdzq0U0n7ORYa2Cqjd1INsSOFZf8b96QIlKoDGyCnIEToCt@lists.infradead.org
X-Gm-Message-State: AOJu0YwTmOoziaoYa+cfWF30IQu4Lr9uBYFz3yEcamoWtDuUqqOP9ijW
	uTlDamsdxroPYmY+/gLjPGMpuOTGSCCVHwsoITFNUetXuKJq26Gd/f75YK2obMJ1i6LhoNseAPh
	hMwiN+OtWoPYfYR29anlh0j5hrgmYeVaUgmlIyMXJuAyt0fAAwRo9/kpVT8NPNDcco61ZzEgkqO
	/y4A==
X-Gm-Gg: AfdE7cnO7cEcHkAZxK9bTGzlDk3jN6zDL6QZrbX54VMvwmPgaPzQYj0NEnvb+Y//qbN
	7BUBM/4DcCFyFm9UdZzkdMCfXidfSNp9Yuf65FuGqvb+kl8OVoGypaZHKryl6ArTnPoDudjV9Ii
	KLQ5HSxuEDDEo5aSvOcipvSRxgf14ZaG9uvkRzM8fx/95zvSyJEVxQAi+GAqd743IelKPz9cgLE
	ncZqEla/xK8CjSGZlSm/NHPI/14PR+WH/aYIjrNgK3MZOCueF7YqlF17Nszn5/oYjMmSgdS9Pm8
	utjoJhFopGZ+hWc250C39w+OZVg+nnd/JKit1Hb2ETZEkMb1daYIqqv7NmtqqpE156Ls59BxTLW
	T4GZB6EjNa/YyqgwGwMM04F2PTVo8u2YxGv185pRS37Qi
X-Received: by 2002:a17:902:f652:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2cdd8a9701fmr13907645ad.13.1783578345131;
        Wed, 08 Jul 2026 23:25:45 -0700 (PDT)
X-Received: by 2002:a17:902:f652:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2cdd8a9701fmr13907415ad.13.1783578344460;
        Wed, 08 Jul 2026 23:25:44 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:25:44 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:13 +0530
Subject: [PATCH 1/6] tty: serial: change uart_ops.pm callback to return int
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-1-e85c6ffa8ec4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=10746;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=EVgeSBR2jCHn71Glh5lSeXqBNQ4Lp10YdxPes7kiwZ4=;
 b=04K+FA05dgAPsjdbtbwvkkTnr1RJndSAo0fpFo9UCHtlTA/CCZFQpKhBhQgjikHiSzJ3631Ch
 ghnsVnKCGOpALEgACK/qk6Q0sASwqVcDS7VZ4PYAGinvtCyryB9OB/r
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4f3ee9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=og5nFkg25Al2bjqVsRcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX2+yI6pr2bABa
 HqEeAwOVPlmXcOKcRkpx6BEa6KBchRIKM6vC5mzvEsuqNjqLb27UnaijQsb1+S5AookSPMsPp9d
 ZX1FmmBtPfUULFe8/dGXohdIVVEhTRg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX9WOKZof6WQee
 AJ5TrGY2kqkwT5hhwgevBuz1LYvh64nu7QIErueL+3U60IJz/21rolZYIdaWWqRsOVwX3IlLLMA
 XQFU5ofZp3DZPjS9NFC2T/Ggd5aEgHNQ7ZJAgSQnAaVueaoHOI4cQ54t5ohc3aDvZunizE80mjj
 VPwP5Uf9b99nQn1sqUXRHso6CqfkCu/8zv2JFOhYzlVI/xY0FoG9WNfdfzziYw+pXiFo/OUN58J
 aRtfwRa1tB1xwzezuV+5PFAcvY1pOyzR09lP6kev10fumpCRyNfRpWDUCXiSAc/ygEqC4gevjaZ
 SCpr3tNZvl0bKKtUX8ppDCyJacrvjakdxBP3MIaWKRnLKqC+bppc4M1thvOM1123gOkKnHejCWo
 Xu0YNqZmTvkK9ex0EcwH/ROBM+tORHnJv3dM3imNdAQogfCiQGg0eedI1lDY/Idsq/ynCU8W1MK
 67VCV0yo8fO0uz0gGLg==
X-Proofpoint-ORIG-GUID: UAvJNWzzYLXygcAWpSs2uYSE-zjXZzL4
X-Proofpoint-GUID: UAvJNWzzYLXygcAWpSs2uYSE-zjXZzL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_232546_690643_DD07C76D 
X-CRM114-Status: GOOD (  26.53  )
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

The uart_ops.pm callback is currently declared void, causing
uart_change_pm() to silently discard any error from a driver's power
management implementation. Worse, state->pm_state is unconditionally
updated even when the hardware transition failed, causing the serial core
to track a power state that does not reflect reality. Subsequent calls to
uart_change_pm() will then see the (stale) state as matching and skip the
callback entirely, leaving the hardware stuck in the wrong state with no
further recovery attempt.

Change the uart_ops.pm callback signature from void to int. Update
uart_change_pm() to propagate the driver's return value and only commit
state->pm_state on success, preserving consistency between software state
and hardware state across all transitions.

Update all call sites in serial_core.c:

  uart_port_startup(): propagate the error so that port open fails
  cleanly if the hardware cannot be powered on, rather than proceeding
  to call ops->startup() on an unpowered port.

  uart_suspend_port(): return the error directly so the PM framework
  is aware of the failed transition and can react accordingly.

  uart_resume_port(): propagate on both the console-resume and the
  suspended-port-restore paths so a failed power-on is not hidden
  from the PM core.

  uart_configure_port(): log and return early if power-on fails at
  probe time; log a warning if power-down fails after configuration,
  since the port is already registered at that point.

  uart_tty_port_shutdown(), uart_hangup(): log via dev_err() since
  these are void paths where propagation is not meaningful; teardown
  continues regardless.

  uart_line_info(): skip the modem-control status read if power-on
  fails to avoid accessing an unpowered port; log a warning if the
  original power state cannot be restored afterward.

  uart_poll_init(): propagate the power-on error; log a warning if
  the saved power state cannot be restored after a failed poll init.

Also update the uart_port.pm field (used by 8250 sub-drivers that
install a per-port pm function pointer directly) and its kernel-doc to
the new int-returning signature.

No functional change for any existing driver since all current .pm
implementations will be updated to return 0.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/serial_core.c | 89 ++++++++++++++++++++++++++++------------
 include/linux/serial_core.h      | 10 +++--
 2 files changed, 69 insertions(+), 30 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index a530ad372b43..e624a67a9395 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -52,8 +52,8 @@ static struct lock_class_key port_lock_key;
  */
 #define RS485_MAX_RTS_DELAY	100 /* msecs */
 
-static void uart_change_pm(struct uart_state *state,
-			   enum uart_pm_state pm_state);
+static int uart_change_pm(struct uart_state *state,
+			  enum uart_pm_state pm_state);
 
 static void uart_port_shutdown(struct tty_port *port);
 
@@ -312,7 +312,9 @@ static int uart_port_startup(struct tty_struct *tty, struct uart_state *state,
 	/*
 	 * Make sure the device is in D0 state.
 	 */
-	uart_change_pm(state, UART_PM_STATE_ON);
+	retval = uart_change_pm(state, UART_PM_STATE_ON);
+	if (retval)
+		return retval;
 
 	retval = uart_alloc_xmit_buf(&state->port);
 	if (retval)
@@ -1741,7 +1743,8 @@ static void uart_tty_port_shutdown(struct tty_port *port)
 
 	uart_free_xmit_buf(port);
 
-	uart_change_pm(state, UART_PM_STATE_OFF);
+	if (uart_change_pm(state, UART_PM_STATE_OFF))
+		dev_err(uport->dev, "failed to set power state off on shutdown\n");
 }
 
 static void uart_wait_until_sent(struct tty_struct *tty, int timeout)
@@ -1831,8 +1834,13 @@ static void uart_hangup(struct tty_struct *tty)
 			port->count = 0;
 		tty_port_set_active(port, false);
 		tty_port_tty_set(port, NULL);
-		if (uport && !uart_console(uport))
-			uart_change_pm(state, UART_PM_STATE_OFF);
+		if (uport && !uart_console(uport)) {
+			int ret = uart_change_pm(state, UART_PM_STATE_OFF);
+
+			if (ret)
+				dev_err(uport->dev,
+					"failed to set power state off on hangup\n");
+		}
 		wake_up_interruptible(&port->open_wait);
 		wake_up_interruptible(&port->delta_msr_wait);
 	}
@@ -1994,12 +2002,17 @@ static void uart_line_info(struct seq_file *m, struct uart_state *state)
 
 	if (capable(CAP_SYS_ADMIN)) {
 		pm_state = state->pm_state;
-		if (pm_state != UART_PM_STATE_ON)
-			uart_change_pm(state, UART_PM_STATE_ON);
+		if (pm_state != UART_PM_STATE_ON) {
+			if (uart_change_pm(state, UART_PM_STATE_ON))
+				goto line_info_end;
+		}
 		scoped_guard(uart_port_lock_irq, uport)
 			status = uport->ops->get_mctrl(uport);
-		if (pm_state != UART_PM_STATE_ON)
-			uart_change_pm(state, pm_state);
+		if (pm_state != UART_PM_STATE_ON) {
+			if (uart_change_pm(state, pm_state))
+				dev_err(uport->dev,
+					"failed to restore power state after line info\n");
+		}
 
 		seq_printf(m, " tx:%u rx:%u",
 				uport->icount.tx, uport->icount.rx);
@@ -2036,6 +2049,7 @@ static void uart_line_info(struct seq_file *m, struct uart_state *state)
 
 		seq_puts(m, stat_buf);
 	}
+line_info_end:
 	seq_putc(m, '\n');
 #undef STATBIT
 #undef INFOBIT
@@ -2265,17 +2279,24 @@ EXPORT_SYMBOL_GPL(uart_set_options);
  * @pm_state: new state
  *
  * Locking: port->mutex has to be held
+ *
+ * Returns 0 on success, negative error code on failure.
  */
-static void uart_change_pm(struct uart_state *state,
-			   enum uart_pm_state pm_state)
+static int uart_change_pm(struct uart_state *state,
+			  enum uart_pm_state pm_state)
 {
 	struct uart_port *port = uart_port_check(state);
 
 	if (state->pm_state != pm_state) {
-		if (port && port->ops->pm)
-			port->ops->pm(port, pm_state, state->pm_state);
+		if (port && port->ops->pm) {
+			int ret = port->ops->pm(port, pm_state, state->pm_state);
+
+			if (ret)
+				return ret;
+		}
 		state->pm_state = pm_state;
 	}
+	return 0;
 }
 
 struct uart_match {
@@ -2364,9 +2385,7 @@ int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
 	if (uart_console(uport))
 		console_suspend(uport->cons);
 
-	uart_change_pm(state, UART_PM_STATE_OFF);
-
-	return 0;
+	return uart_change_pm(state, UART_PM_STATE_OFF);
 }
 EXPORT_SYMBOL(uart_suspend_port);
 
@@ -2408,8 +2427,12 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 		if (port->tty && termios.c_cflag == 0)
 			termios = port->tty->termios;
 
-		if (console_suspend_enabled)
-			uart_change_pm(state, UART_PM_STATE_ON);
+		if (console_suspend_enabled) {
+			int ret = uart_change_pm(state, UART_PM_STATE_ON);
+
+			if (ret)
+				return ret;
+		}
 		uport->ops->set_termios(uport, &termios, NULL);
 		if (!console_suspend_enabled && uport->ops->start_rx) {
 			guard(uart_port_lock_irq)(uport);
@@ -2423,7 +2446,9 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 		const struct uart_ops *ops = uport->ops;
 		int ret;
 
-		uart_change_pm(state, UART_PM_STATE_ON);
+		ret = uart_change_pm(state, UART_PM_STATE_ON);
+		if (ret)
+			return ret;
 		scoped_guard(uart_port_lock_irq, uport)
 			if (!(uport->rs485.flags & SER_RS485_ENABLED))
 				ops->set_mctrl(uport, 0);
@@ -2541,7 +2566,12 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 			console_lock();
 
 		/* Power up port for set_mctrl() */
-		uart_change_pm(state, UART_PM_STATE_ON);
+		if (uart_change_pm(state, UART_PM_STATE_ON)) {
+			dev_err(port->dev, "failed to power up port\n");
+			if (uart_console(port))
+				console_unlock();
+			return;
+		}
 
 		/*
 		 * Ensure that the modem control lines are de-activated.
@@ -2578,8 +2608,10 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 		 * Power down all ports by default, except the
 		 * console if we have one.
 		 */
-		if (!uart_console(port))
-			uart_change_pm(state, UART_PM_STATE_OFF);
+		if (!uart_console(port)) {
+			if (uart_change_pm(state, UART_PM_STATE_OFF))
+				dev_err(port->dev, "failed to power down port\n");
+		}
 	}
 }
 
@@ -2608,7 +2640,9 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 		return -1;
 
 	pm_state = state->pm_state;
-	uart_change_pm(state, UART_PM_STATE_ON);
+	ret = uart_change_pm(state, UART_PM_STATE_ON);
+	if (ret)
+		return ret;
 
 	if (port->ops->poll_init) {
 		/*
@@ -2626,8 +2660,11 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 		console_list_unlock();
 	}
 
-	if (ret)
-		uart_change_pm(state, pm_state);
+	if (ret) {
+		if (uart_change_pm(state, pm_state))
+			dev_err(port->dev,
+				"failed to restore power state after poll init failure\n");
+	}
 
 	return ret;
 }
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index bdc214386e4a..c82839028220 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -269,8 +269,8 @@ struct gpio_desc;
  *
  *	Locking: caller holds tty_port->mutex
  *
- * @pm: ``void ()(struct uart_port *port, unsigned int state,
- *		 unsigned int oldstate)``
+ * @pm: ``int ()(struct uart_port *port, unsigned int state,
+ *		unsigned int oldstate)``
  *
  *	Perform any power management related activities on the specified @port.
  *	@state indicates the new state (defined by enum uart_pm_state),
@@ -282,6 +282,8 @@ struct gpio_desc;
  *	closed, except when the @port is also the system console. This will
  *	occur even if %CONFIG_PM is not set.
  *
+ *	Returns 0 on success, negative error code on failure.
+ *
  *	Locking: none.
  *	Interrupts: caller dependent.
  *
@@ -391,7 +393,7 @@ struct uart_ops {
 	void		(*set_termios)(struct uart_port *, struct ktermios *new,
 				       const struct ktermios *old);
 	void		(*set_ldisc)(struct uart_port *, struct ktermios *);
-	void		(*pm)(struct uart_port *, unsigned int state,
+	int		(*pm)(struct uart_port *port, unsigned int state,
 			      unsigned int oldstate);
 	const char	*(*type)(struct uart_port *);
 	void		(*release_port)(struct uart_port *);
@@ -464,7 +466,7 @@ struct uart_port {
 	void			(*throttle)(struct uart_port *port);
 	void			(*unthrottle)(struct uart_port *port);
 	int			(*handle_irq)(struct uart_port *);
-	void			(*pm)(struct uart_port *, unsigned int state,
+	int			(*pm)(struct uart_port *port, unsigned int state,
 				      unsigned int old);
 	void			(*handle_break)(struct uart_port *);
 	int			(*rs485_config)(struct uart_port *,

-- 
2.34.1


