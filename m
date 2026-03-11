Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AC7103E2E8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 21:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rXaMvGNi4+OvPnGl2fgoLlfPW/6GtuSV3FJJcwDS9M=; b=IWMSiV8iI4HE6or70aLTN+2rrq
	W6x1cUHNBEZO1GVGmBAmmc1lqpGJo4uGQVHVyCZYf4SVmYB1jerrVFs4FVH6cjylw5/W+mQWqjPmC
	6SovSHTvvKP0qqaspjfMXbe2GMfPegK37FHdrnDGUAwRQh9nYFgDr/ky5mpaCa4xmPVMm0NmyQ+1C
	Que/vnZDW7XhxeA3RVZq+WZ0Yxgw7tm/o8CYcsG903sAsSlFgSectEXat1ryJ4XbI8chQMEV06739
	ioseJfdWfihOzVIGo5hYeF0wQpZvadMXXSNoplCdOuXQZkaJC7zSHcEJmCZaS8svgJG3gJK6M7KkD
	4vIGdfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Qo4-0000000CX9e-1C46;
	Wed, 11 Mar 2026 21:09:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Qo2-0000000CX9I-3Z8V;
	Wed, 11 Mar 2026 21:09:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADE9260054;
	Wed, 11 Mar 2026 21:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED2FC4CEF7;
	Wed, 11 Mar 2026 21:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773263365;
	bh=0rXaMvGNi4+OvPnGl2fgoLlfPW/6GtuSV3FJJcwDS9M=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=nTY9OMOC9F7kBpERi6z30FTuaZPxVl5Fv76LmjUo5otKD3FEeRahGXzKjzBHLciW/
	 vsFHQE05z41uqlhKhSf82H6e/E4Nzu9yGSGunIZ9o4u6pDNHpQYJyKgpZB6+0m5s1D
	 cAewcAljEd7Hj7kuJulzboI2aN1KxsQbjjxPrm3U6Pu/bOyjMJ6EBuAu7Zg/qeb4B0
	 f6ToSmUPcZdepsHbptQjimEa08e1m8i4KaHUqNpNAR6l4j2zh0wNXnIpDSkMMMCK27
	 3T5aLWdjgAYUE16y8cGqZfrCI7WYozbJwRtjgPtBEKCMJrNi+E6cOP74wmmn8fZt4t
	 s51IXrEVJ8MCw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 22:09:19 +0100
Message-Id: <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Cc: "Robin Murphy" <robin.murphy@arm.com>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@oss.qualcomm.com>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, "Niklas Cassel"
 <cassel@kernel.org>, "Shawn Lin" <shawn.lin@rock-chips.com>, "Hans Zhang"
 <18255117159@163.com>, "Nicolas Frattaroli"
 <nicolas.frattaroli@collabora.com>, "Wilfred Mallawa"
 <wilfred.mallawa@wdc.com>, <linux-pci@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Anand Moon" <linux.amoon@gmail.com>, "Grimmauld" <grimmauld@grimmauld.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>, "Lukas Wunner"
 <lukas@wunner.de>
To: "Manivannan Sadhasivam" <mani@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
 <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
In-Reply-To: <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
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

On Wed Mar 11, 2026 at 1:28 PM CET, Manivannan Sadhasivam wrote:
> On Wed, Mar 11, 2026 at 12:46:03PM +0100, Danilo Krummrich wrote:
>> On Wed Mar 11, 2026 at 6:24 AM CET, Manivannan Sadhasivam wrote:
>> > I have a contrary view here. If just a single driver or lib doesn't ha=
ndle async
>> > probe, it cannot just force other drivers to not take the advantage of=
 async
>> > probe. As I said above, enabling async probe easily saves a few hunder=
d ms or
>> > even more if there are more than one Root Port or Root Complex in an S=
oC.
>>=20
>> Then the driver or lib has to be fixed / improved first or the driver co=
re has
>> to be enabled to deal with a case where PROBE_FORCE_SYNCHRONOUS is reque=
sted
>> from an async path, etc.
>>=20
>> In any case, applying the patch and breaking things (knowingly?) doesn't=
 seem
>> like the correct approach.
>>=20
>> > I strongly agree with you here that the underlying issue should be fix=
ed. But
>> > the real impact to end users is not this splat, but not having the boo=
t time
>> > optimization that this patch brings in. As an end user, one would want=
 their
>> > systems to boot quickly and they wouldn't bother much about a harmless=
 warning
>> > splat appearing in the dmesg log.
>>=20
>> You mean quickly booting into a "harmless" potential deadlock condition =
the
>> warning splat tries to make people aware of? :)
>>=20
>
> Hmm, I overlooked the built-as-module part where the deadlock could be po=
ssible
> as indicated by the comment about the WARN_ON_ONCE().
>
> But what is the path forward here? Do you want the phylib to fix the
> request_module() call or fix the driver core instead?

Here are a few thoughts.

In general, I think the best would be to get rid of the (affected)
PROBE_FORCE_SYNCHRONOUS cases.

Now, I guess this can be pretty hard for a PCI controller driver, as you ca=
n't
really predict what ends up being probed from you async context, i.e. it co=
uld
even be some other bus controller and things could even propagate further.

Not sure how big of a deal it is in practice though, there are not a lot of
PROBE_FORCE_SYNCHRONOUS drivers (left), but note that specifying neither
PROBE_FORCE_SYNCHRONOUS nor PROBE_PREFER_ASYNCHRONOUS currently results in
synchronous by default.

(Also, quite some other PCI controller drivers do set PROBE_PREFER_ASYNCHRO=
NOUS
and apparently got lucky with it.)

From a driver-core perspective I think we're rather limited on what we can =
do;
we are already in async context at this point and can't magically go back t=
o
initcall context.

So, the only thing I can think of is to kick off work on a workqueue, which=
 in
the end would be the same as the deferred probe handling.

Another alternative would be to let the subsystem handle such cases, which =
in
this case would probably mean to handle the current_is_async() case in
pci_host_probe() or pci_bus_add_devices().

On the other hand, this would probably end up to be a subsystem specific
implementation of "kick of work on a workqueue".

> I can drop this patch in the meantime. But holding this prolong wouldn't =
help.

