Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AFCD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 01:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/WIom7gz7NUO3fE19+reH06dlDelQ6m/UOlLG0sWa0=; b=3+8btI873wwJNN9TyVzZqmadwF
	x0RFg3zQZz/sQekTuTPpAe1XUsal6EGdMgAkhs3AH/m1J4GyC86pxQRRwjUKGvXpAmDxHX/iailRZ
	pIQhNPptesnam3XyzX1G92KOuBJtWHOe3KPkQ96zfAQwTTxKCvl5A3zyBdo94eXFzdqRGdLFv2UJR
	4qXgtbeYsRtG7cW0actXgImHrRQ6oFJ4wwrv7rAmpHDe30y+7MS7JefQhHheEf9IHaBoHWfWvrlkY
	soSbmvuuTxsxg+Ryk460jMovRW0+5pCc5ghUZDSxYLYvRcYAdFb0itWUjW9WVxRg0FKuZmpJeDVsQ
	HElngLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP9sZ-000000018eC-3JnD;
	Sat, 29 Nov 2025 01:36:03 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP9sX-000000018dd-0BPu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 01:36:02 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b76b5afdf04so434424666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 17:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764380159; x=1764984959; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q/WIom7gz7NUO3fE19+reH06dlDelQ6m/UOlLG0sWa0=;
        b=Fkp0x88U7ADvktV7YjGL62wyg6i0csj/4/2PQ8o5lGh39wmXyesTCdQgodM7ToUMxv
         D/QUbOvI7tpqflPOE//T6HR5gmHSSdkkEDyxKMMjyy+mYi1mYunEGojvivughKqMYkOw
         69wc0JI/FgoFy3slNQo6AAgnLN2qoxLn/l4bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764380159; x=1764984959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/WIom7gz7NUO3fE19+reH06dlDelQ6m/UOlLG0sWa0=;
        b=p6sQ5HQC8rkAcMhH6trMmCCJaxKfYB0pH8jwj9TZP7ovoc5arEn4b6aQb0onJY4iG9
         +uilElEpmAoC3+CSuJ8fKXC5e/QiHb1WIUl6/mzC6CuZ80rhr/1WC3Yv0r3eyEkNMfGN
         vL2c9SN2xaLfQI5l+5l4QEnxoiPzKRi4HGZ/ym8Y6ufS/7iXYhTITKwhWBkV6cfw99zr
         Iws+l7NtSiRJneUKTYFaTm+BbPd1mMWFuSQhCX2Hd2oOyn27PRi9mKM+xqf/3xTdFoeB
         j4yL57U2Cv+g8fXWaEdEjtdLYW6C3b6/YjZ9DIeZryEhaa9zBNm7W1dtqMSKip6L+QMs
         rx/w==
X-Forwarded-Encrypted: i=1; AJvYcCUSNugQ9/xsASPH9e9vMQPZfFrtDZ6bkacaWucIJ8iPB1/C5w2TwyH3VRuI/kz/42ev0loQbKT6tgrJ9DCtZpWt@lists.infradead.org
X-Gm-Message-State: AOJu0YxKyhzun72gEZWIK+3sPCQVKAtuS2dxWz48DdJ6hbnk1iUoxd9S
	fdX7peLMGRqKPat0vcgaTLULhzxfgZqgygdGvUv+4GHqiMXvYIkd2eVtNNve10tFPG4PFJRis/c
	hk8QVQxh2fw==
X-Gm-Gg: ASbGncvcBhZz53GllFPYw8S/re+RDpOu+uZOBoh8VLhXBUe1xNVJ0esn7j/HLUNZ1of
	HzKfedjJAgQk+Ilsyu1ulKN39nKi0YTQAjMqFqdlZpI05EWDldBKYLtWEmQO4LSJlRc+7OfyY2Q
	lPkYACCkOC0BPP9ELOn/hrWIvfHxEQASsgDx+if2p9fxVqCV4yiMpxKx0cgAkfTjywGLz/i38hB
	J7xNeutTu7N6Xo+EuBmmTMqj/4JOknUNP4lr5WDX4OxM8NhASjPWtaNs7WWQoIxCDPn8Y7jR8vW
	umt4TmgVexB748n30tgOy0utKnh59fs6ZfGJx1Q/Bo6LkV27MbzFsW/saK9BoKabti/9HK9z6/u
	E0zkPZH0Xn/HSUME1vTNS8B630/EHm65V7hItLTS24e7dC6bFYKS2NzFCjeAD3WRu1CZumKYW2C
	5Rsy0cEap66fb98hjX/2UVCF7p8S8Tovttih+opePI/wTnBJNlD37J+cS69e0F
X-Google-Smtp-Source: AGHT+IFO8GywrhXg/CRCO0l15BN0HVqHBoQ03rkZW7eUxrdrDubqqkdxaHbd/wNnPvDiu7F15wW5SQ==
X-Received: by 2002:a17:906:b52:b0:b76:b76e:112a with SMTP id a640c23a62f3a-b76b76e11d8mr1601680666b.11.1764380158696;
        Fri, 28 Nov 2025 17:35:58 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aecc9sm579246466b.43.2025.11.28.17.35.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 17:35:55 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso3657092a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 17:35:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5q6jrDHclLRAtQnMU8O1ALuuewGJVQ0nDpwpNIFImjKf6FlIrH0q3HMlLirZZShinls9pmGwdSizqQ6sB3sL/@lists.infradead.org
X-Received: by 2002:a05:6402:3494:b0:647:5c27:5440 with SMTP id
 4fb4d7f45d1cf-6475c2754b6mr4287616a12.24.1764380154354; Fri, 28 Nov 2025
 17:35:54 -0800 (PST)
MIME-Version: 1.0
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <33ab4aef-020e-49e7-8539-31bf78dac61a@huaweicloud.com> <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
 <aSgut4QcBsbXDEo9@shell.armlinux.org.uk> <CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com>
 <3d590a6d-07d1-433c-add1-8b7d53018854@huaweicloud.com>
In-Reply-To: <3d590a6d-07d1-433c-add1-8b7d53018854@huaweicloud.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Nov 2025 17:35:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjA20ear0hDOvUS7g5-A=YAUifphcf-iFJ1pach0=3ubw@mail.gmail.com>
X-Gm-Features: AWmQ_bn2YLtZkenhhdk984gAsTyb0rIufR4Br-TkPYHMl26wv1MEf1_t31IUh7g
Message-ID: <CAHk-=wjA20ear0hDOvUS7g5-A=YAUifphcf-iFJ1pach0=3ubw@mail.gmail.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
To: Zizhi Wo <wozizhi@huaweicloud.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, jack@suse.com, brauner@kernel.org, hch@lst.de, 
	akpm@linux-foundation.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, yangerkun@huawei.com, 
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com, xieyuanbin1@huawei.com, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_173601_116671_E3AA5B86 
X-CRM114-Status: GOOD (  21.16  )
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

On Fri, 28 Nov 2025 at 17:01, Zizhi Wo <wozizhi@huaweicloud.com> wrote:
>
> Thank you for your answer. In fact, this solution is similar to the one
> provided by Al.

Hmm. I'm not seeing the replies from Al for some reason. Maybe he didn't cc me.

> It has an additional check to determine reg:
>
> if (unlikely(addr > TASK_SIZE) && !user_mode(regs))
>         goto no_context;
>
> I'd like to ask if this "regs" examination also needs to be brought
> along?

That seems unnecessary.

Yes, in this case the original problem you reported with sleeping in
an RCU region was triggered by a kernel access, and a user-space
access would never have caused any such issues.

So checking for !user_mode(regs) isn't exactly *wrong*.

But while it isn't wrong, I think it's also kind of pointless.

Because regardless of whether it's a kernel or user space access, an
access outside TASK_SIZE shouldn't be associated with a valid user
space context, so the code might as well just go to the "no_context"
label directly.

That said, somebody should  definitely double-check me - because I
think arm also did the vdso trick at high addresses that i386 used to
do, so there is the fake VDSO thing up there.

But if you get a page fault on that, it's not going to be fixed up, so
even if user space can access it, there's no point in looking that
fake vm area up for page faults.

I think.

> I'm even thinking if we directly have the corresponding processing
> replaced by do_translation_fault(), is that also correct?
>
> ```
> -       { do_page_fault,        SIGSEGV, SEGV_MAPERR,   "page
> translation fault"           },
> +       { do_translation_fault, SIGSEGV, SEGV_MAPERR,   "page
> translation fault"           },

I think that might break kprobes.

Looking around, I think my patch might also be a bit broken: I think
it might be better to move it further down to below the check for
FSR_LNX_PF.

But somebody who knows the exact arm page fault handling better than
me should verify both that and my VDSO gate page thinking.

           Linus

