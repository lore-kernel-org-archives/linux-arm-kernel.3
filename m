Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5A5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 12:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxHvRU79mZPg7YVqFDPmYG/fyVRd96eq7pLfVRnFKlQ=; b=xYgU1EPLbh65zbOhOirpBEXxA5
	EvmfGn39Dc6s12B944FRxEJ5NN51aaCMtuWTxk6H6WXbCEfO9x0APdRzt9gQvuUZVUFKs98UEiHPo
	yDjYDU9T/Gqs3mdhHOkalE5PI2rgWo7vjgwOvT/8ybeJ691d2sscwY0aPHunklScHZckUn/Us8LiL
	o45CCYZAeRcAFlGeMblqv2sTiPqzhB1RtmBatKu0q+kT4Wn8HR6O6n9Z6nVLNJ1cH3U8eYVSajR8J
	cs5WG8SjEL+lcdQT17sq1peQit3oHP+ldp6CYUPMuvYXsiHFJY0IONXOfiYSVJqgaBo8sOXeAW8g6
	Zp+mxq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWx8x-00000002fuL-0ssz;
	Sun, 12 Jan 2025 12:32:39 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWx6V-00000002fft-3O7j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 12:30:08 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3eb8accbde3so2163156b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 04:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736685007; x=1737289807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxHvRU79mZPg7YVqFDPmYG/fyVRd96eq7pLfVRnFKlQ=;
        b=dKlo/3r7HG0wPu/knKTCXzFLyoo+j/EZiX12XNLQ29c99UJSTsxET9+GWpddkrnGkM
         C5sfY/D8D2fUTp8V5XeqvjMsfFkMFleIS+b0qtokGHeiTtIaszf0YWF38Nw2Qni3q59f
         yVkrjebU9Vxp1bLQSLtmV9K+2tHf3iT8QfNDtI4wxd9jiBb9lX66ZyjJtOB0aGrP+y6k
         4eZGucZGN2L3UNFgN0ISlEpNHc35AdC2TLwCabTkeoxI0c3L6rc+FHhVM3wzwGwwcZXt
         1ZN1/X0xB7kH64oYbevYtHOLwKgPXD72+iCgMvOYxzcxDLr1+7vqSU5z49CzNrbKHorb
         dr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736685007; x=1737289807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxHvRU79mZPg7YVqFDPmYG/fyVRd96eq7pLfVRnFKlQ=;
        b=ATYZDIgIADJK/eStnofDIdwU5VcHK3n3RSFw9i3nUI1RN7hNwdmp4KBb+RoVCVZTkO
         y1Y4tcuVSEO1V9g8cRzTMo31eqCO7/Yi17bNE7862j4DwhuOQVAhX1LQuFXqoQw8yIlr
         VTYgCxNkARYmf3Zg9ULurie0FFYtwhEf6Tl8QgdEd2h75fM/7XxHAWTHPW3mOKcqSpGQ
         pKFFJzFURVisgpX+3XaQV97EB7UOerUenPvDytpQ3JyHfNRGFLrdisZ7K29CxaY1MgXO
         zapMIDlSWEgyS1DHkrEPqTcoLRuebq0pwYuCn7q+QzP7BnKZGH8p0G7I48MKYWRvLBuJ
         7TDw==
X-Forwarded-Encrypted: i=1; AJvYcCXVTYvT313CvwX38ZcAuacxnlWWx5c7m1MWBrekh+OvJKBgsz4qHQ5Ed8Sub2h04beXSUAqdI1XJ3IosKDXNtEO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvp/LIS0tKYwJmB+oNMXTdgO4KDLQ9V/0nld6VxwCbhuzrqa2j
	dCkh5zJBxZqGzhMuPjgDOkyWgdrr/TGS4zZIamatFFwQcVr6cU2I
X-Gm-Gg: ASbGnct1ImKjbXqEDoXI0OJ9fBJk5iYhdLSJj5s2c07xzbGJiblud/VoHy5Ei4Qrg8v
	VTOS0xB8JO/WdDHMgaRR7zA9moL5PzsQ5ErIcny7W53KFCk6bRd4o3DLPSH+/ip6U8j2qc75coG
	1BQr+Gdy4pO7hi2czDRaoyzNpug5p6kdNABuKuU364cWjxl8NjoC3e4aNx42rK0yWvjozmFSgmM
	CwvVNJ/TN8oYGb9YiUFsQaM3Zo4cva1YO7nk4sSXWK49tIPJq4LJONXGepWiBwfp+o15Q==
X-Google-Smtp-Source: AGHT+IHBEpxax2xMY9nJrTyjERREv7VKhbMGJmdVOS/eKfcaNST6ATYJ5Bmp1DZ6uORogDWU++riWw==
X-Received: by 2002:a05:6808:3945:b0:3e7:bd4e:5b98 with SMTP id 5614622812f47-3f038359e56mr5897262b6e.0.1736685007081;
        Sun, 12 Jan 2025 04:30:07 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c53:b609:d83:9568])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f037653ff2sm2196609b6e.13.2025.01.12.04.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 04:30:05 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] dt-bindings: clock: imx5: Fix the CCM interrupts description
Date: Sun, 12 Jan 2025 09:29:39 -0300
Message-Id: <20250112122939.988309-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250112122939.988309-1-festevam@gmail.com>
References: <20250112122939.988309-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_043007_847104_341D8E8D 
X-CRM114-Status: GOOD (  10.80  )
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

From: Fabio Estevam <festevam@denx.de>

On the i.MX5 chips the peripheral interrupts are represented directly only
by their interrupt numbers.

Make the CCM nodes to follow this format.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/clock/imx5-clock.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx5-clock.yaml b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
index 423c0142c1d3..ad03c0a13e64 100644
--- a/Documentation/devicetree/bindings/clock/imx5-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
@@ -46,13 +46,11 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/imx5-clock.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     clock-controller@53fd4000{
         compatible = "fsl,imx53-ccm";
         reg = <0x53fd4000 0x4000>;
-        interrupts = <0 71 IRQ_TYPE_LEVEL_HIGH>,
-                     <0 72 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <71 72>;
         #clock-cells = <1>;
     };
 ...
-- 
2.34.1


