Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B12C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 20:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5zvtELYdfg78Sbj3ph4wBdcMnC22AQDDB19emjW67I=; b=Gn/U9dh+oMsAuXpV2CMze4KT6z
	jABtKFbLOyzD/o0RhkTABfZ6XDTcqvav07LyApQi/0iGBcOzkN1KawbQ4aoKBF5vrb4PB2XY5toN4
	czno2kuvQb+WdlXrYPZqmf4cD0YGpFWtRnJRppod0Eic/91Qnuowp/gBvhH2Yt5ZsOGw+TdcCGvg9
	Eech2CuNXoD79y3BOH6bhQUxgRggU+TOw4IuB4mguvWmDNUMYeUmvdKnsh3N1DdhVdDw203Wvspdz
	ARMZa46UsykiXU9M0PajA3jhKOVvW8lWr84zeBV4lqdNLv5NtQAUHjYfW8cfazcJ8DyBNbWdmID4U
	Uq6XEbbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyysz-0000000Gd7B-25Cb;
	Sun, 30 Mar 2025 20:04:01 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyynm-0000000GcU1-3z6N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 19:58:40 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZQlSX0yn0z9vKS;
	Sun, 30 Mar 2025 21:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743364716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5zvtELYdfg78Sbj3ph4wBdcMnC22AQDDB19emjW67I=;
	b=xtEjQVcLyX+MDGVldXa/kbkIOOuMrjBjBezsfhWTSlfKy/+nTbA8sw2QFQNHv6ZCRYheKS
	VGhsCXor3b1cSuHwTKS1o5nZs7Qd3gAVzDmAedhQIAuKW0KYwwJSEcOZLLqX58AZ+mg+dQ
	zuDPqCviNDNewVpMCg3vRTiwgtcBwA7jTnHrHQ2KgmsiAIUumByv9I2PMqfilg8djXQND+
	JF+cXiZHiOrYC3Sp2Vu2qrcQnXkSB6kLVCDdZ49aSrFh73HHnyFpR8Nr2NOj4vTga4LhEl
	5G0VyXW6VwQvxp8pKPJh/pdAVgu8xvpGP8LRDsUn9tr8OX+YephyGIYrHfLm0A==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743364713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5zvtELYdfg78Sbj3ph4wBdcMnC22AQDDB19emjW67I=;
	b=AJAD76cwfcL1cADI3rx7/pIl5rjH53YlSC9uqGKTTvb00YK7VgoRGo3IM4lb8hQpHngjpZ
	gijY6wCpeXdEiR2EhVmrlAd5gArCquroty02GeSCWvZhwgOielC2wK5FVq+cxoiVgbquif
	whqdQEE8d7AuXdMBXFhZAI0oh1p14qfPqD/ei2rXqXUjNlitqaLK+XmZl84ZsyFECii5jb
	xDITMe4zoyeuoSVCTqcUmz/kFSrlAeKpJfHsu79YvGN10O9hYjQi4nWFVSuOFXwRXIeMTK
	xiNcikJiHN3gEl+kEM7nolkJ9q9jb/L/r92v6FBE8s07L+bqfQIdaKXvEQsm2g==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
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
Subject: [PATCH 2/4] dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
Date: Sun, 30 Mar 2025 21:56:10 +0200
Message-ID: <20250330195715.332106-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b8661ee7c2dfdccacdf
X-MBO-RS-META: qixsr7raqyt3ypir5g31bn5b5xg8inia
X-Rspamd-Queue-Id: 4ZQlSX0yn0z9vKS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_125839_131913_A15DC332 
X-CRM114-Status: UNSURE (   8.72  )
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


