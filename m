Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02C4C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 00:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWta2RBHdNOuAiG72RgunT5XM70BX2r3Pve9teJEvWA=; b=enYnkhSRsLUnyQ9EuvKG8SlIiA
	P0Yb/itlcpEcGkE6OYDeLkQIRrz7HOPRBhSbIF/KV2saiID9dS1uO1f0q+RsZYJ6Hq1no32RfG8IS
	j3/qeDdiIFTQyG6/UIVX+bOLAwMrZTLzijyxEsaQ0dm59RCozpKGKtz+jtJjxxUIKejGGUFuuiprF
	08gUwdIgpnEylBsXcJA0ZnNNu8yLfYziGe1NZoSvM7o2qCGLn1NE28I1ncY0xVYhhd4pqaKoh0QiB
	1yYruQeTX77mCP0SaDdKTY/bdy4dcqOqCF4apbnHknP+MwPYjHURtQgPC00b9H4Zmk5Ug5Tu/0Xha
	TIZPo8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWl9s-00000006tG7-1BZf;
	Wed, 02 Jul 2025 00:17:04 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWl7W-00000006t38-0s2T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 00:14:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2357c61cda7so232805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 17:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751415277; x=1752020077; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yWta2RBHdNOuAiG72RgunT5XM70BX2r3Pve9teJEvWA=;
        b=KEPrnmloZNI/2Wqah6YGioPvizzD3oaepN0Ut/3LvxWSmFWBqz3p3e3+Nm272uGISo
         5p1r151pIiL0byldEIVlD1hhoNdPUnWC3MuqMWxxYFV9P84NJGK7F1obnu/bry78SQCQ
         O5p+lLEvti5CzSaZ3QmGO9Uy0L0uIDm5c6xRxYN+VZm++H/LEKRe0t1eyqiLkw7FyO7U
         X4qP6fijGMHqDhZYT99ry30V4CkHSFMqt0l65YFPd3o9NG4TnajGhPlk0b1OiS54fznQ
         hPwvx7ybRxGGWlDFjnDQg4xWsfkLCzR/ih8WQDFfkpO7WnzZFgDqyFePGIYGeLcr/ilU
         s6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751415277; x=1752020077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWta2RBHdNOuAiG72RgunT5XM70BX2r3Pve9teJEvWA=;
        b=jdRxyVDWEjHklIqc+FUc6OTYW/LaCL0P4+/ygGohRCsetsmLCBPfNQ3GUbRoi/uzpA
         cC+4grPAebp3uk/EO9Hl85vAMQNwKU6f+7buwxlog31FmhYZa9f3ySjgPLm7O8K+LG0J
         tqk7iOOmIWs1rZKtLyfvRF5m/oZQb35PYqBVq1wO1SAvdcUPINXSeUI2qBfLR91kFtNH
         gDwfEHREBbKwo5ji3AG5b+r5FSEpdPhJTVBx7AlUj4ZlCB4h2N/B8iQQ0BWZJQidWTKs
         abj8bnf0+3dAcwS4VJnQuuFlVQWEaDAd/oj1Z51J90wFCzJSDCXOGMsc9noBLnzfOwcL
         De3g==
X-Forwarded-Encrypted: i=1; AJvYcCW1WdQYfwbOG9PAquEn8gWwODty6cXrrccmVMR8UGJU5KcJAMEnxDf1JSIGAiDiZXSUd45M0MXZOqZ5f0kOVp9o@lists.infradead.org
X-Gm-Message-State: AOJu0YwGIjfWJnLXnKHXQh7RoHygxMUXI0jO8KGqx1/hk+skks3hKQy1
	54JmSwSy3TA8lLcQMeF3nYytpvOrw/FZKfv0WgYhROcCIcX0NStwp1eXNF+8P97Wwg==
X-Gm-Gg: ASbGncsrgdkmDGsaUk/19UIJGZTTjQRum2/82TxLww0TedLdU+WpSMfVqZBc/2LIrml
	w7wPURZoGg6b06bMvoJ3P17Cw59RNOuUYuQuhDe6i/K5VDVZStkyV3yB7DwTHbEjNzktRMIvQvm
	GCXU7Vkn5uRr6ijNpCFVUWLRSxAj04nDXykqxSb4mSfusQ9b3LVnoOPgDHIJcUP4b74EEFfBjqb
	C78aCm75oivNHxVQmOdLcfqvcRYobaWgMMSRygHjDZKtiYBx7YNldLSeXhyqHy0UanAxdOyf4Df
	e8t1/KGAmRlz2xL0iX+Ba+mBQE/Y/X7KcN46DOCFEaRWLkJdtKIEwL69Bl7ver3HT1KYT5wyb4r
	y3JHlavFvsyl677byh/dq
X-Google-Smtp-Source: AGHT+IGvJMG8/hp+2Ct3jUaU9SAz7W5inwlVAS3AX7hVe0NTLM1n/six7+4FqNJbQ+qt9+fMTBDOTg==
X-Received: by 2002:a17:902:f70b:b0:234:bca7:2934 with SMTP id d9443c01a7336-23c5fef098cmr4092395ad.6.1751415277107;
        Tue, 01 Jul 2025 17:14:37 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7986sm121732375ad.164.2025.07.01.17.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 17:14:36 -0700 (PDT)
Date: Wed, 2 Jul 2025 00:14:28 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGR55PUBnwb8qT8U@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <539ee2ec112162abdba511574e2205a77b425059.1750966133.git.nicolinc@nvidia.com>
 <aGQGm1-i4M75b9Qp@google.com>
 <aGQ6KCI9OZEwHdxS@Asurada-Nvidia>
 <aGQ_F7Qx3scbbA-J@google.com>
 <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
 <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
 <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGRozoIDIlgl9H9x@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_171438_277609_B3B7A3AC 
X-CRM114-Status: GOOD (  33.51  )
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

On Tue, Jul 01, 2025 at 04:01:34PM -0700, Nicolin Chen wrote:
> On Tue, Jul 01, 2025 at 10:51:20PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Jul 01, 2025 at 03:07:57PM -0700, Nicolin Chen wrote:
> > > On Tue, Jul 01, 2025 at 08:43:30PM +0000, Pranjal Shrivastava wrote:
> > > > On Tue, Jul 01, 2025 at 01:23:17PM -0700, Nicolin Chen wrote:
> > > > > Or perhaps calling them "non-accelerated commands" would be nicer.
> > > > 
> > > > Uhh okay, so there'll be a separate driver in the VM issuing invalidation
> > > > commands directly to the CMDQV thus we don't see any of it's part here?
> > > 
> > > That's how it works. VM must run a guest-level VCMDQ driver that
> > > separates accelerated and non-accelerated commands as it already
> > > does:
> > > 
> > >     accelerated commands => VCMDQ (HW)
> > > non-accelerated commands => SMMU CMDQ (SW) =iommufd=> SMMU CMDQ (HW)
> > > 
> > 
> > Right exactly what got me confused. I was assuming the same CMDQV driver
> > would run in the Guest kernel but seems like there's another driver for
> > the Guest that's not in tree yet or maybe is a purely user-space thing?
> 
> It's the same tegra241-cmdqv.c in the kernel, which is already
> a part of mainline Linux. Both host and guest run the same copy
> of software. The host kernel just has the user VINTF part (via
> iommufd) additional to what the guest already has.
> 
> > And the weird part was that "invalidation" commands are accelerated but
> > we use the .cache_invalidate viommu op for `non-invalidation` commands.
> > But I guess what you meant there could be non-accelerated invalidation 
> > commands (maybe something stage 2 TLBIs?) which would go through the 
> > .cache_invalidate op, right?
> 
> I am talking about this:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c?h=v6.16-rc4#n305
> 
> Those commands returned "false" will be issued to smmu->cmdq in a
> guest VM, which will be trapped by VMM as a standard SMMU nesting
> and will be further forwarded via iommufd to the host kernel that
> will invoke this cache_invalidate op in the arm-smmu-v3 driver.
> 
> Those commands returned "true" will be issued to vcmdq->cmdq that
> is HW-accelerated queue (setup by VMM via iommufd's hw_queue/mmap).


Right, this brings me back to my original understanding, the arm-smmu-v3
driver checks for "supported commands" and figures out which queue shall
they be issued to.. now there are commands which are "non-invalidation"
commands which are non-acclerated like CMD_PRI_RESP, which would be
issued through the trap => .cache_invalidate path. 

Thus, coming back to the two initial points:

1) Issuing "non-invalidation" commands through .cache_invalidate could
   be confusing, I'm not asking to change the op name here, but if we
   plan to label it, let's label them as "Trapped commands" OR
   "non-accelerated" commands as you suggested.

2) The "FIXME" confusion: The comment in arm_vsmmu_cache_invalidate
   mentions we'd like to "fix" the issuing of commands through the main
   cmdq and instead like to group by "type", if that "type" is the queue
   type (which I assume it is because IOMMU_TYPE has to be arm-smmu-v3),
   what do we plan to do differently there, given that the op is only
   for trapped commands *have* to go through the main CMDQ?

   If we were planning to do something based on the queue type, I was
   hoping for it to be addressed in this series as we've introduced the
   Tegra CMDQ type. 

That's all I wanted to say, sorry for if this was confusing.

> 
> Nicolin

Thanks,
Praan

