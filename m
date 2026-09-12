Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0C2C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 06:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0k2WO5fN2pPgdnD7jJ6cdxK1ff8uhQPVB9+e5XeZDfk=; b=kn2WLsRDoiD7OzAcJmH8JV4XUJ
	zqTs3eLcPhD9XG815I7MrOBixJcDZW+lqgp3i38j/dxnMlaxPk5O+zp+DgDcXWwqY789UMKp7SHYd
	LRJEp/ZhlRWCQKJVobpOv7RwvUPOvKzJltKj+o/1PcxmtjCQDh6WWdaJrAd/Q8k6Fmn9sWVaVBtTG
	XQGvXL6Pb4VQQ3TXVJZgZJZhCC0sF8aLjbZfR2/lMX/UegN/2kBLxDmjYa4RYKEAYicfRg4YqYESr
	BHI24FipORMxsn/agMtnhl3hVKY4aQHUJD2MXl8xDzN/MNsymt6wefEgu0/MTgfshsZ75Pa7WKCCZ
	rjhyZ5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HcY-00000000ccY-2dkx;
	Sat, 12 Sep 2026 06:53:54 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HcV-00000000cZu-2T7s;
	Sat, 12 Sep 2026 06:53:54 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4A2957A00B7;
	Sat, 12 Sep 2026 02:53:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sat, 12 Sep 2026 02:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789196030; x=
	1789282430; bh=0k2WO5fN2pPgdnD7jJ6cdxK1ff8uhQPVB9+e5XeZDfk=; b=f
	K+XymrkLWoxteljZXabGSBIqL61Zu2BTTuOAD0N4cV/lHW1NuVtqIkkwM5wmOe0w
	yrYGCB00b9Klz07FvhcQbJ6qO159bHcM5gTdJzrhU+cq8DxN5iO/nQQqjJbwosBR
	7yAQix4XY01Af/R8rDzTf8ozcGNm5E80MbrX6WXURmSArQOjfc1Yuqzv3FvgiQQt
	Myyb2JBKxnDV5xWJwbtkPFpU9gkhR6KTWPHTxBDUUQ+4VDpa3gld2ZQEJBjZnHR3
	RmW0BXHSk09CU/a3SCz/rWCtK2zLu6CQE4nog9+GWXXW4ytaTPIwnZ0IeO75khKw
	KAue8PSE7kasYymJHGHRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789196030; x=1789282430; bh=0
	k2WO5fN2pPgdnD7jJ6cdxK1ff8uhQPVB9+e5XeZDfk=; b=FAE1otxThQyCWh8dk
	07JN03sDnUdnKEVkkICGsvWDiv5vupR7ANEcL/hyeOdB+o7+q+O7cgIrdEAOH0d6
	WNjNV3pi6tOnwtEpHjhbJh3wOenUIo4J7laC2ewfz93rtL1yRYE11yg36XGoBhDM
	SlJMnfX1iNnTRKaiGsYHNoGuVvAJhMkbhmJEan8zQo/Y3w835uNU2R/kAtQ42qD0
	fetiImiRIRbfaKe8mDrKX/qMHv8/7GMMWJELsoq4guaTTt45Z6+uoeGhZ9DQUGfk
	bFoVQAMV85EuzM7GDEhFTC69OaIQ04EfDjIbMsLV9avM8u2JZIncSO4FnDK9q158
	ohDAw==
X-ME-Sender: <xms:_fakaqKcHO50-8I8JLCi2qpeRRYI-Z1xxh-7rVGvBAiEf8F8qnOm5g>
    <xme:_fakaiQdSGYHwElwR_rcBwzW82d4XOoraASiLFncr3hHHzyd8Ek_BE_WhZRMKoYEL
    UBC9bB5R0Xh9YsdcZj3ly30-v8F3HhFl8S2KO8I2ZigTNk9YiOBhe-->
X-ME-Received: <xmr:_fakaoge6WYHbOo7GRu8ZZ7XQKGX9HaZkiT1v03mcEWdW3MGkF1Fz0WBLFKKCktTWvj-TKnykg>
X-ME-Proxy-Cause: dmFkZTEPb8qUI/Bch63DUv9Os4CRaZnJidcR38w4lyHY6iaGmzqubjANrD0SeN/gjpgWtD
    9JpSgLNav7upxo5UY8BD+gTgneuYvtjdT7xUeoI37l3u3ANYgfWTUMIQPTBe+0FGjKZ893
    EmiED4E9ABLDGP636x+3BNPL+06gHQG63VHM2tKDilhH/OyX7+TagruxeFKd93pQCYj32B
    BeiQF2P6k05N47Few9BlXMbV3J128+kb4hnRL4hf+Yoc0wDQXXqOQeonbIg1B1tOCqO85x
    XB7Y9LiCcE2oZkETEXdiacCDRMuKmK7OMtWiJEvsJa8P7QUcJM2B6xHrJPAU/2XBsLk7bM
    m27vY8ozK/KlfZmGBKAPbjJMlPQrud7ajj9pjQQJECGhLRlUzuPDe6o2kZ6X6599jvqvPZ
    h8Dgp8Q3N9bMaltRzFbHYkAFHOlbVPdKse6mY6gfIt5wKu0FwlkdB6qrQTd2hhd+QygHni
    2aHzPO2jen3yb8J1HhHjm3Qmvb4Id63GebKaIrE7dXgM+wb+lHhDez1B36yFGuYawoitaf
    nGSQqYygetd4z+PfVwECu409nXImY6ttuPzKi3bkOT2x8xns50PPLgZbW5sXvPyDVyh5Ik
    OkKCCAY+DN6nMTbaDemvNIiavZruGa2BnQ/oWyh8EoKS1WqDEKuUIJoesOYg
X-ME-Proxy: <xmx:_fakajpvBezrh12bNjs4vMdluSuFVXB7jCFBfvK0ikH6rzuUFoGqDw>
    <xmx:_fakavkl0I8Y-aFDinsHyiLG3gJbTmbM5EpIE8JPH8s1fmBwaY0ivQ>
    <xmx:_fakaqnUz9y7XdRNVLSsjOTFMJFOe8Gz3EsaYvcdhBVQbUAmNpRzyA>
    <xmx:_fakakOIyzo4kv3Ot5_Ggu8TlY6GloNyQNqTBn3jrVIIv9HkUKP5LA>
    <xmx:_vakajQS3OoyP_nIS1A_SzxENz23lBw9_JaJEbosoBYTs1EMTup8mssW>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 12 Sep 2026 02:53:40 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v12 14/14] arm64: dts: rockchip: enable the NPU on rk3576-rock-4d
Date: Sat, 12 Sep 2026 18:50:53 +1200
Message-ID: <20260912065053.1519165-15-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912065053.1519165-1-gahing@gahingwoo.com>
References: <20260912065053.1519165-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_235351_675817_2AF81AB3 
X-CRM114-Status: UNSURE (   9.36  )
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

Enable both RKNN cores and their IOMMUs on the Radxa ROCK 4D, and hand
vdd_npu_s0 to the NPU power domain as its domain-supply, so the rail is
switched by the domain that gates the block.

Measured on a ROCK 4D with this in place. The rail's regulator debugfs
reports open_count 1, so the domain is the consumer that took it. A sampler
running beside an inference caught use_count at 1, and three reads at rest
report use_count 0 with the rail disabled, so it follows the domain rather
than staying on. Over the same run the genpd active_time of all four NPU
domains rises by roughly 60ms per inference, and the inferences either side
of that are 128 of 128 channels against the CPU reference.

Both cores keep npu-supply on the same rail, which the binding requires.
v11 enabled rknn_core_0 alone and left the second to whoever could test it;
it has been tested since. Both cores probe, each with its IOMMU, and a
runtime that deals its submits across the two returns text identical to the
one-core run over nine language models.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 .../boot/dts/rockchip/rk3576-rock-4d.dts      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 272af1012..93d59c0a9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -722,6 +722,10 @@ &pcie0 {
 	status = "okay";
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmi {
 		hdmi_tx_on_h: hdmi-tx-on-h {
@@ -779,6 +783,24 @@ wifi_en_h: wifi-en-h {
 	};
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
 &sai6 {
 	status = "okay";
 };
-- 
2.43.0


