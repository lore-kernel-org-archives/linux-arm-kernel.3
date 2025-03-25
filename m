Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC48C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2SQvHb0woGCrrQ6GyUHiI8uVqRyCw7YkVWhyWAJogI=; b=AmSEKdyHZwaaNoVnLSqFBnk6KY
	+lm5r9mHZ7hX2KXBGkW9xpfQyfLGmjRK0xMqlX842ZqRZo4EWj0BD6pL9n7jWc1VgCiNr3mr48qqZ
	Xo+5YutCrbLos0lpfJKaXItAky9zS3aIMaSTPKwqSH0OMs6CnvgHAemdo9I5NgXhoX5TOvRp6dX7t
	uYItbBgRgZE9uH0jnQu274yTc9RxQOMQbEYXHPdXOhZGRL+DDKGFIaGFS0oscAkPtyhW792NLAqpl
	IiZEdLGYEIJt0QYv1tLm58tXPGZa52nLBQOeTPPUzkJ4xxz6imyqYQKIs+25CiA0VD92UIN3USZqb
	s1rzJKWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1Zb-00000005S4Q-20Hy;
	Tue, 25 Mar 2025 10:31:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1UR-00000005Qmd-2Qmp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:26:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9E5E5C5BC2;
	Tue, 25 Mar 2025 10:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830BEC4CEED;
	Tue, 25 Mar 2025 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742898394;
	bh=/pBN+ohvIjqo2ih8p/b4lanOQSzFYkL2+lcRC1yvrVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G+oj1AWHl0o4XLiCt8VoROLvs/Q0L0pBhKLu06Ywe1Fg+BzXr9+5ip2+PApClIoHs
	 fs7zcKnQ5DJFV48eHfrQ9RUt7TtDPTaFkkhH7fIkBH0uPke3YjsU8elUwpv6Jc3WeE
	 8SOb+i0AeyL2ickHR8IG85j6Z7uX3iIY0Qs2qnvUVNsJ34ESqHmuJw8L2G2O8iZtNM
	 trJfNMRQmQXIPx7rSfMfHn1huIQps7TUqsh+nhbx0jbsaNCmbxerWXTh3sMjImBRRu
	 QIm5u42VFey8fYmjs9AbUng/ukqVW/96DNyFRqOrAVirWFSneaFxYuH0HcAPx/oEcB
	 F9ha/hulenm7Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tx1UO-00GsRS-Ci;
	Tue, 25 Mar 2025 10:26:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v2 01/13] dt-bindings: pci: apple,pcie: Add t6020 compatible string
Date: Tue, 25 Mar 2025 10:25:58 +0000
Message-Id: <20250325102610.2073863-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250325102610.2073863-1-maz@kernel.org>
References: <20250325102610.2073863-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_032635_719070_AE7D3CD9 
X-CRM114-Status: GOOD (  11.45  )
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

From: Alyssa Rosenzweig <alyssa@rosenzweig.io>

t6020 adds some register ranges compared to t8103, so requires
a new compatible as well as the new PHY registers themselves.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
[maz: added PHY registers]
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 Documentation/devicetree/bindings/pci/apple,pcie.yaml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
index c8775f9cb0713..77554899b9420 100644
--- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
@@ -17,6 +17,10 @@ description: |
   implements its root ports.  But the ATU found on most DesignWare
   PCIe host bridges is absent.
 
+  On systems derived from T602x, the PHY registers are in a region
+  separate from the port registers. In that case, there is one PHY
+  register range per port register range.
+
   All root ports share a single ECAM space, but separate GPIOs are
   used to take the PCI devices on those ports out of reset.  Therefore
   the standard "reset-gpios" and "max-link-speed" properties appear on
@@ -35,11 +39,12 @@ properties:
           - apple,t8103-pcie
           - apple,t8112-pcie
           - apple,t6000-pcie
+          - apple,t6020-pcie
       - const: apple,pcie
 
   reg:
     minItems: 3
-    maxItems: 6
+    maxItems: 10
 
   reg-names:
     minItems: 3
@@ -50,6 +55,10 @@ properties:
       - const: port1
       - const: port2
       - const: port3
+      - const: phy0
+      - const: phy1
+      - const: phy2
+      - const: phy3
 
   ranges:
     minItems: 2
-- 
2.39.2


