Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7E6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFGNSXyBzlfv/Oj4MgwjqyjIVax4i6/p74f+gTytbJs=; b=UDsNAWvgyM9eYEQ+ntMn1nU1dn
	lYsTnklUDZP18ux0zfjxHpCAs5lwfki6k/sRpzZtx1HKkRmimncvdfSVGyv3p40pLj4I9iNdWjJJ+
	BxmUAB84UqwW8k75Ot8Ug5jOIupnwE0RwfywteRCusf9QYsRPXZJZMAvimkFTQct9jlaMfuiJ0b73
	kLjnz/dzlUc8qhlwVTr7AqkfYOQXHn7hbd8Ye+XdfsOTXAaUTGzxYFemT2ySnSh/cLzkCOh/8+BFJ
	/gFfCjvIbimrEEWs/ihrRXGeX/hnZPj/IXRwK91+geMfMywSUNgmyHtapplOlYc1lvlgcFwbI7zMS
	Pf9ZyGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciqu-0000000CO3w-3tQo;
	Fri, 18 Jul 2025 11:02:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciVR-0000000CKGD-3WB2;
	Fri, 18 Jul 2025 10:39:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5234E5C5C60;
	Fri, 18 Jul 2025 10:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161EFC4CEF0;
	Fri, 18 Jul 2025 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752835197;
	bh=J3EdFx6SeghEC/3QrFs16mdw3ziovg04wubMBc5qbUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPlrFQBtvUlZfA7a+pVin1pFTP7wye2etea45L0KxgzvuN5VA5/XYu1MyW3Xtw9BX
	 cXL2kXR7CiYeUQP0DsONWFLp7zbJ9zl7KUXlq5LI945F+NGunAFWedcpd57Nt4nS+B
	 DO/r/Cx19XXM7KfS03jieyFoNUBzNpU8bbxrw2L511QVxGAr98ZXWB2uYjftwZ5dnD
	 4YDpEFwUNh03TE5Ar8Vq6XqGAlWb5aflWRTH/TOH7rLvuWOPgTv+CLF6liQVsvP2ah
	 yveNKo3QRKnzR2f/ScmBsawG2qE80GXNLSf3orq5fHbG8Mrq+dAmRyfBuGAtgXeiOq
	 s1uZKCsgGIvXg==
Date: Fri, 18 Jul 2025 12:39:50 +0200
From: Niklas Cassel <cassel@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <aHokdhpJUhSZ5FSp@ryzen>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aHoh1XfhR8EB_5yY@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHoh1XfhR8EB_5yY@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_033957_960345_996654B5 
X-CRM114-Status: GOOD (  13.64  )
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

On Fri, Jul 18, 2025 at 12:28:44PM +0200, Niklas Cassel wrote:
> On Tue, Jul 15, 2025 at 07:51:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> 2) Testing link down reset:
> 
> selftests before link down reset:
> # FAILED: 14 / 16 tests passed.
> 
> ## On EP side:
> # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
>   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> 
> 
> [  111.137162] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x4
> [  111.137881] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x0
> [  111.138432] rockchip-dw-pcie a40000000.pcie: hot reset or link-down reset
> [  111.139067] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> [  111.139686] pci-endpoint-test 0000:01:00.0: AER: can't recover (no error_detected callback)
> [  111.255407] rockchip-dw-pcie a40000000.pcie: PCIe Gen.3 x4 link up
> [  111.256019] rockchip-dw-pcie a40000000.pcie: Root Port reset completed
> [  111.383401] pcieport 0000:00:00.0: Root Port has been reset
> [  111.384060] pcieport 0000:00:00.0: AER: device recovery failed
> [  111.384582] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x3
> [  111.385218] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x230011
> [  111.385771] rockchip-dw-pcie a40000000.pcie: Received Link up event. Starting enumeration!
> [  111.390866] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> [  111.391650] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> 
> Basically all tests timeout
> # FAILED: 1 / 16 tests passed.
> 
> Which is the same as before this patch series.

The above was with CONFIG_PCIEAER=y

Wilfred suggested that I tried without this config set.

However, doing so, I got the exact same result:
# FAILED: 1 / 16 tests passed.


For the record, the test that passes is not actually passing either,
it is the BAR4 test, which is skipped, since BAR4 is reserved on rock5b:
ok 5 pci_ep_bar.BAR4.BAR_TEST # SKIP BAR is disabled


Kind regards,
Niklas

