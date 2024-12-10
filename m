Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CB4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Byq884tBsehtIWRCReF58nKCQmis05qwXaxttfV3Wg4=; b=dL2jFnSJ412URAsb+iRq/MZZvu
	bQf4MG2XjOwc2Fui8lNqqMn2t8YTlIIIPKB490F8ndSUQdD9tx9u/U3FR7LpITMlYP8rhpW6SJJe+
	wEBJM5111caNH3F63RR/x1eRw6w1bjqCk1IQ9zbjM/5ROtFcqEQTE0BGIL/WeVpIbRgVF0uwyKKjB
	UWyB5gtTV54ZgbtVdyIxMFe/Am952C/jlAIy4RkB5ifnZTiS2ohotqWcS+TRtrLNvNgh7V4abF0S0
	V5pSSdeuRtYmdRmw0+QUirqNT+u8DoEEuKHZIk3AyhxlU+kNcIax2pzkshK15hh1AH84Qk3WGgHkP
	LuWG+x3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKx7P-0000000B4Nq-1U80;
	Tue, 10 Dec 2024 10:05:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwsV-0000000B0Jg-1rsU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 09:50:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C253113E;
	Tue, 10 Dec 2024 01:50:30 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53FCE3F58B;
	Tue, 10 Dec 2024 01:50:01 -0800 (PST)
Date: Tue, 10 Dec 2024 09:49:58 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] firmware/arm_ffa: remove __le64_to_cpu() when set
 uuid for direct msg v2
Message-ID: <Z1gOxjyEajxkyHnT@bogus>
References: <20241203143109.1030514-1-yeoreum.yun@arm.com>
 <20241203143109.1030514-3-yeoreum.yun@arm.com>
 <9e60e996-070e-43a7-80e9-efdfda9f6223@app.fastmail.com>
 <Z1ch52AthTYVhtH4@bogus>
 <0cb655ee-9401-41bb-b9cd-580e0aeef2be@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cb655ee-9401-41bb-b9cd-580e0aeef2be@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_015003_570727_3A3F8EC0 
X-CRM114-Status: GOOD (  49.73  )
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

On Mon, Dec 09, 2024 at 09:04:30PM +0100, Arnd Bergmann wrote:
> On Mon, Dec 9, 2024, at 17:59, Sudeep Holla wrote:
> > On Mon, Dec 09, 2024 at 04:27:14PM +0100, Arnd Bergmann wrote:
> >
> >> > That means, we don't need to swap the uuid when it send via direct
> >> > message request version 2, just send it as saved in memory.
> >>
> >> "As saved in memory" does not sound like a useful description
> >> when passing arguments through registers, as the register
> >> contents are not defined in terms of byte offsets.
> >>
> >
> > Well I didn't know how to term it. The structure UUID is a raw buffer
> > and it provide helpers to import/export the data in/out of it. So in LE
> > kernel IIUC, it is stored in LE format itself which was my initial
> > confusion and hence though what you fixed was correct previously.
> 
> The way I would phrase it, the UUID is never "stored" in
> big-endian or little-endian format, it's just remains a string
> of bytes. The endianess becomes a choice only when loading it
> into registers for passing the argument to firmware, and it's
> the firmware that mandates little-endian in the specification.
>

Thanks, I will add such a note when I get BE support fixed so that it is
clear.

> >> Can you describe what bug you found? If the byteorder on
> >> big-endian kernels is wrong in the current version and your
> >> patch fixes it, it sounds like the specification needs to
> >> be updated describe both big-endian and little-endian
> >> byte-order, and how the firmware detects which one is used.
> >>
> >
> > The firmware interface understands only LE format. And by default UUID
> > is stored in LE format itself in the structure which I got confused
> > initially. We may need endian conversion at places(found few when trying
> > to get it working with BE kernel).
> >
> > I wanted to check with you about this. The current driver doesn't
> > work with BE. I tried to cook up patches but then the upstream user
> > of this driver OPTEE doesn't work in BE, so I hit a roadblock to fully
> > validate my changes. I don't see any driver adding endianness dependency
> > in the Kconfig if they can't work with BE, not sure if that
> > is intentional or just don't care. I was thinking if we can disable
> > it to build in BE kernel until the actual support was added.
> 
> I think as long big-endian kernels remain an option on arm64, we
> should try to to write portable code and implement the specification
> The reality of course is that very few people care these days, and
> it's getting harder to test over time.
>

Indeed. I do run SCMI once in a while but hadn't tried FF-A so far for no
particular reasons. I will get that sorted this time.

> > So the current FF-A driver just supports LE and the bug was found just
> > in LE kernel itself.
> 
> What is the bug and how was it found? The only thing I see in
> the patch here is to change the code from portable to nonportable,
> but not actually change behavior on little-endian 64-bit.
>

OK you are right, I clearly got confused. There should be something
else messed up in the setup. I think fixing BE support will avoid such
things in the future, I will get on that ASAP. Sorry for the confusion.

I just dumped the buffers and UUID and it works as expected, so I blindly
assumed the firmware setup is correct and there is a bug.

> Looking through the other functions in drivers/firmware/arm_ffa/driver.c,
> I see that most of them just match the specification. One exception
> is ffa_notification_info_get(), which incorrectly casts the
> argument response arguments to an array of 'u16' values. Using
> the correct bit shifts according to the specification would
> make that work on big-endian and also more readable and
> robust. Another one is __ffa_partition_info_get_regs(), which
> does an incorrect memcpy() instead of decoding the values.

Yes these are 2 main changes I have. I think I had one more but I need to
go back and check. I plan to post them once I have done the testing with
OPTEE. I just want to run xtest they have and see if everything works for
which I may need to spend sometime.

-- 
Regards,
Sudeep

