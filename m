Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA88CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 21:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrFkxRI/rM5SQxoVJY6C6jishZsikS57oIN/hwunQlI=; b=YKbLtTI/WNgvwKGTNijHnKRtxZ
	PUeTyJJIqdX/j02U8mSCM3vCme6EYF07zI2o6mYBUQ3mxca2Eqi7a3m02e8HuigavgJ9YZ5Aq9v0o
	pp0AgMyTtpLkhPqyRqsflhd1VbPXy9Pmc/RJKRb4mMj5eOMCwZrs6RhT4+AvwczyK8270tjtViR3d
	RKSOdPlfh1q68uUxiiuYTJ8vpTb5MAt8WFIqUTDF6YBwISburO0S+05CqG36KB8ieyeE5na+J9ntL
	7yg0xcGUE7qH0zAZnwK9bIgmuFXBv8+JcExhI043JEO992DFgBLkAze0uaesxeNiUVM3Fn3Z8dfy5
	i4Zm95yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu5i-00000002Dm8-0KcE;
	Sun, 14 Sep 2025 21:16:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu5c-00000002Dkk-3eGV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 21:16:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EBAB9C8EC7C;
	Sun, 14 Sep 2025 21:16:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 092936063F;
	Sun, 14 Sep 2025 21:16:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76865102F2A78;
	Sun, 14 Sep 2025 23:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757884606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PrFkxRI/rM5SQxoVJY6C6jishZsikS57oIN/hwunQlI=;
	b=j+82wh8EW/26ftt8B3pTo1EF6a84LZS/ds3nQRpCwbhT3EnmTALAHRvlO8AaJPUcIhLHT/
	gl6jy60jXJho+DItqUqAiO30JedIhLNi6Q8iHiliohdlf/U1fzqVAfru1ocswYYozJrZ6b
	G8T1SuFDUk3FEl5M8tYxF5FckzXCm3SvxGXKysA2w/fNni0aqN7/YjLZ7Qrcx+e+82gmuN
	TrF/Uq8mV4ZHEstaLbfM1ST8YeXhs0i1w7ilUCrIHelmL+RBtOtGJN4y4l7FAtcPFuJc7e
	9AmDmRUv8YBvnRbWBiulqtUTQeRPGkyMscOZZNXSS0NMEANY+15EN7K4nD8YnA==
Date: Sun, 14 Sep 2025 23:16:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org,
	linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev
Subject: Re: (subset) [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
Message-ID: <175788449957.388732.6353062596898107602.b4-ty@bootlin.com>
References: <20250714060843.4029171-5-ardb+git@google.com>
 <20250714060843.4029171-6-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714060843.4029171-6-ardb+git@google.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_141653_095852_20CBB308 
X-CRM114-Status: UNSURE (   7.50  )
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

On Mon, 14 Jul 2025 08:08:45 +0200, Ard Biesheuvel wrote:
> The EFI rtc driver is used by non-x86 architectures only, and exposes
> the get/set wakeup time functionality provided by the underlying
> platform. This is usually broken on most platforms, and not widely used
> to begin with [if at all], so let's just remove it.
> 
> 

Applied, thanks!

[1/3] efi-rtc: Remove wakeup functionality
      https://git.kernel.org/abelloni/c/50562f9cd366

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

