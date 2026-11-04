Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C7606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MAyvfjye;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=q0SMfaL9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QzOzs4jSjCgV4uneL/qfZKjvEo+4hlNjnD9lgdT5DE4=; b=MAyvfjye7n8wJ1
	1yqdiG0/vsAGbRlTP+6Ds4DpuYrgbV8zj0bd1DxHpVU+Nc1vHFyQ+rXt8M59IEXTDVlTFlbX1L0am
	Q5HvHozeM56EUGmy4Yzjz7oL5uL+VV3sA731OCn5jXBBmnl4f5lfjBXyAJoWppH8vXIpf9Zb1hSuj
	FpNDQ381RlGNGbSKGvk0R56exxp/lWioW8f+NoRkWmwkVee6Qfa5+NosdmVi+dXAlREqFZOgrfIAr
	FvuB1enwEMP4vmwkYg6jVoRIXgDPWngfwBO5zux13IzKplgA0MkQzAkeqBQXOPoeoli1gaTO9JGz/
	zkAWfEo+4xksa1mZUhrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkjL-00000007HZB-2BeW;
	Wed, 04 Nov 2026 23:49:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkj3-00000007H81-0BUu;
	Wed, 04 Nov 2026 23:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793836139;
	bh=LVP+Kp+zaGqKUkjgCRPI3zygD0dWAB8hTjJrI4ACTJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q0SMfaL9+E3BlaTYleBCHiMMElo0TMGIFr4mNH20jCC/SuRl8BBsdSaa35RYZ1G84
	 RKxOyxrw6YWMfYo0tFMDS5NnmHr1BN+VD8NcWfyUzIX/NChNJ5AQQ84vwmD/+GpFSX
	 ZKcLRS9grqX+Y13zc3vykXlIDLHbMvZ6nfA1g3OumG04OuUXjILDy1Zk2EBkD1KSUp
	 dlPGb5ZuItX3XuE3t86sKgv2bnlgGHf8OewOP+HB8Wh2mRGFqOE6HGd3SQnGEim9Zp
	 CzdLZFyqsb3CkaJS8HFoljF8Vk7BaLiIZmTXRbISpXHOA8eWnCUZRZhthxiuhGvAPN
	 kZ/bM7CpF4VcA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B22E17E0D58;
	Thu, 05 Nov 2026 00:48:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E4D0B480035; Thu, 05 Nov 2026 00:48:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:47:06 +0100
Subject: [PATCH v8 5/9] PCI: dw-rockchip: Add helper function for
 controller mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v8-5-0434b4f373bc@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2004;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LVP+Kp+zaGqKUkjgCRPI3zygD0dWAB8hTjJrI4ACTJ8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrxGrwUWHYd3YDVNiOz2oYmsgJ/bKJ/8289
 pRQg3Jko7MnaYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq68RqAAoJENju1/PI
 O/qaNAoQAI/N8XJIfPYYHEn4H/btJZM4VYRAy29n2wI95ciz91fLqxrWrIqzk2ZLlP/CzrAVa/v
 ApnRE7fuRVJlisy9wAfP/Hd6GLIXgHmTgUlIYV4S2d6FgrW9dcJJ4uzhXt5/W/D1OaEot44qAlU
 bc6RZP1jQx7TlLky30ZGvT/VLNcDpquo4lkaNhOi1ku7uyfQWKjsn/FwFzZBn7Pseiuej0TJKYg
 8/WHBUJG8tjc2TFLFW7bf7+2AecH3qWZFW2Z4o5JOZwkZOOYM6mHBQD9MPpOwhDqkO+WXkOM0/e
 WTTFrWZtWdqCunvqlLA+FNKdCJiDdZvnN8lyZRvC5+Km4qt9KMsEHWCFsEgsVg/6FizeYdRQfre
 ab4F6xFZT6duukVYAaD+Wkoz6IozvbJwIZ8hDOzOTD8gVYEb15xM+fkstIWJdWMQb0G9FUzs3En
 rzIyy2jyEcWea+RIPN3A9VU24C35rmMKbYp12RxCAgSdNgq+75PBnEEB6UFvkpdVm6I99+7/h3J
 ccyB1AtUhlQqE3N0Bk8juceLoaZ8O8YQ1iJrMUzuP6B4hPyzpxVtJzEVk7klz/7ykktdfpvW3sX
 IcfXMGNGLT78FNufvlt9GjdfVO8clj6EMoal4OYunKva6JCoXdNESmAPrUEbLA77FVpu/qav5Jy
 kI5Pnxk/ppBL/ogipUrUvkQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_154908_255161_D5D14A9A 
X-CRM114-Status: GOOD (  11.93  )
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

Remove code duplication and improve readability by introducing a new
function to setup the controller mode.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 92154a790ac0..c6a4649dae2e 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -695,6 +695,11 @@ static void rockchip_pcie_enable_enhanced_ltssm_control_mode(struct rockchip_pci
 	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
 }
 
+static void rockchip_pcie_set_controller_mode(struct rockchip_pcie *rockchip, u32 mode)
+{
+	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_SET_MODE(mode), PCIE_CLIENT_GENERAL_CON);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -719,10 +724,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 	}
 
 	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, false);
-
-	rockchip_pcie_writel_apb(rockchip,
-				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
-				 PCIE_CLIENT_GENERAL_CON);
+	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_RC);
 
 	irq = of_irq_get_byname(dev->of_node, "legacy");
 	if (irq < 0)
@@ -776,10 +778,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 	}
 
 	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, true);
-
-	rockchip_pcie_writel_apb(rockchip,
-				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),
-				 PCIE_CLIENT_GENERAL_CON);
+	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_EP);
 
 	rockchip->pci.ep.ops = &rockchip_pcie_ep_ops;
 	rockchip->pci.ep.page_size = SZ_64K;

-- 
2.53.0


