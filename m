Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F72CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKb7tsSmZ0H6Wdl04tAiaIQVZQbhBUd7k5adJ7pyr5g=; b=LLTRX2GgN+7oXHmqbYMoQ4+OKI
	VQ/EPgOHVgXtEkcHbYKrBpwpxlRQPxk8iHRDQ26hhRRHuzfX850IQawmxMHjl87I3JrYrrNyRrJUV
	qEnfJQSvkoMNuLNP0PEopXrrwLn28r0YMxISX3TQ+N3OYFjXIGKNNPU5dG18P3Oqpuc/CJ2kxR1OC
	GdJyX6vqwhbuyAPTEX8s/uKYDKKPJgtn8CRhbjnzulfhLjlRmBebFKusFbdJ3hYZLGfZ41PRormem
	GpXAdUEOzXr5B4Hs640VSEKBCPdxql+KesyRXgL3ZlHSQg2eUFbYiA8EIoDDfg7/PId8quRllFzq2
	QYV9hDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15ja-0000000EF9F-3rLS;
	Tue, 23 Sep 2025 16:19:18 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15jY-0000000EF8q-0UN0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 16:19:17 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-795773ac2a2so53817426d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 09:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758644354; x=1759249154; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xKb7tsSmZ0H6Wdl04tAiaIQVZQbhBUd7k5adJ7pyr5g=;
        b=GhQ0aNQ3BK0beoGFF54fn3ZcRiV6pXo++veBYYRCEcz8JOrS9BUA52aRsiEL3D2Gik
         ZMFVAG2kNXHRpDN1nC72heAfqmNFKDkhzO9rOE1OJd4fwUjwd6A/sWy0p/xWhCYGpljC
         DfuS5X8NaRU1gLrTevEpNCEkyHluvf9/16RCWbWLqx707LeETABG06rM6pblwX9XrfXR
         qtNTh7RFj8RDPjKvjJ1qeBEKy0s5dnUHtAsj/oFA7V1kx7z3+3I4Fx/+jzxYv/a5e1ma
         aEp3vGTl5/HT+jFRLsOgRBJVIgP1Pby4bGDcQONAfKbGJdigGjy3PCvZwFIVM6zOBe4m
         2nUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758644354; x=1759249154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKb7tsSmZ0H6Wdl04tAiaIQVZQbhBUd7k5adJ7pyr5g=;
        b=iruhOcZn9eUXl5FAnWtNT1us/pcpOZr+B+ZbW2cYBNhOkE8mX4HGibN0DpGcTSQ9w7
         MVPpd5mfrSpdmQTap6MhIYG4XiVutedcSxdMh4nP0Jnj42W9E9PeQYr5HMoYfiXoVdTU
         DeiYlskEyifOwZMRXXVONyXyodiywVckEWJUB/G1oPgY9c+ODMEByYh5SMjRhxQUzsZm
         hkeI3X9CikrexJsVeg9fmCZENwEcSITiXjJ/lJV/VOpR9W2DarH/PvnIL6TkOtRP1tf3
         1yY/h7Y+MCtjgm0FPlauGf/sar4rF6Q8mWG91vFzVo4iARx2GMA5VeLsPLkr+ETWCPAU
         OiIA==
X-Forwarded-Encrypted: i=1; AJvYcCWCmWz28AeWKstF19J+nSQxQPRhxpF8ZCuYcz0YAnNTtJBAMnX7ihbbcTous2wCXYc8sBotg6VBmPWozPHqRw1K@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx2Oyjhit19Lbg112ZH8h0GvbvPfgwTrYkSbrJwxHIs93bh5Ww
	S6ykENNuEVUuM0tG1vNmzx29f4p2wAYk6m10LKAFeZPtY+IK9749h7DGW4b+I1VSuc8=
X-Gm-Gg: ASbGnctnvjPchUKB8NA3hR0NsfChj4zKKANWeBlG5UnDTW7Hw2iyf7KTruQsQFIqLie
	slyrvoJPJfmvFfnrjhrSp7NAw5ZtLlqR+jxsE7R7ghv8II61Pb+i23fbyLtxaiuAPWMioxBIOEd
	OHjSTtz9P/QaHva6sv2XejUkf0DeHcg4HSJ4HcvycVKwayHGmK77rLuzCL53//inbQvajlOqry2
	xb7otS+S3BDyNt9ONjkau6BUYtf/Pv4ETS4wft/3iBpk2SshSS67jT3U5e4PcphYzPAMdHz6xk2
	ffs1tyH+pU9SDealFmhfDO++xeiADHUNxU4lYOd19r2EJs45M1O/0R0OVIAt6Th14HQcRPB6
X-Google-Smtp-Source: AGHT+IFknn95PHhsPs7zw84kBzlaAQkMLHRCQnMY3jCMzKXPkKXu2wtZSYWkgGZ0B6Tp/B1GZcGGDg==
X-Received: by 2002:a05:620a:1a20:b0:827:e9b0:2752 with SMTP id af79cd13be357-851777634a2mr367039185a.80.1758644353963;
        Tue, 23 Sep 2025 09:19:13 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-852847b70f4sm117567585a.15.2025.09.23.09.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 09:19:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v15jU-0000000Axa9-0WlS;
	Tue, 23 Sep 2025 13:19:12 -0300
Date: Tue, 23 Sep 2025 13:19:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: Will Deacon <will@kernel.org>, thierry.reding@gmail.com,
	robin.murphy@arm.com, robh@kernel.org, joro@8bytes.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v4 3/4] arm-smmu: select suitable MSI IOVA
Message-ID: <20250923161912.GB2547959@ziepe.ca>
References: <20250909154600.910110-1-shyamsaini@linux.microsoft.com>
 <20250909154600.910110-4-shyamsaini@linux.microsoft.com>
 <aMw4I0AjKNPY6SOw@willie-the-truck>
 <20250918224322.GR1326709@ziepe.ca>
 <aM0HQ51DelZW_Rt8@willie-the-truck>
 <20250919120839.GV1326709@ziepe.ca>
 <20250923155647.GA22010@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923155647.GA22010@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_091916_231626_D59804C0 
X-CRM114-Status: GOOD (  30.52  )
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

On Tue, Sep 23, 2025 at 08:56:47AM -0700, Shyam Saini wrote:
> Hi Jason, Will,
> 
> On 19 Sep 2025 09:08, Jason Gunthorpe wrote:
> > On Fri, Sep 19, 2025 at 08:33:23AM +0100, Will Deacon wrote:
> > > pieces and will need to work on the userspace side. It's not like
> > > MSI_IOVA2 is magically going to work (and I bet it won't be tested).
> > 
> > It could, if someone checks the default memory map a second constant
> > could be selected that works.
> > 
> > > > Nicolin has some patches on the iommufd side to let userspace select
> > > > the MSI address instead, but they are not done yet.
> > > 
> > > Maybe we should just wait for that? Carrying a temporary hack with ABI
> > > implications to support broken hardware isn't particularly compelling
> > > to me.
> > 
> > This patch would still be needed for kernel users.
> > 
> > Arguably the kernel users should just be using the iova allocator from
> > dma-iommu.c. This whole hard coded constant/sneaky uapi is just a hack
> > to make vfio work..
> > 
> > So maybe if the single constant doesn't work we could set some
> > indication that the caller must allocate the MSI iova, the kernel can
> > use the dma-iommu allocator and VFIO can just refuse to use the device
> > for now.
> 
> So, are we settling on having two predefined MSI IOVA base constants,
> and if both of those conflict with reserved regions on a given platform,
> falling back to dynamic allocation via the IOVA allocator? Just checking
> if that's the consensus we're reaching.

I think Will is arguing against introducing a new constant..

Yesterday I was looking at the SW_MSI code again.. What specific
problem is it you have?

It looks to me like dma-iommu.c is already allocating MSI addresses
using its built in IOVA allocator. So if your DT is marking that space
reserved then it should Just Work right now as dma-iommu.c already
processes the reserved ranges and will allocate MSI addresses around
them?

The base value of the SW_MSI is only used by VFIO - are you trying to
use VFIO with this device, or have I misunderstood the dma-iommu.c
logic?

If it is only VFIO at issue then perhaps we should solve this by
completing the work Nicolin started to allow VFIO userspace to specify
the MSI Aperture?

Jason

