Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526BDC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nwHfhAaVNdbWsSpgLPAqaXSfh9N5ThHSjgQ30wKWVPA=; b=2WPVYEFvRvq+fNmj1NJVfHWjgm
	sCd4Z9ON0GhZ4AyVi7QJYExtmCHaGmr1MgI1C2yY4o2Vt393hPE0i/NY6ZgCQ5bC64lAVnykcSdb7
	SEPq+wqYZGVGEPUBV+uYktHroBVf1v0DiXjGc9zwM7+nWduVRDWJ6mTJTdLMSTUsOcKZuT1AQGM6G
	Rx+miTV2KXpZCHT7zC37e6xbDz2gM3lRak+DPZkAdMqtrlHrJRBD1dIn2n+Ltzt8tLCbX6oYBiRhc
	0/FC21hxK+0kbOQRKkV9SddzLs2HVJ0psCWoHLDl8+P68iUQQ8oW+2hFkez0IxNz+3P2dIhUHIjHL
	tCQo0OdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbop-000000077Sb-2L0R;
	Thu, 27 Feb 2025 11:12:43 +0000
Received: from mail-m1973187.qiye.163.com ([220.197.31.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbcy-000000074hR-3Fvt;
	Thu, 27 Feb 2025 11:00:30 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c6596ab8;
	Thu, 27 Feb 2025 19:00:23 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 0/2] rockchip: Add rk3562 power domain support
Date: Thu, 27 Feb 2025 18:59:55 +0800
Message-Id: <20250227105957.2341107-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09OGFZPSUIfShhKQkNKGhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a954710934803afkunmc6596ab8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MzI6Sxw*PTINIw08AhkKOTgw
	Mz5PC0hVSlVKTE9LTU5PS0lPQ0xPVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDTE83Bg++
DKIM-Signature: a=rsa-sha256;
	b=bodHX+nX26+wDPL0L7R3+BcC9KfsRht18KaUDideUQmHXDFksKtU3M938qsfRLiKOsPKUrER+huHfpcwSyKKAXN0MYlhCUnHEyXIZFx/hywG7F/FYP1g0MO5py7ER51yMZCqQUd4uzHarOQf+T/F2IZQr9XydbwBpUY3NzFW2MM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nwHfhAaVNdbWsSpgLPAqaXSfh9N5ThHSjgQ30wKWVPA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_030028_988832_42BBBCBC 
X-CRM114-Status: UNSURE (   9.68  )
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


This patch set add power domain driver for a new SoC rk3562, the SoC DT will
be sent as a separate patch set and the new compatible will be used in the DT.

Changes in v3:
- squash the header file and the binding document
- Update license

Changes in v2:
- rename to rockchip,rk3562-power.h
- update the subject
- use dual license
- update the header name

Finley Xiao (1):
  dt-bindings: power: rockchip: Add support for RK3562 SoC

Kever Yang (1):
  soc: rockchip: power-domain: add power domain support for rk3562

 .../power/rockchip,power-controller.yaml      |  1 +
 drivers/pmdomain/rockchip/pm-domains.c        | 48 ++++++++++++++++++-
 .../dt-bindings/power/rockchip,rk3562-power.h | 35 ++++++++++++++
 3 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/power/rockchip,rk3562-power.h

-- 
2.25.1


