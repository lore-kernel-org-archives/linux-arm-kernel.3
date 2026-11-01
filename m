Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A09606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zR8yGQFC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhbNHBH2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cmJQY6CxCO3fQ2jSfuT5Em1eTV8/b6tChqwuIbfXg0k=; b=zR8yGQFCuqzIJ+P2akkQqqkPcc
	S1olRlQRk+V2e0DABTq2PbnYze8TxRJsjblgsDsbkl0snw52SvRP8pFGYL7MmJ5pM8XPVwCmub7+0
	t1ww8icvAHsRDhs/HDzBVwDCySxdCkrvN3wdOGKTZw0wUD1eqxvJpPCYLy/isg0CQ9eh/jG/Gfq40
	y1I8L+xetXk5jqTtHVvePCe6y2OawgbWXnmx6DFL2Z79EY+Oh8lOTiQENIdik7+hBilQHDCQ8QfQZ
	2A+7/7QDHPSYxa+woElk1C6WbLiGB4mCFLMOOqxk8DxVSnQseHayCfpPR5IWRGqLs+PDnD8k1IJVx
	itM4ZiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWh-0000000EvyJ-0I0H;
	Sun, 01 Nov 2026 21:55:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWe-0000000EvwW-1nk0;
	Sun, 01 Nov 2026 21:55:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 16F2A44009;
	Sun,  1 Nov 2026 21:55:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570140;
	b=HE8T4laifIOhhymSk/SkJR8lutbIjAHhAipv9DG5o+z+L9feYqZYiDkC3CE/pOQe10cM
	 Gabu4a01NiUjzT/zbVsd+uORiJgvLqXfiBNA4c/BZKlOMFbN9B6mTgvbU0rM1fti/vOuh
	 PYc7ku4ezJhOcL+krFv3l1tsqaxZl+YEBTGhCXIhs0dRGaTg/FHrjuwU964T+1Nk2PsRi
	 W4+OBmlmFKvS4TZskZkXlja1dm8BXiR+RFWDyJWqI1nnUJhkGbWqKhXSarspQVv41W2qe
	 UiA7EtCCF4F9qLVT6O4goavy6AgJOZfgk3/r+4521lbemQg73QSia640J3KaQobATNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570140;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cmJQY6CxCO3fQ2jSfuT5Em1eTV8/b6tChqwuIbfXg0k=;
	b=PIDbD7uuvuSosoFeiPLOtP1k6vrHot4Fs2fuMAOTweHo25t33NpVXrJLK1qHqY2wODu5
	 M0zJO6+C56mKksiGxOO5Tkm/qJEqKMt8y3UrqcR3K2yM3X5H2NpC9P3w2U/IrhnflaYtq
	 xOkhvTbu7ySNbO2DYVx7jsL7d08lDg+BxtcS2nIuEuEjvbkOyD6AuXAY61MpUa34Q+3Oe
	 SWU/fLbtcX0eqTxb4P7ZT4OusaBfCzrEwvearyvuSiRLKRNivdKFI4UNs5NTv8qelLyrt
	 swKQ0swW0+ZC58HIKDPGsjbRQdREbjvWrWIsbWJ3EzYpN+gXfWQ12mvrWlurndjm6zA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46E121F00A23;
	Sun,  1 Nov 2026 21:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570139;
	bh=cmJQY6CxCO3fQ2jSfuT5Em1eTV8/b6tChqwuIbfXg0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KhbNHBH2IjZlCBMMlA++mDIJwnKr7502Rf25KKp/ni1YWn+E+w4spl6VaZQPte5AY
	 e6wNHFT9D+lWNbK8QIMMP+SpnjTLX7/sfDc39FUW+4jQt8d8gP4iSxAjNoQOBKl7dE
	 qMdCCHKpfk302QIkt2flAeFo6OZgbCqoabdBZIafIMUobPRgso3N1pUiftzwZUT3ys
	 D7CaC+XP6ot97Z002O8B1pfrhKCeodic22ZsRyiuAWj51uezSSNR3B2oYri2EGCXYo
	 aEsPpviK35NzNShxMNE4C/M+XjtHxTNS73T7SC99Sh48f2uL9iDcZfTPigFDJyEzR8
	 Q8LXscn3g7PeA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 57A30462B0;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:27 +0100
Subject: [PATCH v2 9/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename
 pcie2 power rail
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-nanopi-m6-improvements-v2-9-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=1400;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=TfFgiB4giRKaTgnfoPfRrHvibM40sDP9g/fpZx+5ABA=;
 b=tqqvqzg0Se8NS6bMEPELSeJOETbOX++VJ7/RYUqJW/nYfjTmCYw6EMg9XAvCV27rKl3wWj/sM
 fty2BA5qa8xAHxYiCjP1bc6WgiJEr1bxwwh6ra2oJyeae3dAJCHyUTh
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joachim Eastwood <joachim.eastwood@gmail.com>

vcc3v3_pcie matches the signal name in the schematics, which simplifies
cross-referencing.

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
index ca115d8e108a7..dd61c61fe7d7c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
@@ -36,13 +36,13 @@ user_led: led-1 {
 		};
 	};
 
-	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
+	vcc3v3_pcie: regulator-vcc3v3-pcie {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie20x1_2_con_pwren>;
-		regulator-name = "vcc_3v3_pcie";
+		regulator-name = "vcc3v3_pcie";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc5v0_sys>;
@@ -95,7 +95,7 @@ &pcie2x1l1 { /* M.2 E-key 2230 */
 
 &pcie2x1l2 { /* M.2 M-key 2280 */
 	pinctrl-0 = <&pcie20x1_2_perstn_m0>, <&pcie20x1m0_clkreqn>, <&pcie20x1m0_waken>;
-	vpcie3v3-supply = <&vcc_3v3_pcie>;
+	vpcie3v3-supply = <&vcc3v3_pcie>;
 };
 
 &pinctrl {

-- 
2.56.0



