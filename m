Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E53CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbQvNxOOHP1bRK+Beh5JpYKJSBUIAKvfGGVsx2FOfoI=; b=K5Zds7YFArCKaMpxePjxQAtwBb
	+h8yZh5/nVw94keZrgjqJ6B2uZHTqE7NCs0782nTRC9wDuKGnKhevyHpWKJrPEWWuKH0Lt0UFVtdY
	7haW9TP93nva+wyvnkauMt+I8ijOBSx9JRo0oltzQ3IEQBgUDHIo5A0rTes9NqZ4OPQyaEHTB4VHs
	wtsrWNzKWPzhrxvMgJq7bM68OZYGeSuBtufwAOpGopY5HgiECafjOOP+whPYXFplgJ4Y/KRxGWlXX
	HrLONa6ut5q0BwTBuJ4k2k66OirsA3Kf0sAQ91o0Hfma+ilwM9wSGuwzK5IoUQLKqPrCIPDrxcLl9
	lEzSb7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3d6-0000000GaP3-0zha;
	Mon, 17 Nov 2025 18:07:08 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3d3-0000000GaOZ-3YFV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:07:07 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b73a9592fb8so165037166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763402823; x=1764007623; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kbQvNxOOHP1bRK+Beh5JpYKJSBUIAKvfGGVsx2FOfoI=;
        b=ir3HOys854uFXf3RGGqhQ9DRcv45CHyLNLieKx4SerII4oQbbdTxEBaQ1tcdkbBy5/
         J5T3oINamBwV2vCMuKj+PHI2y9O3lO/JU7RZkyHLSswPeYxSGC14o5ZkTUjEwp4/wxzD
         5SW5Jd9K3argUykUns9LBrr/gK2gmd5ZCu3/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763402823; x=1764007623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbQvNxOOHP1bRK+Beh5JpYKJSBUIAKvfGGVsx2FOfoI=;
        b=aHfE6rh6iKR3X0s2XWE4LyOAIWyBtML0Zu7khCbbayBfD4UK/Rp2NYYnkIIRNm439O
         CWyxpQ7kU+u9r4KmDTvFUPfSCPvalfEz2E5YF/i1HjNfILxghHqDLBxN3ixLqMyboiat
         M5Th6a+GSROUC3/LZTP0c6oH3PGuqAr/dbVUA4IMaZUSfgC3UfvR0rCwh+Kq60ThDCdy
         RUDCfemhywhqycZIEBD7oCa7/Ld9lQ4ko/Vg3F5CDQwUsWxNhnQYtL2Vkw3hVoi1WUM2
         wp1GJyYZaHvl2uhG8k5Y+2Bom7BLY8kPWXPqgs0EGjxZCTkBKd4duzoaD+YQ1Knj1ED4
         DW1g==
X-Gm-Message-State: AOJu0YxDXboj8kCQDE70AgpUvwM0XSEd8wcvS3/X65k586MRUoePILIF
	2kaeF3+fid2qBjhH6/s8pUbrH1Yi+G9N104vzuv6BLBGHzOrPvto9JPmHFtjq8fgpBm8vtREDNs
	loHGmJn12/VlqbVdQG6WRidNxtW+7gwdixXIfNerI
X-Gm-Gg: ASbGncvkQFI3w+d6mERD8YcwTz8dQ8SlEaHvIvJ7tsdx6/ACgJh0zp/T622fpPKi1hQ
	taahMlRy1bqoGya3ZvjRvB5rw55eb/brSpO7Q2W5ElbVtoxVHSn2lfcf7ihRf5nEPUR4fS+tsHG
	/LbYVQ4E3Q9IxPNyBT4LSTtA/mbzlZEhgHzSBjIv13WNc1Eh25gQ9D5HxNJOgfNKNuHVod8D8Ae
	8faBu9zmxu3NB8eXoY66qDqvWsQQMU8jitwfoHqtr3gFPSy6Otj2TcAaRkyMoFRKjpdMA==
X-Google-Smtp-Source: AGHT+IHxERKAenp/k82ZYfDYPQzP16PBEcdO1AFVXQY2bWnclI/6Gd2t6arEP4kn6Qv0kAwZilzVjbZBG58ijeau8VE=
X-Received: by 2002:a17:907:7208:b0:b72:6224:7e95 with SMTP id
 a640c23a62f3a-b758bb20782mr30796066b.1.1763402823616; Mon, 17 Nov 2025
 10:07:03 -0800 (PST)
MIME-Version: 1.0
References: <20251114142741.1919072-1-sjg@chromium.org> <20251114142741.1919072-5-sjg@chromium.org>
 <aafebce6-f369-40b7-81eb-2dccd650fdab@pengutronix.de>
In-Reply-To: <aafebce6-f369-40b7-81eb-2dccd650fdab@pengutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 17 Nov 2025 11:06:52 -0700
X-Gm-Features: AWmQ_bkR9nDeBL-ff1vtzhkizD0kzRR5uLcqJ7eIK01hyC1J1TbG8v5coiVUPLA
Message-ID: <CAFLszThpTg-FBoNG_tQ0xve0LkYWER85EJeHuem-_JUD8J1Ocw@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] scripts/make_fit: Provide a way to add built modules
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, Tom Rini <trini@konsulko.com>, 
	=?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_100705_947077_6DD7F1B4 
X-CRM114-Status: GOOD (  20.16  )
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

Hi Ahmad,

On Sat, 15 Nov 2025 at 07:39, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Simon,
>
> On 14.11.25 15:27, Simon Glass wrote:
> > Provide arguments to support building a ramdisk from a directory tree of
> > modules. This is a convenient way to try out a kernel with its modules.
> >
> > This makes use of the cpio tool rather than attempting to use a python
> > module or our own code. The list of modules is provided in a file.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Reviewed-by: Nicolas Schier <nsc@kernel.org>
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>
> Thanks for taking up the suggestion! I just Cc'd you on a patch that
> generates a CPIO with the modules directly as a make target.
>
> I'd prefer going down that route instead as to reuse as much existing code
> as possible.
>
> Maybe this even covers Thomas' use case from the other thread?

From my testing, FIT_MODULES=1 this seems to require that
modules_install be done first. But my existing approach builds a FIT
without needing to do the install step.

Just adding the dependency, like this:

image.fit: $(if $(FIT_MODULES),cpio-modules-pkg)

results in:

time ARCH=arm64
CROSS_COMPILE=/home/sglass/.buildman-toolchains/gcc-13.1.0-nolibc/aarch64-linux/bin/aarch64-linux-
make O=/tmp/kern -j30 image.fit FIT_MODULES=1 -s
fixdep: error opening file: init/.main.o.d: No such file or directory
make[4]: *** [/scratch/sglass/linux/scripts/Makefile.build:287:
init/main.o] Error 2
make[4]: *** Deleting file 'init/main.o'
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/scratch/sglass/linux/scripts/Makefile.build:556: init] Error 2
make[3]: *** Waiting for unfinished jobs....
/home/sglass/.buildman-toolchains/gcc-13.1.0-nolibc/aarch64-linux/bin/aarch64-linux-ar:
init/main.o: No such file or directory
make[6]: *** [/scratch/sglass/linux/scripts/Makefile.build:473:
init/built-in.a] Error 123
make[5]: *** [/scratch/sglass/linux/scripts/Makefile.build:556: init] Error 2
make[4]: *** [/scratch/sglass/linux/Makefile:2017: .] Error 2
make[3]: *** [/scratch/sglass/linux/scripts/Makefile.package:193:
modules-install] Error 2
make[2]: *** [/scratch/sglass/linux/Makefile:1647: cpio-modules-pkg] Error 2
make[2]: *** Waiting for unfinished jobs....

Makefile has the ability to sequence things, but in this case we are
effectively adding a target within the Makefile.

What do you suggest?

[..]

Regards,
Simon

