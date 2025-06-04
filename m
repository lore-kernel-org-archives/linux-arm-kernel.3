Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16F9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5jkv6jTCTMwy/vnlUMXqlccR4GtV9DV08p6aKAneZA=; b=RzA0cKYBIbXtgrHdtAS190dI2z
	IXmefecgf2xO1RforDio+mba5KDd0UOCtUWlE14eQZXo0EpL+giTkZ+WcN60TBhl6Nk37zAQFzXEW
	bnVBy2fU04R0DaT5+8z7brQC5bgsanJE3Xdic0PK94gjEOC2mvO3vLTK/cRFa+wVp6V+4RiGzw7dw
	kDmcytmjgLFUzZCHulLX81vF/S7lNZ8ml+iJYeVSSV36G/A7o/LEqxiAHHcEgRAeseN/PwZlMPg1Z
	v+2l09Gl+duyVuV64IcbsFZwDhb5E9QZSR4gbiqaLK0Yr5sUp+anRvImCN39zby2nRgvKWay/qwkj
	B9z5dQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnQ2-0000000DMVG-20gr;
	Wed, 04 Jun 2025 12:40:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnNw-0000000DMIv-03op
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 12:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBCD1A50507;
	Wed,  4 Jun 2025 12:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1572BC4CEEF;
	Wed,  4 Jun 2025 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749040702;
	bh=7tHoRWpClE5dLKc7eKaOJE0EBswVDCbH75bRZ0dvDtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z2xSW+QBOUmyM2yWlcdXcasGDUIDdoKL+FVRkca1oDExVNmQFUMTFBhfYxzMf081m
	 seIkXDCaBdvIqEkSL21CwhsLPL5o2rEjQhPoKgmelIB+BIwGgqCOsPipyrZ1oSCNCy
	 2amykKUElpsO18F5eiHtk0mj5QVMWgFQ7KK1sCsE=
Date: Wed, 4 Jun 2025 14:38:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, lujialin4@huawei.com, chenridong@huawei.com
Subject: Re: [PATCH stable 6.6.y] arm64: kaslr: fix nokaslr cmdline parsing
Message-ID: <2025060409-fidgeting-basil-abf7@gregkh>
References: <20250603125233.2707474-1-chenridong@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603125233.2707474-1-chenridong@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_053824_113142_CB4C95C6 
X-CRM114-Status: GOOD (  16.97  )
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

On Tue, Jun 03, 2025 at 12:52:33PM +0000, Chen Ridong wrote:
> From: Chen Ridong <chenridong@huawei.com>
> 
> Currently, when the command line contains "nokaslrxxx", it was incorrectly
> treated as a request to disable KASLR virtual memory. However, the behavior
> is different from physical address handling.
> 
> This issue exists before the commit af73b9a2dd39 ("arm64: kaslr: Use
> feature override instead of parsing the cmdline again"). This patch fixes
> the parsing logic for the 'nokaslr' command line argument. Only the exact
> strings, 'nokaslr', will disable KASLR. Other inputs such as 'xxnokaslr',
> 'xxnokaslrxx', or 'xxnokaslr=xx' will not disable KASLR.
> 
> Fixes: f80fb3a3d508 ("arm64: add support for kernel ASLR")
> Cc: stable@vger.kernel.org # <= v6.6
> Signed-off-by: Chen Ridong <chenridong@huawei.com>
> ---
>  arch/arm64/kernel/pi/kaslr_early.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

