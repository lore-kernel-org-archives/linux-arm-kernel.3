Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E91C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AA0qddm+MaWJtjYda/gIc5MYiZRprfSMbgOiV0KxcgA=; b=zQhpvae1M9IOnBPCE5pT2b8Q9c
	Pfj/iIlOihPqT7u9pRwqbK7WpTOtXxWpnpZ3dOQOpObAFlEk8OsTq0PTShM/8Fz4MEkW86wFaaqqm
	anE98YV7x8JFlV4/snGjzw7QM34VFK9mDzcVtMWaaOwxj/nTEeLzZP4p8W8vmGJ94yKbLxMCgvDQc
	WBIdM80yI9+jRccblabJgL3SkJ03UQv6HGw00gnlDncXgWaKYz52hwcdVQ2cowzoRCM8kb2e8rGEN
	x/G/T7iEchvwEzPCaFuDoPR+YYpzcEhXNHHBNfsYxqWyk/sHQd4xqy0ifKDyAdQLdDbsqrMA7hnvb
	R0XCsVoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjEh-00000001I2F-3Lwc;
	Thu, 09 Jul 2026 07:31:55 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjEP-00000001HpP-3tnX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:31:45 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 86E1B1380145;
	Thu,  9 Jul 2026 03:31:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 09 Jul 2026 03:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1783582289;
	 x=1783589489; bh=AA0qddm+MaWJtjYda/gIc5MYiZRprfSMbgOiV0KxcgA=; b=
	A/R4Uv+K2xFZiWOd4ku15YVG7nMiA+OyG4MFDkBwKC51a828xIu5/9/MlSN81aOv
	fQsWLhphrx0Hgk8zYENaGD1R5ZLPXIMZqkb63sTqYd/LdRrG6hO9aN63WmkH0WjP
	L+wVnKXoexxsHYwA4IaGSDz8Ulklrii3mmhpLd1FJCThnDwZmc5Lnuq9rcQO/8bz
	VlhKW7B6YxkxlpC0rGisrR6Vj7NXMj9E2aj92ZL5xjLtIga/4W3so0CKSg77QjLH
	Qlsmf4bN6Y7Nyq7xkA810dznmTO3Sw+bRvaucbCR5qPCXm9yfyMEQNsRbcbGsiN+
	2meaN/V53R4f+KzjsM7APg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783582289; x=
	1783589489; bh=AA0qddm+MaWJtjYda/gIc5MYiZRprfSMbgOiV0KxcgA=; b=j
	9ae5eb75NmLwJjFnX7CHc9wtH//xiVbJEtZZ/9YZjKrCkrh9DjFg4dL3wUkoh+6S
	MDNUbGkYv8Q92PtTIUBQm3TDqLUDiiMjUSwC13SM4yU03T8gLiu72nwMOTxojaBb
	aVVfezwxYCP6KaUOAj8KJRtMd90K9GLZb42VTAiY/q/hTW7l5rSRszMkBAjTeZvI
	+6Yeo9D+819vhnxnfNpPLZMfKZmkDOGf+6xpH5FgQh7uufQLbbg4dbyxjRTbMY3+
	BqPeQSNAVuO2I34Z8xFrOzWW6RYPsWlR5wrs8q4ruso6o4Cinti6Gc9l6x7HiWhU
	dDbnyh7+gUibBRqEZNrnw==
X-ME-Sender: <xms:UU5PahKXpfyKRg9WBTJj5XEdwgBvB80pvkH0QVkSlxJcrEVIMfD84w>
    <xme:UU5PaiByJDtTLBVwElqQq3rLwV3uNYKmqDWy_fZRuIywUAqn2_wSMFlDv7yrdi5aj
    nSlbLpR4c38RgOvIDVMmqv3zw3mxw_bHfGJ9dXwNjhTQspsHhqmE0w>
X-ME-Received: <xmr:UU5PanRouTpoh-ISO42eo2_NDnPYzVQVHz6wjuTLGmmLQklyvRgziwnUaqZ9Ma6yfgbN2Q3rkg9Cjgxss54UdXBb0zqpyL2CIh0>
X-ME-Proxy-Cause: dmFkZTGYKeAHgJKVIjqCymJpihoZrEqDQaRIPCKXxcc6uiPXzJNTDc4H4LzsUaMF9MJqYB
    2rpTe0oGhrtQRwfHcGfbJPzdaNrx81amtkEDFVv/fGamGt7vZBPR3jcucmA5JRiTwERHZr
    8zGRG/w0d07G5jQ4PlCj5gdYeuagoIAoYXQ4A9l2tOaakbVPoRmPGeCRSKDT6z7tQH03AB
    WTVwikV9P4YqczS+ivH9R0MDJM1iJWbkLmAFvo0DWmHZGz3C5uxbmrt35Eg98JoTPuzJKd
    X/sNvlqMxvVsFiGXNnL3d3+h2N4QVm3ifsTcrDacstkEioZW9DpvzWMrk8s16EPWaQL8b4
    DAaBpqNmb/K+Ifmwnj6cKEMQKCUZv4Dh9LWWSCDorp5xjWc48kYarUE3lNtIxGpkR/+4yj
    s41jsrBVvL3X9T2jxKgNDD5iHaEVCNiOxnKuEE77OJjqA4SO//WQQkWuvY42BnENc5Pce2
    x3dRl+RJnz/7eol5SwGeyOp5NGwKNYkU8RA4T01IlMwFhRYD4m0huR7IErDBbvf6ql7tCK
    1FYZyq+ENOkVGpmtkGfISxvETVzFUYYlSxFFtiMozqwBR1zSVD6disJFC0eDq/8+lZJPZ2
    LYeKu3zv3ybJ9vBy4oX1aKbEth5EyjZnCPITXjvy96KE3dtzz1dfTleDSQjA
X-ME-Proxy: <xmx:UU5PakeBXISGWB1km5OXTFUBDfCtN1ThwoOucovxgQdNMgc-7grecw>
    <xmx:UU5PanguRdNZHunruD_FW8WJCZa_1JPkM75KTc-_U1ObT1hcyClbbQ>
    <xmx:UU5Pan_g_tAHWFNZ3YfHHDonvSs2l0yAKcNEErVHqg6HXU6PPRwP2A>
    <xmx:UU5PavnvCFoxPKYxqstB2a2qzzQBlcx-gjAX0BkjYs9OORiXdTVIeg>
    <xmx:UU5PamZpsTZlFPiTPv1-fDm7B4KJ71dH5uFp2GT_mxUtWatZqqTySpKU>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jul 2026 03:31:28 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 09 Jul 2026 09:30:53 +0200
Subject: [PATCH 07/11] dt-bindings: pinctrl: apple,pinctrl: Add t6030 and
 t6031 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-apple-t603x-initial-devices-v1-7-55b305833123@jannau.net>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=j@jannau.net;
 h=from:subject:message-id; bh=5HbBo+rfts5jo1g51QS60vh/NG8SZueQVhNVd+PKRqk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhix/PzvRxv2lTQvW36vqve+zfvH0pUsmxtz+7D2R+VWDt
 TXvMquTHRNZGMS4GCzFFFmStF92MKyuUYypfRAGM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTXrmP4Z6LC8q/+U/Xe1JhjRjlbyk75f2D3OMZzovtQd/FLpT119xj+O8395fB
 MNlx5vrQP3ywWl9hGk1czrrA92bLz2YO6W9MMWAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003138_212144_B3872C7F 
X-CRM114-Status: UNSURE (   8.20  )
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

The pin controller on Apple silicon M3 Pro, Max and Ultra SoCs is
compatible with the t8103 (M1) one. Add "apple,t6030-pinctrl" for M3 Pro
and "apple,t6031-pinctrl" for M3 Max and Ultra as per-SoC compatibles.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 41073176bc69..f08d2c4f5784 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -20,6 +20,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-pinctrl
+              - apple,t6030-pinctrl
+              - apple,t6031-pinctrl
               - apple,t8122-pinctrl
           - const: apple,t8103-pinctrl
       - items:

-- 
2.54.0


