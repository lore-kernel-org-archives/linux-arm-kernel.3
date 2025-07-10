Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E735BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5MFFBUYpLJN0PCMiBmsLfiSJha8AQz1cUcW2BMgMck=; b=o1dTjtqPXOYo4eaNapJRYJFkDw
	Sh2fZOAjnXE4jVP6p1JGsXZH8ubtuzzAEQFXlf5gyJ5qd2M9JPuve48Mv7XXVkQfAaWo9U7pZP5ze
	wsyZwF2btK/ZrcxKRxiJXxXWY+GANKzES6dCzmoRQyK29uGON3ZvnnZ9dL2NvpJIr4VPOUiGSAsTa
	7YXSZWHSEc04qHiorEijrxMf9twxt2QNl3VVi1vgn1+HJiiGNrPMElixgwUf+A25FSzYW1TSAe/Ij
	802YJ/soWw/IY0GGoocCpD/0WUlS4uxfxzcgW4uKwCL/IalwvWZvKOlXIEHRYNn+sSd1hYKHLO7Tw
	Zv0TDJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZw-0000000CtGi-2GPn;
	Thu, 10 Jul 2025 20:09:12 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZv6f-0000000CavD-32Kc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:30:50 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-adfb562266cso197239166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 10:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752168648; x=1752773448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5MFFBUYpLJN0PCMiBmsLfiSJha8AQz1cUcW2BMgMck=;
        b=DIoxLQaz+imFGqvQvNyAM3TzvhJTSJYLrvtllH1s7AQVG9njlMudtNVjPPvpl5K34r
         PN1oZqbxAlyo3+Zq+6uK2kURa2DB9zaL5Q4sjNvo9czfmo7kkHt6U1+UVrb+TFfNkukA
         hBW7HWwxj3Zwt7kEEZBpeW/dVhRxYJ5QyeeA2qjaU+CndE+YiGdy11iFc1nAG2we6Q2R
         IBXdsK7f6rcwuVOcgK7uc8Fd1INbe1Z4fbYC666ZEeq4AFwGKADt0mn/Fcy2tMrcPLuY
         EQczuVX4Z0blig6oW2ywMLVadFXWUQztF7N0WV+kSy3fv1gVIO0DarDu/pYweonWwVEi
         m5ow==
X-Forwarded-Encrypted: i=1; AJvYcCXnmlQk/8XLhaWI12JCm39sOsMgPPOxXfqWGro7yU3jxsCmBgshXPBbSk3qF7yDWbyoFye55ww+MgZqcrmX2aV0@lists.infradead.org
X-Gm-Message-State: AOJu0YzUsw8duNJfG+gEtGsw6ZxHTYDWT8cLh059HhVOpyaeSsq28ZsI
	GDEHg96KnscdG3gndPYNjsj0rr6rgFRTebR6jv2Smy+YjBgVRkTrdxv4
X-Gm-Gg: ASbGncsHvfHXiIRijlDedTNymDFv/KQbsxhpiAXNZnl9Sk7s+/S5g5Ydac34pYiLDua
	VnwPYJpVog4HlTOTtkGGI+qi1vB3yOj07gPqwVZxR2Db62uLb5IaKqLND+q8qnCdOFqxIOQY1E6
	kyJsR03zqCVA7nruVpbY9PMPqzYN1tf8iPvvb78hx7tN7F0/N7AhxiTc862POBpp354xjXeQ6Uy
	y2FTeqaSzHOI16j1FadBGyaCWzI804MnroFUd7RXfHgPsuHcnVoI/xXMAZYU3ncT0uf2dRrjK4a
	9VJH9HFjKEEtWeuJjVeJ4/aQW0jkD3BbG4tpv2ftA6Jj3zKLqCoM
X-Google-Smtp-Source: AGHT+IE5r6DnY7Tz1x439NPiOFJH4b7xvN0OOgVA3uf34Ibu4HbS6dNTxi9HGTXJM+tj41v+FgbdjQ==
X-Received: by 2002:a17:907:78c:b0:ae0:cae0:cb35 with SMTP id a640c23a62f3a-ae6fbf72e6amr9742666b.37.1752168647780;
        Thu, 10 Jul 2025 10:30:47 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:3::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee47a2sm166404766b.58.2025.07.10.10.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:30:47 -0700 (PDT)
Date: Thu, 10 Jul 2025 10:30:45 -0700
From: Breno Leitao <leitao@debian.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, ankita@nvidia.com, 
	bwicaksono@nvidia.com, rmk+kernel@armlinux.org.uk, catalin.marinas@arm.com, 
	linux-serial@vger.kernel.org, rmikey@meta.com, linux-arm-kernel@lists.infradead.org, 
	usamaarif642@gmail.com, linux-kernel@vger.kernel.org, paulmck@kernel.org
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <jlhgtwkeezoca34wbqipvsgr4muxov5wmgrswleo2k7zqitzfr@4ngriyb2udra>
References: <aGVn/SnOvwWewkOW@gmail.com>
 <aGZbYmV26kUKJwu_@J2N7QTR9R3>
 <aGaQBghdAl8VGWmV@gmail.com>
 <aGawTd8N2i8MDCmL@J2N7QTR9R3>
 <aG0kYjl/sphGqd4r@gmail.com>
 <juiog3337iozva23zpf4apdydegj4z7jibqykfvcgnkabemw4w@z5g5hhwrqr2w>
 <20250710133557.GA1093654@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710133557.GA1093654@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_103049_772257_CB0FC516 
X-CRM114-Status: GOOD (  20.62  )
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

Hello Leo,

On Thu, Jul 10, 2025 at 02:35:57PM +0100, Leo Yan wrote:
> >     serial: amba-pl011: Fix boot performance by switching to console_initcall()
> > 
> >     Replace arch_initcall() with console_initcall() for PL011 driver initialization
> >     to resolve severe boot performance issues.
> 
> pl011_init() registers as an AMBA device, so the PL011 driver depends
> on the AMBA bus initialization. The AMBA bus is initialized with:
> 
>     postcore_initcall(amba_init);
> 
> Therefore, the PL011 driver is initialized with arch_initcall(), which
> occurs later than the postcore init.
> 
> My understanding is that console_initcall() is invoked much earlier
> than other initcalls triggered by do_initcalls(). With your change, I
> saw the PL011 driver fails to register on Juno-r2 board, due to AMBA bus
> driver is not ready for a console init.

You are absolutely correct. I confirm that the machine is fast because
pl011 is not working, which is sad and embarassing.

> The atomic path is introduced recently by the commit:
> 
>   2eb2608618ce ("serial: amba-pl011: Implement nbcon console")
> 
> My conclusion is that changing the initcall will not disable the atomic
> path, changing to console_initcall() will cause AMBA device init
> failure, and as a result, the clock operations will not be invoked.
> Thus, I am curious if you have ruled out the issue is caused by the UART
> clock (as I mentioned in another reply).
> 
> BTW, since the atomic path is enabled in the commit 2eb2608618ce, what
> is the result after reverting the commit?

I've reverted commit 2eb2608618ce ("serial: amba-pl011: Implement nbcon
console"), and I don't see the CSD locks anymoer. The serial speed is
the same and continue to be slow, but, the CSD lock is not there. Here
is the time spent on the serial flush when reverting the commit above

	[    0.309561] printk: legacy console [ttyAMA0] enabled
	[    8.657938] ACPI: PCI Root Bridge [PCI2] (domain 0002 [bus 00-ff])

Thanks
--breno

