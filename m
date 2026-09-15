Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0FAC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0k2WO5fN2pPgdnD7jJ6cdxK1ff8uhQPVB9+e5XeZDfk=; b=nP1zaQsXExElcpCMeZLTVKwS1g
	3G+dhkItH3S6qKrMQD4cgYp4G3SlGz/E1BRENGiUnM3k0wdLF8eLBKuqUyj+DNHwt8w58xPxB6uPm
	jEif3qAJoULG9zKsqkEMZc1LoXU1GFbM9zkRVlwjz4ZbQOI7dU/c+xYLnPQe8ugneReWusKXyZzhJ
	AP1qh11lkQ1HI2Aqk3JSoyEyTRioS042/x+l20dHOUCSXpL24KGVbSfcYst95jDZBsy/ZjXJd7SOl
	u/HyJgGJ5paxywXRME6GuVY3dm4YDD4oJd7QyS2mSxzVlG+JFA9GO08nklWhDjGEBNo0+jTkUwePw
	WMlit+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QgV-00000005zmB-3t8h;
	Tue, 15 Sep 2026 10:46:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QgI-00000005zgA-305b;
	Tue, 15 Sep 2026 10:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0k2WO5fN2pPgdnD7jJ6cdxK1ff8uhQPVB9+e5XeZDfk=; b=KvAFrAMhC8pUPWIiWBjFD+oLh1
	D9aV3ZRhcpjz9W1J910gGPboJWHvulZ1ZmBDTXJPOL4VD8sR3B7hIrfrIjycCpNMay+unjRsmzk2o
	o7ZYLDd1cGj5Ncry69tvCh2ljaK69SuCRK2DktIpS7kHgMu3mM29Mb0fElNB2ExHbdHw3au1rZBH8
	2+xcrNltI2O3zdhDHIjxHEUbYFdUmt8+QW+NJsk3K3Xl6xC5RLUVsc9JwoH91ztfJx517oP+vxaP7
	al3txaxhijc7jpqw6BnjA+bGTOBT3cGiHA4ViMKL8f9Sgr7kQfFsF9J1a7RxlbS2Kux+rEPnU+fI7
	9lS43VQA==;
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6QgF-00000006a8J-3mgh;
	Tue, 15 Sep 2026 10:46:29 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id E4CEA130050E;
	Tue, 15 Sep 2026 06:46:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 15 Sep 2026 06:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789469185; x=
	1789476385; bh=0k2WO5fN2pPgdnD7jJ6cdxK1ff8uhQPVB9+e5XeZDfk=; b=o
	5KcKxv/SlV2aYjj0KfjiwqAjYLU/J+yZ4Wg+42qPde9qFeZvxLQ2rwR3iKzjj4bc
	W4Z9gQ02OpW9Ea6eEGxBrBB1lP8Q2/HoBxkn7NYRajwK0KjZC911AfQv8TJsa0zL
	3htZhYruMmYsYuQjHFV9chxWRcRR1A58CTs+blKNLNjCIUndc68BWHDqTcdltfOw
	0p0rme9iLcfYJsSCpYJ1cwyOcAoAJh2Ti4EWHQ4cvUKYYwvLPNOu/dkbPbWFPQN3
	6L2uFEay0F8S2qk3pTBCPJxpztTMUF04R3GUZay6TjndIYeWw5JqkvLdIfcVCaKI
	8CzVuB9D9RzMoy6B6hpvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789469185; x=1789476385; bh=0
	k2WO5fN2pPgdnD7jJ6cdxK1ff8uhQPVB9+e5XeZDfk=; b=a+jRTOGW2gW9D9uRd
	58qAB2jFVMu687OEygroRLYvOHTqlqcoevsa09QZw19JfgWWwRSMJOeOIJ1oRN9B
	s/KCkeXvl1D6vTx+U0yKCdxa34GkeheHmC7XrVlVZfDQANh9Y1pSwuemxg50SEFW
	9/K1rczH8Qorot9wneCm501+E3iktZ54ecMmMmHC1afyjOEIR6RYGuHr95vZKbJy
	BIVmDvj/bLjWG3CMV+tz3LiBXdH096RUoo3q9vM5+2YJgutpMvshrp5qhL+SDb4l
	iOx7SgPQxzvMI6HwVnl7YG5fL5fyW3qew0qUM9FsFozDe1lZuY/3oO674iVk4deu
	gFGhg==
X-ME-Sender: <xms:ASKpaizMRspP3fbEvI2dGg0t-RTXliI_XiiADwnKD57TFz0NihB0pg>
    <xme:ASKpauZWLIo-vyYCI-R7ULaRwWjZpCYqsmSl_VJx__fzoDyOkrI2YxS4a2cYN9_mt
    SXWWq6yGToGb5o4NhW2Saw1NsKvDAWlr1q8KYqXvrIMdQhmPgvYzsE>
X-ME-Received: <xmr:ASKpaiIC0jXkdKuoIMc0YMCl3QzKJ1CUQPl3wcDwgbNzSK3JfJtdO7NpWKtCfxONG8RtIebaow>
X-ME-Proxy-Cause: dmFkZTERaSqH5KPECAN19InuPeLsiKMx6D5y15UiNi79LQSE+6PwQZueGcEC5S1rOFrK3s
    AYJQ5gLhphYiIeKw6agxUW6Fop3EpWpekZBzn5CD9c5ViahuaZguxQ6ney6sO43OfzeyFX
    kYhoR9UDnAzR8pnmcjQlc+x5gLPOpxNVIBYuMwia89SdQ/qFDD3jNxIWu4HvJyRrQkT5fi
    Bc2tWX66wGyq3ia2uvvLsx+3+MQXh8ILcdhexnLin+iBHzzQwqqqN6rvF+dRwz/tz6mc79
    V2Z2N8t1wVU0baTbSz4IGhSDBvU+gOblwoPbiM80kR6dUxb7moWmec21zQauVhFlqpiZq+
    vpW0GhBX31bWwlGN0QFZ/wI39d6+Fet+dUwUDz5xKxisTx6SB3mk5UuglUIe5BsqJZck8R
    TZ5r3ICH6hOBlPs29Do869msBDk3MBAG12RC0wVjVCLn5K+URgWZ8eGYfaxral+2o4ELka
    S4o2LahSPRTF8U6V+UNvoq5fHZQ21M73f6wKlYeBfP4nd7vfxuuIIjSbTzHtbyUh2Ps5D/
    NooK3dyiiu2xLcMiqWy6Sx9UoOaN3HueZgsJbt/7aynudz+zMJYu+7/oTzABlpdKLo2m01
    WWr7b0rPSU+KYpcPkJ05VaRdzLeSUFMrH2a1A2a1jzwlUIM1QTcdgtVs1PtQ
X-ME-Proxy: <xmx:ASKpasyzop8wr_1qQHyjE6ogIMVjYNLJx7VmPdpEFT1d6_IPmPZAug>
    <xmx:ASKpaiOE-SerW_LfM8vlP-XAzDNYULceF2hJX1eCLBsCIJIXRbXjJA>
    <xmx:ASKpaouovgujGa6FmJeZf_TURPb3_Y1G239Aivjj0M-R6SLrgXhe2A>
    <xmx:ASKpan3LMBlQPNMFWOovbcFLvxu97-TWDHE3weardQIWY5ghPKKqog>
    <xmx:ASKpatEaD5OAsnQBocHErXMdYUVIMi2yBP2_aCANuJrBbGwKS181LExo>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Sep 2026 06:46:17 -0400 (EDT)
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
Subject: [PATCH v13 14/14] arm64: dts: rockchip: enable the NPU on rk3576-rock-4d
Date: Tue, 15 Sep 2026 22:43:28 +1200
Message-ID: <20260915104328.45901-15-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915104328.45901-1-gahing@gahingwoo.com>
References: <20260915104328.45901-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_114628_179442_B395D394 
X-CRM114-Status: GOOD (  10.29  )
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


