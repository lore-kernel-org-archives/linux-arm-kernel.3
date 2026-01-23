Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA87DD72361
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNtYxKFphBNCM3ZXt3jWBfc2mks39Zu0uY8qEV8U7vU=; b=07W3FIugdH/aPRFoFTxCWtdv1E
	F/VuVr2zWYSGKChyI0gCxg/uoFKx8jagR5MPU8dNQyfGfY/yvtmN+CuKJAbgfu6gwiXx7Tys/NIyY
	dDs7bWqipiMDOYqrLiKAvyb5E4exZ3LWl6sBqKpKHQDNJNmWRYFKEaVv+UQ+tNGYZ90WgdJ8hOP4y
	3buImrM8/Ycnz/esizsuR4KTtjT3OX/ltpUtYb1WKa4hOBNjxkOxux9BMVCWFUQXBmHtAvOu3wi3J
	EzvMZJj/MDdbRn4VGfkq+xbHvYEc/VARNWvviQYrZNez9rHyON0cGp437cGEQqNSfntz7BaduTDdk
	73U3//8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDVE-00000008aXl-3znq;
	Fri, 23 Jan 2026 09:30:52 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDVB-00000008aVy-3LmM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rNtYxKFphBNCM3ZXt3jWBfc2mks39Zu0uY8qEV8U7vU=; b=ILDWJMZ0jLdxP/8aFyqAg+GCII
	2W5clH2vqc0Tz/ikM2ojIjhwf3qJnQgvWIbzzHdkP0drd2/wdlefo3BGEZdGAqwaVYAdcKlwqoXrB
	mbDDbM/RrVjQ/EtUs8VVvv7BX2muVlPV5ANtkaT5zkYdWGTVHkOYr0rtdE5CrI1dRtSF9i/YomzZQ
	uuG/GjR0At3kdqDwcfmI0nq6XPe5/EEsksnycRyNH5Xiqh0JPV5fhg83rwlxoHMTvQrVdsVrcf+E2
	n6ksNLo0+3tSjyumEBXy0V+Ynv2g/FFXHz/sxOtj43YWym0lyyQduhymmS8qxiakTdmbgXCAS3QaW
	BLsc4bzw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vjDUO-00DjsO-AX; Fri, 23 Jan 2026 09:30:00 +0000
Date: Fri, 23 Jan 2026 01:29:53 -0800
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, bp@alien8.de, pawan.kumar.gupta@linux.intel.com, 
	mingo@kernel.org, feng.tang@linux.alibaba.com, kees@kernel.org, elver@google.com, 
	arnd@arndb.de, lirongqing@baidu.com, fvdl@google.com, bhelgaas@google.com, 
	bhe@redhat.com, dave.hansen@linux.intel.com, rppt@kernel.org, 
	ryan.roberts@arm.com, ardb@kernel.org, osandov@fb.com, jbohac@suse.cz, 
	sourabhjain@linux.ibm.com, cfsworks@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: kexec: Add support for crashkernel CMA reservation
Message-ID: <aXM-vOUVbD8iwicr@gmail.com>
References: <20260123074820.310605-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123074820.310605-1-ruanjinjie@huawei.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_013049_833960_FBDFDEBE 
X-CRM114-Status: GOOD (  12.50  )
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

Hello Jinjie,

On Fri, Jan 23, 2026 at 03:48:20PM +0800, Jinjie Ruan wrote:
> Extend crashkernel CMA reservation support to arm64.

This is awesome. I was waiting for this patch! Thanks for working on it.

> @@ -75,6 +81,13 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>  			goto out;
>  	}
>  
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			return ret;

Don't you want to "goto out" here, given you want to free cmem.

earlirer in this function, it does:

	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);

you probably want to free it before returning an error, given
prepare_elf_headers() will return an error, which will fail load image,
causing the memory leak for cmem above.

