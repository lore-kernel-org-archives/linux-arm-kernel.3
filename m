Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9258FEB7EB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Go6Wehmyci0DJ/MCAqPt3GYrNoZxkU13L6zOAdfar8s=; b=DId/crxgrSFPOVhnXkXm/XRsPT
	u1rPInvkmx6vPeocbpffKFeM3f9l4kRYQUvJGOz2xxz6xZr5mr1tGysNbOpNbxNJhxGEzpEntCqR0
	IV0Vpq3/ZTgENB8pN6VCUwEDKavRGD0SmITaOr5Y9M6gysMQlR+0JZAbfpArmAb4bqMn6HO8K1yyO
	sgihLLXLHwTGUKGCIM3oIkp310UDA7/e77do+dwoXoAHIzoKWLHk2zeluxrFar1M0QrDQQQoRQmiI
	r3D54BTBRid6vZggnACRsISZcE7KRyBY0uQI4vQdyfkIDn3FK+lsrtYEv9VwbGSOyLSpjyUTBL7ex
	dzBRfgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxk4x-0000000H3Ha-0qGg;
	Wed, 04 Mar 2026 11:07:47 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxk4u-0000000H3GP-29Ha
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 11:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Go6W
	ehmyci0DJ/MCAqPt3GYrNoZxkU13L6zOAdfar8s=; b=kkivlZzPtMJBXQH/hPQ3
	qPCcLeyBPW7V9igmfr58nDc4NCvyUwzGdvAK/tIsS18FsNK2UOl2llVTiRyIQDH8
	zX64j6IFxhKiwPtP0mCvWQDqKyem0mxivks65IsLnnGgzejW/UbORNu6fVqegwke
	soPJOCFJ7fO6ci9/sJyDjtt088/mH1PBt4uWsN00gJaSRvz9Au+P3PzXZXC69AQP
	o8aYQwbaVu/COFNWlQy6UP9/ZIekJc+opAnXSKLR7fisH2iL1s29I5lgFHiz/p98
	hoBGmoA0+RlVDSglIYUHHdWMlv+mJvwKcdfR4PVQ3LULl54pUz5Sc+EoC7/JEe0n
	tw==
Received: (qmail 702506 invoked from network); 4 Mar 2026 12:07:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Mar 2026 12:07:40 +0100
X-UD-Smtp-Session: l3s3148p1@BIQK1DBMcBptKXG7
Date: Wed, 4 Mar 2026 12:07:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
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
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aagSewpM88KAZDcJ@shikoro>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com>
 <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
 <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com>
 <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com>
 <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_030744_830882_0C2C71D0 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Bart, hi Johan,

> And I agree: doing the above would be even better but you'd need - for every
> driver - to move the i2c_adapter struct out of driver data and make it a
> pointer. That's in addition to providing new APIs and using them. I2C drivers
> are spread treewide. There's a reason why nobody attempted it for decades. I'm
> proposing something a bit less complex: allow drivers to free i2c_adapter at
> unbind but make i2c core keep a private, reference-counted structure for as
> long as it's needed.

I am still with Bart, the above paragraph sums it up extremly well IMO.
I also recall that the outcome of the Plumbers session 2024 was "go for
it!". Nobody said the approach would be "fighting" the driver model.
There were a lot of experienced developers in the room.

> I'm frustrated because I'm spending time working on an actual solution. I've
> explained what I'm doing and what the end result will look like based on what
> works for GPIO (struct gpio_chip's lifetime is bound to device's "bound" state,
> struct gpio_device is refcounted, I want to mirror it with i2c_adapter and
> whatever we eventually call its refcounted counterpart - let's say:
> i2c_bus_device).

I am super-happy and thankful that Bart volunteers to spend all this
time on fixing this decade old problem. I know this alone is not a
reason to accept a technically bad solution. But I think it isn't. I
think it is a viable approach to keep the churn and potential
regressions lower than a theoretically ideal solution which is nobody to
do anyways because you'd need to refactor drivers from the 90s in a
quite intrusive way.

All the best,

   Wolfram


