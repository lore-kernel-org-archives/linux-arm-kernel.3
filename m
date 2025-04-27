Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B199C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpQyYzT4X9HKnHUwrDxKtpV4uiqgR6fRfhBMNjhjrS0=; b=XFjFbdpcpVyWoiTMqhWKkuB30Q
	gM3fzdgcI+r/pGoIc9pp+KWQYicdfU08dquW1cyHLbjEVwfTYhOz5FyPWGrzsUoQ4WYksE//4FRo4
	PEJCmCx7TmiJfP8tOaR6bhtRaKT8jTBHcxRm1r2J4d6cr61K8H4QKMZQv7pT61BuhKpsXcCj9HOej
	50FQVYp24h85/O/42QrZ5x6Ancy9GwsQHyQ1633yM4NMjJvyHv2z0x+1tniw0dgwjKj348jiG8NmS
	N1jONkeqcFo+VUgqFk+Y0KlQgHA/FApmoL9ag3RlwePePxclB5sPbOJ6O7fiyw0HmhUFlua+CmO+z
	mwUyp/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wm7-000000037hI-1KdN;
	Sun, 27 Apr 2025 07:50:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wgO-000000037DI-3JUy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:44:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso34379025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739851; x=1746344651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpQyYzT4X9HKnHUwrDxKtpV4uiqgR6fRfhBMNjhjrS0=;
        b=ZJlBJveRwB3NAkrtrC2vC2V5pj7rL0ib96s9rBw+YZrI09eSKicTw0utFQDMGNbYQM
         nsofMeAaeK0wik/ZhX78ao/B386Si2LsmilBhqSh4bCiWs/0gzpYGw0ZZWjJyjU45a6N
         N9eCJDnASvh8nfPKyDRs2o2mMz4fxt+KAdfV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739851; x=1746344651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpQyYzT4X9HKnHUwrDxKtpV4uiqgR6fRfhBMNjhjrS0=;
        b=q8f1W8GMh+V7jL03WZhA8X4x3ZQ5qpRe6HHCKnXXMRn10b0J99tZLP0xakHdbCqoLX
         sxrT6y01bm7om82C9AIU/+9D/U67qF5rww89FkBOz6cOrw1sGqiMMFxgGz3gCyKiw8sM
         ArATOmYHOHTooIainOrs3fgfaUw0iIkFCiklOelYCUQJ/WZB29g1AuE+D5MAysCDpKsB
         N9/WsZ3x/NhbE2sGRzOeyVx5OgNAq1LSzrndKmqjmIsqZuRpPA9DX5I62RuRI8a7Uvrx
         +g6SfB7FFD3XeojrbHk43abkD9z4SDv6DmHLuhArgaClQQ6wl6zUqKeyjB19kh/4NdlN
         aSCA==
X-Forwarded-Encrypted: i=1; AJvYcCUkQ5X6rpKrVd+6crobHGEiTh1Z6/RcMM6BRm8jfmjPUoVR94dz4VMmH6bPTcIA+/v4samaR7729hPid4E/tV4d@lists.infradead.org
X-Gm-Message-State: AOJu0YzNLjEBTzaYy8oft5Jx5eZ0tyogvO8f/Cu1EFbkVY0XJazbRGRK
	0fFIgAMPmhagxeKQTg7WUeyoiqEd8KxDFpr73YQSTqMbeUqptwy14gh8zDhigq4=
X-Gm-Gg: ASbGncuVNxzDF+r3enISst2r5DqCijp83CXE8kpWItKyVayL7yfaoS0f4cj9qwf2IZ4
	4+0aUR2xW5ECeNK7fGSfTRms0LKnEWmvnDbAEDZ5b8llRHofhLEqNRXObNxz/GHrIzQTC+x2F8d
	e/0P0QvEGBV2ZKUJipTmoIFDiyfBnd6P0RGody1tPX8dBVl5uGdowaf45gQqdad9PhTjQHYtASs
	ou3pQryghRq1cZAk6VDz8DUgcYVzuikOyfwxeILn280739haJgorBaPc7U/axUGmX6oQi2Yk75T
	PuEcy7Yf/CBaaV7fY3fzMEbOYGke2ONwz8wAuHWReyi/J6gRQLvCzyTIrkWnhKM5V026Tq3cB58
	CBK0nLw==
X-Google-Smtp-Source: AGHT+IHnx27fFK0oDHbVYzNEsRJgFRPiklQgqUZhae0lH9ygvIp4VX+fSkkY91P89JAIMZaLdkoxOQ==
X-Received: by 2002:a05:600c:a15:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-440a64c159cmr74150165e9.2.1745739851229;
        Sun, 27 Apr 2025 00:44:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/8] dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
Date: Sun, 27 Apr 2025 09:43:21 +0200
Message-ID: <20250427074404.3278732-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_004412_827624_503DB0F9 
X-CRM114-Status: GOOD (  10.52  )
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

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 MByte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 5fee2f38ff25..75ef877530f9 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -42,6 +42,10 @@ properties:
               - st,stm32h743i-disco
               - st,stm32h743i-eval
           - const: st,stm32h743
+      - items:
+          - enum:
+              - st,stm32h747i-disco
+          - const: st,stm32h747
       - items:
           - enum:
               - st,stm32h750i-art-pi
-- 
2.43.0


