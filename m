Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5319D32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTgVYE7JLiGUehWz0eOMkeV9EgMgMxB/RpXPqpnO1eA=; b=RGdWw6nN47Vq9ZwAgsWUK00C2v
	Zjellj4/uZKheOfhUj8xBYgeQIaYhRarNujKBCGMEN6ShW2ouqDU6v/MJ+ReHZsMBmqI5HGF0kfUL
	7yMNCI2x3LbjUQQU6/tXQPuuQLRUrWYORLuEchhzYiTywGuy2I2qO+97grh+mhf8VaJ5M56o/5PP7
	2iQMZHexHki9SAFKUtVnmQn2P/QayCqEaCliwtkOZTsGjfHv4VZ73pt+8+pP61Tim14uxgU+q+6xJ
	a1UI7IGzR+nphjnCFVBM3XYneG44LHKU8Hse/UoHgvaVHxCG3TKaFIxANFEEycYUmIr2KlZBBitOP
	3IjUpNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApWH-00000003JRh-0OUG;
	Tue, 12 Nov 2024 11:57:17 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoTr-000000037IY-1c6J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:50:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d570728ebso328155f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731408642; x=1732013442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTgVYE7JLiGUehWz0eOMkeV9EgMgMxB/RpXPqpnO1eA=;
        b=B0JEuBoWu94vFyOcpT4GRi2csea4P6Np92Lzy1Q2hc1a5f5jmbgycCYZCztK0NKexj
         +R1A6cKOSAWqdAG4vwYNXKHATI+rhZhdXwhgR6CuVDYVQBrfv1cvXJJWpGc8uosSd23V
         qM5ZKm9R3LpGp91dagNL6YeCkfETvyAQQzDmhBNZIH16S5PIyTdQ21XHHV6fVQjUvntQ
         7/xcLdbhCu41GP0rA5XLHE+a9ecCT51Qz76UomPHxGR6zVx/CHE2JocNhUAxpvrcgImZ
         T32Fdzu3P1wl83qpOdvWBYQPPZ7EgGPld7wFlSCS8eHToN9c8tdPlX7NO1ImlPEf3yMn
         XqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731408642; x=1732013442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTgVYE7JLiGUehWz0eOMkeV9EgMgMxB/RpXPqpnO1eA=;
        b=fugaVKwfBkc5Kluh+G4jJZkiqUBYAXXYUZJqD69VTEMeItoTNSW2hQlT6W5oKzUEJD
         qG9lIn9sztCOoVxjDasc7aOvt3cGHmYEQQQym82D84B9qWiAChcdZKZpeOnvEnCjFGJO
         w8J2gtkgimjLsXqNgjwBbctyF6wksuVbSW8hsnt2W7gt9ZIS22q01yxMtS2nYzkfaSdv
         b+986/dyWh6RU9wYrcpByvc7lZ7liXLLYIB2rowgWqCTldVNwSkqrkjrCPx6IidB6uXy
         KsGT+RIEMOuPPIL5NctihJwfJh+UvZ5o/TwXhbCsx43XSkhiHllSj4xwgFsymL76dsMI
         4uag==
X-Forwarded-Encrypted: i=1; AJvYcCW6JGj9cT5P+QPD8DEa1QaWW5S4hj06bmIAu7Y2uegdD7ZYjTTktE2QWUyTE9jLr4ILH26STmkhCqsng3y07G90@lists.infradead.org
X-Gm-Message-State: AOJu0YxoQ6Zhg9DkMRbtoyQVpzKYo42A7fykes6wZCogluCaWXfa//GH
	jBOrm2uWlit4VrRfcV64iYKFwhI3SJtnW7Dg0a45ex2WNh12HdvEB1c8CAdi8qM=
X-Google-Smtp-Source: AGHT+IGaLUGeaN6MVuarxyR5MOhRTePhT94Xw+G660FchXt3cxsumD+4PR7WHuF4hFI5P8QlbXHYVA==
X-Received: by 2002:a05:6000:178b:b0:374:cc10:bb42 with SMTP id ffacd0b85a97d-381f1829a57mr5195405f8f.2.1731408641623;
        Tue, 12 Nov 2024 02:50:41 -0800 (PST)
Received: from mordecai.tesarici.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970d89sm15461714f8f.8.2024.11.12.02.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:50:41 -0800 (PST)
Date: Tue, 12 Nov 2024 11:50:39 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>,
 Greg Marsden <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Message-ID: <20241112115039.41993e4b@mordecai.tesarici.cz>
In-Reply-To: <5a041e51-a43b-4878-ab68-4757d3141889@arm.com>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
	<20241017142752.17f2c816@mordecai.tesarici.cz>
	<aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
	<20241111131442.51738a30@mordecai.tesarici.cz>
	<046ce0ae-b4d5-4dbd-ad9d-eb8de1bba1b8@arm.com>
	<20241112104544.574dd733@mordecai.tesarici.cz>
	<5a041e51-a43b-4878-ab68-4757d3141889@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_025043_464631_A77D9D72 
X-CRM114-Status: GOOD (  24.51  )
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

On Tue, 12 Nov 2024 10:19:34 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 12/11/2024 09:45, Petr Tesarik wrote:
> > On Mon, 11 Nov 2024 12:25:35 +0000
> > Ryan Roberts <ryan.roberts@arm.com> wrote:
> >   
> >> Hi Petr,
> >>
> >> On 11/11/2024 12:14, Petr Tesarik wrote:  
> >>> Hi Ryan,
> >>>
> >>> On Thu, 17 Oct 2024 13:32:43 +0100
> >>> Ryan Roberts <ryan.roberts@arm.com> wrote:  
> >> [...]  
> >>> Third, a few micro-benchmarks saw a significant regression.
> >>>
> >>> Most notably, getenv and getenvT2 tests from libMicro were 18% and 20%
> >>> slower with variable page size. I don't know why, but I'm looking into
> >>> it. The system() library call was also about 18% slower, but that might
> >>> be related.    
> >>
> >> OK, ouch. I think there are some things we can try to optimize the
> >> implementation further. But I'll wait for your analysis before digging myself.  
> > 
> > This turned out to be a false positive. The way this microbenchmark was
> > invoked did not get enough samples, so it was mostly dependent on
> > whether caches were hot or cold, and the timing on this specific system
> > with the specific sequence of bencnmarks in the suite happens to favour
> > my baseline kernel.
> > 
> > After increasing the batch count, I'm getting pretty much the same
> > performance for 6.11 vanilla and patched kernels:
> > 
> >                         prc thr   usecs/call      samples   errors cnt/samp 
> > getenv (baseline)         1   1      0.14975           99        0   100000 
> > getenv (patched)          1   1      0.14981           92        0   100000   
> 
> Oh that's good news! Does this account for all 3 of the above tests (getenv,
> getenvT2 and system())?

It does for getenvT2 (a variant of the test with 2 threads), but not
for system. Thanks for asking, I forgot about that one.

I'm getting substantial difference there (+29% on average over 100 runs):

                        prc thr   usecs/call      samples   errors cnt/samp  command
system (baseline)         1   1   6937.18016          102        0      100     A=$$
system (patched)          1   1   8959.48032          102        0      100     A=$$

So, yeah, this should in fact be my priority #1.

The "system" benchmark measures the duration of system("A=$$"), which
involves starting the system shell (in my case bash-4.4.23), so this is
not really a microbenchmark. I hope perf can help match the difference
to a kernel API.

Petr T

