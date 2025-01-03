Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CA1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=sODcHv3eD4DFTFR6HBxazkE3MPaF9Q0OqjaQHEMWwyI=; b=WqG5Uh9X44kb1Y
	IyA0GvKCvEz1+fV4GsA2Eo7CRGZe72GYfRzQMLkM2X8KM+4AkaV250kXPPHwhgc/ypSJ5DOd3VT0V
	7bXJPcf3JGo4GWvie/M8SVRJVeP6O18qM7Z8beAiaDlIL/RSEsvCWed5KJwQD+T1K8VDb1JuRzPBf
	tVcNG9oku53+TQZ0rPvobVswl6oR5D8trgaNJ21lpUxEhDAaGRhf92lCv2XKINzmF15+b6AOj7McT
	Z8NqzBk8osIVNbI4oJLaVL8qhuco6cEfOfFssmfnVDmStwTkPKhEl9xsxcq/hPDXqYZAld0Nayruj
	35uf/2JeCuTQxxwhKoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnAS-0000000DoeO-48W5;
	Fri, 03 Jan 2025 19:17:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTn9G-0000000DoWY-3Gyv;
	Fri, 03 Jan 2025 19:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E49875C63E2;
	Fri,  3 Jan 2025 19:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE907C4CECE;
	Fri,  3 Jan 2025 19:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735931753;
	bh=sODcHv3eD4DFTFR6HBxazkE3MPaF9Q0OqjaQHEMWwyI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FstYDClT78aLopDhhGTjpE22UMeJMS6nhpxD/I9u8E4g8ZeOPXdR7pu8f0M3RI/Xa
	 hTa1+DRy5tOrJZUBUUOnOAeV5344cNtX4AI5Gzvwvy6pas6eUkhuFSuKC3j1yPrFpy
	 F1usUWT8OQpeCuT92Pwo5DmxdWTxQvv88VZi69R0oEm1QazYEXJh0SrgoMwcKLfvpS
	 3b66UB+Cqxr9B4CGtoNPQO19f85wgzZeke6bD2WgX0aI1P+NgoCaehWub0RbCahqk4
	 ke823l9BBvoWDxAqAXjIqVFfdQZ24v1bX7NuPXixtbzGY5sngx61rYScGjW8hb7JYC
	 Q6W7FWF/NDstw==
Date: Fri, 3 Jan 2025 13:15:52 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH 3/5] PCI: mediatek-gen3: Disable ASPM L0s
Message-ID: <20250103191552.GA4190763@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103060035.30688-4-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_111554_857751_B262A154 
X-CRM114-Status: UNSURE (   7.22  )
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

On Fri, Jan 03, 2025 at 02:00:13PM +0800, Jianjun Wang wrote:
> Disable ASPM L0s support because it does not significantly save power
> but impacts performance.

This seems like a user/administrator decision, not a driver decision.

L0s reduces power at the cost of performance for *all* PCIe devices,
although the actual numbers may vary.

