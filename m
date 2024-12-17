Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A443E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 02:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m5s9TN6ZWc54FoiYxfoL/NSqqUE+6gh+7n7jZr6kRGE=; b=EjOA/LPRXUtWki3bHANvIEOXV1
	T4MicIyYqqiUeXzWfqd30yMcBjLNPvIhpTN1vmvGKQJSZW8xHxcY73dOHIuQAcrWld+12+UO+Jfws
	ey7sH8GQXXW9DlJI2WgFf/rOSiI15uWSMj1j7YQFw3TchmmpC6r5EwznFMWUsghiEzvB/RhsQBHPN
	7Znv9CJWLRF32OdUPKuWBzk85WdxF1G9wagKBZAhNjtlG3pyubsQTAOT4uA04HKLuK52uSXkmaa24
	nQfqbuf4Ce/JA9jo+v80W1o+eBdRduOAa0/xD5NO9Pp8sWJmAPqkzjYfrzaeDgR3qmK8CHodqAfV6
	fHsJRgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNVi-0000000BzZp-25me;
	Tue, 17 Dec 2024 02:40:34 +0000
Received: from mail-m3297.qiye.163.com ([220.197.32.97])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNNUd-0000000BzSr-0BsY;
	Tue, 17 Dec 2024 02:39:28 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5ec156ac;
	Tue, 17 Dec 2024 10:39:19 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: zhangqing@rock-chips.com,
	mkl@pengutronix.de,
	kernel@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	heiko@sntech.de,
	cl@rock-chips.com,
	kever.yang@rock-chips.com
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] rockchip: add can for RK3576 Soc
Date: Tue, 17 Dec 2024 10:39:06 +0800
Message-Id: <20241217023908.1292999-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU4dS1YfHx4ZQkNPTxkYGh1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93d27bf65d03a3kunm5ec156ac
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OU06USo4TjITMh8pMxQwUToz
	NhQKCTFVSlVKTEhPT0tISk1LQkpNVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU1OQjcG
DKIM-Signature: a=rsa-sha256;
	b=aL4pvOGSxiFjl4B6jeyKZcqI556GawLS581DTEvWp/TuqRuq7g3oGKkq13u6ZV3odE06UcuDcJmakIZ81F++iQfuJB+wCj474AB0pLkhvapfg3JiQMhB9uquFNK4M9aa524bIas/qVbT33cm5sk7I1tHX3vwJSzSEwpIMqvOiUk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=m5s9TN6ZWc54FoiYxfoL/NSqqUE+6gh+7n7jZr6kRGE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_183927_242200_E2D9FCEE 
X-CRM114-Status: UNSURE (   7.07  )
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
Support DMA

There are major differences from the previous rk3568. All errata on the
rk3568 have been fixed and redesigned.

Elaine Zhang (2):
  net: can: rockchip: add can for RK3576 Soc
  arm64: dts: rockchip: rk3576: add can dts nodes

 arch/arm64/boot/dts/rockchip/rk3576.dtsi |   26 +
 drivers/net/can/rockchip/Kconfig         |   10 +
 drivers/net/can/rockchip/Makefile        |    1 +
 drivers/net/can/rockchip/rk3576_canfd.c  | 1349 ++++++++++++++++++++++
 4 files changed, 1386 insertions(+)
 create mode 100644 drivers/net/can/rockchip/rk3576_canfd.c

-- 
2.34.1


