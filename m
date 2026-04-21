Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CBEF94CAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBJ+hPnmdJzo3k/g70RHgYIGur+PsmZcEVdmZLkZuHg=; b=FG/bKFHuqyrKxb2fsOdQz4LNDA
	V9qOJ77946kwwIng74QxpMCrG3qfXRDXzfme8gmf35+qmqyUX/nNltVDSusDW1m1fNGU2Pedr4dI3
	n8cSL5zMEqCkRrjzkVtnI3arLQuhWqSH7u/iN4gJMsI6RuArSuczRaB0yquUZzHQE4g2z4Uq9Wnre
	WJFcL8H/8Yx2w3r61YJD84vTXNL+6EvYs5hoHBS1asKYWsoVefL87V3ViovetftwFiIsYTaGwEfF7
	LM/kRx0bfdXodQdYEzDp2PEpHOAt8bUZKMNXKOG+9Ldtnkeo/Em06vuauGjKKvnxyGWe113XmzwGu
	eYkN597Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHdx-000000097uN-0NVy;
	Tue, 21 Apr 2026 20:24:25 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHdu-000000097rY-0rbF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 20:24:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso34085635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803060; x=1777407860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBJ+hPnmdJzo3k/g70RHgYIGur+PsmZcEVdmZLkZuHg=;
        b=igFZpNDidS9s4GQsP2fHxkQ/SJcRMXypuQ8xFbDqZy/YBYpR1SioF/9tVO4rAJA/Rp
         3JDQIPjf9DohUlT1DE4M4fpn0DLVSVurjfzz1PdiGJltx1WkrE5Kd3YSaJu2FkfJPRmV
         JeruA+WnhcHk3s7w2i4Po8p4yHXaoke76k3kF2zFqrxdoD9rj3YxiqwtWpaQoIFG6PAg
         N0cHVZ4cjpdbTlKODtvjkJtpylFhKnSJdVqjz08dbKuQA5N06gJZN+6ElIHTsV7Ykv6U
         xDmPPWWzWoRIsiQxVIMXVuRiujqvPhytGOYT7xiZ2+RRGQhDiaVra7pBRewwRnTzBcz+
         o31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803060; x=1777407860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EBJ+hPnmdJzo3k/g70RHgYIGur+PsmZcEVdmZLkZuHg=;
        b=l4emy7eI+hGl6Bc2J/fR02iGH6zvFaEfoY5RFTwlC1QH01ZWICRPtDn5wadRktTmkm
         xr5UPVNGsUB7C2/AtyMoj0qRjvvfp1rzZeYFOtBoCdJjE3tI1R+XMl1w9NgMwwinAOno
         Bk+7aXLBzLakvrAH22+DxMYYlsVqYM+SNwIAsCAfZDPEnirm6442xa84lev4ce//cYhJ
         qfjWHl+KSs2G+weR65mRMJDNbbcIDOxMrZ428y1KZEgrH14ktfPokhiaydVmYqZ+02uy
         FshiSPlFeskaCJHDhKPVGtAZFxIqsdmYHX5jhQXFuO7tqJSqdp5FRI+osdQg/q+QB9zX
         eibg==
X-Forwarded-Encrypted: i=1; AFNElJ94nIitmfNbkqoXHzwpSykByCzjH50ODGYUpnatSR1aMTtlRJVXL/HNi+DTWQf9I6qmaa5gqK5WcgVyhXvvcft4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsz8++DRsdq7GKjITzSrjWybfnopr0AbUoy8/VAL5bYU+25q8P
	F76P6GJJb6bIc8uHmzq0XK5DeF15N79c38DW20j+6TbC4GOOfI1t6UPu
X-Gm-Gg: AeBDietU8SeYAdezSaGgNyDgJUhQKJc5RtOjzgZPb2BbDlSImVDf1jU9/GcbuE9ghOG
	RBJH68gqfRk09jxJ96NFWUYG5Wn8t/dgxSMUALWdfa4au4LNBUQpNeDYZUgsxXoxVwxAyBIpgE3
	PZbnrtxIhrgyiNVrLZ74ui/qGgJ3yPI+V2ydS7m34oKKkXG46eCeqaf44mvwZd0lqftm4d27bcB
	X8ASOaKAs3w5EZVn35MGUxG4EF+IddTwq8rGuP5Q4GAAtmxwyGYgVKjend842MuhBv4MsDDQ4a1
	W2vUqdWV5evKIHksziq0PyBi5K6w3O58AouoVy5IdCuYz4YmcOzDJgVyRQe1z/mtBgSFl/PSwIM
	c4Cbp2OcQ6e+NOHxqRylv09RK+WymR8kFwcx38iHaZ8ECe0pUI+AbY69jVcN5rrrMUUcJtO+Gfj
	iTqOOVGdfr1ANF8uyeegmPnXazPWjT/8Xycql6m55CzrNA
X-Received: by 2002:a05:600c:308a:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-4896c22e217mr83386305e9.0.1776803060488;
        Tue, 21 Apr 2026 13:24:20 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:13 +0300
Subject: [PATCH v5 5/8] ARM: dts: Add an armv7 timer for zx297520v3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-5-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=CEUKetRzVzn2Xnwq6XKvSjU6QTqMzQIFYZ7UZd5Gyq8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXF6GMMLpNkq4WwPjAfftYcRTaZJtkuzLOe
 KXRFnrgIfeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK8xhAAldsqjYe8+3h/X86yla+u17rfI//QK+v
 +A4g3kwBFOtoQ4YkoXtFlmKNU60WhO3ldAyJruXz0oONJCiUGJVhQdevJ6gJgTGtbFxWrFd62OG
 TpeCV0pwDt69klMWhqnis/g8QTr1XydLXrExyn59UcGmkzMiT+namcriwxgM7xXxZKeDxQ9w6S/
 A9+oVVuDBIfCc7ZwisT03KEmHMnhWy/mTY/9Ggzwgu23EHu63ztG+sePZ/nAI5Vqml31qmTpgox
 18zynyLmwOSAvGMPGpnfI3bq2ldQwf+JsbyS1qRvI/lNXPTEG1AgIIlXgX0qF2r4ZRtV5GqByR0
 QZzbBYy7jO4f6n3dEE/T+hrPGJpdv8edlkFOYbEv3Pu3+2tmCIa6dup5VjLjkLMS89ERRnvvW62
 c7eWCocyYyWgow/ptUwWJ5NLIhY4XsYe67F35wFukL0irgRrfDYLaKVYNS90fEPjULHLhpYpgSn
 wwnlChwvKoS9BJLqY8a3cJszrQdI03ujbootk6HZVjuE15Jx7a/P470qo6sviolSF+rmWsA0iuG
 7qWOhsm2ToVSrk5f47Fm0rI56oD9QDQLiJFXq2IIDYNSIol8ez7QWvqlvfiPZKeCHNVVGMQYcCt
 fEy9cxesmM3Pq2mT5aNKIPDB79epR6RVMymRSpe3VxKmldcfrKLU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_132422_276995_F7CB08AC 
X-CRM114-Status: GOOD (  18.09  )
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

The stock kernel does not use this timer, but it seems to work fine. The
board has other board-specific timers that would need a driver and I see
no reason to bother with them since the arm standard timer works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index 0fff00f910d6..903050c684cb 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -20,6 +20,21 @@ cpu@0 {
 		};
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <26000000>;
+		interrupt-parent = <&gic>;
+		/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+		 * arm timer at all. Since this is a single CPU system I don't think it
+		 * really matters that the offset is random though.
+		 */
+		arm,cpu-registers-not-fw-configured;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -27,6 +42,15 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
 		gic: interrupt-controller@f2000000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;

-- 
2.53.0


