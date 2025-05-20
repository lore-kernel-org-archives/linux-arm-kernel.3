Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE62CC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuxFXy+/pXyQeA81WFgS3kPCN3DUNRK3QXsrxHJt/RU=; b=jDKw+5qyLHYHGB+2Qgw34q+qsl
	kCvsrZGKKfXioIFHa+Lh2UluDs7bJRef/IsP8oAkAu43u/deTeyQGZQq15mOmeSKC0t4Ol3cXHYjC
	QEcPKdBLwgKVcCj5Hk08oHVuZIE9lJxoywBpnzu54/ovlIXLK6C3M5Z8JNAh/wXnFQ0TEDfdb9IAQ
	bEq8he/UFwknGIOA5Q+YeuHGwff0yi4hXom4SxIlzRC27Zg7olSPJrq9CWIQYhc5zTCUn3K4IyX1k
	vUb5uGfoRVJYIVXoBmICbBDXXM2DPKwvnfPQGaAMwqlLXYQAvMOB5pD3Ah5RKIomrfDXu+puAxR/T
	smycVohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPZr-0000000DTGj-3G7L;
	Tue, 20 May 2025 16:12:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP0n-0000000DN7q-3xqW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:36:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85F0B44BAC;
	Tue, 20 May 2025 15:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35000C4CEE9;
	Tue, 20 May 2025 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755373;
	bh=G2lcfa42ek03+r0T73qqFi2p0Xawuf3PxSiXjeQGJkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sy0JsItTasNS65ObqzqM8iAPPd7yznxxU8PhanFqXdVvr++fyiUfhnv3yHezMin70
	 BaBQS2dv03PgIjYFSpD1xB5XRjb553eQ8S0nEMt1nj8qw7zlvPJx9WadKnt06HlgKh
	 1D5LjVLwnaxjmu97ab9mFGA586QVWfcf0sYeu6EZhIkgiuW2Nk3aThJmxy6E8TnUp7
	 BNS4mT24Azm7ZHh4CSGSJy+O/nuQrEHbC+aFAoIzCnZ3KQCZAvw+46QawYGmOTzNyK
	 nF4zkt97ION6Gobghj57Xnm0+oAzbp+IG8G3KCk2hswPQs4KYnpcA8f5UG+8GbT2HK
	 kydWtYsA1vCOQ==
Date: Tue, 20 May 2025 16:36:09 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 04/11] arm64: debug: remove break/step handler
 registration infrastructure
Message-ID: <20250520153608.GD18901@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-5-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512174326.133905-5-ada.coupriediaz@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_083614_000649_850D56BE 
X-CRM114-Status: UNSURE (   9.20  )
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

On Mon, May 12, 2025 at 06:43:19PM +0100, Ada Couprie Diaz wrote:
> Remove all infrastructure for the dynamic registration previously used by
> software breakpoints and stepping handlers.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/debug-monitors.h | 24 ----------
>  arch/arm64/kernel/debug-monitors.c      | 63 -------------------------
>  2 files changed, 87 deletions(-)

Nice!

Will

