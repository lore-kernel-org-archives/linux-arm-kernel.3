Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED63C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 18:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vPC2HRo1hrIvIy3DB6LHP7VD01JSHIUgbDVrdNw5bA=; b=G3xPDayqlW7CuBYUa4SXiD95Om
	hibsLsQjZVbvgAwUTqbvY3wQCxZeirDt8chrMDg2ufup+YTnyC1V1Gx3KlQfykyPY9Mw8ATPBJhVV
	LHhkJGUD+8AyV3KJTCrxJh5k8k6EDz2YezPfZyNdaH/QttFU7pdH02NSrkl8sK9vUP90bLRwGeDrd
	p6DfW4EdZ/dyTQxHBQlfpQLvQqPklDI9gOnomqrobRbuJNyLX3vzRzX/gTIAyUVxAI9VBQqbVx7UL
	l1+y5nrB/dkYhvL1LLFUJsdE5leQCi6lwGlNKhzsT0cmWo2RxyrzC8tpH49QDucntKeALxs+K3J35
	KIura5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMap-000000053nH-222f;
	Wed, 26 Feb 2025 18:57:15 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMWz-000000052x5-3Xcr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 18:53:19 +0000
Date: Wed, 26 Feb 2025 10:53:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740595992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5vPC2HRo1hrIvIy3DB6LHP7VD01JSHIUgbDVrdNw5bA=;
	b=EqcrrWVoxCoUqMnePpCuuapSo7K1up9nFdRh5o7LRraeYmF2e9eFtEXs6lPsg2Lo08BQBh
	jam+VEpcklsGqq2VaiO2peoW93UJldoPlwZy7X6E/wuU89skbpNtBjyXt99Y3Ef9aTEYrU
	poRX9YUfRQNJgQUr6Py193bHXDFWjrI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
	qperret@google.com, vdonnefort@google.com
Subject: Re: [PATCH v1 1/3] KVM: arm64: Initialize HCRX_EL2 traps in pKVM
Message-ID: <Z79jERSoEvEtZI7k@linux.dev>
References: <20250214150258.464798-1-tabba@google.com>
 <20250214150258.464798-2-tabba@google.com>
 <Z77n_Gv0X0bolONW@linux.dev>
 <86a5a9q90z.wl-maz@kernel.org>
 <CA+EHjTwRNj6z_TTCXR8UNiB0ty=85_VKWDVsFOLke31UGnBE7A@mail.gmail.com>
 <865xkwrai1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865xkwrai1.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_105318_089438_A190E9C1 
X-CRM114-Status: GOOD (  20.52  )
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

Hey,

On Wed, Feb 26, 2025 at 03:28:22PM +0000, Marc Zyngier wrote:
> On Wed, 26 Feb 2025 12:44:49 +0000, Fuad Tabba <tabba@google.com> wrote:
> > On Wed, 26 Feb 2025 at 02:45, Marc Zyngier <maz@kernel.org> wrote:
> > > This is a copy/paste of what we have in kvm_calculate_traps(), and the
> > > result of the removal of the dreaded HCRX_GUEST_FLAGS.

Ah, I missed that.

We probably should've just tossed it at that point, doing configuration
for features we don't support is a bit confusing.

> > > > Any objection to dropping this bit? I can fix it when applying the
> > > > series, no need to respin.
> > >
> > > Whatever we do, I think we should keep the two side of the trap
> > > configuration in sync, as this is otherwise a cause of bugs.
> > 
> > I could take the initialization of hcrx part from
> > kvm_calculate_traps() and place it in an inline function in
> > kvm_emulate.h. This then would be called by kvm_calculate_traps() and
> > pkvm_vcpu_init_traps().
> > 
> > What do you think?
> 
> That could be a good option indeed, irrespective of the fate of SMPME.
> 

Agreed. Fuad, would you mind taking another pass at this with the shared
helper?

Thanks,
Oliver

