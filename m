Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1D3C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=; b=XklU1fKmWJoXnjtiC6niOJQ3i7
	uP1H0GKIaAjJ/c/NXLdGtJxgXZ6QMs29ep2u7EiPB/XUhE/fa4NMQ+Jf7g8uNABu8jxCdOWdvGbqk
	IO7KXWA7QdkUSCs1VkoVBmuQ1MwjJe319kJxY8nYOyeUJ/BZNI4+D/UXuMF4Eoyy7oz9QhsvbSOhx
	5LCaXsSFzLsaSOrLrC4Dt5jIrrDXViCQU9UMPBPZSWhVfQkRSMXjDFlec3HGYrDuMcI4xukndmEnS
	m7Grt+hENVaZ0EVb7q7vLCgvdECR/t3gZIyNl7L2SN5drRUZmW5aIm8lQZ/laFpdBXhDKRAaJa3fB
	hDVlC4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qFz-0000000D2CW-1WfE;
	Thu, 24 Apr 2025 06:40:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyT-0000000CyXj-2R13
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 06:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=; b=Jm4gT7zrLiHZOLBzGwfT4QUeCg
	t1ImGI2SKmXyPMMBx8/ZhqtJ8mzHDqgiU7QErDFqHd9RRStrREeLFKwtZ+sAaqVZ0OF/IWCce5Uk0
	N1uqRJFEBtPNclRZmn7uNhqWJbOQ58221e+no2E8uMIvNQk/iJeicnm1GmlXU77VKFZ/caCO/DncO
	NYj2fUHwDKepBotIWiIvBBLZeqMl7kb7rGehNNzBZNbar0XoEV96l2ahAaNOLPa4J//+AmZAbri+O
	h5MXhwJTuPnBJepjJ0Rz35PvYdKrId1pIaKFhiEUkPKsLSRSq/FNFy2veP6ofyHDoaGt8fr0Y77ni
	ICmQmDAw==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7pyO-0000000BWrc-3ZLM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso6338245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475729; x=1746080529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=ZuTE7BlANyJZcrIWaXwPp2sZU/prxF2AxUWkrqJIKqCliLOzXypLtFPb8E00Fiwzle
         drH3WO8/hKqgM7KHwthVjSrWwK4nzaxaFhRnQvRAUxRT5HB8CCCzRee/d5oM2M8sFdj/
         c2sir2egl8mn7Q7jrx/f0/hUTbgvx8sOWE7kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475729; x=1746080529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=mD6ocRRU9zwb4M0FjJPxGZ0U8yq1QSFAAghQq0R2XaZTyjT51LNjbL9UBec9nHtvXt
         lS5A3mVT6vVh4PEZBg6ylshOQMr79fLbUha1ETYjgHtJ/Gz0o1Z7LlGHM8RBzlIJUXz/
         bIiEXmRM70ATDkgK+GD9jUwxNyfnphtteEJix+rEFms/hsuW36rr/3vja8hEkOVWCDAb
         E+KVAe0CUUTjBOSpPq674fTR0iePvs1aL/o0uPgVHE2e5QMDMyg0XxeSfcOauHosNJ4d
         b0Uq9mY49+dlQQHGcvlOaQtXoFkELnsdxuoWxBdKfk+jqQ+qaLzErkoWUuDUrryDoAww
         Li9g==
X-Forwarded-Encrypted: i=1; AJvYcCU0mkcjDCeapBbdKzTSRqgISovZrTyD+PLZozaj/G/cy8o3GvBhoJ7Ajmy+biKkGYNg/eYA3xK7C1aCnlc3vapu@lists.infradead.org
X-Gm-Message-State: AOJu0YxJM9HOqusxj/44YJZ8FBvkKPfBqpNMCwEIEbuiwDIMV5llCHqb
	Ceo2dTZx8tysV+bQVYo2GxOf7F0uKW8PqGX+TjkvlT1CF9azAaZPB3FYiazbniY=
X-Gm-Gg: ASbGncsinHId68mkezrrTppz/0EZ1j/QMcTvLs74989/0Ijt11onKEFVpnvjq+OeF+g
	/nF8Am3HCbiGAWJ2p9b4nz8Yfs3+ROdYpyfqbjTeGhwK9Y9nRhOgmSQPZwJCWLLozcgC9+9qZeV
	Y3lJraG3z/Tg+4R96w7e9czoXuByszkr9BkQZt6EJuLdcjaJwiIVXMXLfmkMLG1b9nnj4btsZFX
	9HulRbLKjOcNl5wa+4qlGLtUwOwcqI0fhtxx5XfEJSq3NUQJuVQStyoYvsEtnBq0ZdcvPMHceij
	IBwB8XkG1l1XWWdzIiLDrh+EKAhgVTbGcaouQmlhaInFqBj1f9N1rb56P3U4JNIKIpgGacZI/tu
	m1xxI
X-Google-Smtp-Source: AGHT+IG82yOPXpYwfi2WQXemi3Y+w+Y+YBgmmwEarjbKGosn9nFuDaCtfqEsVXKjXrDc3OfGAVxz3Q==
X-Received: by 2002:a05:600c:444f:b0:43c:f689:88ce with SMTP id 5b1f17b1804b1-4409bd8f0cbmr8682185e9.20.1745475729593;
        Wed, 23 Apr 2025 23:22:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 06/19] arm64: dts: imx8mm: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:36 +0200
Message-ID: <20250424062154.2999219-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_072213_534943_24D6A00A 
X-CRM114-Status: UNSURE (   9.72  )
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

Add clocks to anatop node.

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


