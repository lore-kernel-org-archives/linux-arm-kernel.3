Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7CACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0zdi/e3l+wKGFxp1TktMR4vbugjI/Nwa6alnPNxTnY=; b=QpnpUkSurtkkvZr5rYY7am3mzI
	zRrNML80fYic3Q40ApR4RPvLFhzkQJr5pVmXUDVI1yNPezde9QcPLXhJxfoisw8kti9G4Kq+J4o+B
	V4tmqNhk9R5+Y93whK37UPCVUwbok2FYr+nKiX2ngBs1xPE6AMvnzVx+xAP0dKdCQ3WqXgG4ZtoNq
	iZlAnxOekcSbHnuIC5L3HV2xcVd1dOMk8P5uVOJRG0xELo3MSUm8GBdon66aKyM2lPYrKC10tYxx6
	IHRKFPuDBM6//640PnfI3qq3p+MzwEa9i4fY3CCsT9gyxWudlF51F1D4SZSaWZ2vaBVFfXvaQbApF
	5BeJK0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjrf-0000000GLEQ-2SBr;
	Tue, 12 May 2026 09:57:23 +0000
Received: from mail-pl1-f201.google.com ([209.85.214.201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjra-0000000GL3p-03tC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:57:19 +0000
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bc763c7256so66690705ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 02:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778579836; x=1779184636; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0zdi/e3l+wKGFxp1TktMR4vbugjI/Nwa6alnPNxTnY=;
        b=m6qvBqlqW2xkLkBfYof9uw5PovXpwB8v7sNEByRjVeIL0TeiPXvIfUvLEDDcP89AVW
         ctvAMBRLVWC07U5Y3esN44G2OSID5mBZN26RRpXbjJVnoo4pzXzHnfCTsnL1D250N+Vb
         EcBWlN0ZZsvyUsUERDWL//EAtDgvHECtO2k9LRpU63r06d3c9qlr9dd48pvEPTycEPl7
         wEQkPU9x3+UyBEbvd06jT73o0RSrDuiTzOp8dfhqpiTIyqlLqumgKZXdELOU+BhRwLJI
         Bh4ZttSaePuNMR7tXb688WQ+2kdgbSRr8koG0xe00rBSDYfSQ8TDrjMSjQPa2t5cd96O
         Rsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778579836; x=1779184636;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0zdi/e3l+wKGFxp1TktMR4vbugjI/Nwa6alnPNxTnY=;
        b=gjBzEoLXLwO6BdaxOGl5ud/OBiJ0rIu8Vav5rzkfOJUTCdnUc/BufTi3TT63P6Xdwe
         c/qAmF0X8RKvz8CGpeGH9iF9xwffXmN6BsbibtdGIoJtEiDhWKu5v8KqU6n6rn7kGMgm
         hMQw0KNaiw4w4PXaAn6TWKxuNlenuEgDD0BLzyB+yJJvbr6btX0DGa53B7R/9Keh+eOg
         5N81UKhNeod4+uV/l05HZ6VqtnEpleFZ6B2DtZnZrPJ6FX8fUt5I89JmI6OEZ9vThjUR
         nkbp3gc6rCeIBXQwO7SIY7/AAcwb8G6HlZwvQ4cQ9p5YGw1MNaG1Q/Ejgyx2s3oC8q1A
         4G+g==
X-Forwarded-Encrypted: i=1; AFNElJ+fKpWbUHWANgZ+cnceAO3H6z1ymvQViHwOIXbzmRZbE+MbjzBTW5jNJXlbn1LObAASVL1QwPlxRN0QBcfRNdCL@lists.infradead.org
X-Gm-Message-State: AOJu0YybPM94I8m/s3TJVqSvOD7fydoDzab4NzpPyXnWVhQ/fhTySP06
	f36p3SYcqBhtvGL1yWSgHFlOM0Q3egVVCQ35pCEIB4/oAOU/Ys7vy/sOmt3mneFAqeJQepc3BZn
	pzK9zTR6IKNFxFFgVLbDe2DvtPw==
X-Received: from plsr2.prod.google.com ([2002:a17:902:be02:b0:2b2:48d8:c695])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e552:b0:2b2:5840:809c with SMTP id d9443c01a7336-2bc7a97bd6bmr157227255ad.1.1778579835925;
 Tue, 12 May 2026 02:57:15 -0700 (PDT)
Date: Tue, 12 May 2026 09:57:14 +0000
In-Reply-To: <20260511132128.GM9285@ziepe.ca>
Mime-Version: 1.0
References: <20260511132128.GM9285@ziepe.ca>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260512095714.2518097-1-joonwonkang@google.com>
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: jgg@ziepe.ca, robin.murphy@arm.com
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com, 
	baolu.lu@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, joonwonkang@google.com, 
	joro@8bytes.org, jpb@kernel.org, kees@kernel.org, kevin.tian@intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nicolinc@nvidia.com, praan@google.com, smostafa@google.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_025718_085747_E0060296 
X-CRM114-Status: GOOD (  32.79  )
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

Hi Jason and Robin, thanks a lot for sharing your insights! Could you help
to answer the further questions below? or just let me know if it is better
to use other channels for them like ARM support.

> On Mon, May 11, 2026 at 01:39:06PM +0100, Robin Murphy wrote:
> > On 2026-05-09 6:10 pm, Jason Gunthorpe wrote:
> > > On Thu, May 07, 2026 at 09:58:51AM +0000, Joonwon Kang wrote:
> > > 
> > > > By "similar instruction" on ARM, I guess you mean ST64BV0, which fetches
> > > > the bottom 32 bits data from ACCDATA_EL1. Please let me know if you meant
> > > > others as it will matter. If ST64BV0 is supported on ARM, however, it
> > > > would mean that ST64B and ST64BV are also supported already according to
> > > > the ID_AA64ISAR1_EL1's LS64 field. The latter 2 instructions are just to
> > > > atomically store whatever user wants to a memory location without
> > > > referring to ACCDATA_EL1 and all the 3 instructions can be run at EL0. So,
> > > > the userspace driver would have enough capability to designate arbitrary
> > > > PASID as it wants via the latter 2 instructions when communicating with
> > > > multiple devices.
> > > 
> > > IDK exactly what ARM did. IIRC on Intel ENQCMD forms a special
> > > non-posted write TLP and the device can tell the TLP came from ENQCMD
> > > and so it trusts the encoded PASID. ARM has to have done the same
> > > thing - allowing anyone to forge the PASID by using a different
> > > instruction misses the point of the Intel design.
> > 
> > Yes, ACCDATA_EL1 is a privileged register neither writeable nor readable by
> > userspace[1], so it should be functionally equivalent from an SVA point of
> > view.
> 
> There is a bit more going on though, I think that is what Joonwon is
> mentioning by asking about ST64B and ST64BV. I *think* the answer is:
> 
> - ST64B uses a posted write
> - ST64BV can be restricted so EL0 cannot execute it, it uses a
>   non-posted write (AI tells me via EnASR)
> - ST64BV0 can be used by EL0, always uses a non-posted write, and always
>   uses ACCDATA_EL1
> 
> Which is similar to Intel.

Ah, I missed that ST64BV is currently being trapped to EL1 while ST64B is
not [1]. However, I am not sure if the trap is to disallow EL0 to use it.
Can it be instead to pass the response value of the non-posted write to
EL0 while using the EL0-given PASID as-is? If so, I believe EL0 still can
specify arbitrary PASID as it wants via ST64BV.

Since I guess ST64B* instructions are to serve generic purposes not only
for communication with accelerators with SIOV but also with any memory
location or device without SIOV, I am not sure if it is always okay to
make those instructions work the way Jason mentioned.

> The device only processes the PASID from a non-posted write,
> 

Regarding ST64B, are the ARM devices behind ARM SMMU v3 supposed to work
this way too? If not, EL0 can specify arbitrary PASID via ST64B with the
kernel today [1].

[1] https://github.com/torvalds/linux/blob/50897c955902c93ae71c38698abb910525ebdc89/arch/arm64/kernel/cpufeature.c#L3166-L3181

Thanks,
Joonwon Kang

