Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5994C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 21:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mq/fIWFrC8Wf8aflDG3c+bHNDMcwMOJsMYCo8Rnm+2U=; b=SQQ9ID/KxPN5V2f9itO4kBd0EZ
	m1ALZ3ggnN5A5iqTcC4JNJYa3IfYFzIclZBi0zqDvf/IWKNMJsWjAHmGsB0Oi/tLVYX47f1wiNuuC
	XqXkDGsTm+FOcoI7WyuhcB7SImIKn2Nt0fsn5WsvUnwlBIngJMdXf1fYN5QuwqWcjetKLdEPUNZKs
	ZTeJemzq+ktHJATDz6q0wZV6bi6fMG/Qm5Lnr8gAPWXm3IdEZXwfMw1SJuF5ht8/X/4mMOdelUpkD
	1vhsn6Uy24uej78Zq/aVuY3vCRaUq0lHL/oMqgccH1XWgRRxJeQHH01OAXTBS/RwEoWo32Ii9IVcA
	Q2W5nfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMGk-00000004DMV-1duN;
	Sat, 15 Aug 2026 21:50:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMGh-00000004DLr-2YVx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 21:50:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cecdc24b1cso4273795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 14:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786830619; x=1787435419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq/fIWFrC8Wf8aflDG3c+bHNDMcwMOJsMYCo8Rnm+2U=;
        b=EnDH7L7fSc7y2wuasxP8vMnDy2UWG6Xn+WTVQW5p5ao+0fhwv9BZYSh0QAj/GlrY/v
         mi3WTMtHD+Rjh1Q2IRLOqTG/73sWGCnp1zKhIBBGiVfC7FVdT7f3wNYXJyKdFaAMfswD
         npx/jU7nDyjZlSnLHdpJ5AgXEUhQdwYx7gtqnpSP850ms5QpbCvuojj/xejz04cSxFXV
         eQ1wR6Yqy2AxvZ4U9vccBgRTolnFFchVweqkWO5Ls0cwjNf3/v2645pQEYQZmFOtLhMO
         nF+d82iEdu2opn17qDchsyunKdjNhZybg1fyEXJYqoHJVW6Zd7v4bNTZBfli9h+2A8UR
         opNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786830619; x=1787435419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mq/fIWFrC8Wf8aflDG3c+bHNDMcwMOJsMYCo8Rnm+2U=;
        b=Q1bykNZFDcstaaeIO3CI4qFUQjZgB9Q+e+iv2bexYxtI7FZNUoxaKxfIewNPmsc0Uq
         NTV5dpWIcw/e/jPp1nbCM61ZHXYbirBVkoDAz8/1NCF8uR1Be2eEBA2aqv9z5vkWdrS9
         iYLiod5EXg2izZr7tjO2fKmLHUY3JxjqHwOAoGCQndTEyJByInhX788TucT6S7gStREC
         VJsFZ2wO0pX5TaWGNAbhOkcKsXqA8Tj2AQFvbIrrR4gpnZmK9rI5R+3mc6GeRRR1c9zC
         5nCXZCzzDCNu+oj1LWNitMX9Y9sDUiP7h8XyLiJsQojoDks4+EVisVMY1H/ty0s3mhrc
         swog==
X-Forwarded-Encrypted: i=1; AHgh+RpGNGM9mEg1r5ZtVHJeZNXhpmVApkyRH+vWsWUB0YUKVb27v4ArFGsKVPTqWWLtF2pagXuGi7Ab5k+FKEaAIQ/e@lists.infradead.org
X-Gm-Message-State: AOJu0YyBm+3pdK/BIE9/m5pF5WGe54bJrCQ75zNpCLFr4jueDtZ5S3aY
	gx62ETls5EPlbycavO74rQpO7E4EV2Z3DneL/vrajoOwLBgUH/D/9Bmi
X-Gm-Gg: AR+sD132au0LIZeIjuhSHyhPYPhpR++YpCGHrvB7XHcAjQOf7udvOKJOeD2pA5smA9f
	zFyPh3W8uJ9uPt1Xo5H/EtMkV2FSowVe58EcMLNaXEC8Q/u0nW1kDHwunF1gM7Q8kYcYeqejnKr
	FRlvC3xWrk+7s62IJR8cs0ndJ3ZSPcyQ+iTBokCnDN/dwOAfkP9ciVHIauwe3gzg5f7dd4DYBjb
	SctH22LpjSmxkEm/GjPwWM9zwMXpNh2epfVU8itlQTqnMgT55OKB+ufPPSRt7r6kAD/XDBSE0Ip
	vumcWd2FERSbpGecu3IQkqm1ujcOhJuoiVC8lUYp9F8kYCSL7xwDE3r6KOs5l1ZtHtk2yWq9BUA
	tpoZjFU3NLfRr6TF5Ok9i+PnoFtyrPUlZ/0QRrWQr7wVqn4kS5HuWbV7raRPymMNdfi+cqttbg9
	AMzLgaHsMb8l7JLX1gzjt7472jYD/PD6r4dk+kx3X3ToHn2dnvEF4xPcgqf0refnsW5g4M4O25J
	XKFAyOegaw=
X-Received: by 2002:a17:90b:4c47:b0:381:28e0:6248 with SMTP id 98e67ed59e1d1-3933b6fa584mr12370734a91.1.1786830618690;
        Sat, 15 Aug 2026 14:50:18 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388b2554sm33541829c88.14.2026.08.15.14.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 14:50:17 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 16 Aug 2026 03:19:31 +0530
Subject: [PATCH 1/2] ARM: dts: ti: keystone-k2l: Remove obsolete
 ti,davinci-spi-num-cs property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-ti-davinci-spi-v1-1-a7f57dfd5262@gmail.com>
References: <20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com>
In-Reply-To: <20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786830590; l=1015;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=XFoqZ+z5QG7ECO6zr8uQu6XY/OuKqIE2k3KDt9TGDaI=;
 b=g8WO4io71QaI4Ew5Y7WTJ0khQq7KbCNYzY4E/lg3TJEguYq3S70aKQ0/uzAD/IV01GCnAsVeT
 Dj/b6W3jGGfB1M0hOTZXP0IfuLKzaK1jBQx4zq21KJVcczYoUC4qh0e
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_145019_659646_0EDD2EB8 
X-CRM114-Status: GOOD (  10.24  )
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

Remove the property `ti,davinci-spi-num-cs` that is present in the SPI
nodes of keystone-k2l.dtsi, but it has never been documented in the
bindings or matched by driver. Driver relies on standard `num-cs`
property instead.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..65fdb45e8368 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -400,16 +400,7 @@ mdio: mdio@26200f00 {
 		/include/ "keystone-k2l-netcp.dtsi"
 };
 
-&spi0 {
-       ti,davinci-spi-num-cs = <5>;
-};
-
-&spi1 {
-       ti,davinci-spi-num-cs = <3>;
-};
-
 &spi2 {
-       ti,davinci-spi-num-cs = <5>;
        /* Pin muxed. Enabled and configured by Bootloader */
        status = "disabled";
 };

-- 
2.55.0


