Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0E8C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r63YwR1L/ofpHxLT6Q3OA+2f7mAGpLh9Y4XDj0L07nc=; b=a/2zzENsRlkG3B31IbZla7et00
	eFVRdHcPs1W55YIjO8pUBL2NgnKx9ExFR1JO5e+537C9BNScxEjAqAhacIj8qbLGuQo7c4xYt44d3
	KRaxItsqVKZDq+1aOuiOF0sRaSKSEMG0z+K/iqe4XZxnjoKhZn/Slfw7sfH6HeFetqlG8DmBqZwp6
	q4GQYWVxoL6eQzg97GwMeBj6dhZnA/IC8c1JDGh0UQqZnm4Ux6xRY2SdC0ObTFlNKOplLEEK8LvNL
	0pEkp36PvFUF3CDroooWeiVsCOHZtweMtrWKvdQlzcOE9RId5Nj56HCv9NbDhCUEydssOq52Z8qbL
	N+UI5qEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Fu-00000002nOt-35e4;
	Mon, 14 Sep 2026 08:41:38 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62FK-00000002mpV-09HR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:41:05 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4BA7B14000C1;
	Mon, 14 Sep 2026 04:41:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 14 Sep 2026 04:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375261;
	 x=1789461661; bh=r63YwR1L/ofpHxLT6Q3OA+2f7mAGpLh9Y4XDj0L07nc=; b=
	FMwbpYfiOshCroUvDo8PQ4W/JiDenRkDjx1VPlirkTI8kco1jLmEfunOju7r2gYi
	OQ3Zdth5gBjr+uUXOVkPNmWQPN2WfpHkw8pZikv6xauzJ2LJRZefdl1K7ai5Lmlm
	6m3hB9pPYLnD3nX6N8nTdso5DZikTtrwgI9s48WKNo7HvE4tiflcVbL7hqIBsRi0
	/ae18kgVRDzS9R9Qmtp1ryz6r1qtHBm2mIWGIR16FUufwRTqsU++Enzv3GQk+e1X
	gdbqbWLinoeVLAqt6RSGW8/4ORrUbmraBzkBsnHqyfMvisWJKZuKqPoKXMlJIuAG
	GHRq9zW35KeK7UtM+e8mew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375261; x=
	1789461661; bh=r63YwR1L/ofpHxLT6Q3OA+2f7mAGpLh9Y4XDj0L07nc=; b=H
	FJ1ZFjeCUhV7Gk1Kwal/PPc7mEX+iAiO8CSE0OnM7SbWzsy2mtRdaIOFTdV4So5d
	/OY3oNZaKlHz5fIKMptAE+e1c3XhtftKwgmoJwb8Mpyq8AZnGGKsC5NGjPUTMKiE
	i+rSud9nQAA1F03yipDhS5ORzuGKcM0e+6f7EWJrUVnZiAN59E7L0mQY6A1IlY10
	4rBd8+at3078u5TkEhpkqUV2npkuIn5BC14XLku7rPguQmFULLu8uMxcZzitpeWe
	Kn2e86IcW+gtDbbCSHtTARiI7zo4XrBFizPmyvwnAmlTjD97JAxepD/2h/XCLXD2
	/QhryZmfShK0EBl4zKs5A==
X-ME-Sender: <xms:HbOnagQGt4OB3ymB-kV01o5DriFYUrx7BwFEdQhTcJvJmLnmlIrQwg>
    <xme:HbOnal84d0qHr7K3R48YhDYM2NEQ7fHe5Zs0haZN5bt8RvJpGQEw14J7eBseHCFeV
    N0_VqlTJl061ZSNTV6PU5nMsyIyLEe5k5LxOr6b5S_zn4f-UNILw3M>
X-ME-Received: <xmr:HbOnapYcd7QhwJZycu294J_nKXcNQ0i2xLjnndVDOfvVvH5z9k0HcuO1ETl7UNVhXyiCwS68O9I7mtkRzHjaAsL9mu7s_dUnuSAcHg>
X-ME-Proxy-Cause: dmFkZTEDLHr0shzxwhX+29bUrq2gfJ1+uzQ4b4gKQs3bZHRMEcVi5+3e+WWMmXn4weJHF0
    3tXMcFWQblGPPDQI4M9zHrzHMMgs0LXrEWCtY0HOKPhWUiTU65Hq4BSITitLFMR/nfR54A
    QBr3yt2+EqSebK505dZuX4BQiJBC2YrhM1cKA3YLwTBOhpwZfcQEF5yaMpHRvipvp5nbhM
    qXqI61aj3JPw2SHELjXQTGsoBh2Y/LuJTzIJZd7IArzAR6+91M7O+W1wr1s1KNxWnuZkuF
    hsZ8YwXBQsE0gAiTRFJnmiV46ucM1Ygc8cn9Pw17HkJ3S5rNQ8lRntZ8AGSg3kYW6wJPdL
    83fxU2zWEV5wmioHAb8mbUio1x3EuvEGyBZKDuxzRLjylbCD3pmK589O6UCfgEhyuwyobl
    jqPAEjFd5AtZAhl5eFzMz4Aa6g4XQDGTAYdPu/ctaPrBZERU+8gCmVkQcbLMHhl89OcHl2
    tlyTDskvTtNGyq1s/T4YiKIrMTndMvt//qdmgQsguedd1eYB73QdrUOfTDlqJYp6d7bfYx
    KwOxFb2JFiqp7btfgy2fjc+/526br1JPc33CptUZOFS2Cwrqz7GdlRHldGTGlv9PIXwpQs
    P/TvpmOe8WFtjyHbgjjSQ3hWLIubYmqdDjHANi4qhzz/WzMjcbzLWfxL6+ZQ
X-ME-Proxy: <xmx:HbOnaup1Jqu6Wwz-Fcpqg_HbnFPADJtKWv5SMpw4Xq4gEBKbSDVARg>
    <xmx:HbOnalS0VgR7NECQMBSmnxCwI3ZfGanrKDsO38zI6zJHQLFX3W4fow>
    <xmx:HbOnaqoSQ8saFh7OFw5R6PfSZj1p9Sr8LUDcqj7T_DESWHnUeDXEaA>
    <xmx:HbOnan3J1j5ydiPjlO0g21cpcjJ9kGvPX-qGInWfRVvcjSHtvQ8cJw>
    <xmx:HbOnai7hMz8Piem8g_oL4wneyrtlaLjPRUm0l6ATqxLmCzkZ3MRc82wI>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:41:00 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:43 +0200
Subject: [PATCH v2 13/13] arm64: dts: apple: t8122: Break overly long lines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-13-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=cFmVSaZo9VycGh/nPhdXICFa1DKaYSdhu9nyfwbN2m4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm1kyN12Vs5zd5nXGb6bWlu85Fi19z2/MfOhePUFJL
 /O9g8byjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABO5JM3I0CL3yX+75JPXtgwH
 lTZtvDZ113sPq8/7bkqcMje41fY57Agjw7zE9sMcto2TeeKVBNmcLLd9i9S0DDE5um/lK43IGwm
 XeAE=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_014102_181959_756D5371 
X-CRM114-Status: UNSURE (   8.96  )
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

Fixes "[line-length] line exceeds 80 columns (N)" dt-check-style issue
with N > 84.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 173c05a55fc1..52257fa22631 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -341,7 +341,8 @@ i2c4_pins: i2c4-pins {
 		};
 
 		pmgr: power-management@2d0700000 {
-			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x2 0xd0700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -394,7 +395,8 @@ pinctrl_nub: pinctrl@2e41f0000 {
 		};
 
 		pmgr_mini: power-management@2e4280000 {
-			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x2 0xe4280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.55.0


