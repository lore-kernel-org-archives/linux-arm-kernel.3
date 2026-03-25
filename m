Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D4B106B53A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMDIPfUD9IhpdNz/oudulWcw0X4n9DQM3JJYmmAdwmY=; b=AnlV5QQJW3xCocP9u58bmKXwXg
	y0zPpfqaj0HKDgys4d8cKPnWVCoa85Zv1PwcW8aM5+24bW2N3j1vn+mMWqcrZ4jMh3HSTFUCMosJ1
	OgS86iWSIZpCmTHJwElB3+NOpuDMrGioZrMHJahNs2IYjfLdbrDiKfyO/OFNoVLMZyql3NerueFzO
	+4Cp1J0KuOM3f+vA3AF3RkEU4WetBqbME9Y9aFnFjmpYSwvTnJLaZDbTy4F/AOOd4EN0CIJNff2n9
	sj5hw1Nz5+IsYsMQx4bokPXw8Tf79DKuMEMCHRKdfF23xNmVmO4Et1CyKogpYqcnImY6VLF4Q1E3U
	lNgpxuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ON3-00000003TSH-1PYU;
	Wed, 25 Mar 2026 13:34:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ON1-00000003TRt-294S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 13:34:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C95A61CDD;
	Wed, 25 Mar 2026 06:33:55 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BC673F836;
	Wed, 25 Mar 2026 06:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774445641; bh=lZ4CBq7Ixdqscjj9OP02TD8QGkO3fkLUcmUe5Ywrwt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSp6CPlksiz56QNHDFrh7jhkmfSfbX6IKMXHufXvfnVp24CrQ7HiXg5BrUJVfCq2p
	 C2jM8duFHGe0Hq5IbJDz7RsS0VPQcfcZxGGkHi2BVCfs6ubfHyiWbBVqXAnmz82dWS
	 R78gyDj6te/Vl3XUc7Etkv5pGG/fsSGtIE14Y1Rk=
Date: Wed, 25 Mar 2026 13:33:56 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Sebastian Ene <sebastianene@google.com>,
	Vincent Donnefort <vdonnefort@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, catalin.marinas@arm.com, joey.gouly@arm.com,
	oupton@kernel.org, suzuki.poulose@arm.com, tabba@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v2] KVM: arm64: Prevent the host from using an smc with
 imm16 != 0
Message-ID: <acPkROffwAsuqsuX@J2N7QTR9R3>
References: <20260325113138.4171430-1-sebastianene@google.com>
 <acPIdoA8oc7T8wKX@google.com>
 <86ldfg3ze2.wl-maz@kernel.org>
 <acPRIk7_dH5Erul8@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acPRIk7_dH5Erul8@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_063403_588709_FC24053A 
X-CRM114-Status: GOOD (  24.99  )
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

On Wed, Mar 25, 2026 at 12:12:18PM +0000, Will Deacon wrote:
> On Wed, Mar 25, 2026 at 11:46:29AM +0000, Marc Zyngier wrote:
> > On Wed, 25 Mar 2026 11:35:18 +0000,
> > Vincent Donnefort <vdonnefort@google.com> wrote:
> > > 
> > > On Wed, Mar 25, 2026 at 11:31:38AM +0000, Sebastian Ene wrote:
> > > > The ARM Service Calling Convention (SMCCC) specifies that the function
> > > > identifier and parameters should be passed in registers, leaving the
> > > > 16-bit immediate field of the SMC instruction un-handled.
> > > > Currently, our pKVM handler ignores the immediate value, which could lead
> > > > to non-compliant software relying on implementation-defined behavior.
> > > > Enforce the host kernel running under pKVM to use an immediate value
> > > > of 0 by decoding the ISS from the ESR_EL2 and return a not supported
> > > > error code back to the caller.

> > It also begs the question: if you don't want to handle SMCs with a
> > non-zero immediate, why is it OK to do it for HVCs?
> 
> I suppose the difference is that the HVC API is a private interface
> between EL2 and the host. As it stands, EL2 ignores the immediate but we
> don't have a way to know how EL3 responds to the immediate for an SMC.
> 
> When proxying an SMC from the host, EL2 therefore has three choices:
> 
>   1. Ignore the immediate from the host and always use zero when talking
>      to EL3. That's the current behaviour, but it could theoretically
>      lead to problems if EL3 is using the immediate for something.
> 
>   2. Propagate the immediate from the host. That should work, but it's
>      a bit involved.
> 
>   3. Reject non-zero immediates (this patch).

I think (3) is the only safe option. As described in:

  https://lore.kernel.org/linux-arm-kernel/acPi5V0DgGcgHNGO@J2N7QTR9R3/

... regardless of the the conduit (HVS/SMC) used, a non-zero immediate
is NOT a legitimate SMCCC call. (1) is not safe, becuase it could change
the semantic of the call, and (2) is not safe because the calling
convention could differ (and e.g. things might be clobbered that we
don't expect).

We know that the host *SHOULD* use a zero immediate, and so anything
else represents a bug that we will want to catch.

Mark.

