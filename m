Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDD0C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsfHI0Bbse/F6dgnNQP7Uv/3935LWj8bh0rxNiYRUk8=; b=GMKrWnzFaOtnzkRUndKoXmWHzf
	rhELfoTSsQTKJQhOjTk+7+3+uJGNRLi3IgSDh+VOAHMU9p6j2V+JhZzER7lE/Nhctj32ohhIzj37b
	Zj4KN0muFmDi78G5w9p4id59AWZg+uGGk+QtEBr3vbx/iZ3hbUo3LlcR1vX45sz+0OxiNrztCzcU/
	HaN/Sqsjf0GIG/PYbWbo80EzZi23VhkJjl+qI8Aec8AI5+TR46AT7rVmNA2zxQFH+lfD0Ixusx3V2
	nfsLvMd44RGEEERyaMVnBCCYLGPJqY6zNowyljmB1ov2l3Nu9caXv2cgtyufClJycgYXpfQMVj/xt
	Ieg3heXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkVR-00000002MaT-3yaR;
	Mon, 07 Jul 2025 11:59:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYk2M-00000002HNn-25DU;
	Mon, 07 Jul 2025 11:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98AAA46259;
	Mon,  7 Jul 2025 11:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4ADBC4CEE3;
	Mon,  7 Jul 2025 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751887769;
	bh=pvrgPbujdZyNCnqS0MoPZy4z92NtoD/434IVrBGaRNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzQ9mSTlqbjPryIzU8C3XJ2bHMoEKQ4PGiXh5kPvsK61snx3Ko7sg4bDQvAmsjNyn
	 VjBlyc7OVsGY2nwbPevisTcnOZK72lB3PDlNakMUad5FcfmPBbVvdvDypLIGh5uRc9
	 Q0bIaDP6yBFVAoBnE5RPw0SrJ4O16orY4aRAURr38XAqFX3GWO0SokyG/y9LHLARxi
	 hG7GbGWrC4zCJmvhUjqO8RheFBQ9GYnPogZwKq6XTG1kRXJ0oXeWcwj/OUXhvcw5+i
	 eI4LdHoFj/fSjCgPFR2upUo2YoxS57r/w2/C75umpqC6zf9X7F5LaM4bg7gRmYrh9F
	 /minS3KOUu35Q==
Date: Mon, 7 Jul 2025 13:29:22 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
	Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <aGuvkkeVkezGJWXn@ryzen>
References: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
 <20250530113404.GA138859@bhelgaas>
 <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
 <aGuqA92VDLK8eRY1@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGuqA92VDLK8eRY1@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_042930_557518_8EED4D9A 
X-CRM114-Status: GOOD (  17.80  )
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

+ Mani's kernel.org email.

On Mon, Jul 07, 2025 at 01:05:39PM +0200, Niklas Cassel wrote:
> Hello Mani,
> 
> On Fri, May 30, 2025 at 09:39:28PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, May 30, 2025 at 06:34:04AM -0500, Bjorn Helgaas wrote:
> > 
> > > I think pci_host_handle_link_down() should take a Root Port, not a
> > > host bridge, and the controller driver should figure out which port
> > > needs to be recovered, or the controller driver can have its own loop
> > > to recover all of them if it can't figure out which one needs it.
> > > 
> > 
> > This should also work. Feel free to drop the relevant commits for v6.16, I can
> > resubmit them (including dw-rockchip after -rc1).
> 
> What is the current status of this?
> 
> I assume that there is not much time left before 6.17 cut-off.
> 
> 
> Kind regards,
> Niklas

