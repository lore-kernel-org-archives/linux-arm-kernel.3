Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4041C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdXV/8C/yQUJ8I+wtd2Z/G5iaXapJqIY6nj11Km1s7M=; b=wrV0NyDzs4U4oxtldFNUhiRdp0
	sN/cHh8Hq+mchriytXxzUvtl8FYvD9qj1DPqnPU/0JSadQu6skKPZkbmcL3yLBx7FD8GkQSZUnQZd
	ojC6HX4esebg1+QvLPkf4n0ln37gsoJl3AOe2jbMAmYh2Hsph8MSjmC9ABAuJZ0kxIZu8DOOcDc/f
	52/kHwwO7v2IMIV6EyzGZXZ4Pbg5dH9B+jxE1ijQIGsrWZG+TryqyBFy4HPlya0sgJbEBxBUORf2X
	i/UEtfYubIJ+g/QYW+hoP4iOVh3irgl2kXxk7epOLkvGEjUgjO/dsWvgH0oTb7nsbYs9Jl/62lNPT
	1fS4S95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9r8n-0000000Ahai-0CCr;
	Tue, 29 Apr 2025 20:01:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9q9G-0000000AbfA-3M6z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 18:57:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2242ac37caeso53685ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 11:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745953062; x=1746557862; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fdXV/8C/yQUJ8I+wtd2Z/G5iaXapJqIY6nj11Km1s7M=;
        b=E9T9Wn/aXFMeM23oeINyUSTA8schbgKIYcKzq/bSUUGNg6mOJP+JlCQoo24Nk0nFyP
         Ss3XBlTbw7HZk2JwVjPVgxDUr6t8HVsvI1dPybizFc231xEE6N9HvInuxQV7ithZjGB/
         TL14HZUqb3JBYXBLMmyAtXs2s6ALSt8ei2eZFkY8Tfxl0aLrCHX08QPx8hcsET5b9rze
         bR3k/POGzxrzdzrbDZcTOlUjnA9vBjG4j5DzpEYFOh1ZWywy4Vi1gXfNRJTit4ICnRHO
         iHfCpOme9o2T55gmSUcsZM6lHEbc0SUXCkJUMp0ZgOcOvlfVEhiQFn94MjDjT4dVNUau
         0BHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953062; x=1746557862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdXV/8C/yQUJ8I+wtd2Z/G5iaXapJqIY6nj11Km1s7M=;
        b=VBACG1Im99S8PHlgydH7uWU2WNMOBcYQZ4anoHzHEUmdds8GUSRgv7rg+5m4xFlnLP
         ggv1qqlggsapHC6/k3kKbJwaxhKjH/BOl0d/J2AGpVxqYMfAFyXiQNfNUGvWpGLvUc9I
         qA4KoVm9RSBgf6dSbunNU1iDtX2YKZkWDthW7q5QJ4Ip+23StnEMmDq/J/YbzsTPW1Dm
         CdQ6x8wW5GDE48pn6NAoISYwahodkEhV6M5TrAMSfobEWFRrLAD56HeVoXQoqpuWSfVn
         5S5Us0uTHESC89QuqeHW8D9IRQ31xlEZgoLUaMwbLeWmM3rcDSVo7jM2XP7DkRU/sNW3
         eBcw==
X-Forwarded-Encrypted: i=1; AJvYcCVbL5i+wzma19VRGEj/gnSvQv1C+SiwIiFmwrAy+CxIu1AMnqvO91n6gXk7QoD4fiyIJq7Pp0x2Sv9ku57QBgj2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqz0lzbinWD5IQOQ5B5lpUhQhlG1Iq1dH1D4P7J52oy5lpiSzA
	pi6nTj4MDAeNANVNrnuky1u8kO3nZgymsY/HiE5bN9WK1x579AllOLfBt1hl+g==
X-Gm-Gg: ASbGncszrZ1nVqVfbfZa0jImP45I097E1nudZ0sfz5EEiSW5Q7U+CPUTGura0VaGS0C
	mt1OcnrLMAAiz+/B6FePvSZzlnaI+mhJy2cHcEEBsaj2JQLsfPrt6unXJwEHa55JZ3cMTpVCf4g
	/opiEsP4hLVsn8nQvHklsO722b0RWA0DVLiaXR36rI943+2p6ZF5OcCQ/AtxNuTpTNdNJ9F1UUH
	0TxVzIsAbpYIo9MNDUVh7Xd8vGPV776UkoGJwIRpNb4EV+6cUcDyLTQt5bZK9Ttvyeszblbn807
	cxEHL+MtUnReEpTJO22e+2Wmr6mDAQLgp5HN6VO+6178MLVPrbplKX2/9TIW3Qexey7LrmM4
X-Google-Smtp-Source: AGHT+IGgXGpqrHCfuif7QcKDzCUp9vTefuXFD3aLx4LdLjCaDTVmYgt+1uOwojrpCvF02XNkiYlVaw==
X-Received: by 2002:a17:903:248:b0:215:7ced:9d66 with SMTP id d9443c01a7336-22df3f77b8cmr333515ad.10.1745953061819;
        Tue, 29 Apr 2025 11:57:41 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef097e0csm11594174a91.25.2025.04.29.11.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:57:41 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:57:30 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aBEhGmoh0E865PxF@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <aA_0TV0RkVOHk7Qj@google.com>
 <aBAEuP9962XweHPc@Asurada-Nvidia>
 <aBCNkcLp6XZpjYYT@google.com>
 <aBEWFw2wq40SHjTn@google.com>
 <aBEXJFnLalIh788i@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBEXJFnLalIh788i@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_115742_838752_7DBF4D18 
X-CRM114-Status: GOOD (  20.39  )
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

On Tue, Apr 29, 2025 at 11:15:00AM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 06:10:31PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 08:28:01AM +0000, Pranjal Shrivastava wrote:
> > > On Mon, Apr 28, 2025 at 03:44:08PM -0700, Nicolin Chen wrote:
> > > > On Mon, Apr 28, 2025 at 09:34:05PM +0000, Pranjal Shrivastava wrote:
> > > > > On Fri, Apr 25, 2025 at 10:58:05PM -0700, Nicolin Chen wrote:
> > > [...] 
> > > > > IIUC, one vintf can have multiple lvcmdqs and looking at the series
> > > > > it looks like the vcmdq_alloc allocates a single lvcmdq. Is the plan to
> > > > > dedicate one lvcmdq to per VM? Which means VMs can share a vintf?
> > > > 
> > > > VINTF is a vSMMU instance per SMMU. Each VINTF can have multiple
> > > > LVCMDQs. Each vCMDQ is allocated per IOMMUFD_CMD_VCMDQ_ALLOC. In
> > > > other word, VM can issue multiple IOMMUFD_CMD_VCMDQ_ALLOC calls
> > > > for each VTINF/vSMMU.
> > > > 
> > > 
> > > Ack. I'm just wondering why would a single VM want more than one vCMDQ
> > > per vSMMU?
> > > [...]
> > 
> > I guess the only thing on this patch from me was to understand why
> > would a single VM want more than one vCMDQ per vSMMU? (Just curious to
> > know :) )
> 
> It gives some perf gain since it has two portals to fill commands.

Ohh! I'm imagining concurrent invalidations / commands! Interesting!

> 
> Nicolin

Thanks!
Praan

