Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5C5C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyD1ZlC5fpFZWH20MyC2W7WYyvtpcSI0QfSjyrqgEAw=; b=EqQwdPs3le8ccRyYYN3J9kcGau
	eWDGXYIYL9qsuZFry5jLa1LEscVj/RCNINDwjnJrEmNLZ08HE/3S/O1rjnC/a+nH7Bgouy4jc7Idd
	B8UTzAO8k/BIMGuLGysSS9c/G4SqH1YFGs9gzdO8GbqH1iYFtes9puu5pAA6lzVliO2bEpsCATpvm
	ZjYM+slrruI8SsBhkEd43Roip4HOxdufz6Vsf3CMKSggZnyA78RKutzbEEjeVhto3euG3/3pzZOD+
	srMAsUZCY0lJD4AWFOxWFqfRSo0KmAD6Bty8V0am8oWQdzAtEzsGgGCIy1qc0iAiPSID1Vodxuz4V
	qglrX3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4doL-0000000EKN2-089K;
	Thu, 10 Sep 2026 12:23:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4doJ-0000000EKMl-2jw3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:23:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C91E0600C8;
	Thu, 10 Sep 2026 12:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B610F1F000FF;
	Thu, 10 Sep 2026 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789043002;
	bh=zyD1ZlC5fpFZWH20MyC2W7WYyvtpcSI0QfSjyrqgEAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g7xAF3F261vcbcmPBtbOJxmdSgYmaAkjCaNs0q/Of8h7FIX6h+GRTGh5UjGMOuhn+
	 gZLBmINKqJ7XmZ/vCqE/ZVS54h8wEsmYkth2FHAkRFyDhRol1Nw9FczUundAA3dboO
	 VSt5rXSaXKRllULiNllebwfOj2bcbUNngUixViGwRSV4FUOKHJ73DkB/bukBLY49xT
	 YI6QPis22w9f//y0FY+TfT1BZe8njgeMZd/T9ow3+BnhPWzwaW9klNhszGKwASnp2W
	 dvqJurqIOR/dAlFjFUgJ1wNlINzuFUCBAudTk1gEg66XXlp5V1H4qNX4eJG/TS0zRS
	 li3Xkujf9Efqw==
Date: Thu, 10 Sep 2026 14:23:14 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Toan Le <toan@os.amperecomputing.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Liviu Dudau <Liviu.Dudau@arm.com>, Tanmay Inamdar <tinamdar@apm.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: xgene: Fix device node reference leak in
 xgene_pcie_probe()
Message-ID: <vagn7awznv3vop7gwpavo27s4netd235ei2po6lzkmnoqqhuwv@yiwwhzhaccza>
References: <20260814134118.1387742-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260814134118.1387742-1-ruoyuw560@gmail.com>
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

On Fri, Aug 14, 2026 at 09:41:18PM +0800, Ruoyu Wang wrote:
> xgene_pcie_probe() takes an extra reference to the platform device's OF
> node and stores it in port->node. The driver never drops the reference,
> so every probe attempt that reaches this point leaks it, including when
> CSR mapping or a later initialization step fails.
> 
> The platform device already holds the node reference, and port->node is
> only dereferenced synchronously by xgene_pcie_setup() before probe
> returns. Store the borrowed pointer instead of taking another reference.
> 
> This issue was found by a static analysis checker and confirmed by
> manual source review.
> 
> Fixes: 5f6b6ccdbe1c ("PCI: xgene: Add APM X-Gene PCIe driver")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

This was fixed by commit, 4869db344e76 ("PCI: xgene: Drop unnecessary OF node
reference").

- Mani

-- 
மணிவண்ணன் சதாசிவம்

