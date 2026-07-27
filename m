Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837A9C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 01:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5WxXKv3tM/juHDs7F+fi+T5krsvThiBbf/3eNS3EFY=; b=IzMd7S3tCZSKOGIho574tJmWK0
	qKf/KxaqS95+BHPWmpasiQq55LemsAP9UWEiD4wx55aofOkhKmTnYHLV78bRwVF4ZIKITBEqKXCnt
	AinjTMu6CYtogtaD5ZiOciC5L8udmTBXX8F2OOYH3VLwNCs7O7YMYFMHot36j99SLS0A5IxerFt/Y
	b+GC4D11TaseIlwUfdwCVCdEa4fT2Dix6O3g4zIWrDmwSMvoj8v/8CMuEGfAejhzaBZif0sX1JN6y
	EYYYVYpj151jEj9fGLfseXvLItGMA8Pa5+V4FzgZYxkqbal6ZcwXdoc37TAK4JHP5nnXD/Uvctuj+
	Ijiz0w/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAHx-00000001mUa-0MKV;
	Mon, 27 Jul 2026 01:37:53 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAHu-00000001mTl-2ULw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 01:37:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47f633e6058so1875634f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 18:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785116269; x=1785721069; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X5WxXKv3tM/juHDs7F+fi+T5krsvThiBbf/3eNS3EFY=;
        b=r31VW/szIs+hUAkx5LU7FVFVVw0kaEriDn8C48+82Qg3aRwXi1BPYtykllApIFeA40
         M2hnvl48rDE1f4VUn2wLq34JdSTwt3sP02k0b58F5pcc0rEW1hR1SKKCppUAyWDXSgSD
         84p/y5QI9/jsKrNPIUNVqvrGdWUfZvPBcjKCWOEs1jifC3RL+MYpxZpEB5yoQYSaI/Kd
         Osxp0nQLghv/F1KA+SUlOkZjNUKV8eb/pkdN34pcNzwxyrQmbxEj+CJMyGR+rkq5abII
         yMg37hvrk/1PzK09R1Zl2AfhoaV+T0tQnpvVHQ30f0Hxu5D9BKiueOFFNae+L3SEZ4RW
         iJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785116269; x=1785721069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5WxXKv3tM/juHDs7F+fi+T5krsvThiBbf/3eNS3EFY=;
        b=iIle/TrqGfeCS0AO36r/gHHbVVBLKJVZHICVhPPEOaXxvwQwYOxcf8GN4hAeyMZCLv
         CwXm3DZ++iwne3ieW5Jg1D8PRwjXG08Qc15TYW5lqtZQeGnCC9a22Vf6t7DFgDlmy0Pn
         J6TjjHvSc/W/Fav0M/uFiJsoQCWxNPB9+c8ya8M88Ow5FlgV+8LbTFKtKu8wD4bnpEPm
         gM5FMrHcf3lHbJCpXmTxTgb1PrnYaZzvSVFKStU8dPLUF6qnWxcsRugSRejEDW92W4Dv
         snfzG+vYv2JIrDiRKcLaAkCL+DoZqm8L0WIzGPcVDp2RCeS9w6p7F73V5iuuHvwYRupm
         WFxg==
X-Forwarded-Encrypted: i=1; AHgh+RqTBvlz+PtCbDMajGHabE61Max8nUgBEKnc1o1LeISM9oUWM7pWCPOgLvaunfzI6yf+vOaQWCwLCRcGOCr7oYnb@lists.infradead.org
X-Gm-Message-State: AOJu0YxasVsu0bo1yqZ1UvGey/9xp8akWf8y4hVxWftdp18rH9dpdhWp
	t8Tz4CPL+0Zp/U5x9nyoEn1tKIg6nvTNuMcoWZC65eg3kvYo193+fCs2
X-Gm-Gg: AR+sD11zdmN6Y3URJgrLa0BQJEfOTyfobcPLfWlLcRtRXsugPrcJRrH+92RDa3bBtiY
	uoY8OKl3D6sdHOqD/tlSB0MZz1m+f1OTUY4uttqdfrhhv2sNVIjkhUYQbwGH95hnA0koG/pTbyN
	G8eeGbt6Dgmhhbk9JnOyg+uPBS0cm4wz8a01+PM7aJfDHX0bqtWpkhvXMd/rugyrBlhL8YkZUjp
	IYNY/7EUKHK+ajyw+m7ARGh7xj3mvBBwXKIyidqgsnNsWGxWWY6uaxkFTvO6Gp99e3r9hGkt2+J
	+vvvbedPbvWAKsYlZlnc6fRhkpzr7kyVPyI1hG3oZ3WzAgFEa9kOpoILfH2OGQfvJSdYOLGYsmf
	5HO3ezSGboLTviYs3UUfQRwt8z1BAbDYd83kouChMt4rEZZeiX9S/mH7RGprV/nBoLUtBJFYCRh
	pPxx/kf71/t3KvWRosdlpe/Fc5KzbpDQ5q0SvrOA4QNDwLcWQSWw/yEqOGfzMmoJ7Kp9OJC2JQI
	2YAppErpfYPy2mGUa2Vs87shGCBc7QEfr58Ta1OjIo=
X-Received: by 2002:a05:6000:2512:b0:47f:4fa9:ae42 with SMTP id ffacd0b85a97d-47f9fc8c4dbmr8796069f8f.11.1785116268631;
        Sun, 26 Jul 2026 18:37:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-116-215.95.114.pool.telefonica.de. [95.114.116.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm45492653f8f.11.2026.07.26.18.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 18:37:48 -0700 (PDT)
Date: Mon, 27 Jul 2026 03:37:16 +0200
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
Message-ID: <ama1UiT1Jxy-PvVN@gmail.com>
References: <20260715175223.make.153-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175223.make.153-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_183750_637134_CB84F7F7 
X-CRM114-Status: GOOD (  12.14  )
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
> +			/* Check for EOR/EORS immediate: cccc 0010 0x1n Rn Rd immediate */
> +			if ((instr_prev & 0x0fe00000) == 0x02200000) {
> +				/* Extract EOR immediate value and XOR to reconstruct type */
> +				u32 rotate = (instr_prev >> 8) & 0xf;
> +				u32 imm8 = instr_prev & 0xff;
> +				u32 imm32 = (imm8 >> (rotate * 2)) | (imm8 << (32 - rotate * 2));

With CONFIG_UBSAN_SHIFT=y, I reproduced the following in QEMU with GCC
v14 KCFI and LKDTM CFI_FORWARD_PROTO:

  UBSAN: shift-out-of-bounds in arch/arm/kernel/traps.c:555:48
  shift exponent 32 is too large for 32-bit type 'unsigned int'

Could this use ror32() from <linux/bitops.h> instead?

Thanks,
Karl

