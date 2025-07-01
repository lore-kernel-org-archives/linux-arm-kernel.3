Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E65C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOz+88CTDkgO+1M1S9EhNuwy+/x4Yua5nSV1vG71vJI=; b=PDasREnfqzIlinzjW+L7FF01MA
	MFVuBMUUyZuOMnwwKd/ZFkp0QU4q1KcP+N5injZDNfGvxrW8SvGLA1NwRqqe2f2TxliZ15+UAdeSh
	hF7lXO/ZEeVcO/5dJYUm2TZd7zFWrv61TLG+ozvWxN4SMu9FQ/NjmOHTKTxHWUR3O+y6DcWxCleYJ
	aMGPlshFkjE0x/j7sMUOPscyYec39AgQhkSr4NECPMfnC+t88B2+1KVFYPe5psPxiXjNUMCKMX8Hs
	r0Gurq4RxcNsBGEzjVHG1EQ72pyYne5cP5VWsAZuFkYZCNuAubS4nlW0A3jIBso4AX7hlQThlVtYM
	lFKUPAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdYf-00000005zCJ-1t36;
	Tue, 01 Jul 2025 16:10:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbxJ-00000005hbZ-1cW0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:27:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AA606A530E2;
	Tue,  1 Jul 2025 14:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E6DC4CEED;
	Tue,  1 Jul 2025 14:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751380048;
	bh=bDi0f6jCqN5KhrDrpJjcKcdCYvPKH5IumG0nhtrSL1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ffssx2JQhDwOAEgEZh55mWefbI/oPxPsCnWY+hPApIsAEAHc8lOPpqQA5FKceyq6z
	 aL4F2WIlYe1X62eMs7AOeD/RjB8CCBAEuwQtVp8kdKc+heW/ZRIqQF7THSIJ3MidFZ
	 fUjnfqRk2hcCVGXC9anCKQ7wWzlH0PU3J8SHeYKGYyc57e2mEm8GPY1N1vPD03eAZP
	 fma2/85RMWZasI91scxvzITAa5++wnjuVcLsbeciSe+7WpJq6Kcudippz1mYmUATEg
	 8JW1csptA3d5e6lUCWsv6gPuqU9qhJ9Ng3AqRzszmU/iwMd9qqFstfpR3jeG7xPoHz
	 3BAzFm9gftUJw==
From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250617073441.3228400-1-hongxing.zhu@nxp.com>
References: <20250617073441.3228400-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v2] PCI: imx6: Correct the epc_features of i.MX8M chips
Message-Id: <175138004317.29152.1836707203802204355.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 19:57:23 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_072729_492652_F5B21AB6 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
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


On Tue, 17 Jun 2025 15:34:41 +0800, Richard Zhu wrote:
> i.MX8MQ PCIes have three 64-bit BAR0/2/4 capable and programmable BARs.
> But i.MX8MM and i.MX8MP PCIes only have BAR0/BAR2 64bit programmable
> BARs, and one 256 bytes size fixed BAR4.
> 
> Correct the epc_features for i.MX8MM and i.MX8MP PCIes here. i.MX8MQ is
> the same as i.MX8QXP, so set i.MX8MQ's epc_features to
> imx8q_pcie_epc_features.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Correct the epc_features of i.MX8M chips
      commit: 66ee525537be816b2accf4ad28ad33cd299ea492

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


