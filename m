Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66EDC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 23:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVr5Cr9nWLKIbHjqu5Qu6E+br23QI9KJofBsQ+CVWf8=; b=qR0Ft/Aah+YXv1++6uQg2ptDWe
	NAFnN41mfgPPCeW4Fo37Me0/avtXZ+44Mj7nf4veXyM9OrFL3GtX5oYiuQjcJ4Jsnu2Kgxnv/llKB
	mr/kajGdLPL7HNXsp6eumAsAwy1KLIlDEmu0GIUWaGhevt2bowNk+cuIf6eLEMMsYZAH9QyuqwuS3
	1qiq/3iVhVTJBiKtOeZ+p2TAHNgUPwmgC0lTko1XP+2mGPxhY5+GPGw+yWNhBTQ0kgo4D1UB8YFo2
	D/g0nvoUiXxBrqmLvix7KvSXaWTxmAA0KnoNN7/fIiNmYIZ7IHGBm1qnkCJMPv2ubq1po5HDWNpSw
	H6Q2c5WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUf0-000000044aP-1cDs;
	Mon, 27 Jul 2026 23:23:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUey-000000044Zi-2r75
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 23:23:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C3C6F60A62;
	Mon, 27 Jul 2026 23:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BBE1F000E9;
	Mon, 27 Jul 2026 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785194579;
	bh=lVr5Cr9nWLKIbHjqu5Qu6E+br23QI9KJofBsQ+CVWf8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=agluquQPSC9RXPmNnIZK76eXD/aftYt5jG2hrCU6ozy+Yvs/Hh9rZGjs6btQxiqIv
	 twQV0i+1Q8oErKN0d+v9+G8dbZK3y1NMb6IrMx/bDpdzUro2AD+i/+R00EWmYEmYNA
	 ZL7242R45VkJ5vsiY/8g0ebJHTreb+qmnNdeDPb3264ff2GwkqBHgvEJRfYUbeG1gg
	 glJjGxM/3anTbs6WOcvQnTpNcS17WRNT3kU4/tHHYnqIJeTrgxlbjOW6hGf1HcJ0eK
	 ZyIdAvcMLXjvg1rYhULKdxcPAm5bXjQ5EF05kvD7YoP1OXAYBmmwEMQjaGCGxRidrQ
	 ByDhL/v/hPyGw==
Date: Tue, 28 Jul 2026 00:22:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>, Srivathsa L
 Rao <srivathsa.rao@oss.qualcomm.com>, Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>, Trilok Soni <tsoni@quicinc.com>,
 Srinivas Ramana <sramana@qti.qualcomm.com>, Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/10] arm_mpam: add MPAM-Fb MSC firmware access
 support
Message-ID: <20260728002252.77064c3b@jic23-huawei>
In-Reply-To: <20260723155454.1760823-9-andre.przywara@arm.com>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
	<20260723155454.1760823-9-andre.przywara@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 23 Jul 2026 17:54:52 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
> alternative way of accessing the "Memory System Components" (MSC) in an
> MPAM enabled system.
> 
> Normally the MSCs are MMIO mapped, but in some implementations this
> might not be possible (MSC located outside of the local socket, MSC
> mapped secure-only) or desirable (direct MMIO access too slow or needs
> to be mediated through a control processor). MPAM-fb standardises a
> protocol to abstract MSC accesses, building on the SCMI protocol.
> 
> Add functions that do an MSC read or write access by redirecting the
> request through a firmware interface. For now this done via an ACPI
> PCC shared memory and mailbox combination.
> 
> Since the protocol used is only a small subset of the full SCMI spec,
> and the SCMI protocol has no full ACPI support anyway, open-code the
> (simple) SCMI message generation, for just the fields we need.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Just a couple of suggestions that you can ignore if you like

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
> new file mode 100644
> index 000000000000..ec4bf0dd9182
> --- /dev/null
> +++ b/drivers/resctrl/mpam_fb.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2024 Arm Ltd.

Arm has either been working on this for rather a long time or that's a cut
and paste.  Even if 2024 is a good start given changes during revisions
seems reasonable to include 2026 as well.

> +struct mpam_fb_read_payload {
> +	u32 msc_id;
> +	u32 flags;
> +	u32 reg_offset;
> +} __packed;
> +
> +struct mpam_fb_write_payload {

Given these are only used in the specific functions that build the
messages you could move the structure definitions to be local to those
functions.

Alternatively you could move all these to the header and get the advantage
of using a union to get the maximum message size rather than a number
currently picked out of the air.

> +	u32 msc_id;
> +	u32 flags;
> +	u32 reg_offset;
> +	u32 value;
> +} __packed;



> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index b3a6ed9ed175..e4686ff0ba2e 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h

...

> +#define MPAM_FB_PROT_HEADER_LEN	sizeof(u32)
> +#define MPAM_FB_MAX_MSG_SIZE	(MPAM_FB_PROT_HEADER_LEN + 4 * sizeof(u32))

Doesn't seem to be used until patch 10.  Might be more sensible to bring it
in there. A spec reference might also be good for this.  I think longest
is current the MPAM_MSC_WRITE.  A note above that one option would be
to make this explicit by having the message structure definitions in this
header.


> +


