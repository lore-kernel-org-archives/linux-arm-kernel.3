Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F36FAD3E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 23:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eeYPRnU/QJypIfdTFPZeqTjC4sJbxZIBwyOo8+Te6Y=; b=Z2bAYLWGGUSJ3yr1cVhw4WIlm4
	TOVSDnxDQsOnRHIGe/N+msDFpjM6Bnw3ebxsFiL9vZ/l1AGJjTR2im3PpRzNWkJbed3z9qWy1jfk8
	7hafKzjl+yF5QEpof1++WfBCO8znNm1xS0o6NRKIozBmzSTaYVrBgw8Oa4I1k0LLDW/SA9qW/NMc5
	PKvdICCsR1t6vhsWYMfh5a7diD5NZIrw6Ro93xWMYUDV4zr5EmW+JEcbDC3OSzHy1CEnkg70Ddn2w
	S1CufuWzd87K+6Rk9hUplUgou8NW1idI36PTt7MQlfFzG0/iq/9B5FeLU0rTTAGbicfmFsbxigTXE
	OiJf+pWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFh90-0000000AqQv-2diY;
	Wed, 22 Apr 2026 23:38:10 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFh8v-0000000AqOI-1klS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 23:38:07 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g1Fyg5d2Hz9v66;
	Thu, 23 Apr 2026 01:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eeYPRnU/QJypIfdTFPZeqTjC4sJbxZIBwyOo8+Te6Y=;
	b=PdPRHJh16kQFMIXqoaedSarcFE8fSjnTjSqyOYuPuUFGOyW/g2e02TsaY8s6OstGzXhWEs
	MpYX7C7o3kZeINGHramjZVmTQY1sihy9wjuTl6Gf+ZBXCMblK7QLk4tzrGtj+Zcnazib//
	kbdQBQSRhxrEesQQykLBm4hKsCA4r2Y5FjuIDaujgCO0KoJOT2hUlOWvoKkLjv//5iPD9X
	VP/73QzV9O0oAg+P3uvJN6IOhFB6w2dUTcp8QjN2A+DphngsMojZppx9lwVXs4sSb4evQ3
	SH+VTBbb+e/RQggLJdO/AMk7ph56e+hbqciG/czLi6yvgBEWXh50xy3F4uLAqw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bmm+Ru7o;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eeYPRnU/QJypIfdTFPZeqTjC4sJbxZIBwyOo8+Te6Y=;
	b=bmm+Ru7o6N9v2YAgW/gLt34gDgdnEgVgZRQXXvx3CGl6yQzlg1+nqIWd1IepZuGyMD8yQ6
	UHVb4aCn1IuCO7sx+Pmyqai29SwFwa75Fwl2zkuDprtowlPqQzCmCqoIjp8TzmR+5Ncg8H
	Qc93NIYHJ+OsYIJy5xp55eMVTMUPQVeCisvCU0Xy/yMl+MNf48SWXgeb5mjwuQ3u10leCW
	8EB/Aiw5YvtzGYxxnQxUnpGjzbpqx5Th8WvtwVNJmlfpgKBTJlFMGJ78kSR4gGWGYRXtRD
	/T598fJ7BndTlftPbLYjlJfV1nQXZ2QC/X80hrt06r0AFbAGHzlemRZbXhWXKw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
Date: Thu, 23 Apr 2026 01:36:29 +0200
Message-ID: <20260422233744.149872-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 426a47f61ea95f5de91
X-MBO-RS-META: eruduow9rsrqtoaz9dnudiniyi1rdh81
X-Rspamd-Queue-Id: 4g1Fyg5d2Hz9v66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_163806_192378_C82A2A96 
X-CRM114-Status: GOOD (  12.40  )
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

Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
These clock supply the coresight tracing modules, PTM, TPIU,
ETB and replicator. Without these clock, the coresight tracing
can not be operated.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add ztr/zt clock at the end of the list to match bindings
V3: Keep only the trace clock DT part here, extend the commit message.
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab47..f7136db7a2eae 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -553,7 +553,7 @@ cpg_clocks: cpg_clocks@e6150000 {
 					     "usb24s",
 					     "i", "zg", "b", "m1", "hp",
 					     "hpp", "usbp", "s", "zb", "m3",
-					     "cp";
+					     "cp", "ztr", "zt";
 		};
 
 		/* Variable factor clocks (DIV6) */
-- 
2.53.0


