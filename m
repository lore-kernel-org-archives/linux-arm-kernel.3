Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2F6606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2mKgohEu;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=HCZoFnt0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3AoMLszL75RGaB8VS8iwoRVvxh/ff74HhsxQd5Z1i8I=; b=2mKgohEu+tofKi
	tkHCTTgWKw8mxCvv3bQ/33rAzrsf0Bq3QmHfgljKttUVWpklEZZC0sVg5gxyCc3ft6IPAH9eCkZll
	AYdPe3cARQzn2lY1b2dUvNGsHfb9tDXePgLRb3xebI2UAhyAUGMgZQtN9ydqT36l2SyDCEDT5V36n
	pnxF3MDOSPw2EDupExuyh098emHE7ib9q4uCRceyLoMsRaYHmQcqGuLGqEHpbkmZRCtghPWpFpDuz
	7CH12aeQmUNdvf6gKrNVgb/A0VxQtftKrDC1MoT7Fxvx5aAa6oUjecFmphuVnaqtCyG9KHxq8x10K
	0Sb6B0i+aJXu4geLEAtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyD5-00000009Dlr-3rSg;
	Thu, 05 Nov 2026 14:12:59 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyD1-00000009Div-0Nt8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:12:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57EE1149670D;
	Thu, 05 Nov 2026 15:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793888007; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3AoMLszL75RGaB8VS8iwoRVvxh/ff74HhsxQd5Z1i8I=;
	b=HCZoFnt0oKVbE4zYiGQTpDoBTsip409uGFYWZEYxqpCLpeUBPfD33kr3g8Gc4y9f0UOrWU
	HAP6TQXXCKWF60LM7J8GKeSwgihu61xAxnHFCOSJlpeg6DHIFtp2TRZ50R2v9skT0b37Z6
	wA9BOUQL2DULjn2e1BSGl5i8eiVw+4RT42FdTg0JJuobbd46N7TTD+VAfLq6rSIudoktSW
	VZ4ShS9w0lawaIyBpNJ/WMbREsEj5M3kQEkgquWyypB/FzjgQb+/EaEoZBFQBM8sxUL4W2
	cR6p09XZUyFmW3pRTCDLyeNfmO3ndsYldGPFmLWSEpyBJIkZXkPsde9hTobzcQ==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 15/16] ARM: dts: microchip: sam9x60_curiosity: Enable OTP Controller
Date: Thu,  5 Nov 2026 12:06:51 +0100
Message-ID: <20261105110715.2486432-16-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_061255_313421_8AE52AD2 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.5 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allows to access the OTP memory and Product UID now.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - no changes
    
    v3:
    - Reworded commit message after reordering patches
    
    v2:
    - same as in v1, no changes

 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
index b9ffd9e5faacc..c110a8e87568a 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
@@ -252,6 +252,10 @@ ethernet-phy@0 {
 	};
 };
 
+&otpc {
+	status = "okay";
+};
+
 &pinctrl {
 	adc {
 		pinctrl_adc_default: adc-default {
-- 
2.47.3


