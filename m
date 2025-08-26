Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0214CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFuBdDpmjTxJPIC+jvTVeeAVDsVAAyhX1fX5Qkry/n4=; b=vNLYKhjKLrW5eLw/7zmux25c/3
	n6sXU8bTnOZ+88/xYM79wI22VK//YIY6OQEGp4F0VnY/HNsZaXeCGbstTXMAVnp0Q7SAY20zVoLTX
	r5LzWz4MXDlJd9DYVAMtRyfbVA/J2Wdt3JKUem2wAESIv5Kr4ynP6Kf4ARlPXqoDfikWmTsD38unN
	rGjwwghx8wjdykIRhk9BNo7wbB3JfH2jDH6usljhFXXDSSZ3U/NfMT1CPQRm3fKN8nCNtT+JZnwqv
	2WQecJFAoUtMtktjBKx78ockNrN0FyhxD7XuZUyCvFO36cTRjANwgCkPT2LqLEPIlPEIf7fSXB+AV
	wO3u8ukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqt0F-0000000ByYd-2XY3;
	Tue, 26 Aug 2025 12:42:19 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsv1-0000000Bxn7-3TaD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 12:36:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso4800426b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 05:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1756211815; x=1756816615; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mFuBdDpmjTxJPIC+jvTVeeAVDsVAAyhX1fX5Qkry/n4=;
        b=TzwIn4qPjZm1ySVQJbNKsPe4n1lnWa2IU7r9GzRuuvaqfcEBaJv73wyTA3AHAnxNIH
         L8nvBNcbSL+ZG4SN2W9Q7G45FmBLThUJuKrNsWdnRcrOzoJj5qam4AYspO4gWXV69uPk
         kTGIP4dll7+vcUOrPBizYcM5AGGhQMgZvbYdeQ6dDLh4rwkzb7ibNEkbcMrUUxwausQ7
         TbJLkyZwKSyJWMJxuoe8QZ3MU6HJbJ6XKlKENIcKhcB6rA6KaW3QSLx4P5x30Zyo6U5N
         JvMustyJhci3aMkd08a2mJLHcG4EdhrGubgGbTneoKwuZmEjlMlYuErAe5Rrz/oNuPiP
         8iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756211815; x=1756816615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFuBdDpmjTxJPIC+jvTVeeAVDsVAAyhX1fX5Qkry/n4=;
        b=XW7mRprX5N7KdVJqIIwbN01Db3+Vub0LeDvYHm3iWuo9+Yrj0SCsyN8oUmk+Oyb9gk
         9fbgZ2lnFfTWCmg/FWjBXaIcBUbfVL0b6jPVqC4Di1l46TnVc6Echy+vx5kp2oNc5IXl
         1vBclVgFkejqda1W1EsUMqJGmUZ0cgZxORZfGsmxtcleF7Sar2XqbhykqrR3HoM7HMb9
         jwc75T01/IjI00n15lOKhr+78EgezgvMKR6hnaYptK9RVGaVMhZNUYHam89ULhXh7B/S
         kwmK3/4gtHhZfRApJY04rluHGPE1r6rPL8Otntt6FYUsl4tgMudXS5EbIJhjpWB/T11E
         IOIA==
X-Forwarded-Encrypted: i=1; AJvYcCVtFBNnhpwJ8hZAx1A2QJebeQ0QrHVi/j6yPzqFU4SVQpq8Z70NkuBTYsg/SovJ5hubKWVLzHFpOSxHtIB4MOU9@lists.infradead.org
X-Gm-Message-State: AOJu0YynOmnupfwJwtRMEE/Sbcw19JAzIdNgQKI5dX5IUM/naPQb3ybD
	yXRbITAt2cylXnYEZr7odiojzaCeK1Yu5hZZbOgwZTNQYsJQNZF2pqfxYyIEN3H7J+w=
X-Gm-Gg: ASbGncvQ8Q43S4QfJsAkrYr7jKqvLrveaeJoD5hSI67PE8LbMmkFmrdAhJaaBPGccdt
	DQ7IQ18HXcAy1z5tH/E+II8/BEPa64J6YP8R5bft3M/qYJ7lcwMLqE/zI+QhOrVarf9EC0/f+fl
	Lh7ow6osz7MI+ZwwGXZft6xc8uKP0RWx9eR4ctqOyKjkZLkAaIBs9NTMOaNbdEw0x17o1KMmEup
	v3d1hC7TPO8uG9wCzzX5I8ZBXRKqZDpIDdG0XyEioxcm8l47lJy5Z4x7etxO1Ic4DRCh/8AvJdN
	Wfm4e+jcroN8k1hXe0pW3UrSrXdfH//zwkcLFnkTYLk0cvyZ4k7oyzN4S49nJ1E8dgwMDdzXnCp
	cnCGFuuM=
X-Google-Smtp-Source: AGHT+IHTh1g6nVXxG5B7xS4T7Fnw4NLjAQ3OfTl5DHXo//wtjXBmCj82vaaqojPvv0EPFyup1w2yOw==
X-Received: by 2002:a05:6a20:1588:b0:204:432e:5fa4 with SMTP id adf61e73a8af0-24340b5b6ddmr22663293637.23.1756211815043;
        Tue, 26 Aug 2025 05:36:55 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3275933d6a2sm567538a91.23.2025.08.26.05.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 05:36:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uqsuz-00000008tQD-0mP5;
	Tue, 26 Aug 2025 09:36:53 -0300
Date: Tue, 26 Aug 2025 09:36:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	will@kernel.org, jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
	bboscaccy@linux.microsoft.com, robh@kernel.org,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v3 2/3] iommu/of: fix device tree configuration for PCI
 devices
Message-ID: <20250826123653.GC1899851@ziepe.ca>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
 <20250806215539.1240561-3-shyamsaini@linux.microsoft.com>
 <20250808121515.GE377696@ziepe.ca>
 <20250814233018.GA31418@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250815003958.GE599331@ziepe.ca>
 <20250815023236.GA30997@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250818155310.GG599331@ziepe.ca>
 <20250826011557.GA2980@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250826011557.GA2980@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_053656_042847_46E068B6 
X-CRM114-Status: GOOD (  22.13  )
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

On Mon, Aug 25, 2025 at 06:15:57PM -0700, Shyam Saini wrote:
> Hi Jason,
> 
> On Mon, Aug 18, 2025 at 12:53:10PM -0300, Jason Gunthorpe wrote:
> > On Thu, Aug 14, 2025 at 07:32:36PM -0700, Shyam Saini wrote:
> > > On Thu, Aug 14, 2025 at 09:39:58PM -0300, Jason Gunthorpe wrote:
> > > > On Thu, Aug 14, 2025 at 04:30:18PM -0700, Shyam Saini wrote:
> > > > > or were you referring to [2]?
> > > > > 
> > > > > In that case, the PCI child node data needs to be parsed, which is
> > > > > currently handled individually by each host controller driver.
> > > > 
> > > > Yes, this looks like it may be what I was thinking of, the pci@1,0
> > > > specifes the BDF effectively
> > > 
> > > In that case, we'll need to parse the child DTS nodes properly
> > > within of_iommu_get_resv_regions(). I'll include this in v4.
> > 
> > Kinda surprised this isn't happening already? It would be good to
> > refer to the original specs and describe how whatetever you propose is
> > aligned there.
> 
> Just to confirm, does the v3 version of this series look good to you?
> If so, I’ll go ahead and respin the series with the iommu_set_sw_msi()
> change and address the other review comments from Jacob.
> 
> Otherwise having pci devices nodes in the fdt or dts needs additional
> handling, let me know your preference :)

I think you need to consult with the DT/OF owners on these questions..

I've forgotton so many of the details here.

But once you settle on whatever the DT representation is it looks like
the right direction to me.

Jason

