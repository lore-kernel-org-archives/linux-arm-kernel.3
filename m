Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6FBCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 13:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caLXAvpdnitODcaZa23G/qyjfJ3yi/42EdivUQYgIvU=; b=P72OluHMO0cQQrBfCIfohhdxII
	v6w7jD9UkSQXKAKPZtzS4dWqjGv/lSqgc/dSjKtvCJiE1I4AnbAbJ548+Y83qRwNl35zziQLWh7Hm
	t0Zyo07IatFKLBC7pWo/HcMZlCWczyJwXg3/f8/9XkjRF9kyXpuGWi5u3IIIV7av9iKhFPMrHqqcS
	4ecvWMfmLMZexHu0uGQYGNj2cNkUfcr+I3D1VpG3AIoR1M2dFGd+FRdXClKcqAAm8buRDG70yYrRB
	mYynY4nCAb/otWXcUhyLw7CNIbbS+644aIn02gSpGqK0rK4UOjkdfOv70bQyD4HMrut1u4hVS690T
	Sd+L/z2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQZl-0000000DiRB-0CZl;
	Mon, 11 May 2026 13:21:37 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQZg-0000000DiPF-1HBu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 13:21:35 +0000
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-90b2fcf90a0so120367785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 06:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778505690; x=1779110490; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=caLXAvpdnitODcaZa23G/qyjfJ3yi/42EdivUQYgIvU=;
        b=EuvCwD440ZvDLZXkvfLj5xMI0GRf2shNWGPpCQvg6gPEkKdMqfZ1Ytd7CDbzDifRd2
         MWPlskNyeY/4L6yllXjmO1oZTh7PQn9o04qdsasXSMax5gFg2KOWWXlvj9ljaYm5ik0/
         zI7LwY/p6FcCZd4/iYSv11TiGC2lj3zG7eSwjIZWNc4jAPdwDuba9xtKFA2PVUl1p6bg
         5QGdCxhVSxVYBopx3Fcc2r/pDhsMu1G0l24Zivymemyc++utKyq4x1jtU2G0DnDU+KVt
         g8stLVxvpFIgdm/vmE/SH8agL6ygE3qUbmMi4xdguC8+17F++i89VVc6/12XefYKsvp7
         tvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505690; x=1779110490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caLXAvpdnitODcaZa23G/qyjfJ3yi/42EdivUQYgIvU=;
        b=JY4rT3e4IrLfn4evW4EFFytgfNfy1WdIR1WBdmcHOsX0Aw3Gp3rCYcqafv49k6fnqB
         nzECgL7Hr9gR5kTJFGo1QmNSR6Ys0ZAVUZbvwUOnAI7O2W5CUWiTlMaDFKJsSKwfy33u
         y7m7VuKUEfPNqV0vgSTly3UCRTvuRu0EStnrV+LO6uWJ7PwMELG+F5Ef3fTLIdyUb0Pn
         iYZy+Xr5zfJNC6DBdLQ4j3A42nBn9KKYsAcqdrrS1E9CJ4khpDDfmLxyCu5oWyhiVpxL
         GLNJGZijnBOtsxRFEo44JSWO9VHhdFi8ncQyhnfwyhxOJkqG2IKXFmyLKbxLUCaKac+V
         Xj7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/j4G24xtMIvdaNG1rjzBh6hr8i9iAVNKRF1j6yd25frV+Bjfq87VH0KEPyOMopMZICKTRT/+qGoXrJMzqwRtAx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8D4Ypql2SR+LQ4dDxGnhVusnQDKCK01mH+38Ms9FW5RWIuwM2
	XpLiYcSankgds4zgJl2iEq3HvCRmWbzvpcIit3LSMFKqCKcIX3jygzvtHedpxhstpTc=
X-Gm-Gg: Acq92OEzC7s4NRobxzIFTLqc1GWevoc0B75/h7zIo8ccIxLXlKK2RVOaD2/+EkJU9nw
	7EDYZMw6ZFNoUXFSwlnpUqCZPKYhb5puTfgVbxwDSL3mOLEcikfZIppe4pCn/MltAf/lzCeVQRS
	1icofrrrFr0FqH5dcMQ503P06MVn0qYo1vBrihjQuWc8qs9P5wqFnLEgEfSxIbYB4/oCYHhZN9d
	rePDFslk9j9aZVhudmZhgHDCt7GRtNE6u10/LcIQ0PUBF+0kNisOvFAHYFH/m3lGKhxkrr4Pb4J
	D+FCKhFcE1EzzkM92oe5Tq1BGoETGzmp5v51yN69fhERKbXkKwo8UMqa1H/pasJtaNVvHN8jrtB
	Sv8vbHvyU7vUKUMdnUczdHVimTMq3/Tsdln019O5zwXRxRokURcTDUpkq7ztxyRzA0WbuKIenHr
	yyYBlk2QISkShTwkbjLKELz8zoDFaXFkUjFc/8zUfV9EbsMkER8hZ+QT6O81XGM2C2ceixjhGe9
	TfSIg==
X-Received: by 2002:a05:620a:4494:b0:8d8:ed00:5a91 with SMTP id af79cd13be357-90653151c6emr2455764285a.22.1778505689836;
        Mon, 11 May 2026 06:21:29 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8e9b24asm1066226385a.18.2026.05.11.06.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:21:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wMQZc-00000004njt-1WnC;
	Mon, 11 May 2026 10:21:28 -0300
Date: Mon, 11 May 2026 10:21:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Joonwon Kang <joonwonkang@google.com>, Alexander.Grest@microsoft.com,
	amhetre@nvidia.com, baolu.lu@linux.intel.com, iommu@lists.linux.dev,
	joro@8bytes.org, jpb@kernel.org, kees@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nicolinc@nvidia.com, praan@google.com, smostafa@google.com,
	will@kernel.org, jacob.jun.pan@linux.intel.com,
	easwar.hariharan@linux.microsoft.com, kevin.tian@intel.com
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
Message-ID: <20260511132128.GM9285@ziepe.ca>
References: <20260424133953.GY3611611@ziepe.ca>
 <20260507095851.3220765-1-joonwonkang@google.com>
 <20260509171013.GF9285@ziepe.ca>
 <30eefd04-1d0f-45d8-b55d-e3e8d41a57ef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30eefd04-1d0f-45d8-b55d-e3e8d41a57ef@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_062132_690980_9EC8C759 
X-CRM114-Status: GOOD (  32.29  )
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

On Mon, May 11, 2026 at 01:39:06PM +0100, Robin Murphy wrote:
> On 2026-05-09 6:10 pm, Jason Gunthorpe wrote:
> > On Thu, May 07, 2026 at 09:58:51AM +0000, Joonwon Kang wrote:
> > 
> > > By "similar instruction" on ARM, I guess you mean ST64BV0, which fetches
> > > the bottom 32 bits data from ACCDATA_EL1. Please let me know if you meant
> > > others as it will matter. If ST64BV0 is supported on ARM, however, it
> > > would mean that ST64B and ST64BV are also supported already according to
> > > the ID_AA64ISAR1_EL1's LS64 field. The latter 2 instructions are just to
> > > atomically store whatever user wants to a memory location without
> > > referring to ACCDATA_EL1 and all the 3 instructions can be run at EL0. So,
> > > the userspace driver would have enough capability to designate arbitrary
> > > PASID as it wants via the latter 2 instructions when communicating with
> > > multiple devices.
> > 
> > IDK exactly what ARM did. IIRC on Intel ENQCMD forms a special
> > non-posted write TLP and the device can tell the TLP came from ENQCMD
> > and so it trusts the encoded PASID. ARM has to have done the same
> > thing - allowing anyone to forge the PASID by using a different
> > instruction misses the point of the Intel design.
> 
> Yes, ACCDATA_EL1 is a privileged register neither writeable nor readable by
> userspace[1], so it should be functionally equivalent from an SVA point of
> view.

There is a bit more going on though, I think that is what Joonwon is
mentioning by asking about ST64B and ST64BV. I *think* the answer is:

- ST64B uses a posted write
- ST64BV can be restricted so EL0 cannot execute it, it uses a
  non-posted write (AI tells me via EnASR)
- ST64BV0 can be used by EL0, always uses a non-posted write, and always
  uses ACCDATA_EL1

Which is similar to Intel. The device only processes the PASID from a
non-posted write, and the CPU prevents userspace from forming
non-posted writes except through ST64BV0

> > Honestly, I'm not sure why they even implemented it. SMMUv3 can't do
> > the translation scheme required to use ENQCMD from a VM anyhow, so it
> > is pretty useless.
> 
> Not sure what you mean there - indeed you can't do the SIOV thing of
> assigning individual ADIs to _different_ VMs, but there's still no reason
> you couldn't give the whole accelerator device to one VM, and run the "full"
> kernel driver in that VM to hand out ADIs to processes, same as for
> non-virtualised ST64BV0/ENQCMD usage. It's entirely usable, just not so
> "scalable".

Well yes, technically, but I'm not sure this is attractive in
practice.

The value of ENQCMD on Intel was it can eliminate any HW side
per-context state for simple HW like DMA engines, including for
virtualization.

You pay for that value with some performance loss, but it can be
attractive because of the universal scalability.

However complex devices don't seem to want to use it, once you have to
have per-context state for any other reason the performance downsides
of ENQCMD make it unappealing.

So, IDK, maybe some embedded on-chip device will find a way to make
good use of it, but also I'm not aware of any adoption on x86..

Jason

