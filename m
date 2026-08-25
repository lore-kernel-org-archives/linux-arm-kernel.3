Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496CAC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCJ1xkQLO3MSgQZs7mGkGgaw4XAmZCjoHaPeMHZ/TTo=; b=o8Yz7ST5OxogcBm8C7EJF+24Z6
	FYkJYso4+IzEBrHysnqT6h+fjHaQxTwPe7FE4H8zEE2NzhJd0pBkIW+zNs4TfY8D2QBTGPIGdZvYW
	gn0NUx8MIIn4mORgKLycujchpW18Ou0mLMvrP5PC5Hx1o0kX7aR2IeP9JVGbiwhKagtyCyQaZz2tf
	L+Q467I8qxcFvpIz79cS9KO8QY7o4poRhwUw9Kd2Lo1PJ9Douv1lweX39fK8mNcFh8npBVcZS9nMD
	qlyW2Dwe+zz5W1e4eb0K4DwkNB7XtFEz8YtmaYQMvFPrkPnVXXkWfponVep1MdGK8Yh7ZMQ5SrEKR
	RtD4LCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvXU-00000001Gg1-3R00;
	Tue, 25 Aug 2026 18:06:24 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvXR-00000001Gfb-3m2B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:06:23 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ccdf36f63dso14555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 11:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787681181; x=1788285981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vCJ1xkQLO3MSgQZs7mGkGgaw4XAmZCjoHaPeMHZ/TTo=;
        b=wgfcdrW0zvlDVvxPusQxuULISaLHwgc1NtcbtXAZyozgV8ICBGM/L3eZSoB7GXDbS7
         ztYE+YqBbBRK63Ia3j4o5mzNGcEw6LfZKKGXWuYvvo1NIXA/vMjr3ioYGZYkB0nMuZ9F
         1O/igxa1c0UM7F+25bmBqBstqNng/TzzBGYVJN7ZDBQbdS+jQ3zp+WBhtjHpBp5UhO0F
         iEM5EycVFxjhwYpEof8SekCp/Qc2jZo1ne5tWGN6ANJ2MN19U/qsepZ9VBPLL2XEWUMe
         02gDXwntA0QN3S/WIJ058EAUbsuSs4KI0qDPU4wVneIJAwro4QMOgfiW3gse+sPe+P8i
         bXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787681181; x=1788285981;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCJ1xkQLO3MSgQZs7mGkGgaw4XAmZCjoHaPeMHZ/TTo=;
        b=mgJnxvRx4o8xCJp+IFESG067V/RXDD4jbu5+QhCAVT7ffXTUJpDIsUbKULXRpE9Tg9
         m+hrL65eWJfmeSOGm9HT79IbG1I+3oYI31Ptz1onv7pbl85xtEX7F+SHBKaLk7UAvT/X
         ZXdHJ+KbF+opYWRipumeE9AQL0KXy6CSh+jVCfFdbcemI3KzZJ1c7BBkgHnjjNQaJH5S
         iz1Zq4MRMNW1/GM5OuJFx+3XfAi12i7s0devCNSFhBm1NnO3qAI4lnS/BvLaBtJTFCbl
         r4EmoSgb++WQkPPnHVH/OWLfHMEknunLizxV0SNsVJNdWEpd+ga+PcEcQuJNwQEllFd6
         Os0w==
X-Forwarded-Encrypted: i=1; AHgh+Roa/39gwS3xKyON8TqtsEYM8wdXgON/TGjg0x7P4tTaK0W9OQ16GhkIv9mydcjq4LTMAhBlPjqj7Z06XpHPDAXt@lists.infradead.org
X-Gm-Message-State: AFuF++k6serVYxJ2eC7DR7D9dz+3zP10aSS0oMgM7i6uf5Mxb+OBcLTC
	qlapay9OXffRI4R1l6JjVstxxyOVjii/Z1zEGRg6PWO6DSxczHimsjoIg1lFPQeo+A==
X-Gm-Gg: AR+sD13zxfVoYz4KBOrcWvYtVXnGhttkjXWBMpIUfr84zXn5lxzlscmZjXp1u3Pnvku
	5bC+Ed/noqLCOyPuM7r2ozltKVRCItSyeKN80QEMpCIXbhA63b1C8qB1QDi5UkV8cCorc4AMaS9
	JQdc0jsspnHyDXpSMH5hKrkSLpy9fR3Tw4YbneUcGWyfzciSHVpVYtLbxxGPBCtPIDYiHPTTfQn
	lbOl7uMOpkGn99H5wy/Eyk2WmX1fRsmtrFMeCWXaZsy6Ld6n3mBJOrSUTZHkvdVTskonPxH1ZEu
	34Nb8razC0VdpZvqAt9MDOouF6MEoKOi04uVeS5BmztCq3Muj+ZXfzIRCWfm05a9pk+vS5NWL6U
	P4G9NWD+B6sl2uOj9le1NoMC6x760+fm+W/pHj5LAGtSDnADwj8tTGPd+lnp3A+wqwjT6cd3TFm
	SE9SE0nfEYGKSXmUtABGoFvh1g+43tu65nhPa6Ex/NIhRRZPll8pQO/1F6xmBwDx3ImGRLJVFJE
	UdzLJDwKY/LyP+J4tLemQ==
X-Received: by 2002:a17:902:f645:b0:2d5:db38:8012 with SMTP id d9443c01a7336-2d707c0662amr23845ad.17.1787681180219;
        Tue, 25 Aug 2026 11:06:20 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b3a49bsm4631775a91.6.2026.08.25.11.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:06:19 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:06:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 06/12] iommu/arm-smmu-v3: Handle gerror during suspend
Message-ID: <ao3ZlVVwzDkWkuvn@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-7-praan@google.com>
 <178767577113.3356902.10872241669143339312.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178767577113.3356902.10872241669143339312.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_110621_943033_D7A238C5 
X-CRM114-Status: GOOD (  14.06  )
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

On Tue, Aug 25, 2026 at 01:36:11PM -0300, Jason Gunthorpe wrote:
> > The GERROR register's state might be lost when the SMMU is powered down
> > during runtime suspend. Handle any pending errors before suspending.
> > 
> > Refactor the gerror handling logic into a helper function and invoke it
> > from the runtime suspend callback after disabling the SMMU. This ensures
> > that any late-breaking gerrors are logged and ack'ed before the hardware
> > state is lost.
> 
> The commit message isn't clear, this is just a refactoring patch it
> does not "Handle gerror during suspend"
> 
> But the refactoring is fine
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Though sashiko seems right about the pre-existing bug.
> 

Yes, we recently fixed the pre-existing bug with this:
https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git/commit/?id=eced8058c82a

Thanks
Praan

