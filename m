Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030FCE73146
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 08:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joUE9EOzP/3mRELBtbdhIrRdcsM6ON8pu5mMACf9Xr0=; b=gU1lNHqrE6fZpH92qLUGbu8NLY
	WyRPSJfk0lbd0zfuS6eTCrNQx/U6t4iSjAsEw+uxGRuCzhEdjP2FX1mb9J8Gk1McwAL8n9UWpKT2m
	gbTxI9Tvo36uFVZt9C2mWG3X01IvyM0r1/Z/fEl4eS8fUh99nywCpI0tWmVt+XRo0INXsbcnVt4//
	t98mRHTJdPpZyyiC/9fZ9HLl/XeF0zVCvZ/vFkX/c0kqiIIp2JqoCWCMkiIfF9GdTsZME+b7+4XsJ
	gAedUpW+0P+SXDRd+fbCBBSyVbFrY6kqqAnljJL/xuAzHv53R1naQnNKMSNmuXQsaZNdi5F/ZGBoO
	4WjDXaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpR7-00000004eNI-0cD3;
	Mon, 02 Feb 2026 08:37:33 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpR4-00000004eMH-1Gko
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 08:37:31 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-480142406b3so29789385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 00:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770021448; x=1770626248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joUE9EOzP/3mRELBtbdhIrRdcsM6ON8pu5mMACf9Xr0=;
        b=aHcGGjinvSUa/KWhljLO1qRjuXFZSHK1T7cR3A2QdZdRTCjo6YfaCbUbSNg+geuts1
         q7QiL6BjG3WgrdlpCcATnNC5DsplrBnmQmmfU1a3Vu8vNwJ7VBXchA8YZuwHlJYW4+dc
         u8Z/kphM3cuwsmBni6ps36ZEOmW9VtwuA45WqOCrhtyz4y64pxi4EZHBB0+kWI035ntZ
         5GXS45kYyGAUMusCRtCGgPUY1Re4IyMxD7cBBvyQ9/bJRnJRmFuBKgiFUUqI5ZlucM1h
         WgHIQrwKD610gODfIf7dOGTFuJIkBUM+BLltu7mlkpsW5QM2KBMTHtTQ2ngbXYyQv4dR
         4Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770021448; x=1770626248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=joUE9EOzP/3mRELBtbdhIrRdcsM6ON8pu5mMACf9Xr0=;
        b=PEQKKRlsvE+MkrjaGYoReUVZARZDma79mNdvDVAQtI7fobIMFDiTumImGL3LMqrll5
         Isx+9ZWE7YCZzhCn8kq5/wUjO8aF1AOuixnEfdNsYvTDItsYs4BFIKtln5QF0XqtuLTT
         ynVU9op9G3MfRpyBjPxz0BiE4AAMcr4pPGMA5B5j2V2KM3yGO7sqKHo7Cdi3UfsHZWZ1
         Zej5wZRysvjWFWiIYlKktDOvMNydSgb1aldjeMdKPXAKytXM+Ekng4hibY9KXWKzk86A
         iNdMdRAkiqIweaOrnhlJt3piqQp3BwG9BT1n7gA289+kIYi2oNg/xrZZNbLzMbdrM0dh
         Dh1g==
X-Forwarded-Encrypted: i=1; AJvYcCXaO6aLl+nYG3Qe0UH7UkTPNzt98nZuF25uLaUZ2NAlXSU9lFP/GyvpZdk+XBjUCAwmFFFOyZrYJfOevkcWYry1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyspyy1F/FoOwVF7OBd5TvD2KCWJfuMNGhyLLbAZLLqHpZQKkV
	1c/3U/BG5ur/vkBySkgJ2eF6T9+06DTtHq0riQv90pQ3TNCOaYAHtTuN
X-Gm-Gg: AZuq6aJ86AL0xpUCbMXGFxxdj/iQba7wdBEbM4jSc4IELGAWWil0c5qKA5ghaotZYT1
	9lkuuNZxPwXn12vIYBji0xlcnPfuBDwjnbgYUH90FwEf26TwFuqfyzCSxWnjnLqCrfqrDM2oxuA
	yLXXoJ18/sgZFKpalkjoQClQP4CGZ0ry9cYzt25sCKVtlGIqj7XX/y9XGYIIjVG8kc8bFMLTRur
	8JGm3NCWMx6EzoNoKj/wnZhLRMTT76zhQy1akcbUr3VunzEU1veHJZ7YWsHoj3nwyVKIibfOzn1
	rDeOsymiA4tuLJGYhZ95TFvdafjO5AjPLS4MhDmK5h/qTqfg7OoT3AcOZ3Ct2p61Edyk6tVmYi7
	Top/C9Y6txYT5Q5Ow7QvP7RInb2zkaRSsNb7aXegRkw/PMeBi8lN9whR30EEyLQIXfBROFgF9S2
	IRQMxX6wjpdQb4+1B7vmjVBwg2TA8g6D+ugVwQGxZiz30hQwbBK+3MTZPmdEPPUIbadrxMLj6J/
	a4HfSiLMr+AC+j64DJMTutDSIMh+KyzR+CCudf/MrG56Hn/2I4WfrKQ0Cd8wviaforyKmbSYrBN
	Dq0C/2eIIEENjA0jVII=
X-Received: by 2002:a05:600c:4e56:b0:480:53ce:45d3 with SMTP id 5b1f17b1804b1-482db47cdc5mr123484685e9.18.1770021448326;
        Mon, 02 Feb 2026 00:37:28 -0800 (PST)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm399535415e9.14.2026.02.02.00.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:37:27 -0800 (PST)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: ti: k3-am69-aquila-dev: Fix DP regulator enable GPIO
Date: Mon,  2 Feb 2026 09:36:00 +0100
Message-ID: <20260202083604.325060-2-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202083604.325060-1-fra.schnyder@gmail.com>
References: <20260202083604.325060-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_003730_404477_8060E6C9 
X-CRM114-Status: GOOD (  12.99  )
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

Correct the DP regulator enable GPIO to index 21.
The 3.3V DP regulator was not being enabled by the assigned GPIO, as it
is routed to GPIO index 21 and not 37, which was causing instability
with displays connected over DP or via an active DP-to-HDMI adapter.

Fixes: 39ac6623b1d8 ("arm64: dts: ti: Add Aquila AM69 Support")
Cc: stable@vger.kernel.org
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
index f48601ae38b7..d3677c2c2547 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
@@ -33,7 +33,7 @@ reg_3v3_dp: regulator-3v3-dp {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpio_21_dp>;
 		/* Aquila GPIO_21_DP (AQUILA B57) */
-		gpio = <&main_gpio0 37 GPIO_ACTIVE_HIGH>;
+		gpio = <&main_gpio0 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
-- 
2.43.0


