Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924A1C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0FlevvmCUo3pvNfguYi3e7oT4YWOah6gzuJqciMeBMs=; b=NCz142IpYFrkPBJh9Xxlzdqb9W
	EPUI1eF+n3F63+vIKGkUXY0nOES4ohc/ukZ7RKpePMrjqbX7Kh4GZ/RauBtua1BbLkg+/LEzcnDpO
	yxymB1yxKqh5Fv+KW1zZ0yU9rXBO8+bveWta8E7fCqQ96bkCiGudU5gut3D+YwCBrFVR8bX0fUJqF
	UbzxAC/wCembqXgPFmfO2qEmJAwA9FVuwwYgzvELyrn9f8LYfT/zyA8kcJZdHhI7ZZo7wPPliyM1v
	B8EB7GX9bRXDDRDAE2cTX+KlZ2d0uIHZ0wsGMzvcJ03L65y+zBJkLb8nv1kPqZVhfQ56I5wgZDern
	/3wCmIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx52-00000000KLD-0Luc;
	Mon, 03 Aug 2026 18:08:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx4z-00000000KKF-2fSK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:08:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so24977495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780480; x=1786385280; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FlevvmCUo3pvNfguYi3e7oT4YWOah6gzuJqciMeBMs=;
        b=gVdMNFakjsgb61gY4mg8en7VwMfP1xzu/Lg8wo0Fw54q4s6BE6ckYU6/WXjnWJptvR
         sqHfl1kC/WF1HGJMEVm9SH4T8L6SFh7Oq3FWUEjFwes7xHP2026aoI5d9xamGYg0y0Xx
         WGOPuqozNIHzX36jllxcmwvTbIsFtxCU3xNnBIoSkeK9Sk72V5ybw68raLlpL1OmYs4e
         jfzXgP21qRpj2NLVoShDcdnSX1JLRgr3sf3P0NkIRBZ3ujChpiVyXC7bEVS9m/5Q9+2Q
         FgC0eMsaWjOxjHxJUPplLypAnkKwoD+sB1Wc3H+wAm+Zkxk17ctWO4ix5LkmsI7GyeYC
         r6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780480; x=1786385280;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0FlevvmCUo3pvNfguYi3e7oT4YWOah6gzuJqciMeBMs=;
        b=eYxDJBF8a9uiqUAVHJ1ZLpw5TlgQZo/yZTMVtJuPpYKYRX19QWGhYpwhkoYKjdtAz2
         ZOvzmXv3gvNO00fw/EzNagiePG6Qyir9EMK69WRZcDUUTtpuCxR7VTV9loFXUtk4PN7G
         lOohrlSh5FUhpDQquuLsmMHV0qRzDQDcKn0dfGJEAMxAwON35bI+Qe4uag+weW1exR01
         QIbDkbx3MBCKYbXxHZb8jiZUGmz/Sa2K2IqJkf3aqn6JuY3u8kZKSctZq3gSiLdlibJu
         Q5ghH1aElM/YHsy0vs3BFpfjbwWwUfYW4sArNqhH8ljRZI0fsAuEflcCxJLUstM5PWM0
         i4EQ==
X-Forwarded-Encrypted: i=1; AHgh+RoklqP0luf5ihKVKEXFSSLur1O2C5pBkITN1SMQFqmp4NchTVrg/FVm0aX9zneC2lBysmNZimcLlN4HQkFcIOK2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxme7cJK+fA/znUOl/lwn53+f77oB1Vgzhj517IsGuzx2NortJl
	nhFk/giJrKCncKoHInDDqHtLhE4QUs3g1YADgVYNtXbxAv84GMDNXMGw
X-Gm-Gg: AR+sD11jYLjW4X9XK8as4ynj5CNR27yOqjHiYHzQroNFTc6WsfEzBNgJUVpcOkicMNM
	gLy83zVmr2sMpx3U0oXqz8GbbhLQMU9NxZvYH1iydaqLwuj4z2c9x7kyrUV6SCals/1OqdB2Hk+
	M8B8nE+O6UK5S9yzlYcElioZ0tfHLjTQY4JYIHieKeRCnYw6Cz2N3H5mDeQh07Ypaz70hZ0WwDe
	MPJGf097Z430JKnS4geEgSychLKy2S26h/TMsC9Xn90VQqpBdb8KlNAVuJ9UxzGRaVO27z6LuzY
	18b1ZjVFU9BvTeQheqOZluzbE5PuADLX7JbAHNXRjkFyXB8CMg018HLxGj+8J95Fwp/molHjbwT
	lBYTVQvIr43My0sPuCv+XS1o/pnhM8m6FZ3uqi1eradjz9oYsX3jjrmcBJgzibxrjahTV6vhP7D
	2gl5Vi7RP8SLIeRlyAfTuHTW0VmgPGDLVjltevui3shXW6me5PHuUnn9Ol5Sef3+iL96+1wSmpx
	S5UHu4THNG/KeJlw1cLuio=
X-Received: by 2002:a05:600c:6209:b0:495:6396:8b67 with SMTP id 5b1f17b1804b1-4980c649f67mr273458325e9.4.1785780479424;
        Mon, 03 Aug 2026 11:07:59 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm37950955f8f.14.2026.08.03.11.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:07:58 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andre.przywara@arm.com,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v2 0/3] clk: sunxi-ng: fix the A523/T527 GPU clock model, enable GPU DVFS
Date: Mon,  3 Aug 2026 20:07:52 +0200
Message-ID: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110801_701649_DBAD696C 
X-CRM114-Status: GOOD (  22.61  )
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

Hi,

v2 of the A523/T527 GPU clock series.  v1 is here:
https://lore.kernel.org/linux-sunxi/20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com/

The GPU mod clock is not a linear M+1 divider: the M factor masks M pulses
out of every 16 parent cycles, so rate = parent * (16 - M) / 16 (T527 user
manual v0.92, section 2.7.6.58).  Modelling it with ccu_div programs a faster
clock than requested for every M > 0, which is what mainline does today.

Measured on an Orange Pi 4A with the Mali cycle counter, the OPPs labelled
150/200/300/400 MHz were really running at 487/648/560/750 MHz, and thermal
throttling to "400" actually raised the clock to 750.  With this series the
same measurement gives 149/199/300/399/597 MHz.

Changes since v1:

 - Dropped the pll-gpu reparenting notifier (patch 3/4 in v1).  I wrote it
   when the plan for the higher speed-bin points was to retune pll-gpu at
   runtime: it parked the GPU on the fixed pll-periph0-600M output while the
   PLL was being reprogrammed, so the GPU would never see it relocking.  That
   plan has been superseded.  The maskdiv in patch 1 can divide any parent
   down, and the speed-bin work on top of it (first follow-up below) pins
   pll-gpu once via assigned-clock-rates and reaches every operating point by
   moving only the mux and the divider.  The PLL therefore never changes rate
   at runtime, the notifier can never fire, and gpu_clk deliberately does not
   set CLK_SET_RATE_PARENT either.  That is how the 696 MHz point runs here
   today, with no notifier.  It would only be needed again if a future series
   reprograms the PLL instead of pinning it.  Chen-Yu, you asked for this
   notifier in the v1 discussion: tell me if you would rather have it now
   anyway and I will put it back.

 - maskdiv: honour CCU_FEATURE_UPDATE_BIT and CCU_FEATURE_KEY_FIELD in
   set_rate, clamp determine_rate() to the request bounds, and document that
   CLK_SET_RATE_PARENT is not supported.  These were folded into patch 1 so
   the new type is correct as introduced, rather than introduced and then
   fixed.  They also address the two issues the CI bot reported on v1.

 - The GPU OPP table moved from the board .dts to sun55i-a523.dtsi, and the
   operating-points-v2 reference now lives in the SoC's GPU node (Chen-Yu).

 - opp-microvolt now uses the <target min max> form, <900000 900000 920000>:
   900 mV is what the BSP universal table specifies, and the 920 mV ceiling
   covers boards whose GPU rail is a fixed 920 mV supply (Chen-Yu).

 - Rebased from v7.2-rc4 onto sunxi/for-next.

Tested on an Orange Pi 4A (T527, 2 GB): rates verified with the Mali cycle
counter under load, thermal-emulation throttling exercised, no job faults.

Two follow-ups are already working on the board and I can send them next.
Tell me which one is more useful to you first, or if you would rather they
waited:

 - GPU operating points above 600 MHz, gated on the SoC speed bin read from
   the SID.  This chip is bin 1, where the vendor table sanctions 696 MHz at
   the same 900 mV; it has been running games here without job faults.

 - The A523/T527 CPU clock unit (ccu-sun55i-a523-cpu.c) and the generic
   sunxi-ng fix it depends on, which is what cpufreq needs on this SoC.  The
   DSU/L3 clock lives in the same unit.

Juan Manuel López Carrillo (3):
  clk: sunxi-ng: add cycle-masking divider (maskdiv) clock type
  clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not
    linear
  arm64: dts: allwinner: a523: add GPU OPP table

 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  30 +++
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  32 ++-
 drivers/clk/sunxi-ng/ccu_common.h             |   3 +
 drivers/clk/sunxi-ng/ccu_maskdiv.c            | 213 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_maskdiv.h            |  76 +++++++
 drivers/clk/sunxi-ng/ccu_mux.c                |   2 -
 7 files changed, 349 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.h


base-commit: 859c0e1925332d413ca8f9159c8ca5d04eea32a2
-- 
2.47.3


