Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701C8C44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQBy/o37l9sudMeWSCTCpjVQ/V1ougLIUohroSPHPK0=; b=XXZYpl02cX4qqkrSHfjCuqxryo
	KV0fFpctz17jqkckhJOoTR32IUfKa15x4LONWVfnlDjczFOJD40KhR1Rf09ojPTLwVtLycD4XMEEn
	J+6ojsN9vyPqG+HncxB2l0PzdE9EdeUGwUi5DNMJaFV0/Q00w46BKAaNfdbpjd4AFHOtys39Rf/2v
	NzUe+ajVheqeBtl8zUDkne3ssu7RIYHnVugRWyWyBvgBSHKWj+zMZriO1+l8pnZt6CUaHJyWGhf3U
	ZOrZJzoryWp/3Ob8ChceHtXFVes07Db7WvpPlo8sIm+Asdemmq29TJl9NewDd34fvG7OhvOL6r23z
	d2cGbFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webZ8-0000000HVRa-0JA9;
	Tue, 30 Jun 2026 16:44:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webYx-0000000HVKs-3CKq;
	Tue, 30 Jun 2026 16:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=iQBy/o37l9sudMeWSCTCpjVQ/V1ougLIUohroSPHPK0=; b=ra4IZzycLMlAALjhjKyzC+Wy0q
	41zyiJleGla0koqeyiUVgLfeYR86pfv5TZyE/8orGe3kdgLl1NiYkWj2KAMUvHstoBhcA7mquLB33
	D/x935HbO+vobPy6KV4bNyNokvmpSWgiErM78FO2IwPrYRTucLaZxD+8NhAqPjyKI8QWdF33h73eL
	PwD0PEwVCFxVoTu2IfvZgeiTEPz51mynoc4frt8rNET0MOlWkqD2ZA4O9KgokITRk37MBqp48ASJ3
	Co7Fk23AyHDtntqMsy4M0aon264qT8X+1U6KXJIRFwSGaEtjEp83G6NhtSCTQEYEh61swonUVC6/e
	+4z5AsbQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: mkl@pengutronix.de,
	mailhol@kernel.org
Cc: kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	shawn.lin@rock-chips.com,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	zhangqing@rock-chips.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 3/6] can: rockchip-canfd: enable erratum 6 on RK3588
Date: Tue, 30 Jun 2026 18:43:33 +0200
Message-ID: <20260630164336.3444550-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630164336.3444550-1-heiko@sntech.de>
References: <20260630164336.3444550-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_094355_803307_E799105D 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Sending extended CAN frames from the RK3588's CAN controller, sometimes
sends standard frames, as explained in the erratum's description:

  can0  00001234   [4]  DE AD BE EF
  can0  00000001   [4]  DE AD BE EF
  can0  000007FF   [4]  DE AD BE EF
  can0  00000800   [4]  DE AD BE EF
  can0  1FFFFFFF   [4]  DE AD BE EF
  can0  12345678   [4]  DE AD BE EF
  can0       234   [4]  DE AD BE EF
  can0  00000001   [4]  DE AD BE EF

Enabling the erratum, introduces the correct behaviour in re-sending the
frame:

  can0  1FFFFFFF   [4]  DE AD BE EF
  can0  12345678   [4]  DE AD BE EF
  can0       234   [4]  DE AD BE EF
  can0  00001234   [4]  DE AD BE EF
  can0  00000001   [4]  DE AD BE EF

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/net/can/rockchip/rockchip_canfd-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index 707f387e7cf4..105ca4d5cbef 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -53,6 +53,7 @@ static const struct rkcanfd_devtype_data rkcanfd_devtype_data_rk3568v3 = {
 static const struct rkcanfd_devtype_data rkcanfd_devtype_data_rk3588 = {
 	.model = RKCANFD_MODEL_RK3588,
 	.quirks =  /* Possible more Errata */
+		RKCANFD_QUIRK_RK3568_ERRATUM_6,
 		RKCANFD_QUIRK_CANFD_BROKEN,
 };
 
-- 
2.47.3


