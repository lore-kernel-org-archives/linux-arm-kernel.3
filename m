Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9662DCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaiAmYFlpvqj20dmoy65KKCZhRIv0Jj8RmELXA9gRCA=; b=1EZ7ebtsnLs1nknGVYX6nxzsnq
	Fj9aPO8Xtx3pjOcUErcDZQSsOzQNX/8EBAAZ6FyrqxCk2jOfXZx2xxFmit2GSLm9RpXJjw3ZsGoy+
	zFbYP0kcWvsKKBGzcPUYA3UyLPQoH6KW6qQj5A0JwkFzGaMkXIsQk4W/kw8Jfd+34Ia/aoclJoozw
	KAJ10Z93HZzgJdky03BLAisuosHTVSEZlxWebr0B4Xqr+9YS/bfG5oQU1W1bzXV/iWtJKOq7DkoVs
	YNjTUmnNhZAZ3Nj5TIsbI3yOO4IhQ3wV1xELKF/zCBZdbdVpx4UNLTo0ci3ACNyw2xK41023UQjy5
	FClHPEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmis-0000000FGqE-3uLz;
	Wed, 03 Jun 2026 14:37:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmiq-0000000FGlw-1oGb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490af320e2aso29370725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497451; x=1781102251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaiAmYFlpvqj20dmoy65KKCZhRIv0Jj8RmELXA9gRCA=;
        b=NVAPEOpi+fP9FgpkXYGgauZicipl2Wb00U6bEz5RpWeQJOB1PtASUw1tyK2ftZQNfS
         e3VWNWuyZPdkSFYFCjP/3JNfvp5nRcTsKoFJYz0Kr59sVpDtJwx5lyRjIE38vba0c5Ny
         sUbO9xGVI6EZkG/iMQDAikIg7dv1xvqeWeAoOZHm8kX9mBoZvglOCai4IZZmUkvewaxD
         YA4xFL/6tiALR1K0k8p/eqvrO5s6eqlRwBdaqGQFMbo9Ae94bwKO6coqO6ozWQJXejV+
         WDTGRruhsnJl+ZFvsNjQbBENOqrA9PO5dNCcOSRD9QO7jMsr6b6I3Gs8Hvdv34dgMSzV
         DUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497451; x=1781102251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iaiAmYFlpvqj20dmoy65KKCZhRIv0Jj8RmELXA9gRCA=;
        b=nYgO7a/CFZeBYkomKGRs7YcbrRbSpCfFtgwCBlkwKfkRnUMo8f8Eoe9+cqo1XOWadV
         0H9MnpMhTFvncs9syTkMw+sW8wagx03pOl+SzzIRVunmH1anJ1215YO9IATbsFcU9clo
         ihiV3LK6qf+Tvwxyzhgz4btzwcD84Bl5/qjsxvJ4vN+hrwWNmEATnGNYTz6+ntE77MoY
         hjvuhRJnlmxbkDbdN+cxjQf2OnYpjxPMuEJGjY0Q18JHixFkpEGzMml3GZqS7x1Z7Ait
         pK3X8VGza+3YAiHlW+Cvdf8P/doDbDJ4izCSIO0k8n2pr3ffy01c68HZprhxcb1P8QNM
         K10Q==
X-Forwarded-Encrypted: i=1; AFNElJ9k2noJu6eMV7x5H59XQVfKJKxdwBvO/ayiHhzvX1zn6TcfG5g20zp1j+xwmMTf15MeWvjrZTRQcop1qh5Uk/lW@lists.infradead.org
X-Gm-Message-State: AOJu0YxX6LxV9c4E8czJAGrxryN9ThPRpHmEoIBrg7Mpz54HxiiKUYoI
	TasY0Ls1iRjRX8oNeqYdmgPCYDKt0PAJ5o5pXWp4hHBUrq36eKSb7fdEi7oPMg==
X-Gm-Gg: Acq92OFspqnOh7AUirqYQA/7L0jRdEx+hFWoHzjxoUZMPFl0h/cxDj39HZYfWj34xaa
	/00wVeA36wRjz3vH8CFLY8c3lbL3s4r8cBp7EHbzLhPvKsaZTKgLP7TDyg/v3qQOxyvENr5MjJ/
	rTt+XDsC393+FjakV4RILRmp3zBcxAAs5Pd1Si6s5NAtXtBMkJ9IpP+pMZi11NyeoPoFSnaukHd
	Frb5JKh8cAScrUC6QH5XBzAyBSGE+xg2rlsgoifO5P8vFtAV03//ywhWGj9uHvkg6iYjVVY/pRp
	2mhAOyRcZeK12aRQehA2e0MkUDQzCnTqMp7FRSFnbRAXY3O/p9sLRSrLbvm/K//wk972MMrE1ip
	jOpXFYFVREzSCknDmzD362Fga9MxZgSoByoRMnzN3pTH/d3dtlXpvo/SYVE74HqMy95kuGSUOr4
	BHyQKCPCZrHGlPWNUU+usKevZ8di3Gll9TIEgmQ4KNBOFKUUB5EqTl6l7dUrb0inupH49gx+pwG
	mus70kHYt7Kd0T1uhNzrJ89RliKo3H3fdGOh+lQygoWyErj
X-Received: by 2002:a05:600c:4586:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490b5fda716mr63616595e9.27.1780497450787;
        Wed, 03 Jun 2026 07:37:30 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:30 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 04/14] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Wed,  3 Jun 2026 16:37:11 +0200
Message-ID: <7758fd3b241c8e09e8b0f4b3224220325f8a069a.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073732_489968_D3345B7D 
X-CRM114-Status: GOOD (  10.87  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 6c19a63ce405..b15ca44b9a92 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3


