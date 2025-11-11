Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79F6CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbxjKRDyIK7i3YBkKCYlqvdlEJ4rgkDKW+LDMud6sYk=; b=LJtvK1vAN/p/VZR9zzX3eb/3Gy
	h0Xrs692QXKb0qACcwCm8iKg4VXzGyQKKdSeth0ErwM7iMBeY60KSuo4/dxcMnLXGG2lRkBaro3g6
	8it+8q3JMqa6L0PGl/uMpJQ/J5zaviGb+7qAUKm5mDMCAKw18jEkNE0IllQCkEMmDbjYLunIEo+Vz
	BjU9kXixvelC7SGYpaS1Rf3VFJ7JgZyXJfu/VNPBVLxCFtFMV3tHLLcsz0vL2go/qsp4t3+U/XnHE
	QtgpJ34xppaFSKdSULOmYh7qeqSzDE+bwRO/sfT6t5RiZG+t0hVO967m9FXiMWnxUltG88UVK8RxQ
	RLp+u3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIouo-00000007HCw-02y3;
	Tue, 11 Nov 2025 14:00:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIoum-00000007HCj-1eaP;
	Tue, 11 Nov 2025 14:00:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8201A6020B;
	Tue, 11 Nov 2025 14:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B6CC113D0;
	Tue, 11 Nov 2025 14:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762869607;
	bh=D1S3OL4p0+J4mWcZ2dm1aw9L5R0M+rOLhxjglXPSaEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BK6yS3ikNQGdeSm87kJZrIJJ2XY6POhOH7MZmL27V0Z5S3dw3nYncaxgaHcY1Lu+F
	 JfFL1HyiOjKsoFotilBRDoOwnVtfEN+Am17dFZfdhl0iJzjCla5OqcEAQDJEoJm/UW
	 zQl/cTwTmOjKHw9ttl9MFYwgAmc2524Srxq/IfABJDKxLrba4bc4JT3yXrBsZMKi5H
	 Da2hh7/+bYFZH+VSJUbPQjShpd8y+P5ZonC8DCmnRcV2ZQTaP9oh5X/y2e05XA9pX1
	 V2vT6CqyqJnODCdbHc0Dsnc313OsQ0rZJdxY80KZzyZZThukX8LeGbI/ySB71OPEQO
	 kUp8PlC3G+pJQ==
Date: Tue, 11 Nov 2025 15:00:01 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: FUKAUMI Naoki <naoki@radxa.com>, Damien Le Moal <dlemoal@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [RESEND] Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
Message-ID: <aRNBYX8MbR7PtssY@ryzen>
References: <780a4209-f89f-43a9-9364-331d3b77e61e@rock-chips.com>
 <4487DA40249CC821+19232169-a096-4737-bc6a-5cec9592d65f@radxa.com>
 <363d6b4d-c999-43d4-866e-880ef7d0dec3@rock-chips.com>
 <0C31787C387488ED+fd39bfe6-0844-4a87-bf48-675dd6d6a2df@radxa.com>
 <dc932773-af5b-4af7-a0d0-8cc72dfbd3c7@rock-chips.com>
 <aRHb4S40a7ZUDop1@ryzen>
 <2n3wamm3txxc6xbmvf3nnrvaqpgsck3w4a6omxnhex3mqeujib@2tb4svn5d3z6>
 <aRJEDEEJr9Ic-RKN@fedora>
 <B721C8A516FDB604+a04b38d3-64ec-423f-9e4c-040c8d2aec76@radxa.com>
 <05bd0efe-9a84-40e9-af07-51c0b0d865bf@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05bd0efe-9a84-40e9-af07-51c0b0d865bf@rock-chips.com>
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

On Tue, Nov 11, 2025 at 11:17:23AM +0800, Shawn Lin wrote:
> > 
> > It works stably on the ROCK 5A. The link speed is 2Gb/s.
> > 
> > The ROCK 5C is unstable. It initially worked with a link speed of 4Gb/s,
> > but eventually started showing kernel oops. The dts files for the 5A and
> > 5C are compatible and interchangeable, but even using the 5A's dts on
> > the 5C, the operation remains unstable.
> 
> The link speed on ROCK 5A is 2Gb/s also means it's downgraded now. Did
> ROCK 5A work under the link speed of 4Gb/s before?
> 
> In case it's signal integrity relevant, you could enable PCIE_DW_DEBUGFS
> and refer to Documentation/ABI/testing/debugfs-dwc-pcie to collect
> RASDES info from there.

Just a quick note:
I've noticed that you cannot blindly look at the link speed in dmesg.

E.g. on my ROCK 5B boards, I can occasionally see something like:
[    1.417181] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link

However, if I check the actual link speed with lspci after boot:

# lspci -vvv  -s 0000:01:00.0 | grep LnkSta:
                LnkSta: Speed 8GT/s, Width x4

I can see that the link is actually using the correct speed + number of lanes.


Kind regards,
Niklas

