Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC23D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/bwn9D84GWlDbOilb4ydUF+TXLSh+hSxOJ023fSrD0=; b=qF/+J7LeTT2iOxpA3CPOLF0zfe
	R1adKxPQEfkGEYpOJ9l4AcxqV0Fx4r0t0gQTQon/otHTMVdSoGIf//b8V/K7pRZBuRGAEspbD8VfP
	frl30xoBlCTJMClNzNg0m73mlp7B5qSS8Wadi9+9pO5a72rPCB6xSHH1z4jYC207+gNdJQZ7mcTZ6
	xS1Xt15zL994ENpdZ/8UkvUUU1g+Nh0OH5uxtuJhz9V+4toPH9NI5//3nT8iKdfp3+SGVhMNQ1jUb
	y1qsvGuEnlAmVjBKqK33nEQ6soB6HRzLqWkcHrVfVaXLMYrAL1BC8Pf+w2rePJCsY4o11Lwc+XNLA
	56wGJZ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaU7-000000016tq-1t5G;
	Mon, 11 Nov 2024 19:54:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaRq-000000016g9-3py7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:51:44 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20ca4877690so25525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 11:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731354702; x=1731959502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/bwn9D84GWlDbOilb4ydUF+TXLSh+hSxOJ023fSrD0=;
        b=JFz0zKxBB4lMvbd8LHFVxc34LrtV6rT4w6mPBsbfapL2vH8bkOm2xrBRGju40LuD4y
         noJ/VQIlaX68+rLTTn+YXwCei+XSTUm7xNNEMlAUlwxj6YOmAJ5kfDict+BBeJ0DN+cg
         uKTZoJJ99tiM8Lgl8hvfMBHHtEP9obH7CwMsDNdqHSvsZ4fWk1Aw8jG6dT9bFo1pXY4l
         BNcsdessrQTWyKRtyl7u5Rs9BB4IDpQI9JCisJBjpeYGLNdYnSvw9vvzogNwfZs3WLuV
         ZZTcxUohYSqfTfMG9sKx36AnTlJfLneN8Ep2ngoOHplyBzHVJowthUvbu1tpT/CyVRBv
         ziGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731354702; x=1731959502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/bwn9D84GWlDbOilb4ydUF+TXLSh+hSxOJ023fSrD0=;
        b=kq4Bpfude/R5M0xSqEQYyyaW0r2E6bcWtKTLD7swkp+bRzqvDZFLNlaT2ANc0pm8Fn
         8cDGsamfleRGoE+3OrUtZKD5GoqhlDZr1K43gstwFR7goQa6HfDJ4ho6QeT3ym3CRdFU
         TFuPBwYSCRoKcKXvEPhirSAZWCQovckebAg2pIE50NsaetgQn4itWMpUGRYsbxsZSI4K
         o9a1qLXHJmhlA3Dhy4/tT7rL0x192WCkgCBcrDVzdn8OuDzm++jog/F0eUfbBSpZPFba
         pXrJvMklu31Tg/fO9bprJ1T6Dgr+SZ2orYlTDxCebksrUXhgQeAI1Hzd0eesv4hABixk
         1yow==
X-Forwarded-Encrypted: i=1; AJvYcCXWFxZWeWitOzSvSJc3IyLeSRtu7OhVgzzhwctqEcbDP6T3AKMXc3ri9jeC7Iiqm1afdntNTXP2DjRVf0hv0F9E@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuj5PdeviFFBykB3CrFRBUgLtHdX2mB7W/fE9dyuuO2S5oNxj2
	iIf9xexlv0Bh7cQWSszZnETYEjBgseNnwFJ5M89lo7V8qM9rwGyTWCss362LCa94EJeO7Orgpu1
	0yeLNKSL78eRmco4jejRmXrZS6s4x4JoNMMC6
X-Gm-Gg: ASbGncsCZguXC16zVuAfu9kIDWSp9XryUFX0xpwN4rjF60t2MzjCI83LXDHwizTARNO
	zyLwndqrnMrJNVVVx/gQ3CfQ+7hmGy2C0LDdcM6Y07xy9RXK1zV5BnCkKLS3jNTU=
X-Google-Smtp-Source: AGHT+IEyEcKoDFotDlCx11HNGo0yvP2mygnysMtivuiJPEeFIz3afC0FbuSNQvodM6soNzZ2AhNjz5GUVsalr96G/Pw=
X-Received: by 2002:a17:902:ec88:b0:20c:bb35:dafe with SMTP id
 d9443c01a7336-211ab001120mr440715ad.0.1731354701726; Mon, 11 Nov 2024
 11:51:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1728599785.git.scclevenger@os.amperecomputing.com>
 <20241106235110.5NbhrBJjBk6qY_Sg0BJUbMXfpfpi8KZK5R-y4rZfKXI@z>
 <Zy0MPdvV5ofHtyE3@google.com> <b28d4e57-a152-4aa8-8c91-69ce0198dfa2@os.amperecomputing.com>
In-Reply-To: <b28d4e57-a152-4aa8-8c91-69ce0198dfa2@os.amperecomputing.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 11 Nov 2024 11:51:30 -0800
Message-ID: <CAP-5=fVKZt0o41J3C7BHW4gNTiuet3pJEndzEZ6MxdQxorXXqA@mail.gmail.com>
Subject: Re: [PATCH V10 RESEND 1/2] perf util scripting-engines cs-etm: Add
 map_pgoff to python dictionary
To: scclevenger@os.amperecomputing.com
Cc: Namhyung Kim <namhyung@kernel.org>, leo.yan@arm.com, james.clark@linaro.org, 
	mike.leach@linaro.org, suzuki.poulose@arm.com, ilkka@os.amperecomputing.com, 
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_115142_975452_E4EFB863 
X-CRM114-Status: GOOD (  12.47  )
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

On Fri, Nov 8, 2024 at 9:58=E2=80=AFAM Steve Clevenger
<scclevenger@os.amperecomputing.com> wrote:
> On 11/7/2024 10:51 AM, Namhyung Kim wrote:
> > Please use map__pgoff(al->map) instead.  Otherwise you'll get this in
> > the debug build:
> >
> >   util/scripting-engines/trace-event-python.c: In function 'set_sym_in_=
dict':
> >   util/scripting-engines/trace-event-python.c:814:60: error: 'struct ma=
p' has no member named 'pgoff'
> >     814 |                         PyLong_FromUnsignedLongLong(al->map->=
pgoff));
> >         |                                                            ^~
> >
> > Thanks,
> > Namhyung
> >
>
> Hi Namhyung,
>
> I do not see this compile error, and I typically build perf with debug.
> This make command works through 6.11.0-rc6:
>
> $ make -C tools/perf DEBUG=3D1 VF=3D1 CORESIGHT=3D1 PYTHON=3Dpython3
> CONFIG_LIBPYTHON=3Dy CSLIBS=3D/usr/lib CSINCLUDES=3D/usr/include install
>
> I can substitute in the map__pgoff() macro in any case.

The map_pgoff was added for reference count checking which changes
struct layout when enabled. More context here:
https://perfwiki.github.io/main/reference-count-checking/

Thanks,
Ian

