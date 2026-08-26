Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458CEC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 11:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRzukAECeVcAvfomTikVToUAi6wUjRV3nv1Wl0VWz9U=; b=RpVyoHQY0wDnXktUOamnW5uxcc
	HC3l7YWYH+RqGGQeRHTvLv9gpulRAJAExSS4b7YHkO+JtkHMQCkOeGRJnkKMn8lTe0BAFMoYxePCT
	ULOenPbxcfSEtcgCIDAKhljycehBjURcg8BhdQ3V+UJIfB71b58NfKIevCYq5LuUAz9Ddnza2G5lC
	l2Yxynj2x7fIgg9MoAnlByTiBCwAULXSrX0dCq+2vBjL4UEXQGUl1N6/IuPGL93s5XEnot882RS/1
	tMpxZ0tcw6ZlD9C3qhye74YCIr7dZ1twNgnLGNgsOaGjgxSHYuAvdB5GBykO8H7DzDEVGERJfcyos
	NXdSF7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCEQ-00000002Nfp-2uGW;
	Wed, 26 Aug 2026 11:55:50 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCEO-00000002Nei-0wCZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 11:55:49 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d3b440b97aso89515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 04:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787745347; x=1788350147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRzukAECeVcAvfomTikVToUAi6wUjRV3nv1Wl0VWz9U=;
        b=GPIHG4m8E+I9XzjJHzBSC89uFp8eRG1tMG/XKjlJVqdAqDENRiJTRq9wM4mIgxvInm
         zwunZcMROYzUEAgZIuVX3MVEydsT4KOukR++QFFaCZII5CYp1S7XyVDoMhf0bM2zfgaZ
         bMXbf23GQs5P9YmXNnQi/JyW5XNzVWBiFEUl0o9G9a0AZqLMDqiFYcgvE42uUgALW4aU
         B693W7qhrMoyK86Bux6VVlHqdbG2Q18p0zGqRRYRYZqwJqTujpfT44mnLhapUiqfSiWZ
         wxj5C7x4toRCrOCEL1eCgCRlvywJmqpLT4QJnvXZDxvAAxfAyBFiS9rhgmGdTRK35Q+z
         m2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745347; x=1788350147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRzukAECeVcAvfomTikVToUAi6wUjRV3nv1Wl0VWz9U=;
        b=S7QTwT4+cl0GE3bzrGgTXP6CugqOlSJBU6hJp1QdJ+VwEh/vcjl+Mxk1ajG0oSZmVJ
         9LSsLRS2BUluKkA7RyExiiGOEp6R1IyXT34vRP9bvSYtSV5UVo5UXb8XILq/5rTZi3ft
         6jdnzjtMrXKSOuqXJYjmO91KLG00qsk1bAYyQcO1XGYo9qvEsaU6+vTMJY/WsuOMBXLw
         DJay7b07krlSCgz2MKDFufe09bip7m8YhCcm9amoQ5d7dnDZEktkgbqw0udgXPO2Nz9d
         Fo9wDOjo8fBwbwfL+KwskEWXgd9Pywh1hTBc281R6TYNJ6pWvLoQuJZI2Ttt/KkpZv0w
         Pliw==
X-Forwarded-Encrypted: i=1; AHgh+RqtQOAszZRD3qnLfxxGEgpYhVfEdLkhQ8OXC4gttPjbj+1iuDUoTwOWz403KQfQjJwheS1TjzME6sVGjzXyjzbq@lists.infradead.org
X-Gm-Message-State: AFuF++myQWP32NXIN3MxmQCdWbmVSOpECu2lUjor+VENAuaE2+1d1ggr
	8inkYdIO4m4Vzu8msQJqwilj05ujWjaUl+7JipBBy89W2CW+Okg/27ZaJXJ7CNzNtw==
X-Gm-Gg: AR+sD11N3iIbSEwBtoA7kEgAehfeypJ/6cAjHUP4C66/qRYksQ53+BAlDImCJqs2ba/
	L0b7T1ye3Xn/78PiuGnFgY0yV0ABrW6H+2SeTu/9zcUe5fiPA56N5OEP+yMJSGEPSVwa3Ow5WS8
	tNttmpcQWaWENHzJBh7rSat8HxBPSLSxpfFzk2gstOtF6sBPLE1omFxnGO8uGC1psqFaIBHQWBV
	IipsuC+WVBeewlMSh1FaMKdeEzoD26tnXdgxb5OQwL2N+kGTtdyQpzesKQBgSob74ae0kU5UQNR
	Hp4ArWgJ9N7GBjbRYx0RSJ7Gw95i1QowYkv9H3OviOHup3MWJbCTHaYQeMburqHmxQHFbAFRpf/
	I1rRqVd5V+/OS8ugKmds+WA050SqdJWGTxCc/NSSxA4HdknV8KkDt3sL0WCnGHaYkW0QBL9xIVB
	0uv68e3cS3XkncEWqpARVp4rSzeSegDefyGJjDN5gpZYOt5jGAuNAkorymD4zIVP7ybwY5+IZcz
	O4PXOj20XwsvWBbRp14XmlazQ==
X-Received: by 2002:a17:902:ec83:b0:2d5:db38:8011 with SMTP id d9443c01a7336-2d70bcdef94mr4704305ad.16.1787745346622;
        Wed, 26 Aug 2026 04:55:46 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beae5b51sm828751a12.3.2026.08.26.04.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:55:46 -0700 (PDT)
Date: Wed, 26 Aug 2026 11:55:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 00/12] iommu/arm-smmu-v3: Implement Runtime/System
 Sleep ops
Message-ID: <ao7UPKsHiwAFk5BF@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260825133342.GA3332773@nvidia.com>
 <ao3j5FFfKQsctV4r@google.com>
 <20260825201454.GF3325090@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825201454.GF3325090@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_045548_313197_EB3EB08E 
X-CRM114-Status: GOOD (  31.80  )
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

On Tue, Aug 25, 2026 at 05:14:54PM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 25, 2026 at 06:50:12PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Aug 25, 2026 at 10:33:42AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Jul 28, 2026 at 09:09:16PM +0000, Pranjal Shrivastava wrote:
> > > 
> > > > [v9]
> > > >  - Replaced atomic_fetch_or_relaxed() with atomic_fetch_or() for
> > > >    correct ordering while asserting the STOP_FLAG
> > > >  - Moved arm_smmu_drain_queues() after the cmdq->lock wait loop in
> > > >    runtime_suspend() as per feedback in v8.
> > > >  - Refactored suspend sequence to use arm_smmu_disable_irqs() and
> > > >    synchronize_irq() for safe GERROR handling.
> > > >  - Fixed an off-by-one error in suspend polling timeouts.
> > > >  - Dropped arm_smmu_cmdq_can_elide() check from inv_range
> > > >  - Renamed arm_smmu_cmdq_can_elide() to arm_smmu_is_active().
> > > >  - Removed redundant bitwise masking from owner_prod reads.
> > > >  - Added comments to explain locking, gating and elision better.
> > > >  - Added comments to explain secondary cmdq draining and gating.
> > > >  - Rebased on arm/smmu/updates
> > > 
> > > There are alot of scary looking sashiko remarks, are you planning to
> > > resend this with some of them addressed?
> > > 
> > 
> > Yes, I was first hoping to discuss them on the list! Thanks a lot for
> > initiating that discussion :) 
> > 
> > [BTW, I'm interested to know if you used some tool to pull in sashiko
> > feedback in your replies, such a tool seems helpful!]
> 
> I have been testing 'b4 review tui' to help my workflow. I have too
> many patches to review and I'm trying to move them all into b4 and out
> of my scattered mail boxes.
> 
> If you setup sashiko.dev integration:
> 
> [b4]
>         sashiko-url = https://sashiko.dev
> 
> Then when you load a series it just automagically shows the sashiko
> stuff (press f to expand them) and you can easially quote them when
> replying.
> 
> It can be a bit rough to ge there though, you have to get a series
> applied to make it to that screen, so eg, the whitespace damage here
> made that a pain.
> 
> However.. I had AI make an AI instruction for another AI to use AI to
> to automagically fix git am conflicts to get *something* so I can use
> the tool..
> 
> But I like that the patches end up applied on a check out branch and I
> can poke around with my editor too..
> 

Ack. That sounds interesting, I'll try it out! And sorry for the
whitespace issue, the --fix-inplace is notorious,

Thanks for sharing this!
- Praan

