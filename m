Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AB1109E529
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+5gFP7YwrJnFNVXiscxFDwA79x/GURVZ2upvuTJ3tKg=; b=X+Oq96betg0QNzYDATqzxbUxlc
	6ds4ytWuY4ezbIoKqEuqB/BSAHQgGGk8RWSuLmc2uULObO+PryHDUSCWiDkKVumEz2X3ngOCozWkC
	p5QUaYfTJedBAL+GI4wwdyDgwY0H3cBTAgrUB4zqvYif4VIx12zjdl0at3eAU1m9+xcuoOuHwAdxg
	iAq/0vs7+L1uVl+bfrNhVH9uUP77QO/JvgBMgI+rS2YYKN6JmHFFcEaWvSDIKcU4upLBh0wujkOjT
	qZ/KUtBqhLiiiDLovMxliEjRhdFl4ru6opztFqfhJRCm6/HjyBd1TQ44KnhtupQdgnj4JdRPMI3a5
	vfi67AdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cjP-00000004h6j-3IKN;
	Thu, 26 Mar 2026 04:54:09 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cjN-00000004h66-1EpT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:54:06 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fhBJB077gz9tqX;
	Thu, 26 Mar 2026 05:54:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+5gFP7YwrJnFNVXiscxFDwA79x/GURVZ2upvuTJ3tKg=;
	b=ijy2+VTTzT7P6EM3tEbsHKpr+5nQvOG5g0gQyzWVJfP3R2zN1wfDxirOzbkX3qhILrbskT
	A5Lp9YkSdDqjf27+BBwm6xFFBgw9x/4gj+xZzZiBDJlp+Y9GyghWXvzI6vXGGSMsmcVeBQ
	8fHtrj7EnziGnqmvjh2c3metmTJSS98x9OjWQvg1Imref7/cPS5pd0HjEqB8hzFVAwj6ZM
	ehIBNzWIJ+m+ZexoAtic9tga1G1TAkv+Nhra8RCsGeFYbSCbrepZyBgTe9N5kSaTA5Etnr
	EaSYpz1Ko7k26L9BVOs9ekgfUHmVTsTnY5TljSGCOh2h4ykO4heFN5OKSM5LAQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=U2HGUSrY;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+5gFP7YwrJnFNVXiscxFDwA79x/GURVZ2upvuTJ3tKg=;
	b=U2HGUSrYFKbqk7I0TNh65xBq6wWbvxX7dHznfbcRMOjX1hBA2/QYl/lDf5XEWQZtY4lmsu
	pyaIELfa4tlMqLIV701dlWE/GqOcRd+/pJooKSBqO1qjPHij1EF8lU4bNp+UhT8qIxENLv
	xagTwalj0BT3nah9isXVU49ocbpa52sPv4/xaGeWm2e5c5Hd3zOJbsgjmcOmfyqgc50yfW
	k5Uj6KyT8Jt0bE18gAj3GmRIwQdsSocQCG6RPSfotjqGjYcrFvbGtK2l0ENcSw5HVCYhuE
	4SO76ugqtFFnexWxUOIihjQqEyYGl5kX/A//DstfXZF0YN5O10hNmXwnuLiirQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: r8a7742-iwg21d-q7-dbcm-ca: Drop KSZ8081 PHY C22 compatible string
Date: Thu, 26 Mar 2026 05:53:38 +0100
Message-ID: <20260326045355.223529-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: bxrekjewuqupwonyrbkk59ty3i73yqdh
X-MBO-RS-ID: dc97bce3079db75bf83
X-Rspamd-Queue-Id: 4fhBJB077gz9tqX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_215405_483422_D12A9D69 
X-CRM114-Status: GOOD (  10.28  )
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

Microchip KSZ8081 PHY schema indicates that compatible string
"ethernet-phy-id0022.1560" must not be followed by any other
compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
to match the schema.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts
index 33ac4bd1e63bd..c43c08d9ff944 100644
--- a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -85,8 +85,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1560",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1560";
 		reg = <1>;
 		micrel,led-mode = <1>;
 	};
-- 
2.53.0


