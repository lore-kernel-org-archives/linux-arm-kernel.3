Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D0EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0x24XwEKZGWkOLEpWqoFhPwknA22x+KiukQk3Y3LopA=; b=JCIlHACahXy2eGLuWOdl7Y/eFY
	0KDRIYR1MK+UpMzpte/piCSUE0ZBhXkH1gWRvyxWBL9qszTZhZoEMBJgNM+vGKQFBXNm3vYIRJi3w
	msB6vxYsVgf2ThPpBtC9I4g8C9Qcja9MQ+tNgN1oGPc6bT0ejpPMnvu6aTe2z4Lc79zqSotPNAbZn
	HXJh124z9dkvgjU+iCca2kLQLFhtuCb3u2m7mD/drIA6Txk/APtzI8kYickkVshbJ1j0hYOxkgkpY
	LP58wUsULlKeaBRSjNGKPU3k1h1DKziiJzcpqsxIF98jSep6W+5MPLoz14qw3ywpMPwWl52IEjKG/
	o5rjZdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVpv-0000000Fw8N-0zIX;
	Thu, 16 Jan 2025 19:47:27 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVnQ-0000000FvaA-1F7t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 19:44:54 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 2F909C002825;
	Thu, 16 Jan 2025 11:44:50 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 2F909C002825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1737056690;
	bh=kn6/zBHCGJlt3wXOC8g6H3w523YCtAh1W1ztNmBm9Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MShopdcz8biVW8zFqwZe0qtX6eNczDdICj2aaD4fXFOoD4/uVywuGvb0jUf7f51RQ
	 C06deVf6pb9fiYdfsqMcwLa5o8x/3sEuJmJusmOyBDqs8vzUCLn4yvF5Cvt+aknL96
	 /6sSIciEhRAuZ73J5eASsOSdKNqDOfchjdb79sPk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id B0C0218041CACA;
	Thu, 16 Jan 2025 11:44:49 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org (open list:BROADCOM STB AVS TMON DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 1/2] dt-bindings: thermal: Update for BCM74110
Date: Thu, 16 Jan 2025 11:38:41 -0800
Message-ID: <20250116193842.758788-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116193842.758788-1-florian.fainelli@broadcom.com>
References: <20250116193842.758788-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_114452_486799_661F4BD9 
X-CRM114-Status: GOOD (  11.44  )
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

Update the binding with the BCM74110 compatible string which denotes the
first device we need to support in a different process node requiring an
updated thermal equation.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
index 081486b44382..2f62551a49c1 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     items:
       - enum:
+          - brcm,avs-tmon-bcm74110
           - brcm,avs-tmon-bcm7216
           - brcm,avs-tmon-bcm7445
       - const: brcm,avs-tmon
-- 
2.43.0


