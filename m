Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF97CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KC1/Z5A4C1NKjQ4MKJ5mwlwDtHXXOD1eqAPkjlkCE6Q=; b=NwiNiRgatcg6cHfsti2JQjPlUB
	scyF+S0m7QvAcLVYGX3IJy/7Gch3gfjnYgmdnGHVLtHGpJJ+hYhm7/nX152YcGU8nrRxMGwfzQpH5
	m7PXOmlQPPFwzTo1tTUgEMyd7m5H3St/BnEBXSl5gkPCzM3SojOKeH9ibcn+pnhGgWJyD9eVKtn8g
	4285bWl6PRU6d3PLhBSNldv2zEXLCzxSp//7UeIflpVd6hzkTnFzBwOdBfkAk4Ud+BW5T6VZFY81R
	sHj4JfmTyxvB7kW9AcufUAACu7xVXiUVjQ8aSCrCEI2TvP2OLWMMBAgYA7eTTTQDQvSRag3+JI1Hn
	QsSfnyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwM-00000000Vod-10Lj;
	Thu, 18 Sep 2025 15:52:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwI-00000000Vlv-3V1S
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Sep 2025 15:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KC1/Z5A4C1NKjQ4MKJ5mwlwDtHXXOD1eqAPkjlkCE6Q=; b=gw8I/8/gYPZnX/4ZgbvY1cqQoI
	KTfh9c6/eWEh3jYq+GAD2i/oUhqsnkwIAfm4+eMUxvYl5dq9ENKrPLok+8zOf411HePi/XDlHIQKw
	szcpNygavhEYDWvoIY1RXX7Ni+m0R2CZBW1n5Au1leuJXJNIxr3tNAh1toXHENA6BD/JJqPj3kEb1
	tIXvqyDsHLiJa8tjRlRkNhWNad4GR2B2+UzQ/JDwubjsOTkhVSh/NYKgW5eU6Xp98cefsn/9q4HVg
	MkG7lYAaMlkzz2b7VUyeG2icGz9MBqgYNMJnDvtC0omRfqDe7jGalkOHvUf44ykxQmM6KRZyLMwq9
	QuwxwcRA==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwG-00000007eAZ-0LdY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:52:53 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-62f7bcde405so1532527a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210770; x=1758815570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC1/Z5A4C1NKjQ4MKJ5mwlwDtHXXOD1eqAPkjlkCE6Q=;
        b=SNYVJxHLrqA4VAhWoBohMlgFsUnNV+4J36gPw/qLhx6CGswhy8cdEXLHnNeUCF0fjE
         LlGhfMaqhdhKCyjLakww+D8eXmmkYUiO7jhcsa9jSWMbXYW/IumAwbeRIAHVEK8xnW6v
         vSfDMFzG1xd8ZAFfdPrLTX0KYdj6UNh6ZE/Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210770; x=1758815570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KC1/Z5A4C1NKjQ4MKJ5mwlwDtHXXOD1eqAPkjlkCE6Q=;
        b=Ce3TOXwmH8jrKXApSVdCU8s532bSG3lnqXDOmwR/WqCzxhNobcXhhJvaT9dhdSp6sc
         pvovQ4JdC4OCdoDGJgudIoOGozz586IWbmRaCxJ6JWAwJBzhYCbVgfSyr1KrK5iY3u3p
         Notofymz15vcUo7/K5NoBaqPcjgjS4MPVjedzRYKyq2FfpaFHg5Q0OagsKKJywC6vf6A
         km3TLR6RX+ZV36WZslvWH9Iz6rjdrIvor0c0w8wO4ucgxoFnfv3A0HiBy4ASdNGgSBlS
         od4PyeQ+bDrOso9sTACU00PlXP5hR+1ZOANvEvvK06Zd/pgAXEqnyAFpO3SXRjS5KNIM
         eDnA==
X-Forwarded-Encrypted: i=1; AJvYcCUNG+2uwmDYWEEvWOoyUZA9zSRh+BvlABb9xl5yv7CJol0FWnhRTVsmlxOZ2OHzbqY6lYdW4+5Bw/Y26PKCRRrc@lists.infradead.org
X-Gm-Message-State: AOJu0YzGcvfhMcx8nH3cXyJNVSz5YcmehaBOzvA8eG1az9gMRsbEDZR1
	kmywiz/ZxdEcFHTqiORK0xf9lcjBAm1AE00qD1kZpX5jE4sd7ZE4ms7uCXULl9kIt0k=
X-Gm-Gg: ASbGncsvangcQ12NcDD8Et/vhD279uzOCdI7DbO+zT0kbDGtekUKK2p9RfDVScIIrTZ
	II6bO67oDz/7mXcPwsP0sqxvj6RO9gteOv+nZXuic8T9kHb1QdHYktJDarV0bsnSen09EjmpScR
	RyUFnuXflk0znlZ1c3TllHcvNzYWgzp5albmLbYQG7mxIYPNREi2rdPlcYdj3ol7MppTEOkb3X+
	Vfxnb0ds22Pt8JznW7w5mjYKpg9+Ruq4cz/rbTXuU6H/BybnKwFw8B/neECdQXg3gdsdxtDjKX7
	UUHzb2WZroZDiPnxNrfGboSLEWdumc4bOqXpoR+kLKRrf/o12nKdCZybII6SbTohCrrM9eiNfKf
	B10KgrOxMeBonN1ESSxj0uonrYXXoIXPdVgb6bLr+potKK3WaNU94bmkXoNo5QGB1jIuz2ETAjn
	SGyCu7yVKdctkS3s+bB084TrH7euPkcShgB8OW9+zkcfXS8NI8qefqLCYoTcmtTT3RVJBej5vyQ
	7AgwC2IeQM=
X-Google-Smtp-Source: AGHT+IHrrgs1HJChTIyvAVV8Pi6aonRsXlQC1gliMmMRrY60B3FFWCvZ01egkSmZM0VTAEb3+in5cw==
X-Received: by 2002:a17:906:7310:b0:b04:858e:c1ee with SMTP id a640c23a62f3a-b1bb5e56d90mr782962066b.2.1758210770121;
        Thu, 18 Sep 2025 08:52:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/6] ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold
Date: Thu, 18 Sep 2025 17:52:33 +0200
Message-ID: <20250918155240.2536852-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_165252_213468_54ED4234 
X-CRM114-Status: GOOD (  10.13  )
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

This way the detected signal is valid only if it lasts longer than
62 µs, otherwise it is not sampled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v5:
- Add Reviewed-by tag of Frank Li

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
index 279d46c22cd7..f12084d8f2a0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
@@ -154,6 +154,7 @@ &tsc {
 	pinctrl-0 = <&pinctrl_tsc>;
 	measure-delay-time = <0x9ffff>;
 	pre-charge-time = <0xfff>;
+	touchscreen-glitch-threshold-ns = <62000>;
 	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
2.43.0


