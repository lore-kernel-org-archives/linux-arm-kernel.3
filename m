Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078EFC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrSNXGfd1043Q08w0S469+QeaCD1uDQKPuIZl5ROhFI=; b=iCs/WdvjdUnQ2yI9kjaZhAbVxK
	rsT3llRN6lyvxJwOWmkfCMv/9dQpo2lZHqI1a/LPNaSHhbdQa8qEMK8BfNMlJjdKxYn7YZ6gfl1kh
	mBYF+h3iaGsEUr2PNj4m+n1sgbMRsHC/mgYIQmR5RsLz9pveKSW1/juqWCQNJRQKBIzD8ao8Beodt
	Zi7iIoAQtoGZYB67X3Wvki0RZxRw+KLs8VhyeFXkAMePLuaBn++iesv0vyOi8QonXmPUoXcrP7MBm
	SswjEG7vjO7pKnXNSophRmuN2S7u4XFmRUizEzclfH4G6maAfKsxToUiCo/DhDejwIIa88a0jufPz
	Xe6Do+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKy0r-00000000R0u-3IV7;
	Fri, 30 May 2025 11:35:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxmH-00000000PBG-47Vg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 11:19:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-442fda876a6so16176145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 04:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603996; x=1749208796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrSNXGfd1043Q08w0S469+QeaCD1uDQKPuIZl5ROhFI=;
        b=ZaX9RlnaB4TAYitZw3UgmAEBAfor5Tm0cV6z0zeutXpON5hXOsWAgoz3RzPI+cwX9+
         Rp+X6ETkeqMfPAi3i9fKOkr+85Dji2dR42ssWmXJxtwYdfzFBk9m3vr2LxdtxeYnbZQF
         nWV0BtsEqn2rryQMEsLAlgYHYLoVffEFkTeufB7IIP0ra/g0jhJqlmuL9hh8A+JW61uG
         3RfsLAPYrzmgz3gGN1HtbXJXwhoquCOrmM13Ra6rFoGeXwxfZ9VXtEvdqRtLUowfzNVM
         qWg9jR01EqBYEzoxtO7dO5a4TCQ8z7pkfZ3WsG0SXSpP89FNcAwbB1Ki1xDRZRw0yCj6
         aIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603996; x=1749208796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrSNXGfd1043Q08w0S469+QeaCD1uDQKPuIZl5ROhFI=;
        b=COK7ISKD4GMA4GukAhVRtm4tq5pOK9i5UyXS7gt4oLUSefS+jdC4XfYHt9llsP9HMM
         +lKzrbFSvoi0n+M39kd1Og+MnYJwwsaklBFN3by3Gi/9HkEGHnXxY8xRwZAqBSMukA0j
         wnQJpgu3xtbCuAuijr1Kl8WAQj7HVBrMt39DBSHyDdcP+GanS0yq+60j2LSyIMSpOQXX
         LFaEUI7vbiAKQsxfW0urtb+DvYf9OLpzpUk/vrVmmiybEejgma/C7l487swESRtz3Lyf
         98LFXs3jHRWXuwSrZ0+RlerM389SLMLZRGzZ3Yfuvf0OJ4MHtvjvx3lqgItharrS6rbn
         x8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUux0u4kcmY6RBgyQnWnpGhRvGGM9bxJmRCGWP3bRg3poenDJB0BL985ZLLuDdxHkuWihJn0c2u+8HnHrY2qJN4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb1/xk6Y5ELj/aOuD6Gr0E5PQ9+vYNsr/G0EKA6PBrp1KjEmSS
	zCfavfEAyp8hhlMqUyqM5X89sx4rPXWKF9250Vj7VcwMIbc6NxZw3Qr+OlFC8rrq/Ac=
X-Gm-Gg: ASbGnct/potQ5u3RlA7Ds5EC+dv+Abfy827yxoZWkJ4H4/POO8OnXdPhcXzYRkBqjqS
	ggncZ1g6Puo95LAJEuAu8ag9sbC8s613KPlHWJkkJdb6rL1BQAtpwkooXdFH4UzzJRPLAbUwEMd
	TGb3lCJqqshzEMpoSRu9dAcDeHcZLPit+ovRKljDnh+eRi/ekuxJP6MXZRamFZpGdEFu1lBkrp4
	z1lqQlOdwgF2VoWoZBnfg4CNZ01Ytna1DU3XLYiOboaAMZQLuQC0iyt/czU1/OApTrFhAtNFeFU
	iDUsjrAcm8o/DNv6IZq+NfyBABmi3e8R9BrBjnL+LS39myD+Io7adUceLD1NGga3magZ4J8BYsy
	L43KMAw==
X-Google-Smtp-Source: AGHT+IEOmvfgxDBSjQyjTAsEbb9y2Sc2/DFcebPrTV7oNj2NnWeeNPPvSc2ZCRmRQYNSn7XQ7be7vg==
X-Received: by 2002:a05:600c:354b:b0:442:f44f:654 with SMTP id 5b1f17b1804b1-450d656016fmr22662535e9.33.1748603996269;
        Fri, 30 May 2025 04:19:56 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:55 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 6/8] arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
Date: Fri, 30 May 2025 14:19:15 +0300
Message-ID: <20250530111917.1495023-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_041958_021316_0CC82CCC 
X-CRM114-Status: GOOD (  10.99  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The first 128MB of memory is reserved on this board for secure area.
Update the PCIe dma-ranges property to reflect this.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none, this patch is new

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 39845faec894..1b03820a6f02 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -214,6 +214,11 @@ &sdhi2 {
 };
 #endif
 
+&pcie {
+	/* First 128MB is reserved for secure area. */
+	dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
+};
+
 &pinctrl {
 #if SW_CONFIG3 == SW_ON
 	eth0-phy-irq-hog {
-- 
2.43.0


