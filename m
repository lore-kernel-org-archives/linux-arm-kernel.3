Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B23C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhJ2H3i1H9QEiQuSDT43T4jVhzfFSUOLYdmYxqiqeBg=; b=sP9vr0o/7Z7xBxYA3l06L53WCR
	wqqEg7xAkLIt18YZquZbxGNR0EY5IiEIMRP9wrCcQ7T9+iMJ5IefmTyrNFuqM/aps5+HHlOMQVR2e
	BWOzEO/l/RF5Z16cVshQpN+S57m4ehNg04cCGbSA/woJmrjxqC4hWFAMbh38pFZaJ3k3ngngz3vwd
	6O/y7omLu9of5vBgjz77tkf7ytOBfXszQnqHNRp6At2kcM5bfF6fH1NcaomCN+l3694W8bMO9fxzV
	CVx8iLhx+CndhhAI+HxELeo4v5JG221Osd1qd6NuxP6mUpz/hHyc/ZIj1mdcKDFykMLFE+2Ncc59T
	lFdhlRvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ljE-00000009uJ5-2XVi;
	Tue, 29 Apr 2025 14:14:32 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lTx-00000009puA-11em
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:58:46 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3d81cba18e1so51246455ab.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 06:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745935124; x=1746539924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhJ2H3i1H9QEiQuSDT43T4jVhzfFSUOLYdmYxqiqeBg=;
        b=Fd4wE1Fjwa0DKFtwYymXxfNOximEIS1ShZ0QE9VJPUNSTe4oZRFaDgpT2BiCAD0vJr
         BsiJxg5zsGLfFccTwh+OJpdLP316HWtzUif4Jt8gjXybJ6KQO0XaVjM/akKLUcsgG97N
         UuU8LBWNTk2n4fQPSRx40+ObEeceIiA5+iL/43hP0P5a57gxtAA6vIIUTTkAgUpBZjE9
         NSNhsQJrzgUd/l3ukx7WUbof8c4hqGphHQBWtS8vDeaDH8oezx+HVEe9bNyLXcMCl+CK
         rTKXlLXgdxr7LFu6lUrS/ZlnFWMmLK7dWaCFa06D/If/3VFteyzXO/rwtm0PMYDuBCC0
         36jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935124; x=1746539924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhJ2H3i1H9QEiQuSDT43T4jVhzfFSUOLYdmYxqiqeBg=;
        b=nJ0+ky0lgtNlskCI9LBt2v+5rn38PgLTajGQVsdGu/WmOzrrQ3/+ObKsJWOw37YAhS
         DwjRAOQ+WuorCbAs6t0eUp8HnLCBuh71nQGEiPFWzKeXKOTuxvrTIPjp0NdZnsIQ7BYJ
         25oybUlLwKhwUH4o94TePzQ21xqa3xo+guXBXI1yXXXX/2gSD8Vlrxu728J6hHiG7ePl
         LBpepQFTUGWdGvV9D75YQZm9fCGwPCgrOvynPKWQl5UTblvI4zrI7QM4BW3I3/WRqpfj
         O2s1aOlMWN1+rj6ifPlzQ2RTx5VRnrVWC/W49FQGwQSJCkbjaAEKfjhwZNsSaWHuH2xF
         QB1A==
X-Forwarded-Encrypted: i=1; AJvYcCUUPNQjDuXBz2UdUt6RmdXgVlsRoxNpwK6YtVwxDq8o4q2zOyNN2tGow4F+K0qhJRtieZ4Pe8aMgOooLPWEagll@lists.infradead.org
X-Gm-Message-State: AOJu0YzP3tJiS47psM9l0L9pggnTjq2P+0KwqloVMVtKdFRrYnPMijIP
	oJIbApYg7ChL9DyKqowl/z6+2J+tSCj9jYOosy8Q/Oa2W2Mnr6owM8JgWjWlEXKpjY7JUMKurPM
	PdwiwlyCMdx6hdcaflO3V1JAPzBghyw==
X-Gm-Gg: ASbGncsLcNeiI/zMfN9TyyKzRw8a1hRx6ZDCxMhONK3Y6pEAQ48KFvi6mUHHuRVZUQr
	sgPK4UQuMgCN0Z1sOaVlLCMlMA68NPGDS23UNjY2S0FPCv0EHtAsag4MTEsD20ucAXzg8EfjESG
	FhFFDHWrK/C0bQmk//NIAK7rEjcU8BetL9NVwFMSQ42C8GuaTCkhTS4gOHp7Ut0g==
X-Google-Smtp-Source: AGHT+IH1nUpjoSz6b/R8czY4xnY2bsj4Qtmd4LwhtuxBaf5F+Zjq1Yfe6RP1zEzp5FQni5VkJn1doj3WcQsEWRWuaUQ=
X-Received: by 2002:a05:6e02:194f:b0:3d4:e6:d872 with SMTP id
 e9e14a558f8ab-3d95d262d3amr36052445ab.9.1745935123936; Tue, 29 Apr 2025
 06:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250428205619.227835-1-robdclark@gmail.com> <20250428205619.227835-4-robdclark@gmail.com>
 <20250429122834.GA2260621@ziepe.ca>
In-Reply-To: <20250429122834.GA2260621@ziepe.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 29 Apr 2025 06:58:32 -0700
X-Gm-Features: ATxdqUGRQLIGoOBhYNTDnXlEra9K_SUIOqCbRuVfNJ5xIkADqjZJJUiOpnz8BvY
Message-ID: <CAF6AEGt+5cg1CRb4ZSm9poWhq6LGh=N2axfRyKOvKP5PNpVucg@mail.gmail.com>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Joao Martins <joao.m.martins@oracle.com>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_065845_282666_36C79581 
X-CRM114-Status: GOOD (  19.80  )
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

On Tue, Apr 29, 2025 at 5:28=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Apr 28, 2025 at 01:54:10PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In situations where mapping/unmapping squence can be controlled by
> > userspace, attempting to map over a region that has not yet been
> > unmapped is an error.  But not something that should spam dmesg.
>
> I think if you want to do something like that using the iommu API the
> expectation is for the caller to do a iova_to_phys to check what is
> mapped first? That seems kind of lame..
>
> Maybe page table driver should not not be doing these WARNs at all. If
> we want to check for that the core iommu code should have the WARN_ON?
>
> eg iommufd already has a WARN_ON around iommu_unmap failures so having
> one in the ARM page table is a double WARN.
>
> Don't really like using a quirk to change the API contract.

I'd also be ok to have the WARN_ON instead in the iommu code.  In the
case where this quirk is needed, I'm using the io_pgtable helpers
directly, not going via the iommu layer.

BR,
-R

