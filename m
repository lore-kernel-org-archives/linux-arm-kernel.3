Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82D0CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W68ZhWpdb/C/lOojsWavHUEouXSEUpAyq/d2Jk7bb08=; b=Uf/3mdMuACkk/ZQKdTd3+pJb/T
	E5+hDDCl1W/e/sSqdM91U3/McXyxJZNG3LjNiVeCyW0xx0PrCzi3rXDVfhlfCWr9WwpvoLQzD7TX0
	sbRgSkrLBKi2WfkeR4dynAZ3+cqNNGqPMLnyGeRf1o1gB+j9V8ar0fooUw7ZDqv9nYEP2mX3yA75B
	0PNsjn5DikHBkhoYk+YwQiJJGqes2v1u4GiSrOZzJMeBh9vziODk06znuwWqf5EpaRwoVALRaNVQf
	ZFtxuVjNmSrE8CwQymgLFz1mQeK2jSaBNRxRo/1DMpBsBmTcvaa9v9CRpTYb359GLt609pH5EqzyZ
	DhuK/ibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyd-0000000AAeW-1Y0m;
	Mon, 12 Oct 2026 10:09:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyX-0000000AAa3-1RRE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:09:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a166199820so10458355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799784; x=1792404584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W68ZhWpdb/C/lOojsWavHUEouXSEUpAyq/d2Jk7bb08=;
        b=H2ceb/prGGqULuEli4BDejMh9sDJCH354WpbSsCJNr2/9rQgbFF2bqrYCUAVhEXoIh
         +a2qe2JIgSA8TpFrXOj4JzstBo7EcaUhXC9tsGZmiCXqA3VWtnNNRKMyphgRfIMrLCW8
         mEnn83OM8FPDMqyQ0HMmxFHfbIVrv751/iw/Alh8rbpyiUybc/CPuHpVyVSdBcNCVsbd
         FMAuo245xTCvrBTJpH62N1bqsxFbbZFJzb6SkctpmXl5k1hrXfbiiZWbQxJwj3eYd9vF
         /Mli8IF1q7qQGM9C0F2TQHzaQslTKruhkhJAcLg0qA0vW3I0umUv4WzRI2bMRNhSNWNS
         A2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799784; x=1792404584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W68ZhWpdb/C/lOojsWavHUEouXSEUpAyq/d2Jk7bb08=;
        b=t31x628fSWrB+ZVqim7lmhukTFItV+cvASXCn6vu2bugyPos/QRKGQIPXrpyq3Repi
         5uxUuvMf+JnM0owuSOXawGz9THPaxB5h3Hfxc/ARkpHaj4NOb+W+ehRpaEcje25wN0qK
         G52aLFzTXtIuJ0V1svehi7+KuivvmPRvd7ksfEoi2AJNnPs5+B+nD6Pj9A05CNnjImpU
         /Jx0jVw752Ck/R4U3kxuo2+Dif6Jv0DdpU1ygBlLKP5Md8YaAiPWaBe/nDgAJPDX+L64
         prAaD6QiEtHCXJHTOE25JjjjGUEQSQlQA8h2XW+5XiRFL3En/QO0GWBfzBQqFTlbdasE
         7FVQ==
X-Forwarded-Encrypted: i=1; AKwUvByFlzQxPOidwwCabAwGppNhmzmBozz7MoA4lAS6iTw9IPNtESY+56N8ashQibOta3XBrESgZGHFgCq9zpF3y6v6@lists.infradead.org
X-Gm-Message-State: AFq9FYLEbpBPB/pU5sjQEcYu1wHdzLf2LB5OgTX9pbCJVCXGuESz9Nu+
	8f1rd6Uzzvfm+zLFks2j/Oz8gCRNLr7HXNKFL59G0xRhPa2pRZoy3weYdV+o1ckNpM+jog==
X-Gm-Gg: AYBFou0zejh3wlsAT9lQsdjR+sEqtbhv10He0Pow2nEgXIYpV2tECMP+tUmjcutJo/r
	zpbqDjPef/NgWan4EL1mmd5dUX9tn3xIZpZ33VTQOKoUUwx3aDkhddfW6HdvflGPmgY6rjg6Jin
	I11idOgw+2vijo89x/VmS6+x8swU1wt72r1riOesObKMrnEPcGWfnf54TEgDD3Y+jW2Wk38TvLu
	1sBgrjION+oqisVTCEuGxyi0Hmu/bPy8ONd/b1bk3oL5eIm8kZNNbwUWfaHS/gHVmWFFSyD/WSa
	naq7cqrcvNu+v8SZC8YCXBTf5DnMv9DQCdA1T13jAGr5NXl2FaceFdsLe0JZGGpvki5St3iMj1X
	8goQ1dufUn934f3q9Px1Kygdg+H8A116fC+hfzD81X30J2jyS5+xRYt2X0ifSS7RiCN8Tt/+KfJ
	xT27Vv80jsR/h/bYQSQYiX4vDZH/3Rb8iwsbDeTNsX1IgLbIKfcTs/BPh9xQqNq+b/ixK7vViwo
	edI0jT1zGfPPze9f9TpaPQPKMj4tcLt
X-Received: by 2002:a05:600c:3e0b:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a18e4b1311mr160592305e9.17.1791799783597;
        Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v4 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:14 +0100
Message-ID: <20261012100816.331033-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_030945_390037_91E0C0A0 
X-CRM114-Status: UNSURE (   9.63  )
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

Same watchdog as the A31, which it falls back to.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index b35ac03d5172..b70a6b45a33d 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -20,6 +20,7 @@ properties:
       - const: allwinner,sun6i-a31-wdt
       - items:
           - enum:
+              - allwinner,sun8i-b288-wdt
               - allwinner,sun50i-a64-wdt
               - allwinner,sun50i-a100-wdt
               - allwinner,sun50i-h6-wdt
-- 
2.52.0


