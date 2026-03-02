Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AD3EA4E22
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QhNWK08EnIEokCkgCGA5mBi02+mJGugJBhnyHtXRJg=; b=2ITolwaAhxw10UFeTP+OwaKJ7R
	MpTZqFKp5pWsSLuTVW6GFw7f7L2jxf3PV7UggXj3i3n0vk8uCZBQwGb1tcSqPHFCMzEKDnu03SiZQ
	D9nUMaOWW00p0hd/zLOQ9CHEGSbIM41nY0PAS+uF0N39pjs3xwyATewfsj+UNT2ovXtbyZOByyR4i
	xqFxLtFwg810PRuRBTD3fFt9QshG1bD5ea/8Yh8aWTR21cR2WcpZD/61EuMW4QsqB0SHlkRLGWkw/
	+ebWXHzKOgb89u6m5ngYMuXWzEnYXy9oEswEXS7tDdjYI9cE4Bla+1pUFGyHVczZMQCdvC3i4kQIz
	RsRjBJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5SV-0000000DOR2-3oa7;
	Mon, 02 Mar 2026 15:45:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ST-0000000DOQF-0v8Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:45:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48374014a77so55515935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772466319; x=1773071119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QhNWK08EnIEokCkgCGA5mBi02+mJGugJBhnyHtXRJg=;
        b=L3PwBW/tOhC1JcHtC8FHl3HFW352sOrm1g5ZwBnSb6NDajqa+NoBPhlx7tUN//Rq6/
         a6aQUwEBBhDvzm1t1OAWv+y8yd0C3ONrBKAx8FNk6LlfgFZS6QLBtLDqF2tq/+DMVH2d
         wKjU56/5QCeE+XzX1xQQMCtba1UwHQGXoWUU920jLmAih38N97StA1MSuhiFrtwMOkyd
         Q0nvOsbxM9EB7NpIsTGQFvM0hECPKM0QEvMMg2Us0c71HyZP+5an5fWWrDYITF9IV+f8
         S3cO4TDmjjzU62/9haCyOHks460KLE5n66hH83e3/yEGJOEeyZQ1oBgQXMa8VPxl9sZt
         zhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772466319; x=1773071119;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5QhNWK08EnIEokCkgCGA5mBi02+mJGugJBhnyHtXRJg=;
        b=gaOCTDoYOIhiwzXdotcr2pLLyeBSpCPx6UscDtfQMfWDfZtjGN1l7ZHKq5/XmNocoG
         4YQzrtmTjna/Z7v76oU2ogO2ZBdiRk3vYesXBBUjuT58HzDLAgbhfy9TG8R7t3xRNFLf
         8vbrqzaiYHmr9AVH4cvZnL5l7OuVagmq4kteuzrWZPbU9j1IyZZ3ygnjr+twvjLAfv+r
         c8l4OsxHWNJjVqu/9GcN84Umng5yb83wQ4chrvFX5hiUQLlaZgdo3vwvUN+1dvb3RdH8
         RdJRTnxkezkzcv87fYDkw7Ahlk3Uekd/hNbHlKrpWjfxx/co4jesVFGQF3mbsx8GV3Gm
         Ie/A==
X-Forwarded-Encrypted: i=1; AJvYcCVo/g2sJkRUN8F3LAlPTpCFL2qtoTp4iFoLJROlPoiir7fr4Fs50vm+pWRD7MVieW4SPHi9Bun/nK6/GoaeOUkN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5ANjIcVMCGo4U5KVG1V5cCdf/6QW1YpTjb7sdQkb2tMHTXf7U
	L06LF6cABrRLVDlSHGUjqTZt0YC5FhiRavtbyP9gXWEf+LCePV8JumAw61l0/WH8iog=
X-Gm-Gg: ATEYQzy7ZMqbaDFC1qw+2TQAAIP9Hq7cMAHhnda9/THN0dt/yvn1mg1xUk4hUZxeeMw
	ouLeCgRth2r24/AbFtYzI/RBtl8aTIceQ3kc1pBE/8ecVr4pT/sMB30JNYjR3zPBx4a2NeqAOZf
	qtsj1GYqQygimXix/ixVxJq0oPff4vka3mkpm/RBJTNmH3xeFYnbimLEJxFpVYdgJU1iEjxY2rr
	1qqeMcPqrXngevKohD0BZdsObd5AEY1SMtMjOkLDQCrWCfkobBrhtNRAveUGM8D1wGnUHwFfVqp
	7uVGYPr6SIqlmS7y8OVpX/CAsDfJXpw8g2eGGiv7+K/wFiFsr++Hz5IMC0cO+i+KOjU9S2KjreB
	9Dm2jdXmSsW8EqwHWKFwqVxitpC0nBponn0n3On/yOFLNM0k2Cjn9SnrpjIy4OEtrXC9MW0BnTD
	dZwR7YPjE3f8DIsEjB
X-Received: by 2002:a05:600c:c490:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-483c9bb65ffmr188273145e9.6.1772466318382;
        Mon, 02 Mar 2026 07:45:18 -0800 (PST)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f2f88sm399613205e9.2.2026.03.02.07.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 07:45:18 -0800 (PST)
Date: Mon, 2 Mar 2026 15:45:16 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <3fe578cc-07b3-442b-8eca-1f94c1975e85@gmail.com>
In-Reply-To: <aaWj4uIIiv_kwsFo@J2N7QTR9R3>
References: <20260301003407.2493781-1-objecting@objecting.org> <20260301003407.2493781-4-objecting@objecting.org> <aaWj4uIIiv_kwsFo@J2N7QTR9R3>
Subject: Re: [PATCH 4/4] arm64: kernel: Fix style in io.c macro
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <3fe578cc-07b3-442b-8eca-1f94c1975e85@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_074521_269821_B3F3EBDF 
X-CRM114-Status: GOOD (  14.01  )
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

2 Mar 2026 14:51:19 Mark Rutland <mark.rutland@arm.com>:

> On Sun, Mar 01, 2026 at 12:34:07AM +0000, Josh Law wrote:
>> Signed-off-by: Josh Law <objecting@objecting.org>
>> ---
>> arch/arm64/kernel/io.c | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/io.c b/arch/arm64/kernel/io.c
>> index fe86ada23c7d..ce27fa5d2e37 100644
>> --- a/arch/arm64/kernel/io.c
>> +++ b/arch/arm64/kernel/io.c
>> @@ -17,10 +17,10 @@
>> #define memcpy_toio_aligned(to, from, count, bits)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0 ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 volatile u##bits __iomem *_to=
 =3D to;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u##bits *_from =3D from;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u##bits * _from =3D from;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t _count =3D count;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u##bits *_end_from =3D _from=
 + ALIGN_DOWN(_count, 8); \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u##bits * _end_from =3D _fro=
m + ALIGN_DOWN(_count, 8);\
>> +\
>
> There is no style violation here. There's no need to add a space between
> '*' and the variable name.
>
> Mark.

I used checkpatch.pl... it detected that

