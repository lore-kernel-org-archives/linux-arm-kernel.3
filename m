Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA574CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rq4VuXYr7X3SPAruE7m8S4LlTrkKaJy2smPTdvrVyCk=; b=Vje1h3odGfOvVT3D0atT019Cd9
	rT4DuKcZajnOXzRcluWZ4NnBQ+bPdkDOUZ4L0vNgns4D+gAY1knDODKqb4MnRraTeQJ5cZDqNWm2d
	7OXjsihrrNtPX8lC8ICp1B3pIOxImvok2M01HXAiHwAfhBPgx/z0rGJSDsQTudsByXY0/qr76FUqI
	dIT2N3OF9pHyWNvPi92QUOG76St2LKcSV++sjU+X7NsIE6zx5jDMeifsh7HYCAxS1q355m/kITfQe
	9FMkMhCyg0fkDTZ2qb9IK8nDPcIb0YvV06JnU+ddBVMC59VCHi51cVBLl4xqqw+hIk2Jnk972XuBb
	MfNNSYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVAS-00000002GfS-3DQg;
	Wed, 22 Oct 2025 09:30:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVAQ-00000002Gf5-1kJ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:30:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEC5A1063;
	Wed, 22 Oct 2025 02:29:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 555603F59E;
	Wed, 22 Oct 2025 02:30:00 -0700 (PDT)
Date: Wed, 22 Oct 2025 10:29:58 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	james.clark@linaro.org
Subject: Re: [PATCH 1/1] coresight: fix issue where coresight component has
 no claimtags
Message-ID: <20251022092958.GQ281971@e132581.arm.com>
References: <20251021234520.3355-1-mike.leach@linaro.org>
 <20251021234520.3355-2-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021234520.3355-2-mike.leach@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_023002_550465_CEE97405 
X-CRM114-Status: GOOD (  15.37  )
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

On Wed, Oct 22, 2025 at 12:45:20AM +0100, Mike Leach wrote:

[...]

> +/*
> + * Reading CLIAMSET returns  a bitfield representing the number of claim tags
> + * implemented from bit 0 to bit nTag-1, valid bits set to 1.
> + *
> + * Claim protocol requires 2 bits so test for highest bit required,
> + * bit 1 -  CORESIGHT_CLAIM_SELF_HOSTED_BIT
> + *
> + * return true if sufficient claim tags implemented for protocol
> + */
> +static bool coresight_claim_tags_implemented_unlocked(struct csdev_access *csa)
> +{
> +	u32 claim_bits_impl = FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
> +			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
> +	return ((claim_bits_impl & CORESIGHT_CLAIM_SELF_HOSTED_BIT) != 0);
> +}
> +

The logic looks good to me.

Can we improve a bit with a cached flag to avoid every time checking the
CLAIMSET, we can read it only once at init time instead.

- We can add a new flag ("bool claim_impl" in the struct csdev_access),
  by default the field will be zero.

- The drivers support claim tags call coresight_clear_self_claim_tag()
  in probe (see __catu_probe() as an example), we can call a new
  function coresight_init_claim_tag() to replace it, this function sets
  "claim_impl" properly and clear the tag if supported.

- Afterwards, simply check the "claim_impl" flag.

[...]

> +/*
> + * Coresight specification defines a maximum of 8 claim tag bits.
> + * The precise number is implementation defined, and may be obtained by
> + * reading the CLAIMSET register.
> + */
> +#define CORESIGHT_CLAIM_BITS_MAX_MASK	GENMASK(7, 0)
> +#define CORESIGHT_CLAIM_SELF_HOSTED_BIT	BIT(1)

Now we only care about the self-host bit. Can reuse existed macros ?

  CORESIGHT_CLAIM_MASK
  CORESIGHT_CLAIM_SELF_HOSTED

I don't mind if extend CORESIGHT_CLAIM_MASK to 8 bits and even remove
CORESIGHT_CLAIM_INVALID (as it cannot cover other invalid values). Or we
can defer the extension as needed later.

Thanks,
Leo

