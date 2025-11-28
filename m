Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1037DCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apczRWkrHKfV9oaltwvcd28nddE2zoSisgUmol/eatA=; b=Pcq9d+zyKafsUjJMw1ty+VXtUp
	8p23Lsl82rnu23WOhB5373CbI/7MTOcyijCyNhUd1Oi6TgQwvZJw9leFgWlUTLzRME52FzCbWKwpC
	q6S3Jn9UAF+gGBMjdaSx/ttRMU7YDwliQfKQUOZI/Qv6KuNPuPoQ/1VbGCladkMoAz9Eb7Tsi0yKs
	Xij3P7UPdWZzEkCdX3XyZSKm4hht66XpVNbmXtFDHILir5CcqS9TDm3Eb6e+gUz5AO/ofZW5ujFZz
	BgKHJE5bujmNrbb+rjInrirZFKoF7cf8fEvDuxjqqX2al0aZJRPRaTWAlA+338PsaLwAtKuVmxG3f
	oxvpbGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOzxo-00000000Ypo-16RH;
	Fri, 28 Nov 2025 15:00:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOzxk-00000000YoO-2GOw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 15:00:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so15491635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 07:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764342043; x=1764946843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apczRWkrHKfV9oaltwvcd28nddE2zoSisgUmol/eatA=;
        b=jx89re/qMZ4bJPMw5DhnkeMld9nzA/W8rVF6AiIS+ajacNsNLh5DMju201y3YhltiR
         g4yeOtrx6WPcvf0UQTegGGhlbcIrtOu/dwwjIaRxvdFLUUkr9f9gRq5u2cYvissRSbbh
         zrewh/r85hg9ueD9rIimzvGz8ibranFPbW+eQzIdSbCXOnpd0vd3uj/ncVpsfgxveJOz
         1Zlnzsy+bEr5HbG9a3OHPnIaZD/hushGUnw5bjZz9XiSedx/eRvYoCNW2mWOn+vymFao
         P5vYpVcFbJfnqNl7OOB4d0qald5LnaFVC+tdEPx7KCHzydG1NWylJyZgokhyI5resjWF
         uPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764342043; x=1764946843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=apczRWkrHKfV9oaltwvcd28nddE2zoSisgUmol/eatA=;
        b=t6chuja5I9I8bIAF9ooF4Cmka13e/ccM5p49TzqJOXwK+mxIKskk+dcmQaohtYYBUO
         ffQyQWA1oAtI8GxEAcGVB0DsYTyWmbrb1EApQHo9bj8j2VmPHxJYUYYwjq6xYe74r1Td
         4zj7ZNj1j5oXHKPLMC9o2nSJVVVgo0XYSP13noCD9Jv00k8IiST4TcTOVR+Oi0z5trhf
         TxZ9Sb31mlZC+sT0b3wTGX2hVBvkOFzNlCq8+pcocQhTZcty2V8t+7ZTOW4xl9KUYSq2
         cM7qX8Vo0zOcsY7/trziYcIJHuGzMJ+6I0aifvBfjWqDLeqCXYrGVF9u+5EHIVzdxVHG
         Ct5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXt7JvoYJFfx2swWvh2LsJvCZC5WMb2rV+bTiYD1iKwv49KB4d0xoPxvd3yhAMfUnZVG23gNMEZm+WKYhzGR1EN@lists.infradead.org
X-Gm-Message-State: AOJu0YwyGXL5DeC0lvzh8ohKsLmxGzf6zqxeCwEd2LEtd+tZ4Vli7BwE
	9wzJ9P63MxH/SZxI8ahGm4bNQ3aSCpFbyqjezslI+ig1ju4iug9N35s5
X-Gm-Gg: ASbGnctijaCzpMTC0luXFbn7a286fYzMGYUdx37pR0GCs7kgW9+MbKgUZpnngZq614M
	lSQxUokrkq3XkQY1BP8kVdbcsf44TFAqYZl9TgJpRAYNiVzqxOA2EudlIyh0aYKdaFBmzAeJGRP
	Huq4aBHhfIFRZL7sMK2v8KokFEZ/iIei/F05GRC25qALokxTcJKeb0fLrJyfpkpa+ZWdNwBHwsU
	fZm8Xhc80wxC8/MKFAfgybN5wCjxGYw4kVu0cLFEMlQ7YEVeoym6htZlevLs42FGVG356Cv/3lc
	jvJxVYxFr5m3AdefI6x36aiEgB88/i5uuqNoJGZopb3ZxruSqDb5VX7m49FdFpkE5zaGkYtZPm5
	NaNEqkjbcVYSPXnw+kXXWa5JrfIKo0aYJBzbRaYkzUa2HzDn4exusSe0jm/kHRtznX4zDNySzgm
	jHGp1G3yrIrV/Erv5cnhSi9ZSR6uw=
X-Google-Smtp-Source: AGHT+IGZ5phRRYX+v7P/fz+XER6nFyz0G4tY9Gcl8oDgTYqo9/i0jpjq8twM7C3UskdUr1BNUjh8fA==
X-Received: by 2002:a05:600c:1c24:b0:477:aed0:f40a with SMTP id 5b1f17b1804b1-47904b1af90mr189698325e9.19.1764342041970;
        Fri, 28 Nov 2025 07:00:41 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47905303963sm93117975e9.7.2025.11.28.07.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 07:00:41 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx95-toradex-smarc: fix SMARC_SDIO_WP label position
Date: Fri, 28 Nov 2025 15:00:28 +0000
Message-ID: <20251128150030.35931-3-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128150030.35931-1-ivitro@gmail.com>
References: <20251128150030.35931-1-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_070044_585092_43922765 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

From: Vitor Soares <vitor.soares@toradex.com>

Fix the SMARC_SDIO_WP gpio-line-name position. It should be on line 15
of som_gpio_expander_1, not line 17.

Fixes: 90bbe88e0ea6 ("arm64: dts: freescale: add Toradex SMARC iMX95")
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 2cbd5606cb19..115a16e44a99 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -406,8 +406,6 @@ som_gpio_expander_1: gpio@21 {
 			"",
 			"",
 			"",
-			"",
-			"",
 			"SMARC_SDIO_WP";
 	};
 
-- 
2.51.0


