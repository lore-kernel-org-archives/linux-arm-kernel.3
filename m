Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9F9CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=woVp7FNEkX/bwtVc5utqy3tuJJ+oPzZT5NUOh8DxvE0=; b=LV2QO/BulEs9Jn/cKWHuwfkW84
	uKGZWHQJk71QfgQR+XN6/6l1FlcARPmDWq6AwTPgzz+z/DzaxsrIGvtjuJp17ur3Mzq9l4sIPVGSH
	43M9ZRMFH5BayUjoUq3JnegXaIxX7qCcnTyVWwSQ0+93zNVq3vDFb3DA2X48Vqn42eE5GKHPaqjdu
	PYMM4jDJqFTBYdJkM1TwUNjD7MfGueaSifXhpG5MI6qW74B3W/pB17QQYlmMRzGbJNilr9ffIvxaU
	qFEWAKNhuNYIm+dhBDrekEdn1Wj6AUBA5+zKNT5+TwMgQe36hRxb7M2AxAbWvBiSbwQYn+wznKpwn
	R/UH2n1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMND-0000000E46j-0wDz;
	Sat, 13 Sep 2025 09:16:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMNB-0000000E45T-06cO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 09:16:46 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso5296618a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757755003; x=1758359803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=woVp7FNEkX/bwtVc5utqy3tuJJ+oPzZT5NUOh8DxvE0=;
        b=njHosU38hrfsZsFg/NFQCF2kWagNXeKxqoe9DiwdIj2AmRhCSUTQFBJBXuAqObn4/u
         SM9e9a3AH22VaiKiLvbsjz3eisDH3+hW9/8iSgzPdY8azgylbU3XU57SLlDryzYe3vah
         Hkuiv33QTyEeYcTIZEWhnjXZ+neMKlbiQJcSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757755003; x=1758359803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woVp7FNEkX/bwtVc5utqy3tuJJ+oPzZT5NUOh8DxvE0=;
        b=GY2qGjOle6Pv7aX+wdLOMxc9eOT2AhmJ+4WSzGIq4eMQ/OvZgHlVJQIaUKl7NzWMlj
         WeH/3eUG0qLmTFhOCUJB1NO76WIzVvKIFKuEbyFsxjVk2xwrbTVA60531lxkR5xgujcU
         RKU8mrQDxk7GpOE7sMCqr0PntSAxIJRUjvMRB8CQKsrJVz+NCwe8aBLAHNQSOCT+aq7E
         zgr61Tl4HrG5x8mJmtrWdxxb+57uw9p3R2yo3vJcZHtFJcs+iy0Ml/slcsz/Y5rCU1S9
         BQFQD2aJkCMwgCB5eF5mjx1ZpLGFd9Kf9LfmpzEEYV5v3wDl/9xP9EOePC9Qd2HIECl4
         y9eA==
X-Forwarded-Encrypted: i=1; AJvYcCWAoktLhOqMqn981rbLNyFF/dcDNq/uchGq+QDz9Fzdt7iFWrwf23fFETTO8nFAxtDV3TVDTlEPCIAxUVVnzOfe@lists.infradead.org
X-Gm-Message-State: AOJu0YzuLIB5VoSRSjSdGQrRT/eCbEnUgb2VOn0F+ZzOeQk2R2S+hfda
	+QGtoAXYRAJA6wZwflYBXkIEcVD9UpEiFFzpBsYsKQqWdoZyQqrHbHyu3IAl7WakV6M=
X-Gm-Gg: ASbGncsJxFLTX2J09PY/k5TnGO7LJ8pZaNooDldGjObhhIA6Y93zsrHcxVI3CvmyhHr
	awcflScmbWc7co/R2DYFT9SntLVG+/kJX20g/pIS3WA85hPe523pHD9TpuZ3C210lub0/Al118s
	wEe0y5qa8FxT8yL6F6xzPLImQiPgS9uEJbjgl2jmNxuZN7/9Myv5BEOLGvoCz2qevH5FpUKkSlR
	hofjhscjLlHKhATFVEkMkufB4Mdi7kyQ50EFmYLPN7H27+/PPtB9IspNGmF/4TSR73BFJ7eWzGP
	yjvf/26Dox+dZT/dDKnGkLk6LwOhPCgaZFJlPosKb4xKePTXqWjC1Nps8Wi4AqnJVZRuNu0fSxK
	7Su8AqUl8MwZHl9LUZ6x+nqj2UgwZwieBqyePn6lWo4IySYi7fphF9fn1wQtfUUgvdy3CT7+q//
	WiX+qZKoeg3wbLcCcmWVtYJ4aaLPlXXKSvFnhg0j/1Co4PWCj/362oadDpwZdOXeRO
X-Google-Smtp-Source: AGHT+IFLQcrw9kq1ufoEVqOgFBOrdye9rBnznBZUzXL2tY70bbUV8mzf6aopgG578A5tsns/4TRC0w==
X-Received: by 2002:a05:6402:44d9:b0:628:e750:85d with SMTP id 4fb4d7f45d1cf-62ed8410affmr5076000a12.21.1757755002961;
        Sat, 13 Sep 2025 02:16:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62efb5b8b0asm1593089a12.20.2025.09.13.02.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 02:16:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: imx6ull-engicam-microgea-rmm: fix report-rate-hz value
Date: Sat, 13 Sep 2025 11:16:31 +0200
Message-ID: <20250913091638.1003563-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_021645_094052_A2403FE3 
X-CRM114-Status: GOOD (  17.02  )
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

The 'report-rate-hz' property for the edt-ft5x06 driver was added and
handled in the Linux kernel by me with patches [1] and [2] for this
specific board.

The v1 upstream version, which was the one applied to the customer's
kernel, used the 'report-rate' property, which was written directly to
the controller register. During review, the 'hz' suffix was added,
changing its handling so that writing the value directly to the register
was no longer possible for the M06 controller.

Once the patches were accepted in mainline, I did not reapply them to
the customer's kernel, and when upstreaming the DTS for this board, I
forgot to correct the 'report-rate-hz' property value.

The property must be set to 60 because this board uses the M06 controller,
which expects the report rate in units of 10 Hz, meaning the actual value
written to the register is 6.

[1] 625f829586ea ("dt-bindings: input: touchscreen: edt-ft5x06: add report-rate-hz")
[2] 5bcee83a406c ("Input: edt-ft5x06 - set report rate by dts property")
Fixes: ffea3cac94ba ("ARM: dts: imx6ul: support Engicam MicroGEA RMM board")
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
index 5d1cc8a1f555..8d41f76ae270 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
@@ -136,7 +136,7 @@ touchscreen: touchscreen@38 {
 		interrupt-parent = <&gpio2>;
 		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
 		reset-gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
-		report-rate-hz = <6>;
+		report-rate-hz = <60>;
 		/* settings valid only for Hycon touchscreen */
 		touchscreen-size-x = <1280>;
 		touchscreen-size-y = <800>;
-- 
2.43.0

base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
branch: report-rate-hz-on-microgea-rmm

