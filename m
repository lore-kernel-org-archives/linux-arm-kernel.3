Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED11D41C3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q4yAy2wMFv3QmNaNBh+HpCNSzH/IZuAzT2Ere1d8IE=; b=DDJZ7KsGG2euAu80cIHu4JHrkl
	e0IXtnmpCPI37Iynuqyga3XmNnTf19Y87Fc+9bMq0rNVQbkXPGiE53/geMdJFC6Dy421Xue3AFJkC
	ihYpFYJOA0YfhbOrBPpGwC5Js3hCExMKsLqmXpcNxqAq2rQBpcmhXdU7iFM1ZOsJaZyeypBQ3d5V9
	I4uuqBqDGFtU2yzeBDVgpJVZ9x7NMtnlPVvH3D1qnlD9HJk7gb2/Xy7AewWFgN4W0hU8my3zKCQPP
	ddeZ1+B4CMLBSbNQDLqihfmP7QPmbrQciVhmmziWghbq7kOm00DFzMmAWPq5qAb5NkdsAg5yXyM53
	PGsPWWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCiO-00000006ntU-3xSv;
	Wed, 13 Nov 2024 12:43:20 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCfr-00000006nOc-2sTA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 12:40:44 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9a04210826so25801766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 04:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731501641; x=1732106441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Q4yAy2wMFv3QmNaNBh+HpCNSzH/IZuAzT2Ere1d8IE=;
        b=ThPI3PjOmXvd8QzAlDwPxj1C2rH11BwjzvGf4IzX4ER0irgD6Rs4NLpBGrmIikpVou
         Io0LE3LcxK1U7TOQGaGql155S97dphYGM+ek6bkFVbjdRDcfBL8v4vacaSNO75HFS5zO
         LScRa7GOdkr7pzZnRd3VqFUwvvH9nKakRsfaZpDmKYJUiJo0oqliptTJx/OQTk14paDm
         I5jkEb6GYBn/gyaUp9yZhqlB09vXmnwfpN+8R6dp2cxh/Vg1XOCFCqAPKL00u9ZEXtHv
         Yl5Q1S6WJDPKc316Rw/OInYlh1+O7GjPoAsc+AnDSBAa3VzvwtI9NW1TwGWWGRg14TYh
         LRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731501641; x=1732106441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Q4yAy2wMFv3QmNaNBh+HpCNSzH/IZuAzT2Ere1d8IE=;
        b=EujDRT2K3/aeGsCsCbPe6SjuLQj8xpH9GvthD0bsJ3PVnxQfK9oF9iIx/U5vP/cb7s
         z11f06j1heGwi05p3qYSZfhZdegJxCk4QBoFOCC2XirJEXkMlCugtVXuNHKCugThpFQI
         kS/FXMZ/15ANzQBIWbU5VbpTUQd30DkHbTOwfvronIK9MgX7yKHI0JZfVZGqz1Exd9PM
         vNlZQDTj4z5or6OVJPMfl6v42uUF3ObD4ri74tX7XYrZcIJ/32Py2gNbGpadms1fZBv4
         d0iohWxu7jV1ZdK+wIH01jGVHaFY1YJ1EyAWuiK73HacgwrEvmwZXcnCSA4FdkjTeFsK
         HvJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMasDqKoXy6DoI3FcJ68jtWzoahdnAJbcPMYHqSi0GSi/gjMr5AmW/7JizArht30L30FdlX9ey/iwdlXzbG8Kx@lists.infradead.org
X-Gm-Message-State: AOJu0YytFaRnOVW41WnSdc1Tim/MI4KCfIYYzh+9yf9bL5iOOU+0j95o
	SpySPZR98fsjZAbY+7LFXnWO7dhYYfnK521EBs49uuJnyZchOJvFTSMrViWsb3k=
X-Google-Smtp-Source: AGHT+IEwds+FuFoQ3DTtkRiLVPQwZ1Gfef0GGqF7IdAomHWebbd6rX+YVFq4FDwO4+GGcieYxQRANg==
X-Received: by 2002:a17:907:7da8:b0:a9a:3dc0:efec with SMTP id a640c23a62f3a-a9eeff38625mr783864266b.7.1731501641518;
        Wed, 13 Nov 2024 04:40:41 -0800 (PST)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a17678sm857771766b.10.2024.11.13.04.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 04:40:41 -0800 (PST)
Date: Wed, 13 Nov 2024 13:40:38 +0100
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
Message-ID: <20241113134038.5843ab73@mordecai.tesarici.cz>
In-Reply-To: <20241112115039.41993e4b@mordecai.tesarici.cz>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
	<20241017142752.17f2c816@mordecai.tesarici.cz>
	<aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
	<20241111131442.51738a30@mordecai.tesarici.cz>
	<046ce0ae-b4d5-4dbd-ad9d-eb8de1bba1b8@arm.com>
	<20241112104544.574dd733@mordecai.tesarici.cz>
	<5a041e51-a43b-4878-ab68-4757d3141889@arm.com>
	<20241112115039.41993e4b@mordecai.tesarici.cz>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_044043_762938_310049AB 
X-CRM114-Status: GOOD (  32.50  )
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

On Tue, 12 Nov 2024 11:50:39 +0100
Petr Tesarik <ptesarik@suse.com> wrote:

> On Tue, 12 Nov 2024 10:19:34 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
> > On 12/11/2024 09:45, Petr Tesarik wrote:  
> > > On Mon, 11 Nov 2024 12:25:35 +0000
> > > Ryan Roberts <ryan.roberts@arm.com> wrote:
> > >     
> > >> Hi Petr,
> > >>
> > >> On 11/11/2024 12:14, Petr Tesarik wrote:    
> > >>> Hi Ryan,
> > >>>
> > >>> On Thu, 17 Oct 2024 13:32:43 +0100
> > >>> Ryan Roberts <ryan.roberts@arm.com> wrote:    
> > >> [...]    
> > >>> Third, a few micro-benchmarks saw a significant regression.
> > >>>
> > >>> Most notably, getenv and getenvT2 tests from libMicro were 18% and 20%
> > >>> slower with variable page size. I don't know why, but I'm looking into
> > >>> it. The system() library call was also about 18% slower, but that might
> > >>> be related.      
> > >>
> > >> OK, ouch. I think there are some things we can try to optimize the
> > >> implementation further. But I'll wait for your analysis before digging myself.    
> > > 
> > > This turned out to be a false positive. The way this microbenchmark was
> > > invoked did not get enough samples, so it was mostly dependent on
> > > whether caches were hot or cold, and the timing on this specific system
> > > with the specific sequence of bencnmarks in the suite happens to favour
> > > my baseline kernel.
> > > 
> > > After increasing the batch count, I'm getting pretty much the same
> > > performance for 6.11 vanilla and patched kernels:
> > > 
> > >                         prc thr   usecs/call      samples   errors cnt/samp 
> > > getenv (baseline)         1   1      0.14975           99        0   100000 
> > > getenv (patched)          1   1      0.14981           92        0   100000     
> > 
> > Oh that's good news! Does this account for all 3 of the above tests (getenv,
> > getenvT2 and system())?  
> 
> It does for getenvT2 (a variant of the test with 2 threads), but not
> for system. Thanks for asking, I forgot about that one.
> 
> I'm getting substantial difference there (+29% on average over 100 runs):
> 
>                         prc thr   usecs/call      samples   errors cnt/samp  command
> system (baseline)         1   1   6937.18016          102        0      100     A=$$
> system (patched)          1   1   8959.48032          102        0      100     A=$$
> 
> So, yeah, this should in fact be my priority #1.

Further testing reveals the workload is bimodal, that is to say the
distribution of results has two peaks. The first peak around 3.2 ms
covers 30% runs, the second peak around 15.7 ms covers 11%. Two per
cent are faster than the fast peak, 5% are slower than slow peak, the
rest is distributed almost evenly between them.

100 samples were not sufficient to see this distribution, and it was
mere bad luck that only the patched kernel originally reported bad
results. I can now see bad results even with the unpatched kernel.

In short, I don't think there is a difference in system() performance.

I will still have a look at dup() and VMA performance, but so far it
all looks good to me. Good job! ;-)

I will also try running a more complete set of benchmarks during next
week. That's SUSE Hack Week, and I want to make a PoC for the MM
changes I proposed at LPC24, so I won't need this Ampere system for
interactive use.

Petr T

