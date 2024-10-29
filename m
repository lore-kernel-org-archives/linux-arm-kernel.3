Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFA6D74942
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 21:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8g0feFRM/g+KnXJgAODk2AAUgWx4QsqawCDf5AlE04=; b=13cRDGYyG6ZfqcIATQjcGWW7Np
	xSFylFXKz3VlcrJgiwn8DWginnM9nvDMawCqPABw3YfjVN9ZyXml7USWbL0iCG0Tu2xBKTsFUVsLe
	qARaJd3SV7kAR1FpoTF6LkrKOj+M2mOTC+Cst2ipSqwZoa1ITPrnCzfMkYfkUmZmI1e1P5n7u1gV9
	4KgCxu+9One6VDhUlpgNzEv1Mlf9jEJxKYNBI/TVs+K5YWSNkdn+Ep92ovpluUXhTRGIQwfiJDTeE
	Ac1+6sVUROQDFL1WgIxsBCYl40E1gD69hVjGLFvDuE92PH++PGg0jCP/ZppfAQx6uhA2wUuVajz4J
	ZLAJrkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5trS-0000000Fxby-0bHn;
	Tue, 29 Oct 2024 21:34:46 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tpn-0000000FxMf-2eP6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 21:33:04 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so58655111fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 14:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730237581; x=1730842381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8g0feFRM/g+KnXJgAODk2AAUgWx4QsqawCDf5AlE04=;
        b=kh7aI+0oN+BR1vDb3IIYGFBsagEogy5gWBQnYyNRXMzPOsbdkCsDoEfBVgUWojkfr/
         xCo9YFGsbcs6XkyCv6Bhop6VntE1sy1BYna6Hx0FREiDOeLI6c9Fd82txd39Q7wY+Tyl
         N75N50i3zSZBabHjMHyAyGawo+eXmnBzM9mK3c1su/Tgo6KqTuOghuE3LzeP3EB7ztXH
         tcTHJogdJZOeevLRXvcu3kKmUZN/hqn/peNwkrKNAoN9BnPjSvxJJRSy/h5SmH3tU1au
         18M+1AzitPCZX/O2b3Q5hbdgt08fmviRePVgoqiWCTc4FT4hVkV1gFDcVQ/Mfc8ejdT7
         VF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730237581; x=1730842381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8g0feFRM/g+KnXJgAODk2AAUgWx4QsqawCDf5AlE04=;
        b=nS+EFFshmNORf7jthtXFABZpYigWuW1y8jjW7F/igliCTclqcsdzeYI+Hj3xcD0lYU
         Ch5XS5JsEx7TJ5ntClwlp7Vng+v8EyPpcOu8TWzqlaCFZzmaffVnTL7RrRBQ0Djk3W7d
         KsGfvPHKCn/mQM5UROgbYW5IIFTQA+DRvZWLeOCY9lgpkiHZukAmGPTDDTkJlHS311aH
         NTKvo6c8rUPULQtrojVODpEA0W2IgUlvaCJvcARS+32lucbA8kwiLzEHQwFKuTV592IQ
         FovoqsteyjnQv6IbcT2AtzhbTlN0Rd7DEHEC1e2Xi/SiiB6E052WQFkzGfNXSvPu6K0i
         dRJw==
X-Forwarded-Encrypted: i=1; AJvYcCXJZ2kqd6U7881P3MxqCM4ABPcEdxqf2BhAeTIhzlIdaVu4+hIeyoSQpc+ohHM8btHqhLrrM5pSKk5CSsfhQVMm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9pet+fReqvnI9m7j+mW6HiFNy+Qsl2eDN0mfVmzR0saxSX/23
	y4JRrRkmyT70sSKt8GNg96p15AvDPX1IZmExYT7NEekr6pC3xD+HIRIZHRarjRnx53FRMzUrBUc
	wyqjXq9NkUIZ+7gTnJErWTpPTYCz7H0PxN6grBg==
X-Google-Smtp-Source: AGHT+IGz/3o5I5pu/IvRI0ZSy55BS620aj8UcTY9J52CZ6B8oesgnwPYNjKruN7W2FCVabsplBzN7qiPeSUE29LMc/w=
X-Received: by 2002:a2e:be9f:0:b0:2fb:3bef:6233 with SMTP id
 38308e7fff4ca-2fcbe08cf3bmr60977061fa.33.1730237580772; Tue, 29 Oct 2024
 14:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com> <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com> <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
 <f3856158-10e6-4ee8-b4d5-b7f2fe6d1097@foss.st.com> <CACRpkdZa5x6NvUg0kU6F0+HaFhKhVswvK2WaaCSBx3-JCVFcag@mail.gmail.com>
 <CACRpkdYtG3ObRCghte2D0UgeZxkOC6oEUg39uRs+Z0nXiPhUTA@mail.gmail.com> <aeef0000-2b08-4fd5-b834-0ead5c122223@foss.st.com>
In-Reply-To: <aeef0000-2b08-4fd5-b834-0ead5c122223@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 22:32:49 +0100
Message-ID: <CACRpkdbgZ2J_-9KLeRz2Y8G4+T2qPo5uax4-o=KZbVFRVEO4Hw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: ioremap: Sync PGDs for VMALLOC shadow
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev <kasan-dev@googlegroups.com>, Russell King <linux@armlinux.org.uk>, 
	Kees Cook <kees@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Antonio Borneo <antonio.borneo@foss.st.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_143303_732844_8D445AA0 
X-CRM114-Status: GOOD (  17.08  )
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

On Tue, Oct 29, 2024 at 4:03=E2=80=AFPM Clement LE GOFFIC
<clement.legoffic@foss.st.com> wrote:

> I have tested your patches against few kernel versions without
> reproducing the issue.
> - b6506981f880^
> - v6.6.48
> - v6.12-rc4
> I didn't touch to CONFIG_VMAP_STACK though.
>
> The main difference from my crash report is my test environment which
> was a downstream one.
>
> So it seems related to ST downstream kernel version based on a v6.6.48.
> Even though the backtrace was talking about unwinding and kasan.
>
> I will continue to investigate on my side in the next weeks but I don't
> want to block the patch integration process if I was.

I think we can assume that the patches we have queued in Russells
patch tracker at least don't make things worse, so let's merge those
and then see if there is more fallout we need to dig into as you test.

Thanks Clement!

Yours,
Linus Walleij

