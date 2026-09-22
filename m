Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82A4C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TWtGuJsSnA6q09a1WdY7USh/zxzDAqnc0W6q2GxteG0=; b=2evFzYFR7TPKg1OYr/+HdSJqS4
	O6jKXTYke2rLEm6PjtyqagZxxgaoBNBRDJAm3AvSo7IymfFWlcpM0/fGSNIsoUEBGiUe3RGkeocZu
	vgDGaajWaZligQ35m/uSAZP8gRvJOGX7Sxcc3qSW30sij548CX1aGDz5mM1xAP4i4ZH0Uf0XmJ07p
	HBDEjdTvfqVx5SO+H7Dkvz7TNBfNYr0mVvo7EilJFelsUiGdhDr//Xi2fwDGWGSSrwIU6IKYMU4d8
	nUf8Di5CzmkdGneDL4A+Hcx2AFRyCGeDl/sUrSMNZvPrUFOvSQdfUdCOKj71ekx1AHY5ekYAPWFwK
	4eEk7AUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zZj-00000005Ibo-3W4g;
	Tue, 22 Sep 2026 12:26:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zZe-00000005IaK-36TR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 12:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=TWtGuJsSnA6q09a1WdY7USh/zxzDAqnc0W6q2GxteG0=; b=hBgMdBcNEMXLItiEoAVY814PbC
	7N4cx9xPD8aJiywMUpVqdxLQk5DwDGpBiuWoF0nm80R2ep71pJzawn3pwSxrkT42Un7lHx/CIDwGs
	bXlZJMM5sbvpgbVxQohypI/NHYL8BNvFfpVzPItq9MzwUsVHByBiaAUAOy7F/6d8Bsd7c3q82L7QS
	IqVwtB2PtqJN7oeOhlE5aeGxbH2zovGPuZHA3tPiaeuwc8D+p1DynI4ZePYtVeyeKQyKvSQvflMhT
	4b2KC+ydecwa6HmyLaM6TS+0kxG/CZC24mbDJBEbWZtHRGkSiGNbS5WVZ/F9mDXXrFk1akwNY3OmF
	eWYIxt5Q==;
Received: from mout-y-209.mailbox.org ([91.198.250.237])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8zZb-0000000DXoE-1oU5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:26:13 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4hpzQQ3JV3z7t9l;
	Tue, 22 Sep 2026 14:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro; s=MBO0001;
	t=1790078910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TWtGuJsSnA6q09a1WdY7USh/zxzDAqnc0W6q2GxteG0=;
	b=qeLr9vST+26kAoPTEP3kbkxBxnqAFhZH3M/tRa70BmsdR63LGw3Wfcw4AoIaDFrAD3BUy7
	tpWq4W0GdjNlznLL/monasWQxiXXVLX/oQxdQ+XVa3E5wf3/zx020ElKaZE4//QX12XTHa
	N5BNX3GWzMRkabVbhcbmQkM81XBj6hvSLI085HkwG2FFrypczl+jCPWnmbSE2TRJA4pxsR
	vGoicRgWNFmNsIf4NUmS2HJv/uR6k+JzQnKT7PSwIUw3XKOZ7xNmGKKhb5bLOE+bV6GPs0
	dn1n3DZT/3kv3Cy5HjQszhMNLKYRbJ/0MrOwPHFHXvAs9ZQmyoU4wPK3+Yzbrg==
From: Alexandru Chimac <alex@chimac.ro>
Date: Tue, 22 Sep 2026 15:07:35 +0300
Subject: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-exynos9610-pinctrl-patch-v1-1-26d8108c1802@chimac.ro>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7Zi2JCBcxbAowyhjpGBbCIZwd
 6u4fMn7728Q2AsHqLMNPC8SZHQJ9CkD6q27M0qXGIwyhaqMQV7fbgxVoRVO4ij6J042Uo+siEq
 tLx1VJaT55Pkm6y99bQ4Oc/tgit/e3/D8mtNnPDRobWCkcRgk1tlSnnP0lEOz7x87AquXqAAAA
 A==
X-Change-ID: 20260922-exynos9610-pinctrl-patch-e0cc7118dc97
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790078856; l=1196;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=FIDOhx16bKTnLhDsEzKck56HBIFnn9qu9WN0aTyG/g8=;
 b=kNSA6azedja79SBfwuu7Nch0yZTKElj/5HKy+Z3akWBe/0WYHt4q3hkj0KzayGzzCW65urG7b
 S31h8FfDFf/BQwxGLk6Pk5YDpZKaB3oLpsL1FebkBV/RXJd70IBy+3W
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_132611_989788_57878572 
X-CRM114-Status: UNSURE (   8.49  )
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

All Exynos9610 pin controllers (except PINCTRL_TOP) have clocks assigned
to them, so force the nodes to have clocks assigned to them.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
Most Samsung Exynos9610 pin controllers (except TOP) have clocks
designated for them, so allow the device tree node to include clock
information for the driver.
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 1feb6a6fc690..e4fdedb29631 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -140,6 +140,7 @@ allOf:
             enum:
               - google,gs101-pinctrl
               - samsung,exynos8890-pinctrl
+              - samsung,exynos9610-pinctrl
     then:
       required:
         - clocks

---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260922-exynos9610-pinctrl-patch-e0cc7118dc97

Best regards,
--  
Alexandru Chimac <alex@chimac.ro>


