Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA3FC44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 01:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWPYffNjafyuAOVGsfoGgw36TjYG2N8QaPcc9w+7yyQ=; b=H2lxH8jqHrYpPbv8W80sy21M/F
	tYmpJLlDI02LI3A0ERlQ/9tY4logB7fahOjg1gyYQVlNQzaj9eqkSqff3AztOeJCM84Z8tbNqfmGy
	TcPnYi6p2iTbavCMJdP47sMcQhBK2W+UY0Htl32QBG8tCFWw/c5vGBOR7CMSw4opjTyGesIm2Gv+0
	vqohdFZEwkY7zapnRj37ZMKj44tw2EYKhi45364RMBwhVSnEHwl+XAeD1qsXoZ/RXHiTpA4x+vo/N
	236omTY/0g2mNmEhwnVDmMwLYRbCXDSTAlOpsCdP3H54OFYLWK4N6RikSKhv+NvBPucqTHouf52rp
	IjJ0IyLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkX3X-00000000sQQ-0Mh6;
	Fri, 17 Jul 2026 01:07:59 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkX3S-00000000sNy-49U2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 01:07:56 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-81eaf3709b4so48078477b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 18:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784250474; x=1784855274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWPYffNjafyuAOVGsfoGgw36TjYG2N8QaPcc9w+7yyQ=;
        b=M6GHsuqTqPcVbNR+oOdh6yTtkapvfBfK7gF8MUu2Rw9t3X9oW9wnZ1i2w49OLX0P35
         5TV5fHVeU6B4kOchfjSoV4oAQzqsPciUXPcWi10Xnp9c2UTJ85pGx+WkXNn80IwmAsgx
         Y6DOee2KKc2G2T04trDvpfhcxxrtnr0fmrvFnN/PkZWDdRptG8mv4JINYrl9ehIBD4mo
         leW2uGr/5+DVfqbt3KMLXpn7Ca2D4W3E/kINSMAZcKlZceaik1KaJIvj/5ET6lKgr7c5
         EQwn6ZG6l5sn3HGlJ+Xzr0+6u0M3I0YOG7r8e1vx0L33mY3GDu62hVZzTaCN7+e2wWzQ
         1hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784250474; x=1784855274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IWPYffNjafyuAOVGsfoGgw36TjYG2N8QaPcc9w+7yyQ=;
        b=aGKvPANbS0jElKhTLxPAQ22CT2jI5rnI9YDcK8zSA5xNGhCuw2vioMWl1aufMfrh9I
         myyLUwLMLF+xGGsA74hHZNGiwZrJxHvwxn+ytsnCs2cY0ka6AKcXjfW3HvBLQx08eB7W
         He0M6BmoROucMpUnaW6UWaFh8zJGACKtuTkyItbuKUiSezFB5Sx5LIegoDmrn637xYU2
         VmDNc9IFm6ReCWjowuXTgXzteM31uKyUsyCIpzOGDdI+PloRWz5adePQI3KX17jPJ+Fj
         PXcEfnO9lv3KlJWVYHHJsFv6/8fR4pLbwB1EbnHkYYsGcVsGYeG5IXkLhKq/JJ3ZdDLh
         4myg==
X-Forwarded-Encrypted: i=1; AHgh+RoiRDNbxUtTpxtjAozHOyNiAFLv00pLH7IyZziKzjqV/aTPpBMHNdMlnN7gzEG3nXFi51qi8Gk/i+uh3CWs1Wv7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl/C7Ina7pMOUM8iXVrBN6dUYI5149f/EoXyfjitpRpRKxqcrZ
	tjFwnGzXwBdODKjUbnUDNksxeZN+C9g9C+MG8hkufTOc7m/wcR6sopkD
X-Gm-Gg: AfdE7ck02GpMzBmU0H2rKvIel5w8KJi9P2NSeHXi6XScYCpOaZnHJFaYf6uAiaMc1yk
	0feiTX3ywQlBi5sZoARMgnykx7NEegZh9aHyAT8V1O55+W/Tj1sjeeQdKqlzCSdAIV9cDuywp79
	aHmBiDryIzaKLF86XPlB9IPGtskeZOJimR1Ot+t314kJdvAbbpV2EPXZmoaDlIduv5QILEWr+Tn
	BIWAcFvPz0ykBU86B5ibs+kCt1iWTGgrf6+/xM/fwof5vIHvLd+ue2iI38Trv/YO88UgIniz/we
	UWOaonscUlRQO4TbRVc8EI+lYYjI5dSRqu24UzQSmTLYD+ooBTDzIVDyBrivfXkGBagiR1Deg7+
	aij0VXzX0GNjlzaofT70OoxVVwtpe45v5oLLjPh1zx5sF0ueVaQmNOqETNweO0Hvwq8lWJiPH4H
	yTzfmGiPna1A66ezrcRPZvS3WUhY3ppEEfOE2k03OoKORbLg8=
X-Received: by 2002:a05:690c:6e0a:b0:81e:8d95:3d32 with SMTP id 00721157ae682-81ef26cd37dmr324127b3.9.1784250474013;
        Thu, 16 Jul 2026 18:07:54 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a801:a24:e2d1:829c:ccde:e84f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e8f4c5d3csm159095057b3.15.2026.07.16.18.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 18:07:53 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Keep rk3399-roc-pc-plus work LED on
Date: Thu, 16 Jul 2026 22:07:36 -0300
Message-ID: <20260717010736.578419-3-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717010736.578419-1-festevam@gmail.com>
References: <20260717010736.578419-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_180755_039170_8CFD79B7 
X-CRM114-Status: GOOD (  11.11  )
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

From: Fabio Estevam <festevam@nabladev.com>

The rk3399-roc-pc-plus inherits the work LED heartbeat trigger from
the common rk3399-roc-pc.dtsi.

On the rk3399-roc-pc-plus this LED is the prominent blue front-panel
status LED. Blinking it continuously is distracting for a PC-style
board. The usual default is a steady power/status indication while
the system is running.

Use the default-on trigger for this board instead. This keeps the LED
useful as a simple running indicator and still lets userspace select a
different trigger or turn it off after boot.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
index f87bc7b6afc1..7e8039b19be7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
@@ -93,6 +93,10 @@ leds {
 	};
 };
 
+&work_led {
+	linux,default-trigger = "default-on";
+};
+
 &fusb0 {
 	vbus-supply = <&vcc_vbus_typec1>;
 };
-- 
2.43.0


