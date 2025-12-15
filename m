Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE080D5B170
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 10:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=df9nR8VZxWqdoDGlAC2gMzlQG9390TwrDoFTIv4go2s=; b=EazGETRU5iDyDMLjcwlPViGvDv
	jZMrEhyDeHArCE29Tgl1tjvmGhXMkZwlgVo5Qsk2AgE+IX6AIu9tPn2ECG6qICHM6/LgRV3zEZaTb
	lXeqXvIqsw2sKPfdtOMA8RROeUmFCZaPDHZA1Oolm81VKDBjJeN6LYBGiqdRxPfH5Go0aTBopr8jx
	diG4MkIjyPfTbHBOrVMbeY4hkpyvZMPi1kQaFsMTCIlKyDbt8zyupiJARegMr07mhr93RqZrKS8kT
	HWZEuym8kvhqVX/ZfQgSb0Ms0RZ7y2ZRef/u54Bjng6lNQJ7VxsczJzeP2PLy3Bn3djezDIXEKGd3
	tAZmYiBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6Ad-00000003TnS-1Rvz;
	Mon, 15 Dec 2025 10:51:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6AW-00000003TlM-41Tc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 10:51:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477770019e4so32960685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 02:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765795867; x=1766400667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df9nR8VZxWqdoDGlAC2gMzlQG9390TwrDoFTIv4go2s=;
        b=1YM/D9DdEav6KnJL5R+KculLsN+DNxREh+3US0tAYpFQ8BRRxmmKNZxvMgobmTetpk
         MGccZL9DLTHQj4Fougi4W12+M06V297gmpm9DZK6AAbHgMoP/VjN4kn+5kfSf4ZlO929
         Zfc8C2FNCDooq6LTW5CW/zkEedo9ZhNBALhmGOCdmaGYqNrHtd8TjRA7FKsMoDCzoLj7
         jxxV46V0+ZubAUtIljWc+E4CZFlMKrapNQgM+Y3z+JamByMw/s/6T4R9CKpd00Vzj/Os
         SE9rab16zk+pDMaud+sbAWiICY4O6pUb7uTIwrsGphWwLctkMhhuiLK7Eeh/D3IGnyUP
         2ZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765795867; x=1766400667;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=df9nR8VZxWqdoDGlAC2gMzlQG9390TwrDoFTIv4go2s=;
        b=o95m285da/PFxJjxIty45YO2r7B/BTRetx9Qnp9S8x9ldO4cZ9CoDgSQNWpnjCEjRL
         V64ENC8njaVfNbjtahnIhI0rdRUr/MVT/skoI0kq72tO8UN1V2XUn4Cc90i9Dver7uMB
         +1GBibuEtesFX3v4v5q2JM7sWyat6pxKE3ghCQVnpYua0d1Auiq9wS+PeHwek0dGJM5z
         mqbdBMBfx/dIdOkS9agoY0U0Teno/3wNS3IuVM6xudyQLt7+JNV4aI5PhEjKdQObj+ph
         qKvdkcCoW4noKqdjsy2tzhAalFmSIRG4kxOBwEjJCGITkwx8UKRG03c+PkiW+BQVb9mS
         UBZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHdxevLzCw6vgJRE/7KfEW8+HqTMUnLMArOxIRTC4zaC+D0BVHl0h2jmjmWP+firzu+eOUOUmyuAA4tJKNiSij@lists.infradead.org
X-Gm-Message-State: AOJu0YxPz8fBoRfGgw68RnwqZVdyRCFfxPH8QWjOOB5U40Sf/5QpN6YS
	Ot82BXuK1QxD/RAulnMQ7p8qYnzFxjbgOSMY9w25zVTg/Ca5rGDW1WjJ9DU0WDJQNOo=
X-Gm-Gg: AY/fxX5fhwTXhZZ9DAlzKhYHlUYvVd3d1VSLiRCJT15QejvIqQYOo4ZGQJCqboLSPoe
	+DzumJ0wvlr30t49+bfB74HBblhhGgUT8ZBP0fBd7O4u5D+ZMiDRidzOSrqd8nRARegemAXnhqS
	z6K2N60HWCHfRK3tjOw3y8OCR8CvpqZMU5ZdhNMeez4ZC4frmD7SHiqfchFjx1qMzQ8BNyBZSrF
	gKAf5EHwNPW63yRrMTuO+hAWwGF3UT/D/qQONOb8wtxT7laXTrZJ/Jhmb3zuNrsRa2YUiDs5urn
	ZVrviRjZJe+N6amwzQvYB7jMP+ALzWakFZ/Wb/NluVGHSUAFXjZ5bn5aCxHyoy/S34ocCxXu+D1
	mo2oZsypvgsx2T36ZzcUuJSR610q6TAQypJ56r2wiTcjA2HU9ybutcBAb0v22POzmJci/YvIRxC
	orkqKiOQxzcBzL0klFvuuXiTNw
X-Google-Smtp-Source: AGHT+IGQkDPSiIqBU16hW6pkKLW9N/W+yMzLNnRQRqaDZA+xNXh4rMLXjgTTwvCUQbRtUa5UMQD+Sw==
X-Received: by 2002:a05:600c:8b6d:b0:479:3a87:2093 with SMTP id 5b1f17b1804b1-47a8f914528mr96491215e9.37.1765795866989;
        Mon, 15 Dec 2025 02:51:06 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:3f77:1837:bfee:f255])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-430fb078e56sm7695439f8f.21.2025.12.15.02.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:51:06 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20250919-add_video_clk-v6-0-fe223161fb3f@amlogic.com>
References: <20250919-add_video_clk-v6-0-fe223161fb3f@amlogic.com>
Subject: Re: [PATCH v6 0/3] clk: amlogic: add video-related clocks for S4
 SoC
Message-Id: <176579586619.1510096.14461375977036233686.b4-ty@baylibre.com>
Date: Mon, 15 Dec 2025 11:51:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_025109_024586_9E19F2F2 
X-CRM114-Status: UNSURE (   5.86  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/3] dt-bindings: clock: add video clock indices for Amlogic S4 SoC
      https://github.com/BayLibre/clk-meson/commit/29c4f32095d0
[2/3] clk: amlogic: add video-related clocks for S4 SoC
      https://github.com/BayLibre/clk-meson/commit/c78c9dbe2bb9
[3/3] clk: amlogic: remove potentially unsafe flags from S4 video clocks
      https://github.com/BayLibre/clk-meson/commit/4aca7e92023c

Best regards,
--
Jerome


