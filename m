Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BF2C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fExbZ5CfNs+ctyGpkLFuzz8ujuOKnDxLW7yL9pNeKuo=; b=rOqmcf3XCcq2nWA2SB//UYMT8w
	QQeCym4MIobUnNHy4FpqdP2H6x5aQ5Gi37JB4NXht11FprA8AJAiiYPPebb6mtaGAZtk9IsHrhZzx
	4FvbPXm4/vPErt8Bgnzen0FD3XwyBXJXGdPkK4WH9Tr25FOculQMVYodXKSlWv7oAaJpjsyN0k4ky
	qq1t9M/xy01oxLDfxWsVn8Je0g6Ylc0OIfwPc8iVseFQ8mU/eopjxOU7fRxTEFNFomFc4CEt4ia/P
	S46JYAe8TiiQBqflcYVcaoGI3Pv96RRYY6+uMZ6MpzxrZmvWuXhmB7jjQ++I8HG2sQ3eBybtKPWBk
	r2mF7lQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAPP-00000007B6A-1au3;
	Tue, 18 Aug 2026 03:22:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAPN-00000007B4l-0E48
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:22:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4957eefd361so31563205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 20:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787023355; x=1787628155; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fExbZ5CfNs+ctyGpkLFuzz8ujuOKnDxLW7yL9pNeKuo=;
        b=acl3Z3dW3qDvkYhpJlQS942kXAJZnU8Q38XLxPRrPBaaj4fAJQ6kz5ZBHTnS9DUDIJ
         n/VfS0HMX8S3cgEnMMD/t3YHmzwf6ZIqC9Sf/eeuC45OAhiWJM++8BZgZ4Up41BiyYez
         U+yRT/EzhQeRkLZWYJ2ZzFTikAkN6h4IfHfSbM4PKr1kaaWvX8/kyOS+S6WF+OvpCtgD
         Ex4k3saK6UFk1E5cj+a/E/fP1W6/cclcstHo0sQRwp1qXOYhh0pIcf++S9qufwhZ30QS
         cElP4DSoR2DqkYKL96mJplMhsKxdFGOzzl12S703Jk57prcYuxYTCqLDdK7sARjOXjKb
         MUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023355; x=1787628155;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fExbZ5CfNs+ctyGpkLFuzz8ujuOKnDxLW7yL9pNeKuo=;
        b=gS14kgUxuPCnzeolvG69iEDDzdHJ+KaUoYi2phGA1GSFBZAWgxrPjhBjfT/AiEYpS7
         xykEA5gGibxHZE1ZPT1IplhI7pNzwO4o9oKG0xKo0p8QnjGvBXaRCUGoYDSYEaui2QMf
         myGt7ecJYgSoULYa8/phxXdoIsyvK24Y3HQvB75BTHHm5o9E73Mz+4Dkfc50fM+nFpBU
         Th8E+kXtR02JB8b8idf+yCrrC4MDTCjowjnje98Qy8NlFje8s7Sad2tSoV1Y2Lyloy+H
         8Gb2aWcWiI270fgU2larh0500hl1FYv87W5z4Wu9ZogKSISzOR8o/vGdEQNpKI2AkQTL
         +A2w==
X-Forwarded-Encrypted: i=1; AHgh+Ro2NyHnyRnSBjgh+bMlF1Zpmg+tHmfGmpZgq0gOj+MjOq/gwci5Ps6mfuiNjw1uzpxh9AU2xmVJRAU6hpKyIE3s@lists.infradead.org
X-Gm-Message-State: AOJu0YwRrVLagdJf2H6yeDP+uX9Axtc/wKpCaZRKK3ej2+yGT8TgGdv2
	56Rlg4jLvnNJNQQhZQ5tOynbqmW8vxyPESN2+bNB4ntrOfh8tyNGMidHk0GiLYny
X-Gm-Gg: AR+sD13oH7rqb/dNsNqkemPxM//ckdDNC9lcFFB3L4M7FcvcHNgTQqqD/QHVwvWOvAZ
	eEcmpIY+fhVH1pzC3aFTk/AQDZJyku2CEXgmLyrU8OZRzwAMApeSPMPsx/w/ytPLHxXYlwdilt7
	dkiQ88RyufMyjVxnUjLlCgwtL0puQUb5O0vh8IbuWFmt1oTLh5ST5gtkinWi65iAhRMKz0dA+A4
	i+IJ7kby7Is3V/j61V6SPR5J/YZdmuNfORd9HmC43gzhj8160dZQg9dmw51zTSwcNZMjaEb9Ew7
	5T+6eJtWTX4movoQp5QaP0pKt9ivlsvxlrphc4/lsyP8ftneQ3P4FWtUm7rBKrnLigOUVRJOpms
	WKT1jbQL895+nvnepJEU6WShE8gN4lqZ0exIvBQ9EFzJpmb6yg8hywc8TzlmcJ4jXJcQ117O3hr
	XOSV5pM1iIAdgFjhsZmmnIS5UTUvPwEFHRw+32vURe38BW/dFCDC6sUM5i+p09FpsahV6z6WzLx
	F0qPH2YyH7hXkBEjAg+Nr1J/dJnA1r0jlOlnVN31j0W1KREu/lpYwtpkhzjISHT4jQnGgD80gXI
	PP9fc64EX+RwUE2FZZlfOwWGFcXRvB0abnW5/KCxnHbeIv73Bj3esNZMXbHzlXDoZZVzDfk=
X-Received: by 2002:a05:600c:4fcb:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-49987928d0cmr495499365e9.3.1787023354448;
        Mon, 17 Aug 2026 20:22:34 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b0b8-6401-c4f1-8b73-4ccf-fd2c.310.pool.telefonica.de. [2a02:3100:b0b8:6401:c4f1:8b73:4ccf:fd2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998777a4bdsm235899885e9.0.2026.08.17.20.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:22:33 -0700 (PDT)
Date: Tue, 18 Aug 2026 05:22:31 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: compat: Keep alignment address arithmetic 32-bit
Message-ID: <aoPKzPb9YUVULlXG@gmail.com>
References: <20260817000231.21311-1-kmehltretter@gmail.com>
 <e238944c-9349-497a-9d30-0dd2edd7f115@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e238944c-9349-497a-9d30-0dd2edd7f115@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_202237_114274_A8A103C0 
X-CRM114-Status: GOOD (  17.77  )
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

On Mon, Aug 17, 2026 at 11:15:33AM +0100, Arnd Bergmann wrote:
> Nice find! How did you come across this?

Hi Arnd,

This didn't start as a real world bug hunt. I only recently became
aware of the compat alignment fixups and wanted to see how the
implementation differed from the arm32 one.

This is the only issue I found that was a regression from the arm32
implementation, and it looks like this can happen in real usage.

> As I understand it, the underlying problem here is the
> 32-bit overflow of nr_regs. Wouldn't it be sufficient
> to just turn nr_regs into an 'unsigned long' or 'size_t'

You are right that simply widening nr_regs fixes the incorrect address
arithmetic for decrementing LDM/STM transfers.

The 4 GiB wraparound case is possible with a rather unusual arm64
kernel configuration, and correctly handling an individual word
crossing the boundary would require byte accesses. That seems too
contrived to justify the extra complexity here.

Just to be sure by "both instances" do you mean the nr_regs
declarations in both arch/arm64/kernel/compat_alignment.c and
arch/arm/mm/alignment.c?

Changing nr_regs in arm32 alignment.c would not change the generated
code and I guess probably not be backported, so that would create a
divergence with stable kernels.

Would you prefer changing both files, or only the arm64 implementation?

Thanks,
Karl

