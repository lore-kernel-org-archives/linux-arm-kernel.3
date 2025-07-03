Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D9DC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvzyiHvZKWRtHA7KGz4JH1KLn6i77WWlalz4Eq7c2XY=; b=RD1L8J4rAmJHSn8XbkZTzAgdBX
	+QGHw4VrKvkbYCWdRty/EzchVQL3KT9rlCnP5TRKo/kPN1/TGRwrzWomckZypJ4biOvnWffqE2cAK
	VXGKmm4uCuzUBbL1EdJkomBm954q2yH05vk04Me+eVohT5NulQU5lydwhYhsf9Mbf7hB6vVOAvM2e
	tz0MtQ6/TsMFZqC04Cl4lv7QQyYWTAdkHXbhOIUxU/cg5YfcaRcXssRDNg75NL83U9JW99cxHtnuk
	T2RgdfY575Qc7wLxM+jbx2vtExsd7DLeiGP6VxtJL+kc39dqwzZbVKzu6GL4LiMYN60VMCb9djTY4
	KDdg4/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSQA-0000000CjKo-2OIO;
	Thu, 03 Jul 2025 22:28:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOzM-0000000CHIu-2hhz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 18:48:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2357c61cda7so192975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751568532; x=1752173332; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvzyiHvZKWRtHA7KGz4JH1KLn6i77WWlalz4Eq7c2XY=;
        b=zBz1e9Cm5gryzxTQf98hiXB03usKQeaZmY8EIhxoofbTQ87zfsGamYnQDcr0c3OPyx
         L6eWd4lUNBBSa4umHPM8UzBgrg51ApiO2OS5EmumkPBUIqi9K8GRKEexiGZD8Vd6f5go
         4fq3+im6ZkORZJuieO1ER/NkV2N2VRedwZlTSPYCGJ7G35boSVTY1atMU5h+QKazeeRh
         b70zpjJHiZCH0vUMwDyF4JXuI5Fb+aOi1o5wSZXT+XoVZBWQKd5DSj9/C0s/6kPCWsxJ
         kP3vRRMXZZfUZr6FkjeWSwrqUnxJuvYI0pQOUjLqn41Qz/m1sGvgorfg5yMjS9TSW0iY
         Xh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751568532; x=1752173332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvzyiHvZKWRtHA7KGz4JH1KLn6i77WWlalz4Eq7c2XY=;
        b=i2/xeEfx3Muk/aNBRT/Blu/mPcEXu8gTYuIxgSNZH6cbZBpC11bISxuZHEMczrNzVR
         20PZmVxAvuLpEYKg0XmRfSh2BNprt0YSXGmg2FEidyPeR2tySPscHzwHRmVkXb4IbTr8
         58OAFaq/du/9FSGLJZi6RcbF7IxEUFtqVjtxwSScyNmqpZRUERHYj+nK24H6FZ108KaE
         YzuGiMBd6I8xFjEGFVGJ3Cc/LWgJ100UBUmYst3UxmZMTwf9gWcEcO/y4Wc6tACiKIdx
         JKLkGNiHLGGnET1aherq3JCy4pgmeDbKizwIjiUCA1pHiizIe2/dlbxtVTVSF9lAoEcU
         unVw==
X-Forwarded-Encrypted: i=1; AJvYcCXsUeE1M54J3GIMz+K09+ZO0dhO9YEJMwodPJo4/2fOMBWoEITMMHk9ECYEPBHIxg0fhS37topBC8VsvgkUWpfT@lists.infradead.org
X-Gm-Message-State: AOJu0YwEwTixOjbfkkW/xBCRs+HQJ8N1XiMTxwCOltcG/1W0gtaTWdEK
	iiB1ndqG5B0Cu0AMaWG/v+XYb44nHTFWoWIRi7eCd3kfPhol5GIpgWE+S0Twy6PmYA==
X-Gm-Gg: ASbGnctSzT9qprIxa0soezRjY6T3wI4qbWBmzUfx5fBtW77Xz6d1T+qVPCUcHg0tcRi
	FpU7PzqZUKuPIuJhyMyzu9V45siqKV4xGInxJ5dKalrOt/VsebJzLesgXW807DP0YTyCyRJrJaH
	ux9/UQKv4xd1hbEcUiqI1UDx7IJU2MzXzd3n8khXQw0qmYbqpG/HWVcIEtaH9gwbGpXS1xA/uYw
	5HX757ncsDtxOoA8WlKsMgelfEyYC+6rCAA4S+6w2ush9diMHFz8680ShqlsSLohvmQv+G9YH8j
	Ac00r+pNh0WF3iutniezGr1GIlzjUDWdSr5rtUPc+hlvFNMNyzMuJLm25QCd+HuDTeiKpG5F0K/
	a0ZR0X7yZnlkaVrdhgecr
X-Google-Smtp-Source: AGHT+IFuOFQYDWLy9dMFwm2BVYD/G6HSHUIkq7TbiXmhTvbZxzCpO4493oWkzZnsDCA2OiWThdj2eQ==
X-Received: by 2002:a17:902:d582:b0:215:65f3:27ef with SMTP id d9443c01a7336-23c79ada924mr4107505ad.12.1751568531582;
        Thu, 03 Jul 2025 11:48:51 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a381sm1926105ad.20.2025.07.03.11.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 11:48:51 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:48:42 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGbQipeSn0aZnwZU@google.com>
References: <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
 <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
 <aGR55PUBnwb8qT8U@google.com>
 <aGSBTpY0nkdp2TTL@Asurada-Nvidia>
 <aGSNmf5Q82xEbDpX@google.com>
 <20250702180541.GD1139770@nvidia.com>
 <aGaXqwzfLwsgCH6n@google.com>
 <20250703175532.GF1209783@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703175532.GF1209783@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_114852_704354_5A95545C 
X-CRM114-Status: GOOD (  21.99  )
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

On Thu, Jul 03, 2025 at 02:55:32PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 03, 2025 at 02:46:03PM +0000, Pranjal Shrivastava wrote:
> 
> > Right.. I was however hoping we'd also trap commands like CMD_PRI_RESP
> > and CMD_RESUME...I'm not sure if they should be accelerated via CMDQV..
> > I guess I'll need to look and understand a little more if they are..
> 
> Right now these commands are not supported by vSMMUv3 in Linux.
> 
> They probably should be trapped, but completing a PRI (or resuming a
> stall which we will treat the same) will go through the PRI/page fault
> logic in iommufd not the cache invalidate.
> 

Ahh, thanks for this, that saved a lot of my time! And yes, I see some
functions in eventq.c calling the iopf_group_response which settles the
CMD_RESUME. So.. I assume these resume commands would be trapped and
*actually* executed through this or a similar path for vPRI. 

Meh, I had been putting off reading up the fault parts of iommufd, 
I guess I'll go through that too, now :) 

> > > The goal of the SMMU driver when it detects CMDQV support is to route
> > > all supported invalidations to CMDQV queues and then balance those
> > > queues across CPUs to reduce lock contention.
> > 
> > I see.. that makes sense.. so it's a relatively small gain (but a nice
> > one). Thanks for clarifying!
> 
> On bare metal the gain is small (due to locking and balancing), while
> on virtualization the gain is huge (due to no trapping).
> 

Ohh yes, I meant the bare metal gains here.. for virtualization, it's
definitely huge (as reported too).

> Regardless the SMMU driver uses cmdqv support if the HW says it is
> there.
>
> Jason
>

Thanks!
Praan

