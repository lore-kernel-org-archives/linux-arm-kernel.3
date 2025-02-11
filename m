Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B931C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHE+9XaT2D+yqXdoNs8We49I1ELX7xG6YmguTFkeMTs=; b=ja+3yOw3SO1+H0lO5g/Ba9MlsC
	ERYYt4aaWRg6+hUpWQSwwwhGMXWIWvMrgE3ydM7LFWnVtVwT8Bx0/BCcaJh0S0nRLtjujW3pcIyH5
	UcTJKcIWlo/WnIfxCKrQ40AEwo9jzG8nE8Lh8SzW7SWTVxPsB6WJIQ/4wELbcJEqh2yagOHFgU0zp
	fGlRVXjEf9NB8VArtrq5tRkp+f6X/ubxIah7pApteHLFkq0Lsfbva15sHtK/cLd7gzOp5dtUt03It
	CQ/1hXsPxqiEiEo7vlSiejEkzuAZyiIPfCUZ1/4WpHY6z4Ghg/vqLTtUhhagA03zoNBjvOr8SHXko
	/VYKKjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqej-000000040rW-02Fn;
	Tue, 11 Feb 2025 13:50:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqbw-000000040Vt-2Bcw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 13:47:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED4C71424;
	Tue, 11 Feb 2025 05:47:56 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29F513F5A1;
	Tue, 11 Feb 2025 05:47:34 -0800 (PST)
Date: Tue, 11 Feb 2025 13:47:28 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 06/18] KVM: arm64: Plug FEAT_GCS handling
Message-ID: <Z6tU8IyAr8lp9IYI@J2N7QTR9R3>
References: <20250210184150.2145093-1-maz@kernel.org>
 <20250210184150.2145093-7-maz@kernel.org>
 <Z6tEUzwcHVHALIdu@J2N7QTR9R3>
 <861pw4txhh.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861pw4txhh.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_054736_600600_6246BDB0 
X-CRM114-Status: GOOD (  17.07  )
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

On Tue, Feb 11, 2025 at 01:35:54PM +0000, Marc Zyngier wrote:
> On Tue, 11 Feb 2025 12:36:35 +0000,
> Mark Rutland <mark.rutland@arm.com> wrote:
> > On Mon, Feb 10, 2025 at 06:41:37PM +0000, Marc Zyngier wrote:

> > > +static int kvm_handle_gcs(struct kvm_vcpu *vcpu)
> > > +{
> > > +	/* We don't expect GCS, so treat it with contempt */
> > > +	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
> > > +		WARN_ON_ONCE(1);
> > 
> > Just to check / better my understanging, do we enforce that this can't
> > be exposed to the guest somewhere?
> > 
> > I see __kvm_read_sanitised_id_reg() masks it out, and the sys_reg_descs
> > table has it filtered, but I'm not immediately sure whether that
> > prevents host userspace maliciously setting this?
> 
> On writing to the idreg, you end-up in set_id_aa64pfr1_el1(), which
> calls into set_id_reg(). There, arm64_check_features() compares each
> and every feature in that register with the mask and limits that have
> been established.
> 
> Since GCS is not part of the writable mask, and that it has been
> disabled, the only valid value for ID_AA64PFR1_EL1.GCS is 0. A
> non-zero value provided by userspace will be caught by the last check
> in arm64_check_features(), and an error be returned.

Perfect, thanks!

Mark.

