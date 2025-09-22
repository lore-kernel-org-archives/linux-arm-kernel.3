Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBAACAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LfXJiKVd7yQ24BTS+n3MbyE5ZCs02XLEVPDFXxi839A=; b=iat8k8vqFYyUCfJphr3ZfwiB01
	v2H7jdGPTShsDDXYay0Wj7RLePUOlTg1N0fUtLto3XmNu4HLASApvQ6gyTOAgzlUx9rOIr74WLCaA
	uD+l7rdlmgH2TJxImUT9WDS+GOuXttppULqq+NUanVUtYa4ciWCe5BiUPN4h/RrFLR5pSRajjmJcI
	VgLIsRRHQ6nLUu3RYnsCHVU6tk7aqXL5xfpLqLih3rgOAu1DNVXx50+a/fEf2tebB9UjctZ2RMssQ
	thuZTuyvLd6BtgYDUhyRVMWHalvr57CuVJyvPY1Z9IZW2jRCaj3sG6EtKSaotzkNhF2SpvUlf5Mem
	cfIE99sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0amF-00000009AyE-42b8;
	Mon, 22 Sep 2025 07:15:59 +0000
Received: from mail-m1973186.qiye.163.com ([220.197.31.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0amB-00000009Aoy-3LmA;
	Mon, 22 Sep 2025 07:15:58 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 239b62a99;
	Mon, 22 Sep 2025 15:15:45 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: zhangqing@rock-chips.com,
	mkl@pengutronix.de,
	kernel@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	cl@rock-chips.com,
	kever.yang@rock-chips.com
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 0/4] rockchip: add can for RK3576 Soc
Date: Mon, 22 Sep 2025 15:15:39 +0800
Message-Id: <20250922071543.73923-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9970474f0903a3kunm864fae2f2315c8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkNNTVZMSB1KTkMYGRpPGh1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KE7Rv2CE+ZXC/KBCM4fcVt3eygVCR275X14zH9jCE3LBjvNIH1+Z+VnJp4NBuEx5nqV7loP2/xFcQEC09+AopRbniEd2Fe3cEHBsg5a12U/53Yt7KwR2aSZ6/Jrme0a5aQaB1G8wge7jsgPE9J8gU8GiEmhUUwLHuMAto7k/RUo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=LfXJiKVd7yQ24BTS+n3MbyE5ZCs02XLEVPDFXxi839A=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_001556_394973_10765348 
X-CRM114-Status: UNSURE (   9.30  )
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

rk3576 can is a new controller,new register layout and Bit position
definition:
Support CAN and CANFD protocol.
Support Dma.

There are major differences from the previous rk3568.
All errata on the rk3568 have been fixed and redesigned.

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

Elaine Zhang (4):
  dt-bindings: can: rockchip_canfd: add rk3576 CAN-FD controller
  net: can: rockchip: Refactor the rkcanfd_devtype_data structure
  net: can: rockchip: add can for RK3576 Soc
  net: can: rockchip: support dma for rk3576 rx

 .../net/can/rockchip,rk3568v2-canfd.yaml      |  47 +-
 .../net/can/rockchip/rockchip_canfd-core.c    | 586 ++++++++++++++++--
 drivers/net/can/rockchip/rockchip_canfd-rx.c  | 212 +++++++
 drivers/net/can/rockchip/rockchip_canfd-tx.c  |  20 +
 drivers/net/can/rockchip/rockchip_canfd.h     | 278 +++++++++
 5 files changed, 1095 insertions(+), 48 deletions(-)

-- 
2.34.1


