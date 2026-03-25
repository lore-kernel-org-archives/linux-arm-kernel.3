Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBC2FEC11B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdN9cflUTNRosGOiuG2K4soHcCdEwWx9Mv6NnPQ9sVM=; b=bI38v+5BogwYl8Dnt5dtKU6nMF
	2/Y/lBnVsbFMD7JP+HuSgpYLeU40xGk4re4xUBbJTcagi6rDJeEiZdwnQDDXLbqzkTIbn1cSrhJhY
	4c3GLbN2rkPQl4uWpzKhnhGylqeOlGwIWbNBnA+AERkQFjfLYMKkxE0oHlnNkP8WY1a/UPBZxZFIh
	vTfpcsSP4wxLQJClaALgDWl/GtAaQTNO347O0oP2Mi2Xotll8+eSvX6tGvbucnlDHeUbzQD2HDmre
	DJ8/hp/RHWibEHy5Jg0x9CpFT51sLbkze7UimgOHSW+KCRr9Nsb8hBz18shBdCL/DUVWdvNfWgfUO
	OOIS9/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mpo-00000003KW9-2QpA;
	Wed, 25 Mar 2026 11:55:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mpm-00000003KW1-2vbt
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Mar 2026 11:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jdN9cflUTNRosGOiuG2K4soHcCdEwWx9Mv6NnPQ9sVM=; b=jgLXQtf2O+uFAWTXYburmBfCzh
	224ifAYtjO/Uhubr0YTrGvs9E62my80DFaBc2lt5Hmf/5e8k5OPyprg6mtWaY/ZW4wtB1qOJry1dM
	O+pNV8UZqPfYxHUestaNX1YKpEN49lh//iZWZViZMBmqKq5NhY1wXxITUjXWAie0D9KkBfuBmVHO9
	al3Not/c466DYjfYlLi2H0SoThU/J0eexzqG1diXgTp3yehvjLSbZQcWB4lVtMLRoZaECsWD3fm0P
	yXXWxbtP0S3UoakjKp03WHNuAaSA5KkS9gAf3RBSOK6aEgyhOD6QUeuhpdxzQkWvLgYU6rVEzImpS
	hkPmbwvw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mpj-000000063T2-3VE2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:55:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-486ff201041so44336365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 04:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774439734; x=1775044534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdN9cflUTNRosGOiuG2K4soHcCdEwWx9Mv6NnPQ9sVM=;
        b=aVfklw+j8BtbZaOJoF67rJu7SmrFPMJ2/vHj00jpBA5dl5zeUHNHQ6vC3nrbl3VtO6
         TSZw3f4OJX/qCMw5vWn1YgeSuPzi70CEpdiVqxfs5x0i8y2hYfP5yuU0Cgh2f2I3ub6f
         aN4RrhE2/xBdEFHWnLrAOsbm/1n93rZaWD1oFcyItdvTd68foGzzVjJXWt80vbwEcTli
         3K+L+1FGCcQUlyz1a/DqiCYalEiu4PaunOjQiXm1vYHtJlbZwIx87ydSaA08tc7+FIW1
         SaxJfYXdYObslLaNU6oNy/32N7t5xmb8E2+lMUAofrJEzUm715pCQR2FCwgExlQEgCS2
         chtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439734; x=1775044534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jdN9cflUTNRosGOiuG2K4soHcCdEwWx9Mv6NnPQ9sVM=;
        b=Nd4v+GcE0vBWgz7BhWNTtz6HN0tpTGQZZdT5J2gwELZfjzMp1SalLZVpMLixxUcSdD
         Dn7ciloAyRjYy0FoF0//XmssPOcZzWCl8xwDHoAB9p61ghZP+oPzpx0T8Ik0vha1Xv8X
         RSg4lsTo01Grt9Xe1p5cM5qNfJOk5GcXfvmYu4pK9rfuvTooB62gkf9HtS7f3+5TAF9u
         9K4e1g235csZICPdeqsJepaW76grG5KKVt+GMdGiZnoPKn+nefmTsMJ3BCALnAYamYR1
         1JYfpW9CSP0O5jQ9fpHeS+Sj4VMle2QxARaSNUXNtpqxQ0A4OKRFl4m1/EM9o6EbYSGQ
         bmwg==
X-Forwarded-Encrypted: i=1; AJvYcCU85JOBOOqmRdvVPfqc0hBUTGKky2EiHGtNMWKEgzsYHUVWQGLA0ui83f3VWK7+YjwM/0RP8WupSzaoFgXZYgvk@lists.infradead.org
X-Gm-Message-State: AOJu0YzRy2mmB0RSGHYFfMAc6yZNh7Vcrd6YplXkLmj1ozSFkwzRDwkm
	AQryJQBm0/2ZtdLKAxXPt3n5v/xkWCIaEXqZk5+Tkx+JufQ2veRb9gVa
X-Gm-Gg: ATEYQzz8zgZyK9SKshfBQnVzQduvD2sipC1ghwtJi8ob8YUMzAwhWfZ2wkTtjLKGqMq
	rC8LXr5fX0iaY3bb8DffYJ2MMB5msqX100TooH81rlMqZw729L3wx1RXYE3cOezxbVFLpMiUKBO
	nVDR8vK31F160VpoLz2X72sDm3336FRe9N1KEDJbGda+/1NUDCOCccAjkKRpplNXBqG7ihT5ohW
	zCDXnwtAnNjIWTKu2zvdWkFULvUUXB5/5e1zkjLUBd4U52DwwUjn1JzBqEqHJUCSgY8FnhOCgxR
	alVJcHWxTE23yWxVJjPLNzw/3IizEEtJaTeqEJoQgbQI73xwCKTDl7Vild50Flg+RHGSYakJbY2
	OnrHiArwxeRGgZB+M0PMMaTZoUhVgMk09A+aaASNn7zYDkxlLF1gYQbGkRgxI4OjFe5dkobQvyz
	kESVkRMLt8VEwDxx0GQi7oPCqvFZDQfgvLpzOi/Oa7PWeVQj8LOX7Cms5ggSNvNAxNaFEO+QGYn
	y+7VG8AkHioL6rLlve1hngnl2y9a2qyKB0LyF3xACqrGpQvw/9mdYqWTyd/6yulRYwbOmnk0/wr
	MDGcFKH6b122iHITMGkH
X-Received: by 2002:a05:600c:3b12:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-48715fc3286mr51267335e9.1.1774439733479;
        Wed, 25 Mar 2026 04:55:33 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c44bfsm147878035e9.9.2026.03.25.04.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:55:32 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH 3/3] arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_UART_EN
Date: Wed, 25 Mar 2026 12:55:11 +0100
Message-ID: <20260325115513.707914-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_115535_963693_41EA0EEA 
X-CRM114-Status: GOOD (  11.77  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

On the Toradex SMARC iMX95, the WiFi UART signals are shared with the
JTAG. The WIFI_UART_EN signal is used to select between these
two functions.

Configure the signal as gpio-hog and drive it high to select the UART
function by default. Add a label to override the hog in derived
device trees.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a90edefc5197..29e3f5bf867b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -451,6 +451,13 @@ som_gpio_expander_1: gpio@21 {
 			"",
 			"",
 			"SMARC_SDIO_WP";
+
+		wifi_uart_en: wifi-uart-en-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_HIGH>;
+			line-name = "WIFI_UART_EN";
+			output-high;
+		};
 	};
 
 	embedded-controller@28 {
-- 
2.43.0


