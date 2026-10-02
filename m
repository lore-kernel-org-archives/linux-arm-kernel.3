Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC994CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRJpN84UVix6BcTqUJ5o6iEEWxr1NuZClp/FPA6fygI=; b=YpHTywnx/AWdt1WWK6OLowRcLH
	zokVBD4wo0MzyxhxgnNKsevnJF0y8sl0HHacgxoLrI9bvKqMJAJelu/At1TgsEK2WEV5BunIecv4e
	R+Tu+sQX6YaTECn7x726OTXtfIUAGb+ONzaJ9tZ/T5A7PfPc2aZzVABOr5KDUBuyMCHmQ9stMYI8H
	byzWonKpJTKrneggwirFP/44vi9pXf147WlIa5PVPDedtvkABPtSBqaYA+1XoWOQWqofR61dbJUdu
	oJYFWUWFyUbQFb9WUKe7wxRqRzO6HlucfjWZ/kBkiPr8XrM3+g16aI+K/JZQD7uIwl1jBT4588iy5
	mmbE4V+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcbt-0000000BbLs-22BA;
	Fri, 02 Oct 2026 12:43:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcbs-0000000BbLj-16nd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 12:43:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5ED8560A70;
	Fri,  2 Oct 2026 12:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726981F000FF;
	Fri,  2 Oct 2026 12:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945011;
	bh=cRJpN84UVix6BcTqUJ5o6iEEWxr1NuZClp/FPA6fygI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TCtr2o36F1O/MpLu8S3DVZvnMEXNteH1EF159izrvp2NbFmzHYg/yyMwMCVGnDPCk
	 qvwN0+PMOWC97aXUjmVOOWsr10Jr46yrcaBEcGol3Ky11scrHfRRnkMGdyTXjmD6ik
	 RzLd8OYLXhBIqDBEC9ujOKGRv9KWtgQPpOA0yzNJJJOru709QUBP7XTw5qK1yhn+Ro
	 6bCvCbwjms+nzquCZXMHQQZEUcvM66224A424lehzwFH2brMyWpWPPWH7knLk1UL9b
	 /5L8tRsoV2wbh15rD+hc8Ij9SQ9a61teJdCWW1pPSHs909dGbK+SFztY9ArfH0EkJI
	 lnuXt+pa9xdOA==
Date: Fri, 2 Oct 2026 13:43:24 +0100
From: Will Deacon <will@kernel.org>
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Kohei Enju <enju.kohei@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: tlb: Add tlbi workaround for FUJITSU-MONAKA
 Erratum E#030001
Message-ID: <ar-m7DUSMhe0euXC@willie-the-truck>
References: <20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com>
 <20261002-monaka-fix-for-upstream-v1-2-4aec0b0cbe34@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-monaka-fix-for-upstream-v1-2-4aec0b0cbe34@fujitsu.com>
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

On Fri, Oct 02, 2026 at 07:26:50PM +0900, Tomohiro Misono wrote:
> FUJITSU-MONAKA Erratum E#030001 affects FUJITSU-MONAKA CPU
> when using 64k page size.
> 
> On affected FUJITSU-MONAKA CPUs, range-based TLBI operations
> targeting a VA or IPA may fail to invalidate TLB entries when
> addr[34:29] == all 1 && addr[28:0] == 0 for 512MB mappings.
> The affected instructions are:
>   RVA[L]E{1,2,3}*, RVAA[L]E1*, and RIPAS2[L]E1*.
> 
> Work around the erratum by issuing additional non-range
> TLBI instructions corresponding to the affected VA or IPA
> range-based TLBI operations.

Why don't we just avoid using range invalidation on these parts instead?

Will

