Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FD1CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q5sgeX5AyLeT+1VZ60Gw0MBxysG/L2+LEnpNf9H64OI=; b=X+75HNOOzmGmUpZHKyY7IlXTyr
	9lQEet2YBwNTdyW0/7n4FO3IPzgoM3FbKq2rbPgm7vrh7UIgcDuxgaGvUelHqENWPfCbWriOzz4IY
	MedbWkmy+hR0jZMr7Jfuj2wE8WT3CJPrIdLYWwQzhE/dFHP4k/rwBglg+iDSwO0Yr9K3Cf+WYEwvb
	1LdJZEEn/RuGVj41igQ3ace/Ks9l7oi50u43KYPbt1QysEX95LcTEJ+Fpkwh4Rx8BihG8Z5rxMRXT
	sxyGJ0mn/ywPjN4sLIG7mLd6+ml9xpLhgSlf5NDImx+7Ck/PTc2PDy2xbbbzX33XH2pTohe6vJFro
	Ce313Qnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAhh-00000000EIh-2yWs;
	Thu, 21 Aug 2025 19:12:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5MJ-0000000H3Sg-1c0N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 13:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1009145BDC;
	Thu, 21 Aug 2025 13:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CAEC4CEEB;
	Thu, 21 Aug 2025 13:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755782978;
	bh=4lsn6zYQJrvb7f4Ds42ABsF1Tgx+YnLe14EVYJURbf4=;
	h=From:To:Cc:Subject:Date:From;
	b=cFlrrDYkAa5RI82Aibh3oOTFJJUwpJAnbeBK8ZlUveuAF5lpXvtZkOFrIQ8G36aph
	 B1mHna8bFKp7d/W+Y/HC/L0iBVQYjc5fkXMOguDnO92Fjij5fgcQem31YfI7Bt8cCE
	 Ekf9Pam2R0uvLRrZLRVxnLs6s0hflTa0qg0I1+8rvVEpRiiOUZTmjVaF9ClIIGqQIi
	 egaUTDBdrm7gM8w9sbCjXIvew9GZteuyCXw+K6rME3MkHvj5IYT4GluPppTeqGdQyB
	 zAk69i6F8TAY8sA0XkRjxIJxaZd/a7oQCAXVAnmIvkviPs1Oz46y6/O2i4IvEfikyR
	 AyHcDNzaYiAEg==
Received: by wens.tw (Postfix, from userid 1000)
	id 48ED65FC7E; Thu, 21 Aug 2025 21:29:36 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: t527: orangepi-4a: Limit eMMC clock to 75 MHz
Date: Thu, 21 Aug 2025 21:29:35 +0800
Message-Id: <20250821132935.2070398-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_062939_441991_6FB20F11 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Chen-Yu Tsai <wens@csie.org>

The eMMC on the Orange Pi 4A doesn't function correctly at full speed
of 150 MHz under HS200 mode. Either the traces on the board or module
aren't great, or the SoC's internal delays are incorrect. Tuning the
pin drive strength did not help.

After some experimenting, 75 MHz was found to be stable enough. Use this
as the maximum frequency for now.

Fixes: de713ccb9934 ("arm64: dts: allwinner: t527: Add OrangePi 4A board")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index c52d09cf0888..fb5311a46c2e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -160,6 +160,7 @@ &mmc2 {
 	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
 	non-removable;
+	max-frequency = <75000000>;
 	vmmc-supply = <&reg_cldo3>;
 	vqmmc-supply = <&reg_cldo1>;
 	status = "okay";
-- 
2.39.5


