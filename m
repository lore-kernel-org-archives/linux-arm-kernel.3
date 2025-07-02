Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B18C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rucETxapXKXGBN7PtyHY+EQo5NyBaPuYKngjv1dJ15E=; b=jBLveNs9YoSbIovDTLo9puHMrQ
	3TFlw1GcYX3aiUKyQZhR59JO2HJQqKE3pk9fEgMCdyWgMd62S2eW/iMhIqu5QN1ow21wUf2bNQCwy
	2HD8FMJy20vuvvPLJA3R61xFT8+CxwvZGbYiNMEVoB94v8lPn3hwPS40zO7fN5lhqYDroyVDBw0pY
	3YXC6qcbJWnP3Rk4qGLBWsisiqaBKwjqZgkora5BxPT43g2trGVd8TPmOXpFfUg2XarzKPJv5zsOW
	edDYUSi4YwAYlJMttHTkdwISe8SucFp9MBxEQ4NlPEyldQ/ZPtWn/YqFOotePCRLY/5zc814H+pqu
	CSRw+27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtMl-00000007gO3-2STM;
	Wed, 02 Jul 2025 09:02:55 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtKP-00000007fpP-1tBP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:00:30 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-adfb562266cso1057524866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751446827; x=1752051627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rucETxapXKXGBN7PtyHY+EQo5NyBaPuYKngjv1dJ15E=;
        b=X6qelHRyv9r/Y9A5Cm+UgpFMnNSZFXtvLbo1wyJbvidz7qYzDr2EljJPubUlEkA/FG
         jfsMFe/Pwv2xA+eEPalTbgpYjXcW06U2sgLdHF+wzMnZWY1AK7h1KP52s7IyP98k0jmx
         5faCq/uOR4EgKO5cHpV/rlH1VJd3wVQoaYZ1UOUjz1i1oF8Q1naVSJ6bg0zC4f+4cGFh
         HlarvXRApGpQgvtkjpDkDqteju/wezh2jIN1F3SoyVGeDFhR6n49uVN3Rh+1505oufyO
         cClC8ZMHkNKZ9oi4ovGfrvrXoaTA+LohCqst8pNPSNudr+m0VqMqsvNwmjZOuz5rhX6I
         2y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751446827; x=1752051627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rucETxapXKXGBN7PtyHY+EQo5NyBaPuYKngjv1dJ15E=;
        b=rKyXToPMrfuCQPMb617y0RyjHR1e2xCJzN1rZJBUf9kMauV7gWCLpTcWLxuYOjIj4e
         VCLAhnMDMPzccBSjwJGMCJ/p5ZDUVobHHNvvVhSlT48PYTuWkLms30rBqKV9/JslbdX1
         jN/2PLcmgsPMYpql9nmGz+FTx4h9ZCj3bIdmjZo+wOV0H6D/gSv96cqpS1L2HnObjCpV
         waOFC/n6uAWn/lqnIGlj3tao1McwyGhANWhnQdbab/uclvFLnLTzc6CXpSMu7m4X8/p1
         wlt4ihvDWPE/PPNc7jxTlQMVbfvfMCPJBlR57HL/IuDPQuppsbBNpGaWKm95YC+gL8uO
         Q9dA==
X-Forwarded-Encrypted: i=1; AJvYcCWQcd8A7KaCEvh+sWnzQrJEllh9BcuGoUHJwESCGmCh+3Z304nVHHi/99qgsaVkAxLPiawSIj4AapH3goeUkr58@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4JZ3eR50fRcJ+YADI7WWYfMYpdAqGf42fvyltvPT8KuHhnIwx
	nn+LcGabKJsEnZ/MTCrZEQKyfdIxaZdb46zY+VaN140aqq1tM27eLrw+LnKvtfW0Hn4ry4cGTr0
	NFqcnqTdDP0r87qvkoAkCG3vFsYui79Y=
X-Gm-Gg: ASbGnctwcSG4ruWdyjhnqotHrPCynWBzAQ+XmbATtRfZOtYwqJE26RjR7dt1v3z/4lM
	7XjdWZxSqCcovbEJK/IxQf9Wk8oUIM/esSBGx6v8s5FMV5hW1jJhGFNfILbV8B/7YkEPGfvdODM
	SfPS88eS7nTzOlXrFOT6lh4ZXppnXpiSrJyIT5kr2qL54=
X-Google-Smtp-Source: AGHT+IEdvImO4hnAYVqt+jmktPUdIKdat3t90Sg7JU0s+cTJ/+BkwrzVe7PRmsWiA+2BUv1OZ2j0hvm0CoGRXeNnOMo=
X-Received: by 2002:a17:907:daa:b0:ae0:14e0:1d62 with SMTP id
 a640c23a62f3a-ae3c2da9576mr208513766b.55.1751446826630; Wed, 02 Jul 2025
 02:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250624152549.2647828-1-xavier.qyxia@gmail.com> <aGPpohrc8APQad-v@arm.com>
In-Reply-To: <aGPpohrc8APQad-v@arm.com>
From: Xavier Xia <xavier.qyxia@gmail.com>
Date: Wed, 2 Jul 2025 17:00:14 +0800
X-Gm-Features: Ac12FXwk-GXgGl7lpWXoZ7Ko4kCXGQR4cPY2sOiuMeJ3c4KkhJBtDKSH3jCiC6o
Message-ID: <CAEmg6AVrJ0A9QsnDZApdnq4gu=x0_1soqrhNv9oBMQKNGtsKqw@mail.gmail.com>
Subject: Re: [PATCH v7] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: ryan.roberts@arm.com, will@kernel.org, 21cnbao@gmail.com, 
	ioworker0@gmail.com, dev.jain@arm.com, akpm@linux-foundation.org, 
	david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, willy@infradead.org, 
	xavier_qy@163.com, ziy@nvidia.com, Barry Song <baohua@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_020029_491103_E49B7CF2 
X-CRM114-Status: GOOD (  26.45  )
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

Hi Catalin,


On Tue, Jul 1, 2025 at 9:59=E2=80=AFPM Catalin Marinas <catalin.marinas@arm=
.com> wrote:
>
> On Tue, Jun 24, 2025 at 11:25:49PM +0800, Xavier Xia wrote:
> > This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockles=
s
> > function by adding early termination logic. It checks if the dirty and
> > young bits of orig_pte are already set and skips redundant bit-setting
> > operations during the loop. This reduces unnecessary iterations and
> > improves performance.
> >
> > In order to verify the optimization performance, a test function has be=
en
> > designed. The function's execution time and instruction statistics have
> > been traced using perf, and the following are the operation results on =
a
> > certain Qualcomm mobile phone chip:
> >
> > Test Code:
> >       #include <stdlib.h>
> >       #include <sys/mman.h>
> >       #include <stdio.h>
> >
> >       #define PAGE_SIZE 4096
> >       #define CONT_PTES 16
> >       #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> >       #define YOUNG_BIT 8
> >       void rwdata(char *buf)
> >       {
> >               for (size_t i =3D 0; i < TEST_SIZE; i +=3D PAGE_SIZE) {
> >                       buf[i] =3D 'a';
> >                       volatile char c =3D buf[i];
> >               }
> >       }
> >       void clear_young_dirty(char *buf)
> >       {
> >               if (madvise(buf, TEST_SIZE, MADV_FREE) =3D=3D -1) {
> >                       perror("madvise free failed");
> >                       free(buf);
> >                       exit(EXIT_FAILURE);
> >               }
> >               if (madvise(buf, TEST_SIZE, MADV_COLD) =3D=3D -1) {
> >                       perror("madvise free failed");
> >                       free(buf);
> >                       exit(EXIT_FAILURE);
> >               }
> >       }
> >       void set_one_young(char *buf)
> >       {
> >               for (size_t i =3D 0; i < TEST_SIZE; i +=3D CONT_PTES * PA=
GE_SIZE) {
> >                       volatile char c =3D buf[i + YOUNG_BIT * PAGE_SIZE=
];
> >               }
> >       }
> >
> >       void test_contpte_perf() {
> >               char *buf;
> >               int ret =3D posix_memalign((void **)&buf, CONT_PTES * PAG=
E_SIZE,
> >                               TEST_SIZE);
> >               if ((ret !=3D 0) || ((unsigned long)buf % CONT_PTES * PAG=
E_SIZE)) {
> >                       perror("posix_memalign failed");
> >                       exit(EXIT_FAILURE);
> >               }
> >
> >               rwdata(buf);
> >       #if TEST_CASE2 || TEST_CASE3
> >               clear_young_dirty(buf);
> >       #endif
> >       #if TEST_CASE2
> >               set_one_young(buf);
> >       #endif
> >
> >               for (int j =3D 0; j < 500; j++) {
> >                       mlock(buf, TEST_SIZE);
> >
> >                       munlock(buf, TEST_SIZE);
> >               }
> >               free(buf);
> >       }
> >
> >       int main(void)
> >       {
> >               test_contpte_perf();
> >               return 0;
> >       }
> >
> >       Descriptions of three test scenarios
> >
> > Scenario 1
> >       The data of all 16 PTEs are both dirty and young.
> >       #define TEST_CASE2 0
> >       #define TEST_CASE3 0
> >
> > Scenario 2
> >       Among the 16 PTEs, only the 8th one is young, and there are no di=
rty ones.
> >       #define TEST_CASE2 1
> >       #define TEST_CASE3 0
> >
> > Scenario 3
> >       Among the 16 PTEs, there are neither young nor dirty ones.
> >       #define TEST_CASE2 0
> >       #define TEST_CASE3 1
> >
> > Test results
> >
> > |Scenario 1         |       Original|       Optimized|
> > |-------------------|---------------|----------------|
> > |instructions       |    37912436160|     18731580031|
> > |test time          |         4.2797|          2.2949|
> > |overhead of        |               |                |
> > |contpte_ptep_get() |         21.31%|           4.80%|
> >
> > |Scenario 2         |       Original|       Optimized|
> > |-------------------|---------------|----------------|
> > |instructions       |    36701270862|     36115790086|
> > |test time          |         3.2335|          3.0874|
> > |Overhead of        |               |                |
> > |contpte_ptep_get() |         32.26%|          33.57%|
> >
> > |Scenario 3         |       Original|       Optimized|
> > |-------------------|---------------|----------------|
> > |instructions       |    36706279735|     36750881878|
> > |test time          |         3.2008|          3.1249|
> > |Overhead of        |               |                |
> > |contpte_ptep_get() |         31.94%|          34.59%|
> >
> > For Scenario 1, optimized code can achieve an instruction benefit of 50=
.59%
> > and a time benefit of 46.38%.
> > For Scenario 2, optimized code can achieve an instruction count benefit=
 of
> > 1.6% and a time benefit of 4.5%.
> > For Scenario 3, since all the PTEs have neither the young nor the dirty
> > flag, the branches taken by optimized code should be the same as those =
of
> > the original code. In fact, the test results of optimized code seem to =
be
> > closer to those of the original code.
> >
> > Ryan re-ran these tests on Apple M2 with 4K base pages + 64K mTHP.
> >
> > Scenario 1: reduced to 56% of baseline execution time
> > Scenario 2: reduced to 89% of baseline execution time
> > Scenario 3: reduced to 91% of baseline execution time
>
> Still not keen on microbenchmarks to justify such change but at least
> the code is more readable than the macro approach in some earlier
> version.
>
> Do you have any numbers to see how it compares with your v1:
>
> https://lore.kernel.org/all/20250407092243.2207837-1-xavier_qy@163.com/
>
> That patch was a lot simpler.
>

You can check the comparison data via:

https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@16=
3.com/

The v1 only optimizes Scenario 1 case (where all PTEs are both young and di=
rty),
but it degrades performance in other scenarios. Although the current
version increases
code complexity, its optimization results are notably significant.

--

Thanks,
Xavier

