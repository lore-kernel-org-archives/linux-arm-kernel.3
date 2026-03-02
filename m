Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EBDEB3624
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKLs7LaNVRNd1atbobusqQm6rehZQXgScL2EvSc9Ljs=; b=odzMEmTfEHgh8fRXbqVf3eg9YV
	m2CSErTkW5bddTppYJZIwRWYE78R+XJcqih8g+wPBpX7Lq7aYZcREtOTFqWerDYYUU1K2mW4ZH1Ex
	+q0rQj8LhgvXjI1fbMrGMqj3P8oPQ85NNgsiJE5V6r6UUG8nD1xKQRL9ygldgyaDeWv2bjoJOthde
	sFpNPhctq1TNmtaeKowtAJ3UiK4a6qezR1mAXsA+YQNyXw+x9Fp1YcjZTZDzTFafIkaWg7YB3tjDt
	My8PNHelMMzk0Y37yQfz/UqDz4JY/DyyU5ukqWFWReSy3c2lFx2aARcD4p1BM4XRmlX555nGdjQ8s
	4weCa1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7tX-0000000Dg8X-1sb7;
	Mon, 02 Mar 2026 18:21:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7tU-0000000Dg7m-1WVs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 18:21:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439af7d77f0so1716086f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 10:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772475682; x=1773080482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKLs7LaNVRNd1atbobusqQm6rehZQXgScL2EvSc9Ljs=;
        b=fDBzkvEO2gajee9CQ594Nln2jKBnqMSA2uWVEeppytgUl7sLrS6jpt2QSYoA/NwKSN
         pt+DLfitPmh6h5ufL461aL0Oig7ZIWew4f8BimGt56zsBYiqZmJWFmF9Vmu0F3nuGZpk
         7wopiuGbKxNQfqQ51dGJEjcpjJq8mWPQNwU3DZrIffM208DXVjHhW67zWvILfTDOnl/9
         LC9zlRjXP9rnW0ZmCGNYmSYLiZc0bvvDZosQhIxldWA7jzRJiQX08cI6LT2BjHljOnKa
         z5laEGBxzguKxvLv47B8lu4VVK2QQumB+evSNnnAI36nPLD1akyYpHHMWaLiLUabtTbh
         us0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772475682; x=1773080482;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKLs7LaNVRNd1atbobusqQm6rehZQXgScL2EvSc9Ljs=;
        b=upa3AIqQPBkX/vuRO4HWps61BCs+w1AU0AFT2dFeDg02P2gKnr+ywOceY254DfiWbr
         xiyliDvF5bTnAvgA/ME2YJ4VWu+SoaOXYxhGqMnoxxJCJ4ANwC6fFWu0Ue7Pj4Rgiuvc
         ezCWkRO/3Im0yVGXI4DObioOVM+fBnQ7BQRedMhV3rNprlZ8sSDKMZS/OY+Abnxw5k8B
         aRfHe1ZF/OcLMm8mCyHRrLlYeBU/3pGd5b9E0ccKSr7KHuR1ovwF1NBDm7LXCwcDp8dg
         ghpSGHupXYmtebWKi5bhoHjEEh+KdRaT1snQODHmafadMVuD219k0YyN3Yh82tk9JKNu
         6Z7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcpAWi+19y4GW3UYTk7EM7VjrSjHI+PbsWGz892bESfHKsU0Pjsa/Sq2YGYZu5CcWTyysN9BfDNN112FftZMXx@lists.infradead.org
X-Gm-Message-State: AOJu0YxQRJtEV4JRRTo1jYtL+4F601ddgKOxZxLEpvyNIzk3gk9vj3gv
	/okcAQanK6fN1kstDhZ5ARYEjPdlQ5L+y1gQbt4DOFt0X8spffoWImgT9hrZxM4p5iM=
X-Gm-Gg: ATEYQzxPyFwbtmPnqktJzWUFUA4UGuDLReiJ7XxggplrmjXjClPqFb1m1MmtRwifO0N
	wH5d3R9VJhTigRIvDFGbGLy0y6dgzxsRFjRbWFQjt7zniz3suOxx+GsLv3HSwEr67I9q+3r3UqX
	EOP75PUQq/ray5NlPOhdyQ+4vCUFVV/3LXaQcIgKrXcdUw+zIOdGUQBtRpTrKW1BnsTYV1BIzKL
	hrR0yddvuiqjLMEFsGnXPJi2yYIj+JgIFZZLCuC+/JmHAbvBGzce2yUu/5SMmQVY/iC1d4meYFw
	hDzZHEwAtHN0mtAsRzK9VhnSDCSPaVc2D94g7ooPad9o1fC4Y1/ltlkzA1S9tPXfcedZbZlXgSY
	PG+IDe+PEIYGf7DLXfpq7cFDC6F6HfdDn4g2APL7EG0FgV7YEwesDAW18PVdYn/fDgfkWv0AIG4
	kUPjyqlwstLhuA9pXP
X-Received: by 2002:a5d:5c89:0:b0:439:b81f:ad98 with SMTP id ffacd0b85a97d-439b81faf6cmr6223979f8f.47.1772475682014;
        Mon, 02 Mar 2026 10:21:22 -0800 (PST)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b272sm28389886f8f.24.2026.03.02.10.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 10:21:21 -0800 (PST)
Date: Mon, 2 Mar 2026 18:21:20 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <1a19899b-862b-477f-8314-4821ac6b8716@gmail.com>
In-Reply-To: <aaXSGSEY_3WQvjYS@J2N7QTR9R3>
References: <20260301003407.2493781-1-objecting@objecting.org> <20260301003407.2493781-4-objecting@objecting.org> <aaWj4uIIiv_kwsFo@J2N7QTR9R3> <3fe578cc-07b3-442b-8eca-1f94c1975e85@gmail.com> <aaXSGSEY_3WQvjYS@J2N7QTR9R3>
Subject: Re: [PATCH 4/4] arm64: kernel: Fix style in io.c macro
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <1a19899b-862b-477f-8314-4821ac6b8716@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_102124_429011_A4DBDCD2 
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

2 Mar 2026 18:08:29 Mark Rutland <mark.rutland@arm.com>:

> On Mon, Mar 02, 2026 at 03:45:16PM +0000, Josh Law wrote:
>> 2 Mar 2026 14:51:19 Mark Rutland <mark.rutland@arm.com>:
>>
>>> On Sun, Mar 01, 2026 at 12:34:07AM +0000, Josh Law wrote:
>>>> Signed-off-by: Josh Law <objecting@objecting.org>
>>>> ---
>>>> arch/arm64/kernel/io.c | 6 +++---
>>>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/kernel/io.c b/arch/arm64/kernel/io.c
>>>> index fe86ada23c7d..ce27fa5d2e37 100644
>>>> --- a/arch/arm64/kernel/io.c
>>>> +++ b/arch/arm64/kernel/io.c
>>>> @@ -17,10 +17,10 @@
>>>> #define memcpy_toio_aligned(to, from, count, bits)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> =C2=A0=C2=A0=C2=A0 ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 volatile u##bits __iomem *_=
to =3D to;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u##bits *_from =3D from;=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u##bits * _from =3D from;=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t _count =3D count;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u##bits *_end_from =3D _fr=
om + ALIGN_DOWN(_count, 8); \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u##bits * _end_from =3D _f=
rom + ALIGN_DOWN(_count, 8);\
>>>> +\
>>>
>>> There is no style violation here. There's no need to add a space betwee=
n
>>> '*' and the variable name.
>>>
>>> Mark.
>>
>> I used checkpatch.pl... it detected that
>
> So? Tools can be wrong.
>
> In general, checkpatch.pl shouldn't be applied to existing files to find
> issues, since there are many deliberate violations, and cases it cannot
> parse correctly.
>
> I checked out v7.0-rc2, and ran:
>
> =C2=A0 ./scripts/checkpatch.pl -f arch/arm64/kernel/io.c
>
> ... and the warning you see seems to be:
>
> | ERROR: need consistent spacing around '*' (ctx:WxV)
> | #20: FILE: arch/arm64/kernel/io.c:20:
> | +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 const u##bits *_from =3D from;=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>
> From a quick scan of checkpatch.pl, that's because it has mis-parsed
> this as a binary operator, where we *do* want consistent space around
> the '*'.
>
> For types that's not the case, e.g.
>
> | [mark@lakrids:~/src/linux]% cat test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> | int *foo =3D 1;
> |
> | int * bar =3D 1;
> | [mark@lakrids:~/src/linux]% ./scripts/checkpatch.pl -f test.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> | WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> | #1: FILE: test.c:1:
> | +int *foo =3D 1;
> |
> | ERROR: "foo * bar" should be "foo *bar"
> | #3: FILE: test.c:3:
> | +int * bar =3D 1;
>
> Mark.


Sorry Mark, I'm sure I'll do a real useful patch to you very soon

V/R

