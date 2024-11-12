Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0679D41D44
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 01:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6AuQFO64sIU4rM/H0ID+uAjI797Zr2ZRce2AWgFdwng=; b=2Ewccy6/bWP9x0dT/C21l5TrYB
	DbIV5Cl1m+upV58rWbtBjVoAwODPJNmmdhe8Yqv15O79kNIfJxrZId7Op8Zc5qPiYbJQD4hJcgb1L
	43bohU7LRNJ+jnXLylBqg9zBV18mZMWHo/HReB7NJZqbwV8NYiSyirmY83vn1+W1F1nbpynJAwt3j
	tV5cctUEfMXqhHQjC3FjbtTziiWwlpDwTqwT2lh3Ls8ezbGei9eYP5IxAU2e5q+r0chnEqFzUr5E+
	YXk0bvH4SzfqUq4oPe0UutkV6MYzzkgTvhTV+SrnIpMTyvI5rADxwV63kuZliY83pqZFMIlz4o+T5
	j70gckQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAg8Y-00000001um2-4BpW;
	Tue, 12 Nov 2024 01:56:11 +0000
Received: from mail-m11871.qiye.163.com ([115.236.118.71])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAg6l-00000001ubV-2lh6;
	Tue, 12 Nov 2024 01:54:21 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 275d3f0f;
	Tue, 12 Nov 2024 09:54:11 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: [PATCH v5 0/4] gpio: rockchip: Update the GPIO driver
Date: Tue, 12 Nov 2024 09:54:04 +0800
Message-Id: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkoYS1ZCTU5MTR4fQkJKTB1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a931e14101309d8kunm275d3f0f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSI6GDo*ATIuAho1PzQ4SSJI
	FDUaCz1VSlVKTEhKSExNT05IS05MVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkhOQjcG
DKIM-Signature: a=rsa-sha256;
	b=Edqr9xHVK5HY+RYR2Qhw5SKDHWdFh7d+vTKB1XYxCAtdo3oeM9ecLpupl6n6F1dt7Z4gQvdO3HMvS4uMJmJ9jzt0VqXORY8GIAJgmLweh84pPMbebd7r6iyMkqgyijxQw4dDHqY76dMaVUlLd7t+rxD53+RwB9thn3v5ssf8CyE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=6AuQFO64sIU4rM/H0ID+uAjI797Zr2ZRce2AWgFdwng=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_175420_213691_A2F1BE94 
X-CRM114-Status: UNSURE (   8.97  )
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

GPIO driver support acpi and new version, set input direction in
irq_request_resources, fix division error and debounce config error.

Changes since v1:
- Split commits with multiple changes into separate commits.
- Adjust backportable fix to the forefront.
- Modify messages of some commits.

Changes since v2:
- Optimize version number comments.
- Modify the GPIO version judgment logic.
- Use devm_clk_get_enabled to simplify the code.
- Use guard instead of mutex_lock to simplify the code.
- Use irq_hw_number_t and irqd_to_hwirq() in the request irq function.
- Since list_first_entry cannot return NULL, remove the NULL check.
- Temporarily do not add support for ACPI.

Changes since v3:
- Give up modifying the debounce config because it is not actually used.
- Do not add support for retrieving clocks using 'clock-names'.

Change since v4:
- Leave the V2 case first and the V1 case last in version judgment.
- Fix the error message in version judgment.

Ye Zhang (4):
  gpio: rockchip: explan the format of the GPIO version ID
  gpio: rockchip: change the GPIO version judgment logic
  gpio: rockchip: support new version GPIO
  gpio: rockchip: Set input direction when request irq

 drivers/gpio/gpio-rockchip.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

-- 
2.34.1


