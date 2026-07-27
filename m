Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A53C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 00:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01dl0IIZWjJRbfIXfFu72Txfn4OJSXE2utImaot0HF4=; b=eWlri8Z5HEwFJTTR1YaYcVJAc/
	6XSP9kcFKQWFFvhBu8Pxe6cMKXk726rOOz+b1koLS1gg0HAUbN3c79snaWpNddiD0x7t///oriHC/
	PDL4JAYnOzfDapTQz96Bqy3ZnjV/XAEgukqGtZguWH8BYoalsEHkucD7e9unrTGFBL5UT2OKloAli
	ba+Hi20hjSv2w0bC9KKp5C6YgMTtpP52jzGovkHtkvEej+5UXjcJqppIXSiV1HaaEYwMal4xXSVF1
	XLQPN+RmY1zQmxzB4s4Xjhfnx/3TdCp65kI6OEPfVcgKmNWdDz8rfpqVHHBTS8bJ/Fa0KIMh+XWqX
	jSMM1z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo8vq-00000001jIl-1Buf;
	Mon, 27 Jul 2026 00:10:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo8vn-00000001jII-3S4P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 00:10:56 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso14098405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 17:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785111054; x=1785715854; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=01dl0IIZWjJRbfIXfFu72Txfn4OJSXE2utImaot0HF4=;
        b=KOfOLQZCbfryXcncwrKXVW+H9IgvV5n/dxrhyO/1klSnZqOdkw3kUEd2Yrv/UAN3Zb
         Ejk+HXGeo9Z3qOpWbceGYpxswjFDhvlz33XfccewngnSV3YJ8TgayDAdK2lW1NCtAqXr
         ratw4Zia6InWEBsgGuOCC3vC7nPOjyLGGvjBNsJYDBxRCYr/Tsnkf+Qp9xt8XnYwpN5V
         4CYi8mVxhrVKPGhMNJD15iU852WpBSNkQ5UAoJAJFhIgoCyczVIHJo4QsBrv2rooP4wc
         wFG89ZdJdoiZJZDzTbvLa+QqAl1WbdJ1D6IxW0EVtDFmoYefUchbPvEWRGuhxVMg2Yv8
         mhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111054; x=1785715854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01dl0IIZWjJRbfIXfFu72Txfn4OJSXE2utImaot0HF4=;
        b=Q6FFHV2rvs6JtM3jQiVY1R/4Q7rMOXhNIocpeWrtbSPPXKMU1fBY/VniOibQYbR+DV
         WPjgwU12CwdwmWFY1GIZBjvW7XWehoGjzuQPWOUO8QISVOSY9804iQJug8gSfMBZS2oD
         BJsEzGr83P0ss0vB6hC1Rowotrj5+UGEkT3UfmCBtQeLvv7JM5zWrBNBfcTfG10DHfUe
         9iV7gzUTZ7sHMa1yc2oZXwTEHiq11/wJmQMTR4qB11ksHKT4V+zTiuzBoH/gQ86hRhe7
         S5WURRMEuLhGBqzL7o8yJeKsZQ8yN3fmdYNNxl8/O/gl4Toutz8xbxy7j1U1Yb91AzfK
         oX8g==
X-Forwarded-Encrypted: i=1; AHgh+Ro5BzA/w9It9aFRBzIgJsyTET/bsMCbUbNRF071r6SDtuK1E1vbTpZSakSKwXtBPEqj8XGnURRoqtEh9RUbGFQ+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7zIU6IiqcGibz5A5KDNYkG71VozCBXB89H3Y/YD4v9K3OlCnJ
	fq+Pz/r/CyJdjsgxWuk9qMHZShKM++e2WR/x7i4AtmHPsKJpxHsNUctI
X-Gm-Gg: AR+sD13oDhCqa41eZJ3B6DDp5f/TAwzT6Es5zGxXy1TVwD4bcXt05QBtmq8EGQnevmB
	Eq1c2eeUyUyPPxvIV6RqonCvDeepT0KfnnHTeSCjbYavq8SSNJuVpf5wHKqXDhto1h87LurXSPn
	nSg61HcpYajq004EibcYBeCl/lQY5igD5Yz0SQ0UceB+yt3yykHd6aJci1yivYOclduX0wHbaCw
	zawNWhLWH39v32WHk9rQdQSrmRB+Br1fd6lQdLBvXO8R1Bfsal+CTy05ZO91ggf7jeqKtRpKKCw
	diyULbw+Ix1dtqXzup1XL4YVpP0Ddj4zg8A+VpCmAzWA4b64yDiJpMRT6BwFf+4NHDZ2XHdSRZf
	vcu/+1UezSi9CGavhsVCkLA3om4iJR43rNA1xwoDlb8j3+/Xn1Qv/qS+5k/6jomxYXN5ITo+y83
	RCTjZo5vbPK+zmZUA4dfYM/gqHPSCgGEUH5Gg3Sduf4/LGiEyM+bf1aHa2M6AsKlhNu1aMNDVnJ
	l41/6bebL3RivYoOTciEKHA+450Vic6KJDwQDxGBCM=
X-Received: by 2002:a05:600c:5492:b0:495:7eab:3abd with SMTP id 5b1f17b1804b1-496b5736f4fmr90983825e9.33.1785111053770;
        Sun, 26 Jul 2026 17:10:53 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-116-215.95.114.pool.telefonica.de. [95.114.116.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4d8d6efsm201357975e9.0.2026.07.26.17.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:10:52 -0700 (PDT)
Date: Mon, 27 Jul 2026 02:10:19 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Linus Walleij <linusw@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] ARM: traps: Implement KCFI trap handler for ARM32
Message-ID: <amafzynVg0_hlOZN@gmail.com>
References: <20260715175223.make.153-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175223.make.153-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_171055_865476_A593B223 
X-CRM114-Status: GOOD (  11.65  )
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

On Wed, Jul 15, 2026 at 10:52:27AM +0100, Kees Cook wrote:
> +bool arm_cfi_handle_failure(struct pt_regs *regs, enum bug_trap_type type)
> +{
> +	switch (type) {
> +	case BUG_TRAP_TYPE_BUG:
> +		die("Oops - CFI", regs, 0);
> +		break;
> +	case BUG_TRAP_TYPE_WARN:
> +		/* Permissive mode: skip the trapping instruction and continue. */
> +		instruction_pointer(regs) += 4;
> +		break;

On Thumb-2, Clang emits a 16-bit BKPT for CFI checks.
This skips the following Thumb instruction.

Thanks,
Karl

