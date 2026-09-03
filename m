Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38E3C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 22:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gUDONbWsQf4g8On4R7HSZLyPEP705AHSMo8bYRBit5E=; b=TA7O2sGU8X/KUkVxDG9p1u6sSI
	YEvQtb8ULTYXiQOxqxLT3zdnJKyRJzdQ94wXT58cluVFPm3V6T0dWfUIVSf3A7aoNZhN5XCZzwJPm
	xrU4EI9ucYU3f6AGTPnS47q+cHF44irRH0xavZegHvXQNjsoqBPJ2Y4MrrnzkKKq4pGHfTXmp7WRL
	sBQxvW6GdbvfU2hGMrJ0sXv3/G+J0421hkm+dBQ1X7YErKGn+UPwdvCzHVKZTKK7q8Fnyr9kzIM8c
	US4WmuPmDCOqesSIXmphXOGzCqdKzZjgKTJ9ulup7AgNQ5/3C5E2zwVM8ip0rNyy3pLrKex8r2nBC
	8agMtMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP3-00000000jxK-3sop;
	Thu, 03 Sep 2026 22:59:29 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP0-00000000jt9-3Azw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 22:59:28 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48589798dbbso91373f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 15:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476364; x=1789081164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUDONbWsQf4g8On4R7HSZLyPEP705AHSMo8bYRBit5E=;
        b=smRI27ev/baTk7KUXbw73/R5Xla/b+bgwgRABf8kON9Hx9ck4V8lNOaWru1PcoHaTp
         MMHR/fda+xTdrNTeB228Uip1aJ5h4FGVi2/530UDB6lf5PaPWSXdRqyyafwI011U4Zsi
         GjMGe3wwrShwc8jsIkpRMQvbF8Ve2Ienyw/mb3PPnPeWnK8rq9QkNmvqNtOtsSnidilc
         clZogy2DH/1PJWU/b3kBxFO1OEdrbz1QAUYOkHJaz02/Y2NN9KOkd8S3Y1z8th/mmNOg
         UO3MjHTcctJfla5hhk7ekef1T7GfRDWlcXzmcR5tgFwHjvy6lin5pu2UMAXirolytO5G
         d9Pw==
X-Forwarded-Encrypted: i=1; AKwUvBw6K0omRBERyYuEeQODL8DOS/VFv0hrLC8OCgQve7aY31PhnCXPfea0vFU447OHGHUGdLc16+R8kQGJJ4SWPBA7@lists.infradead.org
X-Gm-Message-State: AFuF++mKgh6TGW5MKobYrYLDcFKnwVlM5Ug1UM+9f8KZgIK96o6EGgiT
	GcAFdZlx3qZfWHEoTiUVZ3K+xcP5bt4UBaEThyTD/pdjkkFAfGV9w89c
X-Gm-Gg: AYBFou2vADWLBpgK3kDjKRqgPtU8BKFbmGpb8WcFtABMmtahrgshWyIYEUdy8CWS5e+
	2aTxD+VP9qG9BSl9/e71Za3prqAxNLKkvta/KyOzXIXfpgX5E2S3qYoZC+c6sLlV9MBwMyH/EDy
	L4jaX+rmVb0GdS85/Qd8UZMZYYgh0ALTZoNilL5Xg+8zExMBb1vN6CepqVjiTZMbUnSmh2ACtoG
	DbBu+9RnRi1iFryNBxZuCtz3G2GEPYyMBUze1JP9yvrf5eD2wRfkYbBdIZjryujpmNPR5HIo4OW
	Vo+rUoFnunaQEHoZwj5lf38ZAiUaEc7+HAA6CWqaYOOHuyzUWwdryencP2BFgn9n+g4PN9m93SQ
	jtJeMwtNdiXKSQtGbKTg+G8x748fNgPv2R776iuVlfiCNFRpeV6e5vJkHKHjqLqF2e4b8m+ftA6
	xbF+xSMfjn3U+cO/qeefdci1hMsS9M7GTBBWMpjmEQEwLBNgQ430vjiU7ES/SvMMrgamvS+kTVb
	j/L+exOGZI0aDLQFazIOVqAPQ==
X-Received: by 2002:a5d:5f50:0:b0:485:8a46:7059 with SMTP id ffacd0b85a97d-4858a4672acmr372086f8f.43.1788476364181;
        Thu, 03 Sep 2026 15:59:24 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:23 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
Date: Thu,  3 Sep 2026 23:59:17 +0100
Message-ID: <20260903225921.2290441-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_155926_800178_C6D7064D 
X-CRM114-Status: UNSURE (   9.83  )
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

The previous series [2] for the intermittent boot hangs on the VIM4
marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
explained [1], sys_ampipe_nand clocks a pipeline stage that the
hardware design inserts in the bus path between the SD/eMMC
controllers and the NIC_MATRIX fabric to help timing closure.

So the clock has real consumers: reference it from the three MMC
controller nodes and drop CLK_IS_CRITICAL instead.

The series crosses three trees; patch 4 (clk) must only land after
patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.

[1] https://lore.kernel.org/linux-amlogic/ (RFC: clk: meson: t7:
    Intermittent boot instability and memory corruption on VIM4)
[2] https://lore.kernel.org/linux-amlogic/ (arm64: amlogic: t7:
    describe the VIM4 supplies and keep the fabric clocks running)

Thanks,
Lucas

Lucas Tanure (4):
  dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
  mmc: meson-gx: enable the bus pipeline clock on T7
  arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
  clk: meson: t7: don't mark sys_ampipe_nand as critical

 .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
 drivers/clk/meson/t7-peripherals.c            | 10 +++----
 drivers/mmc/host/meson-gx-mmc.c               | 21 ++++++++++++++
 4 files changed, 63 insertions(+), 12 deletions(-)

-- 
2.55.0


