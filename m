Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B62C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 23:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOwGgtvRFkNXTxMbi3iDupBuhlGFDkBzBNbmLzqbltY=; b=0iiVgcIKwBJPDp60diEv3861YJ
	iOdYNFkLuiEQNPc7rXW72Dm7zXuzIvaJ136RArzHhgZXvb6B226T61rn4vn/UMfpNFti7L+qqQr3q
	hu/X+1nvICKwzqSoY37HpAPwCFI1dXTeBeD4Cf3fLmj0aPbKP0mkc9PLxIbOIXvIBZmA9eZhwimt9
	89ipcY2K+JgD7nn77eCHg4SZIM0k8UqBtDJ8qnYAnIpif3AlpH7sAQPA4fJkyPtYS81Zm6H3W+Srr
	b3K/2XryBJy3VXHtQUX8cxmz5LrEn5U8Xl9B0BbdTUkGnX33Kuv6lmf88kcEvKxcE16MJjA9WHiKa
	05EE8k3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRJo-00000005ltt-3Ct0;
	Thu, 02 Jul 2026 23:59:44 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRJj-00000005ltR-32pY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 23:59:44 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8f29ec73064so14403046d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 16:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783036778; x=1783641578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOwGgtvRFkNXTxMbi3iDupBuhlGFDkBzBNbmLzqbltY=;
        b=jcVy+Rb6k6L2kKrRK4T4T1J/bIXvlV7vzPrkwGeF8oUVsFoxqi8yo34V1Y1BIVCyRm
         36/8ShGbhSbfJfi1mDNC7VIQPvWIeortLbx3tfND92h8rBqZDw0KYyvT2/SRCvQzBGKe
         rixXW9u/P9LvKdsEcaT/TWqbBhZ5ahXXup7is/cYDTZM+RvZdJ6hw55y3ZJhmtbDjlas
         n/Ug+4qsbrVvMGhoNHoL+Kvmb4RE080MFFC9DwvhXI7HKAQDemISYfoLr6o1XIee0rIP
         uACUASiM06kN+OcrNQQlx854LYrMPUusvBcls6ymZ76ElbXRjf9nIOSBpxmS3EKULt37
         iiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783036778; x=1783641578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JOwGgtvRFkNXTxMbi3iDupBuhlGFDkBzBNbmLzqbltY=;
        b=ZjmBLkCVZbexIsXLu5W15MsGsYc2L2zy7auXgv97F4vVgL0I+I+5QIdy7v29v9lAfB
         1KehncXtkllkDJ/5dejCJD6VuoXYHkonzB4uWhX2fd7o/CmYU+UX5EiAzVEOWhv6mfmB
         MXGALFD4+/LZK4xE5km8wSvrlkIOAhT8/5x9oE26+JFebnutsjwbr+Fn+EbM5yqtZpb3
         aBMi2ujda11+ef1LX2nd+pI6YW/sCq/hASot2XhxTEVZZuu7eWitbkvnOM+Le7Q1CfBr
         T8j20bwIxiJMuavU8R5umozYASwFsorHbaThW2nVjmK6CcLMDxoYz/ymc3/udvrXCDN+
         Z+LA==
X-Forwarded-Encrypted: i=1; AHgh+RrDjUN/u35rjMNHqY+WCxRBn5PsGtkz7yRflU54GYVDLQU/Fp5JuwGG5H0j5vgsJmzxyTFi4hZwHAMd2STD+zKn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+7rsA5NDCWhGjsEvEH/dCzkbgk4ywc9gJIi/23QPRtd6cJnAT
	tp+nBf9d6JOlA4LqmEJRomcZH8Gd932dz062zPGaKH2tS0zzJHi5yqEZ
X-Gm-Gg: AfdE7cnotbO5AEgmVOabYbr0O5KOdqw3Lm0Wuqqag85GN3ovVopEEF+7W0/fH3o9uU0
	nTf7Ddh3ghsJ6ArWvDKyj8m1r7ULVumLDntRCIjjunj2npCmtURkbmRF7HSh9El3PiRIeDalm2A
	QHzZlivXffaFeoW7mWokVt4+u8U5QNN7C5n5uYbUTz49ClHw1vu7U7zm5WL11PBZ2ZIlEjvjpaQ
	0x0dK8R5+tgwcQtVP28+qaWg6WhpJtK41QmFvwWlviwA8PmCEcm+gQlQon+AFPvVbpujj+ozgMm
	H3aKMgyS6Yse7j3OGuBG7+qz8G/lweh5ETpoe/q5ATXvhFllj1xlgfMmbhZZpgganvzIKGG9a/6
	0DCwvv+wpRXriX08HvZenpFrJ/UOIjmF3QeVIutmqrMXgSjVwhiyo5wCbaXdPDrL134WX8JraxW
	DHR1ptDQAIXLraxd64Pk1CoUuTLidy4kz7+yNeDYdDEplQ1a9rPiHiSg44eBVq0BFebXi147Y=
X-Received: by 2002:a05:6214:c6:b0:8e9:e48b:9571 with SMTP id 6a1803df08f44-8f3c8ffa8cdmr94354126d6.41.1783036778419;
        Thu, 02 Jul 2026 16:59:38 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f306123sm46180846d6.20.2026.07.02.16.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 16:59:37 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/8] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Thu,  2 Jul 2026 19:59:36 -0400
Message-ID: <20260702235936.1231945-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_165939_764055_884C8D41 
X-CRM114-Status: UNSURE (   9.20  )
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

Hi Jerome,

I gave v3 a spin on a Radxa Cubie A7S here: it applied cleanly to my
local A733 stack, the RTC probes as rtc0, hwclock set and read-back
work, and the oscillator tree in clk_summary looks as expected. If
there are specific checks that would save you time for this or a
future revision, tell me what you would like exercised and I will
report back.

For transparency, the test harness is AI-assisted (Claude Code) and
results are verified against the captured serial logs.

Thanks,
Enzo

