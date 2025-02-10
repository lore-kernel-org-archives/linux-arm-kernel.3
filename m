Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97150C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4q8A/QNPo7f3delSEdi+al1Uy+9aScXUwI7BSMw6+q8=; b=EosJfVVw8mUMJpNCa30sTX89FV
	+ePuy64H4FQU/ysLEiLaMcWnGHaERfpw02uk7r88mBy7av9YjoCm6Qx3LhN0+er0fDSYnFhZhzgwv
	zPpdDqcUhZEw/7HDOn9rTbLcbTr7wNGirYNPpBk52cUAWxLWSK9RaeLr2NFyw4pZD/Y0fIdiNhZG2
	uWjkvhz/C1fvAGQqsZgNuKYbDqNdGUgzCMoBFORV5maKQur46qkSxOodkHX+1xNC1a0NriJD3dTfF
	WuU9p7PDn0l2NoYSAMUtPWhBh6vZnzJG665tYdTU1G9c0mwkCmRWeeyY9o9ZgdUqSevGRQZNK58jI
	lRjCNA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcyX-00000001o9m-339e;
	Mon, 10 Feb 2025 23:14:02 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thccd-00000001jaN-3xdQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 22:51:25 +0000
Date: Mon, 10 Feb 2025 14:51:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739227880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4q8A/QNPo7f3delSEdi+al1Uy+9aScXUwI7BSMw6+q8=;
	b=HGtNENBkTFlyb6xBS1L8/B0qGpQouXyiWEflyGuIGHh+KvDndIZ7P+hpHQ0t3S47KUZcRS
	toE1B/HsviDHWSl/SGgcg1si7hu7DKHqIFd3FsKKWH151bCKf0lxu9IV6+Xx54fjYze3hA
	kLR2lsexxEq71S9yFlJb84I/XvY91KI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	pbonzini@redhat.com, stable@vger.kernel.org, tabba@google.com,
	wilco.dijkstra@arm.com, will@kernel.org
Subject: Re: [PATCH v3 0/8] KVM: arm64: FPSIMD/SVE/SME fixes
Message-ID: <Z6qC4qn47ONfDCSH@linux.dev>
References: <20250210195226.1215254-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210195226.1215254-1-mark.rutland@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_145124_195532_241C46EE 
X-CRM114-Status: GOOD (  14.20  )
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

On Mon, Feb 10, 2025 at 07:52:18PM +0000, Mark Rutland wrote:
> These patches fix some issues with the way KVM manages FPSIMD/SVE/SME
> state. The series supersedes my earlier attempt at fixing the host SVE
> state corruption issue:
> 
>   https://lore.kernel.org/linux-arm-kernel/20250121100026.3974971-1-mark.rutland@arm.com/
> 
> Patch 1 addresses the host SVE state corruption issue by always saving
> and unbinding the host state when loading a vCPU, as discussed on the
> earlier patch:
> 
>   https://lore.kernel.org/linux-arm-kernel/Z4--YuG5SWrP_pW7@J2N7QTR9R3/
>   https://lore.kernel.org/linux-arm-kernel/86plkful48.wl-maz@kernel.org/
> 
> Patches 2 to 4 remove code made redundant by patch 1. These probably
> warrant backporting along with patch 1 as there is some historical
> brokenness in the code they remove.
> 
> Patches 5 to 7 are preparatory refactoring for patch 8, and are not
> intended to have any functional impact.
> 
> Patch 8 addresses some mismanagement of ZCR_EL{1,2} which can result in
> the host VMM unexpectedly receiving a SIGKILL. To fix this, we eagerly
> switch ZCR_EL{1,2} at guest<->host transitions, as discussed on another
> series:
> 
>   https://lore.kernel.org/linux-arm-kernel/Z4pAMaEYvdLpmbg2@J2N7QTR9R3/
>   https://lore.kernel.org/linux-arm-kernel/86o6zzukwr.wl-maz@kernel.org/
>   https://lore.kernel.org/linux-arm-kernel/Z5Dc-WMu2azhTuMn@J2N7QTR9R3/
> 
> The end result is that KVM loses ~100 lines of code, and becomes a bit
> simpler to reason about.

LGTM, although a minor nitpick would be to repack the host data flags at
the end of purging SVE/SME.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

