Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3924C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 09:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMUAr1gcuflt6omTcMRerC0BrGfDrdRai6m223sPdps=; b=IhO60q8wbousaXxzHoxhThocgV
	Zv/YjM5qMeWTEMLYw2+hI93YG6qx6NlqVpU64i/c+PPWV+O09rzjEITKj47X/RjGN9geTvLOqYowW
	cpXhQJmmOaC4mqzNl1KKZMQBznBznHWeAh8ymVsHs0UGTWezFuQ+WLdVjq5ESL1BL4DRVypHKzH5/
	maHp+AgX6jyPXe3PAVmXCt+vljm36jnUuFJlvQp+BIZi/WRa5ivgZ5RqL9h0ertan9vcsgHJ+rF4D
	anbqXudHegokfX335TEU5g38g4pnEpaKogV5eH8vGU435MbmQd277mC/zO2D/z8+sQaEYtQB6P8PH
	N0HTntLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwl7-0000000AODt-0HEV;
	Fri, 28 Feb 2025 09:34:17 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwhL-0000000AN6D-10Im
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 09:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740735023; x=1772271023;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vueB8glrxQlRjIMAss1r71kAHRNbnxrNli+SINmYOp4=;
  b=FDPfgG7Q7XTjx4edm3JiJmXA1gRxpaJOLF46wPVHRMCp0vd5+R6Kymq9
   PxKMUuVztlcQ1D8f4EeS/PH8++H/B/H7GoWKVVhD0gqGqRWXeXQB44ilY
   V7zeYaTxsuEXoHh3FsO106jubQRHOvuR1Hy12Y1PhyBbFmM6vQApBmR3X
   yI06u8z8WGbPsSGh66YgTKlSRkmQnUVW1yl+bhGqxTf10H3id7w/Gj6n+
   Ei3Anj6uXsn+zu5f1+zN2lDdlOKkFXXZBaNxGAuIrcbdPM3Z3TgKR1enJ
   qeD4Xk7ve9ThFhWDyCVDZ4nM9uX9nS7nMDYnm/+91G5cd/+8bGTWWEYO7
   w==;
X-CSE-ConnectionGUID: JSOtyAI1SYms6xpzZditKg==
X-CSE-MsgGUID: IDVBiWuiTQuzCkZFzu4Kvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45438695"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="45438695"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 01:30:21 -0800
X-CSE-ConnectionGUID: Ql+YnlPFR8mAYyWI4sxNoQ==
X-CSE-MsgGUID: wfjEbwY/SauCZb3PqK/3UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148214038"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa001.fm.intel.com with ESMTP; 28 Feb 2025 01:30:19 -0800
Message-ID: <31b489db-9028-4eea-b84d-9497d49fdddc@linux.intel.com>
Date: Fri, 28 Feb 2025 11:31:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: Restrict USB4 tunnel detection for USB3 devices to
 Intel hosts
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Zyngier <maz@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>,
 stable@vger.kernel.org
References: <20250227194529.2288718-1-maz@kernel.org>
 <2025022709-unread-mystified-ddf1@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2025022709-unread-mystified-ddf1@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_013023_324823_45EBC0D4 
X-CRM114-Status: GOOD (  15.96  )
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

On 27.2.2025 22.20, Greg Kroah-Hartman wrote:
> On Thu, Feb 27, 2025 at 07:45:29PM +0000, Marc Zyngier wrote:
>> When adding support for USB3-over-USB4 tunnelling detection, a check
>> for an Intel-specific capability was added. This capability, which
>> goes by ID 206, is used without any check that we are actually
>> dealing with an Intel host.
>>
>> As it turns out, the Cadence XHCI controller *also* exposes an
>> extended capability numbered 206 (for unknown purposes), but of
>> course doesn't have the Intel-specific registers that the tunnelling
>> code is trying to access. Fun follows.
>>
>> The core of the problems is that the tunnelling code blindly uses
>> vendor-specific capabilities without any check (the Intel-provided
>> documentation I have at hand indicates that 192-255 are indeed
>> vendor-specific).
>>
>> Restrict the detection code to Intel HW for real, preventing any
>> further explosion on my (non-Intel) HW.
>>
>> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: stable@vger.kernel.org
>> Fixes: 948ce83fbb7df ("xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts")
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>   drivers/usb/host/xhci-hub.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
>> index 9693464c05204..69c278b64084b 100644
>> --- a/drivers/usb/host/xhci-hub.c
>> +++ b/drivers/usb/host/xhci-hub.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/unaligned.h>
>>   #include <linux/bitfield.h>
>> +#include <linux/pci.h>
>>   
>>   #include "xhci.h"
>>   #include "xhci-trace.h"
>> @@ -770,9 +771,16 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>>   enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
>>   						struct xhci_port *port)
>>   {
>> +	struct usb_hcd *hcd;
>>   	void __iomem *base;
>>   	u32 offset;
>>   
>> +	/* Don't try and probe this capability for non-Intel hosts */
>> +	hcd = xhci_to_hcd(xhci);
>> +	if (!dev_is_pci(hcd->self.controller) ||
>> +	    to_pci_dev(hcd->self.controller)->vendor != PCI_VENDOR_ID_INTEL)
>> +		return USB_LINK_UNKNOWN;
> 
> Ugh, nice catch.
> 
> Mathias, want me to just take this directly for now and not wait for you
> to resend it?

Yes, please, take it directly

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Thanks
Mathias

