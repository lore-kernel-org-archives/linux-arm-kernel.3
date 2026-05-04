Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B61CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/yKHq3c9e3uGgpl4ruRXjj8z5brLv19LBRwYLdjeLQ=; b=c24bUUUWORrmGiQZupxOxaIc+X
	JDZnegktg7KXwC5GIKUirVFEkYApKCoig/XGb+JzUYgezWq/Uw+ZjqkjsXpCJe7Bzx15Wq/yk/h2r
	RfvJrqsP2jQgMxnN2+sSsFl5LyfVrrnG85tQtsT8yJgyW+aGnZaqQbJ8226GktnKnizE2aYiseiCD
	TH48yjOrDk36aOYr9PsngajnhHs2d43fae3AkG3a+P4oKcChaWit3e4Yup6qY0/Zpum9cWWD8v6Qs
	qOGIQCsJUwI8TywIWJpAP/QhlVtV5UOnw5Te0qu093ZR55cQctnQTAfCHRmu2YQDppmVqLckWr77y
	ak0tqaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2E8-0000000EXcC-0OZd;
	Mon, 04 May 2026 22:57:24 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2E5-0000000EXaG-252K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:57:22 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g8cV744Wxz9tkd;
	Tue,  5 May 2026 00:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/yKHq3c9e3uGgpl4ruRXjj8z5brLv19LBRwYLdjeLQ=;
	b=ySQjWAue0Z+TzXQS3SWwW2z05fUQflSyVjnt+i5s60G17B7hy4rcYz2wtj6M0Jy33DPQ/7
	EwROhqz+Ox1NbxNmEfj40EHpAIhENAQJHK/FO9t+Z5HX2phiVGcQAUr6fGegJBwV4K+roR
	QVgRfXg1gyd5C4SidQaIVR0yxiQFY+fY4uOblDrcB8aGJ/NN2sb3HD5bxG2+TmzeeIpVZk
	tU0sTtdICnn/e0EN5xaFqazQcN+N+SSF1YlwPQHKA6ZQhoVub806vnkoUW1WtSAFoMZDAn
	XnzmZ8CjXxrflUe+C78wFKP9Brvz94KzIFb3uJPI8oGvLW9FsnVcSfz+BBn/7Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/yKHq3c9e3uGgpl4ruRXjj8z5brLv19LBRwYLdjeLQ=;
	b=LxzZgGdpNXRN7KkzOGpUWHLwwLQRbrq+vsHJ6YGe5p9mDn/SY10DQhaNQDuSKRirv9xEaG
	2eyoOfIz3dn4OCapg/r48v27mnQ8Rk6L9FDeb4WDjjCmzaNOpG+p/hGe6UtCofKnF4McTJ
	UJWBwL39nTmuIuLo/auTUY73D++Wqd3Tsf/oTSunJFRpQSTp3IZzCruM734Ytw0+4hc6iR
	QUnm6N+ujry9tDKN4ppNmH02gdPB9UxE1waSYdgXjdQapvcc57t9s853wZFZgGjYHxOVVo
	LuIRGEjAeKX9Re7mH6Obd8ybqu1BUuN7VH1+s/myAXPASrnYdO7EJExvmKsMIg==
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
Subject: [PATCH 4/5] arm64: dts: renesas: salvator-common: Rename clk-multiplier to clock-controller
Date: Tue,  5 May 2026 00:56:54 +0200
Message-ID: <20260504225704.115125-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: bu4mjmjt3nfsrmw4q3j17h6hhuu4f5cq
X-MBO-RS-ID: 4dcc9fe492346b65882
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_155721_678959_FE8D43ED 
X-CRM114-Status: GOOD (  11.18  )
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

Use standard clock-controller node name for the CS2000-CP.
No functional change.

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
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 0b29bf9564eb1..b1f56efe25d9a 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -507,7 +507,7 @@ ak4613_endpoint: endpoint {
 		};
 	};
 
-	cs2000: clk-multiplier@4f {
+	cs2000: clock-controller@4f {
 		#clock-cells = <0>;
 		compatible = "cirrus,cs2000-cp";
 		reg = <0x4f>;
-- 
2.53.0


