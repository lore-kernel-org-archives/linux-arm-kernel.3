Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19ADCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAynyOseUKGAuoLdnyiIhXjvKHyX9hiPVTLTNq82E5o=; b=HjIsluG0K6+PuapWJgGc0KSy8F
	qUgCBZO5jXioq/FymXKQ8FfOfGu8yqrd2zWn1sxmqytmDQ54PkCoVakjTxmhIMFY/2KGqnpLmlcIO
	kk6xBsnJNTzlhIczVJTuVQpFrsKXvfg3qo7aKfVyWHgzDHRNG1Hfc12Al0YcTIn9LbqZIdXvtcxNw
	CUNpqvzJDVgs6srji+tfvvChIVRYNfEyGVDPv40PX2XzAhSllir6Dyk1INnIrtuMCctp5FB+wUY9f
	kAu2WFDUNyyMxKEfXQT8MTORfTnV48Z0UNC682BN03+D3MF3sKy69WGSu+kQO09UsZ6+1HYAfjZzd
	0e5lunMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgar-00000001YXF-0Ike;
	Mon, 08 Sep 2025 18:27:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvdU4-00000000K3z-31E7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:08:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27AF260145;
	Mon,  8 Sep 2025 15:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B0FC4CEF1;
	Mon,  8 Sep 2025 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757344123;
	bh=fSYDgjY/SfJ5m+wyFnb04x7E2KP7tNSpQEmJ29X5mVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3siD1NRu8Q/mgEuCb+ckDctl2d4YV2M6tE8FcrBX5TtXeNYUc2DIS0rAANiXVDgE
	 fZtfiAwHsI6EWBFwsNsb4jL7c2o3/2mTSSpbpFvjlH8xfXsKKFcHe8Y1Hxq2+r+MoI
	 sPX0ng/FFYD+A+e9NxsxKGDLKNXtLA+HkCzX/wmhTPDg2N2jWCgSRA6kSTXDdOK5lk
	 2F2q8/PE+cbwUacg4d5PZOTgvP//6gPcwPKWzUWXZhrQ7LXqXesprjawg56gxhDPvJ
	 FyMAgiUZ073U18LOOx5+Y1TmjkW2GV5dpR+zQTaIOlfn+rRaygxcSZLZ+t4tgtGstV
	 7PfrOZVzDGGcA==
Date: Mon, 8 Sep 2025 17:08:35 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, dlemoal@kernel.org, jdmason@kudzu.us,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v21 0/9] PCI: EP: Add RC-to-EP doorbell with
 platform MSI controller
Message-ID: <aL7xc0aVi-olMAE-@flawful.org>
References: <20250710-ep-msi-v21-0-57683fc7fb25@nxp.com>
 <175311109182.25848.8880954995049551501.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175311109182.25848.8880954995049551501.b4-ty@kernel.org>
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

On Mon, Jul 21, 2025 at 08:48:11PM +0530, Manivannan Sadhasivam wrote:
> On Thu, 10 Jul 2025 15:13:46 -0400, Frank Li wrote:
> > [...]
> 
> Applied, thanks!
> 
> [3/9] PCI: endpoint: Add RC-to-EP doorbell support using platform MSI controller
>       commit: b537ffe0eb2ab458f20ec135cc2b565c63a2ea00
> [4/9] PCI: endpoint: pci-ep-msi: Add MSI address/data pair mutable check
>       commit: 1f2ed78e43abb9ac0856a82867f64d472368a832
> [5/9] PCI: endpoint: Add pci_epf_align_inbound_addr() helper for address alignment
>       commit: 1c2c5f9855a5cf4617bcda721c22dbd3345f06a1
> [6/9] PCI: endpoint: pci-epf-test: Add doorbell test support
>       commit: 5d4da5f8092e5a77ae371ae1112283b59790ac22
> [7/9] misc: pci_endpoint_test: Add doorbell test case
>       commit: a1a293e709a4ec0fa2e4253993a4b75f581c6cf2
> [8/9] selftests: pci_endpoint: Add doorbell test case
>       commit: b964b4894fcfc72e7496cf52a33cbba39d094c5b


Hello all,

I wanted to test this on rk3588, so I added msi-map to the pcie_ep node.

It works the first time:
# ./pcitest -r pcie_ep_doorbell.DOORBELL_TEST
TAP version 13
1..1
# Starting 1 tests from 1 test cases.
#  RUN           pcie_ep_doorbell.DOORBELL_TEST ...
[   17.996519] offset: 70040
[   17.997904] left: 250 status: 0x240
#            OK  pcie_ep_doorbell.DOORBELL_TEST
ok 1 pcie_ep_doorbell.DOORBELL_TEST
# PASSED: 1 / 1 tests passed.
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Prints on EP side:
[   17.924761] pci_epf_test_enable_doorbell
[   17.926035] doorbell offset: 70040
[   17.927898] pci_epf_test_doorbell_handler
[   17.932816] pci_epf_test_disable_doorbell



However, if I run the exact same test case again:
# ./pcitest -r pcie_ep_doorbell.DOORBELL_TEST
TAP version 13
1..1
# Starting 1 tests from 1 test cases.
RUN           pcie_ep_doorbell.DOORBELL_TEST ...
[   34.672546] offset: 70040
[   35.688190] left: 0 status: 0x0
[   35.688480] pci-endpoint-test 0000:01:00.0: Failed to trigger doorbell in endpoint
# pci_endpoint_test.c:258:DOORBELL_TEST:Expected 0 (0) == ret (-22)
# pci_endpoint_test.c:258:DOORBELL_TEST:Test failed for Doorbell

# DOORBELL_TEST: Test failed
#          FAIL  pcie_ep_doorbell.DOORBELL_TEST
not ok 1 pcie_ep_doorbell.DOORBELL_TEST
# FAILED: 0 / 1 tests passed.

Prints on EP side:
[   34.600717] pci_epf_test_enable_doorbell
[   34.602086] doorbell offset: 70040
[   35.624718] pci_epf_test_disable_doorbell



As you can see the print that I added in pci_epf_test_doorbell_handler()
never comes the second time executing this test case.


Frank, do you see the same problem?


Kind regards,
Niklas

