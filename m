Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73564CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ks/nBSck7Stoiu3lp2n8wjNWID3INEqmA7FA9e4kAW0=; b=IiGRR7XJjhT2YgXK6UE195kViE
	wDy7o7vtOg92Pga8Og+oYPczu9Ptf2GVM/yfjT7rX1bS6k/7lZ1ikgwM4Xu4aOOZlojYVwJGP742S
	3Xd7lzxOSbEWoRbAyk4Xkcz30SeoAVOSkvZ8+q2qZ/BP8X+UTtQBxFs/LLbXubnY6dV3Sr32FXjya
	UN9AKBGxk2AI6/zCbSnYqpgxRuTp/0vqGKRc46OqxY6jzLezHgBsTbYvfj0/vXbCn60HPBqdj/hP2
	XdKE2OaI89D/fRY4zOswxdk38MNPemKyBA8duELLla6HAFekZMYU8rLBHtbP8j68vO7M9MQHS2TVb
	tcPwhCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxeC-0000000ECS9-0PFi;
	Wed, 17 Sep 2025 19:16:56 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxe9-0000000ECR7-0DZh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:16:55 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-62f2b27a751so164173a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 12:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758136611; x=1758741411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ks/nBSck7Stoiu3lp2n8wjNWID3INEqmA7FA9e4kAW0=;
        b=lCZEqi7ihluFO5lUh+9VEUa2pQFENLfLN0I5aKGgsl9b+N75KeEDF99NoswqlGi1uJ
         gSwcM9oyaaC20+FdWdkV7DTJbkX57e9uwALZviEe+4w59Lq/OZEWpJLNbQjSKjalw8uN
         2QTHAd6RDg61eW5fFdHsKCHDcWkmdyvmItUdUNja6kA/tzigpeQUscvLbz861sTT2a6l
         VnLuVaGmMGfTIHCsy6NNXTNDfXRT2yhlDWourOHainwaxRQcx+iHyz5jX+cd766QYqI2
         8RPZiSbLrT03egyl+gUxVUcbBf8q6pDGrTx/+TVmUItmdnP2ERASLaOhrmfRWUYvlsNI
         6pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758136611; x=1758741411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ks/nBSck7Stoiu3lp2n8wjNWID3INEqmA7FA9e4kAW0=;
        b=dQMGo/9m0ojK3Bon2G7mwUx2cO7i1Ho11LcROXYWah0JezUaF5J9RsnsCzj2R9YP5h
         uAkXkD1kwgxZhxSCZqhUMbOdzJtXBQ9CYlQE3fQGN7xxJvVwGUbgwhP69r/wFFRi/7Im
         wmXHM9vKCns1/y2/CKtIyp3Z9SLDOffk/dRi4vwRS3Y1dOfEM9c25mkZxYSQBPIc3jTm
         p4J4fpwct/oK31OrAHg3rzavOBaSKvZoMhbAF1HjtLNTK0DgLa3V/QaEFlJS/Nd00Btp
         efWCBqYbMdL5weUFAiEv3YOLdNl49/UDKqY/m6mOOavQNR1q8pxPt10xz4fWr4VGxtnu
         cZCg==
X-Forwarded-Encrypted: i=1; AJvYcCVjFoNKR72BOkxF/TCxuXuQTo6ejm4wbei8A9q2RFrr3xnkkDY0j1VusnoaOE+mBHXyHuc8ZmWzcDxSn0EVLN7x@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/rZDaQUBf2nKfVJf2w33dnKy7oHOdJQb2OLlRnsQNJdA0TBEa
	sHQDsvB1nwAcznKUEKY77sLUGQDyZIVYz9FztCqsohrzm0k9eKaJxqkxKh4V64AP36Y=
X-Gm-Gg: ASbGnctp4c4qAg85GE9qqa0JIgANTpluqzWa/RK0sfK9M6s947IbzxZ61ea7LwrLj8o
	Anbtva6vRc9aCssvbF0+YEBA6hQxcr/6Mj80i4WTYDOP6olsZr2NJYqgv7ttXtbc0dbdFbN9kZb
	rSgySbVbi/DptQBKfDOc456MLaBMoX05NKb4AH3DCi0wJRSRTToztU7Ua5GIT6JMOFUefQ3eMnF
	+NC21q8QnFIip0zsUCNnGaew40l51u2V+RZ7s4I0mQ1LYuAMUnEl1HHy5q0xYUT1veFf6T4iy7+
	STXIjGKSbxCL5ANZFWii/34Y3GEqTV6ElQCAwWgseaSttsinmAF5/7/5yPQoHJP31dA0JJOQD6w
	aM4N8EetGRgbJ/cE4VgTak2ZkLYt/2YA=
X-Google-Smtp-Source: AGHT+IHykcOXTk1a6tur651VWEsRLYVKfCQ0dvzLRtdYQ8gOpn4ZAYevIOYz/DJNbLAO5Jx7dvWoJg==
X-Received: by 2002:a05:6402:2755:b0:61c:1b27:56d4 with SMTP id 4fb4d7f45d1cf-62f8466118dmr3057422a12.35.1758136610657;
        Wed, 17 Sep 2025 12:16:50 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:4eea:42a:b97c:21a5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d4357esm119697a12.23.2025.09.17.12.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 12:16:50 -0700 (PDT)
Date: Wed, 17 Sep 2025 21:16:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when
 running bare-metal
Message-ID: <aMsJHheI6Y1V5q74@linaro.org>
References: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
 <aMAkJ7CfPQuhvhfm@willie-the-truck>
 <aMBJNzXpQTMg4Ncs@linaro.org>
 <d73e5026-ccb0-4a19-9742-099a0443f878@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d73e5026-ccb0-4a19-9742-099a0443f878@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_121653_146973_6550FC63 
X-CRM114-Status: GOOD (  55.13  )
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

On Wed, Sep 17, 2025 at 07:02:52PM +0100, Robin Murphy wrote:
> On 2025-09-09 4:35 pm, Stephan Gerhold wrote:
> > On Tue, Sep 09, 2025 at 01:57:11PM +0100, Will Deacon wrote:
> > > On Thu, Aug 21, 2025 at 10:33:53AM +0200, Stephan Gerhold wrote:
> > > > Some platforms (e.g. SC8280XP and X1E) support more than 128 stream
> > > > matching groups. This is more than what is defined as maximum by the ARM
> > > > SMMU architecture specification. Commit 122611347326 ("iommu/arm-smmu-qcom:
> > > > Limit the SMR groups to 128") disabled use of the additional groups because
> > > > they don't exhibit the same behavior as the architecture supported ones.
> > > > 
> > > > It seems like this is just another quirk of the hypervisor: When running
> > > > bare-metal without the hypervisor, the additional groups appear to behave
> > > > just like all others. The boot firmware uses some of the additional groups,
> > > > so ignoring them in this situation leads to stream match conflicts whenever
> > > > we allocate a new SMR group for the same SID.
> > > > 
> > > > The workaround exists primarily because the bypass quirk detection fails
> > > > when using a S2CR register from the additional matching groups, so let's
> > > > perform the test with the last reliable S2CR (127) and then limit the
> > > > number of SMR groups only if we detect that we are running below the
> > > > hypervisor (because of the bypass quirk).
> > > > 
> > > > Fixes: 122611347326 ("iommu/arm-smmu-qcom: Limit the SMR groups to 128")
> > > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > > ---
> > > > I modified arm_smmu_find_sme() to prefer allocating from the SMR groups
> > > > above 128 (until they are all used). I did not see any issues, so I don't
> > > > see any indication that they behave any different from the others.
> > > > ---
> > > >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 27 +++++++++++++++++----------
> > > >   1 file changed, 17 insertions(+), 10 deletions(-)
> > > 
> > > Is the existing workaround causing you problems somehow? Limiting the SMR
> > > groups to what the architecture allows still seems like the best bet to
> > > me unless there's a compelling reason to do something else.
> > > 
> > 
> > Yes, the problem is the following (copied from commit message above):
> > 
> > > The boot firmware uses some of the additional groups, so ignoring them
> > > in this situation leads to stream match conflicts whenever we allocate
> > > a new SMR group for the same SID.
> > 
> > This happens e.g. in the following situation on SC8280XP when enabling
> > video decoding acceleration bare-metal without the hypervisor:
> > 
> >   1. The SMMU is already set up by the boot firmware before Linux is
> >      started, so some SMRs are already in use during boot. I added some
> >      code to dump them:
> > 
> >       arm-smmu 15000000.iommu: Found SMR0 <0xe0 0x0>
> >        ...
> >       arm-smmu 15000000.iommu: Found SMR8 <0x800 0x0>
> >       <unused>
> >       arm-smmu 15000000.iommu: Found SMR170 <0x2a22 0x400>
> >       arm-smmu 15000000.iommu: Found SMR171 <0x2a02 0x400>
> >        ...
> >       arm-smmu 15000000.iommu: Found SMR211 <0x400 0x3>
> > 
> >   2. We limit the SMRs to 128, so all the ones >= 170 just stay as-is.
> >      Only the ones < 128 are considered when allocating SMRs.
> > 
> >   3. We need to configure the following IOMMU for video acceleration:
> > 
> > 	video-firmware {
> > 		iommus = <&apps_smmu 0x2a02 0x400>;
> > 	};
> > 
> >   4. arm-smmu 15000000.iommu: Picked SMR 14 for SID 0x2a02 mask 0x400
> >      ... but SMR170 already uses that SID+mask!
> > 
> >   5. arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> >      arm-smmu 15000000.iommu: GFSR 0x80000004, GFSYNR0 0x0000000c, GFSYNR1 0x00002a02, GFSYNR2 0x00000000
> > 
> >      SMCF, bit[2] is set -> Stream match conflict fault
> >      caused by SID GFSYNR1 0x00002a02
> > 
> > With my patch this does not happen anymore. As I wrote, so far I have
> > seen no indication that the extra groups behave any different from the
> > standard ones defined by the architecture. I don't know why it was done
> > this way (rather than e.g. implementing the Extended Stream Matching
> > Extension), but we definitely need to do something with the extra SMRs
> > to avoid stream match conflicts.
> 
> I'm also a little wary of exposing more non-architectural stuff to the main
> driver - could we not keep the existing logic and simply add an extra loop
> at the end here to ensure any "extra" SMRs are disabled?
> 

It's not that simple at least, because some of these SMRs are used by
co-processors (remoteprocs) that are already active during boot and we
need to keep them in bypass until they are taken over by the drivers in
Linux. Any interruption inbetween could cause the remoteprocs to crash.

With my changes, the boot SMRs stay active (at the same index), because
there is an existing loop inside qcom_smmu_cfg_probe() that preserves
them as bypass:

	for (i = 0; i < smmu->num_mapping_groups; i++) {
		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));

		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
			/* Ignore valid bit for SMR mask extraction. */
			smr &= ~ARM_SMMU_SMR_VALID;
			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
			smmu->smrs[i].valid = true;

			smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
			smmu->s2crs[i].cbndx = 0xff;
		}
	}

We could "move" the SMRs > 128 to earlier indexes, but this also needs
to be done carefully in order to avoid:

 - Stream match conflicts, if we write the new entry before deleting the
   old one.
 - Unhandled transactions, if we delete the old entry before writing the
   new one.

Currently this can't happen, because we don't move any entries around.

We could do it similar to arm_smmu_rmr_install_bypass_smr() and add:

	/*
	 * Rather than trying to look at existing mappings that
	 * are setup by the firmware and then invalidate the ones
	 * that do no have matching RMR entries, just disable the
	 * SMMU until it gets enabled again in the reset routine.
	 */
	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sCR0);
	reg |= ARM_SMMU_sCR0_CLIENTPD;
	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sCR0, reg);

However, this would need to be done carefully only for the bare-metal
case, since I doubt Qualcomm's hypervisor will allow disabling all
access protections by setting CLIENTPD.

I can try implementing this, but the resulting code will likely be more
complex than this patch.

I realize it is weird to allow non-architectural features like this, but
I haven't found any indication that the additional SMRs work any
different from the standard ones. The SMMU spec seems to reserve space
for up to 256 SMRs in the address space and the register bits, as if it
was intended to be extended like this later. That's also why it works
correctly without any changes in arm-smmu.c: the bit masks used there
already allow up to 256 SMRs.

What do you think?

Thanks,
Stephan

