Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA848CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwO3EbMXCByI/1FOlLo/YL+bNhKbnRuBIGbzG8zbilU=; b=YsQZ8CfsaJjajYCKvE4NAcNEiX
	pGvSLinxW1m3Sd86rQZwW1xPe6uV4vky5kMEStnseaK6xRiPhK53I3w/rqsabTrGJkEv5QxXugkug
	NuvgijE6itS5fW4w+EdRA8ZwSmDZ0266F5lBaUokY4y08oiCGkVqIulqoXUHiRbuYPIB3w0zc2i1a
	Wzqgm3C/3gSc/C8DFJiwV1g96cnPmYRPTS0tNGNziuDZ8grwN5EjoWg3cfFAEl0O/BG23EiGJriL1
	tP8yc1+vzMNGx4RIJTvUn82RbVuZF28VHT49BBx9SYj9/iM+Y0S/KOLcXfEiEyZ3F1s5au9SQ7z9p
	W3n7fxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQQt-0000000DDRj-0g0b;
	Tue, 02 Jun 2026 14:49:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQQq-0000000DDQn-0yow
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 14:49:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 299AA43909;
	Tue,  2 Jun 2026 14:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962F21F00893;
	Tue,  2 Jun 2026 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780411767;
	bh=fwO3EbMXCByI/1FOlLo/YL+bNhKbnRuBIGbzG8zbilU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kqHXc6mPKuyCPk9Aky7H52MNPP5X0cSVLTks5Ta4rrE8Vw/O1LwqvjS+wh6PosKfA
	 NpqD1XobDvFOF+6TJqcA1VEf1jYwnqBJehbQR5ZYCdmcN7FxmcYgTRkEfFG7mXux/1
	 mGfl++ZMfB+Xwd+YHlRz2LJ2+DH5YYQX2Dz5KfaCzP0UdKP7YaviowRR3h+6pjshoZ
	 8S6s37xNYF8yl6k0Ragoovi2BfsTDYFnNROJ9FSd/yhcPTdY1/A0YWj3H9/UdNT6go
	 OsFCR0AXf5X85j6EDXiFmo6Wf4TzmFjbKPT7UaHigO3PPFkc/ift7hQd7UsQF8lvNE
	 1gk73lblxTqJw==
Date: Tue, 2 Jun 2026 15:49:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Conor
 Dooley <conor@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Dan Williams <djbw@kernel.org>, Thierry Reding
 <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: smccc: add cache clean/invalidate IDs and
 return codes
Message-ID: <20260602154921.6c8e60e5@jic23-huawei>
In-Reply-To: <20260602082145.404939-2-smadhavan@nvidia.com>
References: <20260602082145.404939-1-smadhavan@nvidia.com>
	<20260602082145.404939-2-smadhavan@nvidia.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_074928_300457_0BB6E714 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

On Tue,  2 Jun 2026 08:21:44 +0000
Srirangan Madhavan <smadhavan@nvidia.com> wrote:

> Define SMCCC Arch function IDs for CLEAN_INV_MEMREGION and its ATTRIBUTES
> call, and add RATE_LIMITED/BUSY return codes from DEN0028 for callers that
> need transient error handling.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>

I assume beta spec is enough to merge this?  Probably just need
someone from Arm to confirm.  Last time we had this feature and it got
ripped out it only made it to an alpha spec (which is not enough!)

Jonathan


