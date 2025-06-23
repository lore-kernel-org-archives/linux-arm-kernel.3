Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41375C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUxN5m7hXm2b0M+zJP/i0W46Be3d9ie1H1mdsQ0bmnA=; b=jrMU3heA6My9RPEGyro+N9yLxL
	gPDfH0z9xOeaUaTp/0hrPcRoMtxaA4TGyTWwnwRtQWXPtJKcIqzVSEITMkBMUvFf0gzHzadNAL0Bq
	8KvOKPUxLORzSHr7gF9k6D184wHSoRx1M/oOhNj59hGWmOtmIDjP2mGGh4gSp7n9Ds7VNLhmUjzki
	hWRUHkl95y9yz76bFSVkBvcUe3lLNc0fRIT764N6Cj4slUMBKWffn1WoaSkeB828bEG8LjYHbmJrp
	vVdAs5Zp/isuBqJfrZiH6Ux0OZyHiCUsSorxEQ+klIuFevpsF7U7g/SlHX8nJK6Wfyfd/pp//X9fs
	/wxfQz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTh5I-00000002r4Z-1vbb;
	Mon, 23 Jun 2025 13:19:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfbn-00000002Xgo-3UmD;
	Mon, 23 Jun 2025 11:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JUxN5m7hXm2b0M+zJP/i0W46Be3d9ie1H1mdsQ0bmnA=; b=c3aZp8Wz4uFpoBo/3ygSM87t8E
	HTz4fmuQNy+CKIYstKxuRYqwosHeGwvV7wCsK9UQVeS1swWKSOh2PcJaj2mC/0OLXzWkTVOUnqxVJ
	5mEZI/XfuW5MQc3a7p/PEqrb6k3zgNFQhfFVqdAt0b96i3GRWEKoFUH/w+3uhpEYw0L7f8LYmuS8u
	2Or6Jdn7O6TxuczRWjEHmGcbh78vgFMbLQvggdt0Ty3XpR/49BgBlETFpBewhtU6wgzucYrzoyPg9
	GzYTQy5hnFo1648fADqd+WpzEnHirPC8FL8ekxN3UpJ2dDy4DH3pHI6k6BvRLoesBjepJli4Wz+1p
	etK8zX2g==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfbk-00000005Chf-1Ikc;
	Mon, 23 Jun 2025 11:45:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-748e81d37a7so2431280b3a.1;
        Mon, 23 Jun 2025 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750679101; x=1751283901; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JUxN5m7hXm2b0M+zJP/i0W46Be3d9ie1H1mdsQ0bmnA=;
        b=JiR3YyeZWMCFzxQabT1GAhSq13RkZkGgfO6TVFKo2t53k8MKbOjlN/2Ow8/koD9mX8
         ttG/l7BaFwHgmFmMUGiKaqPPbrmmjg/ypFy+FEeQitLcgegr9/du4MpuJw3ATiO8NwtO
         uEG5hXyKD9x8oWzI/hM2uTWG1UqZCK66ZSrYKEFwfwgPWtq856yGu9H6BxX1HJh0ETIZ
         N0euJzzT6PHfwrROgSPTfmOJQFvKaGTcImeTr0hefdx2sxOzqJql5e1ACp4Y+uBHqML8
         Z/2XdBTXqI8cvn9w5sH2X4qOepNpglKNUYvTDmWg915kcAoYh29QnqAaz3YVXvoIjhXp
         pS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679101; x=1751283901;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JUxN5m7hXm2b0M+zJP/i0W46Be3d9ie1H1mdsQ0bmnA=;
        b=u+rPdRXFkofMkgV1y6hPTHNHWRiiDoCmosfbwalqBsgnMYf3HeD7TQ7aX0VQ8ADiJR
         9Ic4QNWEPg9z47QzW3BgEXmZuv8mJTLrHOllopZ6f/aUlDx2H91Lev4PbobnmNrqBSli
         E6F6FBgkCykdoERURTFHZLbN3P2WiaBvRL2xYC4nlB5841WL7ueaToGQRO/YG6wzweN9
         SqlFxiCoAop9YxA/QlZ0mGxyC5UwRrcFVntMUD/ZNwASUgaxiHDe2jss6iSqAxW0DYc9
         VeH9VYSW3EdvNocDK/um8HXJQG+Jp/vhM+KfMLBwlEwKydsGPEBXVJKRwVDdaBVjS38R
         wHqw==
X-Forwarded-Encrypted: i=1; AJvYcCUDD9a9NYA1pTGZ9J90jhOzBZjy6lvBHb0Q3ybvjqCZGtNsaev7dNCL+nXRY3uKwaYdB6SxUQrHhCkmqs8IJSLZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyFhNIl4IpAnsZzubzVJ9v8DCmqs4qhblULzQOJtQgh7U31TKqS
	eBarU8rmJzKnR703W4TtW3oGFYoSpP8uOaBfw7AiaZJq5IAx1Ebq6T6D
X-Gm-Gg: ASbGncsCbubTrKV+S8AIiciR+eBH/J7G44Ed07uHy6BsNK8CZYfHshth5YrVWWS/108
	aECMTyOpj4nWKRf874PqJMf08O57h0kNGiHe6xyfW999qUgRkYMGvd5JXxaBJm1CC7vFkxa/SqS
	6qO5zgJTd6htcfc00f3soDMvtOlg8UP2jYzvMemLWScdl3ygDXNzsmVhFeehS4DCmFlByXtrMVd
	JTbYXu00X/vr2QzVjnoC2CzW9MvO8YA3iMRf6e9wJFcLZcT00hDT4tspFLO7tvYh/DY3K9qo+Zr
	45NzXqL5amqp5EqCJjTXxthrLnZbaZzZ3HQTDgXTlOB1VQuwAg==
X-Google-Smtp-Source: AGHT+IFbrASD277xcSwNBKzxe63luwLbeNcRlZ7w2jxYC/RzfHfwxJaDm5lxfkKKJa088I1hyWqEkA==
X-Received: by 2002:a05:6a20:144f:b0:1f5:97c3:41b9 with SMTP id adf61e73a8af0-22026e6113amr16803387637.5.1750679101260;
        Mon, 23 Jun 2025 04:45:01 -0700 (PDT)
Received: from geday ([2804:7f2:800b:ea8e::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a64d289sm8207591b3a.132.2025.06.23.04.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:45:00 -0700 (PDT)
Date: Mon, 23 Jun 2025 08:44:49 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/3] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <aFk-MeIWFcBiGBPr@geday>
References: <cover.1749582046.git.geraldogabriel@gmail.com>
 <b7c09279b4a7dbdba92543db9b9af169776bd90c.1749582046.git.geraldogabriel@gmail.com>
 <zuiq3b2rsixymtjr3xzrb26clikvlja62wgj65umnse4kuk75c@x5qan73ispxe>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zuiq3b2rsixymtjr3xzrb26clikvlja62wgj65umnse4kuk75c@x5qan73ispxe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_124504_506891_C91FD681 
X-CRM114-Status: GOOD (  39.82  )
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

On Mon, Jun 23, 2025 at 05:29:46AM -0600, Manivannan Sadhasivam wrote:
> On Tue, Jun 10, 2025 at 04:05:40PM -0300, Geraldo Nascimento wrote:
> > After almost 30 days of battling with RK3399 buggy PCIe on my Rock Pi
> > N10 through trial-and-error debugging, I finally got positive results
> > with enumeration on the PCI bus for both a Realtek 8111E NIC and a
> > Samsung PM981a SSD.
> > 
> > The NIC was connected to a M.2->PCIe x4 riser card and it would get
> > stuck on Polling.Compliance, without breaking electrical idle on the
> > Host RX side. The Samsung PM981a SSD is directly connected to M.2
> > connector and that SSD is known to be quirky (OEM... no support)
> > and non-functional on the RK3399 platform.
> > 
> > The Samsung SSD was even worse than the NIC - it would get stuck on
> > Detect.Active like a bricked card, even though it was fully functional
> > via USB adapter.
> > 
> > It seems both devices benefit from retrying Link Training if - big if
> > here - PERST# is not toggled during retry.
> > 
> > For retry to work, flow must be exactly as handled by present patch,
> > that is, we must cut power, disable the clocks, then re-enable
> > both clocks and power regulators and go through initialization
> > without touching PERST#. Then quirky devices are able to sucessfully
> > enumerate.
> > 
> 
> This sounds weird. PERST# is just an indication to the device that the power and
> refclk are applied or going to be removed. The devices uses PERST# to prepare
> for the power removal during assert and start functioning after deassert.

Hi Mani! Thank you for looking into this.

Yeah, tell me about it, it is beyond weird. I posted RFC Patch in the
hopes someone with access to PCIe Analyzer could have deeper look
at what the heck is going on here - because it does work, but I don't
claim to understand how.

> 
> It looks like the PERST# polarity is inverted in your case. Could you please
> change the 'ep-gpios' polarity to GPIO_ACTIVE_LOW and see if it fixes the issue
> without this patch?
> 
> If that didn't work, could you please drop the 'ep-gpios' property and check?

Sorry to decline your request, but I assure you I have tried many
other combinations before reaching present patch, including your
suggestion. It will do nothing. It won't work, won't make SSD that
refuse to work with RK3399, working. Note that this isn't specific
to my board - RK3399 is infamous for being picky about devices.

> 
> > No functional change intended for already working devices.
> > 
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-rockchip-host.c | 47 ++++++++++++++++++---
> >  1 file changed, 40 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> > index 2a1071cd3241..67b3b379d277 100644
> > --- a/drivers/pci/controller/pcie-rockchip-host.c
> > +++ b/drivers/pci/controller/pcie-rockchip-host.c
> > @@ -338,11 +338,14 @@ static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
> >  static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
> >  {
> >  	struct device *dev = rockchip->dev;
> > -	int err, i = MAX_LANE_NUM;
> > +	int err, i = MAX_LANE_NUM, is_reinit = 0;
> >  	u32 status;
> >  
> > -	gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
> > +	if (!is_reinit) {
> > +		gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
> > +	}
> >  
> > +reinit:
> 
> So this reinit part only skips the PERST# assert, but calls
> rockchip_pcie_init_port() which resets the Root Port including PHY. I don't
> think it is safe to do it if PERST# is wired.

I don't understand, could you be a bit more verbose on why do you
think this is dangerous?

Thanks,
Geraldo Nascimento

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

