Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55066FCC9D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 07:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/a0tRwE4WB1N7mbM38o7pQ2y610kAMXzD8AqisAnlgU=; b=XswOXhdEK4Qiiv3q4cheau4WTz
	pvqgxLLNOVgGZrpJLifNoMIxupeOHrEVGK2FvgdxmBXxHehHyJ28W2XGdCp8SsuhAtNyHqASjmYCE
	lnbZutnIPXUaDMrYwXcdDZSyajtjGy3gQutfEju4YBhBIv6YaOWsz97Wiwk/WLO5kF4uszJaC50rS
	6Wg6NwYqtGPvT90aDVcH+NcFoOzXakAXh1SjZLCP0JTEo1rubLnT5OZFV+hczII1q6DZH4H5+MbRz
	nD/nNB1k9VmxfiCnQsBaOwk281zuLww3UJyfso4maAIsg3FfjIWg1NsehzYGfmVcVitg754Fv2gfU
	v/M+XvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrwb-00000008srI-38lI;
	Tue, 10 Mar 2026 07:55:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrwY-00000008sqm-023q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 07:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=/a0tRwE4WB1N7m
	bM38o7pQ2y610kAMXzD8AqisAnlgU=; b=grFET2Q/L5BDbD2xTndWCxfWXxtyl2
	MrNW6Nu3qAN1EmBl/MYyb9CKwe54CLj7IvlqLMC5IMLgb11+UnMtwsIpNOpeZHWa
	GVPU+ybqbKsVtIcDblhf8AAmfEvK69zbgwZTCdiSqJFfuZQ3G9lnG2U3m4tzAMVJ
	QnwiFLc/jqMR9GpmUHV3igEQ4pjuUCRsM0Hm2OZQ1Li9cwvsXq2py2+kvdhFHYP2
	jC6TKSVnNybFyfIppa6NtLkCKTYZrYUqHsFkz7SYD5URwCS66vb5yN0vG/p3qKDq
	87t1xNh8zF1QjL/xdXPPlibUyKgxw31YNVsxPQuxV575FpunGlhflHgw==
Received: (qmail 3112474 invoked from network); 10 Mar 2026 08:55:47 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:47 +0100
X-UD-Smtp-Session: l3s3148p1@UTnb2KZMmJAujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 00/15] hwspinlock: move device alloc into core and refactor includes
Date: Tue, 10 Mar 2026 08:55:15 +0100
Message-ID: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_005554_923228_932060C7 
X-CRM114-Status: GOOD (  19.69  )
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

Changes since v3:

* removed useless __iomem annotations (Thanks, sparse + buildbots)
  So, the newly introduced callback only operates on void* and doesn't
  use __iomem annotations now. Note that most of the drivers will still
  trigger a sparse warning because they use an __iomem pointer in
  .con_priv. But they also did so before this series, so it keeps
  current behaviour. Fixing these sparse warnings should be done
  independently IMO.
* rebased to 7.0-rc3
* added tags (Thanks!)

My ultimate goal is to allow hwspinlock provider drivers outside of the
subsystem directory. It turned out that a simple split of the headers
files into a public provider and a public consumer header file is not
enough because core internal structures need to stay hidden. Even more,
their opaqueness could and should even be increased. That would also
allow the core to handle the de-/allocation of the hwspinlock device
itself.

This series does all that. Patches 1-2 remove the meanwhile unused
platform_data to ease further refactoring. Patches 3-9 abstract access
to internal structures away using helpers. Patch 10 then moves
hwspinlock device handling to the core, simplifying drivers. The
remaining patches refactor the headers until the internal one is gone
and the public ones are divided into provider and consumer parts. More
details are given in the patch descriptions.

One note about using a callback to initialize hwspinlock priv: I also
experimented with a dedicated 'set_priv' helper function. It felt a bit
clumsy to me. Drivers would need to save the 'bank' pointer again and
iterate over it. Because most drivers will only have a simple callback
anyhow, it looked leaner to me.

This series has been tested on a Renesas SparrowHawk board (R-Car V4H)
with a yet-to-be-upstreamed hwspinlock driver for the MFIS IP core. A
branch can be found here (without the MFIS driver currently):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest

Happy hacking,

   Wolfram


Wolfram Sang (15):
  hwspinlock: u8500: delete driver
  hwspinlock: remove now unused pdata from header file
  hwspinlock: add helpers to retrieve core data
  hwspinlock: add callback to fill private data of a hwspinlock
  hwspinlock: omap: use new callback to initialize hwspinlock priv
  hwspinlock: qcom: use new callback to initialize hwspinlock priv
  hwspinlock: sprd: use new callback to initialize hwspinlock priv
  hwspinlock: stm32: use new callback to initialize hwspinlock priv
  hwspinlock: sun6i: use new callback to initialize hwspinlock priv
  hwspinlock: handle hwspinlock device allocation in the core
  hwspinlock: move entries from internal to public header
  hwspinlock: remove internal header
  hwspinlock: sort include and update copyright
  hwspinlock: refactor provider.h from public header
  hwspinlock/treewide: refactor consumer.h from public header

 Documentation/locking/hwspinlock.rst          |   2 +-
 MAINTAINERS                                   |   3 +-
 drivers/base/regmap/regmap.c                  |   2 +-
 drivers/hwspinlock/Kconfig                    |  10 --
 drivers/hwspinlock/Makefile                   |   1 -
 drivers/hwspinlock/hwspinlock_core.c          | 129 +++++++++++----
 drivers/hwspinlock/hwspinlock_internal.h      |  72 --------
 drivers/hwspinlock/omap_hwspinlock.c          |  27 ++-
 drivers/hwspinlock/qcom_hwspinlock.c          |  69 ++++----
 drivers/hwspinlock/sprd_hwspinlock.c          |  39 ++---
 drivers/hwspinlock/stm32_hwspinlock.c         |  26 +--
 drivers/hwspinlock/sun6i_hwspinlock.c         |  36 ++--
 drivers/hwspinlock/u8500_hsem.c               | 155 ------------------
 drivers/iio/adc/sc27xx_adc.c                  |   2 +-
 drivers/irqchip/irq-stm32mp-exti.c            |   2 +-
 drivers/mfd/syscon.c                          |   2 +-
 drivers/nvmem/sc27xx-efuse.c                  |   2 +-
 drivers/nvmem/sprd-efuse.c                    |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c         |   2 +-
 drivers/soc/qcom/smem.c                       |   2 +-
 drivers/spi/spi-sprd-adi.c                    |   2 +-
 .../{hwspinlock.h => hwspinlock/consumer.h}   |  57 +------
 include/linux/hwspinlock/provider.h           |  60 +++++++
 23 files changed, 260 insertions(+), 444 deletions(-)
 delete mode 100644 drivers/hwspinlock/hwspinlock_internal.h
 delete mode 100644 drivers/hwspinlock/u8500_hsem.c
 rename include/linux/{hwspinlock.h => hwspinlock/consumer.h} (87%)
 create mode 100644 include/linux/hwspinlock/provider.h

-- 
2.47.3


