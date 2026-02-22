Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE0FC624D7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 10:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t98mLj8w4amE5ycgxlNBP+sdq7EJCJ2CztJb+0KFU28=; b=U3CoZiiG7ONLoKXWb9tNNJ3eeo
	bauYmdBtSrw/kAu+EfLUquBReZXSMS5tkdzVbKxNXL7Qmq5fvDdAknA3Xia6r8UKsd6Hrs83tPqP6
	LYIPweJ9TjSF7YZylf4OKoPafqrET+BPKpWchQx82SnGLIzMSFrUNwlk2uYQHhUL8HYi/KJc+TlaL
	F6nN6fU2NBE9hXgKWkT2Xz1CD3/zVaSpRwYVrcuEi7gbX7sACypkF3QpK7gJzF+xP8E6vECX6f99E
	lbnYiBEqUkHe62r/7mIIgVumizqyVH+Dcq0vRQAat760BjJQyYXKTEFFF0XeAI/tS9qSV7yt9sQN9
	9v+N7hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu6u7-0000000Geds-0WvT;
	Sun, 22 Feb 2026 10:41:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu6u3-0000000Ged8-3Qdm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 10:41:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-483487335c2so31257105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 02:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771756889; x=1772361689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t98mLj8w4amE5ycgxlNBP+sdq7EJCJ2CztJb+0KFU28=;
        b=XSH7cUFtieh/RUjHnrYbT0qVOrYo4ma6tpHkLJAWAHYrgRc6q+4ttqSMUZJ0nBjsy0
         9IzisuwZPDRhhXuyNDdfM5f46w3Ptab74Q39og22L+Hm7Olu1RNi+H+kC/P92Oqo8X1Z
         m+GC8O5Z/xEXroQfSfASHXAZWHFOrT6XrdN0SCKKF00fZ2PwQSa/0ZheXnY8bmOSiFSy
         RuSUaSyAYRbiL6edxRNuzneycsXS4Fc0uDRHUnM0BXJdshY2R7u6g9g1iRVlM7nAXbdl
         +QTdtbRx5M0QhbAcGeffuvmPDiWzWV3/hWi/ngWXVg6SRTuo1HeIZBSjbKiBkQK62G8c
         vWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771756889; x=1772361689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t98mLj8w4amE5ycgxlNBP+sdq7EJCJ2CztJb+0KFU28=;
        b=crLdHHdXKe78/s3WSdPkqn864mYakXVIeTiohXV77FBqCJPvWTBr+lMH62o7NAfsKy
         Qegdn0/eEWf/wFz4b3ONxFJBLQBKIhiADbdoGABolsYSZdtS8/ZrtCByUOnMbIJ+y5Z6
         YOs1ppZihL6QcbLDZn3INGVeNAvUr9mHIJvJ6FzhiVMf4J0U/xoz+znBVUg758OquGT7
         G5Wu3rYUv09Me/4eaOwgf+yJA7MyoJcBQuOQnDvbgKvK7wnsO6dyu/rM1AAvQkp0CcZ/
         dqW6HVnlJ35kL2tBL3supfaYWwSIDpOBV/EWy9Trbx6d2o2mCZ51F1SewHBRb9tJ2q6g
         G6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUB+LhVRrXaKTxX8EsAWppp0PEGVivk3fRzVVaZnVfS9tWaRuswl+wJmaPB4OkVlCU2tH1ui/Jtc6icX8CVG5ar@lists.infradead.org
X-Gm-Message-State: AOJu0Yzorj4yc0E/74iv+DMwT4wRJvqZOzC6NZhcpzRxYgsujgEW3b38
	naXufNYGTwvEPzYK890H9EN84XcsRt8tBqw+oTtbOYUHAwjQ7rY+eOwl
X-Gm-Gg: AZuq6aIAKGjg5MbogRMHwB9cwR3QIaC0V3PZJCGMuJx4M9914PKfbylNAESzGJqBPZ6
	gwj8h+4rFzWFrjmb26zvko2MyavPoMfZVp8a+5Jr7elbWI52hNpY/yzB2hI+hu8wolMO7YdUN80
	FNzhwilwPk7lrWMa6kteNT2zGxIV0QS22vqZlDENQzjcJnn2zqMvUogrYppkIBs32q2myac/O4J
	g1ICscAtJVb0wNLEshlOncuXNOuWNSsdSdMqBVZXvFfoE0/L28/xstMTwIuc4+fPtA30DcLNEIt
	ofW0X5d1SFEdoHxBBZTHI+CSRL/Z0mK7sHaG0XFY9oF+r8Ulr/7yC3qd7l2RPqhdqaudymcmjsd
	3+UPZjrTQw6BIzEl+1EOWmArrwtwsTKyMHWdenlx4frcEDylp2mUJ7xRwgHskUQ2g+tG6K3ubam
	NJNSww8A6Zfa8w3Aldc1u8L9/U/gq1FDaTXrz25MKZO+04T1VAaJNjW0JF8qVbei1FEA2Y9i8gU
	DfR3deS
X-Received: by 2002:a05:600c:a00d:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-483a95e2535mr81859115e9.20.1771756888545;
        Sun, 22 Feb 2026 02:41:28 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3deb73bsm59542655e9.3.2026.02.22.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 02:41:28 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH 0/7] rtc: sun6i: Add support for Allwinner A733 SoC
Date: Sun, 22 Feb 2026 11:41:26 +0100
Message-ID: <5061953.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_024131_896852_850EDAC8 
X-CRM114-Status: GOOD (  15.24  )
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

Hi!

Dne sreda, 21. januar 2026 ob 11:59:06 Srednjeevropski standardni =C4=8Das =
je Junhui Liu napisal(a):
> Add support for the Allwinner A733 RTC and its internal Clock Control
> Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
> SoC-specific RTC CCU driver to handle the hardware's evolved clock
> structure.
>=20
> To facilitate this addition and improve driver modularity, transition
> the binding between the RTC and its internal CCU from direct
> cross-subsystem function calls to the auxiliary bus. Also extract shared
> IOSC and 32kHz clock logic into a standalone ccu_rtc module for reuse
> across newer SoC generations.
>=20
> The A733 implementation supports hardware detection of three external
> crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
> the driver via read-only mux operations. Implement logic to derive a
> normalized 32kHz reference from these DCXO sources using fixed
> pre-dividers. Additionally, provide several new DCXO gate clocks for
> peripherals, including SerDes, HDMI, and UFS.

This work looks nice, but I have some questions/comments:
=2D you're missing RTC SPI clock, which is needed for RTC, at least accordi=
ng
  to vendor 5.15 DT. Could it be that this bit set by vendor U-Boot so you
  missed it during testing? Manual says that it's disabled by default.
=2D Vendor DT has strange RTC CCU phandles for UFS and HDMI. In first case
  uses RTC wakeup and in second DCXO, which doesn't make any sense. Did you
  do any experimentation with these clocks? It wouldn't be the first time
  that either code or manual contained some kind of error.

Btw, switch last two patches. With current order during bisection you would
get a complaint that A733 RTC CCU driver is not present.

Best regards,
Jernej



