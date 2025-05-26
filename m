Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD5DC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 06:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PLZ0qwoosUUE5XwgBZkpDsN7ujf59+z2ZeMIful5s1Q=; b=xu89DdmwKdZ/n1a7q9M6XMJyo0
	oDJJebgPMInZswP9x5vr12HHYJSX7WJoYCxRlcs0zoyvkqG11FtM+ASwRdE/yV5IvohiLRJEtFioA
	y2FpsJG/hw4uDQdEhK9MNLaaOGf92cAEntdTdxLrlpf66YOz3oryoIS1QYjpK15SBUrmVOtsIPLi4
	6ZCgTk7Vp2LpMs0Zar9XaKL3y9jKRQFzEGl1qUaraC2BKzxIQ0ntxOKlqYj4MGWsM7QYoScwAZ9FJ
	6rJDtoI0XP9DGAMKHd8jwUdjzeQm4KBNGILCp+vCtwR91ZUM2OCBdLvHuS+V3nwgsp5CbGcFqOTjo
	RIVnLQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJRN1-00000008CYU-0R4c;
	Mon, 26 May 2025 06:31:35 +0000
Received: from mail-m128225.netease.com ([103.209.128.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJRHm-00000008Bq0-3Krc;
	Mon, 26 May 2025 06:26:12 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1660c015a;
	Mon, 26 May 2025 14:26:00 +0800 (GMT+08:00)
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
Subject: [PATCH v6 0/4] rockchip: add can for RK3576 Soc
Date: Mon, 26 May 2025 14:25:55 +0800
Message-Id: <20250526062559.2061311-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlLSlYZHk1NTEtIGkhOHk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a970b44ff8b03a3kunm902b49ed4a332d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PFE6Hgw6MDE0Og40ViENKiMR
	HigwFCtVSlVKTE9DSU9LTE1JSU5KVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlDSU43Bg++
DKIM-Signature: a=rsa-sha256;
	b=Uwr3msEKJ8hrOXUNf0OS1lAQsZf/fqwM9a+9WoTz6+M6zGwCZalkAUXq1Xl2Uw+qvsxpHtSyiAJYL1svVhTiFf4k8u2aIruSbsZs+/KmS9U5GWP13z/3zzIL3oXar2sr3rw5eITYQ3C2h0m9R2IALsXO3ezqYTe+P3ZSaUfF8wE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=PLZ0qwoosUUE5XwgBZkpDsN7ujf59+z2ZeMIful5s1Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_232611_188991_9D66A25A 
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

rk3576 can is a new controller,new register layout and Bit position
definition:
Support CAN and CANFD protocol.
Support Dma.

There are major differences from the previous rk3568.
All errata on the rk3568 have been fixed and redesigned.

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

 .../net/can/rockchip,rk3568v2-canfd.yaml      |  41 ++
 .../net/can/rockchip/rockchip_canfd-core.c    | 596 ++++++++++++++++--
 drivers/net/can/rockchip/rockchip_canfd-rx.c  | 198 ++++++
 drivers/net/can/rockchip/rockchip_canfd-tx.c  |  27 +
 drivers/net/can/rockchip/rockchip_canfd.h     | 289 +++++++++
 5 files changed, 1108 insertions(+), 43 deletions(-)

-- 
2.34.1


