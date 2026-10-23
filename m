Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3444F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bqwDRSrn;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=j0bVKA1e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RVoXlCSb6jIMaGtRjcozIyYGAhMCZqne31Hnbkv4d2I=; b=bqwDRSrnBql9ae
	ZAIkXK3KZ/9/GR4+dnwa6aM+XVhJujLPEUIR3E8gsV1HMLFzhgEAAwgKnOyh1bG9gjH6O74C+7aGg
	xZ7xYnGs5kBxlBnGbIwt3FRGgfY1eLpoBVPL2lNvbK2e3qn54wzXB+2hnsCSR4rpu30Ml3sk70bIj
	hUa7cvbZy9p9fbeknByxoQmH2HHH1DxmX6Qlas91Ef5ritMiH/YxfIVSpJagexI7YF5uaLpRCMwd7
	Z4x+iDPNKEoBp8MsJNYKvQpXKznEAnR55WYgSIEE+jxbQnOZgZPg+GUZ03w91uJXZQbF7aUNORNC3
	RS/SS012io95TLG3OFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPBO-0000000HDkj-1eUP;
	Sat, 24 Oct 2026 00:00:22 +0000
Received: from mail1.rojer.cloud ([144.76.98.110])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPB9-0000000HDcW-0mDL;
	Sat, 24 Oct 2026 00:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1792800001; bh=qvU369dgJvWvyI9h764kYcAsK2/h8+Rf6mBdDUM83RU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j0bVKA1em2H2nHaOheBGsJ77Q7+5+oW6aioIXy1KOwEcUyGeiJehGAvbJX8GUdW1e
	 cl8RKykMcsQrYvTKTSqAZMaK98Tx+qtBjiYhGjULLO4ToEjPV/r0kYL3+vZokTDk/0
	 QFTU2crl7GDNR/LB62sYUolkYsEY8LqjI39TK0N2lEQB1uvmDoGL12Ajci2nQri20y
	 pr4DXKLRlJluTRQ/dTE0GG1geUaK602Y9WfwyRAWH2RwGPXXnaYQ4FsEh6r4UJ48dt
	 b4EtJ4dX6mNUsokpfqfz2LdbmOt87x4NkAVW/dPOJdf4MHHoOBd9F93xuGLGWigPLx
	 9Z44rmqI/wWyQ==
Received: from nbf.lan (212-5-142-134.ip.btc-net.bg [212.5.142.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 7B9BE1271E1;
	Sat, 24 Oct 2026 00:00:01 +0000 (UTC)
From: Deomid rojer Ryabkov <rojer@rojer.me>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sergey Bostandzhyan <jin@mediatomb.cc>,
	Jensen Huang <jensenhuang@friendlyarm.com>,
	Deomid rojer Ryabkov <rojer@rojer.me>
Subject: [PATCH 1/2] arm64: dts: rockchip: Fix VCCIO4/VCCIO6 supplies on NanoPi R2S Plus
Date: Sat, 24 Oct 2026 02:59:58 +0300
Message-ID: <20261023235959.2988087-2-rojer@rojer.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023235959.2988087-1-rojer@rojer.me>
References: <20261023235959.2988087-1-rojer@rojer.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_170007_380942_7F72CA92 
X-CRM114-Status: GOOD (  10.87  )
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
X-Spam-Status: No, score=-24.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NanoPi R2S Plus inherits its io-domain supplies from the NanoPi R2S,
but the two boards are wired differently. From sheet 6 of the schematics:

NanoPi R2S (NanoPi-R2S-V1.1-2009-Schematic.pdf):
  VCCIO4 (U12) = VDD_PHY_IO
  VCCIO6 (H6)  = VCC_IO_33

NanoPi R2S Plus (NanoPi_R2S_Plus_2309_SCH.PDF):
  VCCIO4 (U12) = VCC_IO_33
  VCCIO6 (H6)  = VCC_18

rk3328-nanopi-r2.dtsi describes the R2S. On the R2S Plus this leaves the
VCCIO4 domain configured for 1.8V while supplied with 3.3V, and the
VCCIO6 domain, which carries the M.2 E-key SDIO signals, configured for
3.3V while supplied with 1.8V; the latter prevents the optional RTL8822CS
Wi-Fi module from initialising at all.

Describe the actual supplies. The vendor's own kernel uses the same
values [1], although there they come from a .dtsi shared by the whole
NanoPi R2 family, so the schematics above are the reference. Tested on
an R2S Plus: Ethernet still links at 1Gbps and the SDIO Wi-Fi module
enumerates.

[1] https://github.com/friendlyarm/kernel-rockchip/blob/9238df9d21e835bba35c8ba5248784387936cb2e/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2-common.dtsi#L425-L435
Fixes: b8c028782922 ("arm64: dts: rockchip: Add DTS for FriendlyARM NanoPi R2S Plus")
Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
---
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
index 4eff0503928..6ba4a74cb1f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
@@ -29,3 +29,8 @@ &emmc {
 	pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8>;
 	status = "okay";
 };
+
+&io_domains {
+	vccio4-supply = <&vcc_io_33>;
+	vccio6-supply = <&vcc_18>;
+};
-- 
2.53.0


