Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F07DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 18:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWPyxXiCkwOnhKHSaSoDoMa/Yg5EsjWRX7PpMHjDx1A=; b=pC7p1LTU9/rwlM/CDn/I+uXZgB
	rddTS6l+xSLj8tuqf7FmF3i8eFF2EuG1ZurQ4rUTVFK0lxuf+nHYmnpgWdzSA36AEP4myynnjSBsS
	0GnbH5AQj2Mlwa5E+X3uUAiEDhJ2vuffOIZpUamFzzKoWs146s5HUxPT2tlGpZDwyLc8yf3MmyHEG
	eYaABkKNEAjZGBNlEEr6cGA2k3Yf+jhITtrlpWRAz65GU8p0qg5xs4r1zjInjJ5XEBpxkVaS++3Kr
	wK4vcKk1pErtJh+dnR5ipWBIgkRjcI0PSsUi0dVsHZBSbKWYfdc1dHrGupR7lmHKmIDPGFuJJJ/sx
	RqZEk9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJFVk-00000009WUJ-1hHo;
	Sat, 02 May 2026 18:56:20 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJFVh-00000009WSW-1Fpm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 18:56:18 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g7HDv4nwqz9v9S;
	Sat,  2 May 2026 20:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWPyxXiCkwOnhKHSaSoDoMa/Yg5EsjWRX7PpMHjDx1A=;
	b=YVdQrB+om9uC2e3vVJd2BjX+OF/PMUiXZHTD8jmdXRjyBTczm/M8bKdFDxryGiXTu1t+56
	l4TWIhP1ahgw3xOJKKj317CICpCIScuRmjFb9Ao8t8t26GfbFf6s5zo3V17BHp/q/yaVsP
	hsLfT/52ntjbVSVVDD6fbgk0MzJm9Xz0lkFN935OBP89qaYtS90hfmZ1+5SVz6eN63wkgD
	axl4p4pJJRoTGmUgyqbeZMIdWriI6XsbU5+WIsAeCNnWsr1exf0b9FPZJBMb/kIX+A9v2h
	2R7PyL7Otr7ZGdsGHJ8XiU8tmNx1USarNqQEKhbgs7NuEcvgbhg7w5FoMlBRWA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ZzJzH2az;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWPyxXiCkwOnhKHSaSoDoMa/Yg5EsjWRX7PpMHjDx1A=;
	b=ZzJzH2azs3XePVSz0TiOtm96vSCQdPFdxDJQHVi4kaIkcAWp0TJsa9WI4rNPPrPP51wEre
	g0JD46ucn1DyDZLEkyTcsYRqXsjo1OfW+koLLJTJ7Tur2gygM5s0y3Ec1KBMHyx7CcVw+u
	3F2yVFgbSQWGTd9Vv2/ctTfrAfkMXbriVZLnvNm8bb5eG4N5gEn+W1mE8hGLXfb9zw6wtF
	SEPpaRVsjQ3q9z3hSBF/Td4nS1XlgNBhbzgONzV+rqi5hvUpnvDRFIH6lmgA/Hwt/5z/1N
	cpwdYrur+6sUxAvslN27sOPkmhn6UXZg/0V2KAOIn7AElpvGZ2zMBTEKLBICAg==
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
Subject: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock on R-Mobile APE6
Date: Sat,  2 May 2026 20:55:43 +0200
Message-ID: <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: mtfzoxzo5jjun9hht8drgf8qwto6dswn
X-MBO-RS-ID: 6efcc919c2efcb2ece2
X-Rspamd-Queue-Id: 4g7HDv4nwqz9v9S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_115617_480911_41405152 
X-CRM114-Status: UNSURE (   9.32  )
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

Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.

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
 drivers/clk/renesas/clk-r8a73a4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/clk-r8a73a4.c b/drivers/clk/renesas/clk-r8a73a4.c
index 7f47644396e6c..11b387f1ab30a 100644
--- a/drivers/clk/renesas/clk-r8a73a4.c
+++ b/drivers/clk/renesas/clk-r8a73a4.c
@@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
 	{ "m1", CPG_FRQCRA,  4 },
 	{ "m2", CPG_FRQCRA,  0 },
 	{ "zx", CPG_FRQCRB, 12 },
+	{ "ztr", CPG_FRQCRB, 16 },
+	{ "zt", CPG_FRQCRB, 12 },
 	{ "zs", CPG_FRQCRB,  8 },
 	{ "hp", CPG_FRQCRB,  4 },
 	{ NULL, 0, 0 },
-- 
2.53.0


