Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DA5CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yqtQVPXwcWR3ybe8ddbUaUI+JYT3+ddN0veNYVOM4w=; b=IbZFm4sPAxMOtDpilyaY5pnO/U
	xgtX3bwyJOLC1fLKsHxg3VoZ+Qt00VOYsaFmy7WCvkq47MRxEtiVAoDDswK+uQZTM+bKhyWn4GW0s
	godijUorhNPo52yrhl+gzlti7QAlpOEcJL4hxrkZdlxAArJdkfc3mYcVJBrRwOA3YUQQSTqcmhr7X
	bT4ZSmNdK1eCyjWjs6brJ2qmf8I17Bubz72kgAPw7WNyfObBgtjdVxDbBCGKwMlw1+Cw1I531XycI
	VWmyzkKvTM4sPzn2OMeUBbpot7Ho0jEdYydEpIEQIeJ0/pwa4VWC97iMIAZy312iIfx43q/dKUFVD
	DMmk3hbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzWe-00000007kpn-1KHo;
	Fri, 29 May 2026 15:53:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzV4-00000007k5s-3JuP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:51:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF3FA605D0;
	Fri, 29 May 2026 15:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3021E1F00A05;
	Fri, 29 May 2026 15:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780069913;
	bh=7yqtQVPXwcWR3ybe8ddbUaUI+JYT3+ddN0veNYVOM4w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aeZ68ouWftToQr80mwZCwNLEwvgjKh/e5hfldpXX+R8HdOxIvpgVft23bsbxnxKuR
	 yq/E494ckkkKm14enuR2mI6eBuwWNlz3u/K0OvrjKhyUOO/K5G9KHJ1L0xmpf2XM4n
	 dClKZah5qaaZ6KC5lMfldlgbqV2066b0ouUq9PenREfJkyN6+fakrqnf3gpiDJ2lgG
	 tk6Hmerw6hG9nT539jQV1EYJrPjeEv5Pj9mUtcA17Yz2ktKNEsFJrpcEe2E5gmeQQX
	 L5IoJ1kRfnsqcYphAEzmFkPzpC/aQuQQ5mj9/16ktW6bYVifGvIPo3xcDe0LJm8a8j
	 ydD+IuaTxoD1A==
Date: Fri, 29 May 2026 16:51:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: will@kernel.org, xueshuai@linux.alibaba.com, saket.dumbre@intel.com,
 mchehab@kernel.org, dave@stgolabs.net, djbw@kernel.org, bp@alien8.de,
 tony.luck@intel.com, guohanjun@huawei.com, lenb@kernel.org,
 skhan@linuxfoundation.org, vishal.l.verma@intel.com, rafael@kernel.org,
 corbet@lwn.net, ira.weiny@intel.com, dave.jiang@intel.com,
 krzk+dt@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
 alison.schofield@intel.com, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael.Zhao2@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org, Dmitry.Lamerov@arm.com,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 02/10] ACPI: APEI: GHES: move CPER read helpers
Message-ID: <20260529165137.0cd56e6e@jic23-huawei>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-2-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
	<20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-2-2e0500d42642@arm.com>
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

On Fri, 29 May 2026 10:50:42 +0100
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Relocate the CPER buffer mapping, peek, and clear helpers from ghes.c into
> ghes_cper.c so they can be shared with other firmware-first providers.
> This commit only shuffles code; behavior stays the same.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>

A couple of things I noticed whilst quickly scan through what was moved inline.

Move itself looks fine to me.
Reviewed-by: Jonathan Cameron <jic23@kernel.org>

> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> new file mode 100644
> index 000000000000..7bb72fe57838
> --- /dev/null
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -0,0 +1,195 @@

> +
> +/* Check the top-level record header has an appropriate size. */
> +int __ghes_check_estatus(struct ghes *ghes,
> +			 struct acpi_hest_generic_status *estatus)
> +{
> +	u32 len = cper_estatus_len(estatus);
> +	u32 max_len = min(ghes->generic->error_block_length,
> +			  ghes->estatus_length);
> +
> +	if (len < sizeof(*estatus)) {
> +		pr_warn_ratelimited(FW_WARN GHES_PFX "Truncated error status block!\n");
> +		return -EIO;
> +	}
> +
> +	if (!len || len > max_len) {

Obviously this is just a move, but that if !len is silly given that will have failed
the previous check as 0 is definitely less than sizeof(*estatus)

Maybe add a trivial patch to tidy this up and any similar oddities.


> +		pr_warn_ratelimited(FW_WARN GHES_PFX "Invalid error status block length!\n");
> +		return -EIO;
> +	}
> +
> +	if (cper_estatus_check_header(estatus)) {
> +		pr_warn_ratelimited(FW_WARN GHES_PFX "Invalid CPER header!\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Read the CPER block, returning its address, and header in estatus. */
> +int __ghes_peek_estatus(struct ghes *ghes,
> +			struct acpi_hest_generic_status *estatus,
> +			u64 *buf_paddr, enum fixed_addresses fixmap_idx)
> +{
> +	struct acpi_hest_generic *g = ghes->generic;
> +	int rc;
> +
> +	rc = apei_read(buf_paddr, &g->error_status_address);
> +	if (rc) {
> +		*buf_paddr = 0;
> +		pr_warn_ratelimited(FW_WARN GHES_PFX
> +				    "Failed to read error status block address for hardware error source: %d.\n",
> +				   g->header.source_id);

Whilst you are here I don't think anyone would mind if you fix the alignment.
Looks like it's one space short.

> +		return -EIO;
> +	}
> +	if (!*buf_paddr)
> +		return -ENOENT;
> +
> +	ghes_copy_tofrom_phys(estatus, *buf_paddr, sizeof(*estatus), 1,
> +			      fixmap_idx);
> +	if (!estatus->block_status) {
> +		*buf_paddr = 0;
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}


