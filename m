Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D0FC02182
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 07:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLsGe+Pf+NJk0N+fJlpAq1eWp/8FyDIG5iZXZV2pPus=; b=YDC6xVUWXa8jdbc44s1jK4z1Hc
	tH2hw06VCVPrcTpo1lkmwUOs45U9uAEn6blqihOJ2OUWMPLyg3orq+HEDjTuVdGZM1tkXHLtGfrOG
	GxIO43zHwxY143OLW173MrW+COyCIvU4LlNNx/UnGe6lBN91RIdzs79DDnANfgcuRP1xlvlMPI6h/
	WdcfbiTmaIpiWkFPSSmhUOPrBPrF0ztiVTIoQI73rC3uh0jRkd/nGZsTnGUClphAgsTHzfQs0KwaE
	AAj5HCfr7RtZ0n5duM1xQEqVaNDKMAlIFOZO1lVR+uGMmjkF5eyzd06BoV/PTCEY823O/hwefollw
	PFWU8iXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaL7-0000000GCDV-34Wm;
	Sat, 25 Jan 2025 07:12:21 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaEf-0000000GBi4-3cRc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 07:05:43 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F214A2540109;
	Sat, 25 Jan 2025 02:05:40 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sat, 25 Jan 2025 02:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1737788740; x=
	1737875140; bh=hLsGe+Pf+NJk0N+fJlpAq1eWp/8FyDIG5iZXZV2pPus=; b=r
	RdX4bN/DWi7OAgkNY45u0kt/vTzPnSMRElz3f/snNFzroo23T7QpXoDswna8W7v4
	g1BIrX5ZqV0ylVMRQwoIJJ6PYzOYkG1y3cQ7bZZQ1ZW0qN9ZK6IKFMkDk+iEOpEd
	xOmPryn9S6PMH5YibDzvhUzT4H15AkwKqSE25+K2U3Ws7ZvkdSKypKWB3vYXknbb
	4UP6FFhjiRGgBmJKEm+vA5CZ3A8FWuwY+2skIlZzZmb+/AdObxTXSz5WvO/ce59d
	aSFf816T4sfQ0CgIkDCQl5lqgO0RMKQD71+f0lzmI6etbrTaNbFANOzuSmDeKvKS
	R/Gc0TiCvLnvipZIzT4ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737788740; x=1737875140; bh=h
	LsGe+Pf+NJk0N+fJlpAq1eWp/8FyDIG5iZXZV2pPus=; b=h3IwaLEnIuyuv7C5Q
	U3LCLKrd5eRYdJDxjwL7wtS9FUfouzyCvXkyViD0cVPc2Jm0dAQYXGU5p5IsY7iO
	+4LGtKlug7F51wjVbluzxt2ONqeitZh21vOnEUmpHAIiAWpbGlHroDnhddQMwgwY
	1NYpyFAYSlLX76XrDjoH3sxt3qXysKIeUnkTzSMGGj1l2Iq53lwLjSKBWaNnPUkn
	W/xi8vPcxJbCmBR5Y+OqoTMgi01gPzI9NtlfD/e+/OHVe+6eIQj1MACU8m/4hbt4
	V0QytVuLoE2ARvqEBhUE2P8YLZw2lnXR8nJ++fMaPfk3lckSyqJRnMYoUkF1dT+J
	5TdOA==
X-ME-Sender: <xms:RI2UZ3ink3SxpTGbKRgZn3I8uXCwe6-qsdjWdYO9zrqqLLs9IxjhuQ>
    <xme:RI2UZ0A66gXNsWrxQAEoeWXGpIlgzN8xRt2K7-RrwEh34nCdzhW9kKyjDLfwlF_IV
    RMF8CENhboIUi3HpQ>
X-ME-Received: <xmr:RI2UZ3GlcB8A73MZKbJOBj-Ho0hsymOFyUyu6LOYAqihcOQqOY0DRl2LQWqyh_GwNhBkBiNapkKS2q2tfb6yI0eFr2nbE9qhcVhWprH9uZcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgieejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:RI2UZ0RjqV6hzsmNaUbYfNyZSEcA4BGEqT9ORvSXmofipAt48jGSoA>
    <xmx:RI2UZ0wgQjRQbhrhDqZKdfxHNvVTvUSHJ-Cfy9ZxDR5MTo6XRG1xyA>
    <xmx:RI2UZ66kItiYwcK9VZ2Ts7wvSMwQwKAaBAHXc-1ERTyOdOIlUfS1xw>
    <xmx:RI2UZ5wDuk3HqMBJh27vMQ7M0TsKT8rL2poewwuFc66qX0zEHoQ8AQ>
    <xmx:RI2UZwj8mtDOL91oNaSbiei53pZW2qrs0JFyHTIYbpZFF2cvW8oqFVy3>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 02:05:36 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 4/5] arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX
Date: Sat, 25 Jan 2025 20:00:14 +1300
Message-ID: <20250125070458.13822-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125070458.13822-1-ryan@testtoast.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_230541_957243_5D0031B2 
X-CRM114-Status: GOOD (  11.97  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for headphone insertion detection via GPIO for the
RG35XX series, and add the corresponding routing to the codec node.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Remove vendor prefix from GPIO description.
- Whitespace fix
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 34c2bb4cc0474..0e3537505d293 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -232,8 +232,11 @@ panel_in_rgb: endpoint {
 };
 
 &codec {
-	allwinner,audio-routing = "Line Out", "LINEOUT";
+	/* Both speakers and headphone jack connected to 74HC4052D analog mux */
+	allwinner,audio-routing = "Speaker", "LINEOUT",
+				  "Headphone", "LINEOUT";
 	allwinner,pa-gpios = <&pio 8 5 GPIO_ACTIVE_HIGH>; // PI5
+	hp-det-gpios = <&pio 8 3 GPIO_ACTIVE_HIGH>; // PI3
 	status = "okay";
 };
 
-- 
2.48.1


