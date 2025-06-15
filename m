Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A590C71150
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COHyn3noyy+9mpewcG/m4dROPi5yIhHvzGEpw5P9N4g=; b=spM7WcFkxHs/vHINIwe83m2d5J
	yX2nhwpf5Y+4ZVSXCC9x+LINvS2B4qsruaSsdMJYjNQ3qbxNveaWx8M+ocQh9SqBIR1XQDA8rk7+c
	TwiKSEmJAZ6dHq8mmfGEhj9qkLWA825fdoQoYgQYJyBGttzA7oknQFzYjQTtvIjTcDqWUHljRN0p2
	hR+bZymHloh9K6ErlozK8eav1oOPMdnn5rOHaQObwlK37syJgeAe4Qgwdxkdqzrpkt1takgxN6iay
	vrjBISZDdgtm34EaGUvRX4aroWNTbdam/DvcxoclcVYXH2s7TNHbs1AfL3ObxQxNrsiA0pI3AfVpd
	go2HZ42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQhmf-00000002KFd-1xoP;
	Sun, 15 Jun 2025 07:28:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQhkR-00000002K1h-3A5G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 07:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A761A4F3C0;
	Sun, 15 Jun 2025 07:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A78C4CEE3;
	Sun, 15 Jun 2025 07:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749972346;
	bh=6cIF3HC7Qqqk3h3DoiQY6F1IwQazmnD9Dck+AwtI0Uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Izn5Svm4EyUjcCMMj3b6iP2iPb0CELuwckgtijOcXPE0EzlddcecPR7rUGT5Gy36+
	 3iK3QiDUx3sMZ+jpgMq9vwnqU8iAPpcqz5bFsy96dhjTDbhld2G9NEWyIKSTkDR325
	 4JiQOoWevaGOnBEpIScQH0h3XDGh1wpfpbiFbHh+Ed8ktv7XKwz9m/2SudDhBukf4a
	 sPs9yUcfWGv5qQH9kvjWGACmla1pb0Asd5fbsIBeJODSEg4+FnHjmVif5pSCBKQrsx
	 boL27DlkfUVA/KaABcckqxYbzBoeK7Yru9l2jECsA7Uz+jBvJTcFxG02iorZ8Rioiq
	 I6v6brWxsY4xg==
Date: Sun, 15 Jun 2025 10:25:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
	david@redhat.com, catalin.marinas@arm.com, will@kernel.org,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change
 memory permissions
Message-ID: <aE51cWMkSfNJ5i4c@kernel.org>
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
 <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_002547_858729_7CE4B6D2 
X-CRM114-Status: GOOD (  12.41  )
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

On Fri, Jun 13, 2025 at 05:27:27PM +0100, Lorenzo Stoakes wrote:
> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
> > -/*
> > - * This function assumes that the range is mapped with PAGE_SIZE pages.
> > - */
> > -static int __change_memory_common(unsigned long start, unsigned long size,
> > +static int ___change_memory_common(unsigned long start, unsigned long size,
> >  				pgprot_t set_mask, pgprot_t clear_mask)
> 
> I wouldn't presume to comment on conventions in arm64 arch code, but that's
> a lot of underscores :P
> 
> I wonder if this is the best name for it as you're not only invoking it
> from __change_memory_common()?

Could update_range_pgport() work?
 
> And yes this is a pedantic comment, I realise :)
> 

-- 
Sincerely yours,
Mike.

