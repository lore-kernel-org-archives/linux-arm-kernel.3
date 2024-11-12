Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A911BD32D7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ux99EXTFhc2LTeBRNUSr8JorPEvhAiRmSDxU9fdyTbA=; b=mo158g9csu1nMNUHxgLO9GqZ7Z
	ncuDYuTg9agCeRISe8LyH5rkBrazocSBs75x+Oy1+lfJxyAAjJjbWlbfL5L4+Ulxonuum0JjQEH3x
	9qCfGtnue0PHwkZ0FSKXxPrB7X8czBKq8yXx3587uZhVAx5jOdV6jwV2JAJeQrVPhQjQCrLjSC6Cv
	XF1ukA3w2vciaC5rgY4fG8DOsrUKoq1VQAI5U9krbc6eGfXCcZ7eQSinHjYKIDAgUvlFECjqoGfSk
	6mP7bx8tygutF82lJIk/Tyce6wKghQEludCh9EnJGXS3t+i+LjkJOiri7Jrnhtd/bD8k1W9Qb4os9
	rIrDMKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnUs-00000002vYv-0oLN;
	Tue, 12 Nov 2024 09:47:42 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnT2-00000002v6Q-2t7O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:45:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37d7351883aso18013f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 01:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731404747; x=1732009547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ux99EXTFhc2LTeBRNUSr8JorPEvhAiRmSDxU9fdyTbA=;
        b=FFaSFyyriRsoQ/2KiNoiUpgqVsqosd2CdzHOqpTZ+3dhq+tZFJR0tr/ttQK1QHMgn6
         tUK6ct4X7ql9tpiE4IbDKKgI+8OzS6udjV8N6s4F2CLWuiQJ6p3dnnRlEq0c5V4kPDTf
         TPrSVlDy0E/wW5uQHwbnBpYnVK4m+5bAD1Jjx7TiuF0oCaYLw/X30Ifr0CmP2ujPcpGA
         UflF2gY9EdYXqXuMqeNcJJ1Q82Inr12+7hkHOcjbCow8VzIdw+706/00D8DusGTkjHU6
         gv7q1UFE7oRczLszAufY4bYQJVbBEOM6L1zLiw9VwbmhFWhjvIh8yyaH9Kw5/KJ6Dawk
         6UHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404747; x=1732009547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ux99EXTFhc2LTeBRNUSr8JorPEvhAiRmSDxU9fdyTbA=;
        b=aL3tOF7sWsJrL0sAxrvnf2Lhq5ddZf8Yj++SxlHDHIWVK0XC478WJLscBYuESrgCT5
         pDc3tdp+XJIX7w5VNybPO6EKH5Kdl/ZAbu3KeSqb+SIw+BaWpqmBJRjpZDRX9UKWQwnO
         Ck5jCcnm3+S4SakwQ7qDc54dScGftCZQjjYgpuUnx4zljMEMh9T8JVIhvj/0sKwE8UJf
         QAG44PRjJyOVTbKyennEaTPZm4ju2s3pHdZ0JFKfov1Jodr9gRpsq1ptN+sgMW+v0Sew
         oX9jdvz7iEAeNH/9VcPIKvO5Y321svGJCS/rxhYbwQLYpVB16wtkStMHgozKHvkcxs+A
         4Zxg==
X-Forwarded-Encrypted: i=1; AJvYcCW/SM/lFknW0eNRwBYiGRmqfrFyLOPIcOXcbzjbrjrj+RUYGDhuhQqiWEvhRpT7mCOfMRhFJbc+Z7hfc/fchSDL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0426ZECLWTbmmoLsvSqBCfeyeBRomRsxS4Nhy7uzEk3NbvoZg
	hNabNeGFljzrFI1EnTmTiIbp2+VvgB1QDzs1l8eJSyvJDSw9PI9PXrIdOQx2VMg=
X-Google-Smtp-Source: AGHT+IE/c0J/jTJUjiiSC6K/TBObSdXmRsTIjAJq4ymWFVMBIE5d/rZl+zr7BxDWcRQLISX8yjB3JA==
X-Received: by 2002:a05:6000:1844:b0:37d:468c:1f38 with SMTP id ffacd0b85a97d-381f1854233mr5002237f8f.12.1731404746903;
        Tue, 12 Nov 2024 01:45:46 -0800 (PST)
Received: from mordecai.tesarici.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9719easm15302568f8f.9.2024.11.12.01.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 01:45:46 -0800 (PST)
Date: Tue, 12 Nov 2024 10:45:44 +0100
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
Message-ID: <20241112104544.574dd733@mordecai.tesarici.cz>
In-Reply-To: <046ce0ae-b4d5-4dbd-ad9d-eb8de1bba1b8@arm.com>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
	<20241017142752.17f2c816@mordecai.tesarici.cz>
	<aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
	<20241111131442.51738a30@mordecai.tesarici.cz>
	<046ce0ae-b4d5-4dbd-ad9d-eb8de1bba1b8@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_014548_875446_2C7DA37E 
X-CRM114-Status: GOOD (  20.20  )
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

On Mon, 11 Nov 2024 12:25:35 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> Hi Petr,
> 
> On 11/11/2024 12:14, Petr Tesarik wrote:
> > Hi Ryan,
> > 
> > On Thu, 17 Oct 2024 13:32:43 +0100
> > Ryan Roberts <ryan.roberts@arm.com> wrote:
>[...]
> > Third, a few micro-benchmarks saw a significant regression.
> > 
> > Most notably, getenv and getenvT2 tests from libMicro were 18% and 20%
> > slower with variable page size. I don't know why, but I'm looking into
> > it. The system() library call was also about 18% slower, but that might
> > be related.  
> 
> OK, ouch. I think there are some things we can try to optimize the
> implementation further. But I'll wait for your analysis before digging myself.

This turned out to be a false positive. The way this microbenchmark was
invoked did not get enough samples, so it was mostly dependent on
whether caches were hot or cold, and the timing on this specific system
with the specific sequence of bencnmarks in the suite happens to favour
my baseline kernel.

After increasing the batch count, I'm getting pretty much the same
performance for 6.11 vanilla and patched kernels:

                        prc thr   usecs/call      samples   errors cnt/samp 
getenv (baseline)         1   1      0.14975           99        0   100000 
getenv (patched)          1   1      0.14981           92        0   100000 

> You probably also saw the conversation with Catalin about the cost vs benefit of
> this series. Performance regressions will all need to be considered in the cost
> column, of course. So understanding the root cause and trying to reduce the
> regression as much as possible will increase chances of getting it accepted
> upstream.

Yes. Now that the biggest number is off the table, I'm going to:

 - look into the dup() slowdown
 - verify whether VMA split/merge operations are indeed slower

Petr T

