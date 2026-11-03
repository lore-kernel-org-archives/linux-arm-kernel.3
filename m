Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92247606A80A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dYn4NPTf;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=efdoLNPc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OzgwCIwWShDidCYfodpLoLuz6ukZj6iJTfhH6QPwT0w=; b=dYn4NPTfk8pGSq
	aTw8NtBHs3C0l6+keLNLRQRL1Ibc7Igis0BLDsfyQTwISzNorvp8ZLVIyU81NbgUhxAw0cCrXe7nT
	57vn9MhKmQH34MTLFEtsHPDidTvZz0IBU5z1bDCsb/TSYEOVwoWeWXXwc7o20364JOFqu6CD5zOGm
	gT8O18VvUSHYHOiqUF/9aH3gdgLwZvztg0yA7wLTEIkbCxcBcuKVRyUS/hvh/mmLwuE0Q4Ur676sK
	93pvjf8bMgPiwvVwrYx5knqvMUo4kJkwRTI6o0VsSz7DCJ6uWasp5fgMYvNEep+AylMysDNMMbGj0
	8XHc2KujweY6HyGpxb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC7U-000000025Uo-1InG;
	Tue, 03 Nov 2026 10:52:00 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC7N-000000025SF-0eDY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:51:59 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id DF7831FAA9;
	Tue,  3 Nov 2026 11:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703107;
	bh=OzgwCIwWShDidCYfodpLoLuz6ukZj6iJTfhH6QPwT0w=; h=From:To:Subject;
	b=efdoLNPcZBo4NMSB2+g7SpKiBeH0lYrSSJiQQzNhF8psrpli0fY/hRlxHRKdzzQB3
	 TjouP1s6yZzHdJZU+KK6vZUOQ1SCiwFyZ0ggXHd4PGnOwrGU+SIljHkrk5H8seMHD5
	 1w7L9Ja1yNjmsag9iawQpklWnJvbhT3DRf7+OL6TaQGqZ7VRvC4Wv5Awpm7sBG9nEV
	 DWTDAF7LuNrI9QURL0tf+JEYGyXcZ6/Zt78N975t1rBcUIEAkl8MC83Y3rgeYD4zX0
	 tnS2Hyg/SQO1jfA0nZ2IcclKnz/8kOQApiKy1EGtH7wDLFPrmGtSA/hLgI2xJDrP8q
	 NHOEFTm5K153g==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: ti: k3-am69-aquila-dev: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:51:35 +0100
Message-ID: <20261103105137.2393416-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103105137.2393416-1-francesco@dolcini.it>
References: <20261103105137.2393416-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_025154_235960_2F173277 
X-CRM114-Status: GOOD (  10.05  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Dolcini <francesco.dolcini@toradex.com>

DP_PWR on the DisplayPort connector powers active DP cables and
adapters, which do not work without it. Keep it always enabled, and mark
it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
whether or not a display driver is available.

Fixes: 39ac6623b1d8 ("arm64: dts: ti: Add Aquila AM69 Support")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
index d3677c2c2547..5afd7b806265 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
@@ -35,6 +35,8 @@ reg_3v3_dp: regulator-3v3-dp {
 		/* Aquila GPIO_21_DP (AQUILA B57) */
 		gpio = <&main_gpio0 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "DP_3V3";
-- 
2.47.3


