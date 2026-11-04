Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEA5606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=afO+rT6+;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HVASworK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OmKsfl9uJsUWso+fMpxk/dFFuSVB9wUShIb6I86M6Xw=; b=afO+rT6+zPBGtf
	JwrUkq+4kQ5o9DgZZP1jYosAmUYdCOTdr3f6tEFlGAjy4MQvPoYEpcfEQPnzP+zivDzLagIONvutV
	yEFyjClD+oSqNXukO6xFzvl47HqYCjYJSjgCxsMQStS/uXlghL0VxuIkL0DvPtJyPV2AxTHmXytUp
	WqZ8v15Fe/LIngpqscpDupzZ9XsyEm6mAbJOYiOA1JJUfXPQ7ohaZk7fT/vdM9UzLUr6cdMiY+nkt
	PprnJ5U2/2W+2rLtdxRu3UwqWKJEL9vFysH2C6FMn9q7E3YqniMdYwTTSsqEDuS5K7WDQ80t+UGrL
	cRmZI04ij+iM2DuV/nWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkjD-00000007HHR-3rDC;
	Wed, 04 Nov 2026 23:49:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkj4-00000007H8H-1RcM;
	Wed, 04 Nov 2026 23:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793836139;
	bh=NjKQZleP3GcYsDwf94ycTmT6FiH5od/S2dfJRexNKCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HVASworKWrHbgBeyxEUggCXTadYlAuf2oaPMT1BJT0sltNz34MQ6vse9e4MzedMpr
	 A2tQIt9Z+5SDsUE/3Q8nPgpJQOYuGQpynR6hlBagEL8vjw4hMo79yPSH1omToEhtoc
	 LczQ4SYQFIAfbWx3sgNtTCEPa9MMM2qc5wc5QzGJqzJXvw+z1HEbMWhOo+bTNbUxGj
	 WyLUbfmOXwYlGcak9awaqG/smJIBRinc8CDqeptI7tWSLSL7RGVp6UDC9kSP3YKclC
	 dwIOvX5d/ZwaNEDt0ERbxnGknpBKq7ce2Kpy4hGlR4iN170PMrP460lmwAXWn2ozrC
	 5YbCaCE8UxpfQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 82CDA17E0D7E;
	Thu, 05 Nov 2026 00:48:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EA7D948003D; Thu, 05 Nov 2026 00:48:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:47:09 +0100
Subject: [PATCH v8 8/9] PCI: dw-rockchip: Set broken L1SS resume flag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v8-8-0434b4f373bc@collabora.com>
References: <20261105-rockchip-pcie-system-suspend-v8-0-0434b4f373bc@collabora.com>
In-Reply-To: <20261105-rockchip-pcie-system-suspend-v8-0-0434b4f373bc@collabora.com>
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
 bh=NjKQZleP3GcYsDwf94ycTmT6FiH5od/S2dfJRexNKCE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrxGoHvZr0cSFoeS+VJ9o5szng4QW621TUw
 Vk2qvOPnzLXQokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq68RqAAoJENju1/PI
 O/qa1usQAJOHCDfrJAH8J4H9h+WAwhi2xbEj/F1EHyCsHgL4ByhT/aXZC9nDwTpZpo1u6lMktVX
 049i8pQfSLvXKqmg969Ob9Senj26yp46SJ3gTlK3z5nKivHbj02ArhdMJYcZgH6IH+Aw2Ww9U4X
 QiE7pPCO0NTLsaM4sFLQz9sig2gO3c6e1eV/aSpSwnkUSrVBzxOjx85JWwelp3tOFdaUSfqYkM2
 4tgCfEuqCZWYpQq0diwdQV9KtVHYhLOiJjCV5ZWbX4/s1VfTNJCRBq6hfv1xVOssYxPpTjVTPDM
 gED87hoJjhpVoSWnsYToMcff9rbrxShg9Ole2P4wmqJRJJtaWWFXcPMMPvy5AD97Yzhf28PggDt
 ai+3zgMOiLbXHVSqQQ6FpWygWLKNBBCnkzyBJ1i1CbQNsyRmiD1RcApV2WKHnSU/3ACb2HjI9rE
 54M06z0JYtL/vtRjj1brVRKqnc5uPAAFsltG8UFZ6P9fcCuuPbUpO5PoIhXrhEJnaqvzZYCb5mi
 CrXQvfWJ8ao/ON10e/Dv6dkCJQKPpIDtzFdyv56LLhgl6XGM13++TbyXihPbVZOgjFK6OBG2PBH
 4ypCFQqp6NqmOZASYZA9BDQWrYL5hKXVIarvG4NbJRZylWT6mrCCTDWZUDqt+1fAyIwQIZ7u89p
 JzHHuxkbRjDOv4G8p1RUwtg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_154908_226184_C9B1A2B9 
X-CRM114-Status: GOOD (  12.55  )
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
index 7933c50df340..9a2606748281 100644
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


