Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289E4CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUVwPAQqcPJEXSHcvyrm5SHBCzZnkZ7JUl+/bI5Vt0A=; b=AyAkqtCKeFk27DLvCe8ujHtnYq
	rqsrzdPxa6kGEhNz0hGaFNo6uHrJ63rNeEdbB1k0EBIVZf6g0KooPLA+d+/y0mXA9PE3truOrZm/l
	j2E7aHi3IcLIim1SGj3hqBDMLvKNUB7kLW9s/Ut3oafXQuwDVu7DrFLhhwFqCHkfRZRd3JBfznu7O
	IXyrjpHNZv/hiOBarlriH72szRhQ2YTUHiXWVQHsa3az2I+a5H4WdO0mmVFLlDFgw/ethrUI29XtO
	R+V/AdN129c/L/gqrpwV3W+5yTQ96gTs/GzfvkHHTXaMh6V+V+/iB4/rf6s3KMI3dT+p5TicOGWVF
	R76AqwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy3t-00000006oqt-3ln6;
	Wed, 30 Sep 2026 17:25:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy3q-00000006op7-0ugo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QUVwPAQqcPJEXSHcvyrm5SHBCzZnkZ7JUl+/bI5Vt0A=; b=bKNbK3+yB4nBz06Z9EJXHQkvV6
	ymb4RTYoeaCa6jJCv6k4IPyJoeieTLfiFcWfsBcfL8kkzJS1d9LpN+SwkwhxtsNii/bJhlaldU9Di
	Je6LigKlT8UBdlRjHTtGXTnw5cxIsEG86F3tBRBr3TLLRRGbBytj77E5UFLw1ghmCha23QxTGEuie
	CSaY0qtaopdCA6qc2IPbGYbvB98aTUNRYDI/gl72ZZKKTXoigw30ea4ZjI5nq65DDh6THIHvuEaKZ
	QpOeaDvUhdLYV+ziStLwx6ZB5VbK98Zd8ZCEVtBWSEbb3asmYdRenAihS1fAYVahb7LB4IqsA6mj4
	WaFuyMOw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBy3n-000000048Ue-0VOF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:25:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1DC421A107D;
	Wed, 30 Sep 2026 17:25:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6C3460749;
	Wed, 30 Sep 2026 17:25:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8C7B1032968B;
	Wed, 30 Sep 2026 19:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790789136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QUVwPAQqcPJEXSHcvyrm5SHBCzZnkZ7JUl+/bI5Vt0A=;
	b=W5IRmjHj+yo6juCpmMM+5MO4vVfcBLCwvZveroyCeJBV6LW4BvNNajt79J3bsZf+s5Jrar
	DhxkFI630i540xFnDB1w0zEr3NzEwYs4pns5xRL+vg70yTKRtPmvmtGEGbWCuROJA01GOp
	IJeEBx0kA890ZFlZgnkTyPq03OWvHEL7zgzrMoo5HARk20p5a5TColjHEd8531AaS550/f
	f/XT9ryS64WCagoWVGPHq5KjthfLT0VyKZ/cGAxKlxo7bvNcxXFb3eU+cqHppnl4LiI5Z3
	8sztprQmaOoouYFSG0TaaEuHX1vyp6videHpWzR9piXRijKqvQZhqcZtsQQ+6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 30 Sep 2026 19:24:49 +0200
Subject: [PATCH v6 03/12] dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX
 define
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-perso-ma35d1-upstream-clk-v6-3-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_182539_350604_5DDC0ACF 
X-CRM114-Status: GOOD (  11.60  )
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

Drop CLK_MAX_IDX define of MA35D1 include. This is not a binding and
should not be placed here. Value is defined in the user driver.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index ba2d70f776a6..2d6a44a7e55c 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -248,6 +248,5 @@
 #define ADC_GATE	233
 #define EADC_DIV	234
 #define EADC_GATE	235
-#define	CLK_MAX_IDX	236
 
 #endif /* __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H */

-- 
2.55.0


