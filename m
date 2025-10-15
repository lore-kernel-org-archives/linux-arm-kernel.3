Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4F0CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=aajmztmEu5kpXZ4tQxPDkiGaYkJ6bhdQUowTI88s1SM=; b=ommlq9xu0l/ZV8
	SMIyTyle5gWRQbJViF13kPbUo0h5+TnERw+fuFzvc3m4D4Bwx0HFcmbcb5KM7PxqbsHsORe8I6sGy
	li7KIGqoE/TPBC3W/dYmlHbFR3ktk0/PRCK3MZ6pLCAtBkq2upDf8ROIrEJMMFU+FkIsOiyuwAKb2
	v/KeURBCQxNa7V7eMSmV3cuEf9biv7k5GloHgkMOiIW0cfeJrv47eMb3nWyxlq5A54XJrNriKNTkw
	hTIIFTz+totYEX/Zzj/ns0a8kv230fjpyYbjkb/O3KVGA1L4aW59ezfZAGKgcSJ1ieIDGBp00py6N
	enfTz2bmH9dEdUSu0jCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94hv-00000002MKK-2Qlr;
	Wed, 15 Oct 2025 16:50:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94ht-00000002MJu-17na;
	Wed, 15 Oct 2025 16:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 862A5438EF;
	Wed, 15 Oct 2025 16:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4387EC4CEF8;
	Wed, 15 Oct 2025 16:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760547032;
	bh=W2YQOFJDU6EhswCniAUJ6nsXXJo0OSK5lKR9QlTpx9k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PTGKrP8ky0N5uho9RLHOHr4AkzuExjInCzfCOMLJes6F57AaGEKso/qFxziYJJQfm
	 y7vTZ+2DTps+sz2qgFTHqP7NvhfBy+LYzi9Ee/JtV3sT6NkT2DrC5y7QB0/LE3zoZs
	 Jg7PgqnElY7Az2is6iEvCIMzvuflao6KO/IfVQt/svk3TiW7dQpAzrF2wpCya042Kr
	 zXPleFXO4ea43TDXqPZ1sub4OlvuZsUPX7f06wiGp9XeAS3lRC+IY8+XZP0Pnb6Gug
	 aeRbWnhaWNsk1k2NtYF+d6WuEjsK7vhEztDqIu5xYEk4iZ2ylhSz+OlfOuBlLmXSpP
	 okVgFisIOhv9g==
Date: Wed, 15 Oct 2025 11:50:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v5 0/5] PCI: mediatek: add support AN7583 + YAML rework
Message-ID: <20251015165030.GA945420@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012205900.5948-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_095033_347597_C13763DE 
X-CRM114-Status: UNSURE (   9.05  )
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

On Sun, Oct 12, 2025 at 10:56:54PM +0200, Christian Marangi wrote:
> This little series convert the PCIe GEN2 Documentation to YAML schema
> and adds support for Airoha AN7583 GEN2 PCIe Controller.

> Christian Marangi (5):
>   ARM: dts: mediatek: drop wrong syscon hifsys compatible for
>     MT2701/7623
>   dt-bindings: PCI: mediatek: Convert to YAML schema
>   dt-bindings: PCI: mediatek: Add support for Airoha AN7583
>   PCI: mediatek: convert bool to single flags entry and bitmap
>   PCI: mediatek: add support for Airoha AN7583 SoC

If you repost,

s/convert bool/Convert bool/
s/add support/Add support/

to match the history (use "git log --oneline
drivers/pci/controller/pcie-mediatek.c" to see it).

