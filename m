Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03192E63CBF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 18:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1cYkOR6p+28OeKpILTeDYy1YUmgndRIsJrSEImzjWWs=; b=UfeJuE8aT6jxXMr+WT9RV6BOS7
	ubRQN9450ohuwWJlJP8mpc9+5aht+Ij8S1VGMaJDeHOw0/J8B+bvomfqqrMAEixVsWDjrIgGVSXo7
	ibIwEKKhR/uL6QG7yFeCjfWWEHhHJwNlL8D+CfZx2PpLbjK5wMywjYxand0kvAg2oMupRBJJZb7rB
	jimAX/mmAZK64EtDcY63B1rtgxWxx/LDsH45lzFTFyX6iuw1JqQFNcDAWLLtpKkXo8quFc/qu9VIQ
	YHSh7fB9w0Ij31hIUQbdp8cRlGbIJOjrede1ClJX1qqhrwhknEIyy/x1qsQKO/HPVnbetE6CcLx2F
	TURYvtmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk5DL-0000000BPzV-3CWG;
	Sun, 25 Jan 2026 18:51:59 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk5DH-0000000BPyY-0NuB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 18:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=1cYkOR6p+28OeK
	pILTeDYy1YUmgndRIsJrSEImzjWWs=; b=GUb3b+DY+9mJpJ7B3Rk9AyWsPIlsID
	gYiUHWLfH4MhylfpJpW6wK1EEp4qmRvMXufRAsUMyjw3n6a7jZTjlMDlAiAJeytr
	PDYusfLDkbrdpScgSILsNpYpTv9wxWk3n8sIRRm98T1X5yszKvRP0oq5bX6qilP5
	LjHLu7d1lAZJzkgT7s2l3Qa9JZdRes785y0OH4j4PHwtTrndA/aCfpLOjcH1lb4z
	BtZ0JoJOhdKJB5uQXdN4teK3yDzq+Q8ww2MIjkXg7v93zhNt8uES1joQCXP5zbLl
	u9kPE+ySeVYAst58JG+Fjj7CLKQTVDUGyLh4C9GbhtN1nhxaNB2QPgsw==
Received: (qmail 2369426 invoked from network); 25 Jan 2026 19:51:47 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2026 19:51:47 +0100
X-UD-Smtp-Session: l3s3148p1@Xefl4TpJKhBtKXAW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
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
Subject: [RFC PATCH 0/4] hwspinlock: refactor headers into public provider/consumer pair
Date: Sun, 25 Jan 2026 19:46:51 +0100
Message-ID: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_105155_987829_1C63DA7C 
X-CRM114-Status: GOOD (  14.36  )
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

TLDR: I want to create a hwspinlock provider outside of the hwspinlock
directory. So, I refactored the headers into a provider/consumer pair.
Which seems to me like a reasonable seperation anyhow. No functional
changes. My build tests went fine and buildbots are happy, too.

Longer explanation:

There is a device (MFIS) in newer Renesas SoCs which combines various
things like hwspinlocks, mailboxes and other stuff. Sadly, these are not
strictly separated. Registers are kind of mixed and its register
unprotection scheme will need one of its own locks. I tried various
paths to handle this device (MFD, auxiliary bus) but I concluded that
the sub-device dependencies give enough reasons for a single driver in
drivers/soc/. So, this series will allow me to instantiate a hwspinlock
provider from the other directory.

Patches 1+2 do the actual refactoring with a fallback being in place. I
used '-B' with git-format-patch in this RFC, so the actual changes are
more visible when the headers are moved.

Patch 3 converts all the users. There are not many. We could try to get
all the acks for this single patch. Or I can break it into single
patches and send them to subsystems. I don't mind.

Patch 4 simply removes the fallback.

Looking forward to comments on this approach. If the hwspinlock
maintainers like it as is, I would kindly propose to apply patches 1+2
after 7.0-rc1 comes out. This might sound a bit hasty, but a) I want to
avoid chasing a moving target and b) this would remove one dependency of
the hwspinlock driver I originally intend to upstream, of course.

I would take care of patches 3+4 as needed.

A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-includes

Patches are based on linux-next as of 2026-01-21.

Opinions?

Thanks and happy hacking,

   Wolfram


Wolfram Sang (4):
  hwspinlock: refactor existing headers into provider.h
  hwspinlock: refactor existing headers into consumer.h
  treewide: convert hwspinlock users to the new consumer header file
  hwspinlock: remove old header file

 Documentation/locking/hwspinlock.rst          |  2 +-
 MAINTAINERS                                   |  2 +-
 drivers/base/regmap/regmap.c                  |  2 +-
 drivers/hwspinlock/hwspinlock_core.c          |  5 +--
 drivers/hwspinlock/omap_hwspinlock.c          |  4 +-
 drivers/hwspinlock/qcom_hwspinlock.c          |  4 +-
 drivers/hwspinlock/sprd_hwspinlock.c          |  4 +-
 drivers/hwspinlock/stm32_hwspinlock.c         |  4 +-
 drivers/hwspinlock/sun6i_hwspinlock.c         |  4 +-
 drivers/hwspinlock/u8500_hsem.c               |  5 +--
 drivers/iio/adc/sc27xx_adc.c                  |  2 +-
 drivers/irqchip/irq-stm32mp-exti.c            |  2 +-
 drivers/mfd/syscon.c                          |  2 +-
 drivers/nvmem/sc27xx-efuse.c                  |  2 +-
 drivers/nvmem/sprd-efuse.c                    |  2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c         |  2 +-
 drivers/soc/qcom/smem.c                       |  2 +-
 drivers/spi/spi-sprd-adi.c                    |  2 +-
 .../{hwspinlock.h => hwspinlock/consumer.h}   | 22 ++--------
 .../linux/hwspinlock/provider.h               | 40 ++++++++++++-------
 20 files changed, 49 insertions(+), 65 deletions(-)
 rename include/linux/{hwspinlock.h => hwspinlock/consumer.h} (94%)
 rename drivers/hwspinlock/hwspinlock_internal.h => include/linux/hwspinlock/provider.h (78%)

-- 
2.47.3


