Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E3BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCIz9RsOuZvMncYbDN/SzX6h+T0IK2xk8AUJpi3rZQQ=; b=pzyqk5kuY+v1oExvwsuDB9/C67
	jaH0rldc3XPpPtjqiE8pH9VqbIfqeOFGBmjLLzQcSX1Efk8MdCKgyYGD8fpM7RjAUPL0vbxkocn/l
	hqMPHzSwFEw441VM4HnuW8xQbEsqZw9mUuFPrblHF1QKW9Ad96VZl85QZFan6q2fD+Ml9g0AkShpe
	7M7/hJ8sCl+4XBFXGOGAuwQbZiqGjp08sajMP/cz4UqU/LMuq2nQKAj/gA9BvtGOcUJjrWhUSF4E9
	mwru3EYHir/IwDG1AKy96oOiNlTVgIJIfdoucC8F4OEJhd/z3A5eCLwIAmJOyxAnG7nI6rbpn/vKW
	qICRqCXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTZ1-0000000BHUG-2bW6;
	Tue, 03 Jun 2025 15:28:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSJT-0000000B8Hz-0zdK;
	Tue, 03 Jun 2025 14:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2ED685C0FB1;
	Tue,  3 Jun 2025 14:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7064C4CEF0;
	Tue,  3 Jun 2025 14:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748959701;
	bh=GSLFrdjvG8RldMoj4IELfQn2sm484jTH1lKYktZEKTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QfiIq1ZhOVZHTwSXrTE1c02luHTBGAGqgJJymOpNj0PubwN/lk2m6GoEhswr2IATO
	 TUNJe2kppWhiXa2m9DJ/B4DhPZNXx9CPwdmPSxYBmQbSIJGF8mqFXxlWPDUwFCzEZI
	 aORv5slprcs6Pk8CmTwabGbs8GRNwaT0ruYwO6vnVQRwt/FNc6S+NbWsyYw9ZhOilo
	 w3lWa82IEaHxofNSh80wuQYRXV1SYqHzj/RYY/Virsz0o02nHZtLjOHV47Aj7yuKam
	 w8N22RuQCtqMqdo1hSeyIw3bhO/FCwt5bDVLlkq0r63UZB/rEsCEsvdkoEG6wyyQA4
	 nVDH1ytHohV8w==
Date: Tue, 3 Jun 2025 16:08:15 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <aD8Bz4CkdnAd8Col@ryzen>
References: <76F22449-6A2D-4F64-BF23-DF733E6B9165@kernel.org>
 <20250530194347.GA217284@bhelgaas>
 <domwxd2beelpnuuzgbxuizqnfo24aekhtxsahodsbfkpc3n6fd@rahjejxklr47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <domwxd2beelpnuuzgbxuizqnfo24aekhtxsahodsbfkpc3n6fd@rahjejxklr47>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_070823_321735_2BB6FAEC 
X-CRM114-Status: GOOD (  21.06  )
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

On Sat, May 31, 2025 at 12:17:43PM +0530, Manivannan Sadhasivam wrote:
> On Fri, May 30, 2025 at 02:43:47PM -0500, Bjorn Helgaas wrote:
> > On Fri, May 30, 2025 at 07:24:53PM +0200, Niklas Cassel wrote:
> > > On 30 May 2025 19:19:37 CEST, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > >
> > > >I think all drivers should wait PCIE_T_RRS_READY_MS (100ms) after exit
> > > >from Conventional Reset (if port only supports <= 5.0 GT/s) or after
> > > >link training completes (if port supports > 5.0 GT/s).
> > > >
> > > >> So I don't think this is a device specific issue but rather
> > > >> controller specific.  And this makes the Qcom patch that I dropped a
> > > >> valid one (ofc with change in description).
> > > >
> > > >URL?
> > > 
> > > PATCH 4/4 of this series.
> > 
> > If you mean
> > https://lore.kernel.org/r/20250506073934.433176-10-cassel@kernel.org,
> > that patch merely replaces "100" with PCIE_T_PVPERL_MS, which doesn't
> > fix anything and is valid regardless of this Plextor-related patch
> > ("PCI: dw-rockchip: Do not enumerate bus before endpoint devices are
> > ready").
> 
> It is patch 2/4:
> https://lore.kernel.org/all/20250506073934.433176-8-cassel@kernel.org


Hello all,


I'm getting some mixed messages here.

If I understand Bjorn correctly, he would prefer a NVMe quirk, and looking
at pci/next, PATCH 1/4 has been dropped.

If I understand Mani correctly, he thinks that we should queue up PATCH 1/4
and PATCH 2/4 (although with modified commit messages).

So, what is the consensus here?


As you know, I do not have the (problematic) Plextor drive, so we go with
the quirk option, then we would need to ask Laszlo nicely to retest.
(And to provide the PCI device and PCI vendor ID of his NVMe device so we
can write a quirk.)


Kind regards,
Niklas

