Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFF5CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuVWL3qbkXapYyfqCRAnxTJht0rUeRn/WTlX9sDBumc=; b=latBae8VEtUlpKEsG7ukt1xKkO
	Z0AtI1bK1ire3CvKjKRSB01w5A5WSsclwrx/SEkOmMUJaaWUVZn9BBkzZ5ScQ9ILUW9LiOg+twc4e
	uZVTDTRqPAlU6Oiuy2SbCvJFc77SmP524SqGrLEp/gD57GvMPT6U3X+K2aaJdBK/d1ky4iSQJiENG
	7bzuyySXddUW1MOmDJvu5ihnfZ5wuB4UOWcIww4ZfGSpbRwraAHLEllL/+mFVSUfqhDJnZKpKFzWj
	fCNP9gqq3OmEWcLxkeUyA12EGbajqWuphanUtkephL6HZ+LvonRvha5RscCRpzEjMKoatHQ3O3wiP
	AjCpKqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCuPE-0000000D8Wx-2gmd;
	Sat, 03 Oct 2026 07:43:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCuPC-0000000D8Wo-45ch
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 07:43:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27A894400E;
	Sat,  3 Oct 2026 07:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C942A1F0089B;
	Sat,  3 Oct 2026 07:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791013416;
	bh=OuVWL3qbkXapYyfqCRAnxTJht0rUeRn/WTlX9sDBumc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MIEh6Ewfj1P/V3nZgJJZEQ7SbVJSEEXINTC/y8Ikkz1fzLadV6YRok3+qL9057lmO
	 sBM7r6wkFDIVJpy+S/D2qkhV3ojpzx+2AauTnt/8XUlboHVJmcKZAFA0T0FKRIh41d
	 VfzUrc+uxESdnmRKNjoZ1s9mFvxtzdpbHSX8+fkXh9Fj6NHR1pmBAuP2k/FQ3wW1Cc
	 fvAY9hclIy0t5D1o1xuVO/ZMDtfAJ0HK0mLsBGSJ/mwPr3RbYrqH+2ctpwBtK0RTVp
	 c/3nami4h/OSp1wLA5LuVMMkdcIEBaqTkrlYqQqnomJAq0dQudh+I7TApXwwfu0qiD
	 KC2rl7xg1YAPg==
Date: Sat, 3 Oct 2026 08:43:31 +0100
From: Will Deacon <will@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ
 lookup
Message-ID: <asCyI2_CNSoDJy1w@willie-the-truck>
References: <20260811041934.7609-1-phucduc.bui@gmail.com>
 <ar_fLAeFU4rmrwiH@willie-the-truck>
 <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com>
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

On Sat, Oct 03, 2026 at 07:07:12AM +0700, Bui Duc Phuc wrote:
> > Not sure about this. If it's optional, why should we bail the probe if
> > we don't manage to get an irq? Surely it's better to continue without
> > the interrupt in that case?
> >
> 
> platform_get_irq_optional() returns -ENXIO when no IRQ is available.
> Other negative return values indicate errors, including -EPROBE_DEFER.
> In the case of -EPROBE_DEFER, we should propagate the error so that
> the probe can be retried later.

Thanks, The -EPROBE_DEFER case seems more compelling, so perhaps we should
check for the expliitly (because it won't fail the probe altogether)?

Will

