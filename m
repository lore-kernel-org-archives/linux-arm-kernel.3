Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11A4CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0Kp4ncgXY6sTHdsDfmoXcWbE0QEKFtuM3FlNwmz7Co=; b=eD2wq58RZ4fYoftPvMuoJWTBnd
	VCCDUDruDQYY236sFF3Eh+VMFo4E8zv1o53OF2VS8r3yLnhrO4JohdIViLPQz2eoHPLjUcnahfAkJ
	Qn61r9byItDsDe+EuaJt/vQVojXAB+JKJRwl8gSSZgXWuVLlFH9rFK/V6GbFD2W1lyeAkYWhX3Ibv
	n2EPBZUkR4LxDLOGcYv8/nx3ZDJ1qznrAdTGFQ6yfAY+HuYxn3LHQtvIOLyt6IfmehAS8N2S+gOZr
	oFQ4FW0bWjwJ+dpUz6DjmgVywnnGmZOwB7T6UwbFvfTwjwe7iZ48MGUglCl0RT78Zt3XOoeMEmJKj
	uaRyED3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd9M-0000000Ei6Z-0K0U;
	Sun, 16 Nov 2025 13:50:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd9L-0000000Ei66-2oO0;
	Sun, 16 Nov 2025 13:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a0Kp4ncgXY6sTHdsDfmoXcWbE0QEKFtuM3FlNwmz7Co=; b=XezrStwsNxEOlxSGRQHfZ2d8CP
	+MtXD5I+gZKCE6+Lsdp63CdF/yb4rjAIR7SzvCz37n5WqL0SuMHkAOI3ed7zXNKqHyiIvOohsgtN7
	WlxvUvZAMCO1/K4gfSEHFz8ub1olgQKpDd2ghB7T5YWdLJLWuk7Via8oPoumpvbghwT/7qn+mei09
	QjpEn4Ltd7qM1UFyvBCqXjSD/FtuJfPeGY4ZUujHAMWiC5Qoe3cGN72oGmpBvNtyumYmGpz3cAWL/
	r2O6wnvS3d3vir1YfZIYSDZOogOvvL4b6BDp4iARWdKw8tAozxeW898YtiFTO1ddE7OazY2iw19a7
	Lm66XiFA==;
Received: from s2.avantea.pl ([46.242.128.95])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcHe-00000005MPb-3F93;
	Sun, 16 Nov 2025 12:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a0Kp4ncgXY6sTHdsDfmoXcWbE0QEKFtuM3FlNwmz7Co=; b=qbBlijiXNWZOheJ7PwgvqkiDCw
	7snZxi04vTfyb2uXMKsVmUgImMnwERrGXsmjV3QjJfIQ8FTfo10PP2Dt/VzePD8CTCkHXZMyDTGSJ
	HhSuqfvBu3txtITmW1XuEk8sRwzZBiB2ay8nnMoIuM2i1u9kJcboSQfvo4lGsTYGgUKuLzBZ+3Ych
	cdmq7N8LkS26azsHRhJTlaUwrkyNmJPe7O1daZkmi+xwmf8VGvnJOz3F3VVcaWdTRHNEjRlKVwBUa
	7ITlj6K9Wrqyts+KP6wm4g4u721RHos1iSw4k+wzEXpii19yugg8LAnbnDsVfiUrBQdkh86b8uDlp
	qceDUKtQ==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKd9F-0000000FXXt-0z9v;
	Sun, 16 Nov 2025 14:50:33 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v3 6/6] riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
Date: Sun, 16 Nov 2025 14:50:28 +0100
Message-Id: <20251116135028.447614-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_125510_945821_6CE83980 
X-CRM114-Status: UNSURE (   8.22  )
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

Add LVDS pins to the PIO since it's now supported on D1s/T113.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 78aa61607..c4ce809be 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -108,6 +108,15 @@ i2s1_dout0_pin: i2s1-dout0-pin {
 				function = "i2s1_dout";
 			};
 
+			/omit-if-no-ref/
+			lcd_lvds0_pins: lcd-lvds0-pins {
+				pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
+				       "PD6", "PD7", "PD8", "PD9";
+				function = "lvds0";
+				drive-strength = <30>;
+				bias-disable;
+			};
+
 			/omit-if-no-ref/
 			lcd_rgb666_pins: lcd-rgb666-pins {
 				pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
-- 
2.25.1


