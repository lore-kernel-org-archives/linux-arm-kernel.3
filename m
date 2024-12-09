Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F1CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9hTJeHFyO4kYxJAOw4U8x52akM6QNAnhlp9zWH2pxY=; b=JNYRkVMAyJpI/ARqUOtFtVbf5l
	Oa+Re7Oicpa5xdySZpX9u7M0gtDKLuoHkXh5r3kHR0BcoDxsdMzeQ+7yBg8lxdGhmuTlX2rvD63Sc
	c+CZ7ZGzv3hO6rnLJKm3FajQieRgdF5QnjoncPJeO2EUZsg1b7NsnqONi1umVOLHbZLThdUpRk2LO
	L14xBpUbwCiLRUoy3iL8WqIQNodFdVA9vWsKCyctGuSK/TbfOQbLRuHGiBn15VVvIwDlTq7/3jj/A
	TYYbuSVkaStIqdxwI10mDNJJjZtb/R5TsQiENkyO3z6pnC1ghGMy87/++dqAMClKGZM6lkC96Jbn4
	TnZCA8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh7W-00000008dbv-1vcU;
	Mon, 09 Dec 2024 17:00:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh6R-00000008dL3-41cn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:59:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F32CB113E;
	Mon,  9 Dec 2024 08:59:50 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E75893F720;
	Mon,  9 Dec 2024 08:59:21 -0800 (PST)
Date: Mon, 9 Dec 2024 16:59:19 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Yeoreum Yun" <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nd@arm.com
Subject: Re: [PATCH v2 2/2] firmware/arm_ffa: remove __le64_to_cpu() when set
 uuid for direct msg v2
Message-ID: <Z1ch52AthTYVhtH4@bogus>
References: <20241203143109.1030514-1-yeoreum.yun@arm.com>
 <20241203143109.1030514-3-yeoreum.yun@arm.com>
 <9e60e996-070e-43a7-80e9-efdfda9f6223@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e60e996-070e-43a7-80e9-efdfda9f6223@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_085924_038269_94F3D451 
X-CRM114-Status: GOOD (  30.64  )
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

On Mon, Dec 09, 2024 at 04:27:14PM +0100, Arnd Bergmann wrote:
> On Tue, Dec 3, 2024, at 15:31, Yeoreum Yun wrote:
> > From: Levi Yun <yeoreum.yun@arm.com>
> 
> I just saw this commit in the pull request, and I'm very
> confused because the description does not match the
> patch contents.
>

Sorry for that, I tried to reword to improve it but it is obvious now that I
didn't do a good job there.

> > Accoding to FF-A specification[0] 15.4 FFA_MSG_SEND_DRIECT_REQ2,
> > then UUID is saved in register:
> >     UUID Lo  x2  Bytes[0...7] of UUID with byte 0 in the low-order bits.
> >     UUID Hi  x3  Bytes[8...15] of UUID with byte 8 in the low-order bits.
>
> The specification you cite here clearly describes little-endian
> format, i.e. the low-order byte corresponds to the first
> memory address.
>


> > That means, we don't need to swap the uuid when it send via direct
> > message request version 2, just send it as saved in memory.
>
> "As saved in memory" does not sound like a useful description
> when passing arguments through registers, as the register
> contents are not defined in terms of byte offsets.
>

Well I didn't know how to term it. The structure UUID is a raw buffer
and it provide helpers to import/export the data in/out of it. So in LE
kernel IIUC, it is stored in LE format itself which was my initial
confusion and hence though what you fixed was correct previously.

> Can you describe what bug you found? If the byteorder on
> big-endian kernels is wrong in the current version and your
> patch fixes it, it sounds like the specification needs to
> be updated describe both big-endian and little-endian
> byte-order, and how the firmware detects which one is used.
>

The firmware interface understands only LE format. And by default UUID
is stored in LE format itself in the structure which I got confused
initially. We may need endian conversion at places(found few when trying
to get it working with BE kernel).

I wanted to check with you about this. The current driver doesn't
work with BE. I tried to cook up patches but then the upstream user
of this driver OPTEE doesn't work in BE, so I hit a roadblock to fully
validate my changes. I don't see any driver adding endianness dependency
in the Kconfig if they can't work with BE, not sure if that is intentional
or just don't care. I was thinking if we can disable it to build in BE
kernel until the actual support was added.

So the current FF-A driver just supports LE and the bug was found just
in LE kernel itself.

> > Remove le64_to_cpu() for uuid in direct message request version 2,
> > and change uuid_regs' type to unsigned long.
>
> 'unsigned long' makes the code unnecessarily incompatible
> with 32-bit builds.
>

Understood we may need some typecasting to avoid compiler warnings.

Just a note not related to your comment though: FFA_MSG_SEND_DIRECT_REQ2
is 64-bit only as it uses full 64-bit register to pass UUID.

--
Regards,
Sudeep

