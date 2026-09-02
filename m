Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A702CC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=; b=HyAhagjisBpqNLw1xQiKhUhedK
	vNTqITgeWMjhDhm6qfWEO0k7jTls+knhoHPJHF20gijL54jALX7wCsd6/mr4M9WFF8yzUXhDC59Ea
	mFBkd2ioFvDryd6M8q7ckU/KJna6kVzKZxxEW4Rjxq5CPUESSZlFY62SLwbS5IWmnwCUOlVl8BgaH
	5MNW+n1DPYLcv1BF+1Qs0sQzisYM/vnOgdLSUswaQMaHB/b1R6UCQmC6+e47CAQQGhk/HPWceoY3X
	OAn1yblJgE7ZWa5/M570VOwZ2642XjS5Oms4EZeUGMW9R88usgXi9ds5UrKNi7MBuYGdXTBU/AX54
	imsuTxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oV9-0000000FPMu-1kca;
	Wed, 02 Sep 2026 17:11:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oV7-0000000FPMK-2IDV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 17:11:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so14386895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 10:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788369112; cv=none;
        d=google.com; s=arc-20260327;
        b=NWJBz9B+QglivVT4kRK4fFWyZ8pbLLgl7yv2rDRl8E6VoYSVxLDH1RjAqaCcTTUXID
         azhn5vGXtAGGImFSprnloUh2RmxeLgGLregEtuJYD4EOnfd3zrKiiuExG4pY4ZEY2spB
         HbOJB1icUqVD6PoGVJ+5ZdVF/3adho8A0Yl5A7lzrNqDfeYq6ghnFLLnsg2zZQ9xq8za
         KoCriYwE3hm4r/FZfVlBsPy+jZx/cUxeRX5IQeLYTkZAhrbdNt9+kd2i6iVaZZyVQIsz
         k5iaesXGcgWIt11uuBQlr31KBiYExZDnCrIUQDaKQi8OJCaDeULJNqr9LFhnrqpk0qrG
         1kyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        fh=onk99zGzXaHUq3PaQ3WYYR+tjvZ4wCWWZehlczz154Y=;
        b=MDWFzNqLu3mOU6IDK9wpmXOvfZLnjHm/BM7Nnfcd2mrNl6Cn9L2NA+DDiL7HUNlO57
         HQh6QFLkoFmm/1dJfo9gKB35d/yUXV2ySWFC82UjWiHdo3Ym8G0EJIrh+ddNmAWeJCSM
         biQAr6qISjI1C4wV6V9JAce+nb2MCBLc9kVW//8myIPoul3rGzE1cQwwuz1ok7ZbL60D
         BmU2BmnsD21eo3HhTzE/YaMCfLjDCLnUt1zUy7SLxrIeM7wxeLvLlBLb6io1gafaa9Tv
         WDIg7JZ4fl2YR7kQBDPHCc0bo6kzYnkbRF3k9U6t9Fp+Oy5exnII8fO1aLLUWlsJZSgO
         N9Qg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788369112; x=1788973912; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        b=JjdyfDS2imoDz/qbl3XiKcjRlglGEPMyDZpqOivGkoKLO+TecfPXnvK35Dze8O7OIg
         Zqry8fioZjKmTVr0tx4vqSjyDSeGNw9addqi5Qp4qJygbAct5lSQG+MVM283ztlGwwwo
         qALT+NJLRxZGBUlk4mi9PkupE8datTLqycWHNOhZ42u5n4+ZqWkibEWAzwVmj3GGNOlm
         7IMPA3C11zesFYW4DUvx5zkB35z2EUUFhH+swJ/3dFGZzSumPwgze6LKSSPNNyWQnhyT
         2kCl7iCdvUuMyHfDQQzQ0hM9FmAyUAyvzswpcF1all1+QVB+oaBynHvsd1trrhbyEk7z
         pP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369112; x=1788973912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        b=CnZUJhuxAW5GwwZuAcUzRdIzjR2oWK02wG5ZRr77mJ1s6s6DCihmXnvNP4So41xSe6
         JeDozexN9JY6ZoTmO1pDCIDdON0cvVtk0O4Hv6L4vBRmTSnkc9Ib7DZE90v4HY7j9mve
         4qZXHvVc8HSoYwDRomOcWzfTpa4kX/4xMgV8CL3Nt5T6GTBePOTQcEsTaoiodk49F6Ha
         F4tJoB5vBHRpWU3/eh2iOGvqJKQWiqyOGjufLo5hm0hDp0GGa1NixgC3vztJt4xFdh+4
         oQCKgFZj+aMrix1HjtNBCF4MSg6ZDrQ8MbDDFqCnWGaA2CEFn7qcDfbcqbtNpgKTOcU6
         Mirw==
X-Forwarded-Encrypted: i=1; AHgh+Rrn8o2upbG+bt9SDau+BTmo+1mhCG2lx2uwQTmvyvlLC5WyvQpEsTLS2FMkO8VkOZPhZfnGos2X1Da7tzSf7Gru@lists.infradead.org
X-Gm-Message-State: AFuF++l7x/e6DRRg8Age90pN+gXzA3n1gC/zqZEOUo3/z5wP5iFimR0b
	Z7GZNYEmN0XhdiMSAfLSNo1OYm3fuOMY85sf/Yammne2ECW4df6B9FfeBbUIxklAHMpF3hWGYtq
	fpOMiYCZIapN6iiH+vWV6tTUGeZG7w9BUjmchmPDl
X-Gm-Gg: AR+sD10EWc2pCMn3StF7dcLN/Ia9hq6uIt0TviZPvP+mbnOKf9dORCTnFwLztmeg7EM
	ZaKmLA0N4sgTVV2H0yBsdNzJCdlA/X4EBMjxP7nZAOTtxAiPGVC4SUnxGte9HFM5kflOdSHs2mk
	FMhPRJtWKOBEhZ3BAIPPNTtkD2j6sFlD6dkvc2Zs3P6XLLFSXLf4+KmgS31soivhn4kcGVJmzLO
	Neog/ivQmFLHuo5gTQN7HLKmFD0yvjzVGx6JF16vekDj+yJl0sz2QTRcS2VvUGrxdQ2clg5B1D2
	/235aCMVzHAZYpf6dZwA2tw/RuYyDenh4AQ4xJwv+1SI81ESSKDC8epSL6EHgZGe7fL5L19vpXW
	MQ9KUBRH+EpY3sP51GwH798vqNvh+reFoTarRG6ZUCE41Y/AvWFstziZBZm0cMpgOjg==
X-Received: by 2002:a05:600c:4e86:b0:49a:77c1:d246 with SMTP id
 5b1f17b1804b1-49ce5852589mr112274565e9.15.1788369110872; Wed, 02 Sep 2026
 10:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com> <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
 <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com>
 <aphSYUS7xGJjj2gT@SMW015318> <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Sep 2026 10:11:39 -0700
X-Gm-Features: AcwNN1Xmy-BrINuLcPwv_tFccFrs29sUnSKtr5FfgrTjlEDRCX8NohA0W3QuOR8
Message-ID: <CAKwvOd=P+bnKm_wDaZjBJQUcYKvVHb55MtOLKWO4k99By8emNA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Frank Li <Frank.li@oss.nxp.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_101153_610239_8A927F39 
X-CRM114-Status: GOOD (  15.20  )
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

On Wed, Sep 2, 2026 at 10:10=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Sep 2, 2026 at 9:44=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
> >
> > Nick Desaulniers:
> >
> >         Is this patch good to pickup?
>
> Yes.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> It does depend on
> https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-=
b27015390901@kernel.org/
> though, so you might need to coordinate your PRs to Linus with Nathan.
> Nathan, is https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-=
error-v1-1-b27015390901@kernel.org/
> going via kbuild tree or what?

And make sure to pick up v5, not v4. Was just looking at this thread
on lore, and it seems like Frank you replied on v4, not v5. My RB tag
is for v5, not v4.
https://lore.kernel.org/llvm/ca86be7a-7439-49cb-9deb-8d565ca0b1dd@yoavmoshe=
.com/T/#mc0e4f1537fba074b962de6b4338f289dbb26c81e
--=20
Thanks,
~Nick Desaulniers

