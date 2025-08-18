Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB27CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMw3gg8cXK66LujaDUzkJciYqkDPA+K8FcbK/5upvAI=; b=SgFLA0JRNmtbo9AYB2OQ6OW9ZO
	Tk+80c9W2QIt6qkWzYBkWzFD4C/L1OXATCPg1QtNm9zNdrtqfnGWobtNBxdGfs/mkfLiM7uLQ6ia3
	PFgvR1+R/SelFlPBgbnYXzvGGYLaGd7+nLG3R+ymaay2CpHGZIEw/ZUP+wAPFgUjmKut6iPvIskyQ
	/dHp1Y1AkGBjAO5wCWkCIxhIfSLxCgIUJyAcGweULV/RNZtgsx7X3EtAYQJHZpiDfKuRKLuIERcU6
	AU0/6txHpgVrXq49BCxR1G8jjKVYO7/JNM4D+SKfw73/8uugDXkulojKAktbbxcXTWOZg7l7ZdzhX
	KLBjS3HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3iO-00000008AMD-2XLD;
	Mon, 18 Aug 2025 17:32:12 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1ld-00000007v4T-1Ixs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:27:26 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-333f8f0dd71so33488751fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 08:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755530843; x=1756135643; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMw3gg8cXK66LujaDUzkJciYqkDPA+K8FcbK/5upvAI=;
        b=eqHkJ7qIIxBbIrJeP+59ZTk8TGPejH9Sewk33pcMyYbLyCpDY6nVihdGTG3KandyVl
         /AnRuzDVP6yY3+k6Mp2Fr5oJi3mXvSPYSpABI7Pn+TTetBguNX6GExIrgA2OMPsXTFQH
         0nKGpcbw+O3xPE/v4pcby0G4IRzrLdlV6rgKxX3aI9H2xRA32aF+X9HpM+wJX0KDyT5U
         pzdRiAFUDoozxzqcvYY+FXUipndnRiYrOP4TwpzgN2w0ZmmcXctRYZjvfwaJBIQaiLjl
         V8KvEIn0/9SvgNgyclpsGiQzzt/kwrcP6aKnP3E+rnTCkKV8i4swLf8U4gxRCTIjlHVP
         Sgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530843; x=1756135643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMw3gg8cXK66LujaDUzkJciYqkDPA+K8FcbK/5upvAI=;
        b=vM26o7u0uoulnZ5tlDYX+LOjc5rsXgVsq6SZpQvbwfxRNtEFs7/6Ph6xaCPw/+gekC
         wNDcvtjrLTIp977/xhfw0IEXlkvuEhLfMsRp0UIvI4g+sBl8mmVulEwdy0Oe68prO6p4
         yQgDO26ZLsuLG0tvTPlVv1gHQW8Z788qDeQLqS9PFH9mzUKSVCb9+pHBnt5WTiP4mZVu
         3DJcctUaj+RQqN4yTWo6ybAOkPNrm9fv51PWwEddbMYS9LAyREhAiL7f9ClL45zUR2C8
         umNO/MZzmky/3EfW9ooz1q6gIcFJ/NdGJ7ORowRTqZ4agWlHSrxRmO84ZZjpVXEsAR4j
         s1bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI8FBtIhOAl4QQyIaPqtr871gZoNkcPpvQePwgPVnz9Liy0IVaLswZn8pbCu6WZfuDKJfy4zrGIzBp/D3h+Jmb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr9xnwEv5/VkPb7O2gDJ90iYeeZsgk4evu4zxKJ8QjptdyiT7R
	9nxo+PSyn2G+7DAhtRmconPeJpFpe/unQzM9ex1Sf5LqUgJDtzNrsx/lEmsdvDYzsRNWDWBiD7u
	JwOpOB6KDn0ROs2kM9YNizZZ1zH1eeOAP98gVOZgydw==
X-Gm-Gg: ASbGnctjuHuUtbzA2BYU4esqWQnjwHRwnk3rtdwmtcEN+0Zvl2jC4zonpuGu/hjyf0K
	CHgj2y3s7ZPcOtAQGl+cFKWQ2MhbaGriPq9ocCKK26iHiD17o6wmY6zVOwQdWORjWEykEuhjSxQ
	peH6fitvMI2weMkyNL899q4NGfk72kSrov3eCVEJ30TUkk26dSQ3ItQdHOIzcqYFNeqYaKSQUc6
	huWQb3TR6p3
X-Google-Smtp-Source: AGHT+IE/RelN2yAbXjKi4YiAK2CA61uQIhSY71HuMHqTGfIjg06qhygh0vmIXdnZ+86VPFbiRmacv1JnWnAJVi7TNPA=
X-Received: by 2002:a05:651c:1508:b0:32b:4903:f1bb with SMTP id
 38308e7fff4ca-33412bd8d5bmr31591901fa.13.1755530843331; Mon, 18 Aug 2025
 08:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250807071902.4077714-1-arnd@kernel.org>
In-Reply-To: <20250807071902.4077714-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:27:11 +0200
X-Gm-Features: Ac12FXxoI5G6Acp5M3TqMAyPwo3MxRWcQCOfhDx1XqcC9UiXnGUHpQ23OkKrttw
Message-ID: <CACRpkdacTwnFxgfEDE_eSd2ZBt4pau69RM_z9TnS4eJh-tvjgA@mail.gmail.com>
Subject: Re: [PATCH] ARM: stacktrace: include asm/sections.h in asm/stacktrace.h
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Li Huafei <lihuafei1@huawei.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_082725_346599_73A5E959 
X-CRM114-Status: GOOD (  13.93  )
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

On Thu, Aug 7, 2025 at 9:19=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The recent kstack erase changes appear to have uncovered an existing
> issue with a missing header inclusion:
>
> In file included from drivers/misc/lkdtm/kstack_erase.c:12:
> In file included from include/linux/kstack_erase.h:16:
> arch/arm/include/asm/stacktrace.h:48:21: error: call to undeclared functi=
on 'in_entry_text'; ISO C99 and later do not support implicit function decl=
arations [-Wimplicit-function-declaration]
>    48 |                 frame->ex_frame =3D in_entry_text(frame->pc);
>       |                                   ^
>
> Include asm/sections.h here so the compiler can see the in_entry_text()
> declaration.
>
> Fixes: 752ec621ef5c ("ARM: 9234/1: stacktrace: Avoid duplicate saving of =
exception PC value")
> Cc: Kees Cook <kees@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks like the correct fix to me:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

