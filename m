Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8530FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V88X+mCNI0ORLIOIIxyKfe8/ZtK8PHIG5p0cdlRBbTY=; b=sklt5E52H0mkz3yP16pL4ENyfd
	aB3je7ZDWZL7XP5vWqv7F2wPmSn0CImbfIkMGMh7lBxgYLjCCxvXbUrmI1r5pEwbZOCAAQEufzhiF
	+urz6wbOeItHzqMwpJ83zx4jXcBB6uQoE9pmqlcB6gSkksav9DTBVGEFwRRxVvK0VMWnc7XUDLPuc
	gmhbqREzGdPZG34Mpu2pO7k5THLwjpLxY8f2QJKXXtPsGZHkuakXUnni7OPkIL8exOlONDdu5cZl/
	0kpCAuoZhSg6LQIhiwumWuOJqlK8iAu1/KvjK1Kmc/2mACtPrhlL5dfvmZ/FeIavzNvBwtAQMH9T6
	KXSR8tcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdij-0000000A93Y-3PtI;
	Wed, 09 Jul 2025 22:56:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZbwK-00000009rQn-1ICC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 21:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E1DF61495;
	Wed,  9 Jul 2025 21:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0186C4CEF4;
	Wed,  9 Jul 2025 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752094970;
	bh=ZhOpD4uE06bSl49Vy//uqz1o4AjQqGjxPfMTgkddWP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KNqZPwwFz684W2wPS+PjJuhnS/W4TE8vkqqAyGZaynUqWToZcKV34tpW4Xz0jjVsp
	 hH8DFlp1lRI4eV+FnVimzRCX5+s8yG3hN8Axn09k5KZNKhHEhBT8f5XLUz04N+WK8p
	 ETP7/9ZINBCj7g1SHtiXX1drGFkTG0ZsAt90QpDeNwhr3MKDRPjQhAfOdeE4m0ocrt
	 jP1szQX6q0yAwGS6MwYQ+t0YqpiXUSq8mGbLdsynO7JM+dWf94zShdgELnDLtd3AGX
	 /f/RhI+YeS0D92mcC2I8N6JnVhcuXkYGstd+QCd5LuKfyK0lPRsw27alRhQkSrF9st
	 e0heJEPtWCIhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11EEC83F18;
	Wed,  9 Jul 2025 21:02:50 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Wed, 09 Jul 2025 17:02:20 -0400
Subject: [PATCH v20 8/9] selftests: pci_endpoint: Add doorbell test case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-ep-msi-v20-8-43d56f9bd54a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752094968; l=2413;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=DF/gzaI0MKU27j4SEtbbhXRg9y3PEJqjIqoano8U714=;
 b=a6gnp8u8O795/R0p6ZjiJhEZA5Qk09eT8q9NFI2+fCPfzc1F/KrDN6Ov4sdeNa2sfEKPQH5Wz
 sUKXPYdiqrcCtzdhAnea1XzTNhJ6/G+CWFkrildTnmpbPr/23Dp9+MG
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
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

Add doorbell test case.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v20
- update document

change from v14 to v16
- Add set IRQ type

change from v13 to v14
- merge to selftests framework
---
 Documentation/PCI/endpoint/pci-test-howto.rst      | 14 +++++++++++
 .../selftests/pci_endpoint/pci_endpoint_test.c     | 28 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/Documentation/PCI/endpoint/pci-test-howto.rst b/Documentation/PCI/endpoint/pci-test-howto.rst
index aafc17ef3fd31f6ada38c82c8df133b87f7a1ae1..0cee35dcb29cc938823de53ef6e1a1cd81d49d52 100644
--- a/Documentation/PCI/endpoint/pci-test-howto.rst
+++ b/Documentation/PCI/endpoint/pci-test-howto.rst
@@ -203,3 +203,17 @@ controllers, it is advisable to skip this testcase using this
 command::
 
 	# pci_endpoint_test -f pci_ep_bar -f pci_ep_basic -v memcpy -T COPY_TEST -v dma
+
+Kselftest EP Doorbell
+~~~~~~~~~~~~~~~~~~~~~
+
+If EP side have MSI controller, run below command to test doorbell function.
+
+	# pci_endpoint_test -f pcie_ep_doorbell
+
+	# Starting 1 tests from 1 test cases.
+	#  RUN           pcie_ep_doorbell.DOORBELL_TEST ...
+	#            OK  pcie_ep_doorbell.DOORBELL_TEST
+	ok 1 pcie_ep_doorbell.DOORBELL_TEST
+	# PASSED: 1 / 1 tests passed.
+	# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
diff --git a/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c b/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
index ac26481d29d9dce5d07de563048850c55c58c22d..da0db0e7c9693f11b4975ca0e6830174229983ba 100644
--- a/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
+++ b/tools/testing/selftests/pci_endpoint/pci_endpoint_test.c
@@ -229,4 +229,32 @@ TEST_F(pci_ep_data_transfer, COPY_TEST)
 					 test_size[i]);
 	}
 }
+
+FIXTURE(pcie_ep_doorbell)
+{
+	int fd;
+};
+
+FIXTURE_SETUP(pcie_ep_doorbell)
+{
+	self->fd = open(test_device, O_RDWR);
+
+	ASSERT_NE(-1, self->fd) TH_LOG("Can't open PCI Endpoint Test device");
+};
+
+FIXTURE_TEARDOWN(pcie_ep_doorbell)
+{
+	close(self->fd);
+};
+
+TEST_F(pcie_ep_doorbell, DOORBELL_TEST)
+{
+	int ret;
+
+	pci_ep_ioctl(PCITEST_SET_IRQTYPE, PCITEST_IRQ_TYPE_AUTO);
+	ASSERT_EQ(0, ret) TH_LOG("Can't set AUTO IRQ type");
+
+	pci_ep_ioctl(PCITEST_DOORBELL, 0);
+	EXPECT_FALSE(ret) TH_LOG("Test failed for Doorbell\n");
+}
 TEST_HARNESS_MAIN

-- 
2.34.1



