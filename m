Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23F606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gv1iZ/87;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JpA9gJyo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mQOx6HS8CU3hpibYskJJDo+5DsA8upMR3dJoAyYpTE0=; b=Gv1iZ/87jTTiv6W8VyUtD8cfU7
	EWLiC/iQf+KhKHv8m9nkHyKLcp4CmtWKOqhaje1ZvgdQHSpT3HPo39NQ+BJnQR1iKxmLeQ9c2xmLf
	68Iar6TyA7aI1JuXDvckm6QibNLPkyP7TUj5XNBQdkcB2ER6UtA2LW5ENTzFGj3CGVt2bqzh3kBXv
	qOdzbZwdUPdlqp9bnAgEOOLN3J2R6shTnzJEZ6Hx8rVSZfIRwSbu+PkWZZT30ENyM9+9pYD2qPN17
	3+8Iwc5jyQWgj8wnjTSB12/6kfFb5OWniUdvD/VCQQdTmfZtz6YM4zP5UIYqMcBuT6Aa8Xmvhjypu
	878gn4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFcZ-0000000BcoU-28OS;
	Fri, 06 Nov 2026 08:48:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFcY-0000000BcoK-04Qy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:48:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DA4660204;
	Fri,  6 Nov 2026 08:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F91B1F0089F;
	Fri,  6 Nov 2026 08:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954904;
	bh=mQOx6HS8CU3hpibYskJJDo+5DsA8upMR3dJoAyYpTE0=;
	h=From:Date:Subject:To:Cc;
	b=JpA9gJyoaq2fhn37Ehwes6wNKqHiDeHmO9T+HIUdNqn5Jn9+28wls/1ii3LRLgnrP
	 XnUqG+R9wRkRecC3WDBsa797KxitZqLANFycq+xhlbwUxjlttqCs3NyftjExPGUlSV
	 cN/IfhStJevgDyXsCYLklCRuPDN9TWtsBNU6H33cWBPMnjMtbwkYNmKqa0Tbp4N6ik
	 SwlvLrtL2jTApPEFyKUtRWIImnKPiqBNOEJVCHJq9FHwL7UsOwX2yRwxNOLjd4pty+
	 YYyyJ9nF67rUBJKrjbwjSF4feKnUFxBQ5hdt70xelYm4zP8sismfRvWQQ7M95Ny4BV
	 08j16/vEPe28g==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 06 Nov 2026 09:48:21 +0100
Subject: [PATCH] arm64: defconfig: Enable the TEO cpuidle governor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-b4-arm64-teo-defconfig-v1-1-5e3763385f89@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqEMAwAwK+EnA2YUgL2K7KHalPNwVbaZVkQ/
 y44D5gLuzbTjgEubPqzbrVgAB4A1z2WTckSBkA3OmEehRZPsR3i6auVkua1lmwbLSwsMUef3IQ
 D4Nk02/+N5899P8m/QI9oAAAA
X-Change-ID: 20261106-b4-arm64-teo-defconfig-b1616afa4d29
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
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

The TEO governor introduced in commit b26bf6ab716f ("cpuidle: New
timer events oriented governor for tickless systems") takes a different
approach to idle-state prediction from menu. The governor gives a
better behaviour than the current default for tickless idle systems,
and for the multi-platform configs that enable tickless idle, this
should be the default governor.

The arm64 defconfig enables NO_HZ_IDLE and ACPI, which enables
CPU_IDLE. Selecting CPU_IDLE_GOV_TEO suppresses Kconfig's automatic
menu selection, making TEO the default governor for this tickless
configuration.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Prepared with OpenAI Codex assistance.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..fa99d62cda0f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -93,6 +93,7 @@ CONFIG_RANDOMIZE_BASE=y
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
 CONFIG_ENERGY_MODEL=y
+CONFIG_CPU_IDLE_GOV_TEO=y
 CONFIG_ARM_PSCI_CPUIDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261106-b4-arm64-teo-defconfig-b1616afa4d29

Best regards,
--  
Linus Walleij <linusw@kernel.org>


