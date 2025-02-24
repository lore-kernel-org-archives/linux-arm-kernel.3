Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5D5C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhxXNmQS7HiqcndJwzB1tfncWGWAmFhTQNVTNzL+Iew=; b=t88tw4UsJ4KYDPTzF52QXBRO5r
	HHGxjd0lEflJlF9OcH5r1DxNiDAAClmg1uHcSbNmzWXntg4EHU9A7qzhjIIm3reVr/dzTHzA3QhPC
	mLWgvQxA7iaIhlu1d1S5wV/eSx4A4o2PvIVYPmjWFW8fls/XaqV2wfat56ECIqc5+E07ayABnqETb
	glDz55+dxw61TuDd7VR9k5OZdPytXix4wuH5eXTdgoRKXCRXIzzPTYWjJdmWXQpR59KPufIsmrXsH
	uI5UqeNbTX4ekRyc8/t21goEPQnqJ6pp+SrlTqdvIDWHuA0ZFt8jXhX+V+P5adZu2vsNn7dysjr0l
	Ul28Z9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcQr-0000000Ef7z-0RqZ;
	Mon, 24 Feb 2025 17:39:53 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcJN-0000000EdX8-1Zd3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:32:10 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abb90c20baeso605823866b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 09:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740418328; x=1741023128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhxXNmQS7HiqcndJwzB1tfncWGWAmFhTQNVTNzL+Iew=;
        b=AITjFqZ2TA9I4BVRr2wyBseBNEmZhgKBJawGGufdQ1EK3kpU2BC6EWaRLzDb+3swdM
         NEZCo01M0mnJzoiJGZQo+xw9DcCrmwnYVa2L4nrfffhawEhBxPsBOmZvGB1Q2ug4y7iO
         UvIUs13RMHuOF37Mdu6hFKDfsEXVDa5UiYKcNVIwGHkWd09AjChTdg+IHSE5VxNUa0CY
         TlUbORndc3B2L4gbZNCvxAcCNZMspgFGj/lbKXy2HYMkTgY9WSXxraR6kVEgZuAKCgUN
         pWpE9KPgCVuJIAX9gZoYT/6uNcHa/C4YZkiCkQCIDxrn7T9SVfIixkxe3pkF5090AjgM
         /V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740418328; x=1741023128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhxXNmQS7HiqcndJwzB1tfncWGWAmFhTQNVTNzL+Iew=;
        b=BKbe/BPRJWbRgD9NpXvj/1Rh1lgxxAPxmAYW0rTPC0/EvrSMM2XSd1swkRaHxNad7/
         vTW7e6yKWAeneKMyEPqt8H2vfuyUW/5Vy/XdEU45pOubxbVt19C2/C5EzeFacNrUgi9E
         YR0R1cxmKuMybmDon8zfZIAf5h7fVbwI082gDWcYvKDJhSKzPfnn5+YkSwqo9ECAfu3l
         ZEAVDHtDXuR5xwCl2JDNBWI2AOr+wsa3Nm7cePIHw+9lKbHykKSiGsuAtGXUJqeDcvdB
         sV8h81pVCUWyjk7SPALrB3PXtRS3vASarGlXq0ANsbLTvrh9c8PWG3NXu922Rj9hEtcr
         An4A==
X-Forwarded-Encrypted: i=1; AJvYcCXhU3wzULpwSJ556iDFSwQjyhj81b+JERhrCg34kOgb5XCitZrSEROi8yBmq8PmKjUdrn+WG2qwDKw9gDbCl3+c@lists.infradead.org
X-Gm-Message-State: AOJu0YzuOpWzym4NG3GaSbcoUGQYqQe8HEW0wDXoS4FI0ZSTHjgDAA99
	VsZrNXItOX1z0mATJEiJ+b4PB65Wkli/ZcsdLeW+5CQ+xa8bFlIZpPqk69E0nU8=
X-Gm-Gg: ASbGnctOiAFLdBb0pWrbEmN0+DbjreApyKFyYPk+28CV3ZPt1peNajuam3c2ts9S79K
	6IPBD2hRvpczqRv6K/Kby0EqiK5hD5zCPcjJz7qgqea70HGnmqywjPTAoUoOuU9s2miLbYIqB8T
	rDhuvLh3VA0IpPrSqN6oSW86y1C5JQ1H386N3Ab+l+MH3nI59iWckAFxdIZ8Dp0iEpvO7EHxlbx
	Qr8CCfL7h9wZ18bPJZ2lqTpjTGdg4uQESkOkuboj8RqVnUhfxqJqW/Sy9gFPTFhKeTy4MZ+ea35
	DirxQZVtJURjsVUKE3+4tDWoqNgBK2gTlpQT9yMkwIaS1WrfgKaY4Dg=
X-Google-Smtp-Source: AGHT+IEOW8+Mti0kStIcH2NN1v3JN2p1VlS2xp8UH5KoJEBDGTjvf4FDX9S2JYf1r+OelyXxGOdoUA==
X-Received: by 2002:a17:907:970c:b0:abb:eec3:394c with SMTP id a640c23a62f3a-abc0d97e77amr1259252366b.5.1740418327678;
        Mon, 24 Feb 2025 09:32:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a7fsm18674357a12.58.2025.02.24.09.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 09:32:06 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 4/4] arm64: defconfig: Enable RZ/G3S thermal
Date: Mon, 24 Feb 2025 19:31:44 +0200
Message-ID: <20250224173144.1952801-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_093209_414034_F0A5B93D 
X-CRM114-Status: UNSURE (   8.55  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a1cc3814b09b..c3336b1342c5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -714,6 +714,7 @@ CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
+CONFIG_RZG3S_THERMAL=m
 CONFIG_ARMADA_THERMAL=y
 CONFIG_MTK_THERMAL=m
 CONFIG_MTK_LVTS_THERMAL=m
-- 
2.43.0


