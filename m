Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67F0CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 20:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nS7IcpZWz3b5YwmqEgZ6XKILf3MOjCp/zrLboq3oDIk=; b=spgWL1yr+lXEzFhDsl6cI9kSB3
	LgUHCxdf3S64pg8EBKVtJ+0douDN6eWGAIwrygTZPvivX4Iq+XVxUXSTQNLiBuYdRfYSH/G7uOkPo
	cUAzHjTe6XlqgMs2Is9dKNw2Jhfo+Kcf9ZFwHq8+YqacWCEzWGB3YUQMDJ5YJRte68xToWaAkXkfZ
	pOAlOUW2dsOrSjzJ8fHRduaXVj+w5/7ocylP23gPDszeCVJOZU/XzW3mQYra8TCoSzyawbM0W37xD
	jNP2mA55QBSI75wYL3/WGioX/BWnO5Rq94/WJj/vdtXcV0v6PIwGzItD0iXZK0fmjCq+qNRBBdfRq
	G5NlceTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2nl-00000006LTf-1GxQ;
	Tue, 09 Jun 2026 20:11:57 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2nj-00000006LTK-28Kw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 20:11:56 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c0b1a48855so1445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 13:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781035913; x=1781640713; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nS7IcpZWz3b5YwmqEgZ6XKILf3MOjCp/zrLboq3oDIk=;
        b=SUcCKQwDK7QaBMaqTB9NOU0VHJbtP41MIOm4Twah7I93AKHUkfUtcoQuGK2tF5d/hD
         EQMVQn/efolFD2TH0X13lzVoXB4Gol5RUmP9VgCoqXElvDdv7xEIFQjPHAYla7VgZWKQ
         +9ZWGDKGLoP8alGMtCqluON5Ca63dAaPwi6jazvZZiN2S5tuRYchsKIYckkIXCpQIVn8
         ttpsRjyHPCFxPgAnQUe+BMytpExZJeOvysUCpeJPAgHNldIDd76cj+6nPnn3LAZ8Biid
         tC7kJ7gfyHjn68eelv4F7WKG/r+EH+52dUBJ0gnjarn//xX//pkKt7ReVKaByBj1j6ui
         z0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781035913; x=1781640713;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nS7IcpZWz3b5YwmqEgZ6XKILf3MOjCp/zrLboq3oDIk=;
        b=XczRP/NTmXIc3GxPtAIRjOyTI9IM8/QxdldyraNsDbkPFhkbY9U07RTJknDhMrq2Un
         Q9zhJcnGEs5aKmRK2T+KWVTwGqBZ4r8Aka/kOgAJv0x9FptG+NSwGil+bxmRfsr4YhMO
         zyl0xyTo625jheKXAMfktitF5RbZLk5KoXfMW1UGqAwOaPBNfkdVa0v34A3Ms/xKiwYD
         Ag+nqN8NctDvUX44O3xmsTNpNiPUaX/NfFTM7rmDgyr6GpZsW64A0AgrKoNEANWRULq8
         lhuNSKniIOJcJpqb1J6aCagGhsvMB1KIPaQ9EQSqDjKmFQiVHkgMDZz2uDQTh4+vUxeL
         JHeg==
X-Forwarded-Encrypted: i=1; AFNElJ9KgnP7La0LTaA13t/bUVm3bFbUJKB7s5Iy4UPcSBfOKbaCX75b0V8bb9iUWQgycWNnYelUIuvzFNZPFvX4HoZz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0IcF55PptgQc6s6zC2vhp+S6/pIuEt8NgmndfXiDh+C2255Gu
	VwggYK+M1M0y/zw/K2eDsRBKrmS5yBv9+FGMK1XAWuGvzVdtxYSgCFPhr5FUKkwoNQ==
X-Gm-Gg: Acq92OHcB/c4Rv+HMQgQgfXVLx9q3OkY8dDEDfXzOwE2coHOOL8KHEDuZu0NKvcU3ph
	WlQWseKY75J5ouOtUx/+ZDBFvayBZix5BdhOhGMU+BuPHoFqqRxAWzJgsnL2z1KMVmM5Ilskbl2
	iQVoGRbQSkpXSjAjD44L1odQlNmTXUOm3xQDJyoxyXHRRIf1s4kkhNYPed07+oPpYP4IVVmLGuR
	tcMsfzF0heY4gm8F6k0XJHPmXhpQZVTlrKSKqaAbs+BI/DKMzfFtnqxy9H9YlLf3BWL1SlTOgR6
	ldYeQ91feaJMm8XcBufy3XrrsIioxZOhPdqPDvn86utVJIqfaYbcobzD0TEAeyFwQolN6M0o/mM
	8k2qy27BL3jPzqxVU7rscosF9smRxd77WYVFckS91zTpN6f/hm8xuxa18lNYUqfml5WCRrAWRia
	2oqBNHA26laC44tVo9R4WvIhpPnZ0tJKqphKSpEptUuLXdLkzA3wxy4esntUybq5m3H9Y3z2Y=
X-Received: by 2002:a17:903:2349:b0:2bd:a61:8536 with SMTP id d9443c01a7336-2c1eb74103fmr6509495ad.6.1781035912985;
        Tue, 09 Jun 2026 13:11:52 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm22581227b3a.51.2026.06.09.13.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:11:52 -0700 (PDT)
Date: Tue, 9 Jun 2026 20:11:46 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw
 access
Message-ID: <aihzgtczL99fM-1c@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-12-praan@google.com>
 <CAE2F3rCPgnFU=d5At1zrOLhsuVEbsweogOHGz9gDddRx73zRtw@mail.gmail.com>
 <aiEawEFsnG-LIahW@google.com>
 <CAE2F3rAWZ4Ac23D8eyAHfmaVVkHv8pz45+_dpMO1M4D7+RVCoA@mail.gmail.com>
 <aifsSxEXX64J1Etq@google.com>
 <CAE2F3rAGLH7si2S4aYhSUWyL-zZL7B_uo+WLE4zKY9SqKVi8zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rAGLH7si2S4aYhSUWyL-zZL7B_uo+WLE4zKY9SqKVi8zQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_131155_587428_2FE469D3 
X-CRM114-Status: GOOD (  18.24  )
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

On Tue, Jun 09, 2026 at 11:34:42AM -0700, Daniel Mentz wrote:
> On Tue, Jun 9, 2026 at 3:34 AM Pranjal Shrivastava <praan@google.com> wrote:
> > > I'm not sure if I have a good suggestion here. Have you considered the
> > > following: Do not call arm_smmu_handle_gerror() from
> > > arm_smmu_runtime_suspend(). Instead, call disable_irq() at the end of
> > > the suspend handler (and enable_irq() at the beginning of the resume
> > > handler)?
> >
> > I thought about using disable_irq(), but I think doing it at the
> > hardware level (IRQ_CTRL) is better.
> >
> > By disabling in IRQ_CTRL and keeping the manual arm_smmu_handle_gerror()
> > call at the end of suspend, we ensure that we don't lose any gerror info
> > We catch and handle any errors that occurred during the drain/quiesce
> > phase right before the power-down.
> 
> I think the beauty of disable_irq() is that it synchronizes any
> potentially running hard IRQ handler, which helps avoid races.

Alright, I guess we could:

1. SMMUEN=0
2. IRQ_CTRL.gerror=0
3. disable_irq();
4. handle_gerror(); at the end of suspend

Thanks,
Praan

