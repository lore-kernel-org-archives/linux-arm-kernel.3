Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E67C79F87
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMc9N3kKI3AsAILH21Km2vm4HyahKMpFfcgg1lqbGhA=; b=41RimFaczp3eUuVuymrER4SEJ4
	hG/DZ0Ttv/Q/x0jtmsqNi08Kq/I/KqAXh6xUNW8a4rk6i7GZj4ApKr74Z+7DzXOX7VyU3fmbYw7EE
	ZQO9BHh/4zYJrybd/zQlKKwM3S8ey9kv3AEQeJlVer+qOS49FoyQ1Bb1VSscV6eSV35fCXoLCxbP5
	8Nq8yOm1IWeLmBRESktIbn3pCg7tLcO8I6+4iR295KZBvumXPqWi8nBLaa3lctl1i+dfY9i6J7C0X
	YFWTVN6YjF7uIYIioqqZrAQmHctobrrKLCnf3t87AJJy9pCqFRNM2v4iznp3eDVETnhhvx4T6mYKw
	jqA2ZQkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjOD-0000000BFKA-0ZDG;
	Mon, 05 Jan 2026 12:08:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjO9-0000000BFIR-3zvV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:08:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77E4A437C8;
	Mon,  5 Jan 2026 12:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377E6C116D0;
	Mon,  5 Jan 2026 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767614925;
	bh=d2TRHYORZXsy2A1NvCNofvbS7eDma5sCMXLSKryxZ+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VIKmTCtAL0IUVFWQJodtnLn+t4Zu8BYI9xmeNhu8XhLQ4Z+y+c7v+n4MBDMajRbcU
	 wxpPwAbg/A97wvgN1KBF6ziopo8e/HVRXoeqTlmBGLZb5ijerm9Tazm8FsQpvTjqtN
	 uFH5t8ZT3eFB2TR1AwgJLVGLQam3ArzhhZ3xd18G/f/cfmh/kBiqkDd54VxjdllZm5
	 nPdD+mIzm0blK+y23m+gPuXuoAUO1oU2K4qauIFdQRkE5c8QLmOWdhyt3BPslrRhaq
	 OSZH+SwKN2ygxt9FyQHgYUOeMUeaMnSMJvQgcjkPTeL2fqGPoCav+jiRM/OpC/9ZPz
	 XH9Nzo9VFJyJQ==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Mon, 05 Jan 2026 06:08:21 -0600
Subject: [PATCH v2 2/3] Revert "arm: dts: socfpga: use reset-name
 "stmmaceth-ocp" instead of "ahb""
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-remove_ocp-v2-2-4fa2bda09521@kernel.org>
References: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
In-Reply-To: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mamta Shukla <mamta.shukla@leica-geosystems.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: bsp-development.geo@leica-geosystems.com, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=d2TRHYORZXsy2A1NvCNofvbS7eDma5sCMXLSKryxZ+A=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpW6nEWd7mbEQX7sf3uR0NJjUGW8Tiyng8CFOE8
 ZjjyH4efpCJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVupxAAKCRAZlAQLgaMo
 9GjxD/9c1SPrLDQhnKon7tu1O65dvg8pnvfeRmI0oeQWVUQMiEkCmXIaWsiMHJ+9rPk69TzKs91
 kfZkzziMVUZzwfpYk6xsqxi3fF8XxT+0e2Z9u4Hlj68G/5iNOGuYxFc+LHZNtDpO5MvsJGq/W+l
 33RQFbio8aJDrJ13P8fmJxr8CYgntwBNh/IDFawkcSIAjyX5FXOk4VHDuvcWWYDjIpNwK9miAou
 08Igff5AItrGsXSnSYizElqGr37FkLYUCBOsPJ+ygszn4oKTcpn2m+XYymq/TYsIFrmvUAwy5/J
 hEXroGMuZ5Vnqh6w9btIsvQ0OZTU1rpJgYx08VpPLRN488/MSPlxcspmKlgi0W8j2q8v0jiEbzq
 ZbhrfUblLeavGuqWwIoMsqIyDVlelVxN+pydFq/XXOJvMaWS3w91NUceSbLACSFeIz0fpCgU0L1
 S2JsIsVlwGaloixM6O++rlSPham/HAA1wMmk9Lh4XwX8cjJDeDyIQ/r3Z7sIOfKYoDpiuZOm5WG
 KkyRwOOCELmY0ZdNzyl6AUWJ/S2nJr8dNd8NWS0U9cApfwaRNJfswY/Zy1a5el0IIhkfTrHcIeg
 NhiuLokskbbyCW5S11LQ3rUs8GEEwMeQQMGKtgmBi2dJrQ/ZyUjabvFGfkviJFSwgVcE5GlNhYP
 5EYo09axGhIFhVA==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_040846_028136_2DF2AA54 
X-CRM114-Status: UNSURE (   9.95  )
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

This reverts commit 62a40a0d5634834790f7166ab592be247390d857.

With the patch "add call to assert/deassert ahb reset line" in place, we can
safely remove the "stmmaceth-ocp" reset name and just use the standard
"ahb" reset name.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index b108265e9bde..6b6e77596ffa 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -440,7 +440,7 @@ gmac0: ethernet@ff800000 {
 			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
 			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC0_RESET>, <&rst EMAC0_OCP_RESET>;
-			reset-names = "stmmaceth", "stmmaceth-ocp";
+			reset-names = "stmmaceth", "ahb";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};
@@ -460,7 +460,7 @@ gmac1: ethernet@ff802000 {
 			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
 			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC1_RESET>, <&rst EMAC1_OCP_RESET>;
-			reset-names = "stmmaceth", "stmmaceth-ocp";
+			reset-names = "stmmaceth", "ahb";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};
@@ -480,7 +480,7 @@ gmac2: ethernet@ff804000 {
 			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
 			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC2_RESET>, <&rst EMAC2_OCP_RESET>;
-			reset-names = "stmmaceth", "stmmaceth-ocp";
+			reset-names = "stmmaceth", "ahb";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};

-- 
2.42.0.411.g813d9a9188


