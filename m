Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507F5EC1E94
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wvN/Ymyn+5bgH7YPDOrvfIdUupQo6Lh6uMPPgNRqGJY=; b=I3XtehxH92WYYlrw3CgQlxFr3+
	DoJLyDgQ5sUGkT+Hz24XSYUg0+cmeHHVMIaalWyW0zXlqJ+jVLVXkNMPtz7ocM5RJcH4z1i9ncSz6
	+CPYaM6F6aZ3U7DDKpD5kaDaW9lZA5DPrmlKGo5Nk/kHLLVLiT1MiKlOC7Dp1+kK0oFcXO/dSVpUP
	5/fkxm+Bv3UagpOHs/mNwX4BufL9Hcn8RNb2ikMgdUDpV0coI9fhD8Fzdl6CP1+rRmh0/QLiiYYvI
	1jKLorKok1POP4ANFCSlPwD1sS/wmdFU+uBEVAns2L6zJ6BwXTyFgucKKBKLzXZZYQAlN79WqTmWU
	3MIC/nTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwUA-00000009li2-0qpU;
	Thu, 05 Feb 2026 10:21:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwU8-00000009lgf-1eDX;
	Thu, 05 Feb 2026 10:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=wvN/Ymyn+5bgH7YPDOrvfIdUupQo6Lh6uMPPgNRqGJY=; b=mMONTHBLR9DN2yXaMm9lrTXhZY
	tIo1ISzR9MzpxhGs3KNPPUyZhk9MqTjHGAemrHe05WguH3RZgmV14sQLtRVpu/8pEJ4baFgQ12/SP
	gW4Hgkqe+RYJ8vqZI2xITaZRcPCGfTsOsGGjGOZG6YXsUwDgOWaJrGYAPXDTonfFwrg3enGKmsfcw
	Z+YV4Nw6UCzVhpEBpPomdiKPGqz7Yo3zP8Yl52qxdlaA4wG75fNnn5kQehvU91uU0kBw7TSkTmBrY
	ZGlv0x7mjamQS1SfFvHkP4pieJW50Ae0SbX1Ul7uCiNNCTiflg0XMr7ftqVyow1vVTtQxO2NfNUmJ
	V11TUCcw==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vnwU5-0075El-6z; Thu, 05 Feb 2026 11:21:13 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Move to gated-fixed-clock for Theobroma/Cherry boards
Date: Thu,  5 Feb 2026 11:21:01 +0100
Message-ID: <20260205102104.394991-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_022116_735079_0AB5CE19 
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

Both Tiger and Jaguar currently use a fixed-clock and gpio-gate-clock
to model the PCIe clock generator they have.

Ever since I wrote the gated-fixed-clock binding + driver, I carry
around conversion patches for those boards to use the new binding
and describe actual hardware.

I submitted different versions in the initial submission of the
then still named "clock-generator" binding, but have reworked
them now to use the gated-fixed-clock binding that actually landed.

Heiko Stuebner (3):
  arm64: dts: rockchip: use gated-fixed-clock for pcie-refclk on
    rk3588-jaguar
  arm64: dts: rockchip: use gated-fixed-clock for pcie-refclk on
    rk3588-tiger
  arm64: dts: rockchip: add pinctrl for clk-generator GPIO on
    rk3588-tiger

 .../arm64/boot/dts/rockchip/rk3588-jaguar.dts | 13 ++++--------
 .../arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 21 +++++++++++--------
 2 files changed, 16 insertions(+), 18 deletions(-)

-- 
2.47.2


