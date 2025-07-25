Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93A8C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 05:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJRrie+evisFjv3ojJcmxiW8N4BF+TiSqioS6un+K1k=; b=2MT0DrcrsPNR4uI++tGoTuM2oe
	OMEzRT8nLLfPylh9G5xFKVaUalcEMOddE42FwfEbYI4JEJz15yvKYETorV+oNN/teWHE7m9+XOxG3
	FtCoeDuI8k8/N/X5PP20s8JgAjoW6DDQvraXRDokg9dhgcFQgkjQKHkS/NrJNJonbD2aNKh4tXSAp
	qm48RwAc3mtE/4echAajqsoMiOVxbaB0Jp+xgyj9DKbJDF4E6U6LXJyw8HSQ6kN3wlJgfEILUH+9z
	rFnfk8He24LfyWg4ssPgpyxrLou5UdiiRWI/KOZ0FefuxAS2lbLPTjoS8Lc2V3oz8pf7yvS4dfMyz
	nz011FfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufAka-000000094S0-2pP1;
	Fri, 25 Jul 2025 05:13:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufAiA-000000094DF-14Ii
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 05:11:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-237f18108d2so115685ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 22:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753420273; x=1754025073; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NJRrie+evisFjv3ojJcmxiW8N4BF+TiSqioS6un+K1k=;
        b=dbfmKY5TwIhNCG1/01d+vTqIy+XGwEMG/TUvNrksCfFMLglvCF765Avam0JKUnvMdJ
         Cj/dWehsIjBqcjdTXDSmp0Smck4dcs7nmfk+Der6WnCxrJoImCzyXyGjNmqykDdNgZa/
         MHogP/HJ6QykhOBGQpsXXVi2szH+BS+AZnMoKbJtnvcnLU+g3/JJtIdfV+uecRzoFvm7
         eDajxeQkNZVkqosfVrSwDOlHDy7EzfH5cIH8Hr5IXLHKvmH2KPawGZERX/iBTAnrHYhL
         qK3ZQrDn3KHigByeVOr1R20PHioUc+B+Y8gkgWXgGUtmT+fKrJ/ACDqLxhrFThtWbBul
         01HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753420273; x=1754025073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJRrie+evisFjv3ojJcmxiW8N4BF+TiSqioS6un+K1k=;
        b=H42d+nWkGM+rThe7fZR5BANS2U7vsq0/YVsb07zswEVRYBTbvfOTn97bW4Bq3q1D2N
         kRT3cRMZwfzXztrWSCD/4/yKIIgldB0ox0qefcV5LVEtNBJVy2siV1zoMvvZs1XdKNhA
         XVVRMp0a0TGmTJ/mtRscKQ2lA9suAgQPybAw8ZPg1a3fXkf+w8KpajIam3CleuyjWz6v
         +SyVdPEBbmP2LjZ7u7ke6lds+ORgBY8HgW19GU28r6c5vuqPNHM25WLTZ4gOl2cePXjt
         ckxWfbI6eHfHmFs8ffI/j+HYwO5K8MeKxaG0bUEKPVXgoFjQzRpTAuy7GVG17wfgO7sM
         oILw==
X-Forwarded-Encrypted: i=1; AJvYcCUcSde9MTJJbo26otbs+wcYjqpMBrDR52gd3OoU1eSZU69SSwC7Axa7DN/qQp4+MoPCHogZG0iSTnj2341NZjyK@lists.infradead.org
X-Gm-Message-State: AOJu0YwwZfEXEPXiVJFfg1Mw74nmqo9Cb/VcaUAvVIV16t8UjpD94ZAS
	lCNjjYeVWKXt2YM0J6pfsLk6MdeqhaunDm1x7WHKqPaR+D9OUL67++E3aHmnCxkA8w==
X-Gm-Gg: ASbGncvira6Dv8lq1OwA9Mqr1TzaUUK/c80BLejzjKRs0MLjCzEggBHEa4k91WQqD0b
	sT8nQs+NBle1mueOBW0I76sl9ag++DU4EHESDHC64AGu9f6FTbiVd6omRzxxA81s27RvSDMtA+h
	PnTl93CNZdu9G3stZp06/87/tbCRs4lsQ2wFfaVWPuAliAfDhXpn6+KJWYoJiu4gl84YEgOcCxm
	bZxfLvEfn+ZN6UT6PVULZAZEFMWb5IylpTR8WBtR6WkZeePFomF9pX3a50TeDRqN91QQ7HubqJv
	gFjY7bBdUtoGz47/aNXb5fRndP2Uaaw0/+5SKlqThQ3zz7Qa5CVyW87W3KBRzNMf/7XpomQqbt9
	ER9PcIfHM4abzWW5zOjACizNT+XPVHHhLfL84aVByBaW9k46ir6cyoL8lZsG09PyQeWk=
X-Google-Smtp-Source: AGHT+IGG4QZQwavYhcLFszK2mSaWOfTBLnCc2XFKEIjBG7genN2zVTCSUApFR5trIV9DREmiDkhIQw==
X-Received: by 2002:a17:903:4b04:b0:23c:8f12:7c4b with SMTP id d9443c01a7336-23fada582fcmr1953485ad.10.1753420272915;
        Thu, 24 Jul 2025 22:11:12 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7630c947b6fsm575750b3a.33.2025.07.24.22.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 22:11:12 -0700 (PDT)
Date: Fri, 25 Jul 2025 05:11:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIMR6xxR3Jdpy8kX@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
 <aIKd1owebUNQeN1-@google.com>
 <aIKqaGMMpsIuAVab@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIKqaGMMpsIuAVab@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_221114_288956_3983B4B9 
X-CRM114-Status: GOOD (  23.22  )
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

On Thu, Jul 24, 2025 at 02:49:28PM -0700, Nicolin Chen wrote:
> On Thu, Jul 24, 2025 at 08:55:50PM +0000, Pranjal Shrivastava wrote:
> > On Wed, Jul 23, 2025 at 06:58:20PM +0000, Pranjal Shrivastava wrote:
> > > On Wed, Jul 23, 2025 at 11:05:26AM -0700, Nicolin Chen wrote:
> > > > On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > > > > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > > > > @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
> > > > > >  	phys_addr_t page0_base;
> > > > > >  	int ret;
> > > > > >  
> > > > > > +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */
> > 
> > Sorry, if this wasn't clear in the previous comment. I meant this
> > comment must be updated, the "unsupported type" wasn't rejected in
> > vintf_size, rather the type got corrupted which brought us here.
> 
> Any unsupported type would be indeed rejected by the init op
> callback. There is nothing wrong with that statement.

The comment mentioned tegra241_cmdqv_get_vintf_size() which isn't the
init op. The statement: 

"unsupported type would be indeed rejected by the init op" 

isn't the same as:

"Unsupported type was rejected in tegra241_cmdqv_get_vintf_size()"

> 
> It indicates that we shouldn't see an unsupported type here,
> unless some serious kernel bug like data corruption happens,
> which is implied by the WARN_ON itself.
> 
> > Had the
> > vintf_size rejected it, we wouldn't be calling the init op.
> 
> A data corruption could happen any time, not related to the
> init op. A concurrent buggy thread can overwrite the vIOMMU
> object when a write access to its adjacent memory overflows.
> 

I'm agreeing with all of it, it's just that the comment says something 
was rejected in by the size op, which raises confusion as to why we're
in the init op. The init op rejecting something due to data corruption
is a different thing..

I totally get the point about data corruption, i.e.:

size op -> returned something valid
<data corruption>
init op -> rejecting corrupted type

Wheras I was just trying to understand a case where as per the comment:
"Unsupported type was rejected in tegra241_cmdqv_get_vintf_size()", 
i.e. ->size op returned 0, yet we ended up calling the init op

I guess I should've been more clear. Sorry for all the confusion.

> Nicolin

Praan

