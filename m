Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73F5C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 14:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWN4rK4Flr4QJJjckzrtsp2NO98+h/Gt6eIWZ9nsIDA=; b=FoBJMJZUsZo+NU+KFbX1TDtYjA
	/vUGO7azOKxJYkUbis16PtcES53MOFaqIWEzKJBMpZILaH6haC4r5dvE2NhX3Vpml0sbzxnLG6Qv8
	iQ9UJN1Ha70eJ8hEdkp5rPe+ZF4bn4E/eMDFbP2KOUc3CL0vGV6k1qBgiadO6ZPWNkv67L3WGij1l
	8Q4qIK2/Qsn/vgeCGdcluxUwPXssBQICprCuCQRNeIVAUl1+y8m2VfAZS7UJe3tRmfI+uilRYaCRh
	HdhfiTcXrScVNIa+/vaLzVlmxfpQ6nims66nBxAmTqiPANbI2M6jM3lNy91p4tF1cyPuBno67K1bV
	xOIdqEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RPz-0000000FSBB-42xL;
	Sun, 06 Apr 2025 14:56:15 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RJD-0000000FRVw-2W5t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 14:49:16 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZVwGK5NHKz9stN;
	Sun,  6 Apr 2025 16:49:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743950953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MWN4rK4Flr4QJJjckzrtsp2NO98+h/Gt6eIWZ9nsIDA=;
	b=JSTNlRyopSLAS88xEFPRaWogIBfStKOEk6pch9gBfDfYqsXupcPDNM75bRu7JDzDxtw4zk
	CR3g6m+OSonoleqHUZwGWr0RKNqpITDaAo5aFGU0hnPaC3R9MSGc11T3L9t7tRbom9er/3
	q2KYXNJE2pZV2hcyk+DIxeSZnF/T2rHudsGSO9KLXvrIu8PUqIsqvVSpLS/LyfhwXT1vtV
	5bqW3+4ym1APG1qaqq5uHSrH+hJnUk+BjFZkQubLXO5qDhGjdad+iIWshBcsiXWv9KGriO
	+Fhu2inT6Bh84OXaFDcJflCiF1I2YDdpsh75oXCmvKBS/b4Rbe2Hmc4m8/gAxA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743950951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MWN4rK4Flr4QJJjckzrtsp2NO98+h/Gt6eIWZ9nsIDA=;
	b=oubgr8hKjDgZ/PH3IDz8tYWBGeJw7P0u1xSBXWlEeBcbpmyKUqk8/DvkWYwrw3jkxrWNeW
	8NKc2lGioQDbF1ziQiitEebav5NasZXumV9xckF/5IX3egQVuEb/mLnfAaLx8Ip9V3vnXq
	bjmwhYJ4nkw1faGciXV+5wkGiPzSKgqGf9KwhSE3ALSkJI6mA3e1V+GdU07R1xreBWJrJV
	xU7f9E3F/P3hkN1U2dvl3zDgD9x0jeLy6PRM2lMoCuFcknTqP76Lu7KJFjmlGsXg0aRhii
	70qA8cOf+IjwewtvkhVWYsnG9URfAL23V4gyEuCF+hnLgPD9VePJg9/mcxVRgg==
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
Subject: [PATCH v2 3/4] dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Hawk board support
Date: Sun,  6 Apr 2025 16:45:23 +0200
Message-ID: <20250406144822.21784-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 84dab855406a7822c6b
X-MBO-RS-META: qoifthtwm14o3m7bbrkb8kt3mrqm3m4w
X-Rspamd-Queue-Id: 4ZVwGK5NHKz9stN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_074915_776865_82FAB4A3 
X-CRM114-Status: UNSURE (   9.01  )
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
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 51a4c48eea6d7..201088277514d 100644
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


