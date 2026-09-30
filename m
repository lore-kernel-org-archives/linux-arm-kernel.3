Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3235CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeEQPBVGY+VcDDpf0IXeyoSfMlwDkJaa3weRCykKMWs=; b=zKCitcC1HFBqej6YU1j4HX1Ekt
	Bi34qpVZFERf+YIBO5T3cuwJjerrk8jkDudaYcKiyN9YwOBj54nKF9c0FeH9C8jX45go6VWOlTcgr
	zTmV58WRXFd8UCmGvq/5RG2w4/E/zClZuZfmizZ5QCf0DCzQdLywXWuFLkmDqONgswzdOyZvTImt+
	F/wTQT5m+DzOX5gHb+vGUgJGzNGkMHL7DR0lvhXKtUkpyVUmLRtz9IUMVn5Yet2i+4JTtSmqAudn9
	lKsHV/x0/DNBnkEtRLJdpQ5TBKzSUumr3n6G28qDZ3kARDy7Q9G3TG/FpxpZiNsmAcbX7emHynBlM
	cREpylzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy40-00000006otH-0AcH;
	Wed, 30 Sep 2026 17:25:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy3t-00000006opX-1sbf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WeEQPBVGY+VcDDpf0IXeyoSfMlwDkJaa3weRCykKMWs=; b=L6btX7taQNFFEJNE9wGTlUcZwd
	dDVixf0OGSfxIOjEHzondNbHuRBx+B/KRuDD70xsKmixDUuPI1sFHFRPrHGP5WqlAD97qiXaT1JFQ
	xtIZPLn4yKmEj2NmjnST+zBoeTs2dYHLVKy5PjAMZi2kcemONUPuEpne+CMTMKlj6Fy1Jyzq87CI4
	nQABfwm9D7P9K9JGb6gknemoWEK3vtm35EeLJPFwthRwdFR61N7D3tLgeFHeMXjRMDTHpksDkm3NI
	vrTIAGz1kKUE68t3nHCoh9/72lwcU458j3qiLxMimW/Cxxkkd5Ar41MVu9tIXyHcg17l4N1jCCcV4
	9xVKEXqA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBy3q-000000048V0-3DAM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:25:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 24C064E410D4;
	Wed, 30 Sep 2026 17:25:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5C3060749;
	Wed, 30 Sep 2026 17:25:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDE4010328C66;
	Wed, 30 Sep 2026 19:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790789140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WeEQPBVGY+VcDDpf0IXeyoSfMlwDkJaa3weRCykKMWs=;
	b=Ro4dI+lUTpSokKC5kUijaHB6GRtZVS6m0ICtSC0h/xeAJJCgWmjd1LHC4WUON0JQF3ZJLJ
	JllrIshDsucF9UWlgdVW+LAjDITVdLuxJUpTgowji6MMIRLjKGrmhKkpmWGIFVdfxejCw0
	/KHK9PbC8MMJdUmQMy2VAU35FLVAZi3MdUJXmGHSvZHvlPm+q8TRCMF7HHG8DXjjy2aivG
	niGSBgoqJawxRhjHHK5d1ynJBBWVWOoFszm05fFPVsnLJ8/zI5QAup88AW/6us9kS/iLCN
	3xp8EzTiaT4oCSarmrdO/O6dBR5gWJBIOoTaRMKpd8xIwVmup8UwsSSZD/+acQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 30 Sep 2026 19:24:50 +0200
Subject: [PATCH v6 04/12] dt-bindings: clock: ma35d1: Add missing WDT/WWDT
 parent clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-perso-ma35d1-upstream-clk-v6-4-48937ee6c9bb@bootlin.com>
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
X-CRM114-CacheID: sfid-20260930_182542_925072_DB8C817C 
X-CRM114-Status: GOOD (  10.13  )
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

The WDT and WWDT muxes have PCLK3/4096 and PCLK4/4096 among their
possible parents, but these fixed factor clocks are currently not
defined, even though they are needed to properly describe the clock
tree. Add them to the bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index 2d6a44a7e55c..764d837d6162 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -248,5 +248,7 @@
 #define ADC_GATE	233
 #define EADC_DIV	234
 #define EADC_GATE	235
+#define PCLK3_DIV4096	236
+#define PCLK4_DIV4096	237
 
 #endif /* __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H */

-- 
2.55.0


