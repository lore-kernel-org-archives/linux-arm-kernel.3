Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDE1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Uk6L7z9D+6ozowOZVJjW383hYkCXTw5z+y50g/Q2iQ=; b=S8TVJqil0ERhVx
	6Y06uDco15az7LYTAiEOI8qiGUMpZRxUlbFi+tkSCElfTb/vk6LD+x8Q4OTG5bSB3BxIFHL2Vbz/n
	hMAU+AjuU5V9tzZlYuD3Q3jPZydLHkxBXHjkjATDEhpKXD2TRkF5pDr8KdHvN/7WfU9zBicAf2GBR
	he6bM4fWsRVIf0RgG6lZIAb/QhJ0CKqzGhqtIuBh72uGV6dGQ5I5sUHloLj1DqFNnYjuD5qHB3TvX
	HThCmNW7ukQVUJZCU8wxC0jMNQBD03uCyBYs9McXTfme7xYw17kNRfgkbPmQoJEyywwceUVekf8Kh
	liTlCOZY2BxZ9xAdvoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNc48-0000000EUd7-49zJ;
	Tue, 17 Dec 2024 18:13:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNc33-0000000EUS9-2Qab
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 18:11:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82206A41D69;
	Tue, 17 Dec 2024 18:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D72FC4CED3;
	Tue, 17 Dec 2024 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734459115;
	bh=mtJsy/fk+q+6RZ47ZPA0DWr8yUNsDYMIiX5lk9n9xqk=;
	h=From:Subject:Date:To:Cc:From;
	b=kw24lEpXX3MFp9Ynu8fTbRSrbczB0o8buMv3EDvC7LLSp9Yj7G4iRo2hSCFdqnoD/
	 wyphzxUhgziPmold6SXf2XloA6C5TOv3YeGP7O9ssLsF8m+EpfMSbdxR1VicPmVB72
	 XPsBftQRL7cmgDCvFxNlsN+i1XbpFHdJVfHNtpE3HMU7YQIA3vvbiWN5t239023yPv
	 OEQxXXgarRwYY9zde3KlFmagFnyi5UGMmLpJ0yeIVE8od3gFqPT5hK3E81V1jZGOc7
	 2ms9TypMnXPmu9xF1klzDghhKbK9VDzeAp/a+8aB7/vaI7794GhiiAVqI3mC20wi9U
	 +6NRZ/JZ4oHCw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v2 0/3] mfd: syscon: Cleanup, fix race condition and remove
 platform driver
Date: Tue, 17 Dec 2024 12:11:39 -0600
Message-Id: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANu+YWcC/3WMQQrCMBBFr1Jm7UgTrRhX3kO6aOKkHZREZqRYS
 u5u7N7l+5/3VlASJoVLs4LQzMo5VbC7BsI0pJGQ75XBtvZorDGoi4acMPKHFF08dBS889ETVOU
 ltB3VuPWVJ9Z3lmWrz+a3/gnNBlv03RDOwRpH7nR9kCR67rOM0JdSvtTj6/OpAAAA
X-Change-ID: 20241211-syscon-fixes-9f35ecb9bfbe
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Pankaj Dubey <pankaj.dubey@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 John Madieu <john.madieu.xa@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_101157_681819_6BD93F32 
X-CRM114-Status: UNSURE (   9.72  )
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
Changes in v2:
- Fix patch 3 logic when a syscon is found in list to not return an 
  error
- Add tags
- Link to v1: https://lore.kernel.org/r/20241211-syscon-fixes-v1-0-b5ac8c219e96@kernel.org

---
Rob Herring (Arm) (3):
      mfd: syscon: Fix race in device_node_get_regmap()
      mfd: syscon: Remove the platform driver support
      mfd: syscon: Allow syscon nodes without a "syscon" compatible

 drivers/mfd/syscon.c                 | 95 ++++++------------------------------
 drivers/mfd/vexpress-sysreg.c        |  1 -
 include/linux/platform_data/syscon.h |  9 ----
 3 files changed, 15 insertions(+), 90 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241211-syscon-fixes-9f35ecb9bfbe

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


