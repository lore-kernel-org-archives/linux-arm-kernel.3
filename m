Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DBECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPjVjwBYUT81NbSYerPLbBR2nCY8Cy0J2Tk3EVZFcmk=; b=RAMRAgI55umS82vJ9ey7jlI2OS
	doBmy+0Wdb/OjvArYpgmoB3OCsMpdb0BsCDoIHX5ehsGkFrDe7Abh90ssdILOyssHZZZXwdNEn1q1
	qXMyVD6Iryghr4YYizwpgDZe5LnVcAgbh1SpXZgPGdVjlHC6zCcbmqVp7AMHnHJqW8fTCOo2BjBUn
	BAAXHlUL0wviyXtqzDt4onO6+loeIU5kFSDahlUJjfPgFPqX67sa6i7xF9hTZreBn9ad7u8TnggTQ
	VmPUT/J13Yx6UTvBE+hhvOaFnJib38KM9VXqlqrXmTdnOsF/WkCJo618JOj1gUIID2y9yh3EZ0+7m
	SbMlRm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMim3-0000000G8Bs-3PPC;
	Tue, 12 May 2026 08:47:31 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMim0-0000000G7zE-43gd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778575649; x=1810111649;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=U6Bt7BPzzqflnmzTq2XYbmY9tMljGE473/5fyCg/9F4=;
  b=lPKx3Souv9xshuYras/GyIWv28sG28vnuWNbzbUygmyA2r/EmAhPhU8U
   fudcClAxGPqnFVKA6jwq9Ihj/UICzWvqbN3XMpf1vw/vd/3T/IagMK91e
   bkp6D7e5qcPg6AtDjaHyVqQigjOVwUo6XMwP5IE23DLx3bcbgzhTjar9S
   O7yZfAwEo4bHGwUgcXD/ccG1DkQhiJB3w8qDjwNVJrnvVQOJTIEQb6HBN
   M7eabx6NYmC6Ar/FxtjEO5yCbV9n1ZiO0JXVV1WaatuDXvSmcQZICGWBt
   X6LVRNVag3J4B3+mbroQPxUPivYvRypIGrosqh40J3kg9dtfhPkjTWE/K
   g==;
X-CSE-ConnectionGUID: brkCTcDHR2SEDaTZtTcg5w==
X-CSE-MsgGUID: 8QgMPfQRQXmcUmsyXTk19g==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83093970"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="83093970"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:45:26 -0700
X-CSE-ConnectionGUID: PV3dQ/zIRW6qGdQHawDNYw==
X-CSE-MsgGUID: z+cDrEW6SWejiepid5vlxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="233229580"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:45:25 -0700
Received: from [10.102.88.179] (oshulzhe-5CG4396S2Q.clients.intel.com [10.102.88.179])
	by linux.intel.com (Postfix) with ESMTP id 0933C20B5714;
	Tue, 12 May 2026 01:45:21 -0700 (PDT)
Message-ID: <be4f662a-b986-4b4c-8263-2fd7b63c238a@linux.intel.com>
Date: Tue, 12 May 2026 10:45:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
To: YH Chung <yh_chung@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "maciej.lawniczak@intel.com" <maciej.lawniczak@intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
 <c3b28ee92fa46700887d0c68b23045b2418358a7.camel@codeconstruct.com.au>
 <KL1PR0601MB4276ED93723F0B1F42349AD89041A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <0f7f0f96-a918-47d5-a0bd-bbde494c8fed@app.fastmail.com>
 <KL1PR0601MB4276B5BE3B96C18E3A66AD709049A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <14870d17-2471-4522-b8b5-03cb9002a4f7@app.fastmail.com>
 <KL1PR0601MB42763DAD359305DEBA4B769D9057A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <KL1PR0601MB427603A6A5768D6A537CAFCB905AA@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <b1d56feb-9847-41b1-8bba-733963055cae@linux.intel.com>
 <KL1PR0601MB4276AB799EC03BB00C4C0E5490392@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Content-Language: en-US
From: "Shulzhenko, Oleksandr" <oleksandr.shulzhenko@linux.intel.com>
In-Reply-To: <KL1PR0601MB4276AB799EC03BB00C4C0E5490392@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_014729_093846_A5B85D4A 
X-CRM114-Status: GOOD (  26.21  )
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

On 5/12/2026 9:08 AM, YH Chung wrote:
> Hi Shulzhenko,
>
> Thanks for the follow-up.
>
>> Integrating this driver into the SPI subsystem may allow reusing some existing
>> definitions, e.g.|spi_controller|,|spi_message|, and perhaps parts related to
>> single/dual/quad I/O handling. At the same time, parts such as the Flash channel
>> (included in the current series), and OOB / Virtual Wire support (I would expect
>> to come later), appear to be specific to the Intel eSPI protocol. Modeling all of
>> that as just another SPI IP driver may introduce some awkward layering and
>> overhead.
> Agreed. eSPI introduces two additional pins, RESET# and ALERT#, beyond the
> standard SPI signals. More importantly, eSPI functionality is described
> primarily in terms of four logical channels, rather than generic low-level
> bus signaling or pure data transfers.
>
>> Also, the current series already seems to separate common eSPI logic from
>> AST2600-specific pieces, assuming that 2700 driver is also coming at some point.
>>
>> This makes me wonder whether a dedicated eSPI layer/subsystem could be a
>> better fit — either under the SPI or as something separate (but not SoC driver).
>>
>> Given my limited experience with SPI/eSPI, could you help clarify a few points for
>> me (and probably others as well)?
>>
>> * How much of the SPI subsystem can be reused for this implementation,
>> both for the current patchset and for likely future extensions?
> I believe only a limited portion of the SPI subsystem can be reused. Some
> generic framework elements, such as controller registration and basic
> scaffolding, may be useful initially. But this reuse appears to be mostly
> mechanical rather than semantic. Once eSPI-specific features like Flash
> channels, OOB messaging, and Virtual Wire semantics are involved, the SPI
> transaction model does not seem to map very naturally.
>
>> * Are there any pitfalls or abstraction mismatches in trying to reuse
>> the SPI core here?
> Our main concern is an abstraction mismatch. SPI is designed as a generic
> peripheral bus, while eSPI is more of a system-management interface with
> explicit host-BMC-specific semantics. Reusing the SPI core would likely
> require treating eSPI packets as generic bus-level transfers in the kernel.
>
> However, some eSPI transactions and protocol handling, such as LPC bridge
> accesses, are performed autonomously by the hardware rather than being fully
> driven as low-level bus operations by the driver. This makes the eSPI driver
> somewhat different from a conventional serial bus controller driver
> maintained under the SPI core.
>
Hi YH,

My main concern is trying to understand whether it is completely 
impossible (or introduces too much effort that we'd better not to take) 
integrating this to SPI subsystem.

 From your reply I understand there are two potential blockers:

a) Treating eSPI transfers as bus-level transfers (meaning that it will 
be necessary probably making separate driver for OOB/VW/Flash channels 
as they essentially use eSPI as a transport);

b) Some logic being done by the hardware (i.e. LPC bridge).

Please confirm my understanding:

(a) is feasible, but requires many effort to re-define architecture

(b) If something is done by the hardware - what is the driver impact? I 
recall eDAF use case when the driver wasn't involved at all - and flash 
access was fully done by the hardware (unless the controller is 
configured to handle it in SW mode).


P.S. I guess we can talk about host-BMC communication only when talking 
about hardware-dependent stuff (i.e. ast2600-espi files). eSPI core 
should be (it seems to be already is) at least BMC agnostic and this is 
the reason not having it under SOC/aspeed (ast2600-espi.* may stay here 
though).


