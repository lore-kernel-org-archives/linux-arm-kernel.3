Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E748CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpyRTrxPweNj7vM7NPNQrMhG4svc0bcCinaeeoiCyfo=; b=krYsavZC/2QV79Gt7UquFXXO0Z
	VM/HXLCP46G72nwGfkTMZOfi7J44B9m4PyOlQAgY0jpikX5dd9iD0wN6vIvrbjBuNezimpTqi1cWt
	TBiFeUWOjnAPh6oR5ijuO2Z19pkG78pYCmrYHmuZ7wetSnHTp+YiZ3GGBhouBarrIkaj/USbYdPFd
	01gBKiEsPNZgGU2UcvxZNTUmJndcXfTxTfafGtUur8Ex8UfJR9OrJ4P0IhzTUA6LvBV47/jCYZad1
	eidm4hOR06gOAtfyuQwNj7LaOXUC4c6vwxScR7k6z46TgOMBHq1DYbNKuf/ddq2bsT0rSyEUHP1Uv
	LyHQoSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIX-0000000Amr8-3dFD;
	Tue, 12 Aug 2025 12:40:13 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull7R-0000000ALk2-1a22
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:16:34 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so5785562a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754990191; x=1755594991; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpyRTrxPweNj7vM7NPNQrMhG4svc0bcCinaeeoiCyfo=;
        b=JyuBsGPvodSeNN9PKn7JOlvWz3L3bxfCwljxJlpfr+OP3A7h+nzpeYFk/OhpLMUlJh
         zc1Dm94YMK7CAPlfgXDERg/gtxGZMIatXPkwp61AKSzVYWrcQ6R20cA3BY85WIREwvN8
         frV/nfXm7EaNEsur7+r0/k6B81yFJNEKN+hoJ1+nhW5YBiNY2htLtWQgmk7BIZcdxwyU
         OsjKHD0SV+MyH96bQcXINVb/mMpzV8HI06eb9dcsMyzUBURIX+Xn6d6hr+qH77RSxW4P
         y25R2hZI8uMoNyjmUbwccf5uYEmSH8gn7x74dbjTUd7/8YGdJNf53siFJQSLFOhC8Wy/
         5gfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990191; x=1755594991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpyRTrxPweNj7vM7NPNQrMhG4svc0bcCinaeeoiCyfo=;
        b=JrcGok1eUFtsE2X7kXM9WeOOc22Cj8xJPmMYp0hZ1BPdd4TZo8qZo8Bu7g4ZlNp/mD
         8pkFMWamV6XVRSRwXbXOiSJrf7CgKQlAWiZq+KRwNZzQPfPTSAktaLTu0ILPE3LOTaXh
         vu1rVXF2mGWXEBP0QByhkzSaXaFDtweWdzFOSxmc4rclLAC9hH4GXRk7mikedccmf7Gr
         01ZB0UJzsLfisC2qOLvtWjiMxeMXkXgC8gqQfLyWY15NDWVtdGACtjTYcSJReJ8nMJgw
         b/4PS/Ee9Tph94gvKm5GebCwhk4/frgiDiAKcbvZEG0DR6k/Nuvf8aUgvKhV/E/3OIQX
         A0xQ==
X-Gm-Message-State: AOJu0YyLsrWCmI+PJFKHTwDEuNZmUPiOfVysXrAp3uycxfkd6TersY5n
	f+fSe2A8t6BimghcKb8bQM5H0cYCflcQpMydSIDzwRkqzEu6gtqcK4Acjo9W8nAzwZg=
X-Gm-Gg: ASbGncsTEi1J3lBSbXroLxbW2wgRtO1GNeKlKrYS225OKXgnRTTn00FCO3sMy+F4vQT
	KKHrV7rYzPIH6tAk5MunIdnzzgWIWfBY663lu0griOPMIT1DirhxwIs1EGTVx6rI5eRCq2h+yR5
	FwYce0XhVNT9BABdSVvbMSlo/R8ii2GMxm+WAvWR7CiPULyv7EtOWvj6mR3ap2ocCVEzwQK7a7Z
	nM+slI2anpW4b49ZF2WcJwnaRxf7jFJbKiNDuekSo5llY0EIFElGIpH+wMC6l4QtDuLOVTyGlbB
	xUfgbtiOyyA4zsRjaoxv9TsH/ZnNIj0LY/3N9yakfJaycpLP1ZeqJfz8tE2GwAara8LHraQfO6B
	EcVVRarIEvzOB7NO9CQ==
X-Google-Smtp-Source: AGHT+IFUdPtxDW0i1essizBgmFTXB8SnaSppFE9xYLgAQXzcYuMdaQchhqUon0sWY56fd1fLtjkqIA==
X-Received: by 2002:a05:6402:5186:b0:615:cb9c:d5a2 with SMTP id 4fb4d7f45d1cf-617e2e56225mr13393239a12.18.1754990191490;
        Tue, 12 Aug 2025 02:16:31 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6183b154241sm2417273a12.27.2025.08.12.02.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:16:30 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Tue, 12 Aug 2025 11:15:20 +0200
Subject: [PATCH v2 1/7] arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-topic-am62-dt-partialio-v6-15-v2-1-25352364a0ac@baylibre.com>
References: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
In-Reply-To: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=msp@baylibre.com;
 h=from:subject:message-id; bh=y8z/VznqSYDTiS702Oe43jqdo48jHiNSRwg/JgsiCBQ=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozZbLaFaldzZCZe9VdfahElrGB23bfR+UDI+q1MGpdXR
 bPe3Xmoo5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYy7wTDX5HC5w+dz5w1KziX
 Pvnl++OGeZwVrvGeJxw/Wf23P64rv5CRYTYz58mMzAmns57uf+q1Utjt9VnJTb/yVpo7dCgsylG
 YzAoA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021633_418746_9AEDB597 
X-CRM114-Status: GOOD (  11.05  )
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

WKUP_EN is a flag to enable pin wakeup. Any activity will wakeup the SoC
in that case.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index c0f09be8d3f94a70812b66c3f91626aac35f4026..d3b0ecdf1a4a4de25ee6121ec9e62d1c7df26eb9 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -19,6 +19,7 @@
 #define DS_OUT_VAL_SHIFT	(26)
 #define DS_PULLUD_EN_SHIFT	(27)
 #define DS_PULLTYPE_SEL_SHIFT	(28)
+#define WKUP_EN_SHIFT		(29)
 
 /* Schmitt trigger configuration */
 #define ST_DISABLE		(0 << ST_EN_SHIFT)
@@ -65,6 +66,7 @@
 #define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
 #define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
 #define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
+#define WKUP_EN				(1 << WKUP_EN_SHIFT)
 
 /* Default mux configuration for gpio-ranges to use with pinctrl */
 #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)

-- 
2.50.1


