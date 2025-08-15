Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85D6CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJWE0fXapacd+gC8whLCJ/jKuWcD9pMQH4hrEj0P1qc=; b=KLaZ08TxNVfGR+Xo8fp+Xexkx9
	zOMal9z83bN5q2teG24wFNjA+DlRTSMnXrrYhdLe+0EamOy9qKHpsTGFEdrD2CVNAM74W5+fei0R1
	b78iT+1XTLLgALnonXu7eqoDR7uWA6/rgfXGi8GY4DhfX0+NwSbXAWnhatLVhtFyqnZMkr5eIHZ4A
	ltLtmy0DG+A6aRSBoA846ylPEkqte189ZIf9MEfBq4u+XSlXgBidxFi21BnAXhL7w0cnbL3hTeIQ6
	5MLgIbTnZenUuMEwnOdBdPadIS1ufEbMMFJkccW3ptAGkj4NJyTgZj57S1rXQTUNYIlFxRU3pH8bV
	20quBuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0t8-00000003Q4C-0VVV;
	Fri, 15 Aug 2025 20:18:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyVM-00000003AJB-3EwN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 17:46:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E047F613EE;
	Fri, 15 Aug 2025 17:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302C4C4CEEB;
	Fri, 15 Aug 2025 17:46:11 +0000 (UTC)
Date: Fri, 15 Aug 2025 18:46:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
	dvyukov@google.com, vincenzo.frascino@arm.com, corbet@lwn.net,
	will@kernel.org, akpm@linux-foundation.org,
	scott@os.amperecomputing.com, jhubbard@nvidia.com,
	pankaj.gupta@amd.com, leitao@debian.org, kaleshsingh@google.com,
	maz@kernel.org, broonie@kernel.org, oliver.upton@linux.dev,
	james.morse@arm.com, ardb@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
	yang@os.amperecomputing.com, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 1/2] kasan/hw-tags: introduce kasan.store_only option
Message-ID: <aJ9yYZyQtMHyS4n1@arm.com>
References: <20250813175335.3980268-1-yeoreum.yun@arm.com>
 <20250813175335.3980268-2-yeoreum.yun@arm.com>
 <aJ8WTyRJVznC9v4K@arm.com>
 <aJ9IdVsSxppYh2QC@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ9IdVsSxppYh2QC@e129823.arm.com>
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

On Fri, Aug 15, 2025 at 03:47:17PM +0100, Yeoreum Yun wrote:
> > If we do something like mte_enable_kernel_asymm(), that one doesn't
> > return any error, just fall back to the default mode.
> 
> But, in case of mte_enable_kernel_asymm() need return to
> change kasan_flag_write_only = false when it doesn't support which
> used in KASAN Kunit test.
> 
> If we don't return anything, when user set the write_only but HW doesn't
> support it, KUNIT test get failure since kasan_write_only_enabled()
> return true thou HW doesn't support it.

Ah, ok, if we need this for the kunit test. I haven't checked the last
patch.

-- 
Catalin

