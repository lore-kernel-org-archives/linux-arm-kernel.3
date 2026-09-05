Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A7DC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBqYYCS5py1zvvdbPLcK4Z1TQdgdHGp93LoH6od28Gw=; b=yY3jMDU1nv6LS7c8ZagWZRpKdx
	VXtGnTnhL0yRILmaSGM/gArH/DX0AeQsrTrBhVvGqGMxXbg0v6HH8InKi9p1sbYV6CKcfufHWz/DN
	E0pXopYLNL4X+tc/i/ypQYlVAjTw82kiCkM9xVzUBdG4OvtnPv53sLhawChMR/+cQ3T7Y2AeKrA3x
	usUGyjmWf0I2OSCuVTQhd/GdWX3sGDou36S9Uil74ScqKCLyLagkZ43d2HNze3AHnt0d71QgRZg17
	JUfno0w2agwHpCnMiLMBvOaKtHwwzj3QD987dh4uboDWkh9PxW6vVFMZvdaqiQw7pmva5B0mTIObD
	7W3JcA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNp-00000004Cnr-1ahU;
	Sat, 05 Sep 2026 15:32:45 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNl-00000004CjK-1g56
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 15:32:42 +0000
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4858303de5dso2480108f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 08:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622360; x=1789227160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBqYYCS5py1zvvdbPLcK4Z1TQdgdHGp93LoH6od28Gw=;
        b=f7ypbkQ1O89h6660NJIIOOFA8z3axxx2WJdQdm3+q7q6YhOJDcIJcZZBNAwbVor2Yd
         bpo5hJaUmHneTDsG0Yf0Yqd1hVxsgggyh34HtmnqxCGiBNNYK88sqbG7gizaJxlgE0hB
         WhWpJj0y5mHdevvoTj63CmT+EMApokTr50e3I2WHHXbYeE2xX2Fwu0rRtQ2a6mpFp+RG
         8zvCZnKiec25UVGBZ+IWOLuRsFXk3TWcW8r2zagJ7GuVni2K1DMZabKiQ+FS/LPtrsnJ
         6FlQfYty3wGsKFyHPXu3cHu89o7KQ9hav6sjLRzssoGTe+kDmgU4DYbSD/aRkpLjrX0h
         cbdQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8H/+CfR/pSM74fbEV8Il8dfDrzeyTGjW26jBsDxL8KMy+V/vF/dlG0BxKmGoSRs3IPur4261zelaAW8K4OUZy@lists.infradead.org
X-Gm-Message-State: AFuF++lib8NNE01AARw/IYW37fWRcwo5HDi620e4B9dwwWE0oe51oiCa
	fSK9ZoZ7Cq0iliTmXbY1f0F0iJqJcKPeR5cyvBSPbhApCYuAk53WCl1v
X-Gm-Gg: AYBFou0gMq4Njh+PunnvLU2FH6YDxxB55VbGGYT9PYRulJvHHsqSWXpntucMxOOoRsZ
	0z00Eu7RkrahJKWJWyQSAnP0h/0o8yaVRjLh+MwyV98ktz//HeSvfgbxCLEk2oE6Stw2U2Ij/+s
	lmIR91f9kRdk+q/QDK9Y0/buKtKC979ukcgdL6L01/PD7RaiLmbzsw00vG50TpJLooHBAJ3+i+J
	NTmjyXq/CEKmBL7YM9kz8MHnk2aiv3mxEX720KAi8Pnry+Y4iRapwvNZpvbhgMB9YGcdYXOSy/f
	B4lxhjodr9NXB1s3UgbLeEni16Im+1q8qKu13GjG4xV8bVaelceaHkaYmvbo8DcoEJAlH/eDu8G
	19r58OWm/J0n6Lh26gPLovdTRiukFGbFarTsY6Aw5mEMsCGKFYkdBPtq0LQjBvtK5n+obNoMkEP
	9up+m+z7qgPnyv14x2xiPDOh/JYiqdd32Jjpyh7L0q+Pld9jLshEvZkw2MadVZfSG2QaM9ByB6A
	7ud1EBxukgDZtEmvj4roWFI3A==
X-Received: by 2002:a5d:5f09:0:b0:484:3332:d1ce with SMTP id ffacd0b85a97d-48586bf9cfdmr14652908f8f.0.1788622359412;
        Sat, 05 Sep 2026 08:32:39 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:39 -0700 (PDT)
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
Subject: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
Date: Sat,  5 Sep 2026 16:32:34 +0100
Message-ID: <20260905153234.133217-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_083241_502340_F939E607 
X-CRM114-Status: GOOD (  15.74  )
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

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
This patch depends on the MMC controllers actually referencing the clock:
the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
clock must land before this patch, otherwise the boot hangs and memory
corruption this clock caused are reintroduced.

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


