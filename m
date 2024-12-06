Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181DFE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 00:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78rE7sFM5hMSVUktXfM1DYZzRFvqYEeXK7x5OI2RSGM=; b=WltG6rFi8x0npU0xpyqRh3b4Ci
	A1ZPMmEdLnPcuJZYLRX5U6TRuhPyTkFGYXx53V4dD2bhRrhqIkIAm7JUqk37MDjNOpuERUbQ9fJKj
	JTgeJ5jJo0f4wXauvtWYkY0ol4pyH3drVv+3PE5u5OT+YQCubO4B33GG3DJOockTYo/dT0blVV3bA
	Gl5v2y9agKEXeMlgXHH4k94wS2RA1jRShMWhh7OKkYGTcK2sWcoLhcGvmy2oY2YeMluLBnxMK4W3Z
	CRxhKoPd0RWuSpOiwRUqA5UD1G0i3rDdP/K3sLBf+ytE1XQuIePt4deW30A+lN511BYA9JaT1qJ+n
	YuVBYw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMZv-000000007mC-0j6G;
	Fri, 06 Dec 2024 00:52:19 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMYt-000000007bN-2Qbf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 00:51:16 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6d8cb085d1bso12587716d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 16:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733446274; x=1734051074; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78rE7sFM5hMSVUktXfM1DYZzRFvqYEeXK7x5OI2RSGM=;
        b=LKINhVlw+vpq2avgq5a7ASMxQogXS1FijEwbySY4Bz8kv8MYwxRMqoyj4hswpXf7hq
         ihpFIJ95kWQ7f07CVXG8Y1BchiHq+ICPUG5Ef2VoTEJHV8/1t0BTum9KgC3vf0OraVzG
         pWOjQVDO5A+4RgYzyifQHu5D5/1IKE2gp12wabVDe4RR2UfzFP/h6m6m7p+E7bGUESRW
         j2CYJLgh4snqBLQ7e774Osz1i0oYOMVlElJMMpL7wlXEwvtdCTLgYpz5+a4/mSW1mVyj
         SAc74QngMGoMrH7Sq+4bas4FVpqNlbNFoVrfSRS3HwGqPuqjpRmKR/mdAuXq/ztAxTko
         YJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733446274; x=1734051074;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78rE7sFM5hMSVUktXfM1DYZzRFvqYEeXK7x5OI2RSGM=;
        b=J9KZBnT4TvWpuTDuvtIkw/hwQn1AV76rJCoqUBAxJgWdLlVVJCeFoirVKWvAKLGvj8
         pDGxMHEmDclIAqBAka254pdFFuMpX/QOGDJMM4Ok7spsxqb+NlZTEMz3zVNXbpjGAZ/C
         v0oJOFD0Te5A7YfsmLDTddcdnPi7TWnpuBMk8S5p/RmMXVX0SAyPbAhTSDClIGCb8lEY
         BTIPEIi4VkbumfUN7FPOi4MMbhbkTGLfRom8FPfyQWUCOaCE46lW/jenAlKs7UITqX8X
         yX5mUsVgUfSMY9GdyCUjbjF1a3n90CB0S7HYxpYLASeMCqzFV9Cp15G5jTsQTwKRIjgF
         WT2g==
X-Forwarded-Encrypted: i=1; AJvYcCWCqnmsrL4b2UyWjeKUQEFiJrCxfCsS6+YPQwrI4arndkS06MoU+P8u//BwFgQkYSiIs2htWrqOokbUtwd4z8ql@lists.infradead.org
X-Gm-Message-State: AOJu0YyWlJ+Kherlgz+spv6vxE+NlVeHjpYHqAYqdrQzh77nogWQvgUZ
	l2WiA0iYJrerpA8au6We52LXFHsYgk1wcj6UhzPcp/TCm1B0FCVq
X-Gm-Gg: ASbGncsk0p8q8ikq+/p8YasPaE9m9Aawce1hYZBBVC/g3xWamg+N+Ob6dg8KKHtZ3zh
	AHc2iQzXKItBVsXGOmOesJlJ92oGr4m/xh+/S2KVqo1rMQARMmVkTLhFARG0hDuORtXPEwWOcv4
	A0xIA8hMPdDhPvr3ZTyfUctiqtkFHGzu/wLhgLUXyAQqFQ+hkhi+8+rgNCasosNM+cLTeyxQQ+w
	jyYFC8PY+3m/D+gFyIp89OcC6THcJsROMdcmDdpeKdbHqLISgWg6zphbw9Uxkg3yemPR/UgSL4=
X-Google-Smtp-Source: AGHT+IF/sk9ZB235pUfB0O6hz42Upg4C3T7QSAhoiMqwmiLWKznlOnX/VWzkLXPVN06gb5l37ZaJIQ==
X-Received: by 2002:a05:6214:ac2:b0:6d8:d240:9f26 with SMTP id 6a1803df08f44-6d8e713feb7mr22257846d6.16.1733446274340;
        Thu, 05 Dec 2024 16:51:14 -0800 (PST)
Received: from smtpclient.apple ([2601:803:8180:ace0:901f:f4c2:743b:7118])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8dabfb438sm12583646d6.106.2024.12.05.16.51.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2024 16:51:13 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH] pwm: stm32-lp: Add check for clk_enable()
From: Mingwei Zheng <zmw12306@gmail.com>
In-Reply-To: <geyicxufezkbu7cdvnbgnr2qeuwrn5ubz5ent3spk5biuozxrs@gsqx2chgiiot>
Date: Thu, 5 Dec 2024 19:51:00 -0500
Cc: fabrice.gasnier@foss.st.com,
 coquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com,
 thierry.reding@gmail.com,
 lee@kernel.org,
 linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5778D1D6-9C2B-4456-9765-213120076C62@gmail.com>
References: <20241205051746.2465490-1-zmw12306@gmail.com>
 <geyicxufezkbu7cdvnbgnr2qeuwrn5ubz5ent3spk5biuozxrs@gsqx2chgiiot>
To: =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_165115_615137_5DD0ACE1 
X-CRM114-Status: GOOD (  17.28  )
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



> On Dec 5, 2024, at 3:34 AM, Uwe Kleine-K=C3=B6nig =
<ukleinek@kernel.org> wrote:
>=20
> On Thu, Dec 05, 2024 at 12:17:46AM -0500, Mingwei Zheng wrote:
>> Add check for the return value of clk_enable() to catch the potential
>> error.
>=20
> Is this something that you actually hit, or just a janitoral fix you
> noticed while browsing the code (or reading some checker output)?

We detected this through static analysis, instead of actually hit.

>=20
>> Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
>> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
>> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
>> ---
>> drivers/pwm/pwm-stm32-lp.c | 8 ++++++--
>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
>> index 989731256f50..4abef304417d 100644
>> --- a/drivers/pwm/pwm-stm32-lp.c
>> +++ b/drivers/pwm/pwm-stm32-lp.c
>> @@ -163,12 +163,16 @@ static int stm32_pwm_lp_get_state(struct =
pwm_chip *chip,
>> unsigned long rate =3D clk_get_rate(priv->clk);
>> u32 val, presc, prd;
>> u64 tmp;
>> + int ret;
>=20
> Please move this variable to the block where it's used. No need for =
such
> a big scope.
>=20
> Otherwise looks fine.
>=20
> Best regards
> Uwe

Thank you! We will submit a v2 patch for you to review!

Best,
Mingwei


