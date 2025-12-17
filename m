Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE616D637DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 00:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkHzTLD+4NsfVkfbHXwUKhCHeIbBOpX9g3beTCKP7BQ=; b=GH5tZtLDEjpDxHJE+esnD45sew
	HJN6wjcLD1Fyfwdl0sZhE4u/7f/itSebjXg+3qqn/Am5tyoNim0Y7vQgUL6MweuMNwER3KFLytg2x
	ty8qMoUlRjf83pjQb0A1tgi3GsgYkAViaJ3ig9bn1pm0z+KD2OuKrQMoyiI4zEOnK88P++SL3Gntp
	LsgsAa3celTrwDADxKzdnpwWVa6SAAUiYxygROuKt5YG9PVer+4MpZ2SCqqXdq9tm87bf9zeYXU3g
	9N87n2bOFWz6bjc4vBnbqj8kpxw2IO7jOaLCKO4UNriPYfWAdAa67wpwUPBLcHN7H06PH8JS6jRUX
	mK/CNOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfAS-00000005yjS-1zWp;
	Wed, 17 Dec 2025 00:13:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfAQ-00000005yiz-0sx1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 00:13:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B07FF42D75;
	Wed, 17 Dec 2025 00:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34297C4CEF1;
	Wed, 17 Dec 2025 00:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765930399;
	bh=p8kOKXRClvsn0/nZCAyBb0kv36JqoCmhi5ZmrnAFXtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PjMR02ZebL/kAinz2ZnNojcM8bhDXzlCUTEnMESUsr0FLDRKPOXkj7bjCZ3xFh5iG
	 cYT43D+u/SWqm80L4VdT1hLqQ3kyAsjOJ4d4emHJ3dNdKjKk91dFBeXpQ7/DhAQxaj
	 CwMoMqR43DG8q8lKdFq8HkJd0RcVYjv2Ok/Mg2DaDhv/v7Gs3PFXXXZBTVrWUFOZtr
	 fgN0ioyTXURjMW06EepYwDbLIDdUcF4DinO3P0WxREFcCxtxku4w/u7gwOxCu1Acrv
	 sA1lwdqBz6KarrP+iuTBg/FFS9Zo30sWJjzyZuAr1WR4Yx1TQ+rPZS8349dLW6uKVU
	 6lwWpPcMMXhRQ==
Date: Tue, 16 Dec 2025 16:13:17 -0800
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net,
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	mark.rutland@arm.com, shuah@kernel.org,
	gankulkarni@os.amperecomputing.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 10/24] KVM: arm64: Set up FGT for Partitioned PMU
Message-ID: <aUH1nZB83m62kkUH@kernel.org>
References: <aTiPvS49uMOJEBrf@kernel.org>
 <gsnty0n72zl5.fsf@coltonlewis-kvm.c.googlers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsnty0n72zl5.fsf@coltonlewis-kvm.c.googlers.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_161322_294199_0CCC8088 
X-CRM114-Status: GOOD (  12.69  )
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

On Fri, Dec 12, 2025 at 08:51:34PM +0000, Colton Lewis wrote:
> > The other reason for doing this is kvm_pmu_fgt_bits() assumes a
> > 'positive' trap polarity, even though there are several cases where FGTs
> > have a 'negative' priority (i.e. 0 => trap).
> 
> For the bits I was concerned with they all had positive polarity, except
> for the dedicated instruction counter. (Side note: Why would ARM do
> this?)

Old software on new hardware, you don't want the guest to magically get
access to things it shouldn't.

> IIRC the FGT setup I plugged into in previous versions of the patch had
> some icky macros that accounted for polarity. They were confusing and I
> didn't like the effort to understand them.

I'm guessing you're referring to the undef infrastructure (FGUs), which
is a meaningfully load-bearing part of KVM.

> Is there a good reason not to adopt a convetion that 1 => trap for
> kernel code? Reversing the negative polarities immediately before write
> could be easy: Have a bitmap of the negative polarity bits to xor with
> the traps we actually want.

This *significantly* muddies the water around FGTs. I quite like that the
current representation matches the architecture. NV forces KVM to deal
with the native representations anyway.

Thanks,
Oliver

