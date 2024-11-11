Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695D9D12D60
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 02:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tP2ohGVIGmdTyqdy89HiQz2NLz+eTXxS/9PUWtKazWc=; b=osFLjdoHQ1plxS+y3Cu9raUsUu
	LzLZmZYsf0cSdi9f3xQXOhXllHR3l3QFEwCiLAaOL3b2Vj/Lvv2fk5tuFLbI1acl8exRuT59x5vBW
	F/MipgpKd/eicpCv9WWgdfeatThtQKewPJC5ibIGeIvNQ6jBYk+pK7eAWS7CjQvAdeB0nddWNEFOL
	BNn6p1MRIZ8RszzwU7J7XZhUdBK08LXAVIli8rqJILbGapZjR5pxbTDcRst64O6HD79cDYRiL23sz
	ujbJ8Pne51C+JY9GIHZrDdbJpi8sZ7bZcAwGsDcnM7zGPhe8jS4r6OicGT0cjEUscJ8UczTsAUleJ
	VqHermWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAKJd-0000000G8rP-436N;
	Mon, 11 Nov 2024 02:38:10 +0000
Received: from mail-m17243.xmail.ntesmail.com ([45.195.17.243])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAKG5-0000000G8Ju-3CeW;
	Mon, 11 Nov 2024 02:34:32 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 258a582e;
	Mon, 11 Nov 2024 10:34:18 +0800 (GMT+08:00)
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
Subject: [PATCH v4 0/4] gpio: rockchip: Update the GPIO driver
Date: Mon, 11 Nov 2024 10:34:08 +0800
Message-Id: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkIeSFYeQx1CSBkdTUhDSExWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9319126e4009d8kunm258a582e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTo6DBw6CTIjQyw2Mw0wGDI#
	HDNPCxFVSlVKTEhKSUJJT01LSUpCVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSklJQzcG
DKIM-Signature: a=rsa-sha256;
	b=Iqs2Ik+NcCDLFSg6XbsIWIUVDLf10uJ+I3F+4RKhZ8gUF1NAWIbdafEeWJu5oeSFwzbIvbF/bajJ3bprPT3BP+KP8LA6ucz/jLnRy8JlAkVma7es47nK0JljLJaD6IaWw1BLWY5ts7mdEp5nyFbiHs80wqAExBcm2RBMDFeWDn0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=tP2ohGVIGmdTyqdy89HiQz2NLz+eTXxS/9PUWtKazWc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_183430_255772_F3CE6A97 
X-CRM114-Status: UNSURE (   8.43  )
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

Ye Zhang (4):
  gpio: rockchip: explan the format of the GPIO version ID
  gpio: rockchip: change the GPIO version judgment logic
  gpio: rockchip: support new version GPIO
  gpio: rockchip: Set input direction when request irq

 drivers/gpio/gpio-rockchip.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

-- 
2.34.1


