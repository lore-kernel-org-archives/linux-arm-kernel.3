Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A8FD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 15:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3grBSr7H93iE0zqeBum2PxxsOd5GXTmyNW+XcIPut+Q=; b=wSdf/erMk657ACGWmS9qeQIPbc
	QzUUmbTBsfnUU/VsUGufQse36gm1DHL1W6YYNfV9R1r+dxew7pY6S9/1zfQSYrB6AqHPxFDdy0GmU
	JRPHxu+gl5zA9km3sLLaEsswWBXpYjjD/UiX2Z7YEoGOUL5gBGE6wbjrtwsSx7X04L6p3YcZpXGgB
	T2E6ElDkrrFkTfBxe9tOMemVAFP4tBoJbfRLHabNXGKwHszOXt3FauIvr9d6L86fHHD5UAuzHCpRC
	jfRtb73SPD2sMAD28B3EG4avD1bk/6cRLvUp/lqZ6OcdAh/Ob4i7YdvhvUON7YW6kC6L4JfYOb9Gb
	Waq3j3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOzxi-00000000Yo7-2cF9;
	Fri, 28 Nov 2025 15:00:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOzxf-00000000Ymb-3mTd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 15:00:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4775895d69cso8678545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 07:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764342037; x=1764946837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3grBSr7H93iE0zqeBum2PxxsOd5GXTmyNW+XcIPut+Q=;
        b=CrdFEVbslZDYw1we30x87CMPWmPf4NcO0Jy7RjnCMjAxS9rtV0i98wftYbVPiuwveH
         w9e26H/qbezXo/0HM0r8snqIVtY9vaICPRUpw05NB0/BKtz1fkkBWEv15NCH64mr5IAD
         hw6vJ6ExYqOQCwuypGyXnn611J/4H/8tKHSOo7MOn61ITuid7t0C0DVrz71a03MfqaqB
         xgLhd5B5Wl2I3DSCErF0T0PDUqROP0MTmPWd7i7aCI/oDWQBTIQIqFi4cG80CovKsKIZ
         Gs3HVERWXoPxuF4LGOhBbNWgLF0sNqeI2z4+RotucRXxf+5/Ba/XC8apl+IfqnHIkOap
         GjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764342037; x=1764946837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3grBSr7H93iE0zqeBum2PxxsOd5GXTmyNW+XcIPut+Q=;
        b=qcOVGqLhDlAXivERrJbxJrN1a7Qk+t70Xb9uvS19E4vMRh8o7egQdocpOrGErunoSD
         1KAgkKXJEe+3U37V+ZIwD/Kw9VW7FwX6pHMAGDTWf7XreXFSYl/+kG5gHJ66VAYwcyNO
         hdV4IdHTcIxPNQrakfjSPnhHezw7/jU/xIfutWXPl0EPREZVpvxo+cktUU0/wU+t+PDP
         LRWxNIqiHHGKgsJFHMSFNtv1IMlFPxRCsYsTInKcZ3PWttbnbsa/6g5WSq3MUUQ0hnLI
         5i1ABxlMh71r06OYzCvPLLzbGX3ph2vQQ0MBu8v+llZ8w7RHzEZbVZACYOxOKafxVz4Q
         5G2w==
X-Forwarded-Encrypted: i=1; AJvYcCXb4GxMRMMUR5LR5MoYmLHa9b7BN6uhtgCswcAyF4Wa0HzU7XAFQpTw1CesMWcrh8i2Jix1+baX7pituZMr62JH@lists.infradead.org
X-Gm-Message-State: AOJu0YwtOyW31R+3HQH1RqU1u4PueW1oyKAYcSpLqetlD3lv25KYRqdQ
	RRzuX+SaWxqnlPXcHR8aVgruWeuqcOx30uEibDAbJySbPcZB6+i20LmY
X-Gm-Gg: ASbGnctBEi4Zmyr7AuZ3p2oW4GtTFpTO7kYmH5cuPd21Mffd6kA2AyVEqAlAijuMJnq
	Oevrt5s+yk7b/eOa2uWkfcghEvOv/08GcQMOg4KRJL2tCB2yLsW4VNyU+LSd4TFkWMW5jYsj3m+
	QW+FxTgySMGBEgCPjD9qLeznd0F/dxD/xqaeMiBfVv/u9e1F6c9TKrIlQmYRRJ8+aIr3defgViV
	j5eHfthHrIepsf771ljkl5EFULBveqwnDwQzmiWDNEOyVcccd0kuy4sNCMSfktELg5yMSgOIPKa
	jdkHIdAq/l/sMRKIIO/MSjByaoEiYffRXAF7yFqA8nqSVpyTWHOapeQ0dpX3kH9NA16lR9neUM5
	8bbRlv34CIdLg7AjzQINSwUUtDSkQBZriJWYEE/SC5riqcc1ttWuIEtDaVdpfhWy6ZPo4yj/0b+
	hPMr01b5CdKEfNKIvhkDZDHePrRmE=
X-Google-Smtp-Source: AGHT+IH4P6a2V/tjh2KXwjJUvz5Qdlq1GmBHoCSVv5o2GzhLFLANE09Z8jLPuflofJUEZAkCRfafag==
X-Received: by 2002:a05:600c:1c19:b0:477:7bca:8b3c with SMTP id 5b1f17b1804b1-47904b10379mr201004035e9.19.1764342036665;
        Fri, 28 Nov 2025 07:00:36 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47905303963sm93117975e9.7.2025.11.28.07.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 07:00:36 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v1 0/2] arm64: dts: imx95-toradex-smarc: Fix ethphy1 interrupt and GPIO labels
Date: Fri, 28 Nov 2025 15:00:26 +0000
Message-ID: <20251128150030.35931-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_070039_945021_F4B46CCA 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

From: Vitor Soares <vitor.soares@toradex.com>

This series fixes the ethphy1 interrupt configuration and corrects GPIO
expander line names for the i.MX95 Toradex SMARC.

The first patch changes the interrupt trigger type from level-triggered
to edge-triggered to match the PCA9745 GPIO expander hardware
capabilities.

The second patch fixes the SMARC_SDIO_WP gpio-line-name position to
line 15.

Vitor Soares (2):
  arm64: dts: freescale: imx95-toradex-smarc: use edge trigger for
    ethphy1 interrupt
  arm64: dts: freescale: imx95-toradex-smarc: fix SMARC_SDIO_WP label
    position

 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
2.51.0


