Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02515CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=zfLELPelxeA3GiXUYZFoOHXmO5WyzT2zMVZmSMV6ntE=; b=TQE8CyNMZ+hmdnU+lQpKoogyzy
	DM67iXAcbGb6zyq7v7uPpSq82kZGANAarolP4ODieR684x57iOSOlEduAPIuqMale28QJmzzkCYGq
	UM2rMBEZsgwI548AirDag2X2lnCnHh7RoCIMBY3PaFLeEyu/YwZ52PngGKpBrY5m/xq/WL2LgUfr5
	82mrpcDf4mQwJuJpgJpW41mOi3xsnMVH1cjQS4fxYSxjeswHNwRpnsrl5wA1udSrpSTt134WMLpmB
	766qKZ+tDKKlXzh4CKRDKEM/A1cd9a3MFfsJ2LIL8jWiBfVjeKyU/U1HigHXxhB9H8Kt6UPllnzqP
	wfvJ5qyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxu3-00000006rIS-2ZiC;
	Thu, 23 Oct 2025 16:11:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxu2-00000006rHx-1Lw5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 16:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B54B3640EE;
	Thu, 23 Oct 2025 16:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37110C4CEE7;
	Thu, 23 Oct 2025 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761235861;
	bh=QoQ0G1vzfRKHWUkpNlMaZxVkeeSKpfz8eW4ukxGyOFI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=YXtsxzp9O3qmvAboQgiGhtU2a4kOVmoOZAF18a40K9jWaODby5Dr5KkClDRCmRecB
	 5Kwhfe9OVtuVJwx7qlFIa1qenNEhOQdQBQeGgPvf3lk0m6+mNz10ONzXFOpFn1jjIr
	 KnAfYrzBAregsG25fnWb4MgB0VgFPDZdM6xqlySUvRHmA1c3X80Sx1UtHUntoeJfu+
	 AbKhx8Y8ctx3lE2ly7QbBlNrFLoOe/j/gTTqV+cP5JNhmdetJjk0b7qZhQ1wtwzhGN
	 KpS+Yc1Tj4SG7JVI4fFMWtkkhO2QkT0pkvm1HJLRz6uJzE0GfUQPYIuHjzYITZin/R
	 kW8LtX2vAFT+g==
Date: Thu, 23 Oct 2025 11:11:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stefan Roese <stefan.roese@mailbox.org>
Cc: "Musham, Sai Krishna" <sai.krishna.musham@amd.com>,
	"mani@kernel.org" <mani@kernel.org>,
	"Havalige, Thippeswamy" <thippeswamy.havalige@amd.com>,
	"Bandi, Ravi Kumar" <ravib@amazon.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"Simek, Michal" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	"Yeleswarapu, Nagaradhesh" <nagaradhesh.yeleswarapu@amd.com>
Subject: Re: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
Message-ID: <20251023161100.GA1297651@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c7e43c3-24e9-4b08-a6ce-2035b50226f4@mailbox.org>
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

On Thu, Oct 23, 2025 at 09:03:07AM +0200, Stefan Roese wrote:
> On 10/23/25 08:35, Musham, Sai Krishna wrote:
> > > -----Original Message-----
> > > From: Stefan Roese <stefan.roese@mailbox.org>
> > > On 10/22/25 14:48, Musham, Sai Krishna wrote:
> ...

> > > > > > We even don’t need ravi patch, as we have tested this at
> > > > > > our end it works fine by just updating interrupt-map
> > > > > > Property. We need to now understand the difference in
> > > > > > design.
> > > > > 
> > > > > Ok, please let us know with your findings. In the meantime,
> > > > > I'll keep Ravi's patch in tree, as it seems to be required
> > > > > on his setup.
> > > > 
> > > > We tested on Linux version 6.12.40 without applying either
> > > > Stefan's or Ravi's patches.  Instead, we applied only the
> > > > following interrupt-map property change (entries 0,1,2,3) and
> > > > verified that legacy interrupts are working correctly.
> > > > 
> > > > interrupt-map = <0 0 0 1 &pcie_intc_0 0>,
> > > > <0 0 0 2 &pcie_intc_0 1>,
> > > > <0 0 0 3 &pcie_intc_0 2>,
> > > > <0 0 0 4 &pcie_intc_0 3>;
> > > > 
> > > > 38:       1143          0  pl_dma:RC-Event  16 Level     80000000.axi-pcie
> > > > 39:       1143          0  pl_dma:INTx   0 Level     nvme0q0, nvme0q1
> > > 
> > > Okay. Same here. I don't need Ravi's patch for the INTx bit
> > > enabling.
> > > 
> > > I understand that you want us to change the interrupt map in the
> > > auto- generated device-tree from Vivado. Which is IMHO a bit
> > > "suboptimal".
> > > 
> > > I would prefer to have a solution which works out-of-the-box,
> > > w/o the need to manually change DT properties. Is it planned to
> > > change / fix this interrupt map in pl.dtsi generated with a
> > > newer version of Vivado?
> > 
> > Yes Stefan, this will be fixed in the newer versions and the
> > auto-generated device tree will include the correct interrupt-map
> > property entries.
> 
> Understood. And thanks the update on this.
> 
> @Bjorn & Mani, this patch can be dropped then.

Just to confirm, we can drop both of these patches:

  https://patch.msgid.link/20250920225232.18757-1-ravib@amazon.com
  https://patch.msgid.link/20251021154322.973640-1-stefan.roese@mailbox.org

AND there are no DTs in the field that will need to be updated for
things to work?

It's OK if you need to update internal DTs that haven't been shipped
to users, but we do not want to force users to update DTs that have
previously been working.

Bjorn

