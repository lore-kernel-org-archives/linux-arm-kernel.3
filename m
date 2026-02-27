Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4376FD5332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKxcJlHIf+yQ0kzOm5919T83WP0WfJyFdhVwxt+TYcI=; b=ePzMpykLFcmXpULgbvIrtGDHuA
	xzoH4mN0PvHIr7i9Ug/rhlukhUGCLJ0+WZdYDCrqC8bUuaSEUEZtqV63juYRSAi/ca5IX+k77+wZK
	l2eY5lEO0J9WuIhdYCNgZG3UuKnIDZKeyMV798cMhlGLKdyEeKGotxdDbZb9EmCZVUWyc+H3iK+6k
	xR8/Voawy+Q+kDypqnBYea0EHZ003BbXSn94dep/gkf0jN47M4cnIJuqjkp36Z8ypXeCXwQmfLRNh
	cZGeytGSMlX0/i4jMBlALP199AgVJxJFzDZT0HMbHDdZ6tsdaH658yd5hguojbf+RBP4r6vEpGgBM
	/EU5l1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvujY-00000008Chl-1Dpl;
	Fri, 27 Feb 2026 10:06:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvujV-00000008ChD-2f1o;
	Fri, 27 Feb 2026 10:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D2C340B50;
	Fri, 27 Feb 2026 10:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59527C116C6;
	Fri, 27 Feb 2026 10:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772186764;
	bh=g8f6lyvqvkopdOsANRzZGlHrXaOkJBu0JPpZhwX5M7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KA6BpxXqIQtvhRJQdxeyUdvh8qnuCG2MwP7HMeafULwbKoZynqIvEQBkLHp9aZGK0
	 2oLKsaZ1WAC1gSwDjpwlGilTDG17yKZ26o1IppOdmKcABFxAjpIXVOJIynO7C2axOH
	 YxoBp2vE+TGq6f7+/hhaKae3sDsCZppNsiskCFDz73pp8KIaqjcHkHMaqA0q5sY1ou
	 exQVqox+NTjea/w0RSIXOSix0uh70nSe4nBxuW16ckfJVRMzQGZyB70JK0Z8+LH3/K
	 0ZKBjpmAdcl0WLsvRezNg53bkP8AVI2HOmeJbmpWThnBUWOaQpN4A9DebRoY4Y2x0J
	 GomXPlN8wjOuA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vvuir-000000004gQ-242t;
	Fri, 27 Feb 2026 11:05:25 +0100
Date: Fri, 27 Feb 2026 11:05:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com>
 <aaFfEsfh0xTh0b1y@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaFfEsfh0xTh0b1y@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_020605_694817_52C1CF69 
X-CRM114-Status: GOOD (  16.59  )
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

On Fri, Feb 27, 2026 at 10:08:34AM +0100, Wolfram Sang wrote:

> > Wolfram, I noticed you merged these last night. Please think again and
> > let's discuss the end result here. There's no question that there are
> > lifetime issues in i2c, but this is not the way to solve it.
> 
> I did think again and do not see a way how the life cycle problems can
> be solved while drivers happily access the device struct of the adapter.

There's nothing special about the struct device. What matters is that
drivers don't free memory that's still in use by the core.

> Whatever the solution to the core problem is (revocable, custom SRCU,
> something else), I still think this step is needed in any case. If I am
> wrong with this opinion, please enlighten me. Pointer to some existing
> thread is OK, too. I didn't have the bandwidth to read the revocable
> mail threads.

It's not even about revocable or SRCU, that's just an implementation
detail.

It seems all that is needed is to decouple the struct i2c_adapter from
the driver data and have core manage the lifetime of the former using
the reference count of the embedded struct device.

Then you can use an rwsem, SRCU, revocable or something else to handle
devices going away while they are in use.

Johan

