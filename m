Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8456CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 23:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ii4Wm1oN+7ZBem4KBM1X5oSCmQ/08wTBQQRe6TYQrgE=; b=oa3NnI9sYyRCRcqVRc5YrEDC73
	UWj88ioC/y31SXk8e8F2166/er/avBORnzfgOCwBrIGWHGCfo0FeOWVdmdOY28GM63/7XWwTGOvuJ
	u88Gc0G0uzPVf0D9DS54gyH5tHqRIltGsSWFv1ZbGCv7dnsRvToYf54P+NlzQkMxKWZWUaC4U1FK1
	wDfy/2MfAfhNgF5e+xn8PR5FOLCQE32RK+8nxx6L3rhy/CiO00xryYz3Z6t/0EaMbZ2QJ+rbOHr+U
	Mn3KfK1KIih/FDxa032hhep5LNXWRlsU3bjQDgGngVw9AV0vpPq/bVSaBdtu0xyoqbFgwKUBFIbQP
	5VxMUPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4Ip-0000000Anvg-0Wvw;
	Mon, 03 Nov 2025 23:49:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4Im-0000000Anu6-1K4T;
	Mon, 03 Nov 2025 23:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=ii4Wm1oN+7ZBem4KBM1X5oSCmQ/08wTBQQRe6TYQrgE=; b=o+f45nRf49jrGiIn8a+5gArCjm
	y4UywFYHlXbd6Dtu+UBCWdvTnIvZpHwX1zKfJy8gQgkdLMkkVWNpD7wP6aRF0RHP7cdiQ77B+3Lu9
	IJ20YhE/0v1l6O0zqfhRaQ6ZX78DGIZOu+ngY3wwgmuczEm2BsMTnQeJ+RB6vnAHguCxJkZhCN9Go
	9SPcsTnxFB1cnumKEuwJxLkX3gTbUpeq7Wu5zOWHOnVkOo8RkcQn/7Y38zdnRfyTLS6SkbnZDChld
	ns8Z4iz0Z6Ys+sfMwObGRvU++VOIwwkJI5ln+GWefexE7lbULs+hYeas7LgR4CuAS735aBaFB4s5m
	E+B357+g==;
Received: from i53875a3a.versanet.de ([83.135.90.58] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vG4Ij-0007vT-G9; Tue, 04 Nov 2025 00:49:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	michael.riesch@collabora.com
Subject: [PATCH 0/3] SCMI clocks on RK356x
Date: Tue,  4 Nov 2025 00:49:23 +0100
Message-ID: <20251103234926.416137-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_154932_355291_D0596B2D 
X-CRM114-Status: UNSURE (   9.13  )
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

This cleans up the existing use of SCMI clocks on the RK356x SoCs.


Heiko Stuebner (3):
  dt-bindings: clock: rk3568: Add SCMI clock ids
  arm64: dts: rockchip: use SCMI clock id for cpu clock on rk356x
  arm64: dts: rockchip: add missing clocks for cpu cores on rk356

 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 5 ++++-
 include/dt-bindings/clock/rk3568-cru.h        | 6 ++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.47.2


