Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD5E606D83D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sb86EH3n;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nr8st++T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y70xh6Dm7wUw47WQ5EyKcGy1qtu5xknyvmKhrddb0cQ=; b=sb86EH3nUEHlXD
	lcAqMRFuZOSxvfPbB97kObbzPc/D6XrUxMjEEdSNVHEFWb9FMwPhcOskw7u28nyBnXPmoiJ7mZOXg
	33jmLMld4eSO1Mj6ewnyNKOkPZiEpqA9HWU9BTw61m2spsgNCf8U/7FMfJzANur79x3+DMtdzpdrc
	2aNS6eOjIZKv50CBsOCo6buQLLshDpOF3yATYelENNTLeSVmP3NYdETw4kB7tlDM8Umk/Vu+haABn
	0Yn7jJTQOpB7Kqumn0SOsHTkAPs2jeCayAXGhsNCrh3UOvgr+d6w4ipk7gVIJ43fm6Lt6xCX7YKoJ
	fLOXcQ/aXc9XVgePxFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkjH-00000007HPA-1aho;
	Wed, 04 Nov 2026 23:49:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkj3-00000007H8F-2ceI;
	Wed, 04 Nov 2026 23:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793836139;
	bh=LYbxaxyZ5Tcz6Rw2Y/EPOS/4B9CTHK9PDNSNUfs1tbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nr8st++TE6fMfn2xUniMFXm/Ev2ztgzgFOCq8GuIQCbkN0u2CzUGJ6MDywb6xkrUn
	 WZ7u6Rvft2UPxIVIIBzr3jVDOHdVhMNYd75MunHYGQPrgQ/rh5A5aL2ro/ED25BhCQ
	 65eJGVPX2bCGPBemvE8qRIE8RJ/IhdHwCwv/7vCTZWQIek/Ox4wvZW+jt5FQlm8u0P
	 5N3w6lIZCyNhOM0HwCWfV0kA5v9bwZX2vz1Z6YPud9Mpm2/Su7CPOTvR4OdRDG5mtz
	 bPTlmwnM3bnN21vCX4QZoX9Hug/biQB+jgY38LW0DmJ9G/RxiQS06aptukKIBkyi0n
	 cSlGysAOOJIjg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 811B517E0D69;
	Thu, 05 Nov 2026 00:48:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E8A9648003A; Thu, 05 Nov 2026 00:48:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:47:08 +0100
Subject: [PATCH v8 7/9] PCI: dw-rockchip: Add pme_turn_off support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v8-7-0434b4f373bc@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3089;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LYbxaxyZ5Tcz6Rw2Y/EPOS/4B9CTHK9PDNSNUfs1tbk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrxGpSLd/MhFImW6B1IFBahdG3jwPzVVzqG
 73EUhmfJJ0ZMIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq68RqAAoJENju1/PI
 O/qaflkQAJxZLiVP8p8Of0HbmN00pkuJvGUR1n961C4rA+6/zER0DD9ntOXx1zelUF9M+LZy0Lz
 2WCKd+PC0YSjW4dIaQO3YxeMkaGnHrBqOKwh28scfhkiig4J2sUh81lfkaAnhkTSFN6gYnWJJEN
 Pk0Ulw+I/b7wOym1O0hre+tbYywRDd8vfeBGG19nvZyyEsCpnk7QgC0tT3I7lzGzRNqu3z38xm4
 XvWbq9+iSRzPUIeLMrNNCazhWyUcWXIAoJV9pCBlJFGa7Fs9WvM9VpX4CbXaRJ0HC3TINaOjr+n
 UPuzowvfaLFDZHLyPqoBfRqI4Oqt5xM/GYiLy3Vj2Rv5ASWvKO2VqVLyh3nO69hgRiZ3Tk24JdP
 qaqt0WP7D6HuLwzBwS20jGYFdHdNXPYQGXNKjs4gXIvoeIUkN7oWaWdW7rN6ewizW9QSm1qyBg5
 kxmySoXEMjTMIzJrJu8XSQ+/yqhHcZIQkCx0iAqCYzUvhNteG4LAl2ZHYUXNhlBYN6qvJyxyY8u
 hgz95ZVWm0L6ZMBF0bFbD6rUrE0By2j60f3t+d5/JWq9mldhuCLdsiGADaXrBTm7kjNGTq6WY68
 Ue4NHVzBW+L0cQsFlcosA2q2C/l/h3DCHlMWv8QjEVQEAtTKjqrMu4PX5RAR4q/bmAAMBDIIeAO
 lbuZlJh0ZH3kdLD6o1gwtJg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_154908_276427_4EF75A62 
X-CRM114-Status: GOOD (  15.00  )
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

Prepare Rockchip PCIe controller for system suspend support by
adding the PME turn off operation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 47 +++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 0e26abc50920..7933c50df340 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -47,6 +47,10 @@
 #define  PCIE_CLIENT_ENABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 1)
 #define  PCIE_CLIENT_DISABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 0)
 
+/* Interrupt Status Register for Received Messages */
+#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x04
+#define  PME_TO_ACK			BIT(9)
+
 /* Interrupt Status Register Related to Legacy Interrupt */
 #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
 
@@ -71,6 +75,11 @@
 #define  PCIE_CLKREQ_READY		FIELD_PREP_WM16(BIT(0), 1)
 #define  PCIE_CLKREQ_NOT_READY		FIELD_PREP_WM16(BIT(0), 0)
 #define  PCIE_CLKREQ_PULL_DOWN		FIELD_PREP_WM16(GENMASK(13, 12), 1)
+#define  PME_READY_ENTER_L23		BIT(3)
+
+/* Message Request Register */
+#define PCIE_CLIENT_MSG_GEN		0x34
+#define  PME_TURN_OFF			FIELD_PREP_WM16(BIT(4), 1)
 
 /* RASDES TBA information */
 #define PCIE_CLIENT_CDM_RASDES_TBA_INFO_CMN	0x154
@@ -439,8 +448,46 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
+	struct device *dev = rockchip->pci.dev;
+	u32 status;
+	int ret;
+
+	/* 1. Broadcast PME_Turn_Off Message, bit 4 self-clear once done */
+	rockchip_pcie_writel_apb(rockchip, PME_TURN_OFF, PCIE_CLIENT_MSG_GEN);
+	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_MSG_GEN,
+				 status, !(status & BIT(4)), PCIE_PME_TO_L2_TIMEOUT_US / 10,
+				 PCIE_PME_TO_L2_TIMEOUT_US);
+	if (ret) {
+		dev_warn(dev, "Failed to send PME_Turn_Off\n");
+		return;
+	}
+
+	/* 2. Wait for PME_TO_Ack, bit 9 will be set once received */
+	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_INTR_STATUS_MSG_RX,
+				 status, status & BIT(9), PCIE_PME_TO_L2_TIMEOUT_US / 10,
+				 PCIE_PME_TO_L2_TIMEOUT_US);
+	if (ret) {
+		dev_warn(dev, "Failed to receive PME_TO_Ack\n");
+		return;
+	}
+
+	/* 3. Clear PME_TO_Ack and Wait for ready to enter L23 message */
+	rockchip_pcie_writel_apb(rockchip, PME_TO_ACK, PCIE_CLIENT_INTR_STATUS_MSG_RX);
+	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_POWER_CON,
+				 status, status & PME_READY_ENTER_L23,
+				 PCIE_PME_TO_L2_TIMEOUT_US / 10,
+				 PCIE_PME_TO_L2_TIMEOUT_US);
+	if (ret)
+		dev_err(dev, "Failed to get ready to enter L23 message\n");
+}
+
 static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
 	.init = rockchip_pcie_host_init,
+	.pme_turn_off = rockchip_pcie_pme_turn_off,
 };
 
 /*

-- 
2.53.0


