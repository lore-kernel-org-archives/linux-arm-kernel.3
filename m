Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715EDC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 20:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUPjVrLwJsJVzn4Q29xfovXMjcBST4SjV69WBu8CmHY=; b=jaRWaJftIdUWen5sB0xFU0JTFJ
	snsnEewZAjWNTbIM2r/Ukzcf8N77ejd+mlmySYjPPEIZ9dds3QqGSyYXFuLOVKAaBniNpXavGlwyy
	XDTAnMigozlRkQMy9WebakXqI8WEklQXHdsPZPIqWscHljHuySTpaFKOPVmSkiFppphguf4rbvUi4
	jn2AtqAWCX6rQwmpeTOEOVUYp2ke4Ix8gXCBoyQHTpRKRbtr28Jtg434lDEgG+UiZvilnyKMNl30J
	RYHpzoCHGjty/I7QSP1gNPbheLg/KDn7M+bSH1tWp8SekJtv859MbxvsGQr2I/OG4i/ohkquFjbbQ
	zGQvtv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTp-0000000DVrT-3fDZ;
	Mon, 06 Jul 2026 19:59:49 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTf-0000000DVZP-0nyw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:59:41 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso2560955a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367978; x=1783972778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUPjVrLwJsJVzn4Q29xfovXMjcBST4SjV69WBu8CmHY=;
        b=Z7r692jVaXwp0aUmmEl8fOYkO9WcSk+RjWqdXlFNJ1uEAf0Nau3VJzgmTb7ixaoHMS
         O8rr2jBV4yQroLS3RzqKVk9yvdyFUTutZTAgWNmIxqqo4azXEEf8tCsbUICY4S25FFYP
         I0eALF+JeR9scidKmeFdrJS1rPeRy4SLyE6yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367978; x=1783972778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uUPjVrLwJsJVzn4Q29xfovXMjcBST4SjV69WBu8CmHY=;
        b=WWnQZoqgCfWl1LM80q5ET8hVo56I4Q2z/72jvLqA/3Ml+BBpydn/Nl2HH2yA4cStgv
         nk/ICoSf/TBemT1OqYZ1gSO5fnbhy8HllCH2dOr7nEWbXZbeJrdRY+SImTElTA5UK39U
         1IMi3Cc1QXO1An3VW2BZuloigvXnWCz2yUPWOy16LmAqm3QZiePgRO8ZHRomVAP21WXi
         Cl1VftC8rFwzSvnKkgYw9L7RoHZeQv/fSHvX+4J0X7f6s0uqpnZPXIHqNCkuB70f3hZS
         9buQ+zfn8RpJfvjJS791iWR/l35TSLTqbvbhtTYfhvt7i2tUJLhfgvJKYVgbNXw0yq14
         b+qQ==
X-Forwarded-Encrypted: i=1; AFNElJ+f77P0vYkED9cMKVP+u+x84FD81XPrZMYtQJovjcN9IIYPjGhzMzSXD88bIPbbSGdSpZH0ILk6GDF7q3pdAFiT@lists.infradead.org
X-Gm-Message-State: AOJu0YzJIQ6Xd9cgfG8G05LPrRVR3IAtOs5F3kKcodhwBClhiWz7+GJc
	bs4JEk787pulQTx0j/J0ccHdeA1LB6F2+hoLWsp/Cb3qmwmSyA5aPCS0+rVMoIVi6Q==
X-Gm-Gg: AfdE7clKIxgsWdx86hi50y4AAQJunGx2NWQmCxQYLsE9b5mFeljD+KYCgTdqNUz8poJ
	yfBWGFUbvW36JICnV5aHeOzZBcT3zwJC2yMEh2+SobXKu29ITCCCFjCmfrNZ+gqxRP3891+fdt8
	M3SYvtfMQWDBR5PH7IyNWLzec6Nt5SbAqy4FHROkLC/eem+6iGlqGSuhlNsBTj1fhQGVp/E4O79
	MkRbcHSqVA3GUAD7nK+kKdO7n7aSrMYye9kTxcJa9n2ca6f5am3fl1xxpSJUpCFr2DVh68Kes6F
	Q/YLzQBqG0afls4teKcrV2zPVShcNDwM1WT4sGWb8UWpR4y5WDNwO9I9/7iEWUFiayZIJLoQupW
	LufpW82dc8ceA0i7O/PGAU2lAWzkmhvY9gtHtIIdoQHTZz6c4LGTlUG1ML8/0zdzn6xAqIwZDPk
	zrsOGbQUI=
X-Received: by 2002:a05:6830:82e8:b0:7d7:58b0:7685 with SMTP id 46e09a7af769-7ebb22cee36mr1427105a34.13.1783367977773;
        Mon, 06 Jul 2026 12:59:37 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:37 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] dt-bindings: arm: rockchip: Add Luckfox Pico Mini B
Date: Mon,  6 Jul 2026 13:58:07 -0600
Message-ID: <20260706195818.3906949-12-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125939_779535_F49445A8 
X-CRM114-Status: GOOD (  10.60  )
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

Add the compatible for the Luckfox Pico Mini B, a small board using
the Rockchip RV1103 with 64MB of in-package DDR2 and a 128MB SPI NAND.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..711029ee78af 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -813,6 +813,11 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: Luckfox Pico Mini B
+        items:
+          - const: luckfox,pico-mini-b
+          - const: rockchip,rv1103
+
       - description: Onion Omega4 Evaluation board
         items:
           - const: onion,omega4-evb
-- 
2.43.0


