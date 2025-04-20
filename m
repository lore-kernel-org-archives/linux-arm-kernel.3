Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E01AC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J70zSIsICNkhe0luW48bZRB0FNJW9CojZ7pnZGLzqis=; b=Vfr+XAy8N5WNUThRk6yXhuLOLc
	HM3xP6NvsHPeEgR8pJcvnmrgTx4guyFwEpEKKcJzmit3VrJRlM3gref/k4QIZrCZlSwSd67hQAoZd
	S3+TXK7ah1iE/+nTprtSKKfIIxeobLevtJQ4ejjf38itEjMWBSSjUFxQGxgDnXBTOHoLymNuLs3OG
	uqCpEOZP4qkTxssRx4xjcQQYaCmO4e3TK7Co5c25d6E1ADyBYs0dTrLaSxVQxP2uUQRlYHKzbdDLS
	W1rNfKnEzBWqI62Urkrxb5dxREm7YPIlZkZYo+BYwPT+frfFkYB6BfW7zLfhG8gtj1xNx/KR6No41
	X4IyzFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6RNY-00000002Q9W-3gBo;
	Sun, 20 Apr 2025 09:54:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6RHr-00000002PsY-35BO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 09:48:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so23052815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745142510; x=1745747310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J70zSIsICNkhe0luW48bZRB0FNJW9CojZ7pnZGLzqis=;
        b=TYkAjPcS4qrIpvI5rPXvHgG44b/fx9BM18qinfV3cnDqq2hHJ7BOwu8FMeF2j8nqIH
         mY5Jy8EP7we2P4k947fHYUyuRQQOt0GJdZI3w8y/deMh8Ffq42wMs7rJno53gzbRtQ3g
         QMbgxHGATt9hgQuV1R+rl/SLh6Kn80/cwAtFjOip8lguKIMsM+0oYRtJ3jCNnSFq4AMq
         lcQJJsZ8qA+d94LNd7iIFQIvZs/QxD7bMntq6uOsn555TmP7aVP8l7BZl3Xgw7Uc+g63
         7Ds5ZChtPO6oEnU2YOH/t9RuZnyALmV9fwiWX0Tjr+iBM9ePhcHkeV2Vvt7HOPH9vrG7
         jxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745142510; x=1745747310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J70zSIsICNkhe0luW48bZRB0FNJW9CojZ7pnZGLzqis=;
        b=mlHivtBdgPSB7jb8E0W4NNUWfUMyVQLai/MuizO9jv5AOolWIXziHZIo/OiDGytn/O
         seObC/eHo+FqmdoPxuuEo/hHyoRT03U9T2G9YGUJwvbHPvpWfcyRi5R9abYXdfO2YpnN
         IrLY8Ndb8oYzL+s4hI8KMIEeojmkqKy3+qb1ufjoupCuG6uCTuNrCmbaAJQnY7Vyd8Mw
         /vocpEwe7zZGJxl7HpbUrLzKdzMYPJ4uccgd93FV0wNhcNaY4JWI6o7GZlJoeUORk5Gu
         pTzjwREqz5HKrXo90mYbej9RM9ojS+Bb0I3ol2ubnpAra6dp/GzTQIj5LaEEVljEt1Ct
         fF3g==
X-Forwarded-Encrypted: i=1; AJvYcCUkwV3nAYlN7srhsQIoZVU7grhZoPyndFFAIF23iqjzB9wRIDLk+9vOQmZ7R7psZTS33/sYz37mwUo8U4NYOdj0@lists.infradead.org
X-Gm-Message-State: AOJu0YxLb3w+orDIsK1m+6o6E+9O56LTIzqQJuWSieHhDAMHA57gsiVE
	o7tqyStm7BjVwOwC6g1OvHEbD4vxJG9bp88XVARNDQj5xV8KR20N
X-Gm-Gg: ASbGnctdlkv5GdDR+Y9gKotbpbpg9Q3LETeH0/Smkbb+albRe+yMW9dMwA2z8k/Yk2V
	Oi2IwWiEsRzL1Y6HydKob/1NLYQwwlw6hW0a7ZMEZbFn+bEA6BeLO6itou6d0KeqehwQfU79aaR
	V1XQCYbOT596ot4EO9wOTiZaI8fK+ssTRtR4IK/7rUXl5QmQ8sIC06tA0s53m1OXLA7gODMtYks
	wiaaugl/uSKyl+RUyN9shr1tQBIdOrb2HGQRwG6XSIpbmKfwME8BDAGmPM/sObphjsxTklsPq8l
	PXNktnW/199TYCmY81Tabty5QM0UzHjKmJ/Ir3ODR+xAfASTTYp7MNC/EdPnw+L0dBHP8Jq+H+i
	HF0LY5oadr+EonN+7CiAvycI9zS9se0LWuXrhg1eT3sh/s4VTJH5evaFV8ocJyojrOilb3SbBYz
	g=
X-Google-Smtp-Source: AGHT+IF9o36sHCpVLQh3u/uS8Mj0MuecjMIiXN/dsX6wb8zysslgsszsD29TtXQILSnoqleCJeVPxg==
X-Received: by 2002:a05:600c:8711:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-4406ac0f82bmr69263145e9.27.1745142509826;
        Sun, 20 Apr 2025 02:48:29 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39efa43bef1sm8273712f8f.49.2025.04.20.02.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 02:48:29 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v4 1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on PINE A64
Date: Sun, 20 Apr 2025 10:48:04 +0100
Message-ID: <20250420094823.954073-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420094823.954073-1-pbrobinson@gmail.com>
References: <20250420094823.954073-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_024831_771433_913CD6E1 
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

This adds all the pin mappings on the WiFi/BT header on
the original Pine64. They're disabled by default as the
modules don't ship by default. This includes, where they
haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 09e71fd60785..3256acec1ff9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -124,6 +124,17 @@ &mmc0 {
 	status = "okay";
 };
 
+/* On Wifi/BT connector */
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_dldo4>;
+	vqmmc-supply = <&reg_eldo1>;
+	bus-width = <4>;
+	non-removable;
+	status = "disabled";
+};
+
 &ohci0 {
 	status = "okay";
 };
@@ -286,6 +297,7 @@ &uart0 {
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
 	status = "disabled";
 };
 
-- 
2.49.0


