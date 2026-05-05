Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AF9CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 03:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JPkGMZo0R8KobEm/98TuUeUCs1yFUDqx+eNSwkeA/iQ=; b=dQC+EVHlw/UPfODA/3+typD53P
	86FueOP6V/l3DEKw1qZMBYBqCD5Xiz2eoVaS8rNoL/opwBntsIVsKs9rZRYV4awJJroT0NtC5XF/H
	ecQOlxHjyyZjGyHx7GTmawBL6Qsb1KQX9TMY7iEPGu0r2jQvt2VncDfvSy5QpExy1g8gM37IsLDDH
	IazgJsY3pLMk/DFSRe2rPD34D2fIWnxSl9Db0ZHfQkaj0nQgC8p90qQ9JirAMFEkQd9u/kZ6XR3BD
	PAjL3zdPzdUKgkZopkOnzWlexXN0LJI4ibttJBs8oZarbhhW04jtnyNjsIV9ScHiYgU48mwYB/qiK
	z94P0yeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hK-0000000F1qR-3TBZ;
	Tue, 05 May 2026 03:43:50 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hF-0000000F1nZ-2HcP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 03:43:48 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g8krV2lYSz9tTx;
	Tue,  5 May 2026 05:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JPkGMZo0R8KobEm/98TuUeUCs1yFUDqx+eNSwkeA/iQ=;
	b=pqpcm4bz3BcUl0ve39KN5SchvunleQntvqpkk1MvevwqbrrlnX8S0q+v6wlaw6B9D3n5Mi
	WPi3TUWTpB5Brp/SlHnBRHTVPhLZEglO14Rf4YKk0sDL/tX+/LXwGkWxG6DiEuoJb9kGPx
	fCCr4tUQwAAspzOcSWfV/W9d5xvH9YFC4F61P7Iq4r/QU3f83ezjkEaZIQaUubDVI4jxfA
	PKWjC0ioW9hGMlcPk908Ygr69wbI2kw0+dwJEttWVdYvyL+WmpG1fmP/NFcWCkkLZvmgmr
	w0rrJG63cXWXjXwKphD/Kca4hXti3Rdh8K47uAzo6y8ESRZ9I08omgN/klnfwQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JPkGMZo0R8KobEm/98TuUeUCs1yFUDqx+eNSwkeA/iQ=;
	b=ADrJmMy1aGJQlE/aiU2l1NM842m8tRA4ZG9OBBgDljZtYKFLh5Nu/hBO+/l5xiGHzVOkIs
	26jwNC0eurgKbhx2wxV6GKPFe+Bn4vOWWM/Tfta6O0DIjR6cI+CV8BxfolOHNjH8OmDtms
	d3Tju65XEs1s0jFZJjcMFQ9MrhGweN1FMogPKYKqbdivqvikn66veeMoW/jxLCfp+UsmGf
	DTrOHx43/DOABBerIj4/77ouTNNXNz3rxkkUTz227W7mg7G5dzjjV78wjBKw6kFMzCeFQA
	EI0Wj51J1GulEulEFqwg6xKncayZAX2MK5LjZlTkdlD1YMbcNe0ltZvksQ4aNw==
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
Subject: [PATCH 00/11] arm64: dts: renesas: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:41 +0200
Message-ID: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 96149303a1e4fb23754
X-MBO-RS-META: uxm3dosm56ffjxoto3s1gzf8tzrwabpd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_204345_721861_B5D795DC 
X-CRM114-Status: UNSURE (   8.30  )
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

This is the same patch for various boards, details are below.
The discussion that prompted this patchset is at [0].

The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
de-assertion of reset, wait a minimum of 100 us before starting
programming on the MIIM (MDC/MDIO) interface. Set DT property
reset-deassert-us to three times that, 300 us, to provide ample
time between reset deassertion and MDIO access.

The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9031RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

The Gray Hawk patch in this series depends on [2].

[0] https://lore.kernel.org/all/CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com/
[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
[2] https://lore.kernel.org/all/20260504225428.114959-1-marek.vasut+renesas@mailbox.org/

Marek Vasut (11):
  arm64: dts: renesas: salvator-common: Specify ethernet PHY reset
    timings
  arm64: dts: renesas: ulcb: Specify ethernet PHY reset timings
  arm64: dts: renesas: eagle: Specify ethernet PHY reset timings
  arm64: dts: renesas: v3msk: Specify ethernet PHY reset timings
  arm64: dts: renesas: condor-common: Specify ethernet PHY reset timings
  arm64: dts: renesas: v3hsk: Specify ethernet PHY reset timings
  arm64: dts: renesas: ebisu: Specify ethernet PHY reset timings
  arm64: dts: renesas: draak: Specify ethernet PHY reset timings
  arm64: dts: renesas: falcon: Specify ethernet PHY reset timings
  arm64: dts: renesas: white-hawk: Specify ethernet PHY reset timings
  arm64: dts: renesas: gray-hawk: Specify ethernet PHY reset timings

 arch/arm64/boot/dts/renesas/condor-common.dtsi         | 2 ++
 arch/arm64/boot/dts/renesas/draak.dtsi                 | 2 ++
 arch/arm64/boot/dts/renesas/ebisu.dtsi                 | 2 ++
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi      | 2 ++
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts         | 2 ++
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts         | 2 ++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts         | 2 ++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts        | 2 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi       | 2 ++
 arch/arm64/boot/dts/renesas/ulcb.dtsi                  | 2 ++
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 2 ++
 11 files changed, 22 insertions(+)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0


