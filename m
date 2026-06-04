Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC463CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 06:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUX4p+/g3In60o10PoOm58/dfPztgEd/GT0xX0N5jBE=; b=PpnkqGKSb4DmxRhmxx45owk9sz
	yilqyh4YGiRcBi8DFSOQGWbncLjx8h2tw3NYkeLPEBQtYAIAEcAKseVBLVR61XyvujhLUJaPH90OY
	0TfzRymy7+EGSKgF67GskUv2Tm1X9V0m6bptemhn4FeP1PZhnMqRz77TVeaoDwXnLZf7n7ZNULLDN
	eCK6W/IOynth1ipthnP62zdTKLCuttnKbUA1SrYPkFxGyqlFlOa1gYSUsvleqc7a5xNaOaeVzCMLP
	N4rZljMoNcp4jn5FvcdEQ5ueyyUua2jTs+uAhy+Nlzt+LUuuQdyF3qbjgRlvyseCt1/oGsGHfmo2i
	CLwgqbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1Y5-0000000GDv7-3bID;
	Thu, 04 Jun 2026 06:27:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1Y2-0000000GDuN-3SmS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 06:27:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c0b1a48855so77565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 23:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780554441; x=1781159241; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TUX4p+/g3In60o10PoOm58/dfPztgEd/GT0xX0N5jBE=;
        b=eCJJyPFYOEHl8pAawLxMqWqkoDLuD9Jgle6KQbUejpeX+SssqVp72TQjfxDPCV5hBg
         XYMIyzwlFHZnqCt+jrpatve0UD6rUVaDo+QImQOCjUsC/yhTb8VGhzBPEmZ75RN1WK6b
         KVmqmgnI2yKCByuXghtN2g694WHsK1m4sVMDCTyKN0Asx5fk2fEUYoxWQYIrCxkvow7Y
         34AZqwJk2Q4ORrNoqSKYLs/4kPfd27MhHeK2OCqMTDRKkuCI0Llx2fx2wEy3Nf9L1kMu
         YTeQX5mLwkzAxXHxFLwEzDMJFkCeW7LYPVVkaeOTv5n1tqXTFgYO706gbZgjzIhM9kyB
         Pt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780554441; x=1781159241;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TUX4p+/g3In60o10PoOm58/dfPztgEd/GT0xX0N5jBE=;
        b=GgozdMI6fpG+AIjz0YX2V2GkgfsXR4YwSu7C54Qc+/T1mIVKPkJuLjtK8fRFxm7j4+
         E/cqemeFDlF1XOGzEkQAuXR99x7/FuWCf3WkPmaXbkhP4//4q9nmprI6shabXyZwrU2v
         eOZFSfCgjFzYwJSwq3ohV9PPJID6n6chi8LrDZ1fhcx5ajQwaBwviaSGq7xZgZh9UyW8
         CeZNDoqiptyj9bTX4lB/9p33Qj+w52adbQBiwUD1Rkh0rmXCrXbIdIFksiC7v9yhErBV
         /IOTWdk7gFrZ7gxdWn8ewKw+JC2rpAVCDFUC+qFsZwfh1wh8VFhbQOdaPfarOTJOFi5N
         sUUQ==
X-Forwarded-Encrypted: i=1; AFNElJ95d9o3yeg7YhqR8oQczRrv1OJb8KwBrOXAI/GzHM82zNpZJWn2VyuFs36NcOZ8Hhyd0kWiN/1mLE+oFRZ3N/DG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy414ZfdLQwHyTEiHPAbxTrJwvrSkuzENMyXnltibDh9iJJTAbq
	y+/Kck5EiuXkLfPtfTE1H3sZfCmRQZlvS8v+5StEb4BeiHNb+XMLmAM1xHVieWr5rg==
X-Gm-Gg: Acq92OHIABEkBa/imy6do31Qafm97k5e7SWehPvkB+i026QEmDUq46bjA/Zsml4c0oR
	x9rBTVbx3tDVIfSD3Q1VVwaERnSo72z/D1asGULYTF0UJdbI7SqSC0Io54RL7oqIYaU1gn4j7Lv
	HMsUC8S6NbAdavwwh4QGGkKq0sRImugw/4zfBQrGoHazeQFGX7TGpLSXbG1Yi4LF3o+UKWFM4X9
	lV5jxmnXYLUsBxnjrRrGJTkP+dlJeoMxIhosGYj12nFyp8s5CJ9Iab31afA762kkfOPZIH9kHyE
	QgNaNMrdIBVrjOKWlOIC0o6496W6iITH0X6i3ga11wjX0N/9EIY/dwyxCbIJ1JJ0XpsHxC+EiXd
	Etau6ee4dXXQy2h8RVt6FFT8ho+16pKLAb1yYDoeF6rGJY5gVpaHPEZw7E7pnn7kb8FlyePPh29
	AwaKXA3BxCfNZ1AJqq/fuZpbaoKtMJAW7rlYc3nPDiyiwnudDPRmGaPvToeQ1X5qoLY6Wh3Y9d5
	RI5pofSZA==
X-Received: by 2002:a17:902:f745:b0:2bd:3c1b:3073 with SMTP id d9443c01a7336-2c198b2b92fmr2310625ad.16.1780554440352;
        Wed, 03 Jun 2026 23:27:20 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649293esm47008075ad.68.2026.06.03.23.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:27:19 -0700 (PDT)
Date: Thu, 4 Jun 2026 06:27:12 +0000
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
Message-ID: <aiEawEFsnG-LIahW@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-12-praan@google.com>
 <CAE2F3rCPgnFU=d5At1zrOLhsuVEbsweogOHGz9gDddRx73zRtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rCPgnFU=d5At1zrOLhsuVEbsweogOHGz9gDddRx73zRtw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_232722_868929_AD78528A 
X-CRM114-Status: GOOD (  30.21  )
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

On Wed, Jun 03, 2026 at 01:28:19PM -0700, Daniel Mentz wrote:
> On Mon, Jun 1, 2026 at 2:59 PM Pranjal Shrivastava <praan@google.com> wrote:
> > @@ -2361,8 +2394,33 @@ static irqreturn_t arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
> >  static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
> >  {
> >         struct arm_smmu_device *smmu = dev;
> > +       irqreturn_t ret;
> > +
> > +       /*
> > +        * Global Errors are only processed if the SMMU is active.
> > +        *
> > +        * If the STOP_FLAG is set (can_elide == true), the hardware is
> > +        * either already disabled or in the process of being disabled.
> > +        * Any errors captured during the quiesce/drain phase will be
> > +        * handled by the explicit arm_smmu_handle_gerror() call at the
> > +        * end of arm_smmu_runtime_suspend() callback. On resume, the
> > +        * STOP_FLAG is cleared before interrupts are re-enabled, ensuring
> > +        * no valid errors are missed.
> > +        *
> > +        * A lockless check is favoured here over a dynamic PM core check
> > +        * since the runtime_pm_get_if_active would return false during
> > +        * transient states like RPM_RESUMING & ignore level-triggered
> > +        * interrupts.
> > +        */
> > +       if (arm_smmu_cmdq_can_elide(smmu)) {
> > +               dev_err(smmu->dev,
> > +                       "Ignoring gerror interrupt because the SMMU is suspended\n");
> > +               return IRQ_NONE;
> > +       }
> 
> Have you considered using arm_smmu_rpm_get() here instead?
> I can see two issues with the currenlty proposal:
>  * Returning IRQ_NONE when an interrupt is indeed active and needs to
> be handled. This might be interpreted as a spurious interrupt
>  * Nothing is preventing the suspend handler from running while
> arm_smmu_gerror_handler is in the middle of handling an interrupt
> 
> I understand that using arm_smmu_rpm_get() also has downsides,
> including an unnecessary resume operation when the SMMU is already in
> RPM_SUSPENDING state. However, using arm_smmu_rpm_get() would make it
> easier to ensure correctness.
> 

I don't think using arm_smmu_rpm_get() here is possible..

GERROR is registered as a hard IRQ handler, so calling rpm_get (which
can sleep) would be wrong.

Regarding the race, the STOP_FLAG is set at the very beginning of the
suspend sequence. If an IRQ fires after that, we return IRQ_NONE and
let the explicit arm_smmu_handle_gerror() call at the end of
runtime_suspend catch and clear it. After CMDQEN, PRIQEN, EVTQEN &
SMMUEN are all cleared, getting a Gerror should be treated as spurious

That said, I understand your concerns about a real IRQ being interpreted
as a spurious one, and creating an IRQ storm since the gerror register
isn't really written. I have 2 ideas here:

1. We could have a "suspended" flag and check it with can_elide here:
arm_smmu_cmdq_can_elide() && is_suspended() to correctly return IRQ_NONE

2. We could explicitly disable Gerror in IRQ_CTRL write after setting
the CMDQ_STOP_FLAG. Even if there are Gerrors during the CMDQ drain,
we'll catcup to those at the end of our suspend callback.

I'm more inclined towards 2 as it prevents potential races (execution of
an IRQ handler with handle_gerror calls at the end of the suspend).

WDYT?

Thanks.
Praan

