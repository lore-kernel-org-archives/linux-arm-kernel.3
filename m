Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D52CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 01:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WQLlaZBcT5TiKH6jHmoF4Nd+NZMHVC1YNos0SXXELk=; b=AUzkFu5u9GN5JUD8XKRsNQe3KG
	f1zJFv58gnIepsTdV0LBvpcXuWmDfU2oh1OIlolHPGobvx9dkV7STQr85EYxBCF/JXLqwdsA3Qrpj
	0D2nIsXErx6kLx8OUvtdjieQh2zUaeMoZLh9i4DKLqVQtlWycy/huL30xXPbxofn/H/GB3obLB8od
	n9/MRKbxqh7KcAa/rtcx8vnviHQyp81fzi1HF1NwkkMf/Y8suVb4s4h6e9rMMVdTqB+rcppU2P/jn
	jycZPqZlHWgsivIOt3S7tHUZ2KftylRR3LkkzIuIylo89JUmJB8Lg+o0Fjxi3QlS7EQFi56EEvTSL
	OF/1wpYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCoX4-0000000CskW-38fp;
	Sat, 03 Oct 2026 01:27:22 +0000
Received: from mail-dy1-f176.google.com ([74.125.82.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCoX2-0000000Csj8-2jRo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 01:27:21 +0000
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3510f00d974so224511eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 18:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990840; x=1791595640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WQLlaZBcT5TiKH6jHmoF4Nd+NZMHVC1YNos0SXXELk=;
        b=WsdTBM8c2it3rtUPUTcmMPAzRoMi1DHIs8KmLRYxvfhKk3DjoolRN7WXJOHsQAH9UI
         XKS5k52QNt+2odPGQCJObDUsF+Y0raWKbSol/cFia+GJbf0p2JcFUo5TIJqqpZruK+Uc
         P/K/P0BLdntEeAX9V6WGxKOYMblc84Vqf5/VbqTJ+ie0ewm/Lr+V0KEc6HOsVQ9MUwLl
         BieNQ5Ap0TEersMhVI/m9WxIo93ovecV9GqqWDullNFi8gGDmeFN8KMsDwVTkI0Xlf2E
         DoA5UbqcGM3t25T/Fio2TgCU7HBZhLUQ9DTSdyrcYneSYyTCOlaEHBfxGQOpKVp0o4sU
         e1sg==
X-Forwarded-Encrypted: i=1; AKwUvBwvhSINlGVXW8FZoq4BYF6X8mLsR1x3vhcqu4qzNV0/YdHYSud8Vpnq7x5nN6fDkt8Pfqw4BlAK0N9LYRucqPCt@lists.infradead.org
X-Gm-Message-State: AFuF++nYskMdVU8kE1tRJl8qvUerESZQBoxN4PKJOilT/wUCRebfgNXc
	T+h9oCIzOh9x4Gk4c5J/F296Fdwb0ASoovE+WqUuDLJv2E50VMsUMz6h
X-Gm-Gg: AYBFou32HwravCphbm6FIgCPPE34uiSHZWbEG9WCnuVfG3YRWGpB1SLxH4Vw1hDFphg
	l/EXtmc9k0av+IrGibBewSv8y94tnPDwY7X5sP9JniVS+l+w5cxfswlXb761deTWvjljxc0HBDK
	Eaf7c7GZi77ucIM5lg8/EjUNPEZfvj4pWgeT4Wo81XRsAdj6RlZTb6JcFuv4OxF0UJfIeuZVS8u
	l+3wJh/TplUySbEbDvrDYu8vYnXRPZIDwSkttYs7P7uxSRNaF6ISXRWejEtDVEj+7Z6ZXkAwpTg
	osmb8pqrvRCik5tOcxlpKakzGq8bm8cFB/HIEBDwskB0eKDbtbO8Vlcbub5e7kz3P1qqTXkLl25
	LCVDICxufyWNyyFHZuzkpIBD8fF1gJezclnYmMFy/k7V3n8pa493paLKlauNCITeCTrlksgBGWt
	IPZo0gfXkV08ykxf9QyerRfjlQGmoTWThZsU5+jatKP6wA0wkKjm6ivbG7hFLyAoU4SZFeIPO2o
	MkIpeghbdXaqCfDoGmt1hVOufE2pR7WUlRItJy1h+V81WmJzEa5D7+fxiGUFP6KjnbmGDGfqOfj
	T+wc0t3IEDuiuQt82tpOJxAWVa2/BQ3VfqURYxjEO6Y+
X-Received: by 2002:a05:701b:4510:20b0:144:eaa7:2763 with SMTP id a92af1059eb24-151c2d0b226mr1341545c88.16.1790990839589;
        Fri, 02 Oct 2026 18:27:19 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa74fa1csm1218093c88.1.2026.10.02.18.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:18 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] dt-bindings: nvmem: SID: Add binding for R40 SID controller
Date: Fri,  2 Oct 2026 22:25:35 -0300
Message-ID: <20261003012534.418820-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003012534.418820-3-otavio@ossystems.com.br>
References: <20261003012534.418820-3-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_182720_687349_8C60982E 
X-CRM114-Status: GOOD (  11.14  )
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

The Allwinner R40 SID exposes its 2Kbit eFuse at offset 0x200 of the
controller, readable directly from MMIO like on the A64. Add the R40
compatible with the A64 one as fallback, as done for the A100, H616 and
A523.

On an A40i, all 64 eFuse words read through the MMIO window match the
words read through the SID_PRCTL/SID_RDKEY registers, so the R40 does
not need the register-based readout of the H3.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index f67470b8a2ed2..a4960b0ef8cbe 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-sid
       - items:
           - enum:
+              - allwinner,sun8i-r40-sid
               - allwinner,sun50i-a100-sid
               - allwinner,sun50i-h616-sid
               - allwinner,sun55i-a523-sid
-- 
2.55.0


