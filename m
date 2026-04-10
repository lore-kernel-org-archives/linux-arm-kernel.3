Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E1AE99049
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eD2GqYVYaw/AwL8YkfWsSyw3e2aXuJn+eTsStE6HBEI=; b=EAYh04p8yh1NAoqGDw3DzoPFUC
	41yAAWK3cK2F+cBUUO9hBuhnaKftpix2zVVfX72eypYXIqOUcBsBhMLv05Ykky/Um50Dm1fpEr7iG
	Yf3CpZce/GFUAqXzfuoln+q+iGycmZF8gElhwpZPOzeONWbkHbLj6dJbwxSykqDSA//bQZwR5JsJD
	QI1GaGPWdULUTqWSjEFL0sGuPh0Vf8jJmivajcl0vdfXTQFuiXK9asRpb4l71oz6+qbcUssm7iN93
	b9XXWe70YA0Pu/lrRDMObGFtNSA0llENTgWVqW+6Gzuf6gGnq7KUQF0U9E34gFhOs4oN0yvOJroHs
	FJN7smdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6OJ-0000000Bjy5-06oY;
	Fri, 10 Apr 2026 07:34:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6OG-0000000Bjxa-0oL4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 07:34:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38C5A1CE2;
	Fri, 10 Apr 2026 00:34:48 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7353F3FAF5;
	Fri, 10 Apr 2026 00:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775806493; bh=3dt6b5NFS6OMkaxBDU5Vw8gZWuujHEwxgHO+tc15hWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbJVWVADOhWYJ31F/RpHT4ldw6QNo1V1GBvc2jmrGLoJtSGpsf8+DcCbgVIHOtdjv
	 ovO/VwSCnBA/f+XWM+8gK/xRNkXtLCzoAIVPGeLT6BrgYbb+J06ZiRWxwagj1heNV/
	 LiR48gDoor5rDV0aiCrM+go283dvBpSI+HmYcOLY=
Date: Fri, 10 Apr 2026 08:34:51 +0100
From: Leo Yan <leo.yan@arm.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/4] perf arm_spe: Extend SIMD operations
Message-ID: <20260410073451.GY356832@e132581.arm.com>
References: <20260408-perf_support_arm_spev1-3-v5-0-b5bcea6217bb@arm.com>
 <adiGR-A-N1tMzxTE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adiGR-A-N1tMzxTE@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_003456_352940_8F75D0C2 
X-CRM114-Status: GOOD (  14.12  )
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

On Thu, Apr 09, 2026 at 10:10:31PM -0700, Namhyung Kim wrote:
> On Wed, Apr 08, 2026 at 10:42:30AM +0100, Leo Yan wrote:
> > This series extends SIMD flag for Arm SPE and updated the document.
> > 
> > Since I failed to get perf core maintainer's review for uAPI header
> > updating for data source fields (since last year's Sepetember), this
> > series I dropped uAPI changes and sent only SIMD flag changes, hope
> > it is easier for perf tool maintainer's picking up.
> > 
> > Anyway, uAPI patches will be sent out separately.
> > 
> > This version is rebased onto the latest perf-tools-next branch.
> 
> Unfortunately it doesn't apply due to a recent change.  Can you please
> rebase it once again?

Sure, I will send out a new version.  Thanks for taking care of this!

