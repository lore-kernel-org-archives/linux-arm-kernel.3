Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C0E77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 20:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ILveYkG+pRYkpi2K4xpbDvuE9+FiiIcF1ka9CHlVXOw=; b=lFikTBj5qeFSUE
	FalclCBN/hiEVcyPCbkguqb5APowc0L8bqNbUGabX0IMMUKxNu6FusaaRYTxGEnxt9jelGRpDo///
	nLgt9TeLVrdTEJNB08yYIe8R66/6m6D/KBc9CC3eWgfCqB499nY4SbAW/SOHjruYq7fhWTdEt+YQE
	UsryFI49I5UzGHgddNY6qgxZrRbsVhM2mlwC3p2qtpbjc3VuRJYGM0jizjSKfI8LDceFGS6X4ZXUZ
	qMXkluNN4GY74GIOodSNvoFXvldyIcxyAYT4XtNB5usi9X0tr8nq+o43ByzjYctMOepy0Se11vmiC
	AXt0ep2oE9e7t4gRGuOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTn2-0000000G5oB-3meW;
	Wed, 11 Dec 2024 20:58:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTlx-0000000G5Sw-2FxS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 20:57:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DDBCEA41A20;
	Wed, 11 Dec 2024 20:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DCCC4CED2;
	Wed, 11 Dec 2024 20:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733950647;
	bh=DJ/7eJXEMrFS4Ie4t4RtBGueyBXmyzT8wnr9zL0rNjQ=;
	h=From:Subject:Date:To:Cc:From;
	b=RvBzwilzzX87al39z6Vy+bi5wss+IoFwC2A2j5kwREPrutznLMqsfYpldp2Wyau2L
	 jMVNj0wW18A7FiH9fQZCrNLSD1KB44eG2jaSFv3XrGTfgH2HbBDA0kQ7e7hAh2SFv0
	 8Ghd9qiTIMJP2qX5ubumbiw516n8dmhwtoY/whTqWDgTp/mwixrUR6HBvfJ3N6bs0D
	 uYmN9WgxxWWPEQRjWZfwFs5rV3vLtcSsyEzs4W5agxHP2L1gWCB/lEVkGU7tc+dGv3
	 fVrRkisnmBBCy2jnOJQE2Np6T56MYM/fQTpX1u9HkPMBY9bju9OPybNgkuKpeLG5Gq
	 nYs+wcTPQKOZQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/3] mfd: syscon: Cleanup, fix race condition and remove
 platform driver
Date: Wed, 11 Dec 2024 14:57:11 -0600
Message-Id: <20241211-syscon-fixes-v1-0-b5ac8c219e96@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKf8WWcC/x3LQQqAIBBA0avIrBPSamFXiRZpY81Gw4EoxLs3t
 Hx8fgXGQsgwqwoFb2LKSWA6BeHc0oGadjHY3o7GGqP55ZCTjvQgaxeHCYN3PnoEWa6Cf5BjWVv
 7AC5SSV5eAAAA
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Pankaj Dubey <pankaj.dubey@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_125729_643756_A347D6A5 
X-CRM114-Status: UNSURE (   8.44  )
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

Questions from Krzysztof and a syscon related binding review got me 
looking at the syscon "driver". This series is the result.

This short series drops the stale platform driver part of syscon 
support, fixes a race condition in device_node_get_regmap()
which is used by all the lookup functions, and allows for registering 
nodes without "syscon" compatibles.

Compile tested only. Testing on Tensor, the one user of 
of_syscon_register_regmap(), would be helpful.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (3):
      mfd: syscon: Fix race in device_node_get_regmap()
      mfd: syscon: Remove the platform driver support
      mfd: syscon: Allow syscon nodes without a "syscon" compatible

 drivers/mfd/syscon.c                 | 92 +++++-------------------------------
 drivers/mfd/vexpress-sysreg.c        |  1 -
 include/linux/platform_data/syscon.h |  9 ----
 3 files changed, 13 insertions(+), 89 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241211-syscon-fixes-9f35ecb9bfbe

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


