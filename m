Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D54C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 19:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bax9W38/JMIaV0Z2sDQmJSHm0aG/QQBKaWLZNsB4ByY=; b=X87Jxd8r+n6Ei8LYy2xg72tDSk
	lx1FpyKaiQ7HXg2rXAQANb7qfgoJ1EsWZqHXUgOgcjgxIWV7IH88/lL2G9tF1BmifZ/UnisUzQ5Io
	ijW+efzLgzdKLwm0h31l4rESlgn8rivAO2k687CHixEm/FtiWoqUPwDGYmb7NTHB1lHsvSU0ef3tz
	1X+g2w5ZuLm0LC7jNXzkUnTQj4UysE+tfopODzsn5uQx8B78r6C+RkZihLUpOhDMquOEdMvb4MREO
	3HUWxEcNwwQjoZ0rYiDNUc5rlgTHRO0TPfTTMPKsDnvyxJoyX2i9kVj0FKLsgif4gy06NG4UQ2x/V
	HXHEUe9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEI-00000008YyO-32x5;
	Tue, 18 Aug 2026 19:12:10 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEE-00000008YwM-2w3H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 19:12:08 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f904e80eeso128749f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 12:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080324; x=1787685124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bax9W38/JMIaV0Z2sDQmJSHm0aG/QQBKaWLZNsB4ByY=;
        b=AVRNcGSbb8vSvQ3ibnf7X6tQGcXEuBYE3pMGCW/9J5cwiLAmZMb1bk8x7Jq2VIIVup
         nAmCJgZKLa6BxlSsv0HcqnaXfz7sJCNGBmtnra17/BS42/8WKgxmTBd1hVTmp5l7Qm20
         FFLOAonpgKcKdtjYoly0vaHgqLdVGQ72N5J8omf2JtBdRVBM9e9wGgDyb9FiZrCdVFge
         gajiVbg60tfViodQNYdL2++g7onYGgOG1QN/0rd41NqIbc1UTAJKV/sthLuMlEAUJsI+
         dx9XbptN/XgjFtglmkJ/FLfoYNjuxNdDiqWQI426gQvbeVi34dyJ4NtBOEBbpbnDBS2x
         2JPQ==
X-Gm-Message-State: AOJu0YzBdChS0OSJ3z/8yF3Kqy/hOek+wAXPOaKFzA59uQNj395mRSeE
	mijWBz3oYctU6UZ0IvVKmK5lox49158MGcDaAvw30snhlW2X67dilh1AXl3BKg==
X-Gm-Gg: AR+sD11U3jUqYvF7kCqqZTec5WeJQCAwfrgDH7JwnLAY3CkYqEkY3tQzFztXsxdFoG4
	5k6QbYYyyQp7jVLNT5witX80E83QMmrvIKzDB+JCUcbJB6P39TnXUpMgUuDMQS6j7QAmaN4JR2H
	+wk9qi/YjHc1Fl3iRqxWXdHx6/d6WwY3BIQmqgM1XsUGNh+FhZLozbIPMB0s1ZBzh030wg+DOCI
	dy3nHp/Y+DrTI4kv7J3VZrmxGo5xxxSP4EPn9ZrSXYQgBzXv/EmiKO6MWxZYygIGJNyEFNJ28gw
	7V/WV/UPOEiKt6bOv5drSBPmmqYT294SAAPZXKcSWmZvyPRW9XVgGbdgDiNMoRWnf8v4v5RVX1r
	22Y9MDnQ49yOWikrsRnFx0NRxaEZqf34mawHD7olm9/KjPveiFiT0Bh29AIC+usvmYrgXBE5605
	7SrteYo0T8E1OCIvQlbyOi4X04RbbiKcoU8fmGW1bdpNpyIG/SnRx4KJfLP8Ve/9L5MBgMCcfgW
	rxwcD12FEBQ71Ze9qnP6B3Q+Q0=
X-Received: by 2002:a05:6000:480f:b0:482:a36c:a5e1 with SMTP id ffacd0b85a97d-482b07c826dmr482120f8f.1.1787080324198;
        Tue, 18 Aug 2026 12:12:04 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm14673154f8f.31.2026.08.18.12.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:12:03 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: amlogic: t7: fix UART clock and SD card recovery
Date: Tue, 18 Aug 2026 20:11:57 +0100
Message-ID: <20260818191159.11523-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_121206_736069_0B37E887 
X-CRM114-Status: GOOD (  12.27  )
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

Two fixes found while booting mainline on a Khadas VIM4.

The first one wires uart_a to the real UART bus clock. It was pointed at
the 24MHz crystal as a placeholder, because the T7 clock controller
driver did not exist when these boards were added. That leaves the real
clock without a user, so the kernel turns it off when it disables unused
clocks at the end of boot, and the board hangs with the console gone.

The second one drops regulator-always-on from the SD card supply. A card
that refuses the 1.8V UHS switch can only be recovered by removing its
power, which that property prevents, so the card never initialises and
the MMC core retries forever.

Both were tested on a Khadas VIM4 booting v7.2 from the SD card.

Lucas Tanure (2):
  arm64: dts: amlogic: t7: use the real UART pclk
  arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power
    cycled

 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 3 ---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
 3 files changed, 4 insertions(+), 5 deletions(-)

--
2.55.0

