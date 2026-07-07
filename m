Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A00C44503
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3Hdmnxss7OooEgBEaSE5nTSXMIcAOWWTRBg34hgO0Y=; b=xL7zt3zrTodTmSbrVY5+eVDym0
	KVmyqqMpjykHj3u1nvh5j29eCqGsliLG7iFkVpuMBaKcbklp/j8+mKZ+ULiHczB184YuolbDpuil/
	8Vs0pER7n4PtcahjxVmlF5t2pyZJFSvj+EiB0hH/CVfOZL2ino+7y/Gjpf0fkxBb6LeY2Hs75LjaA
	vds13fBOazAmH4FlUVhkVvZ9ddM+noBHxS2pC9UoCK1y1iD10RHHx2+yHk6/WgE0buCQ3P86day+3
	xCGYVJaxsDHil15WDPFLpXHXx7FicY3wsQ0FlepUbb4negBUYFCNRYQSd+o92LR9UfYOVzqJvdeVn
	+NgOPL7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7rA-0000000FKtq-2MG1;
	Tue, 07 Jul 2026 15:37:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7qw-0000000FKrR-0z7r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:36:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E37540B14;
	Tue,  7 Jul 2026 15:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E2A1F000E9;
	Tue,  7 Jul 2026 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783438613;
	bh=D3Hdmnxss7OooEgBEaSE5nTSXMIcAOWWTRBg34hgO0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hCn30mtFhYuHNFmflRAj8e0RXUg7hftdiZ1o8Mm1go/UH+dJdJBodkFnxKdloC0OE
	 So9Ac5qObrNlv4fVnj9kON4kDnG7uQ8LIe847OC8QYp3WF6dTE+pI9XrUh7zCsofkS
	 REhK6j3D1uzmtnaK2F5/pkLzHhWOY42CP1Dd4Yy2UJV+0l73W1iR64BfaPa6Wbi8Ub
	 DjE0pDbW5TFf5zShp2nTWaq+UJ2h9mJYXZXZc1KVAXypDLCzwYfWnIJTCyKe1uFt48
	 5OvXbfaZE09kbe4ahUhkLAgy9F+xmn6bMs0CfLL+xx/5KTVH1fiQYU/el2jtg8hy65
	 CgbU7o/kNV2Qg==
Date: Tue, 7 Jul 2026 17:36:43 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/5] PCI: dwc: Determine whether iMSI is used before
 calling .init
Message-ID: <p4it4hcg24narbtjtoqdk6zg7wpfs5hc2mm77acyoi6hwfkh5u@5bqlwhylosmo>
References: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
 <20260701203918.63189-2-marek.vasut+renesas@mailbox.org>
 <4qyn4fljtb3cbzcmfpkdomkm7vqnwn2rfbtqng4iwmtvfd4bpj@t6kkw53erl7f>
 <8a921ce9-e339-445a-af05-d20f9f2df01e@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a921ce9-e339-445a-af05-d20f9f2df01e@mailbox.org>
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

On Mon, Jul 06, 2026 at 07:48:24PM +0200, Marek Vasut wrote:
> On 7/6/26 6:43 PM, Manivannan Sadhasivam wrote:
> > On Wed, Jul 01, 2026 at 10:37:44PM +0200, Marek Vasut wrote:
> > > The R-Car Gen4 PCIe controller integration configures MSI registers
> > > in the controller driver .init callback, because those registers
> > > have to be configured while PERST signal is asserted, and the PERST
> > > signal is asserted across the controller driver .init callback.
> > > 
> > > The registers have to be configured differently in case the iMSI is
> > > or is not used. Assign pp->use_imsi_rx before the controller driver
> > > .init callback is called, so the controller driver .init callback
> > > implementation can use the pp->use_imsi_rx value.
> > > 
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > 
> > LGTM!
> Thank you. Can I get AB/RB before sending V4 ?

Why? Since this series goes through PCI tree and all PCI patches are controller
patches, I'm going to merge the series. So no need of the A-b/R-b tags.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

