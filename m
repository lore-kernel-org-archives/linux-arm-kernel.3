Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B847AC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWukjqPo3WH6mQBPSuoixeViVlD2Ir50AnE3xl/qzww=; b=USOwlnGS+71tQic0FjqL52BQP+
	7PQ1utCahWQfi+sFrS9mhI1DZ0Wy3mi6218tI4Z/5odsp9QpW97ZESOGk+q0Rwub2wHSZQy3Abxx1
	QS08cE5hWk24OiKURlw/jRWVBdRgXklhiCgJpFSCAMA31OFliXUnRRBQr1/nhoMNZiNIay71x3iYJ
	aA3Rd//fVMiV6BQwtB94jPCJg9WKQ0Mf3uj7IqPIykJj18aNsDgKxb64xYowMT/ehOz84IE7Lc1jv
	mFuqD0sbFXNL+cigfHg5FI1iryBE7z2ldrKqlsHTBf90z0Wt4hXv8YWbS5w9iqrbROIorclDdHnaW
	vPPor3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rFQ-00000008Phm-1FK1;
	Tue, 08 Sep 2026 08:32:08 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rFO-00000008Ph1-07bB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788856326; x=1820392326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nOT4Eoib7zA3suYgkaqyyF849Y+bZjaLnTlxfZH8Emg=;
  b=lExQIWbDrxBK5Flk/H90pE0DbSdAsKeN0Hs/Y6jg6RwGrxVKMZs4BQ4h
   8eiUYrcouP70ajdcibQfvjqkFciFmYkk81OvQ5Dpz8XK/NCK/0mYTZhq1
   LnoFCrcst/exTe5J38+Cp/PnSHOoCWEQPAEY2GLg0HuzNP5ElnrvOKYeE
   5EbiWday+qevVno2xMzkE9p0F8FyQ0DX9xQZCmoiB7u9FqZhzG1hJHZEq
   0Hd0S3KDzSoNTt8xmLxuHrir/mEZRaw40Nrh1ECMU3d0B3Gg0hd3ut6H0
   yvtOTnCuYPkYtij0AyFr3fDHL13hUTCF4S1wcqwa2eHDD3j80JyLZ5XkB
   A==;
X-CSE-ConnectionGUID: EWn4toLjRUuInqvH5G3aNQ==
X-CSE-MsgGUID: Vp6wfmKoTWCXHrJPQaQfAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100607211"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="100607211"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:32:05 -0700
X-CSE-ConnectionGUID: L0vP5RY3Q8CzJ4V843MEdg==
X-CSE-MsgGUID: s0OkRcE2TVSoxzUM3lwz2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="295832154"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2026 01:32:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A80BF99; Tue, 08 Sep 2026 10:32:00 +0200 (CEST)
Date: Tue, 8 Sep 2026 10:32:00 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 13/22] thunderbolt: Add ring register accessors to
 tb_nhi_ops
Message-ID: <20260908083200.GB106095@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-13-1f80085f93fb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-13-1f80085f93fb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_013206_094260_39DDF0E0 
X-CRM114-Status: GOOD (  28.35  )
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

Hi,

On Sun, Sep 06, 2026 at 08:36:36PM +0200, Sven Peter wrote:
> The ring descriptor and options registers are laid out differently on
> the Apple NHI. Add optional tb_nhi_ops hooks for their base addresses
> which fall back to the standard USB4 register layout when they are not
> set.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/nhi.c | 32 ++++++++++++++++++++++++++------
>  drivers/thunderbolt/nhi.h |  6 ++++++
>  2 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index fc54ff7edfb9..1b1e4a12c744 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -179,19 +179,37 @@ void nhi_disable_interrupts(struct tb_nhi *nhi)
>  static void __iomem *ring_desc_base(struct tb_ring *ring)
>  {
>  	void __iomem *io = ring->nhi->iobase;
> +

Unintended change?

>  	io += ring->is_tx ? REG_TX_RING_BASE : REG_RX_RING_BASE;
>  	io += ring->hop * 16;
>  	return io;
>  }
>  
> +static void __iomem *nhi_ring_desc_base(struct tb_ring *ring)
> +{
> +	if (ring->nhi->ops->ring_desc_base)
> +		return ring->nhi->ops->ring_desc_base(ring);
> +
> +	return ring_desc_base(ring);
> +}
> +
>  static void __iomem *ring_options_base(struct tb_ring *ring)
>  {
>  	void __iomem *io = ring->nhi->iobase;
> +

Ditto here.

>  	io += ring->is_tx ? REG_TX_OPTIONS_BASE : REG_RX_OPTIONS_BASE;
>  	io += ring->hop * 32;
>  	return io;
>  }
>  
> +static void __iomem *nhi_ring_options_base(struct tb_ring *ring)
> +{
> +	if (ring->nhi->ops->ring_options_base)
> +		return ring->nhi->ops->ring_options_base(ring);
> +
> +	return ring_options_base(ring);

This is better IMO. Although I think even better would be to populate
nhi->ops for both the standard NHI and for Apple (and possibly others) and
then we can just do:

	ring->nhi->ops->ring_options_base(..)

or with a wrapper like this that makes it slightly more readable.

It does not need to be part of this series but wanted to mention here.

> +}
> +
>  static void ring_iowrite_cons(struct tb_ring *ring, u16 cons)
>  {
>  	/*
> @@ -199,29 +217,31 @@ static void ring_iowrite_cons(struct tb_ring *ring, u16 cons)
>  	 * are ignored by the hardware so we can save one ioread32() by
>  	 * filling the read-only bits with zeroes.
>  	 */
> -	iowrite32(cons, ring_desc_base(ring) + 8);
> +	iowrite32(cons, nhi_ring_desc_base(ring) + 8);
>  }
>  
>  static void ring_iowrite_prod(struct tb_ring *ring, u16 prod)
>  {
>  	/* See ring_iowrite_cons() above for explanation */
> -	iowrite32(prod << 16, ring_desc_base(ring) + 8);
> +	iowrite32(prod << 16, nhi_ring_desc_base(ring) + 8);
>  }
>  
>  static void ring_iowrite32desc(struct tb_ring *ring, u32 value, u32 offset)
>  {
> -	iowrite32(value, ring_desc_base(ring) + offset);
> +	iowrite32(value, nhi_ring_desc_base(ring) + offset);
>  }
>  
>  static void ring_iowrite64desc(struct tb_ring *ring, u64 value, u32 offset)
>  {
> -	iowrite32(value, ring_desc_base(ring) + offset);
> -	iowrite32(value >> 32, ring_desc_base(ring) + offset + 4);
> +	void __iomem *base = nhi_ring_desc_base(ring);
> +
> +	iowrite32(value, base + offset);
> +	iowrite32(value >> 32, base + offset + 4);
>  }
>  
>  static void ring_iowrite32options(struct tb_ring *ring, u32 value, u32 offset)
>  {
> -	iowrite32(value, ring_options_base(ring) + offset);
> +	iowrite32(value, nhi_ring_options_base(ring) + offset);
>  }
>  
>  static bool ring_full(struct tb_ring *ring)
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index 4884c3f5a2b2..3a963b0b5b46 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -52,6 +52,10 @@ extern const struct dev_pm_ops nhi_pm_ops;
>   * @post_nvm_auth: hook to run after Thunderbolt 3 NVM authentication
>   * @request_ring_irq: NHI specific interrupt retrieval hook
>   * @release_ring_irq: NHI specific interrupt release hook
> + * @ring_desc_base: NHI specific hook returning the ring descriptor registers.
> + *		    If not set the standard USB4 NHI registers are used.
> + * @ring_options_base: NHI specific hook returning the ring option registers.
> + *		       If not set the standard USB4 NHI registers are used.
>   * @ring_interrupt_active: NHI specific hook to activate/deactivate the
>   *			   interrupt of a single ring. If not set the
>   *			   standard USB4 NHI registers are used.
> @@ -70,6 +74,8 @@ struct tb_nhi_ops {
>  	void (*post_nvm_auth)(struct tb_nhi *nhi);
>  	int (*request_ring_irq)(struct tb_ring *ring, bool no_suspend);
>  	void (*release_ring_irq)(struct tb_ring *ring);
> +	void __iomem *(*ring_desc_base)(struct tb_ring *ring);
> +	void __iomem *(*ring_options_base)(struct tb_ring *ring);
>  	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
>  	bool (*is_present)(struct tb_nhi *nhi);
>  	int (*init_interrupts)(struct tb_nhi *nhi);
> 
> -- 
> 2.55.0
> 

