Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8256F60A380F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mLlqUzlQ;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Kj23PAKK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kkJreVa8+Xai9L5OxC9rbi5pGUUKIA3s2uVNhelJY0Q=; b=mLlqUzlQiMxT0J
	tmXy2o0XIX4u3CZ1LSeOvYLixbYb6dhXU1Hgx4FYw6O9tP+nrQuiB0ySvxRaBY50sdgJXxR/42q3b
	QEt3qQiwdkkbe2N4VvTYft4XD+vd7CdAo9YTVb/U0i+/hnqRlMXu5rb/dMryM/utzBrp49l+merPp
	Hbrko9+Xrmi1cpqocv9gJo992TPvnnVXQCjQLTfKVCV6KtL4PjpNQd9Rjkzonn96mCekUiZtROM4Z
	cY8McSlOrCQPeAxPVTxmO5GUR5Wm7FoJr52YigPexoZaEC5GSWmknekwkrUkokB+EtSxrC//1nWPx
	K9O4pc39fk3ra7P6cg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgAS-00000006TZa-2pTw;
	Wed, 04 Nov 2026 18:57:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgAC-00000006TAa-43Bv;
	Wed, 04 Nov 2026 18:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793818601;
	bh=37OzYgJd/FguDZgdiGLTdbD5NRnqgBixtKnp3Gppbnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kj23PAKKgxk8193z+Ad4Z6yH9BCbfv9UgOszvW5tL3E/0TMazt6llUK8iZqoksY1D
	 3VXSnu4q2VkTqsQA+8L4e/6hqNCG0NNHJ20IExmonW7+D4a7EqazHnWspC6Ah+4hco
	 tY+eq4kf7w9CdDjMrutG+ZC9FM9+LP24T20G71fjEUeGVZFNyfbhjKG7aAo68mrFrl
	 7ZtKZ12/IeXzk3otksJ/+vdHe1jpo8GiUrkaPzP9p/AIJZ5bl4aL2AlNGTgm8wNiCG
	 GnkJz7Disnmnf6F3sPuvmzhdKRo35o+y/iDiIaoo6k78QN5YmOm/tIVajsJ4IX/mfD
	 eBV8QsrrXTK2Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 811A917E0D69;
	Wed, 04 Nov 2026 19:56:41 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DFC5948003D; Wed, 04 Nov 2026 19:56:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 04 Nov 2026 19:56:46 +0100
Subject: [PATCH v7 08/10] PCI: dw-rockchip: Set broken L1SS resume flag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-rockchip-pcie-system-suspend-v7-8-6ae6875939a2@collabora.com>
References: <20261104-rockchip-pcie-system-suspend-v7-0-6ae6875939a2@collabora.com>
In-Reply-To: <20261104-rockchip-pcie-system-suspend-v7-0-6ae6875939a2@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=37OzYgJd/FguDZgdiGLTdbD5NRnqgBixtKnp3Gppbnw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrf+hwNqc6k5R8mkHwP5aYKZKop3SBXtEdB
 dDcYAbGx2JqJ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq63/oAAoJENju1/PI
 O/qapYQP/0gRB0zlUGjyiF4uEm6a1cPbII10jJOjeenY5wZ21HQXW5aOXeMXQjs9S9yg4JKF9os
 txLBugUNV2EogdYsHMh5EN+Pccrq45SuaFC++B8IlZ88b/2VwZAWDztmRH+9lHEg94mS6V1nMsv
 3kTdLyiqtIZZJij2tflipjrYWo4H+5YMTLJuexrPX/K2YizooBZ0TfM65w1sVkjG2ABaWGscj0R
 09Y9TpDVPRlRuenco5b7ujRysrkLpYkWdvD5Xmxf4qn8Sn1ZPWDbrmbs4NMRXQX4LSMmAacsUUD
 utPAJv0Fct+XHzdy7eseXusS1bAolVCsdMJlh5Z7q64B2hFCZnz9us15kQ357Em0bBOtd+bFway
 g0JFv3C+1VrgWPTBjBrua+XMZzvpzF40Aj/Vznt/lPUn1yQpjk6OL07jofo23wW9r+ujhFhxCPR
 dntpTyhtUBrFhPRXbsWW/b+eXHtG5eyLXFLvBmMcsSGRlhn7DSJwXQO99oP/7/Ci/E7pjkJrW33
 TrvdTPwjmoyqkFjqMOIJZBEF7qb7uOrh8vvm/UL4+VJTtQwKsb3gVD4Pwlt4ACjbFHYV+kzaByA
 oWC4AFB7BONbg/hyGy0PaFiS3I6TUi47w+mHY2Fbdn+yu2Sz4qRX57Kf2LKbJduwhJvsHJgAPtA
 BNOMs248okKMpJURi5TU8jw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105649_261092_9A6A2E83 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

During system suspend, the Rockchip RC driver effectively powers off the
controller. If the link is in L1SS and the endpoint asserts CLKREQ# to
exit L1SS, the time required to wake the system and restore the
PHY/REFCLK may exceed the L1SS exit timing (L10_REFCLK_ON +
T_COMMONMODE), resulting in Link Down (LDn) and a reset of the endpoint.
Set broken_l1ss_resume flag to indicate this limitation to the PCIe
framework. This results in pci_suspend_retains_context() returning false
and PCIe client can avoid relying on device state being preserved
during system suspend.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 417e6fbbfe09..2e759f92b5c6 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -448,6 +448,11 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void rockchip_pcie_host_post_init(struct dw_pcie_rp *pp)
+{
+	pp->bridge->broken_l1ss_resume = true;
+}
+
 static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -487,6 +492,7 @@ static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
 
 static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
 	.init = rockchip_pcie_host_init,
+	.post_init = rockchip_pcie_host_post_init,
 	.pme_turn_off = rockchip_pcie_pme_turn_off,
 };
 

-- 
2.53.0


