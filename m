Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2D3CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxV53FKG4HWP7RwRAnssIRH6mwl9ZfX/I+1CZeHHk4Y=; b=OXW8m1VZA9paXAGTSPhsreZ1XS
	3tLLZFNxbcOt5rAVEmB/eIu0W3++a/+wjF6XaDUOlHN5nBNL8MgdDZw3y2Vacg11WYSQBxHWb7fbx
	eZ6QlqFeoW6trD8quwybQCSReV1TrwwYN6BxF2yp/xDSgva3yRr5i9IKrIebMZ269eiDhKwP+AR7s
	iwxTZu+2cXyvtLWGcBItruc7qTFuFf80D3jD7GLUDCNmSejxu9b5nLDVS7NBUmlwvq7QuABudVJ9Y
	lu/RdePu+syerTLgVxOeWqy9MnLE0ZfO+FleJjmziLGVQms4NVGA5BPZeQBkgFia9a7GjZdyBCOcT
	EURxoZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguZ-0000000EadV-1dlX;
	Wed, 03 Jun 2026 08:25:15 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguW-0000000Eab5-1SKJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:25:13 +0000
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46019b190b6so1501563f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 01:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475110; x=1781079910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxV53FKG4HWP7RwRAnssIRH6mwl9ZfX/I+1CZeHHk4Y=;
        b=TLfNrUHGI18VneIRtgfdsNnVOQmiTMAKdoY5au/jye+xHPbT0WmCXfJ2fqNFEMkne2
         j1ap1RzvJnWEQVUY8timpxPqZa5v/hSf8Yi7ZSe6FQstlp7xlLwfIX3YQFN/3THhIaWt
         V6fnW+VqHPxZjjurM0Uf4qqzprhHMRxjsFm3GuGDWZmXp7uhS8vqwDkRBctcBLVRCzVy
         BnttFiAuYCrxbEnu9PKQSozrjJ+Yp4JCV5s90F7dBw2tgB1gftiQ1pV/6ZfPmLLa1X2u
         SVhkWdOjDCcdXPq529dG7QzUX7EMXsSpYIC/CoR+kznyJ+ZOy82+GIuLNe8D+Dal7151
         fOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475110; x=1781079910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OxV53FKG4HWP7RwRAnssIRH6mwl9ZfX/I+1CZeHHk4Y=;
        b=mLAfEhX0VtX+Oyu+HbdK8FIhAbprqnfvh9HqLKHY1ZLKkEyfGAcZHPANmYXDvhYoUX
         6I7ncZG4i16aMks/jP7SIqemE2LdW5epl0a3q+oPhjpWuSX0spSliBNsHyuRxe2zHFMa
         w4LzS4Kt497cyiw3k1Y+1rWfzs7r2RHuY3AoYfdJ3HOK/i7bTTk1LaVrSYUWjwYsDPAf
         L4CkKPFHogN2D2cgS2Sat9HROWX+izSHGMitLjergD5gIgcgO5Ukw5ttkbPCFdhdl4Kd
         NvpjEKyK6iUcMxEoAlF8XGTSZaQDVJMSHMe56SqjGBzLboOD4FoBp6IcZ21EdnbzPzNQ
         vEIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jR2YdAC3/T7YzMjZamvAnuC1+N+zydEurfcKwnPZr//21tIENA6crRLwHIDxP//nyFqMzg2OGz/vCGdXiXfXi@lists.infradead.org
X-Gm-Message-State: AOJu0YxzWPlsEEnE/YtRwGRJnuVJtod6SYDX6c8E/BDIk6yHYAVkxmhj
	n5U1qjhhulYJ/cN5lQTGhtGm0lBF7E4agFJJD3WakMCK5HrNFV77AldK
X-Gm-Gg: Acq92OGeFdykmPQNKIcbSiaa0QDV85X+lIX9NGCn/1OXElmgY4DwSz0rl1I5hUaVeec
	HrsFb7yF0lbgV8/7isjYMPxF6mhxXoprKkD7APABQxGc/hE63MIrlDfy5DFbydseasLfeoXnR7J
	E/sKEI2wSKede0+lWVqX7yjc3km7tqp4c6Z5b2wOsGY2++pgEM0gs8FhCkZI/6EfH7NNS/LuYj2
	1ceiXLa4N9wnai6/cwKnZ4CSJY0rhJXC2Xn9qLwkMhEtV47GLdDj5oAW8FXrIq0oFY0/2vaftRD
	rDjbQR5e/N8Qy1M/KTEHWfI4AYgFWW+ZTdbl/6E6SgC2J351EAruYcwaCM7VjejqcxAeUtm0qoH
	RmOoSHBQKxxllPDDqTEK+hRnEbAOzqAtFHV8RnvBfz8RFVKj69XfKJ/vWGex80RDDHk5quJuqOv
	p+pDINkENT2u9riNIbB/y/OPp82/XxgCeb7IQjroI8JR6/6SGEvQaowZ+qF+GKHxr63F2n2OeLr
	UjTxCwr/JC+lueA/AmGg8f8XcKJB0nzvpAAT9fTBHiVZaP3QrN1MktZuJE=
X-Received: by 2002:a05:600c:1392:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-490b5e8cb8amr34882915e9.10.1780475109767;
        Wed, 03 Jun 2026 01:25:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 3/5] arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
Date: Wed,  3 Jun 2026 10:25:02 +0200
Message-ID: <0a3e17a7497616a1f83159b98a8e5ffa429f0acd.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_012512_391921_9AE81BE8 
X-CRM114-Status: GOOD (  11.50  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 77377127c18c..c835394468ef 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -215,6 +215,14 @@ pcal6408: gpio@21 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		status = "okay";
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3


