Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B607CC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+n8Po8atSSkMnPysk0cqVTEi9Ye8QqiCHIVEioALzPE=; b=j5KJ1TqAO6UgF/mn1zpGld4Wc3
	pQqbEAl7utybBSFtk6xFjm8lnO9mOXWLcm7H0WBvwr+ITc5nIdnJdIjfp4muaxb5ZLklHpWNOh5yz
	t8P5aOgEnVjGgl5/7IomgpjPNaxlrN3TQYrNjiRvoaN4iEq6pgRb0WkQovGkh0O++lUl2ZGxnFzsx
	QTcbRerJqSOenV6SFrYQRBJJ86sIQjP5JBjhr4xwRKgsWCeVjVdGMA7gD0etld/TCPuTHgliivvQU
	RRT0u5ls6Mny3ylnUoa3ydIHzANGa5pQYBvH6//4Bj1dEGkDT4gSWzoXrRthmLsyizK13Pu3whd5D
	QHfJjyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKhE-0000000896n-0ki2;
	Fri, 07 Aug 2026 13:33:12 +0000
Received: from out-184.mta1.migadu.com ([95.215.58.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKhB-0000000894Q-0KxE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:33:11 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1786109585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+n8Po8atSSkMnPysk0cqVTEi9Ye8QqiCHIVEioALzPE=;
	b=b0KVAaI/pv6kp+yfCYn3YYDHWnfZnrLzbBjAc7J0fWB0yU+BGkTD9gBklUKIRPlMGP1UmG
	iLV/byVAOt2RGu/78okKn+Az+NsAw7d7PZ7PV0xXRPvUgVxPrP2UgTk3Hity2+EvLn60vm
	K0hzqZEhHP5VaM8bovkIcDxp9lzroZkGHqTMJELbohLhTgjRxCSMl9z5B4HOfgB9YpYaLj
	LCpObAZHLExhCQeQjcEY9p8H0ulFZYXNCMiLqq9St4/9sjBimMDJsQX18r+07sNxx3WocS
	vYQBU3HJBxewZHW5DWg7X+V0cIlkORa87DI+z8yBQVn/isxzM6bX5N8Kg4WK4w==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 15:32:52 +0200
Message-Id: <DKIR028TZNJ3.3BGQJYSWX2BMN@cknow-tech.com>
Cc: <royalnet026@gmail.com>, <alchark@flipper.net>,
 <chaoyi.chen@rock-chips.com>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>, <iommu@lists.linux.dev>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v6 7/9] accel/rocket: add RK3576 NPU (RKNN) support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Robin Murphy" <robin.murphy@arm.com>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Jiaxing Hu" <gahing@gahingwoo.com>,
 <tomeu@tomeuvizoso.net>, <heiko@sntech.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joro@8bytes.org>,
 <will@kernel.org>, <ulfh@kernel.org>, <p.zabel@pengutronix.de>,
 <ogabbay@kernel.org>, <zhangqing@rock-chips.com>
References: <20260806063413.350184-1-gahing@gahingwoo.com>
 <20260806063413.350184-8-gahing@gahingwoo.com>
 <DKIKXY8XZVPF.3RFR4ISK6Y4QX@cknow-tech.com>
 <fb94bd28-fdbf-4f99-a6ff-b5ab18c64345@arm.com>
In-Reply-To: <fb94bd28-fdbf-4f99-a6ff-b5ab18c64345@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_063309_462518_AE695FFB 
X-CRM114-Status: GOOD (  16.80  )
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

On Fri Aug 7, 2026 at 2:55 PM CEST, Robin Murphy wrote:
> On 07/08/2026 9:48 am, Diederik de Haas wrote:
>> On Thu Aug 6, 2026 at 8:34 AM CEST, Jiaxing Hu wrote:
>>> The RK3576 has two cores of the same RKNN block and a few platform
>>> differences:
>>>
>>>   - the CBUF (convolution buffer) has its own clock domain, so the core
>>>     needs six clocks rather than four;
>>>   - the BIU reset moved into the power domain, leaving one reset here;
>>>   - the NPU spans two power domains, and a device with more than one is
>>>     skipped by the driver-core single-domain auto-attach, so the list h=
as
>>>     to be attached explicitly;
>>>   - the DPU completion interrupt is armed exactly as on RK3588 but neve=
r
>>>     reaches the GIC. The completion is visible in INTERRUPT_RAW_STATUS,
>>=20
>> I don't know if it's relevant, so just a data point:
>> - RK3588 has Cortex A-76 + A-55, which have an External GICv4
>> - RK3576 has Cortex A-72 + A-53, which have an External GICv3
>
> Nope, RK3588 has GIC-600, which is very much v3 still. I guess RK3576=20
> probably has GIC-500 like RK3399 given the CPUs, but that shouldn't make=
=20
> any meaningful difference here.

Unsurprisingly, you're (almost) correct :)
I looked at this document when I wrote that:
https://www.arm.com/-/media/Arm%20Developer%20Community/PDF/Cortex-A%20R%20=
M%20datasheets/Arm%20Cortex-A%20Comparison%20Table_v4.pdf

But the RK3588 TRM Part 1 Chapter 11 'GIC600' says:
"The GIC600 supports the GICv3 architecture ..."
"The version of GIC600 is r1p6-00rel0."

The RK3576 TRM Part 1 Chapter 13 'Generic Interrupt Controller (GIC)' says:
"There is a generic interrupt controller (GIC400) in RK3576 which generates
physical interrupts to Cortex-A53/Cortex-A72."

And RK3399 TRM Part 1 Chapter 11 'Generic Interrupt Controller (GIC)' says:
"The GIC-500 in RK3399 provides registers for managing interrupt sources,
interrupt behavior, and interrupt routing to one or more cores."

Cheers,
  Diederik

> If the interrupt never fires at all then possibly the signal depends on=
=20
> some additional clock or power domain in order to propagate, or it's=20
> just described incorrectly; or if other interrupt sources within the=20
> NPU/IOMMU do still work then maybe there's some additional masking=20
> control that's been overlooked, or perhaps it it just terminally broken.
>
> (And FWIW I'm also inclined to agree with the other comments that=20
> refactoring existing code to make room for new stuff, then actually=20
> adding the new stuff, should probably be two separate steps if it's not=
=20
> completely trivial)
>
> Thanks,
> Robin.

