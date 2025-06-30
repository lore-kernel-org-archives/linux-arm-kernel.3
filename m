Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6855C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVGNQK3ovA1eStReJPPWHDBj+E6PFN3lZlWCymwT7kA=; b=1Dvy2YE/9CeGJkj9tn5FFh3JE/
	nMtDgd61kLhowLpwboUoQApTd1HNxGFpCOkV0wjQ4lzo1xn2soxEx78Em4O59I5GYiQIwj5YPSu2n
	dY3fBnkYzyCjPe09ZZcG+2+P9W6K2ool5cGPNBQbgv1Ce4gi0a57NDQ/TvDHGWql/MEPOehP+igA/
	j5UbVpKW+FeBJpa8UgQOLIETuNB01jsrdFHOHfeLWCzPiEcHmraD4qA1v036LUbB7FrmfmnfXzxM/
	atp3zkdleKivB38El2+B3RBXAtjRUwnJ/45ouZyP48yxa+Fyaxybhzej31Yq+wJ2UVdfjN4V5+TaY
	oqotXJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWC0y-00000001vvs-0uXo;
	Mon, 30 Jun 2025 10:45:32 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBcF-00000001rto-2cuP;
	Mon, 30 Jun 2025 10:20:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751278786; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R+XsFmJlOH88IPsfmTD8tDk8RlbfWYQS8CSLDpRd2LvIOpVOD7Dm3hDLgBinQLA4CNNc/G14bapI+9XdK1FGzEVMudSq9Ca0i6dOp2TyhoFyvLOx1cvb35uuuDX9r/zqyCaD5qe2oXal61UvDlH431rTVsDiA5wnv3udMAY0u3g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751278786; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DVGNQK3ovA1eStReJPPWHDBj+E6PFN3lZlWCymwT7kA=; 
	b=gg4y2DBoW9TKvUNNXly/AJWjkkICsOzIuY2Evbzn6psahfRaXgkvcS6L+f+55zBA3YCwKzLXmM8DmMKZ2R5digvIejp3mGJQWGLaKyaa/MZx+lyQ/Ulh3zerGqe2wBa9jzvTMy+yc0l5SW3fIXcbsHVKHdZ89Cb+FsAbyjvKnSo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751278786;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DVGNQK3ovA1eStReJPPWHDBj+E6PFN3lZlWCymwT7kA=;
	b=V646PLmcVVU+4vqXaywt467wXSxznevX+2nnj9Y+ClnwXT/t3J07FZRwilpzrx9s
	l9KyRR4S+bKU1DIPh6e7jWhiiz4S6cQ1CLvrk8XsHXS6n5bRJdT1sSo6cTeC+AnkHsk
	3rI/iK9O30eumSFoaJiaZjZyPIZx4LExc/BzICyw=
Received: by mx.zohomail.com with SMTPS id 1751278785189692.9528694352027;
	Mon, 30 Jun 2025 03:19:45 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 30 Jun 2025 12:19:27 +0200
Subject: [PATCH 4/4] arm64: dts: rockchip: add HDMI audio on ROCK 4D
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-rock4d-audio-v1-4-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
In-Reply-To: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_031959_726357_943C5F27 
X-CRM114-Status: GOOD (  10.19  )
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

Much like the Sige5, the ROCK 4D also has an HDMI port, so is capable of
providing HDMI audio output as well.

Enable the SoC's hdmi_sound card, and also enable the SoC audio
controller (sai6) that feeds into it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 4d4b8ababd2436b82515443b029916b3c786dba1..70bc6f909ec0843607c2705ee9f73b0ba521a977 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -322,6 +322,10 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &hdptxphy {
 	status = "okay";
 };
@@ -772,6 +776,10 @@ &sai1m0_sdi0
 	status = "okay";
 };
 
+&sai6 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca1v8_pldo2_s0>;
 	status = "okay";

-- 
2.50.0


