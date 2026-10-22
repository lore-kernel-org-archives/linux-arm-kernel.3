Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F128606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 21:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ore1IMh5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJtkrHOn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X9L+wVjQDTDhhAWidv7mqpcqBF43Sq2/aOI6n5JGJ/s=; b=ore1IMh5gP+xPgbJlYFSs8GLpr
	gcFb4dh7WcQhhk/sNwI3R8L2K9jOpn9gnFNRN1kZ/NvRHWL8QHhtn+GB87eF3tJO7OAqJGb1VNW/4
	MM979WueaUthWpnczzdMIrb3D5w5A229kxSzNHKNSDZL3HB4wZBwUeecRERh429ohVforlQ7y/H+2
	UNZo5JtcGP1bK2f4IMmPZISvnX+5X+9nrKvtGdCVQmMUjnUrDAeF5sWQwD+O+fqKTA/lBeRaYOZAe
	cNpdpw3rBq0nVi5ypiQpnCENt1+Tisqjxd7xaY1KorObPs8ZepIjbgeaam5r/fYJQRKg/+jAhI2AB
	UDIip1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0fy-0000000F1sO-2Y9C;
	Thu, 22 Oct 2026 21:50:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0fw-0000000F1sF-3oT0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 21:50:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 485BB43EDD;
	Thu, 22 Oct 2026 21:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643B61F01825;
	Thu, 22 Oct 2026 21:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705816;
	bh=X9L+wVjQDTDhhAWidv7mqpcqBF43Sq2/aOI6n5JGJ/s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CJtkrHOnJLZM4C3pIijIeAl71ydG+iTdWvKdKIle1t9lvMr1fjYj85OlCrdatq/w+
	 zrK8IcgWQ6dzrmVpCN1JV3G+gbtNZ4IgVyLQyMJVgZQOMT17bsYK999cIrIP9i3tv+
	 bhVIZxUNpXVsHtqM35jjEOtbwQzRUhwkFz3GFZ2KotYSzQ3CR9wV59Vgi6wDlMi7A+
	 hvNdpu4BnYhi810y73kdX/XxCe+Azcu6LYunBRXkeNB/eU7R0VQa1h3Dl/dRxIqWr6
	 uCt/vjqnT95HosAKkIvPwCtnYEpkzOUkCn+1hFeTdTKvvvkSETjL+JH63Omm6Aaids
	 S9GHjq4gAgqPg==
From: Thomas Gleixner <tglx@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, mark.rutland@arm.com, Sudeep Holla
 <sudeep.holla@kernel.org>, lpieralisi@kernel.org, radu@rendec.net,
 vsethi@nvidia.com, sdonthineni@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] irqchip: gic-v3: fix unmet dependency on
 ARM_PSCI_FW
In-Reply-To: <20261021-rampant-fabulous-ant-cafccb@sudeepholla>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
 <86se1zzcet.wl-maz@kernel.org>
 <20261021-rampant-fabulous-ant-cafccb@sudeepholla>
Date: Thu, 22 Oct 2026 23:50:12 +0200
Message-ID: <877bj91k2z.ffs@fw13>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21 2026 at 15:49, Sudeep Holla wrote:

> On Wed, Oct 21, 2026 at 09:27:22AM +0100, Marc Zyngier wrote:
>> On Tue, 20 Oct 2026 23:28:15 +0100,
>> Julian Braha <julianbraha@gmail.com> wrote:
>> > 
>> > ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
>> > dependency, ARM_PSCI_FW, is met.
>> > 
>> > Patch 1 of this series adds stubs for arm32 so that patch 2 can make the
>> > select conditional on arm64.
>> >
>> > ---
>> > Julian Braha (2):
>> >   firmware: smccc: provide stubs when discovery is disabled
>> >   irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
>> > 
>> >  drivers/irqchip/Kconfig   | 2 +-
>> >  include/linux/arm-smccc.h | 7 +++++++
>> >  2 files changed, 8 insertions(+), 1 deletion(-)
>> 
>> This probably needs to go via Sudeep's tree.
>> 
>
> Sure will queue it soon and send it as fixes at -rc1 or later.

Please change the subsystem prefix to "irqchip/gic-v3:" then.

Acked-by: Thomas Gleixner <tglx@kernel.org>

