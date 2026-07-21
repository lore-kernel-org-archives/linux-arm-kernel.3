Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87FAC44534
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcG83pWDuxaLzQNicOj1pF1B6XObkyNl+NSmg3vDNXs=; b=iOtcobR6XAFGvCKvaMLw7Qb+CR
	2BZpeBXQb6e6TaZFl8lKwmHAvqilAw4OmqZJsZKULERYeyfUZHB3+2fNPk3p6tuLDhL6BwnA9n/qL
	hVckZ80yBb0cShsrkpAhDBSoqmtuV7otF4z9wAnc+mRv5RfH8xzwe6xXkB55dH21Xj73pqGMDLPhG
	LqtQ1LRSR6hx5UvJboGjeWM4OwNjHkOBGbC/s8fIL82ChgrmnBHpt+KeZpbl5yrgpcankZXy5V2eh
	qzo7gKdiz7qdk35+CULbzmFpxHJZGnOJyblowCVRsyEetKQdr648PvYv8P3gWaH6iXjt/c8ux0aod
	uCooYhRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JD-00000008iBt-3QhF;
	Tue, 21 Jul 2026 07:54:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JA-00000008i70-3qBy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:34 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso126392285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620472; x=1785225272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcG83pWDuxaLzQNicOj1pF1B6XObkyNl+NSmg3vDNXs=;
        b=NACoio7V34uTvR/OmksJdFdA7effoApaSq2kUz2ULfxKKVEFi9j5/LZE/KG2yqpDUU
         iuSzsFWwCN62c7jxLuOTpiSAkNwLJDG1sQBxUDJaB+dVFxdMMROGx2AlHVBL54LGZ2oE
         ZIXOQIAxazO2cV1PA7yBdMFmOeRN7E9XRmNAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620472; x=1785225272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcG83pWDuxaLzQNicOj1pF1B6XObkyNl+NSmg3vDNXs=;
        b=Jwt6HnxYDHKKMENk3/JQt3Q6oDfMiYoOIu4uN3iFKnjSdCbIXECUzyKEvBnXSHuUv5
         Az5LRt1Z1M3QvKjzaroqAcYj+CH5WDwuxXBjYqIwns5tiI3glHrg1LDZKcGk8lNDYqNs
         1lsWWHjVaPw6ysRRzk6yD6zKSE4zmrPepJ1yMR+zfpkswXlp4/v1nC1CFne8czittEbG
         tw45udq/QrSy4vsp8JzoLbKF/1P+7oGlHRO5Apnxg+t2v1Cv9IRQ/W1vCYEs3vPe4/2v
         pHcwkKgBqZUvXRESIfawRiRn89X7z/pmAcVpHJac/8xAqa1csQLIxFJkEcDUpl8VJRz4
         37vA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3fQNHdvP5fRU+xG0g9V7EQrNdOu8U/Rx8mTKIyhU6PcxY8vV9P2A+6ugqKuNn/kJoinB3X68jW+YZFZXjiALH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+VQSIe5xmqRfcYIVTTpJFY11cpHlb0+j/+eZ+IFjBdAgbR8uj
	F3TdF4fPrq4irUwy9viuSo+SxxmZzUJStdhcdB6kGernHJay0Axqc6YG4xfioHtCJw==
X-Gm-Gg: AR+sD10X0DcNvgjF208karjbYsHlJfKXVgopEY8F9qujnFq4DMiuZYecpkV8d6vJ2Rj
	zKim0IB454vkmCF/MW0XkpbYwqUcAJfgGm3nU63PHMNH8ZdIM8c6OdfehQInwfhplug/jcp8+zz
	nckqEue3NQQkBp5n4BVTUMVQpzU2W5uZQhLUMsEmGLj2S5kmwRuWPcA97hKEz6pF9CzvGIgZV/5
	U5ke77hBt5kZ1cfZhGuEWzlvr0MduV5T+DO9M1mm4tBJUQZ+nH3+dX8QuCVM5DJKLd4voZmmnr6
	UOyW0ihe2LKt4eVTEHA0C/edlMTkAqBr1BneYWhxsn6+Zogj3Dymc5P44ivMkfsSDlts1h3qlwg
	kIdqHhFe6ggNqZSzeJYJ3sqhsE0q/A12eK0TEFymqSBBNBPmYtTatCd1H9UuuMPJEQMN5CNURnk
	aT/nvjbX7sHASWHi9T/UA+HVvArSsT/Lf04LG8AbWAYSOT8XIBy6RPBfA/9v4VIGzw+OqXVA==
X-Received: by 2002:a17:903:2b06:b0:2cf:8363:5ab7 with SMTP id d9443c01a7336-2cf83635d95mr15956285ad.26.1784620472296;
        Tue, 21 Jul 2026 00:54:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v3 9/9] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 21 Jul 2026 15:52:23 +0800
Message-ID: <20260721075226.2347933-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005432_965369_EAD16B9F 
X-CRM114-Status: GOOD (  15.01  )
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

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.55.0.229.g6434b31f56-goog


