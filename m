Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018F3C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkVH/Hsg9hB9Y2BLlDZT0e74j6PashM/qtkt3KqxLxI=; b=x0E+bP0fcUfcqWFrWCqKkIu3Ad
	k4F9BwVPbDqkrgN0HxvAQ8ZBFqGryjLJUspq0MKtzdOxFSevIf5oAkK33IFgTAaFIfGyJRnttXRH8
	/BShk6dVPY5YXtKVit6SiSeB19tLjTV7YMCkt8cGVftJHcipKTbM7J3BqmrIPKK8M6UaqwghpswE3
	20F5VNJZ3S3uQCdC9/AJ8j04hJ52VtRSPuRWmUJk9Q8JMxV3tKwCnWlBZu+kSx503UThyiVrI2IWq
	cD97x6c+n7SgFL2k9CkJfnnLczs3q+ajiSOCF35Qxr1Eepn4qzU8IlV+OVdGb20wL0QNO5rjw1aSI
	UWnp9R/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYsY-0000000BqV1-2PK0;
	Tue, 03 Jun 2025 21:09:02 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYqP-0000000BqGv-0sD5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 21:06:50 +0000
Date: Tue, 3 Jun 2025 14:06:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748984804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wkVH/Hsg9hB9Y2BLlDZT0e74j6PashM/qtkt3KqxLxI=;
	b=tHxpb7PFMY8sMvhN2hJvEZit1pYw5EZZyXgVPMplJr63WNjOf8QUP+s6trYMwAhxnz7gL/
	gXx7D52UlqUGvZiX0GFXMWSbDBr4gh2GSRgAjrmIQWZMie+wGZkfYPAglUR9GaCJJboPDI
	n8htmCWVqG2hxEq/SMSBbGQpCwkymD8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 0/4] KVM: arm64: vcpu sysreg accessor rework
Message-ID: <aD9isAgEuvPL02ER@linux.dev>
References: <20250603070824.1192795-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603070824.1192795-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_140649_538714_073A45F3 
X-CRM114-Status: GOOD (  16.81  )
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

On Tue, Jun 03, 2025 at 08:08:20AM +0100, Marc Zyngier wrote:
> This series tries to bring some sanity to the way the RESx masks
> are applied when accessing the in-memory view of the guest's
> system registers.
> 
> Currently, we have *one* accessor (__vcpu_sys_reg()) that can either
> be used as a rvalue or lvalue while that applies the RESx masks behind
> the scenes. This works fine when used as a rvalue.
> 
> However, when used as a lvalue, it does the wrong thing, as it only
> sanitises the value we're about to overwrite. This is pointless work
> and potentially hides bugs.
> 
> I propose that we move to a set of store-specific accessors (for
> assignments and RMW) instead of the lvalue hack, ensuring that the
> assigned value is the one that gets sanitised. This then allows the 
> legacy accessor to be converted to rvalue-only.

Very happy with how this is shaping up.

> Given the level of churn this introduces, I'd like this to land very
> early in the cycle. Either before 6.16-rc2, or early in 6.17.

What's your mood on sneaking this in as a fix for 6.16? It'd fix the
unmasked write bug you mention and hopefully give a semi-stable / early
base for building the 6.17 content on top off.

Otherwise this will be the very first thing I take for 6.17.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

