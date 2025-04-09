Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A70CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UIP4ZGix9p5MaH9RHiON2iNZ1qNwydPjYtJFAn6h60=; b=AvVZqHAUwsyJT8zE2QYHtn3EHe
	MivMs5pZxNbldUu9HyIytg/bf2XUmsDlo8M61LDOq5y0LTayetgykTyCm30tMSVpiKGC/TQEmpulb
	49v7G7Kw+w62fjWHkpbUj+sGC9RVQEUrv6X9QDBgOfFkX7YxnRlodCqqaCsq7Ayr7QPLLvs3fl1P+
	aQJNQkmssFlJFwXJIvu6wc3XvPmU75ecIjtZJy0EW1dQAqaOOFg+TfzQ0pFc0WaustVIi/uR1phIG
	L2rKzXBIR6y5jhEX404YjcY6pBfkPpcoLG14e2t5e3eHghCGGK5ByQTnexnzvTMOpEwkMV/YTBNWr
	ziqoQrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UX7-000000078ua-1lqs;
	Wed, 09 Apr 2025 12:27:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TNN-00000006xfT-44mq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:13:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744197226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1UIP4ZGix9p5MaH9RHiON2iNZ1qNwydPjYtJFAn6h60=;
	b=ndkVFXp2m4OiYv7D2NIsqsFhmpQaMrSMq4M/Fxl214eOX7BqCBLgBejQ21mYGWpaoi+Sed
	fiChITipD81wOCRi1M013UAXtjJ8J6bKfMJYV1HWIIDrukJA6EYi75IbNO9Y3p0eGnjNJj
	qxCEh2pnxJuTBIYoHrH09g6phqYuPdkGfnqjCf//lvjqIY2aU8etRxte3SLw7MEaCPoDkS
	/l6+j6s0C5wQiifRFsEnK6u/w9o2aw+nK+fSQBlY7Ks9EIm0gFH4UHtBNWirDgvr6VqJKu
	KS/1NxaCjEu+Vg4I1Y2I8mlQqJFIlJzoAhpOnOPOxI38446wm31YohyCasKkMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744197226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1UIP4ZGix9p5MaH9RHiON2iNZ1qNwydPjYtJFAn6h60=;
	b=T3ygFDeiKIpY65OR/wfBjvG7m5xLPXI2LXSCfvJFe1hMWt2WW8vCSUQfhLAenBcfB8+5oZ
	dJ6r7/B2gnhDWvBA==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 22/24] irqchip/gic-v5: Add GICv5 ITS support
In-Reply-To: <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
Date: Wed, 09 Apr 2025 13:13:46 +0200
Message-ID: <87tt6xtwnp.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_041350_154289_83D710B6 
X-CRM114-Status: UNSURE (   9.14  )
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

On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
>  
> +void gicv5_irs_syncr(void)
> +{
> +	u32 syncr;
> +	u32 statusr;
> +	int ret;
> +	struct gicv5_irs_chip_data *irs_data;
> +
> +	irs_data = list_first_entry_or_null(&irs_nodes,
> +					    struct gicv5_irs_chip_data, entry);
> +	if (WARN_ON(!irs_data))
> +		return;
> +
> +	syncr = FIELD_PREP(GICV5_IRS_SYNCR_SYNC, 1);
> +	irs_writel(irs_data, syncr, GICV5_IRS_SYNCR);
> +
> +	ret = readl_relaxed_poll_timeout_atomic(
> +			irs_data->irs_base + GICV5_IRS_SYNC_STATUSR, statusr,
> +			FIELD_GET(GICV5_IRS_SYNC_STATUSR_IDLE, statusr), 1,
> +			USEC_PER_SEC);
> +
> +	if (ret == -ETIMEDOUT)
> +		pr_err_ratelimited("SYNCR timeout...\n");

This timeout poll thing looks very familiar by now. Third variant :)

> +static int gicv5_its_wait_for_invalidation(struct gicv5_its_chip_data *its)
> +{
> +	int ret;
> +	u32 statusr;
> +
> +	ret = readl_relaxed_poll_timeout_atomic(
> +			its->its_base + GICV5_ITS_STATUSR, statusr,
> +			FIELD_GET(GICV5_ITS_STATUSR_IDLE, statusr), 1,
> +			USEC_PER_SEC);
> +
> +	if (ret == -ETIMEDOUT)
> +		pr_err_ratelimited("STATUSR timeout...\n");
> +
> +	return ret;
> +}

And number four follows suit :)

> +
> +static void gicv5_its_syncr(struct gicv5_its_chip_data *its,
> +			    struct gicv5_its_dev *its_dev)
> +{
> +	int ret;
> +	u64 syncr;
> +	u32 statusr;
> +
> +	syncr = FIELD_PREP(GICV5_ITS_SYNCR_SYNC, 1) |
> +		FIELD_PREP(GICV5_ITS_SYNCR_DEVICEID, its_dev->device_id);
> +
> +	its_writeq(its, syncr, GICV5_ITS_SYNCR);
> +
> +	ret = readl_relaxed_poll_timeout_atomic(
> +			its->its_base + GICV5_ITS_SYNC_STATUSR, statusr,
> +			FIELD_GET(GICV5_ITS_SYNC_STATUSR_IDLE, statusr), 1,
> +			USEC_PER_SEC);
> +
> +	if (ret == -ETIMEDOUT)
> +		pr_err_ratelimited("SYNCR timeout...\n");
> +}

Along with #5 

Thanks,

        tglx

