Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C78CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+R9+RSshuFFxb4UCpCF69wEYw6E6rRhR98wlUBiP08=; b=HlSXmFa/ELulDhv4PU8kfX5ELB
	hc9qeCNQwXWLmnmEsWZF9nY0a7DcMQtlJPvuFtxocTmiaGfQJEmQ3FLF5yqfZp+K3GrNsbi7ScO+J
	ZLgFluk+8xZF3HH1L5a/6bGD9mvX47JJpMx3rM9AH10SQW3NAqVml01DS3iFUK4usyvmOZGOoK69G
	TxSHEAFbpInifZsROSUg3vGx9nOjerEFSRwvzTQODrJO1SctY6kRP6c8UotyAaqX2Asd2SX88KmGg
	8mdITeZlHEt3W5pPfPZc9zPEKyBf0bkmMqb5m2EfNE+2ckqu4yf3c8GzLu9jt6hCgQVq8piLU0fgk
	rWBIyYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplXI-00000004eEc-1pwd;
	Sat, 23 Aug 2025 10:31:48 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplUd-00000004e6g-3jEk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 10:29:06 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 57NAStdm021216;
	Sat, 23 Aug 2025 12:28:55 +0200
Date: Sat, 23 Aug 2025 12:28:55 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/7] tools/nolibc: reduce __nolibc_enosys() fallbacks
Message-ID: <20250823102855.GA21208@1wt.eu>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_032904_915492_51D94EF2 
X-CRM114-Status: GOOD (  13.30  )
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

Hi Thomas,

On Thu, Aug 21, 2025 at 05:40:31PM +0200, Thomas Weiﬂschuh wrote:
> The __nolibc_enosys() fallback is used when the UAPI headers do not
> provide a certain syscall number or any possible fallback syscall.
> This is either because the syscall definition is fairly new and nolibc
> tries to be compatible with old UAPI headers or an architecture does not
> support a syscall at all.
> Many of these __nolibc_enosys() fallbacks have become unnecessary.
> Either because the "new" syscalls or not so new anymore or real
> fallbacks have been implemented in the meantime.
> 
> Unnecessary usages of __nolibc_enosys() as it is not obvious anymore if
> a given function is really implemented on all architectures.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

OK I reviewed it all and it's fine for me. Please note in patch 1's
commit message, s/where added/were added/ :-)

For the whole series:
  Acked-by: Willy Tarreau <w@1wt.eu>

Thanks,
Willy

