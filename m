Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7334AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEbSx3m/0WmN/XxBvaudxQdrtv8m4jlbSmE6U/H+MCY=; b=bJlsW541Fk5r0OqEH3NQby0dfc
	wMKdSQxnIOkia9xzc4CIFVaXMtzqmVFuN+PFKhKQ4VyrWRFyeNkaSdHJaB7EfJRK3/vJWjvP42CD9
	LYaNXvW3ybGhjI2HwfMCWuL1sEoctM6/yANn+Txdpb69VQsHsMxZj9wFPgG83tsr0HuNb4Mqed6OZ
	KKwsi2i9WBKersVSVcuxRusYFKkDvzHxkF1Af6rjEz0zogQcLuUDGxtUlC7M/oKRe5GWDFWqdXXa+
	5J3l2RZrZSB0b9N4q8j853qZxmtsUJXT8WKczxOgtJM/BAsovj1JkZrLNpXrU6Tn4t3DoT2aEFXog
	zztEiAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxHg-0000000B6YT-1WBv;
	Tue, 10 Dec 2024 10:16:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxAb-0000000B4td-2paN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:08:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17024113E;
	Tue, 10 Dec 2024 02:09:13 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D3FB3F58B;
	Tue, 10 Dec 2024 02:08:44 -0800 (PST)
Date: Tue, 10 Dec 2024 10:08:41 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Yeoreum Yun" <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nd@arm.com
Subject: Re: [PATCH v2 2/2] firmware/arm_ffa: remove __le64_to_cpu() when set
 uuid for direct msg v2
Message-ID: <Z1gTKRZGyE7VuJo0@bogus>
References: <20241203143109.1030514-1-yeoreum.yun@arm.com>
 <20241203143109.1030514-3-yeoreum.yun@arm.com>
 <9e60e996-070e-43a7-80e9-efdfda9f6223@app.fastmail.com>
 <Z1ch52AthTYVhtH4@bogus>
 <0cb655ee-9401-41bb-b9cd-580e0aeef2be@app.fastmail.com>
 <Z1fvkpYvqpnjPZA8@e129823.arm.com>
 <d750f114-8a25-4c84-912e-b6fb407a5150@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d750f114-8a25-4c84-912e-b6fb407a5150@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_020845_761995_AB9A0166 
X-CRM114-Status: GOOD (  29.08  )
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

On Tue, Dec 10, 2024 at 09:45:51AM +0100, Arnd Bergmann wrote:
> On Tue, Dec 10, 2024, at 08:36, Yeoreum Yun wrote:
> >> On Mon, Dec 9, 2024, at 17:59, Sudeep Holla wrote:
> >> > On Mon, Dec 09, 2024 at 04:27:14PM +0100, Arnd Bergmann wrote:
> >>
> >> Looking through the other functions in drivers/firmware/arm_ffa/driver.c,
> >> I see that most of them just match the specification. One exception
> >> is ffa_notification_info_get(), which incorrectly casts the
> >> argument response arguments to an array of 'u16' values. Using
> >> the correct bit shifts according to the specification would
> >> make that work on big-endian and also more readable and
> >> robust. Another one is __ffa_partition_info_get_regs(), which
> >> does an incorrect memcpy() instead of decoding the values.
> >>
> > Conclusionly, Yes. But the RFC 4122 said with network byte order.
> > to describe how uuid is saved.
> >
> > but I think the endianess to load the register is not a choice.
> > because the spec says:
> >
> >     UUID Lo  x2  Bytes[0...7] of UUID with byte 0 in the low-order bits.
> >     UUID Hi  x3  Bytes[8...15] of UUID with byte 8 in the low-order bits.
> >
> > this means UUID.bytes[0] should be loaded to x2.bytes[0].
> >            UUID.bytes[1] should be loaded to x2,bytes[1]
> >            ...
> 
> I meant they had the choice and chose to specify little-endian
> 64-bit word to encode the sequence of bytes of the standard
> in-memory representation of UUIDs. 
> 
> > That's why other software spec (i.e tf-a) doesn't loads UUID from register
> > wihtout swapping byte with endianess but just copy it.
> 
> If the uuid is transferred in memory, you obviously don't want to
> swap it. If they pass it in registers across different endianess
> code without specifying the byteorder in the caller, then they
> would have the same bug.
> 
> > The bug is "not send UUID according to spec" in kernel side
> > That's why it fails when I send message  with direct message version 2.
> > So, it''s not change code unportable to portable but it fixes according
> > to spec (load UUID as it is in register wihtout endianess).
> 
> Sorry, but you are not making sense here.
>

Agreed. The patch is clearly wrong. Thanks for refreshing my knowledge and
helping me to clear my confusion.

> Sudeep, should I just cherry-pick your other fix from the pull
> request and ignore this patch?
>

I will remove the wrong patch and retag and send PR if that helps. It should
be quick.

-- 
Regards,
Sudeep

