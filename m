Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEE6C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHmouoyIZkq8xO+cvrVpMSbHmcIS9SGIHL64C19km20=; b=CBIE7bioHWV3EMFo1eQTscXM+g
	0GR5XbDH7lfNZzoi1UPI6/uHnslVEEjNbzG5ewZIy7vI/q2moaI0lOc3uGYMAf7EybpVT1awC7fYi
	OfmDuaw+pRpKjYCAIqwnOoqqYWVUMjpxrpcddKfD2MpLgYvGSUj5hkqLQA3hqYjdf4oYys31dnf9M
	N+oWJkaUKj45Yy3gEPNTZymV0CscxBhsKBWwJ7AdL7NbATCV6mzdO/sRLbcOXT08+TSFXVvR03NgN
	//J1BHMfY3wmhk3em4pfDZ2jPmekF2hVIK2ypIyssyeOA9/UZgnter6JSpuQr6X3irBxsX21Eba17
	1dstuSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7tY6-0000000GDsh-1WGg;
	Sat, 19 Sep 2026 11:48:06 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7tXy-0000000GDpC-3ijU;
	Sat, 19 Sep 2026 11:48:00 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 94750100C49;
	Sat, 19 Sep 2026 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789818476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHmouoyIZkq8xO+cvrVpMSbHmcIS9SGIHL64C19km20=;
	b=nEfVRZBuUtFSO+b/bhxezBhBqCkkHanYU9s5wbvRgB23y78aiKNzatuW9pZ1bXS2eYOVra
	AneI4AKCJRItokI0pYxeGoUxo2v6bLtjK7EV9x1AczZxdJwmVqqAc+a1E8zDliwqYW0vOQ
	W4ldRpeV+kEE3F9WgjbGJB6Q4G7L6hc=
Received: from frank-G5-5590 (fttx-pool-194.15.85.231.bambit.de [194.15.85.231])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 542B81200CB;
	Sat, 19 Sep 2026 11:47:56 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Frank Wunderlich" <frank.wunderlich@linux.dev>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Mihai Ordean <research@mihaiordean.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] clk: mediatek: mt7988: keep combo-lane U3 PHY ref clock enabled
Date: Sat, 19 Sep 2026 13:47:40 +0200
Message-ID: <20260919114744.46777-2-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919114744.46777-1-linux@fw-web.de>
References: <20260919114744.46777-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_044759_067174_084010E0 
X-CRM114-Status: GOOD (  15.05  )
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

From: Mihai Ordean <research@mihaiordean.com>

CLK_INFRA_USB_PIPE is the reference clock of xphyu3port0, the U3/PCIe
combo serdes. On MT7988 that lane is shared between ssusb0's SuperSpeed
side and pcie2, but only the consumer that claims the PHY holds the gate.

On the BPI-R4 Pro, ssusb0 is configured USB2-only (u3p-dis-msk=1) and
pcie2 claims the lane for the CN13/CN15 M.2 slot, so pcie2 is the sole
holder. u3p-dis-msk does not remove ssusb0's SuperSpeed root hub: that is
decided by xhci_has_one_roothub(), which keys off usb3_rhub.num_ports
from the xHCI capability registers, so bus 2 is registered and live
regardless. When the M.2 slot is empty, pcie2 fails link training (-110)
and its error path calls phy_power_off()/phy_exit(), which gates this
clock - and sspxtp_sel with it, as nothing else consumes it. The still
registered SuperSpeed root hub is then left polling a serdes whose PHY
reference clock has just stopped, and asserts the shared SSUSB interrupt
outside the xHCI event ring; xhci_irq() reads USBSTS with EINT clear and
returns IRQ_NONE, so the core disables the line ("nobody cared") and the
next USB teardown blocks forever in xhci_disable_slot().

Boot logs show the storm threshold being crossed 86-107 ms after the
pcie2 probe failure, while the earlier combo-mux switch to PCIe mode
(~550 ms before) causes no trouble, pointing at the clock gating rather
than the mux as the trigger.

Mark the gate CLK_IS_CRITICAL so the combo lane keeps its reference clock.
Only port 0's gate is affected; ssusb1 uses CLK_INFRA_USB_PIPE_CK_P1.

Signed-off-by: Mihai Ordean <research@mihaiordean.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index 13ffa9d88e24..a8cbcb64d90f 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -225,7 +225,17 @@ static const struct mtk_gate infra_clks[] = {
 			  CLK_IS_CRITICAL),
 	GATE_INFRA3_FLAGS(CLK_INFRA_USB_FRMCNT_CK_P1, "infra_usb_frmcnt_ck_p1", "usb_frmcnt_p1_sel",
 			  9, CLK_IS_CRITICAL),
-	GATE_INFRA3(CLK_INFRA_USB_PIPE, "infra_usb_pipe", "sspxtp_sel", 10),
+	/*
+	 * Reference clock of the U3/PCIe combo serdes (xphyu3port0). The lane
+	 * is shared between ssusb0 and pcie2, but only the PHY consumer that
+	 * claims it holds this gate. On boards where pcie2 owns the lane, a
+	 * failed pcie2 probe (e.g. empty M.2 slot) calls phy_exit() and gates
+	 * this clock while ssusb0 still has a live SuperSpeed root hub on the
+	 * same PHY, which wedges the shared SSUSB interrupt. CCF cannot model
+	 * the cross-IP sharing, so keep the gate on.
+	 */
+	GATE_INFRA3_FLAGS(CLK_INFRA_USB_PIPE, "infra_usb_pipe", "sspxtp_sel", 10,
+			  CLK_IS_CRITICAL),
 	GATE_INFRA3(CLK_INFRA_USB_PIPE_CK_P1, "infra_usb_pipe_ck_p1", "usb_phy_sel", 11),
 	GATE_INFRA3(CLK_INFRA_USB_UTMI, "infra_usb_utmi", "top_xtal", 12),
 	GATE_INFRA3(CLK_INFRA_USB_UTMI_CK_P1, "infra_usb_utmi_ck_p1", "top_xtal", 13),
-- 
2.53.0


