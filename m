Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9E9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhHQ34ucfgP3gbwbph5XNn7ZzhoehEkZZGHdIdb2gNk=; b=qZMZYzbjplovDt8AGHmyaP2XVX
	W5My2Gk/3W3QOaqszXtL6ePpHpzUHaLllrThxbA8jGnNFqyM2LlnOL1M9vNtcQqBvDF8+MD97wIzU
	WSkOlfQOFF2JnJqWTcWJ5CKMSRBTdN1Y9sHXPNFgxEkQ1DUXt2OjDn4pV0C+gTtwpaG7FVAPCMIL0
	t7LwEi3z86W9jxT/TwUbeTaKqRCBN7TwcYaRyzyQBZzTB6Ml+N5hPkqLSH6xrofQX0eoOSihursUh
	rGcpF83gNdnUrCSVa/NiVlPHMwpYY17Y0cLZnwB+IMApAqC7VIf8r855RpkEdHeBDHYZAg6u99tSD
	haTgP8dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTZ-0000000DVRt-0kk1;
	Mon, 06 Jul 2026 19:59:33 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTR-0000000DVIm-3nuf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:59:28 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso773590a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367965; x=1783972765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhHQ34ucfgP3gbwbph5XNn7ZzhoehEkZZGHdIdb2gNk=;
        b=BleXgbd5h1e3xQuGEajnFF8Y2bJNerdhmPqntUmbeO83FWUEkJ4OYGThV8/Kc66A+Z
         9nhPQ/ugkFeJZoPkO8Y3ptOsGZCHSvcPxPNWYAgoJnraotQPI64+ZvwXAPmFBAkCUFQP
         XNWiklYeTi4HWoWt92vVCVo3alsBzEUGO1kQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367965; x=1783972765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OhHQ34ucfgP3gbwbph5XNn7ZzhoehEkZZGHdIdb2gNk=;
        b=GRkxVLVzgLG9Bbdah9ZiXfyYjL+iY/GVPwo6ZFWf8rPS+NY+vLvWSWfiDGUW51dFzg
         ZZ/mmZ0EFl4McxRPj3XmDRF11tIphj9eC5DQluVGqhizf1IDUO4T6Jg63dmoxeQ8lwcD
         o7BY3HDbeRv+gI8WoxacFJnx7loeXFPXk9JCnt1PP85KT5c018IwtQ5STZTrIpqQosjV
         7tYPzxzpYG08cT3QwH4TbMmOeSWf5yZSe+wMI84/1LLVy/vz2JRWa5zA2hE4/6chmSG3
         expU+ah3DHmBN/ukL2k6ewDayWDHqFRXQIcWY77r11E3SptbSqALCJvQUYWF9yg/E93O
         ysBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7wepY4jujx+axpBCbbiC8ascR94JP0lKW7K3KlVrFCgD6x4NLGbWrkdmz0GGTNhwXYYVJqctzPWcLXbu44rmd@lists.infradead.org
X-Gm-Message-State: AOJu0Yz97St8uehQP5vhl1LaLI8+0Be0yAth9GQDO5x1mYbGEAI85VFS
	y01g5YZYSVJVtVUryUGwtpP5ycc256Pnvm9qvVytsLUkq6qHDUmlY/H/iN8hLqLlqw==
X-Gm-Gg: AfdE7cnZavKWIgsI/6GHsbQ+T8aIQnPn/VeDd9Zckj3GaVpCZeIP5iD1cnrU1vZ4+KQ
	mcU37ChfwY7KNnew4ZgJjYTD2ZPaed6b0P4JH1x4BkggqwCLo3vTChYw4O222u0gep/QdXNVXXo
	/NTI4WfbGZd4MDbAkBQTVBsDKYyAbRd8X1FoNsYmUFmMACUhJs3DP8N1jDfyEIT7qHU9vR8kZvw
	9EnpeLftV6RN+itdf0be/NrvLsePNFcWCpqTBZVawuVjjRx5gvBRcWBrEjgwL4JNiSJk4B3pHdC
	Hojo5m+7xV9yE2Lx3cNzPAW2M3pqDX4YZSeFWMCWYDufpXT6+DWpRqVPASaVIzdkvmhFNakdMMq
	jW/JSiw3qS3lM0BacEik57WdB0cGk46AewLCQ/ThqysDtZigxMtMQrcRf6NRjRd1OdXJKqaHIu0
	f4vSI79Tc=
X-Received: by 2002:a05:6830:82c4:b0:7e9:fc62:1e0d with SMTP id 46e09a7af769-7ebb233afd1mr1278586a34.18.1783367965005;
        Mon, 06 Jul 2026 12:59:25 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:23 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 06/12] dt-bindings: serial: snps-dw-apb-uart: Add RV1106 compatible
Date: Mon,  6 Jul 2026 13:58:02 -0600
Message-ID: <20260706195818.3906949-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125925_977956_B3A5B4C0 
X-CRM114-Status: GOOD (  10.44  )
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

Add the compatible for the UARTs of the Rockchip RV1106, which are
compatible with the Synopsys DesignWare APB UART.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 49f51b002879..c0d0524458c1 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -72,6 +72,7 @@ properties:
               - rockchip,rk3576-uart
               - rockchip,rk3588-uart
               - rockchip,rv1103b-uart
+              - rockchip,rv1106-uart
               - rockchip,rv1108-uart
               - rockchip,rv1126-uart
               - sophgo,sg2044-uart
-- 
2.43.0


