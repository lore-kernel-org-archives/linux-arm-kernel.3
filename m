Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8A3C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 01:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dn9pDYsyJbkr20no7u/zLYqyL2QO1cYzwcIcxkc3Gn4=; b=wwt3caw00ncniS7ZNYsvYCDE7q
	FCSlrXHXhN/At00kgBHM/v8ah4viZU0Wl8LJfox7wsUWmq4qDPXWIdzNd5RtTm/dfQ8bgx1jWvxXs
	M+byKMeZ7CZA9c5qYh+5gneGn9lrXrFMvc3gZYwDPMd5CCsoprnaLqN9TszdvxwgZe9cRUzY51t6N
	tlECr7wlpcQzhiUjfqKjH87W9CKFRfRx0Qdt24rAdFA+Ll1PRH96Wa/FI6iNIv1D68HuqvceNTGU7
	oKxhvIroKrqaALsh7dIaiVT6XOek7EfSY+r4UijvgZkWbqzrR2GG7FDG2D1mWPwSRJ242C+LczAaI
	drn+wMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tga89-0000000Br6v-3xVW;
	Sat, 08 Feb 2025 01:59:37 +0000
Received: from mail-m19731102.qiye.163.com ([220.197.31.102])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tga6k-0000000BqvV-3Zyd;
	Sat, 08 Feb 2025 01:58:12 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a75a6bca;
	Sat, 8 Feb 2025 09:58:02 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: jonas@kwiboo.se,
	kever.yang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] clk: rockchip: Fixed some incorrect commits
Date: Sat,  8 Feb 2025 09:57:55 +0800
Message-Id: <20250208015757.27594-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5MSVZKQ0hNS0wZQkIYGE5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94e347355903a3kunma75a6bca
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mwg6EAw6GjIRHgNKLRAeGT9K
	KEoaCTFVSlVKTEhDQkxCQ0NITktKVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU5CSTcG
DKIM-Signature: a=rsa-sha256;
	b=g+H12rE3+HQu9boZikHJ4Z8fdR6vk/HoP1NJAscUPEdzCCMjnwvg6+k4EXCuUWlnC04YjkOnt0LMIP0mnXIVqr4UTteTBUEQ6ms985XwfmS9NVtFMpXp6DXbXb3L5c5hfhRXmOeOSxUijlkadfRJlOrWZ1f+wEEBjcDX7gZYxbw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=dn9pDYsyJbkr20no7u/zLYqyL2QO1cYzwcIcxkc3Gn4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_175811_373692_8387AA32 
X-CRM114-Status: UNSURE (   5.41  )
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

Change in V3:
[PATCH v3 0/2]: As discussed in the email, assigned-clock-parents in DT.
[PATCH v3 1/2]: Merge patches into one. 

Change in V2:
[PATCH v2 0/3]: NO change
[PATCH v2 1/3]: Update commit message
[PATCH v2 2/3]: Update commit message

Elaine Zhang (2):
  ARM: dts: rockchip: assigned-clock-parents to SCLK_HDMI_PHY for
    DCLK_VOP
  arm64: dts: rockchip: Increase VOP clk rate on RK3328

 arch/arm/boot/dts/rockchip/rk322x.dtsi   |  2 ++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.17.1


