Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80A5CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=no/zMXF3o5yvFJwzzOab3IhyPOuWdzG/Yy0a8t6IGG8=; b=2AIMC4LDbhBtDedF4VGQ+MxkVl
	W4/Cb8/43ZB/QBD9248CTeIRxUqN/sdK+odhHy8NWY3USTWqRHjZ4P1rfmCafEnFqVHbJ1qlhY/CQ
	zW4nNM5cG0J1sOTzkFvvIMsdbQuA3HpX+x9L3l/7hyNDjfm+AC9WrOJUHIaPQ6q1N/xZBjRuKbxYV
	MLMzugMQZ5UDz1iD9/JFib4KF3l3f/AoYkwEENXf6JJc121EV2NBMjYoJZXU3kP9y2YFHa7fzgN7N
	KH3Ok2Eo5fyNeotn9VXvexeph9r5RId1ilwrokMmms56kDfmpDH0V+R+S23FX1BxDYBKL9UnJbf+P
	CvRO+Hag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUWe-0000000EmFu-333m;
	Mon, 27 Oct 2025 21:13:12 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUWb-0000000EmE5-0FBh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 21:13:10 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cwR754hfdz9tJr;
	Mon, 27 Oct 2025 22:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no/zMXF3o5yvFJwzzOab3IhyPOuWdzG/Yy0a8t6IGG8=;
	b=xfqSMXBdB0bmkcRQzaOhJR0holqP0YcGQgji+5UXFzOXYnHDY5OaToOZq+kNOKnvF4mShb
	h5Dv5KsPb6AdECFkpBhzBcb+a/IhnTEMWnTpx7r4PltbwrORnldAuGD6ipPYOq+8bdUTVY
	ZqKy0wB22nIhS1xnZ3f3EIewvASWZYeZlkduaGUnz/xwrEX5nvHQ0XZwwuwJ0wht4mvsuY
	uhZxzB0lQeB96/3k/uaUa9GZD9QXp8AUZTayHHew2M9dQIk6xgCMKPcfmshhOj6li6Nu8d
	EBOM2EE0juWOxwk8iiM8KYQerBGi1euC9HEj+AILrJkxshcCsFYNPJdsCbX8fg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="iMo/4nEV";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no/zMXF3o5yvFJwzzOab3IhyPOuWdzG/Yy0a8t6IGG8=;
	b=iMo/4nEVPnAHoFBvMZxLxriIocmKVIiWI+ZX6Vd+oPavtj9mgIqVH8Cs1rfKupZS3svJal
	Hfty44l68vMYM7ACYcnsKs4hlGuxLXC02c3SNGKaISbxbPzEgiCH/s8I6H4CktHJ7cgnCo
	GXiilmhmtFEWFHBH52P06B2kxREcHsOmjGQmILaYCIQG2pKe7OGN685ZCYl3flyArOJgmK
	dl2h1aK2hjL5HDHQi/Cgy8npQCclhDkKqKSGuFqIJwgoA42/+MfVKzc24AsvdYfRwnCrPy
	XDt9dYveCwZriNAYGNk1FugVBPA1Zf8sPc5xQ4WqdFgYrqygGZXyPArtCZMwXw==
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
Subject: [PATCH 3/5] arm64: dts: renesas: r8a77960-salvator-xs: Enable GPU support
Date: Mon, 27 Oct 2025 22:12:19 +0100
Message-ID: <20251027211249.95826-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5d20bb82f03ff2f556d
X-MBO-RS-META: sxf6yd3g614zbdfbkmac5615tgyw3di1
X-Rspamd-Queue-Id: 4cwR754hfdz9tJr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_141309_245015_3265FF0B 
X-CRM114-Status: UNSURE (   9.95  )
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

Enable GPU on Salvator-X 2nd version with R-Car M3-W.

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
 arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
index 9ebb47b6bf2dc..115cc47bb0724 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
@@ -35,3 +35,7 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.51.0


