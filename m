Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E177C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 23:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31m5VALjhSZCUtaamU81Tt7LVwzdmFjl/OH4isUf0T4=; b=UXXrc89YFH3NWVc/QLX3+Gj/rj
	HAOM9me8++aJXrU6kr2hCuUYw90dQJilgvXUndz7+T7Ct58U5onaf6/syTZ2H1X9Ej6L0THGHO0Dh
	x43xMOJ/qOxtpicyyI8uoBbvkGLeVrYvkAKfyjuXxbXyB//6TFTqUWJrqnj1zPA4vDHMXVZotgUy7
	8dtjrwz7+YVDeY8rphRDBg0Zc0zFaB0pjGgzjD4c4nA9jJfuDXoTJpEaThLAbAGhVkngIMl6tt1Xv
	/LsXK8GGSxaQazHlJX3QMhnB0ulxYRuoDy3e2tNOjHBgk4t2t+hP27BTbuyMcvg6RtjGLZOYzNcQg
	xOUJwtWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWkAX-00000006ps9-44dk;
	Tue, 01 Jul 2025 23:13:41 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjp4-00000006oEo-1p0I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 22:51:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-235e389599fso350335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 15:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751410290; x=1752015090; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31m5VALjhSZCUtaamU81Tt7LVwzdmFjl/OH4isUf0T4=;
        b=LTCTleug25jwpZPhfDZPDKXakQCcRe1MXnQOnH8jLxzRbWJ2ioDQbiSiGvO9LFyeGJ
         eY17MmDJvpd2100aqjK+3VRCaIfXrtHCqWY3UmwADl+Uok+6qGOGclAq/eUEnxnZVBqP
         2qKNc71PVlNQU+ZP0G2pfNNKGxKqG8jIidny4IIM5JnmeIY6U5rmPPWBqoB+3jTuGECW
         Gsy6DNHo4BsrQI/jbV04ZESfuXYLNjdfxHsgPM4EFugDwPREtrQDOQmmwaIarSr3D8hD
         IZjcL16kOUoW0EBapY3pjZQ1YIkrufbGEA/a3jBWi4e+iaU8Ohw2c71oPkatbnxhbuHQ
         OQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751410290; x=1752015090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31m5VALjhSZCUtaamU81Tt7LVwzdmFjl/OH4isUf0T4=;
        b=OWR6F7Q53pWAHEq5oPRNxL5u4GCge/WQY3j1HJy1QoUUkAqoDAd4HyQC9vtrDA+wL4
         PaNQHfwkzF75u8qXDD87kDcwI3mvImGW7AZ94sZ6rWfmNGLHw7l4IvsAvnDY3GdmsGjC
         OHaGeta2NkiuAaeR+Wgw48Fd2ZEJh44mYwhu3FddmnFy+unvd4qKmddTlHSYljW3tLSH
         Dow4Cci2Mt/SqU7zm61q4rZjShKtFv/tdC8h8Ah+x5j/a4+qzNbxhR0oP1JoJCBPOOQ3
         OaP3NLYfmat9+2aROyTyvCekXU2QeRcEMQh+JWhtpxhg4Z5JfYP813LtxAGEht2hoxXS
         zw8w==
X-Forwarded-Encrypted: i=1; AJvYcCV+RhOX4bC2bPa1JeJXLgIq+lulWyE7/kstLhJEumrZpVFV7nD3ae7TfC48Q5n0sSNMJS4nkQbqfFZT/2VrNhU+@lists.infradead.org
X-Gm-Message-State: AOJu0YxMlXVjcMVm/dL2FK7Pjk2tvYSLw69hueS/uYcaEFu++fwm0Ftk
	GSu0g2T7TQ3jYEhsbqUT6LVngXzE+MPnWZrMkHB+LbrPivyML++yMIp7DJNv4DyRbg==
X-Gm-Gg: ASbGncsZ4Zu3nrjEKd0NZvVtQbW18q9dt55vmfcogkWXPRrpViWXZ3otJO228qBEVgn
	te8pz68tjDWFA+RghedqAaxjyrMLQHNS0e+dRY8jCWJj19gYlliW5Tk0YOrS0m4DvsLEkuk/A93
	6vXh5vJ0AFOf1Nu9NWj5I+uS+BCFASw8XQCchhDl6wTaVD8u9kf4JzILVwS7lXha/SbwP57HsDZ
	UBYj4AF6kG5E6kagpA1eI3k/tEkA6OwVDipLC8xVwGDZc4SUfwrRU847iCji317hrMoov7uaets
	z1HUGQA1F6Y2eEpIKitbGwtPw9FFIOzz3q424btcxvIBncSQEZa7gpjMzFcZp/YHjYpxfNIOwO5
	Wfa+N3iRHQiIshSZIIrQv
X-Google-Smtp-Source: AGHT+IE2A3LONQdf5/UDXdamM9j2FEbJtnYf58bee8GseWxQ7r/tyyPKLeWd6GVOe4rd8pReDprYsg==
X-Received: by 2002:a17:903:40c6:b0:235:e1d6:5339 with SMTP id d9443c01a7336-23c601c954dmr3764925ad.26.1751410289353;
        Tue, 01 Jul 2025 15:51:29 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5384107sm17193429a91.5.2025.07.01.15.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:51:28 -0700 (PDT)
Date: Tue, 1 Jul 2025 22:51:20 +0000
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
Message-ID: <aGRmaOORg-YDfncY@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <539ee2ec112162abdba511574e2205a77b425059.1750966133.git.nicolinc@nvidia.com>
 <aGQGm1-i4M75b9Qp@google.com>
 <aGQ6KCI9OZEwHdxS@Asurada-Nvidia>
 <aGQ_F7Qx3scbbA-J@google.com>
 <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
 <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_155130_495047_7CD1F42A 
X-CRM114-Status: GOOD (  16.77  )
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

On Tue, Jul 01, 2025 at 03:07:57PM -0700, Nicolin Chen wrote:
> On Tue, Jul 01, 2025 at 08:43:30PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Jul 01, 2025 at 01:23:17PM -0700, Nicolin Chen wrote:
> > > Or perhaps calling them "non-accelerated commands" would be nicer.
> > 
> > Uhh okay, so there'll be a separate driver in the VM issuing invalidation
> > commands directly to the CMDQV thus we don't see any of it's part here?
> 
> That's how it works. VM must run a guest-level VCMDQ driver that
> separates accelerated and non-accelerated commands as it already
> does:
> 
>     accelerated commands => VCMDQ (HW)
> non-accelerated commands => SMMU CMDQ (SW) =iommufd=> SMMU CMDQ (HW)
> 

Right exactly what got me confused. I was assuming the same CMDQV driver
would run in the Guest kernel but seems like there's another driver for
the Guest that's not in tree yet or maybe is a purely user-space thing?

And the weird part was that "invalidation" commands are accelerated but
we use the .cache_invalidate viommu op for `non-invalidation` commands.
But I guess what you meant there could be non-accelerated invalidation 
commands (maybe something stage 2 TLBIs?) which would go through the 
.cache_invalidate op, right?

> Nicolin

Praan

