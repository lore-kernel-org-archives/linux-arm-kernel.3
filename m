Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984E8C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/5F0oA5i8F/L34a9owjNm1QgCmiW32I4DyCKgmPKrs=; b=mhJzyt5PdMYjdAI208LjZCYQkh
	fB78CXf7xX3rAQu3IXJ5onAzFJFSvu7lQTU0ub/iiN1deizdNKlGGfx0hKoYSc024Q0m/8lARI54N
	+wPvK5lQ9eF7TovDDsqFtiuMIkwmNgmTMkXrj50UTg553aQt1pWmahxTtSCcluqUtifphgg92DRFW
	RtEmszAp8avhSt9wkmjsOsrIaeANlEUKY9FsIqP9hx/65U2NIdsONYdvG1jAdzmPu9RvrDTNV1x6f
	M6BkzKYfmEJ+AA5ARbh5DwG7o3MhEEPWEx1QerGPCOG1iv3zXPWguN3DpwhmJIYxxKFLJRR3avC0n
	2zHyteZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme47-0000000Cm6o-3Znn;
	Wed, 22 Jul 2026 21:01:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wme44-0000000Cm5X-2Hw5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:01:17 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4758bd3731bso5208812f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 14:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784754074; x=1785358874; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q/5F0oA5i8F/L34a9owjNm1QgCmiW32I4DyCKgmPKrs=;
        b=lx/xMOkMrt5ODeE132V9ZL2nzKzJ+wyLpqHlMQMs9xLTifMzONI7bviAFC3M02EhzG
         +Kf/YmcReqF036ClevxT55P8xOtW3cLDASCiQwVheKI3ORII+UcG17e8Q5AEUbxQwkF9
         hjfW3Ls5WF6qLaASBgyAuzHthuyWNnB19GAA8yTDBfIyejcvAKsrenjWrMy3/ZURGuwx
         pZjhFKfUAt50qmkrS9w+5UlRhruAjq1dsmPHVVHy55D4XQeMgKL5ZvOaORZuBqNCnBI4
         NYVQZnqInj2adEIgN9vwjrjgegRtewtGDW9zBALFiMP3yEnK9VBlzQa+ERq2D/DcRUct
         FqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754074; x=1785358874;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/5F0oA5i8F/L34a9owjNm1QgCmiW32I4DyCKgmPKrs=;
        b=DHOVKB/DCi6ofe7VPWI6CzptMPNkbExBxeFkoCy1MiW5cD5VPTtGYuikEnPBX+nMOO
         AjatGWYgpbVTQrcR/xejBVtsOoD9z3TCs4csmzLXyVVncGcOrfIPENCWR6Qs7qyGHvbq
         7VbFVV5g5b1LrhFwRvqrQX5LS0ec95eahySxLHWl+eMsJxx1WB9BBhszGAoqGXkX5V2+
         s3WzsdHJkRVYrL5dyLjCXN6UusmEXxqMH/AJ+eUzpTAAL71buo0/i+3ioWde2tUj4fA6
         PckIt/HAQjKj3D9W3iiLUCWZl+HoENiSEQNPBvCcEBaWen6Rf6ke4vS7vTzuB9qhQqL5
         fkCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqek1Ex3i+2rlu4n56NUuGpIN4Y5l3iasWuamm4Elhg2S0bdXZcopnJwuL57DV1t1Gqg3sZRi6Aq95CMcrhRALj@lists.infradead.org
X-Gm-Message-State: AOJu0YyU+P6aQHc0wIIQSii5kkkSungmjeboUqLv3D02kSndnh1dLv1t
	jSRDfEy3BWuoYR4hpilBCzni3gZmKU40M+GwyjCfJJ2aCMo7tvVD8C6P
X-Gm-Gg: AR+sD12f0rQa4LezrfnfCfeG/UYKXRh8whQWmhhCybx2T9I0/24TYq3PEckntaIWX+p
	HdyNHpblS/r2uTmP/l2WTNOKi13f4a74S11CimEi+FiIwHmV8GydCmzn3NAkJpZRiINvOYjwJbX
	TcoIJoO1el2/VfDXTH/vDDltL5eGqx7zNI7vDbU2aMeRBwv/YAXF1CCB7+KZ/Q72DrsbpkhZp0d
	7ePLHMCunxh8GAoh+CvmWrNdaFmhN6UsWHVgZEuBZrjlVgPsBtVqApEv4INsTdLghOD4wnFpJDT
	WDPBz88XwF5UmzHDMUaUt9Vwu0wojVNY7EqtlEp2gEyZz76y4Ewke/RgB9h9KyyPiKLZJrNF8TF
	Se/hW8XgFvEzkaq5GTbKh0yh4dtjKuHjlIK3+g8PE+g7XutaO4X3S6/umg5WYJq0nSs55VukCwj
	R2dhn+1ud+VyxV/uRUarqtAAgkoX5Ea4eeCgE=
X-Received: by 2002:a05:6000:42ca:b0:45a:5392:3a19 with SMTP id ffacd0b85a97d-47f840c94dcmr5450029f8f.16.1784754074458;
        Wed, 22 Jul 2026 14:01:14 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm8610812f8f.29.2026.07.22.14.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:01:13 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	FuginInsanE <FuginInsanE@googlemail.com>
Subject: [PATCH v2 0/3] thermal/drivers/sun8i: Add support for the Allwinner A80 thermal sensor
Date: Wed, 22 Jul 2026 23:00:43 +0200
Message-ID: <20260722210046.2932498-1-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722203341.2917852-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_140116_646458_51B1DA7B 
X-CRM114-Status: GOOD (  16.87  )
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

From: FuginInsanE <FuginInsanE@googlemail.com>

This series adds support for the thermal sensor of the Allwinner A80
(sun9i), the last SoC of the family with an in-tree DT but no THS
support.

The A80 THS is an early relative of the A83T/H3-era sensor generation:
same register semantics, but the block, bus gate, module clock and
reset line are shared with the GPADC, the THS registers start at
offset 0x40, and there are four sensors (big cluster, DRAM, GPU,
little cluster).

Philipp Rossak posted a driver for this hardware back in 2018 as part
of a larger THS rework which never landed for the A80; Armbian has
been carrying his DT patches ever since. This series takes the
mainline sun8i_thermal driver as the base instead: patch 2 adds a
chip description derived from the vendor BSP (register init values,
protection thresholds and the temperature formula), and patch 3
revives Philipp's DT patch with a fixed interrupt number (SPI 115 as
in the vendor BSP - verified on hardware, the original SPI 31 never
fires) and critical trip points.

The A80 SID is not yet supported by the sunxi nvmem driver, so
calibration data is unavailable for now and the driver falls back to
defaults, which produce plausible values on real hardware.

Tested on a Cubietech Cubieboard4: all four zones report
load-reactive temperatures (idle ~40 degC, ~54 degC under sustained
full load) tracking the BSP formula across the range we could
provoke.

Changes in v2:
- Guard the calibrate callback invocation in sun8i_ths_calibrate()
  against chips without a calibrate op (would have oopsed if a
  calibration nvmem cell were ever added for the A80)
- Do not enable the alarm interrupt: being level triggered it would
  retrigger at conversion rate for as long as an over-temperature
  condition persists; only the emergency shutdown interrupt remains
  enabled
- Note: the unconditional IRQ_HANDLED in the existing interrupt
  handler predates this series and is left untouched here

Philipp Rossak (1):
  ARM: dts: sun9i-a80: Add thermal sensor and thermal zones

Sören Hantel (2):
  dt-bindings: thermal: sun8i: Add binding for the A80 THS controller
  thermal/drivers/sun8i: Add support for the A80 THS

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  1 +
 arch/arm/boot/dts/allwinner/sun9i-a80.dtsi    | 68 +++++++++++++
 drivers/thermal/sun8i_thermal.c               | 98 ++++++++++++++++++-
 3 files changed, 166 insertions(+), 1 deletion(-)

-- 
2.43.0


