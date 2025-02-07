Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71702C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VhtexnXVY7QzQMUAllx3j3vLs0pu8Zqa/G9m/NY7Is=; b=ADJrMEkJinrwgmeTRMmT/z6zEs
	Qvgq0QjjC6Dzh4W+BIOhDSQruxhw/7r5EcaAKMHT/IBcYFwr+/jX5nsaxPQlHTwhTGUK+bviiZ9JQ
	sjCyjr6hMCDDIQgqA2geVrbFgcTWNdsIE8BTS7tsW1HO4PLUhay3efX+EA0+ttjIHqy78ZRrcNCK3
	PoRB1154PN/LboyFPhb8TLx7ITGsEgZZUSOov11WcYz5Ka1BN3NLIMdRCrBPNc9UskRN4ksVU5nnr
	jdhY4cVSNtnWwgCzpJZbiDGsFEEGAXLIyPc/yaM4mWrjsMOGCPHKP8DWY64qpPZC75/ItoYiqfvD/
	VJ8GPANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTNg-0000000AmXi-2qOy;
	Fri, 07 Feb 2025 18:47:12 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTMG-0000000AlvP-35Aq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:45:46 +0000
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dce1d61b44so4432803a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 10:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738953943; x=1739558743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VhtexnXVY7QzQMUAllx3j3vLs0pu8Zqa/G9m/NY7Is=;
        b=tNkYYsFNrbG2FvmufJpfyuWyuLQM8m94Y0OiqMqaCdV7g2+BifGB5heAmCfeDjAwr7
         Lh78d+M5QTZ1PcpIj6SUEfnUuyW8Y4aiqi+4T/sjbEzDlLigg9yYWA0JE7HYF+gv8vTE
         6HXESh0EweZX70QaP5oJYeViUmkO+B6uMa+ahexrXMSnJ678PNju7s68AQrDLLki2WhU
         inx2T63tY10xown2fbYUNHqIwtfRUKrJwFACA5FeiTTyYSMqajh09ZrvbUB8iAJsG8nu
         Qv5aWzqZL2e/LWt3XlL6Ff8bEBdcFCeG2Nwxrm8Yt0YDH4hUvV/8xK9qkc/FSlr/LzKB
         vf9g==
X-Forwarded-Encrypted: i=1; AJvYcCXdpsYk0jHbUM64kqztZRnGMCQUUDK3VpMK9qBlFX4JP7EEoLBi2swtb+jHu6zFZ3a3D3gED/S2NwVhiZX47kOF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+djYz4JEGOvazbhIR5lqeKZajbatxMyM3U1Yo5zkQWWRL9dQx
	Kb3/jOJW2i4os6/pLhLya4t2ZcjaGRuFzOoDZI9ulFGDqblEPRY4r0EwFg==
X-Gm-Gg: ASbGncsNPu01iyjNf7yLW7JE01XpVLPd1o9V2792TayypwJUl0P65k1tGzD/0wiL4+I
	xRMYlOy3qgzN79DDRq0MxyK1AT+yltZtJL4w4NnLKNzzO8K9xAx+rs5fik2YF948KHSR6UUplaa
	kEU6Rgv9eE8oWoYbvkBaZc+xAZFJz5hlR+Rb1oumehbIRPLdZBB1Cm3wgM/+CJcGP8SLHUx+VUr
	SbNhx0xOMhxzD7/QYNUxvNlNgBVvndbwsllIRhMcQ1KOZ5SNBs0NYwa1IH1oUhaeOr/zR41BNtt
	zqM1/Q==
X-Google-Smtp-Source: AGHT+IHAR6axEQ9+MHkvZntvG8d4OS0CceWilbre6crnARE2tUy/m826mkvKKvBjhjA1TdvTgvMfIg==
X-Received: by 2002:a05:6402:3483:b0:5dc:c9ce:b01b with SMTP id 4fb4d7f45d1cf-5de450048camr4278947a12.8.1738953942726;
        Fri, 07 Feb 2025 10:45:42 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:9::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b81608sm2898142a12.35.2025.02.07.10.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 10:45:41 -0800 (PST)
Date: Fri, 7 Feb 2025 10:45:39 -0800
From: Breno Leitao <leitao@debian.org>
To: Mark Brown <broonie@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix uninitialized variable warning in
 FPMR test
Message-ID: <20250207-small-marmot-of-opposition-e7afd3@leitao>
References: <20250207-arm_fix_selftest-v1-1-0d6eeb04299e@debian.org>
 <89da135a-8c14-478f-9830-0b03ecd0b14d@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89da135a-8c14-478f-9830-0b03ecd0b14d@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_104544_773744_6CFE8052 
X-CRM114-Status: GOOD (  12.63  )
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

Hello Mark,

On Fri, Feb 07, 2025 at 05:26:06PM +0000, Mark Brown wrote:
> On Fri, Feb 07, 2025 at 03:06:42AM -0800, Breno Leitao wrote:
> > Fix compiler warning about potentially uninitialized orig_fpmr variable:
> > 
> > 	testcases/fpmr_siginfo.c: In function ‘fpmr_present’:
> > 	testcases/fpmr_siginfo.c:68:25: warning: ‘orig_fpmr’ may be used uninitialized in this function [-Wmaybe-uninitialized]
> > 	                         fprintf(stderr, "FPMR in frame is %llx, was %llx\n",
> > 	                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 	                                 fpmr_ctx->fpmr, orig_fpmr);
> > 	                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This seems like something that should be reported to the compiler
> people, we only print the FPMR value if have_fpmr and there's an
> assignment to orig_fpmr in that case.  Which compiler is this?

Good point. I am using:
	# gcc --version
	gcc (GCC) 11.5.0 20240719 (Red Hat 11.5.0-2)

Clang, on the other hand, isn't upset about it.

	# clang --target=aarch64-redhat-linux-gnu -fintegrated-as -Wall -O2 -g -I/home/leit/Devel/upstream/tools/testing/selftests/ -isystem /home/leit/Devel/upstream/usr/include -I/home/leit/Devel/upstream/tools/include -std=gnu99 -I. -Wno-address-of-packed-member -Wno-gnu-variable-sized-type-not-at-end -D_GNU_SOURCE=  testcases/fpmr_siginfo.c test_signals.c test_signals_utils.c testcases/testcases.c signals.S sve_helpers.c -o testcases/fpmr_siginfo
	# clang --version
	clang version 19.1.3 (CentOS 19.1.3-1.el9)


