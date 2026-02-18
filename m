Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97446E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUy9Q+ZkbHZPX4y73sCH2RHHSLVM+hRTJ0fflfxOU7U=; b=QREfOUCXo7/5tXlBFipTGAaO8l
	csi6oy7jBEsXuP5E57iaOH3Q8mFWha7ftinc2qmgjZzgj+waHwcvpPoyO4UkRpy8ClPtrQdLaFQ94
	spipIdTgFpxg/dOn4zJbi1vB4qVIX6XwQCO8Ot62ZlSb7zLb0rjhkqu5X18pZJp5+g5QTHPiyWpsP
	ws8zJgL3o4FshO/r42HuiImQbtVtB0VSXzmbOClU0RvLT3ZRQZFMbA3VNOySoFGkVtFwbDjK8518S
	OyWK5LsmjuTvtgThVwM4hPWLdv+k3lg2xRXC7NiUkVzfUwKrSz0gJrQ0EFsZSoYvNUvON+qXEB2Vm
	99ihLASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskJr-0000000A4TA-3n9i;
	Wed, 18 Feb 2026 16:22:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskJn-0000000A4SV-3FCT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 16:22:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0417443D2;
	Wed, 18 Feb 2026 16:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9626FC19424;
	Wed, 18 Feb 2026 16:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771431746;
	bh=BUy9Q+ZkbHZPX4y73sCH2RHHSLVM+hRTJ0fflfxOU7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jiWTdVvcyh2SDh+a+SjHb9jjwk/USZJt7easPv0Yf7aTfALsaxGLfUoB2oesF2FWM
	 4onohZFG68avHdtAzXXE2Yt2zD4+1B5hqb5EyunlUnRkRznuY/b0n5MrDytLcgr5/8
	 EMNZU+40hlQrHmapzoYv6P1+h8NalekGBiT5M6SKRW4QYLOSgvin/eeZ32UIjWMaIp
	 /dF1jCfhS4FQb61nLEyZikrkhp1jb0SQb8x4ACW5IAFGkFPR+n/d2qUAT+tqAEKyii
	 DEGQr69lWmWmFrPAigH5TEDlzyLU6/6O37u8+/E6M4dXcxW9k8J1FqOoBqzZ5SBrcE
	 KGCNBlMkOBQAw==
Date: Wed, 18 Feb 2026 16:22:20 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjiang Tu <tujinjiang@huawei.com>, akpm@linux-foundation.org,
	david@kernel.org, zengheng4@huawei.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v3] arm64: mm: fix pass user prot to ioremap_prot in
 generic_access_phys
Message-ID: <aZXnPLt-Pkfj6eZl@willie-the-truck>
References: <20260130073807.99474-1-tujinjiang@huawei.com>
 <aYC6_lSm_eJeKIcn@willie-the-truck>
 <73396cda-e12c-484f-ab84-b09e7aab8bb0@huawei.com>
 <aYG-dGzR6MuPSQBK@willie-the-truck>
 <a4ee7faa-5b0d-4ffa-bc06-939d95ef7680@huawei.com>
 <aYSp0--x_QgyiUWL@arm.com>
 <aYTVAeMm5cFnuAL7@willie-the-truck>
 <aYTgoFQjEs_5WyC-@arm.com>
 <aYXZsRpmQIb7q83D@arm.com>
 <aYnM1A-9VZaOZoC_@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYnM1A-9VZaOZoC_@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_082227_854375_11BA8472 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, Feb 09, 2026 at 12:02:28PM +0000, Will Deacon wrote:
> I still think this is unnecessary churn. You then end up with
> ioremap_prot() having no callers outside of arch/ and if core code just
> defines ioremap_user_prot() to ioremap_prot() for everybody apart from
> arm64 then the intent isn't clear at all.

FWIW, I've had a crack at implementing this here:

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=ioremap-prot

I can post the patches at -rc1.

Will

