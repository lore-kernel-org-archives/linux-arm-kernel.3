Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83E8CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 19:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gxF4qwMO19H+ZC/luj0jHgJg2MjG46hAC84lZoFn5cM=; b=0ez0DFWQKPg9A7eryr1bgSELes
	NeniFo3RzOU9oVNtWY40DnRYJYsmpfgrhJWGr64JkeN4NRMK+MFFkrzrTWxr0sPuNEpuxrhzLsavW
	oj5qltBJRk6sPhpAXvabWmLwK3PG8pBy4j5+wGFGp0smZ1YOLL3ESdxtOiDI+IbW7QVP8yrZNk5QN
	pwYty+G2f7n+5OI328bgeg5PXYVfucnGCoFtQMqFSUad7MGae4xsqvm74x5LnTsY4mEwJyGNkuotJ
	6moPLsClLmwqScNKpBzyufpRhpmYe38Rbjep5p1xOiLZbgrjEl4yeutrL2wT/MnvOOImqKM7nX7Z5
	IMiYcuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEvAA-00000006kFn-2PPU;
	Fri, 31 Oct 2025 19:51:54 +0000
Received: from vs10.datenmanufaktur-hosting.net ([213.160.73.65] helo=vs81.iboxed.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEvA0-00000006kBo-3cng
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 19:51:47 +0000
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59VJvJIv001630;
	Fri, 31 Oct 2025 19:57:19 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59VJvJqM001629;
	Fri, 31 Oct 2025 19:57:19 GMT
From: Alexander Kurz <akurz@blala.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Dr . David Alan Gilbert" <linux@treblig.org>,
        Job Sava <jsava@criticallink.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v7 0/6] Fix, extend and support OF to mc13xxx pwrbutton
Date: Fri, 31 Oct 2025 19:57:12 +0000
Message-Id: <20251031195718.1586-1-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_125145_238224_3ABCD1C8 
X-CRM114-Status: GOOD (  15.56  )
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

Goal of this patch series is to make mx13xxx power buttons usable
on DT based systems.
A ten-year-old IRQ issue needed a fix, mc13783-pwrbutton had to be
extended to the other to mc13xxx PMIC as well and adding OF support.
The implementation has been tested with PWRON1 on mc13892 found e.g.
in amazon kindle D01100/D01200/EY21 readers and also in on mc34708
in the imx53-qsrb "i.MX53 Quick start board".

Changes in v7:
- Link to v6: https://lore.kernel.org/linux-input/20251030195654.20142-1-akurz@blala.de/
- Fixed missing empty line for imx53-qsrb dts patch, thanks Frank.

Changes in v6:
- Link to v5: https://lore.kernel.org/linux-input/20251008064401.13863-1-akurz@blala.de/
- Rebase to v6.18-rc1
- Add a imx53-qsrb dts patch to enable the "power" button on the
  i.MX53 Quick start board.

Changes in v5:
- Link to v4: https://lore.kernel.org/linux-input/20250914193723.10544-1-akurz@blala.de/
- Rebase to current to include already merged dt-schema patches and
  a different mc13xxx related patch.
- Drop patch to use devm_mfd_add_devices and devm_regmap_add_irq_chip -
  won't like to do the proposed mutex-cleanup now.
- While adding OF support, remove the platform_data configuration
  interface as proposed by Dmitry Torokhov. Also drop the change
  to use module_platform_driver_probe.

Changes in v4:
- Link to v3: https://lore.kernel.org/linux-input/20250829201517.15374-1-akurz@blala.de/
- Rebase to git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
  tags/ib-mfd-input-rtc-v6.18 in order to include a different mc13xxx
  related patch (sorry for that).
- Re-ordered commits since dt-bindings changes already go reviewes by
  Rob Herring.
- Following Dmitrys suggestions, resources for irq are now passed from
  mfd to input allowing a more simple implementation. Work on other mfd
  cells with irq usage might still be a future project.
- Input-related differences between the mc13xxx variants are encoded
  in data structures, making the implementation of mc13892 PWRON3 a
  simple task.

Changes in v3:
- Link to v2: https://lore.kernel.org/linux-input/20250823144441.12654-1-akurz@blala.de/
- Undo all changes to led-control (rename to fsl,led-control), thanks Rob
- Restructured the new buttons node for unevaluatedProperties: false
- Various other remarks from Rob
- Rebase to current state

Changes in v2:
- Link to v1: https://lore.kernel.org/linux-input/20250817102751.29709-1-akurz@blala.de/
- Convert dt-bindings from txt to fsl,mc13xxx.yaml and add vendor prefix
  to led-control property, causing changes in dts and driver.
- Change node name from pwrbuttons to buttons
- Change property debounce-delay-value to debounce-delay-ms
- Fixed a section mismatch error
- Fixed https://lore.kernel.org/r/202508210551.VzAtE5re-lkp@intel.com/
  (wrong index used when converting to array access)
- Usage of generic device properties API in mc13783-pwrbutton.c
- Provide chip-specific max button id via platform_device_id, therefore
  swap patches 3 and 4.

Alexander Kurz (6):
  Input: mc13783-pwrbutton: use managed resources
  Input: mc13783-pwrbutton: fix irq mixup and use resources
  Input: mc13783-pwrbutton: convert pdata members to array
  Input: mc13783-pwrbutton: enable other mc13xxx PMIC
  Input: mc13783-pwrbutton: add OF support and drop platform_data
  ARM: dts: imx53: add imx53-qsrb PMIC power button

 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts |  13 ++
 drivers/input/misc/Kconfig               |   4 +-
 drivers/input/misc/mc13783-pwrbutton.c   | 278 +++++++++++++----------
 drivers/mfd/mc13xxx-core.c               |  49 +++-
 drivers/mfd/mc13xxx.h                    |   2 +
 include/linux/mfd/mc13783.h              |   4 +-
 include/linux/mfd/mc13892.h              |   1 +
 include/linux/mfd/mc13xxx.h              |  20 +-
 8 files changed, 220 insertions(+), 151 deletions(-)

-- 
2.39.5


