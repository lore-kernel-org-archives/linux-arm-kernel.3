Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2F4CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=; b=w6NmXRa9df72pdolAB0FwecX8L
	xnd4e6wQpvv1LmDpeGYUhqlY1odTDGCDeDSMUOftrzfZCK0IxCSFXymUt+TS/OLLg04YmBoepgxBZ
	R+SKeT1sXq61ZMDUSIj71bOsu/T0FjrgEl4NXk/zZ72aUGaFhd7EsNJlZTEofwkCTAiPq9Od1q0Bm
	iXqT3Ni12II5tkX6WUfOTFS9Fq0exdWuKtEv6k8S8p++Jf19e6+piu5ZXRBk5sBkJSHQLpMvDmtdd
	6LgEIW5+cARb2vSp1t9ZmfMsk58OnbngP4NISLMdGLYsKJEC3hW4eH/M37VequahSHoSFszPO78fd
	RCnby8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynAn-0000000AZQ1-2GX8;
	Wed, 17 Sep 2025 08:05:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynAg-0000000AZK2-3XWt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:05:48 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-62f5bfd0502so3661032a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 01:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096345; x=1758701145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=MnQMhzU4AMI8T3keQwNpS/p1DQLBHOCWdYI7iCSYeS4LJzj5Umtnl2HzjzALlFMjzT
         zVKxdU5bPQ46yJ3CxutSc5euJHgm0vE8BmmcSrpNa8r2+w7J6/GubF9jo+CwlHTJZU2i
         8SL7xAbX/MTNgMPBxEqY+n0cgMOIwDsRJXcOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096345; x=1758701145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=eTkRJp814YmX5uJtJ/ubFGk3/dr15azNZrKaqEiWOYajH9C49QvoGS171IjXeZ3eoo
         frE7mezMe0z5XQQscoiWn27S0MKs8bWlizTOc4E0tZLwAtLu0mphKaOlmW+EJTqHEQgM
         7WFkRQ7+usj+8J81heFY87u4XTfpz02lW6dknqv1JN7Lj5g1XLNeWwC585m2C/7RZdg1
         fMsSZxtJznEuh6hZgEMtL/ZakZYlg71KJp25BzYwHUoUXkOuW1eLoOfDbTMQpwCOs9dS
         TwJ7y21+llfF38xWqD04OfURdbRMfgz4+jV67NXAkTxYsjXMdyrbkD5XSaKHMQIH+VfX
         Rsvw==
X-Forwarded-Encrypted: i=1; AJvYcCVmv+BjKJdcbljNgXhKOZH2HztSHq8lR2VRFfVvh8LTT0PlJhjeqKWV4QieRJxnEEviJUtgt6vkTGPRvWgDU2Hx@lists.infradead.org
X-Gm-Message-State: AOJu0YwuxUpJmkfcgpv037VBz+ybt053xSeOjwRLY4wsp+ja+qdkzpSx
	vByenxJamH1DxfllZdEpEDWDuwIu+o096FQTITzZWBXGI3c7lWLRLV0Es7/VgIS719o=
X-Gm-Gg: ASbGncvpBJRtVJx7CYK1Gp2+bV2WC3Qr13Q5xIgDI85Ox8uNSMjkuBmgE/qGphyNr2j
	jA3zCF1fcCOAKnHYgl9ebVhge8MWAPCy8g3GwRZCgGsshiH2UaxfXH6gSqQOjQXiWZ17dyDkePu
	l4iakXXXN9eDoB1WyIZCggsGS+ORfuzjx6+GgzC83htVnJRGcUTce3GE8NWwGj1haVw2qDKgjIo
	KjgT99jxfF7VcZZDrW07ZxfmxDzBulBSYzS00YRx9K2C+CrWNmbCM0LsPxhmsfYzZ+R8Kpg5ASM
	QoQigCSLRuZmN8/n1taQihjGUHpqDCYv7jBE8kHAB9+60nL/pwW9d11SGMe/khSRw5BbSwaOiRI
	qS8PCwP83dUedFvGxfKyWNRngw6oByA111hvmP8tu2LIidbS6qhYtFsK1tAI=
X-Google-Smtp-Source: AGHT+IFpWQS4pkyL9m52u+iXkDhG4zfzNZwzj6DCSRH4/FjXB7Y5wWH6XeMryYi9+6RpKzp0CFw1UA==
X-Received: by 2002:a17:907:3f1a:b0:b04:7107:9758 with SMTP id a640c23a62f3a-b1bc0e86595mr153107166b.43.1758096344821;
        Wed, 17 Sep 2025 01:05:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v4 5/6] ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold
Date: Wed, 17 Sep 2025 10:05:10 +0200
Message-ID: <20250917080534.1772202-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_010546_945138_1998C3C2 
X-CRM114-Status: GOOD (  10.16  )
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
---

(no changes since v1)

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


