Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD45C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vIs0KGFrnLkEB6lVD/G0WPoMqj+gW5ddp+YfARK/wE=; b=RgSZaw8nIZINkBW2cNvkfBENWi
	eo8W1e3sIoxrn66XU7DhK0m0KcYyMAYq9oUqM/+swdBxh8bNE+wujUJUpjFMda6FEO7KCtNpm1Et6
	Rble3dluhtCQKgIDcIO3xFvcPezoPQzUMg/g9+6zhSIM+GkmerOqvud2VL2oUooJWTyLbidbtJWgw
	kCQXvC+r2zq1bJTZJqRd818zNXejYc/TApRS41p57aLCHejykkunHwF9QLGrgn7R11hMw0GHYYx/1
	byChcYG0IK0p5B+tP8JoIdBn5CY19P+1uPQZk1VTWUP2MDrxEcK3wc1GRbd/AVgdzTHrD9MEtmdu+
	QZjJAH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGv4Z-00000008FA6-2eKi;
	Mon, 19 May 2025 07:38:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGv2X-00000008EzP-0wVP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 07:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B89B85C4831;
	Mon, 19 May 2025 07:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246D8C4CEE4;
	Mon, 19 May 2025 07:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747640159;
	bh=zVO3+aXmayvngbyw4PYPDuKbl+yyblwK0y0qXrmeAvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSBfSPEKXsp/UlGw7oh6zxljPJhursDcFHV+SVB7eJixi2czxaPjMaAWCj8fR+g4o
	 wrHAs+OAquHVincN9MFKT5NIJksr8FZfvlJ/VYIJT3gOnzscxwi+qNgCx6esb2DVSK
	 yqt8NBb0L6+ISLqLcM414LnjsMRJFT3BwMa6RqEVtlDCun7+h8ndXvGhkb8//8QhXm
	 flNeM0oUQcX2TWnyv55TRJ9lv7n5mMb9JTN5COoBbcz1K7WbS/mqw0R8B/2JNq4BpX
	 KKzemZfAQPADmqX2YG9QT1gE781xOJIWt6p96zlvlcEKhgFnneo89LaJomzVsZoFtU
	 EvU8U3PVSEpPw==
Date: Mon, 19 May 2025 08:35:53 +0100
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: daniel.lezcano@linaro.org, alexandre.torgue@foss.st.com,
	tglx@linutronix.de, ukleinek@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jic23@kernel.org, robh@kernel.org,
	catalin.marinas@arm.com, will@kernel.org,
	devicetree@vger.kernel.org, wbg@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com
Subject: [GIT PULL] Immutable branch between MFD, Clocksource and PWM due for
 the v6.16 merge window
Message-ID: <20250519073553.GH2936510@google.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_003601_317021_39CC3844 
X-CRM114-Status: UNSURE (   8.56  )
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

Enjoy!

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-clocksource-pwm-v6.16

for you to fetch changes up to 3f51b232c1da8e59eb562f1d81533334827a4799:

  pwm: stm32-lp: Add support for stm32mp25 (2025-05-13 11:13:56 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Clocksource and PWM due for the v6.16 merge window

----------------------------------------------------------------
Fabrice Gasnier (4):
      dt-bindings: mfd: stm32-lptimer: Add support for stm32mp25
      mfd: stm32-lptimer: Add support for stm32mp25
      clocksource/drivers/stm32-lptimer: Add support for stm32mp25
      pwm: stm32-lp: Add support for stm32mp25

 .../devicetree/bindings/mfd/st,stm32-lptimer.yaml  |  40 +++-
 drivers/clocksource/timer-stm32-lp.c               |  61 +++++-
 drivers/mfd/stm32-lptimer.c                        |  33 +++-
 drivers/pwm/pwm-stm32-lp.c                         | 219 ++++++++++++++++++---
 include/linux/mfd/stm32-lptimer.h                  |  37 +++-
 5 files changed, 350 insertions(+), 40 deletions(-)

-- 
Lee Jones [李琼斯]

