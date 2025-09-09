Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A31CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6rLLgpVdsegGOz+EoupeAx36VHy3lWka2XxE7GCX/E=; b=NM8iC6dFkyMENQjXEyJbUtWRkt
	7e6giLzIXfdRELTdJHa3+KEn8fvyVvBYw0y9IAhJ8O3GxGTZFWl4usevxSgIXkypHGa1dyFjmaCZ+
	kMRUam6T3+O23vWwcuWKRkJNz4NYWhLw78RXRCbvxhA/2bsiEK0Y02YG0CwYyFJHuDEz1dW3XOEvR
	vLKTOzUqMD65f2QwCd/vH4XxAn5TKwaoMBUXj3XY71n8TDpP7RmGouZ7or/p1Mk+0l++S/60xacsI
	kU+EcDf1k16UC+G6qEtL22C+Xk/w3tp1atlv4ccWdcxM9sEOG0U2pwEUQRLHXNN66zH8BiyQOm+J6
	MLy3snLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw25m-000000093ZJ-1qSt;
	Tue, 09 Sep 2025 17:25:18 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0NT-000000086bb-0Acz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 15:35:31 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b042cc39551so1036227366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757432124; x=1758036924; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A6rLLgpVdsegGOz+EoupeAx36VHy3lWka2XxE7GCX/E=;
        b=u27hB1zSkVs0VsiDg70El1/YCBP0fyvUkSkx5uPV+aN0iwawLsWlalAiR8q2qf47pu
         CpmGPeNlDnp+5FKfX5pfJtc27jQrVKsadwsJ5bQ0A713+G/kgX3Z0fZI+GRbTfSgd3Vo
         kUfcaNfUxPgN1DSoHKrqv4d+iKZO3GPIyFNfYLy6JkqPuqmCUlUdNeB655SOvTzpddIq
         bRj3QAg//i0hEJV0Sgd8pMaKFBhAjuh1EPGvLiS6vFuEX+7XucnEqE7qJTFRCpF4Opm4
         QMR1aSqhYByn8kmKfKsTAXSwxN4NqMSDOSGgR1JHq0PVLQDGIsElUF707hz1f3NHqcv6
         cLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757432124; x=1758036924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6rLLgpVdsegGOz+EoupeAx36VHy3lWka2XxE7GCX/E=;
        b=Uc4NySN8M1YKB6rqUkxSO9lQIr1Jg9XzgnDjepAT4X0Ek4WQbSImMIXUBS4lovnssE
         Ab2vqP2ytNvc4WlPWaTFcuT6LlzqNpgjf0Q4JgXVxtFC3uGbv44z1oXsHaziRts+6jhC
         00b/WhnE811LhB5jm3qMuKLcVPKNummyG7nONo2VM1v7p1AXDRJf0jhW0vEPj3M4VPMv
         3PC/0LJKewzD4yqEkUN9gaME1/Iig3nmVRQJynt0ZLboBfBYtWWD4xJ86vVvAmQULUCQ
         zvgv3PKJEpHbCwv+/7GWkaOj9nVmfR1vGDyt7qjT/t/42QtfDBq2Bjzchu6LqZaWNDwS
         VUTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWayXcgbGVUhhjWmleokvmozwlZ//cVNBWx6yxjLRJawS2A7w8wn98O2bVUdGNJS5R+b7V2MSEuntZtu0XUAAb4@lists.infradead.org
X-Gm-Message-State: AOJu0YxTPNQFBotRCLdqIEepvZcv/RCz/leRF153fWQ4v6L9Jv+vUHEj
	cjtKb41FoJtym+KTcut3j/g84qBgxDehcrXiHEtzdwbupR04++YNJp4q0nwczcrNADxvv7hAU7s
	2tPPl/pg=
X-Gm-Gg: ASbGncv92rg2CtyrkLjxDhf+tKDKjltr0mdGo05dMIiear+CiWint8emg6ifejRDcoy
	NqAL1ab0MuxRj8XXvgNi0UWxnimM9xWB4JbHYvXUNf5Yk8/Um+KA7vT1+dWVJ59Ety6ZLE3Wig+
	bSiUGPXh/1xATUYRdV5PhiYKjJvjzsgiBkRh4hLpLpG+q+R5x4a+UfFp3uaxX5O9p+h11A/BrtI
	jRhgffIDSq19vnp3sgZBD5YDFNjTjB17L9fxV9TERlcjcXdvlZvLxzfxEQ0sKMc+/VzfffH49wA
	cIEkGCrtanfn3fxXFy4vgtNq3hsJjbNd87Tqtad2E/hKguNsV1g0lXNJE23cIY/42oRUMaMsKVk
	pDlldIrpu8M5gSDfA43tTW/lCY7BAW/jZ
X-Google-Smtp-Source: AGHT+IHff9nCiQdFMDLMJ/hlSIro/R7UZcyBEWyHkdL401b61b17TqRRFBH3ULGPy356DE8iv2CdnA==
X-Received: by 2002:a17:907:9707:b0:b04:95cf:a39a with SMTP id a640c23a62f3a-b04b1714554mr1300624066b.52.1757432124140;
        Tue, 09 Sep 2025 08:35:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:cfb9:1327:6099:9e75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830e613csm8636466b.46.2025.09.09.08.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 08:35:23 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:35:19 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when
 running bare-metal
Message-ID: <aMBJNzXpQTMg4Ncs@linaro.org>
References: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
 <aMAkJ7CfPQuhvhfm@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMAkJ7CfPQuhvhfm@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_083527_713324_E300B563 
X-CRM114-Status: GOOD (  32.57  )
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

On Tue, Sep 09, 2025 at 01:57:11PM +0100, Will Deacon wrote:
> On Thu, Aug 21, 2025 at 10:33:53AM +0200, Stephan Gerhold wrote:
> > Some platforms (e.g. SC8280XP and X1E) support more than 128 stream
> > matching groups. This is more than what is defined as maximum by the ARM
> > SMMU architecture specification. Commit 122611347326 ("iommu/arm-smmu-qcom:
> > Limit the SMR groups to 128") disabled use of the additional groups because
> > they don't exhibit the same behavior as the architecture supported ones.
> > 
> > It seems like this is just another quirk of the hypervisor: When running
> > bare-metal without the hypervisor, the additional groups appear to behave
> > just like all others. The boot firmware uses some of the additional groups,
> > so ignoring them in this situation leads to stream match conflicts whenever
> > we allocate a new SMR group for the same SID.
> > 
> > The workaround exists primarily because the bypass quirk detection fails
> > when using a S2CR register from the additional matching groups, so let's
> > perform the test with the last reliable S2CR (127) and then limit the
> > number of SMR groups only if we detect that we are running below the
> > hypervisor (because of the bypass quirk).
> > 
> > Fixes: 122611347326 ("iommu/arm-smmu-qcom: Limit the SMR groups to 128")
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> > I modified arm_smmu_find_sme() to prefer allocating from the SMR groups
> > above 128 (until they are all used). I did not see any issues, so I don't
> > see any indication that they behave any different from the others.
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 27 +++++++++++++++++----------
> >  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> Is the existing workaround causing you problems somehow? Limiting the SMR
> groups to what the architecture allows still seems like the best bet to
> me unless there's a compelling reason to do something else.
> 

Yes, the problem is the following (copied from commit message above):

> The boot firmware uses some of the additional groups, so ignoring them
> in this situation leads to stream match conflicts whenever we allocate
> a new SMR group for the same SID.

This happens e.g. in the following situation on SC8280XP when enabling
video decoding acceleration bare-metal without the hypervisor:

 1. The SMMU is already set up by the boot firmware before Linux is
    started, so some SMRs are already in use during boot. I added some
    code to dump them:

     arm-smmu 15000000.iommu: Found SMR0 <0xe0 0x0>
      ...
     arm-smmu 15000000.iommu: Found SMR8 <0x800 0x0>
     <unused>
     arm-smmu 15000000.iommu: Found SMR170 <0x2a22 0x400>
     arm-smmu 15000000.iommu: Found SMR171 <0x2a02 0x400>
      ...
     arm-smmu 15000000.iommu: Found SMR211 <0x400 0x3>

 2. We limit the SMRs to 128, so all the ones >= 170 just stay as-is.
    Only the ones < 128 are considered when allocating SMRs.

 3. We need to configure the following IOMMU for video acceleration:

	video-firmware {
		iommus = <&apps_smmu 0x2a02 0x400>;
	};

 4. arm-smmu 15000000.iommu: Picked SMR 14 for SID 0x2a02 mask 0x400
    ... but SMR170 already uses that SID+mask!

 5. arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
    arm-smmu 15000000.iommu: GFSR 0x80000004, GFSYNR0 0x0000000c, GFSYNR1 0x00002a02, GFSYNR2 0x00000000

    SMCF, bit[2] is set -> Stream match conflict fault
    caused by SID GFSYNR1 0x00002a02

With my patch this does not happen anymore. As I wrote, so far I have
seen no indication that the extra groups behave any different from the
standard ones defined by the architecture. I don't know why it was done
this way (rather than e.g. implementing the Extended Stream Matching
Extension), but we definitely need to do something with the extra SMRs
to avoid stream match conflicts.

Thanks,
Stephan

