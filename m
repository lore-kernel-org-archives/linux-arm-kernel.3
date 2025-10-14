Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DF3CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKUCHW/MBIZsUc3ODKKtWIaDlEQsfe7hY3IvRmB8i8o=; b=ipEcXyfm0uj1FEdKyKBA8bCT3n
	9Rijb+cOODB+kcJhTLkfmhRnJU8SEsmVoVMT5xvaYTVtEDwnG8OETie1J7BH99xjGLvuapxX/c5Ga
	JOcIHI18l6bDqwoiYpGDsuYGYbZO6R9SxbF1IULIqatIl0FWhPQuY2y9iRf3b3gPXPKnUz5BNZ0U+
	5jogVNc/7MSrMjDKFj/SMD+up6vs8rvTCNPWNA2/SxFUCM9ad4gtlfEs2+GSYohtfv7IBNZsXoh+J
	lC7v8V4oxBJHf0nFaDYRAoeF33VKxsYPZl194MlNGHgkiKnyGHTLy3noKfzZ5gcAoC3Mz/lphZS0W
	LmyPpiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aU2-0000000FcqO-3Wxs;
	Tue, 14 Oct 2025 08:34:14 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aU1-0000000FcpI-0UxZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 08:34:14 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so9995048a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 01:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430851; x=1761035651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKUCHW/MBIZsUc3ODKKtWIaDlEQsfe7hY3IvRmB8i8o=;
        b=MqDC/JUXnxngqhNKiKNPLZkqU15VyxErJDwLH9A9BW80WAe84A7yhLUd4SnwfBwUyk
         AiKbdRGPr1fXP0ItOuMl3OTJj1QGGEeVJ52JBX0KSwHShTthyNbnOGB4fwrtYVPrIXSA
         FDgg8Ao4kXJ2Fld68Mxth7s2NxEZGdTU05yX8qRve5Qi1lhMa5yIWwGpBV41wXvZEAl7
         cR+SNPeTkNcVGlwsaa+pFehmzMW7IcyMTpmxSPVvkGrKaQk0tGGAwXuLybLxGMX6/8t1
         gSyO5Nqda5XDZYPcTCjmA1SwdPD/UFYExk74xJDZC2pgFbGAY+y8Tk9iA92+WGtangGe
         GDHg==
X-Forwarded-Encrypted: i=1; AJvYcCUX+wBwPJGFvY7+6QoBBhPDJP+Q9CS2l63xvwBmD62kU8pajEs9w8OAI5CSUVQgpr13MUjuebgQgBX7SuuufTgz@lists.infradead.org
X-Gm-Message-State: AOJu0YzEBG+nNfH/guJKgWs29kTo5+kTcEXxoz7GW01dJkfbszR4Kwse
	meBtChq5VgXZsM3rELsJcPiZqgU/ph8G6eDYyjjS561Nc8V1svCUaMMo
X-Gm-Gg: ASbGncuHFoTg+vGSiBwrDEk38//oELL0dTSno0nVkp55k8RWVjbSdt4HgSAjAxSfFva
	szhBdAk//OFOF2L642I+5MsQoMfAGfjrDfVAAc1jnaoxDmiNJVyGdtvY91ggbZZ/C3gY8mGSS8o
	2Dw1hVli7YL0BeAmXtIgV7SINpJDcmq3lwgPHgCq7YXFmvPayWMkvgLtFMqVVgj162GdQLxebJ3
	nrHuw7f5AIFV/XuSSL1njn6uqyAL5WAihUsCsasIqMKURpiFfSmuIm5XSTIi0Eo3zdkPrHdBZTD
	n98Y38a8MPGZDvpt9E8+3QczX8t2bJXMSw2ZzEu8+KSRx1hb0SZ2eLRKywEDx5Dsp0xK25oksm4
	eB8BirYShhjQWpdu21tO4KD6u+7yHKKPGADAr
X-Google-Smtp-Source: AGHT+IH9yDBhkiPY34+r8L4QfGlETNuwKEKExxU3npIvUrJ6TVQTuSdRSJEPMfeufN3cm41sP9BTrQ==
X-Received: by 2002:a05:6402:50c6:b0:632:930c:ed60 with SMTP id 4fb4d7f45d1cf-639d5c57a9cmr20902180a12.30.1760430850785;
        Tue, 14 Oct 2025 01:34:10 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:70::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c322e91sm10304155a12.45.2025.10.14.01.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:34:10 -0700 (PDT)
Date: Tue, 14 Oct 2025 01:34:07 -0700
From: Breno Leitao <leitao@debian.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Changyuan Lyu <changyuanl@google.com>, rppt@kernel.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, anthony.yznaga@oracle.com, 
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, 
	hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, pbonzini@redhat.com, 
	peterz@infradead.org, robh@kernel.org, rostedt@goodmis.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, will@kernel.org, 
	x86@kernel.org
Subject: Re: [PATCH v8 01/17] memblock: add MEMBLOCK_RSRV_KERN flag
Message-ID: <2ege2jfbevtunhxsnutbzde7cqwgu5qbj4bbuw2umw7ke7ogcn@5wtskk4exzsi>
References: <20250509074635.3187114-1-changyuanl@google.com>
 <20250509074635.3187114-2-changyuanl@google.com>
 <ef6wfr72set5wa5el3wbbu4yd5tnc4p2rhtjpb5kpmncv3xs5d@i3c5v3ciioi3>
 <mafs0wm4yluej.fsf@kernel.org>
 <mafs0h5w2lpqu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs0h5w2lpqu.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_013413_171085_DF8D3FE5 
X-CRM114-Status: GOOD (  22.73  )
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

Hello Pratyush,

On Mon, Oct 13, 2025 at 06:40:09PM +0200, Pratyush Yadav wrote:
> On Mon, Oct 13 2025, Pratyush Yadav wrote:
> >
> > I suppose this would be useful. I think enabling memblock debug prints
> > would also be helpful (using the "memblock=debug" commandline parameter)
> > if it doesn't impact your production environment too much.
> 
> Actually, I think "memblock=debug" is going to be the more useful thing
> since it would also show what function allocated the overlapping range
> and the flags it was allocated with.
> 
> On my qemu VM with KVM, this results in around 70 prints from memblock.
> So it adds a bit of extra prints but nothing that should be too
> disrupting I think. Plus, only at boot so the worst thing you get is
> slightly slower boot times.

Unfortunately this issue is happening on production systems, and I don't
have an easy way to reproduce it _yet_.

At the same time, "memblock=debug" has two problems:

 1) It slows the boot time as you suggested. Boot time at large
    environments is SUPER critical and time sensitive. It is a bit
    weird, but it is common for machines in production to kexec
    _thousands_ of times, and kexecing is considered downtime.

    This would be useful if I find some hosts getting this issue, and
    then I can easily enable the extra information to collect what
    I need, but, this didn't pan out because the hosts I got
    `memblock=debug` didn't collaborate.

 2) "memblock=debug" is verbose for all cases, which also not necessary
    the desired behaviour. I am more interested in only being verbose
    when there is a known problem.

That said, my suggestion is to only dump extra information when something goes
wrong, not affecting the boot time neither boot verbosity.

