Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06B3D5CC9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6d1zYErtt6QdLWN37Xr5fe5oN1ubht0jqLtcLPDyds=; b=P+d9Y4p63oYA6BAHd72KF6SXkJ
	w19e2rO7+OMjCj4gyI/y+r3HNuLubL5rlfx6FnHufRSn5INsELz4tqB2qrVUXlJah5jDKXiDxZwt3
	tsKnvNWz12CPQV2kJj7gXoVi052eoM5qNkpzG1s+PjWvYvd8aS5frilv/x5NafyHZmosP7S+gfd/p
	DyxAL1a8dJL1Tyejl1/9OqkkZvrunQkMrS4R8FpNenYUvM1MDeDFKhz84xDyi+IrB2Qg88EZiNCpd
	mi8RdKvdfiVqUzr21pH/hg7qmYfkEGJH9a8pnEtcLCEYOD4IIMXYpYnd/L0qqLuSh7v1GMTGRhz6n
	OGYIIyAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66v5-0000000094I-2pdb;
	Wed, 30 Oct 2024 11:31:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66SY-000000003jJ-0FzF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:01:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so60325385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286112; x=1730890912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6d1zYErtt6QdLWN37Xr5fe5oN1ubht0jqLtcLPDyds=;
        b=i29eE7wQgsatG26xrOtMqFBhqHPR0y5f7EfbFft2tpApcGn78s+4b4O1P1vr4glk0D
         VJNfyrlC0r8T1gOooEt2+GW5trw/BG2JZJcBjmrRRkcl4BCeAD4hgEbDqHt7obVelfZS
         6WjaX9LIAVHH7I3fSm0abH2PhfbdnoD7XpaBpgcaiUlY7i4iMkbBqfOyRCB/jQ/SstB8
         mKaTS98+ILFgZ+yb08aH3dTsUidxwtryCHNGsaF/t8EUhRym0SRGzoH/uuYcUqlo1+fA
         4stFMhTpYai7L7CAx4/cQRuxpzGzTDyzvdxwJ/vS8805ZG/HJjyNoyMEqV2IAGpVhG6g
         15pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286112; x=1730890912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6d1zYErtt6QdLWN37Xr5fe5oN1ubht0jqLtcLPDyds=;
        b=Ff0yYB4pEOXKwQzl+xdkufPJrTwxi4CYRHi9NvhJtD3sM+JmgNwwpb915ARZEMJ7jM
         eP3itmMSCtQ+gwMU1Sl9CP/mm3emF3N3e2gKDQHM1aNwroKXqhyUPeUGHh3BkfA1n/XD
         ZHzBvHlfEmqNDOQy7xvo+xYzUVn2+CGNjPleopUtghvQFfNtba8ZL5bwYupl3IOwsWaL
         16fYoSaq8XKqk8CI9y07x6bjt8aoILcaMslRBUNb89tmg1cS6cQoSbsNjOwW9zwLattH
         HzHYKv/O4JBfEhzUtvBZ2A2C8D0re3dORubS+i2xY2WQIH/FX+zn61bePYUytD/sEaS9
         nUFw==
X-Forwarded-Encrypted: i=1; AJvYcCWD16mbK9sMnJWpQKdjl7sj4i1rJweFSAbhzfAq84Y3ORl/GUzWR86j4+cXEVnkitfI/MoQ16tmxO3tWSzQz0fi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn7hyGDC5Y6OgoLpxcCUPQtDeugJj4C90g0eOqfO9JS9STXAao
	6s3lZD2lSakDYeJ+ET4EKyLCsJG1Iq+tgt8tAgtuzM46ftvb0MsUXRVGXEdjuWE=
X-Google-Smtp-Source: AGHT+IHGe0bvz9X7exQp8lHGjNHl0u1fiwa/DD0OtcpsRQbPlicMRE8mwu6Ni/h1QGYotgNsQMhw7w==
X-Received: by 2002:a05:600c:1c9d:b0:431:5187:28dd with SMTP id 5b1f17b1804b1-431bb9d1675mr22685875e9.28.1730286112159;
        Wed, 30 Oct 2024 04:01:52 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:51 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 09/10] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
Date: Wed, 30 Oct 2024 13:01:19 +0200
Message-Id: <20241030110120.332802-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_040154_138681_53757409 
X-CRM114-Status: UNSURE (   9.21  )
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

Enable RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- collected tags

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 30bb4f5a7dfd..2ed01d391554 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -345,6 +345,10 @@ mux {
 	};
 };
 
+&rtc {
+	status = "okay";
+};
+
 &vbattb {
 	assigned-clocks = <&vbattb VBATTB_MUX>;
 	assigned-clock-parents = <&vbattb VBATTB_XC>;
-- 
2.39.2


