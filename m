Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB94CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 03:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=au2n4rrZx8SO4PVuqq8XAKDLJGp5zKXJpUNLmozR0c8=; b=pLNjX2LDFD/NYYjBPoMNRTBsse
	6PS0ClQx8joEO3UY7ooZGSRP1qLNsqUvDWr4MVoh6c2gWAmkA1d3yEYYUrdvUgbJYfcXRCIIFmfLf
	jGiuYBbVH+1c3zZOJyqV6/urn/S5wMZSPrjED6swH2ocDxg1Tj1ULm74DUmdDyPpC15nJKI0X+5Js
	rvQEg/uI2jq4Y/Ox5uRpgyztdF/kwLSWh4hRrIKrSPLAMKkaGRCTxmmzZSLEQkDHHayHjSWELrbU6
	bE+ghlxWB+bDh7eTD7VHOu/KJK42Qpikev9BJEPW8wA/G6npO8gXflfqsO2iAOksp5Hd0VwT8+6Nc
	+bnnSgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDwmN-0000000H29z-078g;
	Wed, 29 Oct 2025 03:23:19 +0000
Received: from mail-m82107.xmail.ntesmail.com ([156.224.82.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDwmI-0000000H26a-2St6;
	Wed, 29 Oct 2025 03:23:17 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 279245ee8;
	Wed, 29 Oct 2025 11:23:04 +0800 (GMT+08:00)
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
Subject: [PATCH v8 0/4] rockchip: add can for RK3576 Soc
Date: Wed, 29 Oct 2025 11:22:58 +0800
Message-Id: <20251029032302.1238973-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a2dfd94c903a3kunm7a63a81221fa97
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk4eGFZOGR1NTEMfGk9KTh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ls3LksbnYXmhl9tXfUdaMaCsM+8IBaYUCjoPlX6zN+hOaDQ4ygEmoiSvWKNTD+Z0fQ0786OyWnvAqLGnH4RmD2tR6Wut9VX0ugdox9uDVd3rEX8hJHL4rKLecqe0ZFurvtRBt7ywm+6nZLnf7isyOxSdSFmx5cmBAGMrIHlIm9Q=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=au2n4rrZx8SO4PVuqq8XAKDLJGp5zKXJpUNLmozR0c8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_202314_967655_BE6BFF48 
X-CRM114-Status: GOOD (  10.61  )
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
Support CAN protocol.
Support Dma.

There are major differences from the previous rk3568.
All errata on the rk3568 have been fixed and redesigned.

RK3576 CANFD requires authorization and permission. The software
code is not open by default and needs to be authorized separately.

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

Elaine Zhang (4):
  dt-bindings: can: rockchip_canfd: add rk3576 CAN controller
  net: can: rockchip: Refactor the rkcanfd_devtype_data structure
  net: can: rockchip: add can for RK3576 Soc
  net: can: rockchip: support dma for rk3576 rx

 .../net/can/rockchip,rk3568v2-canfd.yaml      |  52 +-
 .../net/can/rockchip/rockchip_canfd-core.c    | 581 ++++++++++++++++--
 drivers/net/can/rockchip/rockchip_canfd-rx.c  | 212 +++++++
 drivers/net/can/rockchip/rockchip_canfd-tx.c  |  20 +
 drivers/net/can/rockchip/rockchip_canfd.h     | 277 +++++++++
 5 files changed, 1094 insertions(+), 48 deletions(-)

-- 
2.34.1


