Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B291BE6F08E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYNeeuY0cO1TFUCt+bQaF+1AjVDKDQGHrFfMGn/OIDI=; b=Gb/L6mfzjlMXbP7jQFqV8D9aXY
	DabdF3RoCB9VcO2hyLczYr1z3olunRW0Qvw3C1L7VpGRCAzAK1jDfMzcRY4454sGrJPAwDOSapcbg
	p+MruXh66o0XOpTYeRaRMGIRmEJArVMpoCbwU2Zh+sczLP3Fj8gBRTf3oEHlNsuQTu6KQFYxEPAmG
	vvIzEUuyrfvcnS2AINXuZJxXUew8lj9Prv9yxdpyXEw7YdUmN5IfcWIlinD6jmVz9vPHupdE+0y3V
	AW74vYmT8sBuh4x6Zi25AFIEtO6knoDx19Ms8msrKVGwka19SVp+PCjewSBNYC9MxsI0kxdl8dn3D
	bUl6fxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1o5-0000000FV9P-3RzA;
	Tue, 23 Dec 2025 12:48:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1o2-0000000FV7X-2sTF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 12:48:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E67E443A9;
	Tue, 23 Dec 2025 12:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8E4C113D0;
	Tue, 23 Dec 2025 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766494082;
	bh=B3xjfPRKFS0qoDeFoIRFLfaayzMur0aXjaMmej6M+fY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NbcY4pX7UDRBAH4ABtafnWNjBiGs15KK27AUjeMprV6VHlaJScb+kc0gkP4pq9L64
	 BnExPDBzCuUh4NNdaojK6q9d+2HvCjUKfhxmXNUCdPkP+/KI3dSk0KfB9ZpP4+xQPI
	 6+aBqjJh5BBnRhixRWoVMjer4IH+31iJXIta72hIW+FGgJdn/97wLG3cumHLXPvLtt
	 nzugW7B58tBFoaO4W8iCsxOCpo8GKnunDulQoMUCuzjDlg+EdQgbHieFvJ4zT4VGPo
	 FXcaVYmCJjWYzWcw4/vJbqqNiRYs3ZWm6gohw3+3z49F7IwWLQKvxpKRSCSsVDuRAg
	 oi9eh0bpFPHnQ==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Randolph Sapp <rs@ti.com>
Cc: linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 4/4] arm64: dts: ti: sa67: set the GPU clock to 800MHz
Date: Tue, 23 Dec 2025 13:47:16 +0100
Message-ID: <20251223124729.2482877-5-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223124729.2482877-1-mwalle@kernel.org>
References: <20251223124729.2482877-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_044802_790440_CBEAD519 
X-CRM114-Status: GOOD (  10.26  )
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

The board is running with a core voltage of 0.85V and therefore we can
clock the GPU at 800MHz.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
index 7169d934adac..0c7f3e10a150 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
@@ -292,6 +292,12 @@ &cpsw_port1 {
 	status = "okay";
 };
 
+&gpu {
+	/* The VCORE is 0.85V, thus we can use a faster GPU clock. */
+	assigned-clocks = <&k3_clks 237 3>;
+	assigned-clock-rates = <800000000>;
+};
+
 &main_gpio0 {
 	gpio-line-names =
 		"", "", "", "", "", "", "", "SOC_SDIO_PWR_EN", "VSD_SEL",
-- 
2.47.3


