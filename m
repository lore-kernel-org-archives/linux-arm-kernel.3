Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAEACCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 06:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9q57YetZremQaMovsDmJdvVQMz1dL2IN1fYFmNllm00=; b=3UOO2fxkWx5nTJPWpvrLi4wIAN
	sRsePTUUS+2VXHe/ZjeU9QJzptcXNzKvo8Uw7UsHYxIZUhCQmsaekWgRbrqpI0oWPeJXjKTEGnVmj
	fA8qxLmXl5wJnBe5loVo6bnut35ZtmoHN/Yr6nkjqq10GgSJPpp5b77N3EANXbJar82Gw46IJ1CLh
	tpTP5tLrwxcR0puC5wcMev/+LtAnwu0AJELKU4ANHfSTjLe2VI8lnJL297mZIosD0X+i6nNCGq8+Y
	95Knyq76nLpuk7j/KHGfS1RCieoIMgM3ToWc2pc5IOwMvapHOphzeMd5iPEMftppmDLfXYPcAsccf
	eLHdxYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMs6-0000000AkPH-1IXr;
	Sun, 19 Oct 2025 06:26:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMs3-0000000AkOZ-0M5r;
	Sun, 19 Oct 2025 06:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B778440A2;
	Sun, 19 Oct 2025 06:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAF1C4CEE7;
	Sun, 19 Oct 2025 06:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760855166;
	bh=5drm76qRadzN/MiXV5TorM1Em9uwpzEm1NGdBnBhsDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eM9Qk7Q3wQJHKvcthQ9pRHExHxk301B5waian5gtkujs13tIF+kUatzBWZ59lJCYp
	 ePALQuqjiQkRyskr6+l7Ul0zg8ES+WBlKzL4QnVNmvUa2etVdUlXBAE9Y/+pF5OzUK
	 t9esr8xOZ0DYIIgr9RvEljsv7/ZipO7S9uMqnU6bb5+fyl1/SKjHhlZuMm3Av6LU5J
	 bcwyGm5PqBa+W5FKLKKlQlbydhSO5vObxEe3uSUo3JV0caLW+5J6rp5r8Pu58qL14l
	 8VwpCEmAZRFqhT6q+qhRTpzAg2+i/ZIyIf/K4+LsjwDMQhFO91oixGAmdmHsUu7B8A
	 Ve/I8yH4+DdZg==
Date: Sun, 19 Oct 2025 11:55:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] PCI: dw-rockchip: Simplify regulator setup with
 devm_regulator_get_enable_optional()
Message-ID: <4fqtxx5isbvyypgjzjczm4mxqhawsmcalap5bvkohgpeqxnyar@uy5bo2yb4lwy>
References: <20250905112736.6401-1-linux.amoon@gmail.com>
 <CANAwSgSYvTJ=8hv_BrrF1v7u3hq5AB_BSfT7wj0-LQF87dQMUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANAwSgSYvTJ=8hv_BrrF1v7u3hq5AB_BSfT7wj0-LQF87dQMUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_232623_182587_9727E125 
X-CRM114-Status: GOOD (  18.00  )
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

On Sat, Oct 18, 2025 at 11:21:49AM +0530, Anand Moon wrote:
> Hi All,
> 
> On Fri, 5 Sept 2025 at 16:57, Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Replace manual get/enable logic with devm_regulator_get_enable_optional()
> > to reduce boilerplate and improve error handling. This devm helper ensures
> > the regulator is enabled during probe and automatically disabled on driver
> > removal. Dropping the vpcie3v3 struct member eliminates redundant state
> > tracking, resulting in cleaner and more maintainable code.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 23 +++++--------------
> >  1 file changed, 6 insertions(+), 17 deletions(-)
> >
> If we compile the kernel with phy and regulator as modules,
> I observe this message.
> 
> [   25.473960][   T55] platform 3c0800000.pcie: deferred probe
> pending: platform: supplier regulator-vcc3v3-pcie not ready
> [   25.474071][   T55] platform fe0a0000.hdmi: deferred probe pending:
> platform: wait for supplier /i2c@fdd40000/pmic@20/regulators/LDO_REG9
> [   25.474124][   T55] platform regulator-vcc5v0-usb-otg: deferred
> probe pending: reg-fixed-voltage: can't get GPIO
> [   25.474171][   T55] platform fdc20000.syscon:io-domains: deferred
> probe pending: platform: wait for supplier
> /i2c@fdd40000/pmic@20/regulators/SWITCH_REG1
> [   25.474218][   T55] platform cpufreq-dt: deferred probe pending:
> (reason unknown)
> [   25.474264][   T55] platform regulator-vcc3v3-pcie: deferred probe
> pending: reg-fixed-voltage: can't get GPIO
> [   25.474343][   T55] rockchip-pm-domain
> fdd90000.power-management:power-controller: Timed out. Forcing
> sync_state()
> [   37.744968][ T2415] psi: inconsistent task state!
> task=2280:(udev-worker) cpu=1 psi_flags=4 clear=0 set=4
> [   37.849725][   T50] fan53555-regulator 3-001c: FAN53555 Option[12]
> Rev[15] Detected!
> [   37.990008][ T2216] SCSI subsystem initialized
> 

This is a deferred probe log and not related to this patch or the PCIe
controller driver. The controller drivers should still be functional once the
dependent GPIO driver is probed.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

