Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7B2D2F339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rj6P6vozmH1EvRwA6aSxUolOJmV8G7aB4o/SJ24/mXY=; b=EjKTWriI0zxh+7QVGs+Z/ghgH6
	t+na6C57bDjEI5hODkFXoErBXO4MfVl5Q3DJgMLEPnR/cF2sTfvn+/OZsFgVZuzE65DpYanB4/mhB
	xWRrU3/WkM2N0m/Svi2U266MibvQJqGr3xx/SwvQqMooaiIV79xxZVrAv/LeKpdHYpbmhxIbOLqsG
	rL2440BDRsfV/Y0VkfM3RAXv5CE9r7gSe8co2pbMIMP/gcYyWy4429RKKV3uRy4EWgfYFa+/Qo1g6
	s31DDUd4UUd83PJ2SGbNk0vq9cNZcjGJvkK/fhk2FL4NFXdEq3tBvnQwmFMYO2T/tGE0nw4irNOPl
	lnuMxt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgcn-00000007Pqf-2TsI;
	Tue, 13 Jan 2026 15:48:05 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgck-00000007PRK-2nk6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:48:04 +0000
Message-ID: <d6788510-3ae2-4f13-85f6-c0438c89b9a6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768319143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rj6P6vozmH1EvRwA6aSxUolOJmV8G7aB4o/SJ24/mXY=;
	b=q1mpDzMVQ4sFCbigI5ukfTND8EiyoDkl6Ckhxgqny2OhbE81/mmJ1WbGePIr9J1xndh1B2
	1z7lOzMuixBXWH+2jh9y40jNgeXj+OsjmGIYT5h0mMw6lZtyn824jkZKZa+tecKRs7RrzY
	zznRKdIO1G7a0XhVV0F4g0nuNTowcBk=
Date: Tue, 13 Jan 2026 10:45:32 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
 "Frager, Neal" <neal.frager@amd.com>, "Simek, Michal"
 <michal.simek@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260106171018.501612-1-sean.anderson@linux.dev>
 <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
 <MN0PR12MB59538C2F8613A9C0641BEAFBB782A@MN0PR12MB5953.namprd12.prod.outlook.com>
 <8f0e04a5-49df-4fe3-9c76-9a1c0bd822a0@linux.dev>
 <20260113004941.4fhmvlkhf5pifwgt@synopsys.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260113004941.4fhmvlkhf5pifwgt@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_074802_855228_98154A4D 
X-CRM114-Status: GOOD (  24.00  )
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

On 1/12/26 19:49, Thinh Nguyen wrote:
> On Fri, Jan 09, 2026, Sean Anderson wrote:
>> On 1/9/26 01:01, Pandey, Radhey Shyam wrote:
>> > [AMD Official Use Only - AMD Internal Distribution Only]
>> > 
>> >> -----Original Message-----
>> >> From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>> >> Sent: Friday, January 9, 2026 6:19 AM
>> >> To: Sean Anderson <sean.anderson@linux.dev>
>> >> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>; open list:DESIGNWARE
>> >> USB3 DRD IP DRIVER <linux-usb@vger.kernel.org>; Frager, Neal
>> >> <neal.frager@amd.com>; Simek, Michal <michal.simek@amd.com>; open list
>> >> <linux-kernel@vger.kernel.org>; moderated list:ARM/ZYNQ ARCHITECTURE
>> >> <linux-arm-kernel@lists.infradead.org>; Philipp Zabel <p.zabel@pengutronix.de>;
>> >> Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; Greg Kroah-Hartman
>> >> <gregkh@linuxfoundation.org>
>> >> Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
>> >>
>> >> On Tue, Jan 06, 2026, Sean Anderson wrote:
>> >> > If we don't have a usb3 phy we don't need to assert the core resets.
>> >> > Deassert them even if we didn't assert them to support booting when
>> >> > the bootloader never released the core from reset.
>> > Is it a customized bootloader ? i.e it assert reset but don't deassert.
>> 
>> No. Most peripheral resets are asserted on PoR. So if the bootloader
>> doesn't deassert them then Linux has to.
>> 
>> My goal is to make init_serdes() in psu_init_gpl.c optional and do all
>> serdes initialization in the phy driver (and in the consumer drivers). I
>> have this working for DP/PCIe. I'm working on SATA, and I don't think
>> USB/SGMII need much special. This gives the following advantages:
>> 
>> - On some boards (mine) the reference clocks may not be configured in
>>   SPL/FSBL. So ILL calibration will fail (and take a long time to do so)
>>   unless we defer initialization to U-Boot/Linux where the phy driver
>>   can request the clocks.
>> - If PCIe/SATA are not used in U-Boot, ILL calibration can be deferred
>>   until Linux when it can be done it parallel with other initialization.
>> - We will have flexibility to switch between different serdes
>>   configurations at runtime. For example, this could allow the
>>   bootloader to fixup the devicetree to support PCIe and SATA M.2
>>   drives, depending on what the user has plugged in.
>> 
>> > I think ideally core /APB reset should be done independent on
>> > MAC 2.0/3.0 configuration.
>> 
>> I agree, but I think the existing code does this optimization to reduce
>> boot time when the bootloader has already initialized USB. I have
>> preserved that in this patch.
>> 
> 
> I think all this info is useful. Can we include it in the change log?

OK, how about:

I am working on moving serdes initialization to the phy (and consumer)
drivers to improve flexibility and boot times (depending on
configuration). Currently, core resets are released in the bootloader by
init_serdes() in psu_init_gpl.c. In order to remove init_serdes, we
need to handle the case where the bootloader never released the core
resets. If we don't have a usb3 phy we don't need to assert the core
resets, but deassert them anyway to handle this case.

We could assert all resets every boot, but I believe the existing
procedure is an optimization to reduce boot time when the bootloader has
already initialized USB. So this patch preserves the separate code
paths.

