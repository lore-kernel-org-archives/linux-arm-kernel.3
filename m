Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65091606A806
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UGekLk/r;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=WDrYc66A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lSYxGlKMkILq2NR4SXar7B/zYY/ERjmDJOLLXYuvtu8=; b=UGekLk/r3SySQv
	TbhnQcoyjP9GZcGUvQmMIFvLqnJT03UvtnC/xQBtFIBFbfwtuy/diwolv2l9mXeYmmimNE5Wg4YZw
	YzkKjZ4tNOAfeRd1orPTXLGEavVcg3+TTWRG9b0tNBIbN0C0N9ur+Qn+T4HWm3zZYrLkvg6TdZo5m
	hu00ChShE4FNtOHv774457S478BhoWYovNXcF5+OLlaQQAUIf8A6ie2IV8oFA0rNvvoRdBCpmEGmo
	RL+EbtNXWhnjpC1cdIDcZcuVmRJe40YgRJKWpVAcg++ESYVllrbSLAQVh1zXircQ/gkaGDR6k+F5z
	f7O9rQntEHFmkMjVPOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC7W-000000025Vk-3Nc6;
	Tue, 03 Nov 2026 10:52:02 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC7N-000000025Sc-0eIy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:52:00 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id B25491FA74;
	Tue,  3 Nov 2026 11:51:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703108;
	bh=lSYxGlKMkILq2NR4SXar7B/zYY/ERjmDJOLLXYuvtu8=; h=From:To:Subject;
	b=WDrYc66APuiKiP4SutL3XR/T+oJdoVzh0VX9T/e60G6gKbyv9iiNZeguSD2hcI3PV
	 Bxx0zVj+qRrTglV3oaaBd9+rULGrm+zgd3TNGZw5jRedN1sbI9XPbag5UX5m/RyTy+
	 /T70GYh4dNRSfQUxk9BP3UmMbvB1FGcdAiH1Bg+R0tkPk6LQZ9f4C4FV5SCmhfl68A
	 PJz8mepuwp1vHCX2c7Q1sNuJKI424LZN5gi6q0AsvVxLPEo6ddIgOOGj9r/CZZg5Ki
	 vdJzsPaTZIj5kKfuddMMJXC2Pt7aXwtvh7Zp7DkbQy4fIM9V4lVzViVbzk1orveVJS
	 zJFop8Tv2NEBQ==
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
Subject: [PATCH v1 2/2] arm64: dts: ti: k3-am69-aquila-clover: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:51:36 +0100
Message-ID: <20261103105137.2393416-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103105137.2393416-1-francesco@dolcini.it>
References: <20261103105137.2393416-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_025154_244394_F50280B1 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Fixes: 9f748a6177e1 ("arm64: dts: ti: am69-aquila: Add Clover")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
index 3e2377160d82..552a1a792342 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
@@ -28,6 +28,8 @@ reg_3v3_dp: regulator-3v3-dp {
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


