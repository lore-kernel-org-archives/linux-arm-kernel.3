Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A141C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++ArMbZp2/d1UeSQje2LNI+0PmtQnJ5AtRnBL5XuDLQ=; b=WgSdRyOHmJLhpPf+/FD6BkYRcG
	TDunoBlMJU6cD8bqvM8JBpSef4PhbxBKjvK6ywiTA68X43DnWXWpt3GnKHf3bKQIR8gjWHS0Y5VuN
	oQS7Vmgz/lboTmQr3YL8bh5D8p6a76/MTxBjgma2AyJrUdQxOvQwSVSHmIlYcouRi3wfZTYvW9R+n
	B/Z6SIA4P0KMUMGapy/jvvi2jUjq5zfbTX6jjji8Mz33Ei8KSZReoK9kqQxaMclF3O+8MRNzG66Jp
	zc/lZhceI0JlTcUtVN+YiRgh+8s5yzKG6it4ffNcTSb5mR+G8A2ngmPIeuqW9h/Hk8o4CyRSNs8Hg
	wTcxuFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trvKQ-000000052Lb-3nQw;
	Tue, 11 Mar 2025 08:51:10 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trvIo-000000052D8-11TI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 08:49:31 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso4907786a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741682967; x=1742287767; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=++ArMbZp2/d1UeSQje2LNI+0PmtQnJ5AtRnBL5XuDLQ=;
        b=lfzHyavS7zOlnTrNjK7YLVQHH9oJ1bG8kHKQZzhhqSjgWYx+xlK4RQ867p8tivI3ol
         nDGzn3SjkVG5+ArdKJKAVp6aCZS1r4x5F4ca4EKxNxN0RZ/zQuNHkLvoZ0a7AIIN6an/
         cojaj4q6jcWujwv48k3+Uz2a/jbgPM96FjpdVyHlYL/P06zJ4+F76PJqB0W+MJnDhvcS
         zlb6xsy/vul/h3+/rpHpZYKrai33ctO64oVHS90l0iueTqvCsq3I9aB4xXKD9Jm32zBw
         3Kp58ek7ZIWLjGCWtP+cSx8xSvVpVlB7GiGvPf8teYZwZw0Gh/yozzzke8tdUCHBAwB6
         lR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741682967; x=1742287767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++ArMbZp2/d1UeSQje2LNI+0PmtQnJ5AtRnBL5XuDLQ=;
        b=Ch47rH3yQTH/2r3bxT0fyjR3S3LZDpAR95tYzxi6pEVm+CmX1hibxxcVzNKL1kKyVq
         j37tRN8LN5FzgFryfmVgrS68neHUgiTkleSXbz/s4zPX7KghEBPCt+kkiY2eWXY1BR9m
         tHNNCCS073QPX/uxvYbq6IaQ46jdgIXStBzuVZBUSvg4QYqfSJnn2E7skQJUTachdcE4
         zm0oNY9zOhxQWUPYF7xY5sryxdeaBR+uOfX0cEhrhJKIbUsS8A6L1d7FuuJMIl/HctKu
         N0bzNQwlMbuYHmoDPXc8O8nxuCweBXyRh4AcvvA4o9aVz60asHVrYOVGiRGzGYgWmOUo
         qJqw==
X-Forwarded-Encrypted: i=1; AJvYcCXjweSAo8a3PrCM5jOvjMQ7b1nzRt1+WpL/p+f1t8O3zirjHdJRvImbWQTGhIouknAE8S+H+cGnRpNOtiJp++Wn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy1caLypGKc402NxliWk3f/EZvXmbxMS0r7SjuXXNuJNTNaH3G
	ZX0wz9CYbW5Rbv92DGoY2t8RDflDw50kuTBN6pXD6pjiwpcFFq/jSllrtwOCOAlHWuc+ls+okj+
	cXFC7kI6PstpBdt4fjHk6EpN9CWc=
X-Gm-Gg: ASbGncviFqCOMGLqNH7HRtUzotmoXn8HPlr7iG0RlhTWcwuM/subiS4zBFro7fBnqrW
	mpnWC27rkgMLCQWAwaLpFLPQbgXFPRhWhDmCjE1mbYoJuBzqZHTkJ+BW3HHI40NQDkcAPbZrS5C
	ig2nnj+1yxpclY0iIhOMXhngwTU4Rq8zB9QE53+S8cPqp4a3w=
X-Google-Smtp-Source: AGHT+IGep4cbVrjWQJvr0mN3/apVTOGtpDu9f6P3w5E+xknHRprszHROkevCtShu3x+t9pcnSMI5YywqEB76R9BU62w=
X-Received: by 2002:a05:6402:3595:b0:5d9:a54:f8b4 with SMTP id
 4fb4d7f45d1cf-5e75df5b635mr3626584a12.11.1741682967313; Tue, 11 Mar 2025
 01:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250203214911.898276-1-ankur.a.arora@oracle.com>
 <20250203214911.898276-2-ankur.a.arora@oracle.com> <Z8dRalfxYcJIcLGj@arm.com> <87pliusihc.fsf@oracle.com>
In-Reply-To: <87pliusihc.fsf@oracle.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 11 Mar 2025 09:48:51 +0100
X-Gm-Features: AQ5f1Jot1V-VvnJHopJ0Pc5_tyFD4QArR33_q-1sHlVuL6D8A0tNs3txvQgyXFI
Message-ID: <CAP01T76TWAPz4fXh6EoqHLCAxtgbzyvZib72QeFoTSx-0WKPtQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] asm-generic: barrier: Add smp_cond_load_relaxed_timewait()
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arnd@arndb.de, will@kernel.org, peterz@infradead.org, mark.rutland@arm.com, 
	harisokn@amazon.com, cl@gentwo.org, zhenglifeng1@huawei.com, 
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_014930_281891_9FFBAF6B 
X-CRM114-Status: GOOD (  14.04  )
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

On Thu, 6 Mar 2025 at 08:53, Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
>
> Catalin Marinas <catalin.marinas@arm.com> writes:
>
> > On Mon, Feb 03, 2025 at 01:49:08PM -0800, Ankur Arora wrote:
> >> Add smp_cond_load_relaxed_timewait(), a timed variant of
> >> smp_cond_load_relaxed(). This is useful for cases where we want to
> >> wait on a conditional variable but don't want to wait indefinitely.
> >
> > Bikeshedding: why not "timeout" rather than "timewait"?
>
> Well my reasons, such as they are, also involved a fair amount of bikeshedding:
>
>  - timewait and spinwait have same length names which just minimized all
>    the indentation issues.
>  - timeout seems to suggest a timing mechanism of some kind.

I would also be in favor of timewait naming, since this is not a
generic timeout primitive, the alternative naming is useful to
distinguish it.
The wait can be off by 100us or so for arm64 when we need to break out
but that's tolerable for some cases.
I've also taken a copy of the thing in [0] so it can begin using the
in-tree implementation once it's merged.

  [0]: https://lore.kernel.org/bpf/20250303152305.3195648-9-memxor@gmail.com

>
> [...]

