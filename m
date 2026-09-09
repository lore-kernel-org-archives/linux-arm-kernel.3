Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285F1C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5vFdgJaDV4YUMq5lpmdzQC9P/e5D7d6TtaH7tjrnhE=; b=qiizY6GtCyKJXox2PpBlXXUAwB
	kzAAP21xGPQabiozlwBt46hFrpKB1lL6KQ+1kRqIWjTHhm+1tVVlAaKCr2hY3kkX3YtXIUKOZSYIB
	YFL4XapuxrqNPEtLUWJ9dVrntxeyHwN+hWvUIg83KjIa+MeyJs/TBunaK5Az7pSXdGI7nE6QC6ABU
	8p8ESpzYcZmSl3ZCfpBDiJFNVwX3nqujeYdxz7thHniWQ7JsFgMwxChxnMQ1sy2TeZLwA4BQ8D0IW
	qSg3tMGy4jyOYN2WoH/0T2e4qTK/QMJXtw+gujxPUsGt08IZAdqvdueS3eOnTZCk3/V+KHkfwY+Jj
	THWb3+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FDM-0000000BNmG-2jdz;
	Wed, 09 Sep 2026 10:07:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FDK-0000000BNlu-4BTL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 10:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t5vFdgJaDV4YUMq5lpmdzQC9P/e5D7d6TtaH7tjrnhE=; b=mlNdLV8N08M5yAC4Vdea888FdP
	bCRNoOdhHnApa8uO2jmBiIPngKHZDjCKpzw4/7K/WhUEBljjc/BK+zSNPgwrQrDhzReU23uVStyyL
	EHapBaa5QOZx2fYk/ho2pzf2YY5LF3LM6uDtaqYIwRxs6Y+wg5ueq9SyMuvMMUlHs7gei1Qr0X3j5
	1majwMDbAx5/OZVn8zU6t9ygUCtQfUgtf4WlQ8K52xdx3eJ/LPor0At1JfFppTIXG1YaayTUXY7TV
	gMEs7hHptACK5IMXrD4dzAiVJRQ2/weNaPSqKwEqGVZ+ADvIHOHh+pD0qUoDZoDWKyhO0vxI5sO8d
	bEwxh68A==;
Received: from mx.nabladev.com ([178.251.229.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4FDI-0000000130A-14zJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:07:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B03AA101CCB;
	Wed, 09 Sep 2026 12:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788948445;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=t5vFdgJaDV4YUMq5lpmdzQC9P/e5D7d6TtaH7tjrnhE=;
	b=IFF89JlAZBhq582k4BbFlFrFNPjbKkidA5MU0OZFY79LAPStNpNeQj5KGL0ghVxC5YKM52
	ZIPR8zXD4OVjUwDUFLMNRLoTxa2F6gRlFX3ZmmP7Ku1qQTuKrrCdwCvzGm5UDj18Jf1A+l
	TTewT0mjSi7aIxMms1/BKB21JjjUVXXWgeDjsqOg/RtAVC4DQVFKPVSwlXUmJRjoit+Ug3
	k5LJp7VvpzL1QMfkcS4WruRJHrC4cacnxEqFanfaYEnXv+EWAuZPky4Mig+O5yGh3I9bXI
	Dji4wc+hfon/apceuuvOJ55VCVRyPZ1f2oECotTUGQV1yAwo9y+yMlA6cfLRMg==
Message-ID: <71a1e980-419f-35a5-647c-b34463a57c37@nabladev.com>
Date: Wed, 9 Sep 2026 12:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
Content-Language: en-US
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fpga@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Xu Yilun <yilun.xu@intel.com>, linux-gpio@vger.kernel.org
References: <20260810062105.299808-1-hs@nabladev.com>
 <ap2Yx8oACWfBKOep@yilunxu-OptiPlex-7050>
 <6a489d2b-b5d1-0455-793f-f4100fd3b3d1@nabladev.com>
 <aqBbFGExUpS0k0yE@yilunxu-OptiPlex-7050>
 <fb783b51-d5cb-c2ae-9d26-11df39e40aa8@nabladev.com>
 <aqEAImnHDYWcOdc0@yilunxu-OptiPlex-7050>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <aqEAImnHDYWcOdc0@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_110732_444669_B0566873 
X-CRM114-Status: GOOD (  27.38  )
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

Hello Xu Yilun,

On 09.09.26 08:43, Xu Yilun wrote:
>>> What if we re-program the 2 FPGAs at the same time? Is there still
>>> chance the 2 CS lines are all asserted? Can they be correctly
>>> re-programmed in this case?
>>
>> In the FPGA layer, yes. Each FPGA is its own fpga_manager with its own
>> CSI_B, and the only lock the core offers is mgr->ref_mutex, which
>> fpga_mgr_lock() takes per manager. Nothing there serializes two managers
>> that share one SelectMAP port, so both CS lines can be asserted at the
>> same time and then both devices take both bitstreams.
>>
>> But one layer higher, the only in-tree trigger for a SelectMAP device is
>> of_fpga_region_notify() calling fpga_region_program_fpga(), and
>> of_overlay_fdt_apply() holds of_overlay_phandle_mutex from beginning to
>> end, so two overlay applications cannot overlap, if I see this correct.
>>
>> I would rather keep this out of this patch.
> 
> Yes, that's the way to go.

Ok, I send the v5 soon.

>> If you want it handled, I can prepare a follow up patch, and it seems to
>> me this can be done with a simple mutex in this driver around the write
>> transfer in xilinx_selectmap_write(), with one lock for all ports.
> 
> "one lock for all ports" is still illogical to me. The FPGAs on
> different ports won't interfere each other, is it?

They do not, you are right. I first thought to solve it "easy" with
a mutex around the write... but nothing tells the driver which managers
share a port.

Two managers on one port and two managers on two ports look exactly the
same from inside the driver. And so we may we lock the write unnecessary...

I have to think about...

>>
>> The port does not have to be held for a whole bitstream, as documentation
>> says, that SelectMAP takes the configuration data non-continuously, with
>> CSI_B deasserted in between, so serializing single transfers already lets
>> two devices be programmed at the same time with each one seeing only its
>> own data.
>>
>> Should I send such a patch? And if yes, as a follow up to a v5 version of
>> this patch?
>>
>> Or add both patches into a v5 series?
> 
> No, fix the existing problem. 2 FPGAs are another topic.

Fine.

> 
>>
>> I am fine with both ...
>>
>>> I mean I think this patch does fix the problem of "always assertion",
>>> which is good to me. But the changelog seems stop me, it talks all about
>>> 2 FPGAs sharing the same bus, which seems more complex than just
>>> manipulating the CS.
>>
>> Agreed. The two FPGAs are how I ran into this, not what the patch is
>> about.
>>
>> So next proposal for the commit message is:
>> """
>> fpga: xilinx-selectmap: control CSI_B and RDWR_B during configuration
>>
>> The driver requests the optional CSI_B and RDWR_B GPIOs with
>> GPIOD_OUT_HIGH and never touches them again. That flag carries a
>> logical value, so both signals end up asserted from probe on, whatever
>> polarity the device tree states, and they stay asserted for the
>> lifetime of the device.
>>
>> Neither signal belongs to the driver's lifetime. CSI_B (Chip Select)
>> selects the device on the SelectMAP port, RDWR_B (Read/Write) selects
>> the transfer direction, so both belong to the data transfer. A device
>> that is never deselected never lets go of the port, and a port pinned
>> to write mode cannot be read back.
>>
>> Keep the two descriptors in the driver private data, request them
>> deasserted, and assert them only around the configuration data
>> transfer. RDWR_B is asserted first as UG570, note 4 of figure "Continuous
>> x8 SelectMAP Data Loading", warns that changing it while the device is
>> selected causes an ABORT on the next CCLK.
>> """
>>
>> If fine for you I can send v5, with no code changes, just some
>> comment changes as discussed.
> 
> Good to me.
> 

Thanks!

bye,
Heiko
-- 
Nabla Software Engineering
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Geschäftsführer : Stefano Babic

