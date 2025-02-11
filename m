Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FF7C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KETb6jUJDsIFYbLNfZswJFm0D8g4KXETeYZ9lpgFSZU=; b=17g1SBPsG5Jjq9UAtjSymgMwKG
	hrGiWM7+LXNK+vJvaJbq80AFKDQVfXf2zHmYGV45+id6SqEGoWelLQiz8NNIqiG6ADkLBw9RnHfzM
	PcI8XB4U4o0f3wgnaABoejpSCRn6kDKVjLIGsEclrBrstjJKhu2RlAf6+eMJZB5tvOBlSuQcH32xr
	ijqRMoKyQvwyruQRYBL6r/U6pvFbqxlpIuC7MvooR6B2dVhdQFyZQTbNarlyGhWE7IbzwOs8Rjfrk
	5G+KkL9M4nX5/+XSaXloLiy5X+HnCMwWccfJMclGZaGPf2blZNO5xmfHmcBg9k6sA46n6GlgVIQcQ
	hAXqSSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwYz-000000059AB-2q77;
	Tue, 11 Feb 2025 20:08:57 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwLE-0000000571a-0j7z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:54:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739303682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KETb6jUJDsIFYbLNfZswJFm0D8g4KXETeYZ9lpgFSZU=;
	b=NPj1gyI8ZymeuCqAhTbAbmYWvMnmfdxaADDxf9VoSVNMZ/at+eh/gHVHOFI/90EF3c2cQR
	UpbhkH4mQ+2HDpvCv0mtW86NI74Jvgjp99AHOFdUpur+LkYa5ISGw8G64MkGroTiuWl6Re
	W9JOwR8FVPmDlDmb5TnRoxof5qYy8tpZZ+S9uhN++aqd5Huo7O4g5i+sgmWfXIGD89GpeX
	701q+NNVX3Dnh/fBV8FMuQXpdxuUY+iHMWcyZfIoFahCiLEuvCy0JrpN310AafK458hE4G
	0YDj0/4ckIC+r6RM1DOogk2xor7BIhKlzviztDwQGL9NohnTgX0gtrG0jGhOZw==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Tue, 11 Feb 2025 14:54:28 -0500
Subject: [PATCH 3/7] PCI: apple: Set only available ports up
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-pcie-t6-v1-3-b60e6d2501bb@rosenzweig.io>
References: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
In-Reply-To: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Marc Zyngier <maz@kernel.org>, Stan Skowronek <stan@corellium.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Janne Grunau <j@jannau.net>, stable@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=VQa9ECNMV5dQ+VPNHGrM6EfNjLD7vuIHAEUchvK/Y2A=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnq6r1foBi9YRZrXcHVAkQvYeTVMv9aps9Nidwj
 jtblZ/PGlCJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6uq9QAKCRD+/lBaCvVY
 DSxzD/9rBloDn6QBlNmK/61u1BJgVi4Dw6MNkUXbiP98cvMYhll8U+3HoGG8yje/h8NueaqDxBZ
 8iP89Scdg69/sCTU4EHBf2a3+uWS+8SSRmiDxJliskEzJ+xyG8f7MzPb2WLxuGbF/pspBm9RiFH
 kiiQ8Wi+HkS0oN0F5lMjc1cxcrW2O5DgfxSDsTbWfegmDfCH6R1GXnUMwpTfWYwI/fBCR4OSjh+
 1LdU3dGSC6wZvuv4ng2YlieS5f0N/jJU9keKq9al2kCkzr/mgSJun8TN9a0JT8N46JAgDWKKFzH
 OCJKtf0GHw+5cniAd6LP9AN6VMUNzaWoEqeNd3f2PGPa6qPG/Mu4lOLFi9ECzHLxuvlG9an0IwO
 G2eVoAGIsHtUgG5NOrGP0RgDzZLkBGFFGGK/ynQIISN0p9xHdTs+k814S/TcRkGtfnI7oQNMj1y
 OdXCBxhvJPRP4vIk6EPse1/RT7L1cjixTsNr6oF5UeSPn8sAv6PXP4wHuDQeSDYWQaSF7lVL2KA
 xlKEYjmy0GHMPdvJ6H2sROdftJIb0+SFabsQrHHwheitA0idvHkS2IOjBLm/38Rsz0ggNXJQnpT
 R1vJ23PAlTArB9RESOINl6YJO4RDnW4yYepnCILX4aHcFhOQ6U6GYCepgdR1PzurcaAUmeh6F03
 uh9EHFESSald4pA==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_115444_358882_7670D69E 
X-CRM114-Status: GOOD (  10.27  )
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

From: Janne Grunau <j@jannau.net>

Fixes "interrupt-map" parsing in of_irq_parse_raw() which takes the
node's availability into account.

This became apparent after disabling unused PCIe ports in the Apple
silicon device trees instead of disabling them.

Link: https://lore.kernel.org/asahi/20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net/
Link: https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org/
Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
Cc: stable@vger.kernel.org
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 drivers/pci/controller/pcie-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 8ea3e258fe2768a33ec56f0a8a86d168ed615973..958cf459d4c64dffa1f993e57b7a58cfb2199b8f 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -758,7 +758,7 @@ static int apple_pcie_init(struct pci_config_window *cfg)
 	if (ret)
 		return ret;
 
-	for_each_child_of_node(dev->of_node, of_port) {
+	for_each_available_child_of_node(dev->of_node, of_port) {
 		ret = apple_pcie_setup_port(pcie, of_port);
 		if (ret) {
 			dev_err(pcie->dev, "Port %pOF setup fail: %d\n", of_port, ret);

-- 
2.48.1


