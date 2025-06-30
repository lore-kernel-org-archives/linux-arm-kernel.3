Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EE0C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkT/Rstid8JISpjAt6SdqbTq9GQ5RgC+pCfbEEzIrEg=; b=wm8Mze/lZG2eWz7Hs2WvhXIXOy
	PoTmsC6n+fcchP/IfKGao4LKFbgstj0qY3uMxOfjE4p7h/XPlAlVnMIGchjbD5CAzRhWzTNFU4pwE
	KgtJpF7o8j1ujvLiChK95BJeVwDReQCorZxxJIxNBvLOliaceCd5hOrNa5hllxjAT54OSN73xwmlJ
	yDTnrmHQKOuzdtf/jq9a684mX05ANiK7kyw8tOMLvS2KCwNLFt7cMihycvQoolmTaMzCjuDlc7kxB
	o7IW5yMztAfZFGqQrTSDYgu9/4iKp3R61N1ilzBg6RnkUzV4sm/alGV2m8jKx0zAWv1dmg4CRGrDr
	Sc0ElJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBUy-00000001qml-2p8X;
	Mon, 30 Jun 2025 10:12:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBJa-00000001oiy-2S2A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 10:00:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a365a6804eso2176859f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 03:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751277639; x=1751882439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkT/Rstid8JISpjAt6SdqbTq9GQ5RgC+pCfbEEzIrEg=;
        b=kM+rooUo2zFvvDLKPr0e2CVkYAqFqqwo4uuLIb2EWYtPFyzR6D7mFGul+b1rBxwhG9
         ImViHKbbpE99fHpr9q8bP2DnCvGXFWk4KsdpMiPBI7pQHEkglL+gog+LcsKkYUKLarFm
         fuLf5l9vcvhIK+I4Qr9Fm63Uht6saqccRJcKhB/+HHsZKSRcP8pXg9dyzmA6Gk6t4jyt
         TJjGd+8rPliyewiT0BbhoGpr+EIi9EGU2qBfcm3exJYIfAQ+xerXmNj/ES7ekqW+LcDY
         He9GSMy+e1eFjwJA4hYg66pKW4bq4Vl3NPU9WP6OLwdLEWD3deg+upDZ9wfD2JBYgRSJ
         lqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277639; x=1751882439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkT/Rstid8JISpjAt6SdqbTq9GQ5RgC+pCfbEEzIrEg=;
        b=wFkDt+U/kXzV+PYSdf96st8Mg4Gmw2Ij/znUVlq/vhsOo/oN2CQ2q6N/yqMlZ9ZEQ0
         8oOqFG05aGgYqZguau3uqYdRuXQ09iialoB7McJyOg3DWy5yReokXaBJBajEmW+8dGsy
         xBhGlTLA6xfegAij58ExlILjQdx0jcjN7HxGtZd5xZluGe/7Xgc8s+XR8yhX4Eic2inX
         8uUzKKOu73JsNc1wWituB0oomVeEs5JVXpoTUdYQZtIYMSf8Qim6j3w7GXO/tYnLY/cG
         bn6Fj/FzadKSpaS385frRbpwyP5IsFJN2tFx+WS7V+SwQ90/Jy3lOwD7aY6rKedYuD96
         guGA==
X-Forwarded-Encrypted: i=1; AJvYcCVFzMRP87QXz9ECsPDsbJmBkMq/Pgp9eaCH4uPD2vjT+G9aLzlt3HeEK7JXkhNVsnwM2518TyDyOGwDf3k6HWZd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgt1PDrfc+WUx2uWRyeBQFjmaoeY2uXtTtFAqR2vbl65XsB/SA
	iz+WKPWcoPKd5U2rAzcQc+1WEPAGfncVVO64dsQfMgkz6D1U9zMkDxIl+I1D/Sqitz8=
X-Gm-Gg: ASbGncsAIB6QbItAM47E+PnaYm7Jca6LOrCWQj30RGHcDrIgSFfMu7fbwQ9GpgOhIws
	9AzjdpRp4/i/5iRGe2koptaqV0vMI//4Qb6K9qAjwGwPGSGR68yQlaXcXGJLmUHKYVxi2pqqMP2
	StMQR83tKnym+V5OtwIDUvzuiHIGH+VHB+gghGHSUiheJEy5e0ijaQwAF9IOQdbMlMmfDE+MU3v
	+yMPMp927wPpfYkEaN4eIxhp5bDSvDehaBsdThsxyhLMNWJHu4sa+5mKvlcIU9YtrWSgefnUSgD
	qnae8boCLqlGae95klUm9KhOl/UxQ1TqjfotMV9w4b/3fbxAA+0Vn/RGiC53cw==
X-Google-Smtp-Source: AGHT+IGr8kDpio/yTc2q7sbJPgt53a5XcrIQFYk6F8xhvZP/fdYVNcvrjEwO9kaxLpdzOyi51LJFFw==
X-Received: by 2002:a5d:584a:0:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a90be8d151mr11063926f8f.56.1751277639515;
        Mon, 30 Jun 2025 03:00:39 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:279:fce:4bb7:6daa])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a892e52bbfsm10076002f8f.65.2025.06.30.03.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 03:00:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: amlogic: remove unnecessary headers
Date: Mon, 30 Jun 2025 12:00:16 +0200
Message-ID: <175127759469.367173.10851786033226658116.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250623-clk-meson-no-headers-v1-1-468161a7279e@baylibre.com>
References: <20250623-clk-meson-no-headers-v1-1-468161a7279e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_030042_626352_922E96CA 
X-CRM114-Status: UNSURE (   6.20  )
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

[1/1] clk: amlogic: remove unnecessary headers
      https://github.com/BayLibre/clk-meson/commit/328d4a7eb073

Best regards,
--
Jerome

