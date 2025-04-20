Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB21C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 17:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycNAhVHWprcmlx0NXKu/950Cj9ZtnGPvQSTzBEdE08o=; b=KmifmIzlgNNB0tN56mng2WVRbJ
	NfLiF5MTxLq/FdsxdQlU6HY759OLa1vH4yCdNXqS/Xy6s7HmuTnU1ROROoW68UHQPwQvBR7bOwHpW
	sNoLIDm1XcHjOmsZbIQufjuR0mX13XRmaEOePwqrGPsPcKde3KK6H2fYZ61pwRTCbvez17O1NVjB5
	XrCvjawtomJ1aGeb+VPAH5D4Ts2gQF1Ield9KFhD0D3zqyqGdV75jVQx1p83mCz4g/JXWsYiFoggL
	QCC7hOSfWRHSWhzDNCBnEGmkXrw2Bwkhjr4GdsjVO7XrdRUE3YSJkxQufg6+s6OEPETues2futGl2
	4/418qAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Yj8-00000002r1k-06Ie;
	Sun, 20 Apr 2025 17:45:10 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6YdW-00000002qSC-3A89
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 17:39:24 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZgbN84NRdz9tXv;
	Sun, 20 Apr 2025 19:39:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1745170760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycNAhVHWprcmlx0NXKu/950Cj9ZtnGPvQSTzBEdE08o=;
	b=THhdTyyK3/5qfdfEg/XowqSZGbKcRCdTnSZXIfUIbHIRkWOiLD7TnI3OuyV4rTab8vnhT3
	H97/R08gjpeJ2fR6383yoLhmk7ze7WbpK2wMFW4tWUbY1sUv6MfuFQjcrRAioamvzPS1Gg
	VcloEL9g6FORTQtkSzhZLUeUNtRtv5/mRlLASm6mhySDwr4bSfj/CyGqye3jktKodCf/PF
	7LPOmfBJTgYQHndZSZs8uauCseaS13lIx2RnB1ec/uLykUUleIQxFR+bc/M5HuqV/T0v+c
	5Wwt4MWO2+E1rQ/HrRjMZQGPsGlkeHY5PZhFMFuuS1vI6nchT4q4hjpbxvBt6Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1745170758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycNAhVHWprcmlx0NXKu/950Cj9ZtnGPvQSTzBEdE08o=;
	b=DGfWaqCRZZ5cgG2HzD2XJp47rEMoF8J52aYSGQKhX6DLS+NCgZrlPwAhZ3JZmDyw0ndvbr
	PiLaQpji5y+DF29exHvDOKYQOdvbvU80pnRoT/OpvBL71X9v17b8j+YF8Bul+d+G06XRno
	8xMvxi08lffMJhMjShdWLLTlucWNSGWfOoM4xkAzcMzxkMofg0xGkHwYJ25TyjM7srN9hu
	9rcv03htdjGMIWQ4Z6wuhjbd0bAjupNxbdrUS1d3h2d3XuOTF8UHj0LqdpHvu0nOSTJlFp
	tviTaw8uP2ciK/AXm4t2BpKeV6VmBXNaML1cZRIaIhGYJg9F6k69o0Wl3fKQjQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Hawk board support
Date: Sun, 20 Apr 2025 19:36:28 +0200
Message-ID: <20250420173829.200553-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250420173829.200553-1-marek.vasut+renesas@mailbox.org>
References: <20250420173829.200553-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ffqcsgydgpipf78ye5gg7qhhp65tap84
X-MBO-RS-ID: 1ce5a253f8c40f34f9f
X-Rspamd-Queue-Id: 4ZgbN84NRdz9tXv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_103922_958233_3187375F 
X-CRM114-Status: UNSURE (   8.98  )
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

Document Retronix R-Car V4H Sparrow Hawk board based on Renesas R-Car V4H ES3.0
(R8A779G3) SoC. This is a single-board computer with single gigabit ethernet,
DSI-to-eDP bridge, DSI and two CSI2 interfaces, audio codec, two CANFD ports,
micro SD card slot, USB PD supply, USB 3.0 ports, M.2 Key-M slot for NVMe SSD,
debug UART and JTAG.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: "Rafał Miłecki" <rafal@milecki.pl>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Junhao Xie <bigfoot@classfun.cn>
Cc: Kever Yang <kever.yang@rock-chips.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Add AB from Krzysztof
    - Add TB from Niklas
    - Rename {Renesas,Retronix} R-Car V4H Sparrow Hawk in commit message
      and update R-Car V4H ES3.0 to Renesas R-Car V4H ES3.0
V3: No change
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 0389355b9ecad..3acfb835dd375 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -375,6 +375,13 @@ properties:
               - renesas,r8a779g3 # ES3.x
           - const: renesas,r8a779g0
 
+      - description: R-Car V4H (R8A779G3)
+        items:
+          - enum:
+              - retronix,sparrow-hawk # Sparrow Hawk board
+          - const: renesas,r8a779g3 # ES3.x
+          - const: renesas,r8a779g0
+
       - description: R-Car V4M (R8A779H0)
         items:
           - enum:
-- 
2.47.2


