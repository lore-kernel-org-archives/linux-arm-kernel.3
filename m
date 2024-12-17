Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F120AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkRrOqmYm8mFGf6ZziFnsHC8gAVb4/Jvhm1aIGMdXpg=; b=YekkG9xlEbN48ftQNajGtM0mPB
	qzlbUlqFkSCmLAqbZUzWGxUIIjLOhwkRVDKcyKO/VM7h+bbHpn3Or1lc3B2bAu+dGFdvadMdOoFvF
	eOItVEEGuEbrmzgAP9F6aYNEC5eo/EMDzrPLN1j6LztnLJszq2++rdgsILJZhjqeaEtkZMsW4hZgT
	Ygpr5NgPiSxzNviRI1Eq9pOvzQGKGtJgwLmkEkj33mywCTZNKbBm2fETzHFyzPOGlaBNQ47yPh5Qr
	2X5o4TVFVNIMNvABm2ZMu66C+RSS7ye64ikK0xBlUWaAXcG0wFQxna6ciuV0wy+E76wN+U/Rhlf3C
	Gxm+iNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbzh-0000000ETDc-422r;
	Tue, 17 Dec 2024 18:08:29 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbsU-0000000ERjN-2DOp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 18:01:04 +0000
Date: Tue, 17 Dec 2024 10:00:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734458457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PkRrOqmYm8mFGf6ZziFnsHC8gAVb4/Jvhm1aIGMdXpg=;
	b=o1alYDL5oQ4U8aVIN4LJhtvgi4JR5Ey49e8Jt93GpKesUTx0JkYkIFh8FnbUMROwIWNZg6
	lZMsN6urvrxNfEWq3T+ly+eCv55DhHRMSKihuA66VsYN0xym5XSDu1/PWs39zrbZDmKbEN
	P8Tu9j/uueBx7LvvaEsb2L1rCH8Fhq0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix set_id_regs selftest for ASIDBITS
 becoming unwritable
Message-ID: <Z2G8TFw4wg7bnwzB@linux.dev>
References: <20241216-kvm-arm64-fix-set-id-asidbits-v1-1-8b105b888fc3@kernel.org>
 <875xnisocy.wl-maz@kernel.org>
 <53b40aa8-f51c-4c4e-a4ad-e6a9512e5197@sirena.org.uk>
 <86v7viqusg.wl-maz@kernel.org>
 <b13b14df-00ee-4bee-8f65-d2cb7a9bfa6b@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b13b14df-00ee-4bee-8f65-d2cb7a9bfa6b@sirena.org.uk>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_100102_726917_8E983B9E 
X-CRM114-Status: GOOD (  20.42  )
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

On Tue, Dec 17, 2024 at 03:10:28PM +0000, Mark Brown wrote:
> On Tue, Dec 17, 2024 at 01:54:39PM +0000, Marc Zyngier wrote:
> > Mark Brown <broonie@kernel.org> wrote:
> 
> > > The selftests are shipped as part of the kernel source and frequently
> > > used for testing the kernel, it's all one source base and we want to
> > > ensure that for example the test fix gets backported if the relevant
> > > kernel patch does.
> 
> > That's not what Fixes: describes. If you want to invent a new tag that
> > expresses a dependency, do that. Don't use these tags to misrepresent
> > what the patches does.
> 
> No, this isn't a new use - a Fixes: tag indicates that the referenced
> commit introduced the problem being fixed and that is exactly what's
> going on here.  Like I say the selftests are not a completely separate
> project, they are a part of the same source release as the rest of the
> kernel and it is helpful to track information like this.

A Fixes tag suggests a bug in the referenced commit, which isn't the
case here.

I agree that having some relation between the two is useful for
determining the scope of a backport, but conveniently in this case the
test failure was introduced in 6.13.

I've taken the fix for 6.13, w/ the tag dropped.

-- 
Thanks,
Oliver

