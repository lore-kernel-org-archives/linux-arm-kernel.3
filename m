Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFCD1062880
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9e7uPsBueGA77eULYNQD+EH8QkiJMi+NwcwJCnDyBI=; b=1f2EB9HHWKMjSXmHxsf9mcQqLB
	+RvOSktucoi2l8CaGjclmMGv2XvBzL3X8fY/KhglpRSMzKNXkCdMQoxhimgDOQbETdL54WzF0mxR5
	Chcq34bADYhUzg1lcNEbYvQIIelIxZmX7jB/DbUjcDj9y5NLKJ93zI80Fe4dDf0qiCu5/khiMR5BY
	0s3L0hi7w4MyKDJk73gtqIdlgXThgjXfqcAR8KtrNm3C+XFdNa+9WdaJ2sPC0Q1equxv7wGhVm8oX
	CN48UG+xa7/NzRcnYg7J+hMik+7lJsIBihskBFG5zZCOHjO3RVFmnQnFsVr9urh54kssH0UYCK6/4
	PuIBhjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IRe-0000000BXsB-3IIB;
	Wed, 11 Mar 2026 12:13:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IRc-0000000BXrV-0usS;
	Wed, 11 Mar 2026 12:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6601940795;
	Wed, 11 Mar 2026 12:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDC2C4CEF7;
	Wed, 11 Mar 2026 12:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773231223;
	bh=eIF0LHq5EjuE0G5uZIgYim19/GJ+ngAdSsJDrDYWfD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fcwx+uK4CECDkkiNcQcHrQkqjpTAf9sp25oL40xUeGeGp3dmc19aySgnxxKTW4YVx
	 qp36aO11TymmE/ARwHk0ZtnGB15yuAFOxgtY1UqFqazONp44PxKwN1v2kGhxmj/C38
	 IsPgBBHO5rQ3/vPeCaccWRp1/PRec+Wfj9JD/p5hPus4MDWYBXy2WIM8xlog4INY8q
	 z2gjj23xerTnhOWoIrJekN3bC570oNsR78W81FXCa9jOLhQEF2J4hYqQKTEopxnEB+
	 A30uYriov7NAj6V4zzkpps7K78W4AP0BxbXxkBjvN520UxD3D4jWs0JNfvvSqlAM/i
	 RKyw5Qt6vM94Q==
Date: Wed, 11 Mar 2026 13:13:34 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Hans Zhang <18255117159@163.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Grimmauld <grimmauld@grimmauld.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-ID: <abFcbmkb9p0hx3NR@fedora>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_051344_316159_4493ADBA 
X-CRM114-Status: GOOD (  20.24  )
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

On Wed, Mar 11, 2026 at 12:46:03PM +0100, Danilo Krummrich wrote:
> On Wed Mar 11, 2026 at 6:24 AM CET, Manivannan Sadhasivam wrote:
> > I have a contrary view here. If just a single driver or lib doesn't handle async
> > probe, it cannot just force other drivers to not take the advantage of async
> > probe. As I said above, enabling async probe easily saves a few hunderd ms or
> > even more if there are more than one Root Port or Root Complex in an SoC.
> 
> Then the driver or lib has to be fixed / improved first or the driver core has
> to be enabled to deal with a case where PROBE_FORCE_SYNCHRONOUS is requested
> from an async path, etc.
> 
> In any case, applying the patch and breaking things (knowingly?) doesn't seem
> like the correct approach.
> 
> > I strongly agree with you here that the underlying issue should be fixed. But
> > the real impact to end users is not this splat, but not having the boot time
> > optimization that this patch brings in. As an end user, one would want their
> > systems to boot quickly and they wouldn't bother much about a harmless warning
> > splat appearing in the dmesg log.
> 
> You mean quickly booting into a "harmless" potential deadlock condition the
> warning splat tries to make people aware of? :)
> 
> (Or am I missing a subtle detail and we can never actually end up in a deadlock
> for some reason?)

Right now it will print a warning even when trying to load a PHY driver that
is already loaded (e.g. if the PHY driver is built as built-in):
https://github.com/torvalds/linux/blob/v7.0-rc3/drivers/net/phy/phy_device.c#L806-L815

If the PHY driver is built as a module, then I assume that the deadlock
warning is legit.


Kind regards,
Niklas

