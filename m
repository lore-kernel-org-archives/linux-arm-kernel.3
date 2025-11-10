Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C86CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 18:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oE07s5Jtn2UeEofjiRSlaHf6KegVvYG+EYq7/0rGikA=; b=sjN4+lAe5a0ijGKAxtg25p7PbW
	AWxKtKcLa6nxuYKv2d1YYrLg0xdI2eWZ6BHb4X/EndueSWerR6XqihNNW8tFR/FxqIlLIXRzTpXkH
	KzW/BZumIOKP++92Fewryr1+S/sYfbSEYXtyZ0WBsnOTtAQhNhPfMn2IC5q7W+V5F0vTX7O2w2vMn
	uyuQXRAZldJQTlo8UfLIerna6+TN0pbiVNWskQ9NNmeTEgJYBfry+wp8v3ph1cf/2VxtWQQJU6jac
	HO80Qc0sQreMQluLURTc70Nsiy5BrSJRUZcN/kWHFHCWKlK8EGklJCWBSLLJSgc0Xf+FKGh4ik9WS
	tzkeQDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIWN3-00000005xlU-1LQC;
	Mon, 10 Nov 2025 18:12:05 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIWN0-00000005xkq-2zNY;
	Mon, 10 Nov 2025 18:12:04 +0000
Received: by verein.lst.de (Postfix, from userid 2005)
	id CC62B6732A; Mon, 10 Nov 2025 19:11:53 +0100 (CET)
From: Torsten Duwe <duwe@lst.de>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
    Rob Herring <robh@kernel.org>, Jianfeng Liu <liujianfeng1994@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
    linux-kernel@vger.kernel.org
Subject: [PATCH] devicetree rk3588: enable HDMI audio on Rock 5 ITX
Message-Id: <20251110181153.CC62B6732A@verein.lst.de>
Date: Mon, 10 Nov 2025 19:11:53 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_101202_893477_1CC1A861 
X-CRM114-Status: UNSURE (   9.32  )
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

The Rock 5 ITX only needs enablement for 2 nodes in order to send audio
on HDMI1, the connector closer to the 12V barrel jack and farther from
S/PDIF.  It is sufficient to declare the audio injection as okay, and
to activate I2S6.

Note that for the other HDMI output it is not that trivial, as the video
data there originates from the SoC's DisplayPort output DP1 and is only
converted to HDMI in U7 (an RA620).

Signed-off-by: Torsten Duwe <duwe@lst.de>

---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/src/arm64/rockchip/rk3588-rock-5-itx.dts b/src/arm64/rockchip/rk3588-rock-5-itx.dts
index bc8140883d..c824727cf4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -345,6 +345,10 @@
 	};
 };
 
+&hdmi1_sound {
+	status = "okay";
+};
+
 &hdptxphy1 {
 	status = "okay";
 };
@@ -546,6 +550,11 @@
 	};
 };
 
+/* HDMI1 ("HDMI TX1 8K") audio */
+&i2s6_8ch {
+	status = "okay";
+};
+
 &package_thermal {
 	polling-delay = <1000>;
 

