Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBEE10BA438
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 23:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3E5laNUcpyFi0ktqHAkYL8SAWhUJy35oJrbXxzqXko=; b=LAPJ1e7U/jfcjqSTey2CCNrHjG
	m+l8KVV+wUraMB8KEHN6sjLAk96MdQv4u8ecEZurdCgN+znkWAtp4AKx19qyQwCwTHaS5CW9pL03x
	DeYwPCKWUCaYpkd0fS/IjoCtqa1XB2G3S4sk5n6u8nlIVGLbcX/Qfb0aDUY54DuQwMYnEOtbt9V12
	HY/Xw7dqU8j9y3qyI+IQ3VrmvAm9D0o0cIkts/dmfEo5ybMKJbcqhUqIKkp3Vbxc+HBZban+eeip7
	8gcbo8XINDcteQ0AjHYOnO04Pu6oFSdu4qtTyRqQ4Sw0ZE7ai+mh1qADTqTLV6b1SHWud3F2qphBr
	agTXnu1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Gpg-00000008KW7-2z0q;
	Fri, 27 Mar 2026 23:43:16 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6GpW-00000008KSO-3Bh1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 23:43:07 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fjHJT0x0Vz9tCf;
	Sat, 28 Mar 2026 00:43:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3E5laNUcpyFi0ktqHAkYL8SAWhUJy35oJrbXxzqXko=;
	b=xoZuuRCxpHJ/LUkuonsdBniJu2e6To14l1PU2ljul7kl5ggRyBfhn61YrXEj5j1YUQBI94
	aYswbRQCc8YKLUSi6H29wi3H4pyY/AKCXiEkH5egxOsPfscf996gQhHqVYjAvAx+w1tI+A
	GK1U0mMhY0RJL11ubjX4HElVG5/2ro9iBEThCsOiUTK81YiidvhkIqu05JwwS5RHgGlCgp
	LXLdtESruqqiYXrk+YRR9Q8+q3bdEsQCqhUqP3l3MBvCdQSqf6HOymAFyQrfkbJJa/oz91
	zXS+F2q7tU2MCgvAaEcnRV+EynAS3gZYxoQn0IcPLCjsmHWdvW7/AN+UZg9W4Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="Ocx//wCJ";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3E5laNUcpyFi0ktqHAkYL8SAWhUJy35oJrbXxzqXko=;
	b=Ocx//wCJNTe/96KNqIJTGxh9kYf2uFXhFWBI0OerYoKIyUfmPMU303TfWaHOkPj0NrsDcs
	NCB+JyC8eEy5PbOXnSjwq+5CVqv3ffa/BIUrii14tfisPuCS0LLtCJ4ZoUQ1FMQBIvKZh2
	UMQNomjd8wG5yDctjWMMYLg2pMMtOAEy2yTNfeW+DTHADEyjgX8OaCio10z09ENrMVaWGI
	hyT/YlgnVvcR9k7CPClyTphfoLzOwdcjBgCkDBqlOFq1gtAl0fqram6KvvtFw7mMAIQJHu
	qTsuLVNXQhVAsUAevyEnFFHOIGInaxk0/I64CHYxoDekNFL7GHnevP0EpSyVCA==
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
Subject: [PATCH 5/6] ARM: dts: renesas: genmai: Drop superfluous cells
Date: Sat, 28 Mar 2026 00:42:10 +0100
Message-ID: <20260327234244.91707-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f613652e2bdcd2fc051
X-MBO-RS-META: kup5x6brydqqhymerna9ezdeyksad5g5
X-Rspamd-Queue-Id: 4fjHJT0x0Vz9tCf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_164306_964335_4B20975D 
X-CRM114-Status: UNSURE (   8.61  )
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

Drop superfluous address-cells and size-cells to fix DTC warning:
"
arch/arm/boot/dts/renesas/r7s72100-genmai.dts:28.17-55.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
"

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
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index 3c37565097145..da552a66615e0 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -34,9 +34,6 @@ flash@18000000 {
 		clocks = <&mstp9_clks R7S72100_CLK_SPIBSC0>;
 		power-domains = <&cpg_clocks>;
 
-		#address-cells = <1>;
-		#size-cells = <1>;
-
 		partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
-- 
2.53.0


