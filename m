Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F5310BA438
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 00:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZ2XWEV2FATbgEJyCNwydDCXXSAIds9YSXBHTGFZU04=; b=wV9bb1yLXbYljivaQmuIzvW73p
	e5p0Vxe2KJn0g6tZyWCoCVKZppwVxDaEp+od6jWU/geqEcSqvcMimThXuEtMzEOZRBErwP7/ZELpf
	TcHbs8QYSg6+FoS3XQIBixU2krFzXtLurpbeQ/DUfpBOAZFjcYgejOh5HHWW65J7WjOk7muIp8Qyw
	ntJYo4aCU8VqKJfNwZy2tVqKYH3uaCRSfXYJgECaYULjO1ZPqA6aV/Aik8BYso3g39TxME6VykObh
	e3VK/akTSi2czhUZalwlZcUcoaDT+v4W0LQl0SM4VMD+F5xbVwEehHU+xbOHGgLSNsqqkNz1DzO8z
	ZhUlrApw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H6o-00000008Lg4-3Fpv;
	Sat, 28 Mar 2026 00:00:58 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H6i-00000008Ldk-2Fbx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 00:00:53 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fjHhy355vz9tgl;
	Sat, 28 Mar 2026 01:00:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZ2XWEV2FATbgEJyCNwydDCXXSAIds9YSXBHTGFZU04=;
	b=JWj60bgW5y69OqXlUkH5KnshgLFHI6ITvPjSswGdv/yE3RzWAysNq7PdlfnnhhrZng2JhX
	4sxvS/meOs4VjJRI0Zh9iUncKkri6u4eZpu3iqPaEUySi6aXsR4TEI/e5pChp+wzx1ls6E
	UqD0stLHcMdV26My2BNyuUD31L+DDmkYJT2aKN/oqg77BgVDdzzn8hLXzyIJyTNJ5O1aBq
	0d4DyoQZjUd1X66xM3gJcSsQVzYBp8EY9mFnN6SP0/UyPUkdyzSigzJY+WqwPTMGiDI2Nn
	gZJZgWOQ3xe+g+CR5002C44ZoNMBfmjZGAQ/eKqnVeKYWb8F5CsS1xiY16xD0w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=gmhbv5g+;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZ2XWEV2FATbgEJyCNwydDCXXSAIds9YSXBHTGFZU04=;
	b=gmhbv5g+5wIwkyCuW74uvfEcHLDJvV4hdMK/jFAu7SoaCeXoxBAj4jr+W9i6jBSSfBnShZ
	Hyp8qv/F/zVtqgQwOLAUaOa3aP7tTkfXRssu/uCg/T8Um1sKvB2+wFe50L+/zTvfJcMIY3
	00yRO+keX589pNaR501gzXvsodU4FsJsgxYDBG1G3CyPt2Ji3QHw9/UX8YRokZATpKfUb6
	I2W0mHKxGCYznSY/euVn3zMkQPTgJdTiQMNSp2S17u3GK+A1CCpQe/mYIXrt8BZ4K7f5iy
	u3RN+UQDjgB6qD5M10klo05tADgN3BAUp7VVesDWuweqkYOpteiHrYmFY0RDQA==
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
Subject: [RFC][PATCH 2/4] clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
Date: Sat, 28 Mar 2026 00:58:19 +0100
Message-ID: <20260328000031.94645-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qsz9pumjndg8z8ztm568pkzihbkix5cf
X-MBO-RS-ID: b94a82c6cb88c768f2f
X-Rspamd-Queue-Id: 4fjHhy355vz9tgl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_170052_720664_AB6EB178 
X-CRM114-Status: UNSURE (   9.85  )
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

Implement ZT trace bus and ZTR trace clock on the R-Mobile A1.

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
 drivers/clk/renesas/clk-r8a7740.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/clk-r8a7740.c b/drivers/clk/renesas/clk-r8a7740.c
index 635d59ead499e..31a79674583e8 100644
--- a/drivers/clk/renesas/clk-r8a7740.c
+++ b/drivers/clk/renesas/clk-r8a7740.c
@@ -37,6 +37,8 @@ static struct div4_clk div4_clks[] = {
 	{ "zg", CPG_FRQCRA, 16 },
 	{ "b", CPG_FRQCRA,  8 },
 	{ "m1", CPG_FRQCRA,  4 },
+	{ "ztr", CPG_FRQCRB,  20 },
+	{ "zt", CPG_FRQCRB,  16 },
 	{ "hp", CPG_FRQCRB,  4 },
 	{ "hpp", CPG_FRQCRC, 20 },
 	{ "usbp", CPG_FRQCRC, 16 },
-- 
2.53.0


