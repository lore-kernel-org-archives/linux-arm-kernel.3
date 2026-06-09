Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D208DCD98C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9gerRr8/bGZ4SVtJ1fbui5Bt5MQZVRJLwoBqDR7WDI=; b=QshIWRuwAIpasoulADMVzRXVyl
	8LRfbynSrk2ui+v/i/z6XQgKP3Rn+0cAep+Kol2gUs0lG1hLM0YJWMrWbUlHhZ8ioxVyy7ac6OrfF
	NQLLWKcZS5q8K9WVQtL8Lc+CC0/1Zp4W4Z0GfVh3Ly8Keb/JFFeK+OXFmKLI/grbT8UyXSSaEeIQI
	aND+Dk4HqHTo/XZJJoKTj0+/AbmjXDZ5HFMX+Ahw3XIPftoV3dGUG9u4cjrGbbWJ+14+LF6ZWDr/P
	JX7Jn/3E0fb5TUOpqC3tx9tnR6FjF83OdvckgSuv3ShMXCnWIsitpJWE7JiMewW4suSzoAPsKIsOV
	TzQPAuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eB-00000006ENc-38DW;
	Tue, 09 Jun 2026 18:57:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1e5-00000006EJ7-1s06
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:57:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so38068275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031472; x=1781636272; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9gerRr8/bGZ4SVtJ1fbui5Bt5MQZVRJLwoBqDR7WDI=;
        b=XTtovldAZrs8uKR7Sc90Zo5CcqYxXfBSnjDnj3GKcHu5KneK1DQG3oLxgHKV8In3x0
         ExlG9XWpEnCR6k7S28iNZkJnQ0DgtALxn1nBQxWtLFwHjtZHu1tVlkXkZEB15p/id3L5
         oOX5d9C4OLW1m+PmHCPowtcz3IglipzrdAPsSsty2qpn6pFLqfKEFjpHUfFJFZ/H5jvE
         OS6r9kVjA/nLTMOfF5xubGT/tV8QtvWxZqtRRuFTKSSFskesxi/zjI/xG2IZHukiFTD8
         +AHPDG+297seLJVaheRBhxZRcxuLZBt54gOQkv+zQqWixTFxqWYKbkcMzCtrs1PCNknT
         h0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031472; x=1781636272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9gerRr8/bGZ4SVtJ1fbui5Bt5MQZVRJLwoBqDR7WDI=;
        b=aYrvIS6R3uEHlKaprzABXjs2zPB3uzN8nV9ODMqogRGQFC7sPToSi7r46Hc7Q4GL1v
         4YF3BqMtBn+LHnyqtK8TrP7avd8mL0oOEIl0XChzP/4sW2Mo5dJ4/bp+sOTqYEmLXbFv
         xz4z2WwNHKkVBcWdv+liyjWQY2ojtSq3X4z/mrpsU0BhZIjHlsHS+OSk11gzPkyJ9WQA
         Y54Xhqs8YnBhONaBYUR6Em5sGh4adozxQDV/HZF+/pgwc+owWaTMyffBqowELUbfbbtf
         6J6qCrToqvk0prn8lvzeL+xau8fidrl43o/+j6v7QRDLuX8W81bFfjIKcFuOvLwyjzki
         Az3g==
X-Forwarded-Encrypted: i=1; AFNElJ/EqC40BvEnmRKGpDWtp4AcvOpZFH/EV3eOZzA8/KXrEafdEJg2589zgxlPDrgZjrqKhRy009A88OfUXg7QpkJe@lists.infradead.org
X-Gm-Message-State: AOJu0YxIchOBgUDaKaCg2Gfv6SLoTx6AQErvE62EPkQBS5fLucIUlMiT
	JtFhAon6jDYoZTKVUUI4izZNXFUe+NSsbwKXtZpkgc2OgzJVw9bbBN0+iNkM6hmFV04=
X-Gm-Gg: Acq92OFsQd7jrYk0B8WJT7ZtW8a63NDaI/Zdsvz5Jqho4NFKCGta/BBprqsN3kQhY1e
	52hVr8k/UUy7SdKw2AmHmUSz1AJPZ6fxYWF+/143sMllkoTUBFnl5U6oir3BUVaKNG3GH5mNMio
	L+Vhwk+USDVxE+5SRJjFExWqa4SdGkb2s7HuMjKNxgq7cG5WLDaSg3aXrU/XqHw06qXEM0llh8Q
	pJ61tPiiwFwxZhMuMwJKoNJ/D+ex1gLL/NHXo9z++MRG8fJGjuOpjHAgfI2040hV0hOqLgeK99h
	TnFRzejrQB9weJlZYmHDM09JWJi13t67gzfrcp6Emp8Qc+JA4DtiiwsbrOU6lEiQT2fVkJQxvcR
	UPPLrCsOwth1ldx7BdgcxunE36QxbSgej6WJalxCNkdDl1GFXQEcgux28Q8VY58+XhT62FvIhaC
	PoX8fkMaJ4I8mNNNZYMtVN0e3i9JCJBWw=
X-Received: by 2002:a05:600c:1f90:b0:490:b00c:8e6a with SMTP id 5b1f17b1804b1-490c2602971mr362579095e9.28.1781031469438;
        Tue, 09 Jun 2026 11:57:49 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3918fcsm577657565e9.3.2026.06.09.11.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:49 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:15 +0200
Subject: [PATCH v6 03/11] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-3-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=msp@baylibre.com;
 h=from:subject:message-id; bh=5Vs/P1kH8W3WWMwdKGloRidpstg2eGVpPTnXJh4QYNU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxKfSkWfNci98W+m35S9XUqn88h9NH5dqnjzMfPiH0
 vOkq2JyHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR9U6MDNuUpXQcnjLHvbil
 uclJfPH+7yfuzele/fhkRVtBNq+qSBvDf6+VZ41THFYzaD75ZfrBWpVz+Z0fNrumRc9sv3o8ao5
 jNwMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115753_527276_C513A81F 
X-CRM114-Status: GOOD (  11.12  )
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

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index c1e9067b3bdd5ab0591541d4685bb17a5dac4f65..63a4fb03dc0acac63bc573e290ec613617f492f0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 		};
 

-- 
2.53.0


