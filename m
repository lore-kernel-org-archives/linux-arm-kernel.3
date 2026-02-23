Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC50EA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsiXdpbaxodmPACgXw5goRGzebyloA1ZJqj/0ZU8ngs=; b=csw3O/rZ0IH8qm8JENgK3AANx3
	9S7epDciSEBww3p/4t3UZqLbCUvC6L8uzaLXuSn54ViEnmlwoNxIP/B+bnCXSN+wSys95WAKnK5vD
	aBG/ojIfzPD2pX4Chcqn9txf1FoK0jpF3gOzRZNuK4RTvSqaiwrUI/SeBPSMdtocA7WwjiBDnytFg
	p9GXBYcDpUROXppk7oM6d/KwCkjgFQ6ExmXyfJq1nroDjLIK8PU6E7+N7hD+aZw/dpTvfC7A9sYnE
	PIlMXcg7DiepqFyB8TIT9e+z/n2hpDvyjKhf8Bz1UvhvTPZo7qvtVxG6NjykrFcPCIeMBUItE9JWg
	qHFjoydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTx3-000000009S1-2KuZ;
	Mon, 23 Feb 2026 11:18:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwy-000000009MZ-0MKF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:18:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2aadc18f230so25773035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845483; x=1772450283; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsiXdpbaxodmPACgXw5goRGzebyloA1ZJqj/0ZU8ngs=;
        b=nf6+2f0RAtfZc0yeJjw/Dhl8w8z8/2adclI4G+2sqYHU0rj91HJJvBK9gN+Z+LfN/D
         TyjfZ9vExyV0hUWi3YO5Q55Z3JizYE/Jx4e7F7xxsNLlFCC8vILH633e0BFpS8TUIr4+
         ds8hTJJdXA9nM/6FLwk06MoRhmlaSr48mNgkM9gHQ/ILbzYugDMWFpqMkhirOcRhifcP
         yzL5q1/qdagadn79c9GwbCyXuT15C5CkSkZpUh/XeEJpaS3dhYTekaoOj6v2m/yshNI2
         BsGeZG1IWBmNAwfAYHnj00MpR685+R885p+eNdTUAGwZjXJZ0BgweBNMY9YHGMWkYkUz
         foVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845483; x=1772450283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dsiXdpbaxodmPACgXw5goRGzebyloA1ZJqj/0ZU8ngs=;
        b=me/WpKyTrAzWQx03AviW9ioHbF61WTeJIgKQcpx6x2WuW52Kyv16xL9WgpiDH7QGM6
         K/Zm7F0uo0iUValE6AO+Grgei+a0J3BLCzsucBSOsuGjsLL0ElMXPLCB5i9fEewzzwBb
         U3/BOnzbG5SiCuk4bWJBs768zuQr3jFvye8n6cuX1P6EGw8IIUp1P3L71/3NJF6ctg8G
         dCaii+uWam3XKK7Dha0WOxXqmMQtybCcWPSeEr2Z0edeX6WuTmJ8POFOqMQSAcDFIAYi
         n7sZefTBbDvcTL2NA24xVrp/t7Z/lKPwCwT2Rp+URHowhAnX4w50GOR6WVuQL6v/oTA7
         JLig==
X-Forwarded-Encrypted: i=1; AJvYcCWS2Z0Oqpbp6cSJj3G2FHnvUiKAaChpx//sqyYrxS+NKePpaQYrVdlBFrjHsswYHxUKYi4Bjl731xr6/zFV6TW6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ywvmExeShnt5Uwhxb/Q5QhMcfa+f1dqWpLlmH/TZuhbzu3Sc
	Os/yUAS1D3JS1AoWsSJBjR9ToDPsWs/EuiZjBLNUKh5udlRxQaXBZQrC
X-Gm-Gg: ATEYQzyh8JwPmpKny9SAaJq71jBmzHFwajIodW2b7t8OG5Wput3RDDMJSPYHvtsT/lB
	A3Gm/WCE4lsa1Ln0r25IDmjRKlGUu78S9H644R7oJ9hpiZXLTltdwPd3dduVntBDL+Ss4fZJx3h
	iRx2qhX12e2xwSQPgapK+oSnpS9aThAXANGy6T6f/WZK/bKcu61Wd+9ttOefwIFdzuuNrRIWLq7
	kPZ6qGgUJ+jZaDceJaRZqJ1MdiBFkcCuPJHX1j0In7PIjw9wxFrsV+7cStzrHur6N1g0l4O+R5Q
	ADu81Yy/0ZZ1HL+Dli/m6d9kLYZJhhneA88gi+6ydprDl9OBvtekTKZ4wNyqgMIpKeCY51Qx9IF
	ri69DGxsb7ggaRjyGX6yEzxIWrLKIMH9k74efUpstUSAqbmKJO/N0DRAOC9Rsss09/qG/YPu6fN
	W/WEUm07WZxUBjTQ2cNAu7VgtWF8CWeN8PMoqsKrnX0PtMU36dzMzmFbV7kf0r3uv4iPj7DI6QE
	mA9bVe1a3u6W3YGqjgmjrQ40dSoNjZZQ7i2t9POHTeivnPavF1vOJRXy7evb3BaQWH5bEcYifKD
	AQ4I8omXelphWtrOS6n8
X-Received: by 2002:a17:902:e787:b0:2a9:3396:738 with SMTP id d9443c01a7336-2ad74547d8dmr68921545ad.44.1771845483320;
        Mon, 23 Feb 2026 03:18:03 -0800 (PST)
Received: from 2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net (2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net. [2001:b400:e3a6:b683:40b:c296:4cb:fbc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74d36911sm71799335ad.0.2026.02.23.03.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:18:03 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:17:40 +0800
Subject: [PATCH v5 8/8] ARM: dts: aspeed: yosemite5: Fix host0-ready and
 add POST end GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-yv5_revise_dts-v5-8-fc913e902488@gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
In-Reply-To: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Daniel Hsu <Daniel-Hsu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845456; l=1455;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=P2i4RUSnuTwM4qMzIUSQxtFSgvom7jEQkHy1XI4WFDM=;
 b=xv1Y03YbiEGXzcYHlj+4WLx07xcTFFPqHjWjBt42NZFVYg2dQGoaEw8BUJyJHNk2KzYXQtGWo
 e9qYUFJnNgUAxrU41c+DOpPaQt8tuH+8pHoEkA/x1JumLrfVuYun4Yt
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031804_168634_3677CF7F 
X-CRM114-Status: GOOD (  12.45  )
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

Rename the unused PWRGD_CPU_PWROK_2 line to host0-ready and move the
previous host0-ready GPIO to FM_BIOS_POST_CMPLT_N.

The "host0-ready" line name is used by OpenBMC phosphor-state-manager
to determine whether the host firmware is running. The previous DTS
incorrectly mapped host0-ready to the POST end signal, causing
incorrect host firmware detection.

Map host0-ready to the correct power-good signal and use
FM_BIOS_POST_CMPLT_N as the POST end indicator.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index f590ec6e00c48afe4ade1fb98011780ac0570e7c..beb971eadbe53b5d9fa49252a41bf7484a8e32da 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -929,8 +929,8 @@ &sgpiom0 {
 	/*bit0-bit7*/
 	"PWRGD_CPU_PWROK","SGPIO_RSTBTN_OUT",
 	"PWRGD_CPU_PWROK_1","SGPIO_BMC_READY",
-	"PWRGD_CPU_PWROK_2","IBB_BMC_SRST",
-	"host0-ready","FM_I3C_SPD_AH_SEL_R",
+	"host0-ready","IBB_BMC_SRST",
+	"FM_BIOS_POST_CMPLT_N","FM_I3C_SPD_AH_SEL_R",
 	"PCIe_HP_BOOT","FM_I3C_SPD_IP_SEL_R",
 	"PCIe_HP_DATA","FM_JTAG_BMC_MUX_S0_R",
 	"PCIe_HP_NIC","FM_JTAG_BMC_MUX_S1_R",

-- 
2.53.0


