Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA6BCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 21:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PRunP/YNOJ9z+4AGyl00EpVVMnl0vwiLtCGJcY4k2M=; b=LVF49Z82qAWBsw1vMqZU93AZSm
	+rnIiHuhumnUiu0zOWof1Yx65gMpiHw2SLzOsvoYeQOQlwrpFew6OIuO3Fsa+YUuAz6IlKbh7Qr5V
	QRz+L5PiCOjuiZLylCtupjAYhNLSBfQ0BUHg9aLQUv8uNzYMqF8i3/VRyup9pGIyRoh0eM/FKW7xW
	f+z7e8bNEFQOZbIua15I75P3ue21Q7hxE6l0gKQYTfm2fSejCxCsxawfxEQXXyU4KcLVds+02qQam
	n7r2RBVp1CxfkJWnZiOv/OpwThb9IU2TlDwZ89NGDlwqs7HN1HG7BNCa914p7LHF/fh/PTe2AWtzY
	4Mhkck6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUWf-0000000EmGY-1HHG;
	Mon, 27 Oct 2025 21:13:13 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUWb-0000000EmE8-1EVs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 21:13:11 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cwR773y3Kz9sml;
	Mon, 27 Oct 2025 22:13:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PRunP/YNOJ9z+4AGyl00EpVVMnl0vwiLtCGJcY4k2M=;
	b=CxqkSFXE4PZWN2rCFFK0R1KmtmJ1IGFwxGBTRq0B7Kydpnx/U0dgkmYA7E5ZlWATZlB23k
	cdqPrMWc+peWFPZJR2vkN6EyRtlgxHNkBRIWwdOjM/MPkxUDLXHFlZeFDp2uKyODYVBN3T
	HuKEU109dsEiHM5+RsJg1KlMiyevMeQmik3XhVzMWrxGjTslD7R3ZIoAvXo1Jh9eoVU9qk
	oXC9cxXRUWAYz8OLKPpocwWltkGF/ODXxAOxgG22sPM6y8T/WufOyk7dqHjWvz5o5191dZ
	zZTVJJbLAH/tqEC+hsuCp8lk/LOhAQAr2b1QgMnuCmoaozW3cgpHbZTS6tdseQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YfjuCeC4;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PRunP/YNOJ9z+4AGyl00EpVVMnl0vwiLtCGJcY4k2M=;
	b=YfjuCeC452ScEuIBSG0jAYca2OUyt4jH98dVJ7jAVVNbwBlffaMisYh4WuzhnZAgoFUuTI
	yPV94DaLiDtie21rEWF1aHH5xoxIcR8+//P15YI4baEACYWN3FF3h1r4k3bWv68aeBBIrP
	/Nec17a7x2LSlAJbpepW/Z7fQuH/XrQ5AXP5dMw7wo7uRXlPnix83eipRdLLE81+imIi2h
	NYePCUdgFwVj7T4snB24qELrh9uPZuloQWyciQlQPv7WF9lYEY+xcImg8m55YS4Q6oezoz
	GvkGizJw4vlz5m2srdlP2z/mOTY9iylBzlylNmq00L4nOE+eFyYjIxRMDOWB8Q==
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
Subject: [PATCH 4/5] arm64: dts: renesas: r8a77961-ulcb: Enable GPU support
Date: Mon, 27 Oct 2025 22:12:20 +0100
Message-ID: <20251027211249.95826-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xgoodommmsga7y3kbtdydw16tf14i7hh
X-MBO-RS-ID: 2b57621e4bf0f37ccf8
X-Rspamd-Queue-Id: 4cwR773y3Kz9sml
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_141309_472281_B1CC89AB 
X-CRM114-Status: UNSURE (   9.77  )
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

Enable GPU on M3ULCB with R-Car M3-W+.

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
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
index 70cf926667a6e..0c0806cec6989 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
@@ -40,3 +40,7 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.51.0


