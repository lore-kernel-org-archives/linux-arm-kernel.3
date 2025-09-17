Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F2ACAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GN2oW3Vha1TGHz1+0kWkrH9SeR8aT1llvHpXanq9kIw=; b=nBoFWbIQrxgZyEBdptz0tycacg
	I9Die/zTNSAJxzg87jTelqwICVhn/K3JsyBakGONmdVTLhDRQhxNlZcgqtgoVhFzRibFwYKefQ5u1
	p3c4gJuEoON5mwxhiz/VzYtgU6PPfEU6JOFH2+oE3pmmziBO/jgsFbSunGKsITlIBY0zRulmlia5J
	lGJhh412/drGFadJS4whMSYdMfmHZFzqSjWILqeb/C4xv8dZunNG0bU+Sq+Xl6vTDHvIskviTC+e7
	7LEQIjSq9bIn47cPsW6UdEmUfzsNPW4cdzNvZ+qneCo1L75rBhM89lBe+FXps7hohfCXBrSYZ0Dcd
	nyH1RuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt1e-0000000CA13-1BrV;
	Wed, 17 Sep 2025 14:20:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt1d-0000000CA0Q-0bOy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:20:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 622296023C;
	Wed, 17 Sep 2025 14:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFC0C4CEE7;
	Wed, 17 Sep 2025 14:20:44 +0000 (UTC)
Date: Wed, 17 Sep 2025 15:20:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, Will Deacon <will@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>, maz@kernel.org,
	oliver.upton@linux.dev, corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	shuah@kernel.org, shameerali.kolothum.thodi@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	tangchengchang@huawei.com, wangzhou1@hisilicon.com
Subject: Re: [PATCH v4 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Message-ID: <aMrDuieMX9WL4jkB@arm.com>
References: <20250715081356.12442-1-yangyicong@huawei.com>
 <20250715081356.12442-6-yangyicong@huawei.com>
 <aL7Fgx__LeLfbDyU@willie-the-truck>
 <5d2ba565-715b-9b17-951b-f805dde5988b@huawei.com>
 <aMLvtpaCgRqPAU2Z@willie-the-truck>
 <20250912144736.00007673@huawei.com>
 <666e3588-2e42-2275-f9ec-94ba0954bdc6@huawei.com>
 <aMl6u7xTDLhrZmqK@arm.com>
 <0dfe5781-7ca7-7d9f-b099-b20da5e10a1b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dfe5781-7ca7-7d9f-b099-b20da5e10a1b@huawei.com>
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

On Wed, Sep 17, 2025 at 11:51:20AM +0800, Yicong Yang wrote:
> On 2025/9/16 22:56, Catalin Marinas wrote:
> > On Mon, Sep 15, 2025 at 04:29:25PM +0800, Yicong Yang wrote:
> >> in my understanding the hwcap only describes the capabilities of the CPU but not
> >> the whole system. the users should make sure the function works as expected if the
> >> CPU supports it and they're going to use it. specifically the LS64 is intended for
> >> device memory only, so the user should take responsibility of using it on supported
> >> memory.
> > 
> > We have other cases like MTE where we avoid exposing the HWCAP to user
> > if we know the memory system does not support MTE, though we intercepted
> > this early and asked the (micro)architects to tie the CPU ID field to
> > what the system supports.
> 
> but we lack the same identification mechanism as CPU for the memory system, so it's just a
> restriction for the hardware vendor that if certain feature is not supported for the whole
> system (SoC) then do not advertise it in the CPU's ID field. otherwise i think we're currently
> doing in the manner that if capability mismatch or cannot work as expected together then a
> errata/workaround is used to disable the feature or add some workaround on this certain
> platform.
> 
> this is also the case for LS64 but a bit more complex, since it involves the completer outside
> the SoC (the device) and could be a hotplug one (PCIe). from the SoC part we can restrict to
> advertise the feature only if it's fully supported (what we've already done on our hardware).

That's good to know. Hopefully other vendors do the same.

I think the ARM ARM would benefit from a note here that the system
designers should not advertise this if the interconnect does not support
it. I can raise this internally.

> > Arguably, the use of LD/ST64B* is fairly specialised and won't be used
> > on the general purpose RAM and by random applications. It needs a device
> > driver to create the NC/Device mapping and specific programs/libraries
> > to access it. I'm not sure the LS64 properties are guaranteed by the
> > device alone or the device together with the interconnect. I suspect the
> > latter and neither the kernel driver nor user space can tell. In the
> > best case, you get a fault and realise the system doesn't work as
> > expected. Worse is the non-atomicity with potentially silent corruption.
> 
> will be the latter one, both interconnect and the target device need to
> support it. but I think the driver developer (kernel driver or userspace
> driver) must have knowledge about the support status, otherwise they
> should not use it.
[...]
> my thoughts is that the driver developer should have known whether their
> device support it or not if going to use this. the information in the
> firmware table should be fine for platform devices, but cannot describe
> information for hotpluggable ones like PCIe endpoint devices which may
> not be listed in a firmware table.

There's a risk of such instructions ending up in more generic
copy_to/from_io implementations but it's not much we can do other than
not enabling the feature at all.

So, I think a HWCAP bit is useful but we need (a) clarification that the
CPUID field won't be set if the system doesn't support it and (b)
document the Linux bit that it's a per-device capability even if the
CPU/system supports it (the HWCAP is only a prerequisite to be able to
use the instructions; the driver can fall back to non-atomic ops, maybe
with a DGH if it helps performance).

An alternative would have been for the kernel driver to communicate to
the user that the device supports the 64-byte atomic accesses but I'm
not aware of any fairly generic way to do this.

-- 
Catalin

