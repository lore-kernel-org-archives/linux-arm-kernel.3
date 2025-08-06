Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC1AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UKUlbuMXZtDdoyQopCc2zS0fKR8B7Ban5zcHHOI4cg0=; b=NvE4gZSP5hr28a8uuC1ce2Vu7u
	0GwLZT+hLLwcWa9SvLloQk0RtofXaNaVdaxedlGQ0QityL8lBgXOmkMrxxAdcPeBG4jp26RINyuBY
	pdjp1wIiuBf881rhwObSNoDGK9Bg9eTcNxConzvVuxXHEYMe7AbWHrNl4PguYCUPE8rWK6zMkgcaM
	Sc+aeuep1TJBdYqU841A9Ji8P6XfiztRP7I9HygNl+4Vw5IHU+W2WoWl/2y2zFOb13gjHPsEu0SF4
	Pp+3z/BT9guETrKPT4K0gX/tVIpFfj+Bw8oqHGM7DPo8rUn8lE8Z8yva2p75P++xYTvDg71iOm3R1
	rQMnJpbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjr7-0000000GDAM-38KF;
	Wed, 06 Aug 2025 19:31:21 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjoZ-0000000GCtm-2oaf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:28:44 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4by0hS5KyRz9tFV;
	Wed,  6 Aug 2025 21:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754508520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UKUlbuMXZtDdoyQopCc2zS0fKR8B7Ban5zcHHOI4cg0=;
	b=tWYVcs2ZxJ9M/O+SCCEw1KgkdmAT/w9ws32Sx8lgOC1kUi8F9l+AuvWd0Q9qkI1/RiKCO1
	3F5L3QR+Jfmy2TvhmdlAQ7LIoVg7RonoL89md4+K2qvH+5m0YTXv2kJdVln3lb6rdmcG6k
	wDqqXvwGZhyJ6AmsILIC4AQGf91lmCBNwditKW1y17CpMcMzwvEyy6n4sgr/srbtJH2aQR
	hToe6BCiG9uElIoRwJkCBNWOCfdOJvNzv2Xp+6AApHpUhhWOMrDITI5egzPrGyY2xCU65c
	0Zf+72wlbMVBBi6I3itoSR6Iq2he/KRSdsgLHw4n7sSsgZsZQ7ANNxFVsk5mfQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754508518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UKUlbuMXZtDdoyQopCc2zS0fKR8B7Ban5zcHHOI4cg0=;
	b=kLnS8gYzAuzRiMLnRGF4qTmmQzDlr4Xy76yPhK50f/SVeJxtysVfzRdq1Wwz9FBnCvxARk
	sdVIChoe+WgYqoldp1Pjca4NcQKczDmOkIm1O20JXcbfUyQ2ZWdq0xE25eXyA/FWyzpUGP
	3pFNA66xd6vNriAj/jXTNhFg0uZ8lDaQU6yciid03uiVqanr84BNqmV93//Xf1Mt7UqPaJ
	x1g0l+kFJ+eK8TT+zKYrH5biBSF1JMLfSsbMCNe94R2r4pHYMy1gTN1T/Oy9jfEHnLDZP1
	3B7KsTrLrxAJUH8+4HJXWmXEqGjTjNI2aO3Kf0Tjdeqy6bTnq53+v+aY8BMGHg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Set VDDQ18_25_AVB voltage on Retronix R-Car V4H Sparrow Hawk EVTB1
Date: Wed,  6 Aug 2025 21:28:04 +0200
Message-ID: <20250806192821.133302-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 312b43adfc86edc3ab6
X-MBO-RS-META: yi6fh4jktfys8o3wk4e7todpkn5d79pd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_122843_856076_A306AB76 
X-CRM114-Status: UNSURE (   9.60  )
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

The Retronix R-Car V4H Sparrow Hawk EVTB1 uses 1V8 IO voltage supply
for VDDQ18_25_AVB power rail. Update the AVB0 pinmux to reflect the
change in IO voltage. Since the VDDQ18_25_AVB power rail is shared,
all four AVB0, AVB1, AVB2, TSN0 PFC/GPIO POC[7..4] registers have to
be configured the same way. As the EVTA1 boards are from a limited run
and generally not available, update the DT to make it compatible with
EVTB1 IO voltage settings.

Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 89c61ba0e206..f4f845801ac9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -608,6 +608,10 @@ pins-mii {
 			drive-strength = <21>;
 		};
 
+		pins-vddq18-25-avb {
+			pins = "PIN_VDDQ_AVB0", "PIN_VDDQ_AVB1", "PIN_VDDQ_AVB2", "PIN_VDDQ_TSN0";
+			power-source = <1800>;
+		};
 	};
 
 	/* Page 28 / CANFD_IF */
-- 
2.47.2


