Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D99CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 21:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VX5p8zL1uHRFoHX//z5NO2RcC15Azw9VhUq1BP1qqKQ=; b=C6J3F9wMMNcIUAoKTqaEMmb/c9
	QpKOl1RfTmVvDX8n8pp4qvzQG+mh3lwKIXsEqh2O900+Y/+eZb1TeCYHQ2XP+WnFfQxV909n7w73/
	HZdwyp0Tt/Z+CJ7nw/VzfdMQgcm5lgdTzK9aGUmoM0G7r3f6muetn7WW0Lroy3oaHS983UrXRvbTh
	SsJerVqJj+xWkBsykBl0Yzvk8Z9WXOwbQvoGcPsxvIopKzReeFHPNQ3iHN6yBNVDyr+zV7P1ewssK
	Y3RrJdNFLpVIzxWXmBUEal3FCZLHALDzQAj6tA/KDBHtVBvaJG011Y2u4GX4QOnEFQwUMugU+luFD
	5YNoqZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUWe-0000000EmFl-1qcN;
	Mon, 27 Oct 2025 21:13:12 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUWb-0000000EmE1-0EyB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 21:13:10 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cwR741SHZz9tV5;
	Mon, 27 Oct 2025 22:13:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VX5p8zL1uHRFoHX//z5NO2RcC15Azw9VhUq1BP1qqKQ=;
	b=nB3AZRFJnRbOn7MWEz/PYzCCCcly8xk8w1Xn4YxKDdrdvOyT6Ex3XnINH5bht7ATJzJn3k
	6kQ3BhSeWFzpEDaxNJhJR4ZTfHkYWzLU4Osz8OcXl4qD047BQ3FwenXp442kl09TvFsUAO
	3y1iPlDNdEdVcbbITwZSXarbqImRK0ugItsAcMvCrPUK0B9zz439OEnDvqtqw0BGuKbkX5
	9iBAQXHUFCz66v0RHnVwAl0ClZTocpJhMUN2G1wcCwe76aWiLWCb/QNPrE/5gzjb1Yi+ls
	wfbzTnX1akNXj+DeHkkXAuwKV3I7epgPSIP6GjuJZoVF3sBmtS164Djy9vohHQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=vBbfk6Jx;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VX5p8zL1uHRFoHX//z5NO2RcC15Azw9VhUq1BP1qqKQ=;
	b=vBbfk6JxkcLq+3cBugcwFp00zIWoZ/OSdPt8QiaFfKd4K9o7rABAhnUtdLDIzDEBN7zDhX
	9miC7VMspHXgzMMfRrigGulH3IOzfaPGU4e3oS45vNs8xZ23App8y82f6z4DOzDuQM5zWh
	xRxGIDH0MBi5v0EidEqCYvXoMP/RTqqVY3QLT4E8KMxdTC/qZy/Z+pKpeqEyS6ALmgK/AH
	f7W+B2iwGYEZFsysUpbls6KME9AhuLaVD1hG5eaT4YVD6gvQHxog9BlRhVOEtduSAA2la3
	o9nLsxqdjQTIVqHXTgiZHiywwZEL5HmWH+dayQpMnNwJpikLS6/fyr4xs/9dMQ==
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
Subject: [PATCH 2/5] arm64: dts: renesas: r8a77960-salvator-x: Enable GPU support
Date: Mon, 27 Oct 2025 22:12:18 +0100
Message-ID: <20251027211249.95826-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b8767696b4374a78141
X-MBO-RS-META: w445uu5k6uas8arw9551891xcojxmg87
X-Rspamd-Queue-Id: 4cwR741SHZz9tV5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_141309_245063_F2C0155F 
X-CRM114-Status: UNSURE (   9.66  )
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

Enable GPU on Salvator-X with R-Car M3-W.

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
 arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
index d5543f26c4720..0d5c754a7f0ec 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
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


