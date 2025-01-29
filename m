Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41049C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 07:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=to5O8NoTB/c/DDyXIccxxNZqz1dxeSJFdLztzKRAPko=; b=ec7ITphZjzV9glq2jC0LgiGsiE
	TJ4/XaKTcm/Umr+vSBowW+0SuHVgpxYJdJ5qCGEK5SgO2f8LFUcls4NDxwZfjss+vfsSEZrzulrMY
	MplDgMFjGDRZD+oEtdWtwOlZ8IOd10HRkgYRukRdZVTqJfrK6P8Mb359yOv99qvk5DmgGIJRyWj7u
	FUPRaD0FG2S7HemSU8lRrKKwPQuuiTz7i2CUgunxj/YAFvZ3MIfqLNnFFtBqvY9y2V2ekh9+9HcxG
	RDiFNigSILw4LRTfXYRozDcMZHXbJyzejnc6/c0Z+SaXkrgb08NHD2SPFVECeuK7eXTzG4uu/yS5O
	0rhSRlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td2Ri-00000006T0g-1acs;
	Wed, 29 Jan 2025 07:25:10 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td2QO-00000006Ss2-1QrR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 07:23:49 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so12180434a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 23:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738135427; x=1738740227; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=to5O8NoTB/c/DDyXIccxxNZqz1dxeSJFdLztzKRAPko=;
        b=DWrvbxuyJuhsBeTTgLpk7MPRBuqgCEd1d3RBy2FY9oJKyIdFrCNw+L1jlwQYcGBnZl
         5O3ZEntpPgGbh8yr21GlA+3D2sr5mC7BX+9jO4c01Wu83Ep0bTHLP94sZGPsveynE2RU
         c2319lLy9fiGoNlaVW/8qY9P75qQxzwvKd+6xO4pmtCjVE4aAdmcDFCxA5TPhC60x2cQ
         vomH94T5g1c9uNqyLBzF8A6PTjG4DOp3lFqnsjCOSXkdWer7V/4W5NMsxJtHZyL91Rti
         yHHwIsRgQRRyUZorpHmke2apaUD/EDL1Dvhc7WXU53gR+OIiEN4g1trTonKwcQyhSp+w
         D6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738135427; x=1738740227;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=to5O8NoTB/c/DDyXIccxxNZqz1dxeSJFdLztzKRAPko=;
        b=jAxNV2IFIPlZPy6ZBHjUPV4Q8UhQkOccW4XpRgOfGGUKvVTSeDw5AN5T51uPDXMj8p
         dSz9Vl7J+ZQVvjWRvlnv3CmdsqC4wR3T7xQGYXBA2mSPVht7HYNkSHW8UiWrwk0m5SEd
         knzozVjr7X2Ti/sMUAWnS6FNFgBDDUaI4g/0Ro7FzvmzvPJDberYq8aB44UVtRvomqv5
         wtnVKRiCDO1GVEqpMZb3NXBZ+1nwc2P348Ws79fYmO7LiZqTcXGDtd2szurzA+WlN7++
         04RcCjPRX9dalB4SjamE0RmbGBch6OrdZ3vLyibi+Mpka1lz7zRw+Z6YFNQ4cRlUwQay
         7nJA==
X-Forwarded-Encrypted: i=1; AJvYcCUXqtxRvDR0o2KYJwm1987I6nkbYVWt/tNxGKmKZKkjgn/PTITtMm3AyZupdvi+ANd5hXhLWBFNMEfU7y20XgCv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/lniJmXbdooff9WSYwe8X9o47RCP5HTUxSGdX/mSNA/6gwcUZ
	XSREYJt5mA8bne1ikIfkbVTToyryibqp6mB0DdCJpBZFdlROCo/HJhyy8xIB4ilg3ywbD3entA=
	=
X-Google-Smtp-Source: AGHT+IFKzhN6yxa1m0w1DuTS6hG3IIPd1uDcWGcK6u2GkZ3C9EsPnGf+Bhi+qQWDKgF+BnewqutKH+ggrg==
X-Received: from pfbay42.prod.google.com ([2002:a05:6a00:302a:b0:729:9f1:663e])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d8e:b0:725:cfa3:bc76
 with SMTP id d2e1a72fcca58-72fd0bce05cmr3286318b3a.4.1738135426969; Tue, 28
 Jan 2025 23:23:46 -0800 (PST)
Date: Wed, 29 Jan 2025 07:23:45 +0000
In-Reply-To: <29b94227-8861-4011-b83f-2e0c59dd1f73@oracle.com>
Mime-Version: 1.0
References: <29b94227-8861-4011-b83f-2e0c59dd1f73@oracle.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129072345.3106495-1-wnliu@google.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
From: Weinan Liu <wnliu@google.com>
To: indu.bhagat@oracle.com
Cc: irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	mark.rutland@arm.com, peterz@infradead.org, roman.gushchin@linux.dev, 
	rostedt@goodmis.org, will@kernel.org, wnliu@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_232348_376775_B59CAF15 
X-CRM114-Status: GOOD (  10.20  )
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

Not only does objdump show that func_start_addr all 0s, but the
func_start_addr in the kernel module's sframe table is also incorrect. I'll
prepare a repro so we can investigate this.

>
> I can share a fix for 32589 so atleast we can verify that the starting
> point is sane.
>

Great! Thanks.
This will be helpful for comparing the values from the sframe table with
the values we obtain at runtime

