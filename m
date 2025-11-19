Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B7FCF58C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuNRby7NdcWxMmZeXODk0ld0bu0i8Jt1vMdjgXvRLKA=; b=uuzhgSpg/HhnEsUZwNqxd6iyw1
	R6xmr/2vzK3AyVF0BI4OcsU7yZUmFoLKJhZVh1sGzzntkqVFJFHpylsqgXI3DqpyTx/xu3ny8ra5S
	dT5qBPAv5foEwI9D+VQuT2n7KHaf8ag3ScmDoPFGhJRBpRsU7VSrMpGgtu+HnPwq6/VpuSeHmIDaf
	tNY14GjAuDxeJCOfU3ewey1+p6iLRymHOTywQyiOwgfEeZvFiMjaOrpLDdmGPH1j+ORY3RI8F/OcB
	9AfeR+9OQQzLfIJd/w9vvkaRhcnlSCH4eLpmX+zGOS2SnAP9Dub/3tfD1yQyhQLj3bKAVq+WSGRC7
	5dOc5+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmX8-00000004OSL-2ZDQ;
	Wed, 19 Nov 2025 18:03:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmX6-00000004OOm-03OS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:03:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E17FAFEC;
	Wed, 19 Nov 2025 10:03:46 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 067983F740;
	Wed, 19 Nov 2025 10:03:52 -0800 (PST)
Date: Wed, 19 Nov 2025 18:03:50 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, ryan.roberts@arm.com, rppt@kernel.org,
	shijie@os.amperecomputing.com, yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/pageattr: Propagate return value from
 __change_memory_common
Message-ID: <aR4GhuhEISNSSbUf@arm.com>
References: <20251112062716.64801-1-dev.jain@arm.com>
 <20251112062716.64801-2-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112062716.64801-2-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_100356_095203_91DEBCD6 
X-CRM114-Status: GOOD (  12.31  )
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

On Wed, Nov 12, 2025 at 11:57:15AM +0530, Dev Jain wrote:
> The rodata=on security measure requires that any code path which does
> vmalloc -> set_memory_ro/set_memory_rox must protect the linear map alias
> too. Therefore, if such a call fails, we must abort set_memory_* and caller
> must take appropriate action; currently we are suppressing the error, and
> there is a real chance of such an error arising post commit a166563e7ec3
> ("arm64: mm: support large block mapping when rodata=full"). Therefore,
> propagate any error to the caller.
> 
> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> v1 of this patch: https://lore.kernel.org/all/20251103061306.82034-1-dev.jain@arm.com/
> I have dropped stable since no real chance of failure was there.

I couldn't figure out from the comments on v1 whether Will's concern was
addressed:

https://lore.kernel.org/all/aQn4EwKar66UZ7rz@willie-the-truck/

IOW, is the patch necessary? What are the failure scenarios and what
does the caller do? It's good to propagate an error to the caller but
patch also changes the current behaviour by bailing out earlier.

-- 
Catalin

