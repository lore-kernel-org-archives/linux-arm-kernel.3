Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868E9CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 01:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VQDe0qd4BJs1skNAK8EBE03leCXmi2MVma2kr6Rm7Lw=; b=KfA+CX0encLJEo7oN1EXFz5gOb
	8KnicIOAA4eVzmER+BA8lYW6DB+7brvj0ey/ozG7Y9lYKj+JIAMKFRCKSpZf+7Gym2zol5ev1WvCx
	jnswA7anOSHszJ5J1e1Ts7ANye4YBU8nV/x4p5+rahdaOOtiMfK7mEUS5KBpv1LfAcedsazxw3Xj9
	8bg0GGlplK1qnXNTaYEh+7K7hWSmm8xQPAxQqZC/IcZdR4SpGaTCSwrb5FyZWQHdzXKgjn5fkwa9r
	IU5esl4ZJoQRosC+72ankZqsKglHfGwZDaI0MTYLDzBJ9WIX31q7UrF0LfXIUV7DPjkqzd63o1uvl
	xajfYIsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAh2-0000000H9G4-3VZU;
	Tue, 18 Nov 2025 01:39:40 +0000
Received: from mail-m32111.qiye.163.com ([220.197.32.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAh0-0000000H9EO-0Y59;
	Tue, 18 Nov 2025 01:39:39 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29e9c3744;
	Tue, 18 Nov 2025 09:39:30 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: zhangqing@rock-chips.com,
	mkl@pengutronix.de,
	kernel@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	cl@rock-chips.com
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v10 0/3] rockchip: add can for RK3576 Soc
Date: Tue, 18 Nov 2025 09:39:26 +0800
Message-Id: <20251118013929.2697132-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a949df36403a3kunm07a8ba9e476a7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh1JSVZNQhkeSR8eHk8fTRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=d95EsqwjGLzRTOUj/OyJtYu/8aGbohZlmGLCXmgNZ3IEbb1dOlTtwFe9hiOiJenrr4Glet22Dmj1AV4fN4JS9nqNNmgt/kFem93V4ZV3r7rKz4FTuhgU/pSHihamP6xELW5wjkJI0a6u4f3+Iaadru5wVTHRIr/6aOGx8feVMCQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=VQDe0qd4BJs1skNAK8EBE03leCXmi2MVma2kr6Rm7Lw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_173938_376136_1046D5DF 
X-CRM114-Status: GOOD (  10.14  )
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

rk3576 can is a new CAN controller:
new register layout and Bit position definition:
There are major differences from the previous rk3568.
All errata on the rk3568 have been fixed and redesigned.

RK3576 TRM update: CANFD is replaced with RKCAN.

Change in V10:
[PATCH v10 1/3]: Add ACK for commit message.
[PATCH v10 2/3]: No change.
[PATCH v10 3/3]: Update commit message, fix get_berr_counter.
		 Add log for errata, drop RKCANFD_QUIRK_CANFD_BROKEN.

Change in V9(Drop dma):
[PATCH v9 1/3]: Drop dma, fix "allOf:"
[PATCH v9 2/3]: No change.
[PATCH v9 3/3]: Drop dma for commit message.

Change in V8:
[PATCH v8 1/4]: Drop CANFD, correction format warning.
[PATCH v8 2/4]: Drop fifo_setup of rkcanfd_devtype_data.
[PATCH v8 3/4]: Drop CANFD.
[PATCH v8 4/4]: Drop CANFD.

Change in V7:
[PATCH v7 1/4]: Correction format warning.
[PATCH v7 2/4]: No change.
[PATCH v7 3/4]: Correct the writing of some registers and
                correct the annotations.
[PATCH v7 4/4]: Optimize the structure parameters and
                ensure error handling.

Change in V6:
[PATCH v6 1/4]: Fix dma is support only for rk3576.
[PATCH v6 2/4]: Fix the compilation warning.
[PATCH v6 3/4]: Fix the compilation warning.
[PATCH v6 4/4]: Fix the compilation warning.

Change in V5:
[PATCH v5 1/4]: Add rk3576 canfd to rockchip,rk3568v2-canfd.yaml, remove
                rockchip,rk3576-canfd.yaml
[PATCH v5 2/4]: Encapsulate some hardware operation functions into
                rkcanfd_devtype_data to provide differentiated
                implementations for different models
                (such as RK3568v2/v3)..
[PATCH v5 3/4]: Add rk3576 canfd,fix the register naming rule,
                Delete the variables used by rockchip itself.
[PATCH v5 4/4]: Fix .h sorting.


Change in V4:
[PATCH v4 1/3]: Correct the format and add explanations.
[PATCH v4 2/3]: No change.
[PATCH v4 3/3]: No change.

Change in V3:
[PATCH v3 1/3]: Add documentation for the rk3576 CAN-FD.
[PATCH v3 2/3]: Adjust the differentiated code section and
                add dma function.
[PATCH v3 3/3]: Remove dma, no use dma by default.

Change in V2:
[PATCH v2 1/2]: remove rk3576_canfd.c, use the rockchip_canfd driver
[PATCH v2 2/2]: code style.

Elaine Zhang (3):
  dt-bindings: can: rockchip_canfd: add rk3576 CAN controller
  net: can: rockchip: Refactor the rkcanfd_devtype_data structure
  net: can: rockchip: add can for RK3576 Soc

 .../net/can/rockchip,rk3568v2-canfd.yaml      |   4 +-
 .../net/can/rockchip/rockchip_canfd-core.c    | 505 ++++++++++++++++--
 drivers/net/can/rockchip/rockchip_canfd-rx.c  | 103 ++++
 drivers/net/can/rockchip/rockchip_canfd-tx.c  |  20 +
 drivers/net/can/rockchip/rockchip_canfd.h     | 268 ++++++++++
 5 files changed, 857 insertions(+), 43 deletions(-)

-- 
2.34.1


