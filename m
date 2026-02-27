Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E06FEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ra4gGeTukVvl+IUi3kpBx/h8Xrcr5tcq4BLIbbsXf6c=; b=l3yUVgSHFyqgE2X0P4Nj3apKUW
	JE+98k4D3vboeNfVakmCC0qi8ux6JkBh4Jur2AgNj2aoU+nLgeCRrPV4LyJgk7Ua5TZVYHDTZdT5b
	lH0G0wx+MXVf3cCpyFdjTS8CEkmOL7nu/U33NgZ8j6HWT2P/mvFIa+FCrjrn4W+KM1PbU19d90C5D
	Tf7rvc0dmssLClS7GKcgsJ1V7btNavmSuzd/x0lZBlXMuPKvpssdciCSQckqsmfZyhXjFXFrfNSO4
	A3mAjI/BOGFsGGHUDII8f7MR0iAGr45FA1v+nLAUE8NeLwhP53ws/R1HeubEhAr0L2ySP44XW04+L
	Ma9ZZBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0tr-00000008kN5-1uYh;
	Fri, 27 Feb 2026 16:41:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0tp-00000008kMr-2hrq;
	Fri, 27 Feb 2026 16:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0784E60054;
	Fri, 27 Feb 2026 16:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A9DC116C6;
	Fri, 27 Feb 2026 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772210468;
	bh=Ra4gGeTukVvl+IUi3kpBx/h8Xrcr5tcq4BLIbbsXf6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kaYFALf4xSZVQAbA312F7K02ns0zy5kcaOvWHFJNWY9AvATt7pUW+bvMJKbdtChtm
	 tH2uUwehXsL2Hj8fdwwpVCcWuHdDsb63uUFJP2cMF43xNCJTDSxZcHpwvTLSu1U7Sl
	 M2FUvnb6mDY3PWKJMno+e3SWOYvxG8KKG8vxw4MEn6hOq41EUPBH23+RINiw2vhX+e
	 FbHp3qUfZvbZuE+CnrnSZvs5NqaaWkofdWxMYqTtE/Z0RbEfnkD+zmDgc1t+2WJ5x1
	 9nBJrTX+Zzefz1LyUgn8uO+y6uQ40gkpU5G5jKsZVOMPxB3x2051Wg3WzGAPsaffSQ
	 nrMMZp0t1q53A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vw0tB-000000002TD-2FBk;
	Fri, 27 Feb 2026 17:40:29 +0100
Date: Fri, 27 Feb 2026 17:40:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Message-ID: <aaHI_VavZugXjVoL@hovoldconsulting.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com>
 <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
 <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
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

On Fri, Feb 27, 2026 at 04:42:09PM +0100, Bartosz Golaszewski wrote:
> On Fri, Feb 27, 2026 at 11:06 AM Johan Hovold <johan@kernel.org> wrote:

> > It seems all that is needed is to decouple the struct i2c_adapter from
> > the driver data and have core manage the lifetime of the former using
> > the reference count of the embedded struct device.

> This is a weird pattern you sometimes see where a driver allocates
> something and passes the ownership to the subsystem.

It's not weird at all, this is the standard way to handle this. We have
these things called reference counts for a reason.

> This often
> causes confusion among driver authors, who logically assume that if
> you allocate something, you are responsible for freeing it.Since this
> is C and not Rust (where such things are tracked by the compiler), I
> strongly believe we should strive to keep ownership consistent: the
> driver should free resources it allocated within the bounds of the
> lifetime of the device it controls. The subsystem should manage the
> data it allocated - in this case the i2c adapter struct device.

Drivers are responsible for dropping *their* reference, it doesn't mean
that the resource is necessarily freed immediately as someone else may
be holding a reference. Anyone surprised by this should not be doing
kernel development.

> I know there are a lot of places where this is done in the kernel but
> let's not introduce new ones. This is a bad pattern.

No, it's not. It's literally the standard way of doing this.

> But even if you decided this is the way to go, I fail to see how it
> would be easier than what I'm trying to do. You would have to modify
> *all* I2C bus drivers as opposed to only modifying those that access
> the underlying struct device. Or am I missing something?

Yes, you have to update the allocation and replace container_of() with
dev_get_drvdata() but it's a straight-forward transformation that brings
the i2c subsystem more in line with the driver model (unlike whatever it
is you're trying to do).

Johan

