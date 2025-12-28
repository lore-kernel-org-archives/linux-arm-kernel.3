Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C68E8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 22:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq9aayqfYvVewnPj8/RY3Bsp7mk53T60Fz3s7z8C91I=; b=nVpLbwnczE+FG6GCq04LiXZLGs
	uu41oynRNtkirNMPzY0vBTqbYRh8hv555THI+hI/HNOrW2aY/bdsQg73QCH7LIejDTXATdUzi9bmd
	hbxO8BCJd7XpS8um1XL09osxBFWfMHBHXkV43bZ/HdR6WgqfX408H6JQ1awU9eY9n/FOt7MjiP8if
	JpaJNbuJ1uPcyNrPO0OK6vdmRanyq46HZeH/Dl23XINUUNyzWnC8rhTrgjIIcl4bG/rBmRYhTQ5yE
	QPCtdwY0dGvwBnRw5RLrnQ894+4KXN/fOofoLBc5OZiSZFdDVVK/NJCFShZ0/OM0qeTgHx0klrtuD
	rFSqznvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZzZa-000000034uE-3j9y;
	Sun, 28 Dec 2025 22:49:14 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZzZX-000000034tT-3foU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 22:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766962150; bh=smAi/hi3Lxzeb0o1tPh7+QbJ5fBaBN7MJgWw45NPl6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uQ0Yznem70A8S1DSJUCUy14MtJ94LTVeZx4n5hjlP7zxKr+qu76q+2ZvNLmEc5+/w
	 CjY1F/CDadNchQHM57XZW8xpkFS8uEV2XrP74iAx2WEfGCRz+vSB4/DRdgRMvcwK2K
	 eAGnPtbuYeVtNpDTqmtMthg4v8GG9moHRO//d5POyNYNwUs271cBomyVNbZtUYHBNc
	 u1ELI3xhe6eGdWb6+oB2F48yLgG1KhVdkQatGuZ4YX3gT0RIf3eNPYdbyOsOEyERx7
	 7dQlLNR86+KCTrN9V73BNT4+MGmeGBQU/DOVEFEGbDpaKEQR1es2mvAhsiwZmvvJBg
	 rvaROzrCytUtA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 4783F3DAF7E;
	Sun, 28 Dec 2025 22:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766962150; bh=smAi/hi3Lxzeb0o1tPh7+QbJ5fBaBN7MJgWw45NPl6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uQ0Yznem70A8S1DSJUCUy14MtJ94LTVeZx4n5hjlP7zxKr+qu76q+2ZvNLmEc5+/w
	 CjY1F/CDadNchQHM57XZW8xpkFS8uEV2XrP74iAx2WEfGCRz+vSB4/DRdgRMvcwK2K
	 eAGnPtbuYeVtNpDTqmtMthg4v8GG9moHRO//d5POyNYNwUs271cBomyVNbZtUYHBNc
	 u1ELI3xhe6eGdWb6+oB2F48yLgG1KhVdkQatGuZ4YX3gT0RIf3eNPYdbyOsOEyERx7
	 7dQlLNR86+KCTrN9V73BNT4+MGmeGBQU/DOVEFEGbDpaKEQR1es2mvAhsiwZmvvJBg
	 rvaROzrCytUtA==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id A4E4B3E915B;
	Sun, 28 Dec 2025 22:49:09 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: pwm: nxp,lpc32xx-pwm: Specify clocks property as mandatory
Date: Mon, 29 Dec 2025 00:49:06 +0200
Message-ID: <20251228224907.1729627-2-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251228224907.1729627-1-vz@mleia.com>
References: <20251228224907.1729627-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251228_224910_309175_4C9CB169 
X-CRM114-Status: GOOD (  10.08  )
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_224910_309175_4C9CB169 
X-CRM114-Status: UNSURE (   9.44  )
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

Both described in the binding PWM controllers depend on supply clocks,
thus it's necessary to specify 'clocks' property in the correspondent
device tree nodes.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
index d8ebb0735c96..cdd83ac29caf 100644
--- a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
@@ -27,6 +27,7 @@ properties:
 required:
   - compatible
   - reg
+  - clocks
   - '#pwm-cells'
 
 allOf:
@@ -36,9 +37,12 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
     pwm@4005c000 {
         compatible = "nxp,lpc3220-pwm";
         reg = <0x4005c000 0x4>;
+        clocks = <&clk LPC32XX_CLK_PWM1>;
         #pwm-cells = <3>;
     };
 
-- 
2.43.0


