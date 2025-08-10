Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12122C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+3auhxeE+Rfw/97tdfWtAk0l+LpplUvhw7JTvBvY/L4=; b=TUl6SwpcG1vs99lVOCZCp/jjmC
	sSAHzYH8jbwIlirfFJfv2hCzzXlfNNPO00efxVOe+47psO66n7/Lmb1U3zJ7Us5XLmrnszxAIv2qn
	FtXHEk941ZsGrb0hy4avGXDMWUoo4gOyscJ0SWXQSkBEHg91XXgtwtNmTVH+sjGEa24QA3MAa8xZ8
	IAyOeXCObmaHMh1DCXc+3Wqoh6uYc6ctw/tM+PXqtQhMh6Q84F/q0pnIaApoREqap4ZSsIzG/7qXb
	+CdVxclzAKDNmm0+xg/8nfRFFgwbdDny8xEHFjpop9r3UxFVzQYBaa6J5BDaok7C3sTBlAa5v7k6u
	wMZ9L5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul8bm-00000005mCw-3dyc;
	Sun, 10 Aug 2025 16:09:18 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul8Xt-00000005m2y-1Q2r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 16:05:18 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c0Mzt5SYxz9srm;
	Sun, 10 Aug 2025 18:05:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754841914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+3auhxeE+Rfw/97tdfWtAk0l+LpplUvhw7JTvBvY/L4=;
	b=f7KyaG4z2hUHYWLxJ36Zp631VXu9k+LB5Z1geBRZk0lvzLiAgLgg6ygQCf9tMU762jshxk
	rnLGI8eZ2juO5KMVVzdmczB00pxsGVD+JMW3iidkfkuwKCQPw0gvvFtCwSKYI3+Eh7nmkq
	QfkWtm5cKfcMCN11n4rBayUEb3GZ9lmZ0NRTgsiuTPQ3RuCFhpP8wx0Pi2cfeDSBwj/UCL
	gWMQmxZVRWTPTIfiqu2/YqPEQ1/pFDWgjx3fZShJ/PxyN+bwMSNRyi8gBck7Z8fs39cKcO
	ZkPkQTDMLStb6Z7GPVWHl0pl+kKVvkaez05VFi7jGE95Uq2TZo0NyJYH4pVSbQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qbq7XXkB;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754841912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+3auhxeE+Rfw/97tdfWtAk0l+LpplUvhw7JTvBvY/L4=;
	b=qbq7XXkBM5GCIjM7ZZaICea7bxIpdICIT+QHHJcybuR+baO8/iWEU/Zh+S9RmA0HslrVJC
	cDs1sKgLrRD8DmHNPzRJYsaqjfWzOyk71VQ7I6DHGCr7sm0OU02SAdyc58NYnxXFWMHzLw
	jj4sYj3pd0kk5bjCKd1yo5ekG1ilEqalR8XeW48cjtlpBfWD5dBMn9CaZ9jXNJdX0IGvme
	P3q+OlJ9MDJ5FttqepPzyA0N62U/cDK0nhOp94CXM1M9VH4UTkjyn6tz1y1TdfO/MlDCwL
	vdHE+jr2p98ghArTKO5wITOGgDPbMPGqg4ZP7Vtphjs+IPadnmHZBlcSAAd+dw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] arm64: dts: imx8mp: Fix missing microSD slot vqmmc on Data Modul i.MX8M Plus eDM SBC
Date: Sun, 10 Aug 2025 18:04:32 +0200
Message-ID: <20250810160500.10213-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a50f49fba771ab398e8
X-MBO-RS-META: 7w138gkkn3g7f1c6osbhsdw38b6kaw4a
X-Rspamd-Queue-Id: 4c0Mzt5SYxz9srm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_090517_527358_DD506FCF 
X-CRM114-Status: UNSURE (   8.74  )
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

Add missing microSD slot vqmmc-supply property, otherwise the kernel
might shut down LDO5 regulator and that would power off the microSD
card slot, possibly while it is in use. Add the property to make sure
the kernel is aware of the LDO5 regulator which supplies the microSD
slot and keeps the LDO5 enabled.

Fixes: 562d222f23f0 ("arm64: dts: imx8mp: Add support for Data Modul i.MX8M Plus eDM SBC")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index d0fc5977258fb..16078ff60ef08 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -555,6 +555,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&ldo5>;
 	bus-width = <4>;
 	status = "okay";
 };
-- 
2.47.2


