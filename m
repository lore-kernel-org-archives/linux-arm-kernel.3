Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A138D49C9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 10:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kD5Mgj9t9wawb46QR0zdGGuw88JGve+LVQ5Rg9kqKDY=; b=QWN3OfJSLR6PpsL7TC2z01fKe+
	0koDPnchEr0EP0ROsRGtGO0KmXJaYNDr7K2LYxEm+X1s8fiKdqlpsvP4mBVPw6vtPJLsIlwWm5+cO
	SbXyLszdK3Qh2sLW3UpCHcksnLX4yq5Bzjzo6L0eCY4c6SKS2J4UzZb1vT2yT6xecgzg6z1NeDKqG
	rJ1f4FMCSucQs4X8M7QSJSKdUWWkkdCer/YQOa6vEg1Pz+zARa+wZz18bo+Ww9Vl++Ia0PlzB3Zqx
	BiX8jxOw+so3tn89WN4Xf3Q+c3CVNnzPPlcTqHShZLn5K8C9IHwPdP3l3i0gTQwlPZd38AVuhiNkS
	A07qheIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllhB-00000001K5U-0Jrr;
	Fri, 30 Jan 2026 10:25:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllh9-00000001K5H-1o02;
	Fri, 30 Jan 2026 10:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9336C60125;
	Fri, 30 Jan 2026 10:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8D5C4CEF7;
	Fri, 30 Jan 2026 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769768742;
	bh=fyIdeBQkoTfBgBc7z6HxcAJSXurpaMjD5jpuxykpbTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qIEIFP0n4kVx8X9ZQZp5aSbmwvq0pB1tv0bXh4mz1nxhm0XCpysMsqZpqfCpNJ9eN
	 l5Yh0P47szslYh5KI7TgFUjt6JZ/PmHrltu+nwjq+kSGidkskEbtpxDTY8spztN9ym
	 dTXG+LXUrtUHOf4ZSH9JpckUS4gC/KVXsN+WEWVC1Q5eJsZ/jvrZGqMCGrCsogVxvy
	 j0nsmwjyAVzCJ8pt09vkhjXuPMb4TVbdtRHvDFGHPeBo9HXxoBXVMVDIp35zZL5ysh
	 ShtYsSD9DM89b3+cEijTD3v4v5k/9Z1Q9AxkVfOlpI+ANrZQmdbQ2A1tPahaiuYafy
	 +UXOD5gxOcCKw==
Date: Fri, 30 Jan 2026 11:25:37 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Grimmauld <grimmauld@grimmauld.de>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
Message-ID: <aXyHITrZ89Mmn8_J@ryzen>
References: <20240809073610.2517-1-linux.amoon@gmail.com>
 <aXtpg0V_sifQEWHJ@grimm-nixos-ssd-2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXtpg0V_sifQEWHJ@grimm-nixos-ssd-2>
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

Hello Grimmauld,

On Thu, Jan 29, 2026 at 03:06:59PM +0100, Grimmauld wrote:
> Hello Anand,
> 
> I have tested this patch.
> Hardware/Kernel information:
> - radxa rock 5c lite
> - rk3588s CPU, arm64
> - defconfig NixOS kernel
> - picked onto 6.18.7
> - DT: rockchip/rk3588s-rock-5c.dtb
> - tested both uboot (mainline) and edk2 (vendor)
> 
> On Fri, Aug 09, 2024 at 01:06:09PM +0530, Anand Moon wrote:
> > Rockchip DWC PCIe driver currently waits for the combo PHY link
> > (PCIe 3.0, PCIe 2.0, and SATA 3.0) to be established link training
> > during boot, it also waits for the link to be up, which could consume
> > several milliseconds during boot.
> 
> I found that without this patch, USB 3 ports as well as the PCIe connector seemingly stay uninitialized during boot on my hardware. 
> This manifests in a bootable USB flash drive loading initrd from bootloader (both uboot and edk2) perfectly, but then fails to mount the rootfs from the drive.
> In effect, boot is not just slower than it should be, it just does not boot all the way at all.
> In that scenario, the devfs entries corresponding to the flash drive are simply missing, same for the sysfs where i would expect the USB device listed.
> Replugging the USB flash drive during initrd does seem to fix that, but is tedious and not viable for a server.
> Similarly, booting from m.2 SSD attached via PCIe fails the same way, with rootfs timing out despite the bootloader correctly reading initrd on the same drive.
> Fwiw, replugging the SSD does not work like it does for USB flash drives, and is even worse of an idea.
> USB 2 ports as well as SD card boots correctly, even without your patch.
> Without your patch, i am seeing "deferred probe pending" in dmesg before boot gets stuck, which was the hint which made me find your patch.
> I am not sure whether that is the actual cause or just a symptom for why drives are not recognized during boot, and am not quite sure how to debug this further.
> 
> > To optimize boot time, this commit allows asynchronous probing.
> > This change enables the PCIe link establishment to occur in the
> > background while other devices are being probed.
> 
> With this patch, booting from SSD or USB 3 port works flawlessly, and i have not seen any regressions with SD card or USB 2 boot, nor any other hardware component.
> This setup has worked for multiple boots without fail, both with traditional ext4 and zfs rootfs being loaded from USB 3 and PCIe.
> Because i require this patch to run my rock 5c from SSD, i am currently running a custom patched kernel, but would highly appreciate this patch making its way to mainline eventually.
> There might well be something else going on here. The proposed patch may not be the "proper" fix to the issues i am seeing, but it does at least work.
> 
> I have NOT tested boot from eMMC (either with or without this patch), though i have no reason to believe it would be impacted.
> 
> I am happy to provide more info as needed. First time posting to the LKML, i hope i am doing this right...
> 
> Tested-by: Grimmauld <grimmauld@grimmauld.de>

I tested this patch again on the latest kernel, and it still results in
the "requesting loading a module with wait allowed while being called from
async context can result in a deadlock" warning from the modules code.
(With the calling code being phylib.)
See the phylib splat that I previously reported in this thread.

Note that I've built the network PHY driver that phylib wants to load
(CONFIG_REALTEK_PHY=y) as built-in. As long as the PHY driver is built
as built-in, I don't think that the problem the modules code is warning
about can happen. (But I also don't understand why it is trying to load
a module when the driver is built as built-in in the first place...)

Anyway, my networking is working perfectly fine even with the splat.


Having async probing for the Rockchip PCIe controller driver, which is
used a LOT of rockchip based SoCs, is a good thing, so I don't think it
is right to avoid enabling async probing just because it results in a
splat on a single rockchip based board (rock5b).


Kind regards,
Niklas

