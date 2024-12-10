Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1732E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=He/yUcIXa0/HhTuz2F+XhHmaDdzLzE00pnL6cneQ8UE=; b=hGbBxBbXKe4eRVao057Dxu7v9d
	reiebm2NXBl49g3yUZ5vnTFb3BD0CIdUAqjiWFGm8k/gAauWsoxGVi24aDvZvi3rZ1NCq8oJySdTV
	2dJc2NwNy2gCOc+XFQ3394+zbAPjt2KeUkpOOpj9kRZ1wCYJwv9MrefRYcQSPX/Ii/OMqiNhTrvOi
	07BIqaMihCevVYG7dsnZG+XWnUKSXxJMp1mWmoSQoqCX97PS6NM0dbtZUHjyxTrqRQmn3Xl1c7pkq
	nha6MvyDQ6brB1zc/dQ68knrQLrSVtJDEvA+VB+acSED9NSiDbp+U/8rCs1HJ6AIV8MHo0YfEUixV
	wce810XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyVY-0000000BKUI-2KtE;
	Tue, 10 Dec 2024 11:34:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyT8-0000000BK6C-1SnA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 11:31:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13F08A412E1;
	Tue, 10 Dec 2024 11:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05128C4CED6;
	Tue, 10 Dec 2024 11:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733830317;
	bh=7G3MEYmPbcu7pxhtNlLxoLXwKKYtShwas8EpCDcYV/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aae7Xe9X7J6CSJfWULApGStu0RbGgu0ObEfV0nHFXT/sxsaS1H4mYl2TbieO+ri3z
	 gO0kmUKoTDFIWdxQ/CINpFRy3QyOcT/hM7wvsvdLyA/DwTSmNGy/aBlF5RuMsUJwFS
	 TCcr9EbFrVR/rPVR10CLy3uli093tIIMr5yljzlzLVF2cF3dnN2167MoF+AR9JSxl4
	 ugQgDCgBiwDPdobwh1vy2WLysV+4KPNl8Guf4IYT3PQYQ3PuNwFinkn08f+eROczXs
	 kqVWfwx8HJkMDhv8HIG7nIJ/XnqFmCes5rrEfoza7b3G9m/2FdsPptnSllUhv9oK6U
	 WS7x9M/6sdJDA==
Date: Tue, 10 Dec 2024 11:31:52 +0000
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, cl@gentwo.org, scott@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Message-ID: <20241210113151.GC14735@willie-the-truck>
References: <20241118181711.962576-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118181711.962576-1-yang@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_033158_446027_0A9616C9 
X-CRM114-Status: GOOD (  12.54  )
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

On Mon, Nov 18, 2024 at 10:16:07AM -0800, Yang Shi wrote:
> 
> When rodata=full kernel linear mapping is mapped by PTE due to arm's
> break-before-make rule.
> 
> This resulted in a couple of problems:
>   - performance degradation
>   - more TLB pressure
>   - memory waste for kernel page table
> 
> There are some workarounds to mitigate the problems, for example, using
> rodata=on, but this compromises the security measurement.
> 
> With FEAT_BBM level 2 support, splitting large block page table to
> smaller ones doesn't need to make the page table entry invalid anymore.
> This allows kernel split large block mapping on the fly.

I think you can still get TLB conflict aborts in this case, so this
doesn't work. Hopefully the architecture can strengthen this in the
future to give you what you need.

Will

