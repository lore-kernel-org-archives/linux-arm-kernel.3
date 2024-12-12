Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC060E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hy0FJmP1scr3YXKjWy7pC47vhC+tonuXU/mntLgwnb4=; b=ajkBM52ogICGPI8KqKY+kZxA55
	eTFByb97XE0bNwD2WzUXpqJVzWw9vEg3SKEbJ/Zh82ndp547ez4Tmp96M3RdEvqZDNcxFInkeptwy
	l1xEucA9Pee1Z4Ux06rJfj9QH7QvMGU63C5EzjsDNemDxC+9NnsDNz+FRFR7SQjBYjiVjUf/Wa2mQ
	iJYvHbhr/8pudEawJe8GtXNFyOvRUcYKHr5L/Woyab2AzvaVbB6dkCeIDna3iT60l7OTR73uI/RuJ
	pO4WAoMsLHwL98DEGfeXWaHfLH/iPkI937RoUFC09xeocmFBWKCMYUmN1DS2bMorhOkb5SSg/lnay
	PxdA6geA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlnB-00000000uTL-4Avt;
	Thu, 12 Dec 2024 16:11:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlXS-00000000qDW-0SHn;
	Thu, 12 Dec 2024 15:55:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC3BDA42910;
	Thu, 12 Dec 2024 15:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9073DC4CED3;
	Thu, 12 Dec 2024 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734018940;
	bh=PKNBf0TCKuwNcifWvhSa7hUFVANZKsYx7vGJQEMnWHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JbTyuEFzQhdRJOmDrKJyk9vWtv59qHQf6NV5vzbP3QL+w07scAiTpND/D+fCd5C8M
	 HGFo7Zr4lA5KuhQLh7wMkG5WWx5Kwal2PKprL1LophqlY/WN+VyLBpsZN7PTE0uCjd
	 XCQ0F8h0QOZONPX2obr7xgnwPTHDCgpgZWYhjXMhHfrPQXzgzL7yfoJDVJvO65o1bq
	 w/zHPnbEtKLRQh0t0kyUZvpJsBX6ZnpdESQlKb/vt8tTSwZJc/KFJ6+Q+rhQJ5VEUp
	 PKEBQhBU2DPnV/ofyaUbQV54Hzth2cvwnkNcKOatzAiuYps8eAMqojXzk68jfIL7aF
	 PBNJQBAh1PLCA==
Date: Thu, 12 Dec 2024 15:55:33 +0000
From: Lee Jones <lee@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, jic23@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, linux@roeck-us.net,
	srinivas.pandruvada@linux.intel.com, bentiss@kernel.org,
	dmitry.torokhov@gmail.com, pavel@ucw.cz, ukleinek@debian.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v9 1/9] HID: hid-sensor-hub: don't use stale
 platform-data on remove
Message-ID: <20241212155533.GG7139@google.com>
References: <20241107114712.538976-1-heiko@sntech.de>
 <20241211120844.GD7139@google.com>
 <n914pn7o-pr9n-5ss0-p744-73402nnn843p@xreary.bet>
 <3196449.TQGk6oTFT5@diego>
 <4s41717n-3888-os6o-384n-7678n0361r0s@xreary.bet>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4s41717n-3888-os6o-384n-7678n0361r0s@xreary.bet>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_075542_212474_0CB1002A 
X-CRM114-Status: GOOD (  20.65  )
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

On Wed, 11 Dec 2024, Jiri Kosina wrote:

> On Wed, 11 Dec 2024, Heiko Stübner wrote:
> 
> > > > > > > This change was more or less a surprise find, because I wanted to make
> > > > > > > the platform_data pointer in the mfd_cell struct const and this the hid
> > > > > > > sensor hub stood out as doing something strange ;-) .
> > > > > > > 
> > > > > > > So patch 2 of this series actually depends on this change to not cause
> > > > > > > build errors.
> > > > > > 
> > > > > > Ah, right.
> > > > > > 
> > > > > > > But seeing that we're after -rc6 alredy, I would assume the brunt of the 
> > > > > > > mcu series might need to wait after 6.13-rc1 anyway - but I guess that 
> > > > > > > depends on how Lee sees things ;-) .
> > > > > > 
> > > > > > OK, I am keeping my hands off it for the time being.
> > > > > 
> > > > > I can take it now with an Ack.
> > > > 
> > > > Looking to apply this set now.
> > > > 
> > > > Ack please.
> > > 
> > > I'd preferer if Srinivas could ack this as the more specific maintainer. 
> > > Srinivas, please? 
> > 
> > The patch already includes the
> >    Ack from Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > from a previous version, so I guess it should be ok already?
> 
> Ah, I missed that, indeed, sorry for the noise.
> 
> With that
> 
> 	Acked-by: Jiri Kosina <jkosina@suse.com>
> 
> and Lee, please feel free to take it.

Thanks, will do.

-- 
Lee Jones [李琼斯]

