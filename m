Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06CCC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmG3udM9TwJyViGzEk9x57z9AORzLPYUDdcN1EAGORo=; b=HXsnPfrO4exMSoMY6W+TMz91+v
	DArf1+aSL5XYdRG0GmeSu7McCBTUTQXjyiOqFejysQSsWW2DxhRdCoe3zio4UWKYh8HpWVMFPCXeE
	TUxdu4MyetXqPLbBZGc4Xi5gnPwP6ayGVHWO4TV4Kk9wx2fCrDA1WUqmzZ4q8aj0AXQGgbshLrQVu
	1Yf06IqoCnEW5KZu4ExdGa3wrvgN1esvNJ7HXMJwxujEVR8kxunTIWgYNrP8KyQNfARs29OlKeSpc
	QuV51d0yRDMYDNhiCLlPQPrdXIeg3hy9KHt7pSa6jxJ9KvuGQq05/MBuUFo+ugirFBKaJ98WgOd3a
	lzkVQSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnrb-000000081LZ-3DbA;
	Wed, 05 Mar 2025 12:28:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnLm-00000007vbS-0XUa
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 11:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KmG3udM9TwJyViGzEk9x57z9AORzLPYUDdcN1EAGORo=; b=fnFyQBTgFp4Qx82gWXDHvXP1cF
	KXLKj8blpbY/FTKd0jEMa22eEXe0B2Hiy0fYZFx2sCMW+zWjoxCVGMo1lbQo0V9030ZdOWqiuUAZM
	xq8/pW2LJnq80ScaZdYFfJCLzlsuOUgnI3ejMVXwQ5Y0BRsYgvkmQ0XHMzvaCLcAD2Pb+xI0LL40E
	iAOY9otwqTAuwMLUrqcHX9jFzCuVzytqrNL0COje6T7qZ1k9j/AM+bkLZLFhr87GM3XWMzRBqCeKu
	mIbRCUN4RsXXYCvWSIIKJUHzZFLo8CHoNBGS7TVGPbwYOR2t5uMFi/FuXgBzbJADJnVGcEq/sNz8/
	2DpU2qwQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnLi-00000000VZs-2z5M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 11:55:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE6E3FEC;
	Wed,  5 Mar 2025 03:55:53 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AC353F66E;
	Wed,  5 Mar 2025 03:55:38 -0800 (PST)
Date: Wed, 5 Mar 2025 11:55:35 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/15] irqchip/sunxi-nmi: Support Allwinner A523 NMI
 controller
Message-ID: <20250305115535.619ba087@donnerap.manchester.arm.com>
In-Reply-To: <87frjr6i1j.ffs@tglx>
References: <20250304222309.29385-1-andre.przywara@arm.com>
	<20250304222309.29385-7-andre.przywara@arm.com>
	<87frjr6i1j.ffs@tglx>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_115542_983042_AFD63A06 
X-CRM114-Status: GOOD (  17.30  )
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

On Wed, 05 Mar 2025 08:41:28 +0100
Thomas Gleixner <tglx@linutronix.de> wrote:

Hi Thomas,

thanks for having a look!

> On Tue, Mar 04 2025 at 22:23, Andre Przywara wrote:
> >  
> > -struct sunxi_sc_nmi_reg_offs {
> > +struct sunxi_sc_nmi_data {
> >  	u32 ctrl;
> >  	u32 pend;
> >  	u32 enable;
> > +	u32 enable_val;  
> 
> The data structure name and the corresponding variable/argument name
> were making the code pretty obvious, but now this is opaque and
> incomprehensible.
> 
> data::ctrl does not even give the slightest hint what this is about. You
> need to read up in the code to figure out what it means. Something like:
> 
> struct sunxi_sc_nmi_data {
> 	u32	reg_offs_ctrl;
>   	u32	reg_offs_pend;
>   	u32	reg_offs_enable;
> 	u32	enable_val;
> };
> 
> or even better:
> 
> struct sunxi_sc_nmi_data {
> 	struct {
> 		u32	ctrl;
>   		u32	pend;
>   		u32	enable;
>         } reg_offs;
> 	u32		enable_val;
> };
> 
> makes it clear and obvious, no?

Sure, will change it, it was just the usual decision between reworking the
existing code or just adding my small change in. 50% chance of getting that
right, I guess ;-)

> 
> > +static const struct sunxi_sc_nmi_data sun55i_a523_data __initconst = {
> > +	.ctrl	= SUN9I_NMI_CTRL,
> > +	.pend	= SUN9I_NMI_PENDING,
> > +	.enable	= SUN9I_NMI_ENABLE,
> > +	.enable_val = BIT(31),  
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

Oops, missed that.

Thanks,
Andre

> 
> Thanks,
> 
>         tglx

