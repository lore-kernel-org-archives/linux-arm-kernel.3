Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB5DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NdjO+gXNbFswOlU5mvEFI+zF9XideHYOKEcG+ZI2j5U=; b=Ys8Q8OLpYSqQ0HIExwwPTzo0B0
	ZrJfiQiyF/fu5fnCMyhXzO6dyXN8/gbqLc9EPKwqFvFVAqhmlB2RXl7UxgKs/9YmTTbNLNfS5Yb1C
	0lnEtm0KngAAUddsc9zBhTiBA8Or9CdH4njjSHY+xKK12J/DD8bMmlF4lzcP+l5eRPgrL54KIcY9b
	HEOpXkEkinw6jOm7LcKrZmGW4QC34S4+1GxGqfOV6zgij436jawpPE9HZp8XF4tiwJD0yOfGfULiD
	RMOgEsb3slfpU1U78LyzN2tt455jU4MhijeHKcy8K1O2p19tL5mIyTvNUAJUwLIKNzzFMqgMalh8o
	bpSNHEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toLQh-0000000DsN7-1qHo;
	Sat, 01 Mar 2025 11:54:51 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toLNL-0000000Ds5W-3zUf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 11:51:25 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e51e3274f1so718869a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 03:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1740829882; x=1741434682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NdjO+gXNbFswOlU5mvEFI+zF9XideHYOKEcG+ZI2j5U=;
        b=MF/j6DCspXDyh5vpCEk+7qORTuFt3doQnMt8tiYWCY+YPfgs6dKWstQn+jkbmg7FLj
         kyMLvXMK/LS1RpSfwgfF1Hd2xXQvcAoV4Wk8LGCGQDA8uh3CGa9laH8D9CJ2uS4zrYjD
         EQ8TlXtlFD5PECRbpiPErVng7jbgrP6nS5vxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829882; x=1741434682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdjO+gXNbFswOlU5mvEFI+zF9XideHYOKEcG+ZI2j5U=;
        b=bWmT/HQAE4hDscWKNRGRnHeMAD08EvhYaR86dgBtkaqsOU5GaxLi+JeBV+RZIhcG6v
         coGU37BlkBgDptBlIv6PHMijKeDyKXBPdCDNEfwkU1/HxgJAiNiF5qtHWLUIsVz7Hm/8
         OSog2YhXZwsWMekkoD1r1xbqgS963GENOUNGLEAhd4aEfZSoCXqgrvunuXVkfTTYv74u
         QWwPe7DiLRbV++7DlchzWpR16Awp4ZIEjutSxvRIWS3caIyf4lz6qvqRRaNVPuc3OT5S
         mC7S3/qObV6P/CSXpglijod9/Ea79xRxzJDTdvjBm8KXN6Qfgjb2pdAOoQyFuqokGFTx
         kZCg==
X-Forwarded-Encrypted: i=1; AJvYcCU1xXGbCIvUvcCfRfJ+/9Dw1OlG0e0eC8mKNvtDaHDuetcivWF5FuZ7Z0IrkkISRsFTVYArktF0nPPJvKWtqTEz@lists.infradead.org
X-Gm-Message-State: AOJu0YwOsCeyZKDYZ+syy5O9RVdTrinNrdCAMp9EnIGA4PI5QHjgQHqS
	QEbPF7P04bsqNncUPXeqn3REgUSo+N+z8MOhtrqbUGJ76A0UIxjNMdrwKMz6DaA=
X-Gm-Gg: ASbGncsA1f8r0bybfhGOxhLqWJ0ZzliwUBngki+i01Gp5fSsFk0UpQkWZUaOEwBuO7k
	2E88RmaMMhs5D+6hjuXdz97BvAkD0Q1SXhT3Jnx5PbPzXQw3yJQgQN0F1piwPVWLSeFObD9KvpM
	bc7dqJHNkOx+IAQie2uinZVIizZU3wBCMnEuqmieY23+peMZ2iMlM4Gyzl4q8zefRKpw1GDCY3R
	P3KiK83ReGcnEIgU1MeWp565f5OPCJsEsZP+PRwMS8oOSDIx6GcnyPch/WCZ/L8DXnt8288Tx//
	vdnNW9JKJzhvQLfMoyNS5uY9QXoY8E904uzEr6Msf8IpkKf5kRXaDbnf60MkuozqNiNaFvBdQlk
	LwWqIhyCe3bpvQZw+hxXLrOEX0/F8DbuE+WExrb6f76lNdKq3BWaN70+pD416h0SIpJNIHdrklF
	Ehw1L2MVgpM5gndw==
X-Google-Smtp-Source: AGHT+IFx+Y86kAQg3tCp+lkyRYenJ1ns51tOtXrb2wDfJ/ON7EhmhRzo9A+jgX7mXFnhM4YOd6kA8g==
X-Received: by 2002:a17:907:96a2:b0:abe:eebf:ae54 with SMTP id a640c23a62f3a-abf25fdbdb3mr715780466b.20.1740829881379;
        Sat, 01 Mar 2025 03:51:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-25-102-201.retail.telecomitalia.it. [79.25.102.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c75d8e8sm460994866b.146.2025.03.01.03.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 03:51:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] ARM: dts: stm32: use IRQ_TYPE_EDGE_FALLING on stm32mp157c-dk2
Date: Sat,  1 Mar 2025 12:51:09 +0100
Message-ID: <20250301115116.2862353-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_035124_006352_C036A2A2 
X-CRM114-Status: GOOD (  11.68  )
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

Replace the number 2 with the appropriate numerical constant defined in
dt-bindings/interrupt-controller/irq.h.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 5f9c0160a9c4..dcf17c493022 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -11,6 +11,7 @@
 #include "stm32mp15-pinctrl.dtsi"
 #include "stm32mp15xxac-pinctrl.dtsi"
 #include "stm32mp15xx-dkx.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "STMicroelectronics STM32MP157C-DK2 Discovery Board";
@@ -67,7 +68,7 @@ &i2c1 {
 	touchscreen@38 {
 		compatible = "focaltech,ft6236";
 		reg = <0x38>;
-		interrupts = <2 2>;
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-parent = <&gpiof>;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <800>;
-- 
2.43.0


