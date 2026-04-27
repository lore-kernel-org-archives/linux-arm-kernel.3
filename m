Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0F7FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c05uYSnZpiPpmroeq2TbKyjhXrf5Sb1zEslsvWWi4Os=; b=XkiDwxXkmXgI7jHdocMBT+5UcY
	zelw+nMqN4AgX5VSzl3xGK+izP/1c7+RmilnfLMAAXmxstkScz8npH4uhVLQbFxnDWG9w6s2fEAcc
	xk2e3A6dTPe8PDCwuegTqMvuhavgPZxh0G4bP9laAHspLOn/RkKjMiqRI27H/68OGCZCztdS85va/
	9i4oZ4zRn9gywW0shM6AgcQBxyOA4C3QQlJZ/HuBost9ABI97LmDvQY6WDEVFALA7OW9mE2eFlhVD
	yO3R+LNq8SRIT5SVPl6AmRGZCTOgwVtsdnAPqbrgmNoNLzXA+MRN5lEvxnX70w1FU2u5E4Pk3AGuK
	fpTO6EWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLtU-0000000Gzix-18E7;
	Mon, 27 Apr 2026 13:21:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLtR-0000000Gzid-0W45
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:20:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D183D22EA;
	Mon, 27 Apr 2026 06:20:49 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03C303F763;
	Mon, 27 Apr 2026 06:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777296055; bh=mo+Pje5KJOlOqFaHKi/Clt9VDeqhXPrPNpSe+ce+T8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJqWE0Q7amhIE6ewRnSqqOogbZ3siw+W/z9/fboWezLK/JGBf1Tj1uBpTKwbpCbYM
	 HpBMSzKsx/byXHh0MBH28m2pTa8GShTmU5QKAaHYwdwhbtCDlAUQNVE/5khbLnS2Qn
	 rAr1M327V2nB3Y7SyR4O26CNXi67TV5hfziJOuyg=
Date: Mon, 27 Apr 2026 14:20:41 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Pengjie Zhang <zhangpengjie2@huawei.com>
Cc: will@kernel.org, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, mrigendra.chaubey@gmail.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	zhanjie9@hisilicon.com, zhenglifeng1@huawei.com,
	lihuisong@huawei.com, yubowen8@huawei.com, linhongye@h-partners.com,
	linuxarm@huawei.com, wangzhi12@huawei.com
Subject: Re: [PATCH v2] arm64: smp: Do not mark secondary CPUs possible under
 nosmp
Message-ID: <ae9iqdt_qdJRjVZs@arm.com>
References: <20260423134654.4178271-1-zhangpengjie2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423134654.4178271-1-zhangpengjie2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_062057_228744_76457886 
X-CRM114-Status: GOOD (  11.31  )
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

On Thu, Apr 23, 2026 at 09:46:54PM +0800, Pengjie Zhang wrote:
> Under nosmp (maxcpus=0), arm64 never brings up secondary CPUs.
> 
> However, arm64 still enumerates firmware-described CPUs during SMP
> initialization, which can leave secondary CPUs visible to
> for_each_possible_cpu() users even though they never reach the
> bringup path in this configuration.
> 
> This is not just a cosmetic mask mismatch: code iterating over
> possible CPUs may observe secondary CPU per-CPU state that is never
> fully initialized under nosmp.

I'm fine with the patch in principle but I fail to see why it is not
mostly cosmetic. If we have possible & !present CPUs (there's another
thread around cpuhp_smt_enable() to allow this combination on arm64),
get_cpu_device() would return NULL and the core code is supposed to
handle this. What other per-CPU state should be initialised for a
possible CPU but it is not without this patch?

-- 
Catalin

