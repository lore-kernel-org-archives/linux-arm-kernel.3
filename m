Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275C9C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaQGPp6ddTyuXw6qY9SjSQ+H3AysFRGJVYo1Wy3tqJA=; b=JSEnXWxsvToTUJOWwqQhsl9PQE
	QtZnOV9cxR1JcEZLMHtEEkDrrzsO4FURIvzpvqt3LFvHyE47LtWaUD+4DYpIx50OEiJPNC2y8ttgW
	9fCOfUmhhwMyG3xK9cUQqIpbIOCowBQAn5j2Y8CBYjqF4q2k7pih+L9W9yfFRFRiOjdVrB3YMK0fi
	3qRBRHBKO4BIMcqyAJV4W35lkirPdKMZMyG+TUM6MiiM4shCK4WW+bDI/fTWTFm2d6DUEQOmWIvVp
	uifI9ef0OftV5abRyhLv2tqK0ufTdk4Uxg95yBmxiLFCNGZsNTvXjqpZR4PTjAx4vLFDAm3JrusFz
	l+yUpbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tduSF-0000000B4Tm-2Uv5;
	Fri, 31 Jan 2025 17:05:19 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tduQw-0000000B4Lh-0pGh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 17:03:59 +0000
Date: Fri, 31 Jan 2025 09:03:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738343035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qaQGPp6ddTyuXw6qY9SjSQ+H3AysFRGJVYo1Wy3tqJA=;
	b=t/sZRENVwTvWil5d24XUhkvpKGoPUPv/03wBQSZg/Zc8YrEat9ZeJaejIGEWsrBLcUvTPi
	/+2FfOVpGS9vEWzsSz1+dzYfpnEIQxVOTuEjE07OOld72tJFkVRZFmxf8XCEzvZhRhqPX3
	5ZP7K/EnyYq4Dl55xinMqsGh5ADM9+0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, James Morse <james.morse@arm.com>,
	stable@vger.kernel.org, Moritz Fischer <moritzf@google.com>,
	Pedro Martelletto <martelletto@google.com>,
	Jon Masters <jonmasters@google.com>
Subject: Re: [PATCH] arm64: Move storage of idreg overrides into mmuoff
 section
Message-ID: <Z50CdVT8fPof-_Zc@linux.dev>
References: <20250130204614.64621-1-oliver.upton@linux.dev>
 <Z5yseC1kCyTcwlMy@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5yseC1kCyTcwlMy@J2N7QTR9R3>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_090358_381003_DCBBFBA7 
X-CRM114-Status: GOOD (  19.08  )
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

On Fri, Jan 31, 2025 at 10:56:56AM +0000, Mark Rutland wrote:
> On Thu, Jan 30, 2025 at 12:46:15PM -0800, Oliver Upton wrote:
> > There are a few places where the idreg overrides are read w/ the MMU
> > off, for example the VHE and hVHE checks in __finalise_el2. And while
> > the infrastructure gets this _mostly_ right (i.e. does the appropriate
> > cache maintenance), the placement of the data itself is problematic and
> > could share a cache line with something else.
> > 
> > Depending on how unforgiving an implementation's handling of mismatched
> > attributes is, this could lead to data corruption. In one observed case,
> > the system_cpucaps shared a line with arm64_sw_feature_override and the
> > cpucaps got nuked after entering the hyp stub...
> 
> This doesn't sound right. Non-cacheable/Device reads should not lead to
> corruption of a cached copy regardless of whether that cached copy is
> clean or dirty.
> 
> The corruption suggests that either we're performing a *write* with
> mismatched attributes (in which case the use of .mmuoff.data.read below
> isn't quite right), or we have a plan invalidate somewhere without a
> clean (and e.g. something else might need to be moved into
> .mmuoff.data.write).
> 
> Seconding Ard's point, I think we need to understand this scenario
> better.

Of course. So the write to the idreg override is fine and gets written
back after cache maintenance.

What's happening afterwards is CPU0 pulls in the line to write to
system_cpucaps which also happens to contain arm64_sw_feature_override.
That line is in UD state when CPU0 calls HVC_FINALISE_EL2 and goes to
EL2 with the MMU off.

__finalise_el2() does a load on arm64_sw_feature_override which goes out
as a ReadNoSnp. I is the only cache state for this request (IHI 0050G
B4.2.1.2) and the SF stops tracking the line, so writeback never
actually goes anywhere.

This patch might have been a touch premature, let me double check a few
things on our side.

-- 
Thanks,
Oliver

