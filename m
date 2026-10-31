Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD86F606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TnMe7WGr;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=Kx4Q5+8w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RVoXlCSb6jIMaGtRjcozIyYGAhMCZqne31Hnbkv4d2I=; b=TnMe7WGrZffa11
	VRTb/dy6+JNM8tMcYC5aiErnrQuGPc3WD0NGONFgwbM8Mgjlg4Vp6JXeva2tKRXp8HrJXolRW1B4g
	b35xJ7Cfscc4o2KnszUZXomfBzl/C4zE7JOtWh9AP2p0jRbXNWbiKFRVSM7TBPSYSWpB/Fv4XnPXo
	uEzn79U/1BBCjsNScU2vmzESKudDX2JDauAZ5TyNE3sut3jmDABnf5ILgFSaGXT125bl0PAJxCmb2
	VXTK0TpIovqQGW89g50xKdu01SpAdKbY+ILXJWaxB82i2kT06cOS5m5asD2kunk3JY5JXyypQ0Lcu
	SQRe9WEap7tmvG6wGI7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6cY-0000000DEBM-1Act;
	Sat, 31 Oct 2026 10:47:34 +0000
Received: from mail1.rojer.cloud ([88.99.92.76])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6cP-0000000DE6y-2MMm;
	Sat, 31 Oct 2026 10:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1793443643; bh=qvU369dgJvWvyI9h764kYcAsK2/h8+Rf6mBdDUM83RU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kx4Q5+8wIafwfq7pjfVQyW/ZGJ+77yFFS9JAvcNP93q4zEQUycKnO8T0nzTks+hP+
	 Vjo4lmaZHHmRPQCNOowTru6bcpvQdyCWoWfgGzNFwAEiAxYR++dwA82p45wMxvEYqb
	 hcgc33eCwom7TchARkkYvYbocItbiB/dRniXC/U9jmk7R8IzjiACRPSPCF99OzAkaV
	 vJ6jLSGI9/fIcZPiyqvzAmouaQZenVqypC5tnYyFFan9iSAF1n2aE4Ivn5Nlgc/9dP
	 SgXA47ls+VaEHrz7e9M0gedBWg+IQQ0+ZDe0a5SLkUvPpay6DdeFjY4mi57zIRVbPI
	 i6gONr6YsJUvw==
Received: from nbf.rojer.cloud (unknown [85.98.52.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 3537B2168C;
	Sat, 31 Oct 2026 10:47:22 +0000 (UTC)
From: Deomid rojer Ryabkov <rojer@rojer.me>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jin@mediatomb.cc,
	shawn.lin@rock-chips.com,
	jensenhuang@friendlyarm.com,
	Deomid rojer Ryabkov <rojer@rojer.me>
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Fix VCCIO4/VCCIO6 supplies on NanoPi R2S Plus
Date: Sat, 31 Oct 2026 13:47:13 +0300
Message-ID: <20261031104714.3271017-2-rojer@rojer.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031104714.3271017-1-rojer@rojer.me>
References: <20261031104714.3271017-1-rojer@rojer.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_034725_756636_4B0E1B65 
X-CRM114-Status: GOOD (  10.47  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


