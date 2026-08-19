Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3336C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 18:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUZcjH4tEVyua9iTCQX+9govQFdJlUjDbzvHkTWoiSs=; b=sbjMRMpBdDexXKVFRBcIMO5U8K
	pphi3JJ86ZzMyWUhFGELwTYfDp56bAlIzJfrKhF97G1PHAajsx943Goq45t2b1RzML0m3vZ11979C
	Pp2hZl7CHwcimEjKz+dKpnqlqV5ZWUJkRkaM17DOCRugzufqXQgwXGP8o29+VQsdxFMhssD9kD93H
	+XXj1FJ6GJTIvuoq+TNXsbIT9BWrhR5ocoAC7UKLX6YS9HDWSGloeIhab8mI+7adkIz6f+Gosw2VO
	s9/goZlR/YO3L2AMo9SyYbM8ZGhlgkuQhM8Y/+vasHJgiq1OtMzXfz31+b/1hHp3XNCc4XfBO7K6K
	4883Wyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlSG-0000000APDr-49yE;
	Wed, 19 Aug 2026 18:56:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlSE-0000000APDS-2uAx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 18:56:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-472326ca506so931218f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 11:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787165761; x=1787770561; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bUZcjH4tEVyua9iTCQX+9govQFdJlUjDbzvHkTWoiSs=;
        b=HGgK1kL62X0zWkhjn5dFye4Mgg4fnXuqtOhSZzHEbxYzZvtVNY+B3SJ3SnFv2uWd3r
         JWfm55xbqQntGKTJpFHl5Q2wVHgmkNnn9wSGt9+TJXP5ZhYNNwNGI+c1AE5FlJMygVbk
         Mwx6uiEIgb5exMQC1FocIdjogzRXwsF3xPJI5xej/9SXPxT+JsiSdxrzKoIl+nZ9kXUU
         MNNXeCEqltxe7zYl+Z6AnICaOr9A9If/rMWsekP3PYfgLm0NwfPyLy53aKig54/nTZnN
         3lYml/4Ci9kOdADt79ZL+VmhWRNZkhgzJpG4dVLQtUeFHg+3LXND99Z9XlaSMT3Xheye
         59tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787165761; x=1787770561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUZcjH4tEVyua9iTCQX+9govQFdJlUjDbzvHkTWoiSs=;
        b=BEIOTH32MgZTTtkoFBmsD7lneKgk7eZiM921/tkJZkWnEwHn9T5jhaX5a4ydtFpaci
         3Mr95CbdR3gxgFCTgBAv35Cprbl33rBRtvqFFUzWgslNuOdkj1xrpa7elxrwAh0pTgra
         qk7EBVzFrEvsHpko3tMhe4Cyss+SaUC2tOlO+zH/xtnHdJZNmNKHwmn1Noqwe39ikq3p
         rFOjN6DIhFmWLSNGN7c2hlqe4Vfrv/sSWVYAyYvOutuCl4sbS1SwG3XxKdf2wuDboaW4
         fD2HI3nwSH6fUVqEFoB+Mcn2vKrYWBuvUoJkgCncLV7xqbWuNXzp1LEcGV0VPIsE0L51
         +3QA==
X-Forwarded-Encrypted: i=1; AHgh+RrVm5jF1m/FR1sdfB63gJLMIoxy92kk5r3Nbg77jYVT+YrYV8ThSXU8WAC86z+txMxPmyx3cVg4S1XmrNWIZQve@lists.infradead.org
X-Gm-Message-State: AFuF++nE3A6cK1tNOGG3hq78AD3y452hLsnA4TuIHVgeCg2u4xuJrX+l
	OnpvTf6zTDz2nVit6a3IWHA7oW90wr8EKtX0qb+OPIFVHYgFowEaaas3y8BvIW69
X-Gm-Gg: AR+sD12ZdkdPD0+OP8OsxrCz048HP8sjoxPE1Tt34B/oBL48dFweU8PxxvUucrXOano
	v40K4lLZm6yoEceoBrKzOKcT9wBs2GU6vNgIHQ3YnaL+mzTTIuuEtqfOpzxQsIaG+0TZyJ/0RnR
	m2vC91y7hK93slJbFwgrvkV9QRz7CJmGjnOEBZfWbdDrTBqQZ18NQNR3qsTnA0uKgZivlQ6h94v
	h38PPQofhYybPLihPbxu2XO7bUS8ALMHPcESUTG9SXVf0zW/puPewKxXvB3ortjijGEeJlA/Juo
	+CwP7pgrIfKjX6+wvVWgkTzzZRAgHRzEIb5yl4rxzffkauUhvdWUvljYd2+ZBBemWAtRhW4gD/9
	LOPnItrwwsSlOBzPiAoBSrcbDMfrdlzjcwc4xBcY0JBHiWnW6qaMHo3GThyLajZcz9z0G7GVupC
	f9EyAEKGLVLuHbidXsNjRkZYIj5yBmgYocGHpEzQiZh7K240mpvGSf7VBq58K/whGdqIxe0GXG+
	U7I2d/VIsz0EXtMwPDm/WDkfTnK/TMwLdQywKp2Piy66RxBKSO2tFUlcIBor38jAa2Y84radyD/
	o79P207Rv5vGk3H9O9kk4qjrK2op8BDJ8hag3CbUx8QeFYR/ERosPoluM+cln8ki
X-Received: by 2002:a05:6000:22c2:b0:482:a2d5:5b5e with SMTP id ffacd0b85a97d-482b1e86851mr12524488f8f.4.1787165760390;
        Wed, 19 Aug 2026 11:56:00 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b802dsm6407476f8f.17.2026.08.19.11.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 11:55:59 -0700 (PDT)
Date: Wed, 19 Aug 2026 20:55:57 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: compat: Keep alignment address arithmetic 32-bit
Message-ID: <aoX6wpJjMS1vtlVY@gmail.com>
References: <20260817000231.21311-1-kmehltretter@gmail.com>
 <e238944c-9349-497a-9d30-0dd2edd7f115@app.fastmail.com>
 <aoPKzPb9YUVULlXG@gmail.com>
 <e3c463a1-81ae-4bef-b65b-fea1a4eda5bc@app.fastmail.com>
 <aoU2ezSYVbOw0hun@gmail.com>
 <4078f942-e29a-4f6f-b6fc-780e8c6d6874@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4078f942-e29a-4f6f-b6fc-780e8c6d6874@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_115602_748547_08BDA6E2 
X-CRM114-Status: GOOD (  13.12  )
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

On Wed, Aug 19, 2026 at 01:19:20PM +0100, Arnd Bergmann wrote:
> 
> I don't see yet why 64K_PAGES makes a difference. I had
> expected TASK_SIZE to be 4GiB regardless of the page size, and
> the top page (but not the bottom page) to be reachable from normal
> userspace.

There is a special case in arch/arm64/include/asm/processor.h:

#if defined(CONFIG_ARM64_64K_PAGES) && defined(CONFIG_KUSER_HELPERS)
#define TASK_SIZE_32		UL(0x100000000)
#else
#define TASK_SIZE_32		(UL(0x100000000) - PAGE_SIZE)
#endif

Only ARM64_64K_PAGES with KUSER_HELPERS gives compat tasks the
full 4 GiB. The 64K kuser mapping then occupies the last
page.

I'll send a v2 soon.

Karl

