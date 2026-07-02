Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CB4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 22:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIK2wXZt6lpexw1RHubScXDuScpKzH+Rgz4MJDFq5qU=; b=qnnmekrFq8o4WS+XBrq908g+wc
	vFJe87qVM6eEM0SUvkClB7Z6ePySrRaAIKqA4dYd/4Yvrubl8a7YBzBIPQWbGwENzCJ4YoXO6xvUc
	uGp0BSJ0decnnP7oCoq7MF89/qKQlm9YO96hVYjwFOwyT/cpaUwODsaGIGvbKOOd8ynby2QN7KTMC
	bB/Au5wRNIFTvhaESUpBQ8HoFwD9dLCPI2jkZFdt7RI7qh3sMV4mHiuyNuSL14PajUzWiDlPXrakq
	vx/WM/KDBztmbJo3Er03NxsuanrZ14s45DjRt2TvPPaCAklrm5ZCIAOlpCoh2i9sLoVIGRDQSRrRu
	LRu6n2iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPkL-00000005f46-3HH7;
	Thu, 02 Jul 2026 22:19:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPkJ-00000005f3o-3jep
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 22:18:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE5DC601CA;
	Thu,  2 Jul 2026 22:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C475C1F000E9;
	Thu,  2 Jul 2026 22:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783030738;
	bh=uIK2wXZt6lpexw1RHubScXDuScpKzH+Rgz4MJDFq5qU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CREfmupkg9nGL3Ew/EXkU+T+JQ5dKch4+F69AFVz1GLhUkftCOhcFGPBzPexsATpg
	 mQiSkKSBD25mkuLuGkKyDmZzv9I/Ro+8oHqZgvFQhJMxhSecuVGMJmDJSx4ogYFZC3
	 B2mOYGl5oqKY53a/9CJUhZ6HYNzvYlB0GhRiadeHqeHGmna98l/U9FJc2ewjiKekPw
	 O32zadvoqu44Ue+iLi3eIufTKALzVX4kdUczoVvbSQbq/rxYndz2l9HM2NvqxeQAW5
	 dTlVRvBWatCFscdttyyBGR44vNEBXE08f7/eboDUucWlsy7T53xYTmGa0ElJSEheJH
	 eVIO69EYIlprQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Marc Zyngier
 <maz@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn
 Helgaas
 <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam
 <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 4/5] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
In-Reply-To: <20260701203918.63189-5-marek.vasut+renesas@mailbox.org>
References: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
 <20260701203918.63189-5-marek.vasut+renesas@mailbox.org>
Date: Fri, 03 Jul 2026 00:18:55 +0200
Message-ID: <87wlvdm3w0.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Jul 01 2026 at 22:37, Marek Vasut wrote:
> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
> or APB interface configured to 32 bit, it can therefore access only
> the first 4 GiB of physical address space. This information comes from
> R-Car V4H Interface Specification sheet, there is currently no technical
> update number assigned to this limitation. Further input from hardware
> engineer indicates that this limitation also applies to R-Car S4 and V4M.
> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
> limitation.
>
> The quirk is keyed on the combination of the GIC implementation
> and the platform identification in the device tree.
>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Assuming this goes through the PCI tree:

Acked-by: Thomas Gleixner <tglx@kernel.org>

