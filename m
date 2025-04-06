Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7CEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycBTCZ6phJ4SJE0t9zpOsgIHPcVGoFYE6E4V8wFx5YI=; b=xWfHgN6erwOjrT5e+iG8YFfSKT
	Wmp5DGesy8LTL1wDt/TQReSXgyqatD2tRDZV2kMRSS1D2+mAHkloYbgi28cNj4O23W4e119oZTeo4
	OHGWTJm3cmfKFoIOxes8PhG9DTnHhidnXhcpifjMrWVryCwdw/tDxyDB8xDtPifnwG957Lwvnniqg
	2X65QZFvGyV+JvyMSGMZ8kJ8TptwN4hX8hm7Sb9qMb5xEF1U1G0syOTr/aAUwmubYhoJmP+fedPMh
	T3bJiq+MRWIgXOQ3sugbSsAdceCXK9uA2+reYfIkAAWZLDz1wXvmb4MQ1haoWhdedvd4ukKd+e+MY
	uo71oL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ROI-0000000FS1a-0lqq;
	Sun, 06 Apr 2025 14:54:30 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RJ9-0000000FRUx-0DoH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 14:49:12 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZVwGF5nR3z9tQF;
	Sun,  6 Apr 2025 16:49:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743950949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycBTCZ6phJ4SJE0t9zpOsgIHPcVGoFYE6E4V8wFx5YI=;
	b=Xs56kBp/4SELh2zEf2aJ79xVl+PDjsYFWhIAf5ZiYk66moWIN34LGLHnRmCtwZOhsrBuLO
	Hei5S+Lne+0ya3vfAg9A/PxfSlGxENzRC219fQ5Ofok4pStkkrPLYknik3/VA1Ox3vUbs4
	3z31LJI+F84k7AFsBG/hVWiTU+6gZIx46uwv9eHVty2tywJif72tLPOFL4DllkQOYFu0G3
	yva+EjBAEa/JnRmTLUZ7QUMOX4cT75bdr0PePafhqiebJH24LOaZq5qzggnwq7uwZ3cZXa
	GQGVmW6p2ZGv1x9ojdLyhsQKbE7+Ov1uFzlH/0HnEKrO4B3ReYqce+x/jctoQg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743950947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycBTCZ6phJ4SJE0t9zpOsgIHPcVGoFYE6E4V8wFx5YI=;
	b=dzkgQZethTvaTnVe0YhtJuKnmth/syQ+cN+FkNbasZDAEhjpgpMfOpR38cT0tHirngvfzk
	rlriI/39fFN/ZdeGUHcaqQEN/gXtSh7OG6wYbYCD1FK91I5urFnHgnVpd2dctaHX4ABMz/
	qcqHUUg14dtOkIGBXXtWtJL+4LC2o6SKB2CFYavb18+LuiwfHSkCohX1/KqC6qryNAoX8r
	c1wv9NJACmdSjRMAf0v5cRFRkCsY8oXaH5YiZiTxFTiSYJk8VpRFExAvYV0q1SKP/1WgJ5
	GI0DA4G1I5da7j4alKSymglt2ylLmgGEx7ITsQZt21RjvMVvLyfSjvo8WJDbWg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
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
Subject: [PATCH v2 2/4] dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
Date: Sun,  6 Apr 2025 16:45:22 +0200
Message-ID: <20250406144822.21784-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: eh3cxapmdc34r7fzbija53a6retpeg3b
X-MBO-RS-ID: a10c0140563f717f0d4
X-Rspamd-Queue-Id: 4ZVwGF5nR3z9tQF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_074911_231662_2558F16E 
X-CRM114-Status: UNSURE (   9.11  )
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

Add vendor prefix for Retronix Technology Inc.
https://www.retronix.com.tw/en/about.html

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
    - Add RB from Geert
    - Add TB from Niklas
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae2..2b1bf6709aac7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1262,6 +1262,8 @@ patternProperties:
     description: Renesas Electronics Corporation
   "^rervision,.*":
     description: Shenzhen Rervision Technology Co., Ltd.
+  "^retronix,.*":
+    description: Retronix Technology Inc.
   "^revotics,.*":
     description: Revolution Robotics, Inc. (Revotics)
   "^rex,.*":
-- 
2.47.2


