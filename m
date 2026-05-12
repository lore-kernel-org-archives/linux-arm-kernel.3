Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52763CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxuiWLL/PSSpmcGZYa/jLPGBLLlN9600U6sYLEUkki8=; b=XaHQpWjp+QUzM5JN7HTwy3flc9
	GOIrne3gWdadqBrkxv8V9WMqt/lqzyThq2NKXWrPT+3gxVCdjmaOPk4EFPIqNVHrynykxRyzeQp34
	QGDGMw3SttgHalqQKiXk6xziQ5pBwk85yqipm1bAlehi7XtUbeo/cCLFY2ZCXuBFcj4buIkhd/jPJ
	xMLRSX3iAmT1NHt66jRT8E6wYGQjO0CD9a3LxL0hlOps2hgmmpH/N6y+gXKgmHCRj5myaDSaEHNRk
	F8Ki61BwpHkCYondS7/h/h4xw+uru93PjQ49DE5893cuouRRxgVfN28VS0cNv0LMsh7MAqvahwboa
	JpGs+A2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoSX-0000000H6ZL-1LEu;
	Tue, 12 May 2026 14:51:45 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoST-0000000H6YH-35wy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:51:43 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2ba86e35aa1so87139335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778597500; x=1779202300; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxuiWLL/PSSpmcGZYa/jLPGBLLlN9600U6sYLEUkki8=;
        b=AdBVOXJOYJOJjqmtMKERxsYc0yreQL4vZgQXODBIy7n9JoBlXC7SsHfmc/okSp1juc
         ++25XSLBNonCY/+18VTnMxirkBvdLFqljoAdMwS3bEMy0HZU+5yKFyuzE0P0b8Q60ReD
         eaj9QR1T4KmiPiWz7n30o1lqeo9eE2LDcAfM7CePNVwst71Ao1Iz0zvAJoonG60nsi3C
         ITetgA1MfEWFAzZFi5EmuS6kCwuVg7tBZ94cgvffKJm1wmnSuLHH1Get+l+Hf826ovMh
         wlBHLS+lZESIOgrFLnEig1ErTWIUEReRTC5aQG1ShwKCbWk7K8KoK0OYgR65cJp+H4OV
         xDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597500; x=1779202300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxuiWLL/PSSpmcGZYa/jLPGBLLlN9600U6sYLEUkki8=;
        b=f1wu4UTBYidBwKuy0mKV1T6hQGaASz2/lVS1XU7aa7sz7VVfjk8bNULVfGjfI1YO0c
         XSNoAbehCPcQC16RvIc181soGQze1lxo1m5gv5Cu/hPUF5lXNwoqjvtTDDn7d5vETJSW
         HLUL2tjP9VwLIGwBMzcCu6fUje9T2HWB7jbhdclu/cG/Ht3Vm4+AhAU+B5cyq6yOi2ly
         Tbv1tOdlz9ptehW4fBrx9wlBJgQiiNFgKqqxjJoGOpPQYbCpwgRyhPRz6cy3usHuXTpa
         0gpS+d+kPr3uKy13KybcGt7TDh13ug5LoGUX/+S0GtLVfB0n4PXt1FT3Bl6u2kDuOTTE
         RO7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+KYfeXwwe40ijP+W+vAeOtL4glRWKvP0V5gBl6C+4Q+u03jp5WRH1a+1jZCkXy58RpbGZY9+J+4I1Y31t34HSE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyj9q3uaJAMI0AU5sOWptyjt8pNtqLoLsM2AI34aDMnzUhupA8
	kG5JZxvdsk93erDiNpuBXM4VlWQzFcoqSOIfShCHUhYmrE1fluN6yejpfOq2l5fXl1jS8hJHY0t
	MAZ9UOS18mKkstsbn3xA7LePQjQ==
X-Received: from plhs10.prod.google.com ([2002:a17:903:320a:b0:2bc:bb08:92dc])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:847:b0:2ba:fed:7891 with SMTP id d9443c01a7336-2bd01301994mr22890545ad.30.1778597499958;
 Tue, 12 May 2026 07:51:39 -0700 (PDT)
Date: Tue, 12 May 2026 14:51:38 +0000
In-Reply-To: <b95b42c6-4d10-4701-88e2-9991f3773e6a@arm.com>
Mime-Version: 1.0
References: <b95b42c6-4d10-4701-88e2-9991f3773e6a@arm.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260512145138.3414002-1-joonwonkang@google.com>
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: robin.murphy@arm.com
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com, 
	baolu.lu@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, jgg@ziepe.ca, 
	joonwonkang@google.com, joro@8bytes.org, jpb@kernel.org, kees@kernel.org, 
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nicolinc@nvidia.com, praan@google.com, 
	smostafa@google.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_075141_777422_042B2383 
X-CRM114-Status: GOOD (  32.93  )
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

> On 12/05/2026 1:40 pm, Jason Gunthorpe wrote:
> > On Tue, May 12, 2026 at 09:57:14AM +0000, Joonwon Kang wrote:
> >>> There is a bit more going on though, I think that is what Joonwon is
> >>> mentioning by asking about ST64B and ST64BV. I *think* the answer is:
> >>>
> >>> - ST64B uses a posted write
> >>> - ST64BV can be restricted so EL0 cannot execute it, it uses a
> >>>    non-posted write (AI tells me via EnASR)
> >>> - ST64BV0 can be used by EL0, always uses a non-posted write, and always
> >>>    uses ACCDATA_EL1
> >>>
> >>> Which is similar to Intel.
> >>
> >> Ah, I missed that ST64BV is currently being trapped to EL1 while ST64B is
> >> not [1]. However, I am not sure if the trap is to disallow EL0 to use it.
> >> Can it be instead to pass the response value of the non-posted write to
> >> EL0 while using the EL0-given PASID as-is? If so, I believe EL0 still can
> >> specify arbitrary PASID as it wants via ST64BV.
> > 
> > I think if an OS implements things this way it is would security
> > broken as far as ENQCMD compatible HW goes.
> 
> Yes, I think it's rather the point that the EnALS/EnASR traps to EL1 
> allow EL1 to sanitise the data that ST64B/ST64BV are sending, and do 
> exactly things like substituting a valid PASID. ST64BV0 offers a way of 
> doing so _without_ needing the overhead of trapping, but conversely that 
> needs the EnAS0 opt-in all the way down to indicate both EL1's awareness 
> of programming ACCDATA_EL1 appropriately and EL2/3's awareness of 
> context-switching it.
> 
> I've not looked closely at what exactly the arm64 arch code is doing 
> today and how well it actually fits the expected ENQCMD usage model, but 
> I can well believe it might need a bit of tweaking.
> 
> Thanks,
> Robin.
> 
> >> Since I guess ST64B* instructions are to serve generic purposes not only
> >> for communication with accelerators with SIOV but also with any memory
> >> location or device without SIOV, I am not sure if it is always okay to
> >> make those instructions work the way Jason mentioned.
> > 
> > The end point has to use the posted vs non-posted write distinction
> > for security.
> > 
> >>> The device only processes the PASID from a non-posted write,
> >>
> >> Regarding ST64B, are the ARM devices behind ARM SMMU v3 supposed to work
> >> this way too? If not, EL0 can specify arbitrary PASID via ST64B with the
> >> kernel today [1].
> > 
> > If you want ENQCMD compatible semantics then yes you have to do all of
> > these things, it is part of the security design.
> > 
> > Jason

Appreciate all your clarifications here. So, my understanding is that if
our system does not support ST64BV and ST64BV0 or if our device does not
distinguish between the posted write and the non-posted write regarding
PASID, then we can lift the use of the global PASID space. Can I say this?

If yes, I will create a new patch which checks for that case. It might as
well add a new device tree property to represent if the device supports
the posted write vs. non-posted write distinction.

Thanks,
Joonwon Kang

