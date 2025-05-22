Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D39C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 06:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m/ybV8VaFbJ2uVaOm6miMVmNZ43aDG19ADidxapMFmA=; b=yOBctIbiBc/vRDsugtZWL9Zn8i
	KtAcoFFMaBZBq63aaP8DaKdtxE2cvPZQdnbUPh0oirgpotUWYJ+pnuokfddSk3aN7zblT0GrkfOoD
	max7woV+4tamEuQUBjoQToA5OzQHXZkPwJPXuLQgL0M78ZzVqvhUZ1t3mIDe4HjwKuJgO1Q0SEaEn
	Hl91zUWXsAqopN3HIBfrSqKJ8yEcgft1cqA34XVvR9CkEeETpxVrWpRS6axOJqProeVKMke+Lknw6
	Lr20AgebsazbQgXAjzd7IhYFYndLXqORplA1iu974guVdBSXgZZuAI9abBF6IQZWRFSs+MBqvXjWj
	9UdlOjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHza5-000000001ML-2l2x;
	Thu, 22 May 2025 06:39:05 +0000
Received: from mail-m19731109.qiye.163.com ([220.197.31.109])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHzTz-000000000T7-1Kjg;
	Thu, 22 May 2025 06:32:48 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1602d155c;
	Thu, 22 May 2025 14:32:33 +0800 (GMT+08:00)
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
Subject: [PATCH v3 0/2] rockchip: add can for RK3576 Soc
Date: Thu, 22 May 2025 14:32:29 +0800
Message-Id: <20250522063232.2197432-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQksZSFZNHxhOSkpIGRkYTUpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96f6b18f1903a3kunme211611210aaa53
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjI6SAw5KDE9FBIwHEMMEB0S
	UTEwFCNVSlVKTE9MQ0JOTk5OT0hCVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpMTU83Bg++
DKIM-Signature: a=rsa-sha256;
	b=QtY4siXE7thcVpnfPdQKg9euhrmPRsX6hzSia0TPEWB+KPk8q/T/ndhXy/soryqmHy4Sk1zE8jS7KBAsoNftOIuJ0D1KYFedhUB8H56dcwWkWSFldSZHqiNG7tttdF7m5hV85CVeiAnzZt1XTG0FVbsAPsCu94N0W3MrO9Xuh70=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=m/ybV8VaFbJ2uVaOm6miMVmNZ43aDG19ADidxapMFmA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_233247_506070_23B79EC5 
X-CRM114-Status: UNSURE (   7.30  )
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

rk3576 can is a new controller:
Support CAN and CANFD protocol.
Support Dma.

There are major differences from the previous rk3568. All errata on the
rk3568 have been fixed and redesigned.

Change in V3:
[PATCH v3 1/3]: Add documentation for the rk3576 CAN-FD.
[PATCH v3 2/3]: Adjust the differentiated code section and add dma function.
[PATCH v3 3/3]: Remove dma, no use dma by default.

Change in V2:
[PATCH v2 1/2]: remove rk3576_canfd.c, use the rockchip_canfd driver
[PATCH v2 2/2]: code style.

Elaine Zhang (2):
  net: can: rockchip: add can for RK3576 Soc
  arm64: dts: rockchip: rk3576: add can dts nodes

 arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  26 +
 .../net/can/rockchip/rockchip_canfd-core.c    | 640 ++++++++++++++++--
 drivers/net/can/rockchip/rockchip_canfd-rx.c  | 202 +++++-
 drivers/net/can/rockchip/rockchip_canfd-tx.c  |  29 +
 drivers/net/can/rockchip/rockchip_canfd.h     | 312 +++++++++
 5 files changed, 1161 insertions(+), 48 deletions(-)

-- 
2.34.1


