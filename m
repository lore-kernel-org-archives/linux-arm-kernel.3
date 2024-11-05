Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E59D3E773
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 21:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4AAGHq98f/2bOvzTIrNfRJRjw7gM/lfEoOYvvlJdnI=; b=gkDLVSvMvNIo46G6NfyTetaSvk
	jGAwBhB5oSNOcJt7fiEQ9aFLbfjB7K9PsoRGeOVUIlZCcBIoDpK+0xQZLDdUCnihGJCfFzBn6Y8ud
	CXTMLE+7B81VO7IUnxD7v9hBmLFF4d4D6A/SSq3ovmJMjT2d+a5zYFsWCeT7N+UcuEF8zkoKxfyfG
	aaZmM8Y7JzLIkV4b7H/BHlgA9hNNhPC7tKeDz3sXUhmyCxyztKFmL61MF7IPbFIHbCCDHRQ1rlpX9
	8FqHnpOFtCDPdff2SB3gK3Ng2A24TdSqbwTSzK6mWTvq22pGxFCKo3eh0SOwEk+DeJW1X+7POrEug
	pysvtO6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8REh-00000000ssp-3MTf;
	Tue, 05 Nov 2024 21:37:15 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8RBO-00000000sP9-1XmR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 21:33:52 +0000
Date: Tue, 5 Nov 2024 13:33:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730842425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h4AAGHq98f/2bOvzTIrNfRJRjw7gM/lfEoOYvvlJdnI=;
	b=bFhytUZOyC/f1TCNrAfrs28StEuuNrIcK7n5DpDtR8IaFGfxVzXkGjNW2HcFGk6j5xXsWd
	rZQFPH3nqbS3JApRSRnLpTi+xGik0iw7OjGeHrI3TQvSs528rYUA9ehEqAa/K4xIArEzOH
	5T044bjv0otgWZozioGZ7ANKt06Bcac=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jing Zhang <jingzhangos@google.com>
Cc: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>,
	ARMLinux <linux-arm-kernel@lists.infradead.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@google.com>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Colton Lewis <coltonlewis@google.coma>,
	Raghavendra Rao Ananta <rananta@google.com>
Subject: Re: [PATCH v1 0/4] Fix a bug in VGIC ITS tables' save/restore
Message-ID: <ZyqPMdH4anLEIq8G@linux.dev>
References: <20241105193422.1094875-1-jingzhangos@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105193422.1094875-1-jingzhangos@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_133350_625616_90B4DC19 
X-CRM114-Status: GOOD (  10.91  )
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

Hi Jing,

On Tue, Nov 05, 2024 at 11:34:18AM -0800, Jing Zhang wrote:
> The core issue stems from the static linked list implementation of DTEs/ITEs,
> requiring a full table scan to locate the list head during restoration. This
> scan increases the likelihood of encountering orphaned entries.  To rectify
> this, the patch series introduces a dummy head to the list, enabling immediate
> access to the list head and bypassing the scan. This optimization not only
> resolves the bug but also significantly enhances restore performance,
> particularly in edge cases where valid entries reside at the end of the table.

I think we need a more targeted fix (i.e. Kunkun's patch) to stop the
bleeding + backport it to stable.

Then we can have a separate discussion about improving the save/restore
performance with your approach.

-- 
Thanks,
Oliver

