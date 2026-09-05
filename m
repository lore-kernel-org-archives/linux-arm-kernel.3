Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36D1C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jSU4aZpbll1PpORySxMO+b6aF9erqEZX1yTwxUGQHwY=; b=ItXpbuVQ43MlzpaQiu2FceT+Fm
	PHFz+Vv3YM8PtrHDXGPrp7IJkPHOhvofmX8taiG7Ih4GmejO+FhCNv/mZolE03YQAuwmJMxZ3xn6J
	mkyFpgzuhhCSJ+0VvgX877H5SamSyD4zYvMgWtDuK2BFzojOgfHrG0xcDf05wIJOvxkvm282cMkFu
	lfAApQ06eb7mhAeCjuC8ZGXHS7jbLV/ZmUa2kYuYqGTykXusNgVJfppqfj6jRbbhYnf50Pxh0vZ19
	uILSt2OqGpKjT0NkImq8P4XY6D9TimJoSD04pVyCPncKkkI+wjJf39gCscPccneH4zqp2DgnQfeVd
	jEZIVdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNl-00000004CkY-2UKN;
	Sat, 05 Sep 2026 15:32:41 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNi-00000004ChV-1zEK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 15:32:40 +0000
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4843e9c5960so2050652f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 08:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622356; x=1789227156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSU4aZpbll1PpORySxMO+b6aF9erqEZX1yTwxUGQHwY=;
        b=B8n9bSFmCRxxlQo/Y8VrrSCL2AnsP1N+l5Hix1EzbgwdMY9IqkHiWWK5Fh6JiXWpAp
         rMzEHkXcoRPUF1vVQVROMN7V+8fiIAO2xtH59g/p5PPiEhH2bbASvARQZihUFaypJ6Dk
         581gqAjqx4kB4rvYBQ/N89ZThJsGAc4WfOAhArVrY+M9/dbSSUkteRlrZqjwS2vesaBb
         cpQqZ6d7qUHH9ugOQiZi0xzdubRB9hE+ocix1TecKHMT+aNSpyvmt8pDF4p4T4wopgCG
         LZ8+m8lcDlBrcawzMzfAcnlGWK0S8ZG+z8TPW7S7MzfgbgPxgOyNvB9YHktKYyio6Dh3
         FrtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwisfaTAqDKwIKgrJCpW5/nDnnGxr6a/SLffYPbXq0JvC/XTVNa9/a+nYJLnAsS/SibTSm8tNf8iS6+MEudmGn9@lists.infradead.org
X-Gm-Message-State: AFuF++mYg+qT4vfIyLvhuulXd1Vcn9ckVMubyYqOWrhurvmW12rVV6zP
	VXbBt25z/UQnne7NY4Q7btS3yQ8BxlJN31EsBuGmtkLb1ZtfYF8T7Z8l
X-Gm-Gg: AYBFou2UY69WEumU3zoL6Fkk59k57tuwO8TGmk9EmRsIL5eZDKNsz+D6F1nq8ItJMez
	gHDqJf5Ig0rOg8ZKIit+0GVeShDId6Vy15HYX9m/EQsrwex2Lk1J3i7ORE85fzEaDBv2cMAh96V
	OWhRD3CnPlJmXq7aCQKEdVMPM3pQA25kRCaJmK6FuQYV27Hkdz/z/ArTXyH5fCgsIYpA3iAJG9a
	CI7g+RawQdUZ8+qFyynqcg6a3g9DpD5w3q0gbFptbcRzo5IewJ7sZvy4MJcIH0J/3BcBa9p7tEw
	EoYVrlk5FxqybFYEl07KM/95yzvGwt98rJrWgaKrGqQw0QgUmZqgRJmIzzc3MwILtp96Z2sRjo1
	ha/jjKtKysiHz62o+0hrqSijYAU0vrK6PfEDfldnFA9H3zrSZ+Hn1FyQb1Qc04+mKsZyJT0+tHs
	890B53c6yJtLZH+q4dpb05K4/AnTp+3pPhxaOpZMkAZqrvj3E/7wMwzAZpFL5b4u4wn1cfbpHkp
	FiDctrfDwDf/pqk8b49b7wDzw==
X-Received: by 2002:a05:6000:2287:b0:485:8b5c:da39 with SMTP id ffacd0b85a97d-4858b5ce1bdmr10859250f8f.12.1788622355807;
        Sat, 05 Sep 2026 08:32:35 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:35 -0700 (PDT)
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
Subject: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
Date: Sat,  5 Sep 2026 16:32:30 +0100
Message-ID: <20260905153234.133217-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_083238_508450_1C2A4745 
X-CRM114-Status: GOOD (  11.22  )
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

The previous series for the intermittent boot hangs on the VIM4
marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
explained, sys_ampipe_nand clocks a pipeline stage that the
hardware design inserts in the bus path between the SD/eMMC
controllers and the NIC_MATRIX fabric to help timing closure.

So the clock has real consumers: reference it from the three MMC
controller nodes and drop CLK_IS_CRITICAL instead.

The series crosses three trees; patch 4 (clk) must only land after
patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.

Changes since v1 [3]:
 - Dropped the Fixes: tag; this series is an improvement and should not
   be picked up by stable (Jerome Brunet)
 - Moved the patch 4 dependency note below the --- so it is not kept
   for posterity (Jerome Brunet)
 - Dropped the e-mail address from the Assisted-by trailer, see
   Documentation/process/coding-assistants.rst (Jerome Brunet)
 - Fixed the space-indented error path added to meson_mmc_probe() in
   patch 2, it did not pass checkpatch
 - Dropped the CLK_PIPELINE() macro from patch 2; has_pipeline_clk is a
   capability flag, not an SD_EMMC_CLOCK register field

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
 drivers/mmc/host/meson-gx-mmc.c               | 20 +++++++++++++
 4 files changed, 62 insertions(+), 12 deletions(-)

-- 
2.55.0


