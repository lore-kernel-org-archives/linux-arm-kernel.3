Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3195CC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ldpUG3RjUj8mnzv+gkE4vA9SakuHuQZI5B3d0F4kgdI=; b=w/tmnolbuEghPsMxEJjKrq75xr
	3wrfxN1uqb3vJwCeboLMkaV1DEZIw+56VoFTMABimo3bP8PHHvXjgeNLQ0eWXc2NVlXr55AomBV5A
	DtBTQLngNKKhYq0v6gr44jle1AU41q7LszqQVb5nSylKQ0PyqGOmzZs6wH8NcYbEmj45+ApaLPFib
	OU/R+NHP6/Lwt7eJYBn9Qt3jXNZmLzVwm3BCEJKl3pkTnEvTh5tCfm0yVlszEWVnykS0PZ0OgFrw+
	DPOS864EsAewbmOdO5F5QUPHx7ngLzd7VdSRrMDsoJNfytOkaIuDCTBCjPhYluxAxoHcSRZ34NgHI
	MdGjlE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPXj-00000003ars-2OEm;
	Mon, 27 Jul 2026 17:55:11 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPXh-00000003aqr-1jst
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 17:55:10 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-ca913a601fbso2224396a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 10:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785174908; x=1785779708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldpUG3RjUj8mnzv+gkE4vA9SakuHuQZI5B3d0F4kgdI=;
        b=OjpJ1A2SPLtMEd8toGZescr4CqEAAQEUBXOAKxwAgbJ19HD1WYh2oG6FuUfQ3ATa1t
         DfZ1r1siJSp1/H+pQMwh167kraQgC3osM+wu4ueT2zqzXFQavqkuCNqCi270inTkyJ9B
         22kFjk93B9vvF5W9HO/Senz3o9sw81jI4b8bVOMT3Gr8GnOZk0+SdtK4M7yOtqXOVw4b
         fv7AwsiQWh9HTvL0FaKT14pIfP0xaOq/dGAYyxlyDkM4aW7madViOXj4xyjkld7PyZZP
         L74MSHpSQ5z+1hVlazg4tNMBlWnN/8tRg6tnchTmkEEUes0bHwmuT6r1FtR+uX4IZ1KO
         4vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785174909; x=1785779709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldpUG3RjUj8mnzv+gkE4vA9SakuHuQZI5B3d0F4kgdI=;
        b=RueSFCyM3PtD2MBQODa5XMkahjZpY/U9rsXtsTV+gAUopQY7wCMwc+o41A/qY73/p9
         cF282/Gxzv/nbdIgRLv0GjP2hdB7dvagb8Qbyai9Bq/simrEZgWde0C9OD0go1oCn5BS
         XM5WQvoSCMp68/+d12mncbzYov7DOJ4uWzWq4uojiIaKtdcwYfzdaX82cke5ScYtNf7o
         BgZ8EiZ8JQ0ty9sWMkm8T9hb9W8lTuDKXPIOOU5fyUojGg7OPJBvzK4AnRJXxGlqO1P5
         lFch7iUQP+qd7jAfP9+bbK5tBu1vBXmC5pb9Ex8wnbtobxFtNyp/C9o+0fPEg8TEySes
         Bd6g==
X-Forwarded-Encrypted: i=1; AHgh+Rq9cpVnzQOopHHnQc5zhEUl7nRIR3pKgy1jtYiXTybGF2Uq/SDwyP6nDTGSDnHOdQaBVwJWqEfnmnb/yqfToMWT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj7MuQJd6fmJnZVGwLh8dtczh/Th3Z+Hxu5koB/7Lm5AsQUvJX
	S/22fwx+9tvYm3gxByYsnjmb9B8idw8ltoTfZcuYBu3+opZunB3mYw7I
X-Gm-Gg: AR+sD105puDXrbQx6rXy/rCH60sVDkldB2ObZWvdgUB3DOncm18VE002loGff9Ng4NR
	MWMcXz7RZaG004EJK3hU8PzD/pjt8Ouz2R0dDM6nASKyartt6SnJhPV4bF+XOAYdZEJlx0lnznV
	pN084brdMEY6Vm29/6OjAuoP+Q0OYVkXCPln4fo54rd2TU7hSjH0IHft3BuPui1nmYydOsyuOpt
	hifGcxzu/0qOYwfogFx341bgOksiQ5IO82lkxj/OWYFhF9R3EROAU/h29Uh4oRBduqbYI8IJNTJ
	cKojZYmTOePa372Q/pWekg10113UKu8OeXMtHV19iMOIeyYp6pUuugw3fPIt38y5B9kpKvDfsQ7
	yDBcz9VdEeT3lR0AW06TsK2u57+0/EqV9mFtbnf5PwVIr4fkXwFiQJUYBuV7BlTRw0IVrQKEi2A
	5MvQB5XbSkNdJu8znr++8qjeWLMRFbJe7f/k3BfJOTrnaWOe9jvMg=
X-Received: by 2002:a05:6a20:7288:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c6c7d8a1b4mr557496637.40.1785174908362;
        Mon, 27 Jul 2026 10:55:08 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:21e4:da15:d321:6b72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59434fsm34566612eec.24.2026.07.27.10.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:55:07 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Drop data-mapping from Engicam PX30 Core
Date: Mon, 27 Jul 2026 14:55:02 -0300
Message-ID: <20260727175502.2585290-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_105509_455911_98F64F12 
X-CRM114-Status: GOOD (  10.12  )
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

The panel-simple schema only allows data-mapping overrides for panels
whose mapping is not fixed by their compatible. Consequently, the property
on the Ampire AM-1280800N3TZQW-T00H panel fails validation:

(ampire,am-1280800n3tzqw-t00h): False schema does not allow ['vesa-24']

The panel descriptor already selects 8 bits per color and
MEDIA_BUS_FMT_RGB888_1X7X4_SPWG. The DRM OF helpers translate
"vesa-24" to that exact bus format, and panel-simple falls back to the
descriptor's format when the property is absent. Removing the property
therefore has no functional effect.

Drop the redundant property to satisfy the binding.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts b/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts
index 47aa30505a42..aa636ce45e3a 100644
--- a/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts
@@ -28,7 +28,6 @@ panel {
 		compatible = "ampire,am-1280800n3tzqw-t00h";
 		backlight = <&backlight>;
 		power-supply = <&vcc3v3_lcd>;
-		data-mapping = "vesa-24";
 
 		port {
 			panel_in_lvds: endpoint {
-- 
2.43.0


