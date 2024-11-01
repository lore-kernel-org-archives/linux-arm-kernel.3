Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D78E6B240
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsdPZF9emf18XQgtgS7Xp71XPblYsQ7NBPKTENRn3uQ=; b=shHDhErpkfXe2MWcrlPRsY7YfG
	iTF7PAcH+NsIIA8/5hiCI4+WYAg8s5Jw7mD02TBP4awlm/SboEn9UKqnDJUrJP5Zn0p48RKKj/rBa
	lmKKwcr+VyzEgQ7K77tWIH093kPrzBIGTl20lRVWENDbUYm6CRBGETPa73mK8I5mdIAP+UlHTrwTh
	mZQ2E5zro26nELUJtiJji7YE7tYQSCmYS1dKDDvpW928OmR8246ERfXOOpXq/0NVJxsEke7f77ml1
	3VnPIT5ynwbxNOuiBIAJZ/O1iZgyFb6w+LwWXbPPp3FFdKr9J29vMj/Z3o6zagSrMyZv8FdMEhkN5
	QaP0kiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oeX-00000006WVY-0OEH;
	Fri, 01 Nov 2024 10:13:13 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oPl-00000006TQv-1g2o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:57:58 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso2251723a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 02:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455076; x=1731059876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsdPZF9emf18XQgtgS7Xp71XPblYsQ7NBPKTENRn3uQ=;
        b=i0/iTzmuQ5t/GJQo/KzFzOJmxu+pYOd4pNRgwuOMzPJTjkeOuZGmJYgkuYwBvqLe3F
         fPziFj4y0sogWyxU1OOKZqRiT6tlMhy/H+kee+osvv8Zvi+9SwBEZaXPJA0IQRw3QJCF
         MYOm4GYW+32Wz7HB4oWR0b9XEct5JMQuV1C3ebZGqcCmJ//QQ7/qvyF6eiJdiBFd/pnY
         Dk3LDjvoCPwjnqcxE9sIH4AHw/1c4oMdA7p+WWvpzw90qZuiKwZDhQQU2mE4iySgFRIA
         E2ipKW3aFQ7QdJjZwc5R9E1758YQ3YWngjIEuiIrzNkl4/ZN+wtYMiAZvXPK0JUDl06x
         lxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455076; x=1731059876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsdPZF9emf18XQgtgS7Xp71XPblYsQ7NBPKTENRn3uQ=;
        b=jf80UTCfv63IuZJPYoNekEna/7F1FF0fj1q7Gm/xTn4D1dO0Ch+/dHw6L9WD9pMr85
         GKr8P9gMtLcE0P2nAnB4eMHzfkny7THiU0AcYbjH2WlMNT3OHE6GQ/cGs1qEs2/OdgPq
         FAckDeSWG2KB/bb/2H7Kox+QyVIoo0a4F67dVe0wsxTxdWk4V3DsHDmNhxzfzcMMe674
         aZvZJ5O5ua0DTz7PKifo4/2RAfQKMQ9V9iYc2XryXawPsABUsrBuOOx83G+nX8WWHppb
         LtmARXHVjYVFj6T/vdqrDewiUIeInFhcZAfYCaz5MAxMoMITGanXDGhPBx5w+M85ftPy
         O2pA==
X-Forwarded-Encrypted: i=1; AJvYcCWtiajJVigLjji3e44eWxT9PtpAypDVT6KVhRsM+oAen/JaRSxz4jimqcywZve3Hyku1/ydOb1IKP4KXg/guOj1@lists.infradead.org
X-Gm-Message-State: AOJu0YwKEub+v98SmLu7Vm3Z3KSNy1VkEwtUcEL3h1HzzyENU9/lnhl+
	tziZxrz5CCKFOrQhTQPP1dm5w/KBzvrtH0YtjAHO/ktth+/5UCb1pLa6tUa6xKo=
X-Google-Smtp-Source: AGHT+IHIInFyvvZ21N4w9XKZUzECowUn+aG9F5+oWwykmTnOmG6gYMfAOXIH3hB+PUh/16T6BdSrwQ==
X-Received: by 2002:a05:6402:518a:b0:5c9:76ca:705b with SMTP id 4fb4d7f45d1cf-5cd54afde73mr7392400a12.34.1730455075953;
        Fri, 01 Nov 2024 02:57:55 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:54 -0700 (PDT)
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
Subject: [PATCH v6 8/9] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
Date: Fri,  1 Nov 2024 11:57:19 +0200
Message-Id: <20241101095720.2247815-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_025757_483393_452ABFF2 
X-CRM114-Status: UNSURE (   9.51  )
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

Changes in v6:
- none

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


