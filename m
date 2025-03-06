Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C829CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=N6/mWdE5HzpqkacfMOLC5fqLLQvSIpQuuYHN8offPNM=; b=KDiD5IItdwx0kx3sOAqfX0p8Sr
	7Pc/dW9FzyGP0diOmZ5ZkQE6U0MrQO9+idDG0sH3w1I3l8XVMzPrP5YHYRo9nrEHnIOf7aZB3elyo
	32/PH3td3M/tuYIZbqThJmp6Silj14jGxe1IZCwcE0ihEdBIaYkHy/7e0cjms18E5k2YNOfwYJos3
	5ejZRevdRxcioHP19MpNWudi0IH2pCg6n+KMPyuc3JmhkxS3tsYSz0PK6Gj2GPgrUPgtZ52rUkFES
	JhYf5iZDETtDHW0exQ9U+QBbmIu59r2bokqrrgyVa96d31uaed4RrG6DpQ/uTZUXv3ys/97UL/O2r
	mU7RX6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4n-0000000BTzt-2Zxm;
	Thu, 06 Mar 2025 16:28:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE1b-0000000BT4x-2wpJ;
	Thu, 06 Mar 2025 16:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46C8A5C5600;
	Thu,  6 Mar 2025 16:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886B0C4CEE0;
	Thu,  6 Mar 2025 16:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278282;
	bh=+kNbwlJsG0d5knwFU8XMrHfRrzZxy6Vq25nHdxqvRjs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=JhNTTJhyjWlAbu4BZhAXyZuXHFR/dSZu1Tfv00+OsXDcMVd+NHEF5iuf3O3flLXZk
	 7L67uVL2vsWmXUzX3WyRYJ5A4dkIBzEASjc3dwmLQN5ljvYSRmwEfF0N/s2KQ4WARH
	 pXeK6gloj2qFlulAjIA0lk90CQM/1Z5WuRch8xxESaY4xyu2CTvxu06wOf48w4zYSA
	 ZJeWRzvIAXw312j1L26TM/TuecV/2YfGiDwUvB9gEc//O4j2v459NZKGIx6z0IkTBc
	 cC4rhmwDDRR+c2iRMsXhpJluWYcnWOhLOb2sUPGzjQGipwtzuzWM7qlOGy2SkfkRqP
	 eatxxgQ1Oakng==
Date: Thu, 6 Mar 2025 10:24:41 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/8] PCI: brcmstb: Fix error path upon call of
 regulator_bulk_get()
Message-ID: <20250306162441.GA344031@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-6iNyXeXhqzwbV+pcizpyXg-c-gihcLEtPv1s1uczdNN_VOQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082443_849271_6FA9CE26 
X-CRM114-Status: GOOD (  27.19  )
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

On Thu, Mar 06, 2025 at 10:24:56AM -0500, Jim Quinlan wrote:
> On Tue, Mar 4, 2025 at 9:49 AM Jim Quinlan <james.quinlan@broadcom.com> wrote:
> > On Mon, Mar 3, 2025 at 1:40 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Fri, Feb 14, 2025 at 12:39:32PM -0500, Jim Quinlan wrote:
> > > > If regulator_bulk_get() returns an error, no regulators are created and we
> > > > need to set their number to zero.  If we do not do this and the PCIe
> > > > link-up fails, regulator_bulk_free() will be invoked and effect a panic.
> > > >
> > > > Also print out the error value, as we cannot return an error upwards as
> > > > Linux will WARN on an error from add_bus().
> > > >
> > > > Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
> > > > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > > > ---
> > > >  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> > > > index e0b20f58c604..56b49d3cae19 100644
> > > > --- a/drivers/pci/controller/pcie-brcmstb.c
> > > > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > > > @@ -1416,7 +1416,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
> > > >
> > > >               ret = regulator_bulk_get(dev, sr->num_supplies, sr->supplies);
> > > >               if (ret) {
> > > > -                     dev_info(dev, "No regulators for downstream device\n");
> > > > +                     dev_info(dev, "Did not get regulators; err=%d\n", ret);
> > > > +                     pcie->sr = NULL;
> > >
> > > Is alloc_subdev_regulators() buying us something useful?  It seems
> > > like it would be simpler to have:
> > >
> > >   struct brcm_pcie {
> > >     ...
> > >     struct regulator_bulk_data supplies[3];
> > >     ...
> > >   };
> > >
> > > I think that's what most callers of devm_regulator_bulk_get() do.
> 
> Manivannan stated that this series has already been merged.  So shall
> I implement your comments with a commit sometime in the future?

Sorry, I should have mentioned this would be something possible for
the future.  This current series is all set to go.

Bjorn

