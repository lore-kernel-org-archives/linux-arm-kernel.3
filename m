Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA7ACD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PYP68Ax0qTKJX/4LGN4Imt99aMz5xZB+wF4jYydGK4=; b=Fo+5/jmZtftrkvl5LQBpYvA+Sz
	fMaMeK0oryioOYqMof3aCKLfnOCvg9DzI+ga0ZPdwk3fWD3KXwSvqnFXQoc3MgaXQDD5g8cSheA7l
	6lPV1bVsk/GYp/Ddfs0bbJJ/V7DJ2dDJZcdWPGMUQmhPs5wY08ew5TvgCpfN+OYQvM+aZyOkinq9e
	mXrVRAe2sBLQvUQuiE+iA1D/Y5EDeSTbN98zuA7bH0MFbvFKQV4VQGmYmjHzMsHnf8i7Bw0T80Zuz
	zy06Va7+FnxX4R8f9thul2GzMnv9X2v55tumo6DXxOAP9vso/kCc06spW+Y+v/aOhEHlJRH096PpF
	Wc59EIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTDW-0000000EA0v-1w7B;
	Mon, 11 May 2026 16:10:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTDQ-0000000E9zb-0Ucm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3108C419DD;
	Mon, 11 May 2026 16:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88622C2BCC9;
	Mon, 11 May 2026 16:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515841;
	bh=8PYP68Ax0qTKJX/4LGN4Imt99aMz5xZB+wF4jYydGK4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gc8PZRnaPF+8V5h9qCf9CYSjF3uqxx/ErvEXffQLG8Aa3mr/PmAHtlNC+5vzd7vRG
	 HQ3v+rT4ymx/G6C3jy3eZB5YJY1aRvCqOv2Wm0/o08G2dZDb1PG2Uex38MXbNTE3l4
	 AgL+6dT16dGoG4Qn/pumJaUdON3h8dXQSVbpiFLmY9hDICwdc7BEvdDtTB7KszrPqw
	 /r3Azt+23I75un00Dp33OhXB3K04dPacPPp6QYNhOwuHKZDelz5zSxeQ7gyHAm1AAt
	 zM0tw3yBbms+EScs7wv6ybEG0vMhMs0ITApWhD+i3Nh9EPe9oT06Fx7Q4MzeR9jdIZ
	 snP1GPqsLUHvA==
From: Thomas Gleixner <tglx@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg
 Roedel <joro@8bytes.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [PATCH 1/2] [RFC] debugobjects: avoid gcc-16.0.1 section mismatch
In-Reply-To: <34af0db2-7a04-4119-925f-3aa3e3ecb683@app.fastmail.com>
References: <20260203162406.2215716-1-arnd@kernel.org> <874ikf9i34.ffs@tglx>
 <d52dcd45-959a-4ff4-9e82-0bae133785f1@app.fastmail.com>
 <87y0hq8lcu.ffs@tglx>
 <34af0db2-7a04-4119-925f-3aa3e3ecb683@app.fastmail.com>
Date: Mon, 11 May 2026 18:10:37 +0200
Message-ID: <87bjem7wqq.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_091044_207740_F2C986CC 
X-CRM114-Status: GOOD (  11.84  )
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

On Mon, May 11 2026 at 11:46, Arnd Bergmann wrote:
> On Mon, May 11, 2026, at 09:18, Thomas Gleixner wrote:
>> I agree that the compiler does not know what __init means, but this
>> sucks as it leaves an unused copy of lookup_object_or_alloc() around
>> after init.
>>
>> What happens if you mark is_static_object() with 'noinline'?
>
> I've reproduced the issue with the release gcc-16.1.0 build,
> and tested marking is_static_object (along with
> dummy_tlb_add_page and dummy_tlb_flush from the other
> instance) as noinline.
>
> As expected, this avoids the problem as well.

I rather prefer that along with a comment explaining the 'noinline' oddity.


