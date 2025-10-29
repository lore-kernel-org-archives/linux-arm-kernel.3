Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988E6CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DReOoyj4+rs8rsV2sc0YGtNp5q5AxjUrORprpxwAL4=; b=REEVKFWxDdaP0v7QdvWbWcfyJk
	bjOhqQgz/VuuFq7aXfWXoDSJs2fLwsgj3carIAecz3oKQ5fyNYqTLK67RtsAnjW7vUO3lawwAD1Tj
	B1IMdyMz5HldAGOl7kKKKkMNub6Gyk4rQI/hJm5g1XB59OMHf9A7J+m3UK7RzJgGYxy8iBJiHcrAj
	OJopsX30E96w0iDpuwrOiSob0bcE9uSzEgUo1fBLvBcl9YIJMr++jjVZXGZw5EawVnjUwNYvzH1Xt
	MXpySkl0Aizq0wdXYksdn15gVkFrLe45jb+MmlEfjkXFbYqrgBTLTUm5cv47i1sxuuAOV7wmhH7hq
	XoItXOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAQG-00000002Ihs-1kTG;
	Wed, 29 Oct 2025 17:57:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAPy-00000002IOj-0EyA;
	Wed, 29 Oct 2025 17:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761760622;
	bh=PuyVfSl398NT/6ecyLhz+ySqbYBIDyiLnSHsDsbjgnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OVW3/HssUYIRIN6T0VzeMzq27aBBExEMMAF1Aut8MLTeyz103S9F2ozyP3TrP07Fs
	 8U/jT0ru5u3SBdQMS9tz1CbtMpxCSY/9mM7lPQK0fu15Wn184cHZc0n5ShPh/tovVv
	 TQNAFe2MncWhPpNQ4VKCWCQCTM2ssQ9zmZknxWMmKZovbfxa2zFUI8zJ0i4NEuKlLy
	 65SYthHmso0Q0Tnz8ZX2I9PfPZwXlwWcdVcVw6saDlkF7eFrgqGvtqNXISvAGA7tG9
	 OX02lB/EJMJw/LBWI8bUrhHZ/hkyVeli2QEXtFH9FS16sCWJfg7HR74Qxm/ZI9OC2C
	 pVnGLnC3HVoSw==
Received: from jupiter.universe (dyndsl-091-248-085-053.ewe-ip-backbone.de [91.248.85.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 69DBA17E0FC7;
	Wed, 29 Oct 2025 18:57:02 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1E062480048; Wed, 29 Oct 2025 18:57:02 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 29 Oct 2025 18:56:41 +0100
Subject: [PATCH v4 2/9] PCI: dw-rockchip: Support get_ltssm operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-rockchip-pcie-system-suspend-v4-2-ce2e1b0692d2@collabora.com>
References: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
In-Reply-To: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=PuyVfSl398NT/6ecyLhz+ySqbYBIDyiLnSHsDsbjgnw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGkCVW28H/21LLERHjkq71fIYPt6/SEpljoWa
 BB5CDQXS5JngIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpAlVtAAoJENju1/PI
 O/qaVLcQAJp8e92zwlTDz6wMa+kwBneL72FSfp7tTJ6Em5BGqGUFX9yESNKiTFPHJYweHs9BHvF
 2QQo/waZGNExHAD5gRNVXBySRO6IWHlHgQ2LRrMD31MdMR/CvISeo5o9J5ZWCieG6oVXgGnPER6
 6EYRcrfDS0AYmk6bVsTQhTmUfeoWRjD0P2OBv4YseEMMnQZ8u1spKu9THXIO+IMdKSHoTGN8NEp
 NjVNjSqjLdUgkM3Ib78GmXhApCs94oFxA679a8vyBkcIqbaNrjr+1ittAoeW4A7ylIKTERqSGpG
 cUN+g9cVaACEdt7N2Bon6FUxomSL8QNv+fGwYueFCezjP/Y38gAc5INLJAAmV2UHt3f0vETs91Q
 z2936iltjMbwabUlOAhj5KycF6NGwPIgUbga71SxLFTk1osW8sD+X4lnmoWUXadY+TyltfhrMNg
 w6BhAD++3321oR2sibCNlvjEE7ljbk0pmSnFTGA81CnaP322i9rprD6cfpuVTHy8yIsM6a5u1hf
 lW4hTtrUFeP/J7GagYr/ilVjBKsB138AwZFx1KAVlpYFGsrDoO4WxfsAPLy06+B9E5ksf13MATr
 ClswZmNkLabrmX3FH6WQbaNim1QOWcBN2YHiw8Y4FKy/nnCmE4NKkhR+8RSYC6JN9nHXLC0bnrS
 8Fyea40atVBsk4dW3ErAklA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_105706_319203_2604201F 
X-CRM114-Status: GOOD (  11.61  )
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

Implement .get_ltssm operation function pointer, which will be needed
for system suspend support. As the driver used to have a function
called rockchip_pcie_get_ltssm() with different behavior the new
function is named rockchip_pcie_get_ltssm_state(), so that issues
can easily be detected when porting patches.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 58427db1cc65..e3d7792f7819 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -180,6 +180,14 @@ static u32 rockchip_pcie_get_ltssm_status_reg(struct rockchip_pcie *rockchip)
 	return rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_LTSSM_STATUS);
 }
 
+static u32 rockchip_pcie_get_ltssm_state(struct dw_pcie *pci)
+{
+	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
+	u32 val = rockchip_pcie_get_ltssm_status_reg(rockchip);
+
+	return FIELD_GET(PCIE_LTSSM_STATUS_MASK, val);
+}
+
 static void rockchip_pcie_enable_ltssm(struct rockchip_pcie *rockchip)
 {
 	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_ENABLE_LTSSM,
@@ -446,6 +454,7 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = rockchip_pcie_link_up,
 	.start_link = rockchip_pcie_start_link,
 	.stop_link = rockchip_pcie_stop_link,
+	.get_ltssm = rockchip_pcie_get_ltssm_state,
 };
 
 static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)

-- 
2.51.0


