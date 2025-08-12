Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFE6CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FR8GU0OhyrXp1118wyyWRxkyUnIP7crv/d61bMyXgwE=; b=o/kBB6KAgrxHz3/qe2JF/qinB3
	cde5dxfNMaQDreqYntgLgXNXJ585toP/dVq6HmrXod1V7a5Fa5Pjx6vZWscm06A7durld8ltGMJ4B
	yD/iyJsZ5rg+UbthqceFoAlu6AaTnSCG4JYLGhNNzdGrtup8tJR3kTTrB6BpPyISfGG05X8MZuvSN
	1GmSJT2Ut5zw8L0kQzz7zfjdeht1QIxvbqcUoKkti6nK7cK4t0kg6M11lnOoOpNHSerQkp5f4ivOL
	MzBJI1kjE7epHkJxeEwxMfHZb52woW2CetH+FeWKxNRFSQBZ723JJno7Lrpca5hddkBHbVbu72PGE
	F0e96swg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluad-0000000BmqX-2oOR;
	Tue, 12 Aug 2025 19:23:19 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpMI-0000000Ay6C-3US9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 13:48:11 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4b0770954faso84588171cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1755006489; x=1755611289; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FR8GU0OhyrXp1118wyyWRxkyUnIP7crv/d61bMyXgwE=;
        b=mKlPgX/19JUdwziiyozqdBfwvs6O0Xqeeiu1knuMcIF4m/OMxA74osfm+nMSaYpJn8
         vsTfdzcCv0MzUDbUWPZzyuJJOStZ5LARaoPK+OXbMg55iVlkMAO7wKRDMZyN1m90RhqF
         FYjNyopRajRVb41lZxdfQ4bUqByA6VLYKjSBhcYdAfAUrMdGscFAVZeEkZxVnDSa6IU9
         FElDZS/9ewHSZUtFBFqzu6vv/va5hzhEGhGnelP1cYVvNEv6+rsZ50sZy8W3IFbH3UQ3
         4BBRadmdpeC1NAQOKpQASOr/TNKPmWiZGfAfQeV+Fty02v8I28wPgPDU21QU7/R+zV9Y
         UfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755006489; x=1755611289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FR8GU0OhyrXp1118wyyWRxkyUnIP7crv/d61bMyXgwE=;
        b=TcjsxEWM1GCYzTSjqP0ZQvBPTU3nESEX60ZR06uLQ5vby51MFBM1mMmu4GyQ7+5K9F
         +YxOxPcTJ260eHJwBabGyg0JLbQojGXsXmL1iEEUDVUF9VCoNjksot3rjMna6HcIMgHH
         4KBT4BuiYdQiae5pVefVGD+/3sA8+SIK5iukYFUPBBxrST+JCOqtTWBSAy/ZE85xxQlC
         DSPz4kqxCuRksu1sKEI1e5+I+NsOZ/cv25mGaKHVSFReM2z/v/rEfRk7hemzsAC0HMCx
         YdYToNKKYcEBo1CTAPFDd88ankKPSa7Ej2qQWrbLTYg0/vEBsiIl3lB1IAImj65sFWvj
         FH/g==
X-Forwarded-Encrypted: i=1; AJvYcCXlKcnxuaVQ5D4ix7oMt4EopAV9pUwQrG0bfx0zHs2NCAndVTGmQX/6HU25nu3IbCUbwITz75viN8ddd7ckdkRg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/7fsRntctA59tuceCVz2md60FgH7r8QHi4hOQAs2ZgLuvWqSg
	YRJ6gHeKEiqi0Un1jmmyz0Mn+d0V0CEHCXrpHPDN9dTI9he2gGFya9+LVg4s0rIaxWo=
X-Gm-Gg: ASbGnct+shOw4XkrDAWYW9exiExQVu8hFrtmDinzfUEDhTwDps+ffxeBkdnTMjTy4zY
	i44lZOC1Eo5eEpA4OetRAl2RfMxJxAY4GNQi0ZBQjWnaE/h7XeDVrBTaIofFGcGcDVugeUDL7DA
	yiMGCAfp6uhg0cySD0J+c9EcTL6qqa+udB8v1B5EuDDwliCDEKusjljMm4I7EIDOzTgjDmWZMPa
	7EtAomteo3oBX6LKICXIJvbShhtgVIxLMtXe6DxVClQj8jz7B2g/xOZG/XcL2CgN5YtQChjcbtu
	fvFbFntK49OrL1vJj/FMGKw6CmYokcayanxxpvj/uFRaqUT8Z0NlHouluSCa5msA7yxly/rmmRi
	prqvcSZpRnj3W7gXA3Wx43H2svKjdJykZJVYA1XcjCp7QEFnGaz93J3SOk9iqk8HUldPl
X-Google-Smtp-Source: AGHT+IHI6EhFhIRzAESYthEtnG0baUD5Q9gVXq2RPFWP9iicVSAJltUOiMffIa1QwE25DHjgtqhMEw==
X-Received: by 2002:a05:622a:6:b0:4b0:86b4:2520 with SMTP id d75a77b69052e-4b0ecbe5777mr52212061cf.22.1755006489353;
        Tue, 12 Aug 2025 06:48:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b09c11bf8bsm83500631cf.20.2025.08.12.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:48:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ulpMG-00000002cyr-0e38;
	Tue, 12 Aug 2025 10:48:08 -0300
Date: Tue, 12 Aug 2025 10:48:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <20250812134808.GC599331@ziepe.ca>
References: <20250731165757.GZ26511@ziepe.ca>
 <aIurlx5QzEtjpFLd@google.com>
 <20250801185930.GH26511@ziepe.ca>
 <aJDGm02ihZyrBalY@google.com>
 <20250805175753.GY26511@ziepe.ca>
 <aJNiW48DdXIAFz8r@google.com>
 <20250811185523.GG377696@ziepe.ca>
 <aJsXkidmcSl3jUJP@google.com>
 <20250812121056.GB599331@ziepe.ca>
 <aJs1dMiomjtxVwl4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJs1dMiomjtxVwl4@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_064810_871265_D02DD640 
X-CRM114-Status: GOOD (  23.44  )
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

On Tue, Aug 12, 2025 at 12:37:08PM +0000, Mostafa Saleh wrote:
> I see, but most of the code in KVM mode is exactly the same as in the
> current driver, as the driver is not HW agnostic (unlike virtio-iommu).
> In fact it does almost everything, and just delegates
> attach_identity/blocked to the hypervisor.

How is that possible? the kvm driver for smmuv3 should be very
different than the iommu subsystem driver. That seemed to be what this
series was showing.. Even the memory allocations and page table code
were all modified?

This delta seems to only get bigger as you move on toward having full
emulation in the hypervisor.

So, I'm confused what is being shared here and why are we trying so
hard to force two different things to share some unclear amount of
code?

> In addition, with no standard iommu-binding, this driver has to be
> enlightened somehow about how to deal with device operations.
> 
> As mentioned before, when nesting is added, many of the hooks will be
> removed anyway as KVM would rely on trap and emulate instead of HVCs.
> 
> Otherwise, we can skip this series and I can post nesting directly
> (which would be a relatively bigger one), that probably would rely
> on the same concept of the driver bootstrapping the hypervisor driver.

I think you end up with the same design I am suggesting here, it is
nonsense to have one smmu driver when it is actually split into two
instances where one is running inside the protected world and one is
the normal iommu subsystem driver. That's not just bootstrapping, that
is two full instances running in parallel that are really very
different things.

> I am generally open to any path to move this forward, as Robin and
> Will originally suggested the KVM mode in the upstream driver approach,
> what do you think?

Well, I'd like to see you succeed here too, but it these series are
very big and seem a pretty invasive. I'm very keen we are still able
to support the smmuv3 driver in all the non-pkvm configurations
without hassle, and I don't want to become blocked on inscrutible pkvm
problems because we have decided to share a few lines of code..

Are you sure there isn't some inbetween you can do that allows getting
to the full emulation of smmuv3 without so much churn to existing
code?

This is why I prefer adding new stuff that you then just erase vs
mangling the existing drivers potentially forever..

Jason

