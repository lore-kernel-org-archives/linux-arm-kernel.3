Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA00C79F81
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 22:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1SiDePVmO2z41UWzhMW/dfuGDGSD2CkgizPnd7ksWA=; b=cJ8JOITrlKEL/HNlf7nmpaQi2u
	2AE1lA49SqH7vY6Azk6x4Izf+dQGV6uEemEZX/vUdepijEtBPeUllZr/P7Q5W0mLBNfch3wRjy6Se
	hj0TAVo0Uf7tKq3BGbS0fiUh1nshoe7dL7z6TuB5N2jUD+C1UttMeR57clEjU8226Nxv3dl+sUMyy
	33E6oTRd3EY1/7WbJ7QREQjYOEZZ0nFi9PFSN5X3Blf75u8BWMWNSWT6e5fhyjGGmm4zJKQCxny0V
	V9nnPe2CLFCVNW3UbAdnK929+L/a6TyMC5H98Af0DHGwBjqE0RgDYrszMmXzGKRZGztweVwD6VvxA
	vBgQ7TcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GPB-00000000k31-1APT;
	Thu, 03 Sep 2026 22:59:37 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP4-00000000jwi-3Ids
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 22:59:31 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-484392e3d33so244691f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 15:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476369; x=1789081169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1SiDePVmO2z41UWzhMW/dfuGDGSD2CkgizPnd7ksWA=;
        b=QkNxtBHgOhYKgtnFbKTIuR7tjqb1RFuX7H1bwf1YOdieVyqoLaZ823GgfkTATMx9Nn
         tKNp+kcZSX7ouHr39osNFlXHk6CsVjBQnOoNcIDqY7O3NT0VBqcdMfIp0wD/XNS+jX6Z
         nq8/bD8mA2s7DInbJUxkMaqSb43kjCr0UC8Q+QehDPtwdlumLx5chAXY0BwL9ROupTR2
         iZ/tC57CX16VywHsVYu4PSF9yubGn9Kjz4nCmK6xzwzzsUzrtJvHCU58+fUB14Jc5E7P
         xr9nn3RxRs0DKD2TN3yzJ1taVinUoVVNiDXAW8G3fQLh+MZQRZbvQrhUnS2KbASJTL6o
         i3kA==
X-Forwarded-Encrypted: i=1; AKwUvBymIuqjNA6YVPJgn6GotYHQiZPoYZrLMQRw52I+slFIgsqUwVlnnhczdHciJdBFPldszulzRHp//AIt129dwC4l@lists.infradead.org
X-Gm-Message-State: AFuF++mcEITqI0h9aLFws+M+v6Ou5ra0aNGyW2YxpajGwIzQA9g8+MWY
	NFFzwQ6J6PMuQFSUo7w2WVx9Ur1WDcFmF+Fstawgm1h91ehftmixUziN
X-Gm-Gg: AYBFou1ntB2LClyybSjImsswbzpHItIXNC+9xTLpbpqk766RXbaDOi0xWja5w1cRb0I
	9rr90/nY43yOeaqkuuEErCGWaJvsQnlQ0zYxDD6j/6yamez8nAzMTBbjuZd2pj9oxeav9K0P2n9
	tP+ZlTsihjpErKw6YMxQWOEPFW0aKkyVQpD6wt8NmfBod+N+00AM1kEXPrLWjF72Yb6qELxGegb
	ZLLrijwLDGKNXy33LupOf5HED7/BWbafutS9KXMxMpLcRnm3Cv5JFFmc/4CoAJCqIQO6g8y9W73
	wCjjZrcKWnrYBGRuvOWTECEikcIa1tiMhSNhjGTA+rFCM3xIwZTVDZtH5FmG06iWhlYdWSpIZ0h
	hJIuONlzVdwcHavwradxsiVlL5DT4RtWCZut5Eq1fY4+FMtMULPGjlkHdDjz8h9wfsCZM2wm4HM
	tAuZ5MTTMMLIZKJljkMbjI1mrcLZQixnmaMKnNPj6IlkNlX6kHk52sj9KnH92+1cP6mCX4l/Bbb
	k5kzOWEVsHld2yRba5wQB0yFg==
X-Received: by 2002:a05:6000:4a1e:b0:482:9dc6:16c4 with SMTP id ffacd0b85a97d-485870870b6mr4790999f8f.1.1788476368800;
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
Date: Thu,  3 Sep 2026 23:59:21 +0100
Message-ID: <20260903225921.2290441-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_155930_937002_46310117 
X-CRM114-Status: GOOD (  15.47  )
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

sys_ampipe_nand clocks the pipeline stage inserted in the bus path
between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
identifiable consumers - the three MMC controllers - so marking it
critical was the wrong tool: the clock should be referenced from the
consumer nodes and claimed by the mmc driver instead.

Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
have no single identifiable consumer.

This depends on the MMC controllers actually referencing the clock:
the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
clock must land before this one, otherwise the boot hangs and memory
corruption this clock caused are reintroduced.

Fixes: 43e1705ecab9 ("clk: meson: t7: keep the memory fabric clocks running")
Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/clk/meson/t7-peripherals.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 55d09e78593b..2f429ea86796 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 /*
- * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
- * used for DMA between the peripherals and the DRAM. After the clocks are
- * disabled, a device that starts a transfer cannot complete it.
+ * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
+ * the peripherals and the DRAM. After the clocks are disabled, a device that
+ * starts a transfer cannot complete it.
  */
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
-static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
-- 
2.55.0


