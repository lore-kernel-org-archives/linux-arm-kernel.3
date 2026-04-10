Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747A2E9907F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jw17PSEZKCRGEFR6RMdIihAAVWvt1U/1bx2cCz28f68=; b=YamBX6t2xTwEFpnL+mk9Wk9Jd5
	mylJK9FUtcvcWVbCIXmljOvDibcmx+MlZgC7xGtC8LTTE6RH2b2cxzOv2/2MXY7s7Zp/ehPiOe4o7
	9s3uRjFuH/bfvAAzZMt6LJrvk4kABDU5S5zEGA9H3y5+IYTdY6NPeQtLkHoZBYgGBRrI7wDa16Yjq
	RfuyIozumMMUMP61AG0evS95JYBoY0eHCjzMNmDXNZqI6PC7difHDI0/4cHS6XWy14kNn5ruIrf5U
	navWB0Xa6lEW1B2UzATt16FpiiibhAFvCfXlTIZKYzgR3oJaC15uMoMFJpwZeu0/R6lJ/g4Ei6U+y
	xNSkcjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9IZ-0000000C1HL-0aAW;
	Fri, 10 Apr 2026 10:41:15 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9IV-0000000C1Er-1xGZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:41:12 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59de8155501so2126778e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775817669; x=1776422469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jw17PSEZKCRGEFR6RMdIihAAVWvt1U/1bx2cCz28f68=;
        b=mvlWua0mAOtK4aHoLOOUEA6DdfzxTu111ePwyF7jQb8W4UQBDW6G7VjBjzczb/L0Ev
         B8dXK+WRal/UOlOi0yBkZq0wOep9Iyuv83qbfpOK5W6JSf3fp68ZTRQhvvQf5prejLGi
         GhSAkio54zyEMLUCv/JGYvH9alIn5g91acluulicmkbADlebSzl3nvWhqowi0P3wSQyp
         mFHfuPv72UGZPoA+Dw/sGmxKqYVmqRTN3AePbQSSny772hUMTMns0M3yyGRP2QFLfHVU
         bujD6EWxtLq93jkjj3n811VLjyF2its7f2BaO5xv8VGmOKGW61tqn0E3zcalBYqApx9D
         joBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817669; x=1776422469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jw17PSEZKCRGEFR6RMdIihAAVWvt1U/1bx2cCz28f68=;
        b=sKH6SHpCkR08huMb1RUhmPuKGWVu1XvJURKXCFhCA5Uw09Pk0oM8V38TuvO61wVqbn
         A/q9OMjVuaqgCtcV+w2JGHEOSJa4N2Bpm4r+U/syidsmi0h+deyK4yED8Eggr3ui++eW
         rax1FnVKblR1rVmyFDtogvadIJQhUjicw6oHbqMwECPvbuDhk+Nb4Ukd+sG0VXoc39GL
         le9ose+54r0nqG/N3kWg4Zjaadagi2M7MWHqKxg0vbnbnCfONNiGzCYTIAoKq5MBTRP9
         o+HLMcLsSmvF3aAbPSrMo6sHbSFH7oITs7hSCYJ1LQjKd5AN58L+ThLPUTmTWIdmRgm7
         BRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGHvUq9rculSdn2BQblAA2U79yVXQ5ZFi+exsoymCwk9XC4V34zkaGIG9u31jidB7MoXBD+DOAqjimCXrn4jMZ@lists.infradead.org
X-Gm-Message-State: AOJu0YybTgGiVzcSpGCT5w3kuVkgOfwjbbIIcAj4/Hln0KXMhORVJSJP
	wkIYKnzLZGAtnA3Z99xsj0wWuFlCaeLyh+PaxZALxstXV7Cm2BnLbEJFJcwYh44zVpQ=
X-Gm-Gg: AeBDiesV0GKSnI17tzBgexYzVkrraP/8T+yORwq9G7OI6BrPGoaXQDABm34RG4wy9XO
	LwChtl33w2aHb5Yn7OZNOZCTZbzGTMb7aEXaRmMQzvxU+ISr+TO0CI5EylhPw+Hm7DjHtgQ+Ed0
	8hYcQtTaMvxZlM2pj5gdDQDDdZVZ0KCi6KalOvggYcSBGBu9YKz90aFIb5XjXNZx4la8CN+E+e3
	ZOb/8m0aIuymtwCKyCW9TaHM7wcUYXQnfqLiY92RNegikHmki0sc+QbdoSK62tUVZGsdNsKRXGW
	+gBR0gN6aW8bYIKWUq+f1XmZmJsxx0575/Jqp8qHA18t3yGUBPzu7rOQpun305ZPnPsQ1nNRvop
	SjdZRB69F04C/fY2TszJdEqTqJaJQ7ZgODMG+cnyREtScfnCl4obuqhNTzp6n84UWe0pBEBT1Gc
	Fng35gGRvQl8po8T+rtkG4MI+1F9oTtNCncqbdwimE/ms9T1nmgZ/nRBbkhQatmDjtCa8UDkAK
X-Received: by 2002:a05:6512:1293:b0:5a3:d375:f587 with SMTP id 2adb3069b0e04-5a3efe991e8mr817900e87.35.1775817669011;
        Fri, 10 Apr 2026 03:41:09 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm5588331fa.23.2026.04.10.03.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:41:08 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/9] driver core: Add dev_set_drv_queue_sync_state()
Date: Fri, 10 Apr 2026 12:40:45 +0200
Message-ID: <20260410104058.83748-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410104058.83748-1-ulf.hansson@linaro.org>
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_034111_522194_67248056 
X-CRM114-Status: GOOD (  12.82  )
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

Similar to the dev_set_drv_sync_state() helper, let's add another one to
allow subsystem level code to set the ->queue_sync_state() callback for a
driver that has not already set it.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 include/linux/device.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index e65d564f01cd..f812e70bdf22 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -994,6 +994,18 @@ static inline int dev_set_drv_sync_state(struct device *dev,
 	return 0;
 }
 
+static inline int dev_set_drv_queue_sync_state(struct device *dev,
+					       void (*fn)(struct device *dev))
+{
+	if (!dev || !dev->driver)
+		return 0;
+	if (dev->driver->queue_sync_state && dev->driver->queue_sync_state != fn)
+		return -EBUSY;
+	if (!dev->driver->queue_sync_state)
+		dev->driver->queue_sync_state = fn;
+	return 0;
+}
+
 static inline void dev_set_removable(struct device *dev,
 				     enum device_removable removable)
 {
-- 
2.43.0


