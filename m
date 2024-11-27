Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45820D609D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4erez+OR7MplArQbIopexB2PZBOe/GVnXjpG92loz8=; b=Sxy2Uyt+BRsQr5w8zX8VZZ09jt
	tlFWWxIflr2cNSth6mE6f6gQkCMPxKXLafgyy848WsywCTPiJLXt6TpMbHl0tunmGr3/15m2km2S+
	vzVilB+NvpLj6n7bnFWnQLPZZmXEUFDBCYW46sGgV4hnmSt5QofbketSg4o7/sKelY9YTxfF53gGi
	dz7YuV5eR4UZN13Zv3frmzgHxy9Sb6owBqxdUEZ6NBaNuXgreuDRbugIanjODDQGCYgS1gUxkiYRR
	gDoJF/nVa/zy2qbd/67EPMT2Mk2iHHBUK0p4K+JrwsTUEs7hBIgk/u/wKbYUkFaPxTMtaQDmzb6EL
	ep1nQjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG0V-0000000CyDI-0pjm;
	Wed, 27 Nov 2024 11:14:55 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFnl-0000000Cw2h-2YX2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:01:46 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa55da18f89so400218166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705304; x=1733310104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4erez+OR7MplArQbIopexB2PZBOe/GVnXjpG92loz8=;
        b=QZViVW59Zv1Cpmj0QWbqE6L2QLCp1SdSq11ziFN41yxIJu4vD++McqLRxZjGNN/GYU
         OUzYbub8hldoCcPCuR7iI5+zJkvf6CA1/b/zQl8aYu4KNkuYeJX8KHgIf4+3lsOT/78y
         +DasOSKQgJVFBmrIdTzAev0oZ0JUV+9q28jhgghKOsvLnyNMrf5o0MLMEvKnBvMBbM+x
         qelpmKfN9zTk2OEv7B3bJshiUVm+xPVTlvsAsDdIimUV745ZPwn7ELXo9Mb1DbXtYSLn
         /Q8UN9a4+HrnfZ5FH5hiqdT5Z8lnO5KH2KB0dwivhgL+usA/LMLytWbp++/9oinlRmyk
         3opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705304; x=1733310104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4erez+OR7MplArQbIopexB2PZBOe/GVnXjpG92loz8=;
        b=dwPo101QOkPWi/jNTJH2z3u9d+nc1LlPo91qsZ+Kk9ZnCIhCo1v6WhMnw+Lw1sPexK
         70wtWTlTa4w8pagHrJd9noLGBUSuwXCtfu9/6MkUeqQ7aNReJDoudrkkg6qj56r6LLDw
         cAZZAcPzmYETELHujYRpCOykDAyJ6eeWCwMig+ZfTPkLw2NmmepSO74ZxnEHW8IkgEj4
         9rATCkRjONTl7ET0qhSN0b+6YrDEI2BGVME6TXm0wYEJopTwOfwnMpysNw5VEKrFR7Ji
         0VCsOeKH9KXB++IzydZdBvgMmVTYiPbHGmgpE20OFU/BsCdP/KxLyUsRLyn/IoEC9i6A
         T1DA==
X-Forwarded-Encrypted: i=1; AJvYcCUuMaEb1by7nBYt8mMQ5tN5zqgtyqrkQnhtbPd/qE1/WnUNt8EeMA3C9wT7BksHTA6T216K3yDEvpMdRUg7PH1P@lists.infradead.org
X-Gm-Message-State: AOJu0YwpGKzsULaBpP3qWksQIUWZTDKZG8VfmIacYWH5TgEBhZiXiUeh
	0J7wrJTlJeu0MQyyRVQHvrMudz2H5kiJ2poCOfKf3qJAEELiUF+2b5b6uelAYlM=
X-Gm-Gg: ASbGnctE9t8rPJ+RTWzKxCx8Gc5DMi0yL9OFvbR6in8nytSECMvyD8PLZ3/BWxxKLgA
	yLV9hWROWV5dSOKcZNPZwm1bYHHcFXUEPJHC4meJ2B2dAhHL+6/ZlbrplvROT3V7Y7+IY1JV8fH
	YgFL1WlttFYSfuhOoPWzDURbQmVVTg1Xv5Zuo20JHDbWgtDHXSHuNk/IqzQ4jli1hsl1scOlm7N
	w2ByJ/6GYdRJXA8qxW4V8+j9YeI3jxUi4QzGJ9waFnNWqJreyy/5s5hdFF4yuAvezZ8/N07sff8
	mJOOsDKbWFsSRM5YRZAEOkbOScmjk4sHng==
X-Google-Smtp-Source: AGHT+IGqpdrPnW3Rg6CugXIox+EqlkbBd+gvIfh6uKjWCcF5TRZPn4bamon8RUhLocSTA4S61CGyGQ==
X-Received: by 2002:a17:906:18a1:b0:aa5:3663:64be with SMTP id a640c23a62f3a-aa581028c94mr151558766b.43.1732705304136;
        Wed, 27 Nov 2024 03:01:44 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:43 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:44 +0000
Subject: [PATCH 6/6] arm64: dts: exynos: gs101-oriole: add pd-disable and
 typec-power-opmode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-6-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_030145_644441_30A1237A 
X-CRM114-Status: GOOD (  14.71  )
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

When the serial console is enabled, we need to disable power delivery
since serial uses the SBU1/2 pins and appears to confuse the TCPCI,
resulting in endless interrupts.

For now, change the DT such that the serial console continues working.

Note1: We can not have both typec-power-opmode and
new-source-frs-typec-current active at the same time, as otherwise DT
binding checks complain.

Note2: When using a downstream DT, the Pixel boot-loader will modify
the DT accordingly before boot, but for this upstream DT it doesn't
know where to find the TCPCI node. The intention is for this commit to
be reverted once an updated Pixel boot-loader becomes available.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 5f7be0cb7418..ef9ccd149b6f 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -107,7 +107,6 @@ connector {
 			self-powered;
 			try-power-role = "sink";
 			op-sink-microwatt = <2600000>;
-			new-source-frs-typec-current = <FRS_5V_1P5A>;
 			slow-charger-loop;
 			/*
 			 * max77759 operating in reverse boost mode (0xA) can
@@ -146,6 +145,12 @@ VDO_DFP(DFP_VDO_VER1_1,
 						0, 0, 0x18d1)
 					VDO_CERT(0x0)
 					VDO_PRODUCT(0x4ee1, 0x0)>;
+			/*
+			 * Until bootloader is updated to set those two when
+			 * console is enabled, we disable PD here.
+			 */
+			pd-disable;
+			typec-power-opmode = "default";
 
 			ports {
 				#address-cells = <1>;

-- 
2.47.0.338.g60cca15819-goog


