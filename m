Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C3DC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBjxn1mu7JMgqW8Ifubuqannjf6s0M2pr1zzHamcZZw=; b=mLziNDulJTAPT7RpowLCYQ+m+a
	sZ9hgmZnVJxVd68vM9Uaj6A0Jw9IA15zm8ujL3ooukLMIt20daGQJLnm0H7JL3EAOstGP3gPyXQgj
	R32kpsg5SM1dMCrUAtZamsENyBppcp4e/UBwQCB69mQFmReb/rC3vESFOD90pN5eyMI6/WPkuYPgk
	epAZCGsBQjlBxi7LAZ6G2dHAi3ZkiMIV3zlp3LeoRQpOnVVIKEr8XfatOD9Yu60dmrIlpjROkCmTR
	o6evCgiPtF4IWGOyjhUvUVns6D7vWkCkIIEkGQf71AA6kDp3ra8KsvsGX+6z+EGFTlHUx1dW4MyQ8
	gDXxxTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdin-0000000A996-1bYw;
	Wed, 09 Jul 2025 22:57:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZbwJ-00000009rQ1-2Ms7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 21:02:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21CCB46DBD;
	Wed,  9 Jul 2025 21:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83955C116D0;
	Wed,  9 Jul 2025 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752094970;
	bh=AyOagcGSXpBuGhg+sk+h2sw3geLwEXSyFxwH/3Qmsrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=etFZRhC0miN9k1CNzmvqIvCJXGO8tZfDdYMCz/bLC1LFJXNDXLlqbL68MV6Ze8TIw
	 /4g8t2xPkNWiaNUSPlRAE3x59UQMpTxDJrCSbo+bW5sIKwtjml1U5JALNuuw2yY7YM
	 RCkq3aCkAj1MLPv7mmQZ338Kq5s1h9GQO1MAKHJmNeukpUY/AEzcTiLabjFS8X+2PC
	 lltIdxXbepB/tGZJ2a3FyfyRzanlD94BCdv0Z/qSFauX7Zf0D4GK4t++2w9s2u/jKx
	 sC633r7OmS5pe44vv4JZGuc6fncA7fwhEpjsb/C4RWLAQwIt6zKld0OZ5mmzJo6dTB
	 Vnz12DHrcJMIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE6EC83F17;
	Wed,  9 Jul 2025 21:02:50 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Wed, 09 Jul 2025 17:02:16 -0400
Subject: [PATCH v20 4/9] PCI: endpoint: pci-ep-msi: Add MSI address/data
 pair mutable check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-ep-msi-v20-4-43d56f9bd54a@nxp.com>
References: <20250709-ep-msi-v20-0-43d56f9bd54a@nxp.com>
In-Reply-To: <20250709-ep-msi-v20-0-43d56f9bd54a@nxp.com>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752094968; l=1452;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=5GnLijRH62gBTUdnVBRu9d7hyvLf0+eT6hrBiV+MYG4=;
 b=HvRi8kQvdqnVkTHpFheFfUswDpWAOk2mmjMD4QrLCXKcebMd+wAbQs2SSaRVAXaK81OU/Ydl8
 tj21xJvXeNOCewquYk7BcQpWGKsTS3AIuM60F2BsH0CCcpZXcB8y8uQ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_140251_647190_9117D60B 
X-CRM114-Status: GOOD (  10.03  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Some MSI controller change address/data pair when irq_set_affinity().
Current PCI endpoint can't support this type MSI controller. Call
irq_domain_is_msi_immutable() check if address/data pair immutable.

Also ensure it is parent MSI domains, not device-specific MSI domains,
since device MSI domains do not allocate address/data pairs.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v20
- update commit message
- change return error code to ENODEV

change in v18
- update commit message. remove 'include/linux/msi.h' part.

change from v14 to v17
- none

change from  v13 to v14
- bring v10 back

Change from v9 to v10
- new patch
---
 drivers/pci/endpoint/pci-ep-msi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/endpoint/pci-ep-msi.c b/drivers/pci/endpoint/pci-ep-msi.c
index de610c16f68986eb0a5f4a0f23bd0136aa169f97..2b4405cfeb6f8f3cbe9782c793604a10dcaa4eb7 100644
--- a/drivers/pci/endpoint/pci-ep-msi.c
+++ b/drivers/pci/endpoint/pci-ep-msi.c
@@ -55,6 +55,14 @@ int pci_epf_alloc_doorbell(struct pci_epf *epf, u16 num_db)
 		return -ENODEV;
 	}
 
+	if (!irq_domain_is_msi_parent(dom))
+		return -ENODEV;
+
+	if (!irq_domain_is_msi_immutable(dom)) {
+		dev_err(dev, "MSI controller not supported\n");
+		return -ENODEV;
+	}
+
 	dev_set_msi_domain(epc->dev.parent, dom);
 
 	msg = kcalloc(num_db, sizeof(struct pci_epf_doorbell_msg), GFP_KERNEL);

-- 
2.34.1



