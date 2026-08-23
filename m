Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658EAC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 13:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5S2CPgXvqbHwQkK5V3DZYKr7a8Y914YJTj0fMbzjik=; b=oTCGne4+KKxPnbIqTzJ5OMTd8l
	U9YI+EdzROlMpVnkEgcoKV8AMkTtukWaT4R6sNDyF+B7fELCSpRnlXA+OvEIp1t3nEHugU8LGZDRC
	zyFy9A3c2GUd6gQBv5Ucrgb/EgjhjBFj43UZuJeg1Cf9DmiGVssPesc0FwXujhNsqGvgOeVRMRVcU
	LbcEF2AnIA15kSqAF48/rUJlSK8T+b7HDA9QfUP5vfNwegofyNV8zaHBeDQiiriSQh7IuvksZwv21
	RzyKoKuELO4SUdeEy0/g5hJMAaji3R9zA08/65/vcz0KkqSYMj67cAQNCVMvX6zknjHR5HhZpaxEB
	uug/hKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy85q-0000000FNvW-0Dex;
	Sun, 23 Aug 2026 13:18:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy85n-0000000FNv2-3XsU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 13:18:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E666B175D;
	Sun, 23 Aug 2026 06:18:23 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 288613F763;
	Sun, 23 Aug 2026 06:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787491107; bh=VtrB+tX93grPnj6d2CSLEWBTBQOnedeDYuFdQkZ60cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=htxiSmdHXY9n2ilLyyinVePwU2QLn+Lzm0KN3K3uSw1BBX5/GbZ/Qp8cSwl4wHpCk
	 6Cpoya7S2PEjOFukTGXB+uZXqyl07LLOOMqkm2Z7RbxGebp+0YvwFYN+MQTGZCrQ9K
	 QqdC7a2k3ct9wFPCiysNZBX74ljLKk0j6oG5Dyuo=
Date: Sun, 23 Aug 2026 14:18:15 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Oliver Upton <oupton@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 06/14] KVM: arm64: Validate GCS exception lock when
 emulating ERET
Message-ID: <q3lxbu2palhkejnkvncs2iili6vvkcl7boftn4snf4fjy6fhvg@ehrwmqt6eh3m>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
 <20260812-arm64-gcs-v19-6-9105afd828ac@kernel.org>
 <vdmz43ogvmwu4liilfqzdrgsf5v765bucl7mybhfdxj7yrywkd@5mssukdegdwg>
 <02b970b2-dbd9-490f-bfc0-be10708e0f9b@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02b970b2-dbd9-490f-bfc0-be10708e0f9b@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_061832_103289_7C8C520C 
X-CRM114-Status: GOOD (  21.13  )
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

On Fri, Aug 21, 2026 at 11:19:30PM +0100, Mark Brown wrote:
> On Fri, Aug 21, 2026 at 03:32:58PM +0100, Wei-Lin Chang wrote:
> > On Wed, Aug 12, 2026 at 08:12:05PM +0100, Mark Brown wrote:
> 
> > > +/*
> > > + * A subset of the pseudocode ELFromSPSR(), validity checks are
> > > + * assumed to have been done in code that is not GCS specific.
> > > + */
> > > +static inline int exlock_el_from_spsr(u64 spsr)
> > > +{
> > > +	return FIELD_GET(GENMASK(3, 2), spsr);
> > > +}
> 
> > It feels a bit odd to me to have this function named exlock specific, as
> > it's just spsr_to_el, right?
> 
> As the comment mentions it's not quite that - ELFromSPSR() in the
> pseudocode has rather more going on in it that I'd managed to convince
> myself wasn't relevant in this specific context.  I didn't want to give
> it a name that would cause someone to think it did the full thing and
> trip them up using it in a different context where those things do
> matter.  I do agree that this results in awkward naming.

Right sorry, I missed the pseudocode part. ELFromSPSR pseudocode is
doing more than what its name indicates...

If we want to stick with the pseudocode then what do you think about
el_from_spsr_nocheck/el_from_spsr_raw?

> 
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Ok, thanks for the reminder!

Thanks,
Wei-Lin Chang

