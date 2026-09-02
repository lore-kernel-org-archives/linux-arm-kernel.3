Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168D6C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=; b=YJnzaxphtzVqZDhutXGdz6agNK
	9zVquUQuC9gIFKPw3l8Oev9dspRmpell2Jenl2/xUuowR+PAXof0HiHmejaIyi+bLZdTGZzNF/peg
	o1Oa727lPNHZtm1X8gKZpWtPN7m1eQqV66cF4AcQor78CcHZDobV0r3NmJwrNLV1U0CzGrc21TSmO
	owCFJlKRD02RW36mvmf56DW0K48PtKSJlfHW5mpC+8GOESQ8tYJaLNSi0UfBf886hTcHyVJ+MnT0i
	t0Y2cbWsr7pGApUPLyaK8qUhf1RWA7KpRsoWOMn/aTWaQZfzGvMA1hauwstYynsLWemEVvqm9aSu+
	EPD6h2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oTw-0000000FP8c-33Pq;
	Wed, 02 Sep 2026 17:10:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oTu-0000000FP7e-0KEU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 17:10:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1297620f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 10:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788369036; cv=none;
        d=google.com; s=arc-20260327;
        b=rmewjgr2jDr2E+P9IJOfSwq0iBVVXft8UNRkFozklKlvoZe72W5qo07aQ0vK1rg4py
         3m3U+C3J7zj487XKPW9/EvYXmHH8vXPu6uI6PVsgpLBwkcpdN17AUdyIZibggY+F6o76
         5dShX4Vo929isirECeMmFIXJ629lKkiG5KG8vGlZlGerg+xTYeVPgNMxFoYGBEXfenJc
         UnCh5obI1OzvrT2EYouOJ2n9D06KIUc5Kj3IkwjBr+e8M+X4gXCDU2OAWqNSg03EInuS
         kRVW8m/WHLHp73ELySFoK/vjdQjC/TntyqWu14qfrVBsGhUQ1HarBE+SVdgGGVqdB9v1
         mt6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        fh=6p4SYwWCE6sKSvgOH0KPkw5b7Ed2fjkwM1e2b3AtjmY=;
        b=dXhP6whKRrAmIqcxfdqE8Yy+DAzfB4RUC32yOraZ7fKc7j2bgXN0kw8TVe7N/CSgBj
         ghiav9YxoJ/VKFHz968ZKgskn0ghThFTks6R7iHE6Urho9fIG0ScFbpKV1CWCAAhejag
         PXCnzfIAsWVSLtcUA+Ou0A0NsXpfgiaVU9wX0xGL0s7gzahIHerx/plqWZfp0LQtzTHk
         L16UFZG42hZKfk9A7SXI9Wm7vih0WowQLdj7MX5LnZl+REuGb0ZDE3yY/js80ct0fMLm
         j/Sm7/LFt59uKsDcUCUL94CP6JTEraZvhQ8FaR1wokyq4Ri4SbqyEu4Thmw9D8a7XCW6
         RkAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788369036; x=1788973836; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        b=EwQFe3OlS4WG3CjE42XRHXVVUrIgGH/bhAJoOSgk6MnZJNC7CLo+TSoAxFyOzj8xqy
         g/AOhHAG8zRTc/pHBcm4KN3bFIliSoi4D6C1I9Vc7c/zth/VMiGd2tZEyv7Fb9b3kM+9
         X18qnlx6hC6XjOp6eebCIWMMvfwjR1n9rlgghgOmZpyPTarviMSV1/dQkqB+ZZQIgi9L
         6o+JmLHSUzL/dnYuMNriIX+aPbhb+oKkwnSdNHd2mT9kz1uEt1TCGoS91Uc6gaFm4Ix3
         5p+ZKBhmw2PHfhMBL5zSI0DibPknhnI5dNfoy+qHVBumJs9cbBeNX8asC4uOQ0STpNpc
         Y7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369036; x=1788973836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        b=KkMz/vgRwN8Plb56Om1rDEx+Dp8GxSPimEIpf5QlzbJ1rxvfqU7FlCvKFmXaQLLbAQ
         WatNRJq4zttdZbrty3lYlPhuGCWz4HSgmh5zCKMamLfbUzyBjLewszzhTirHCnPnLw0B
         2XA7IrWZ78hcZ1h6GeEhBNIjAoHBIFO4GgLNElczuEeCqT5zUp0DQnfCP+oHLuSa0jA6
         dcu3NBhZ+/03zaPE6NWzSaJcQggGpKf0pyLUZRkpjgHLazoonBktjSDJfmdaT/Z2u3o+
         oH4wbmLLWs3Xj294Pmq8FqzwHNp6lkBjSe2IeE3N2kV3XRiSxbnPaRCiiG2rFI4Boz/r
         37IQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVgu1gmBK7yGgGR9Bs5C00aqcGP7yFVLwWCmgrgth6k3lgip+G1WsWxB3wpE27D6VuW9TL8uUTmt62+dgFoKPI@lists.infradead.org
X-Gm-Message-State: AFuF++n40j4APasmQwwTq/iXfU/FWIVBXmnEA1T5rbWpNKW8cQHJSndl
	zGTF8n7wshcTEmbzt35FKMM7hclJPsxrMUQDOJF1bA3q9jtqkNnsW4bdVAq3sT59LQZEJ1TlMpA
	h/wQ1YXQ+bABwi/1i6+3gLZ4WcbcsVV/Hy4jwBGbP
X-Gm-Gg: AYBFou2Su5n6Pt66CsjFmd8uaCZoj3uvqAkHaxEb4AMbJz0IkGlwSjoQ7SCpdihhKDi
	zjiitpD8ZnzgalDNQ1K7pw1fQof7WCvxQv5LywswSDBriG/6nUAZvLMrdjVzsjzcqCPBvur08L7
	bWTI3PC4L70xAhAm0L6Vetz7v6bUZ1bb2gKi0DAi/zDYa93iDyJn8HMZwaL/pFUk5FQuczMO1Si
	oL3RI9o2hS1LnM39vgyeiZYn5gSow+2w/BEevlwYZZMDLnEjxhflDacAyAgrdZgvFrCYUGuVT3C
	qeyUxV1TSlF1C9ZK8NvfaZUVw7+r4zCii8ZrozLT1GeF+X7qUxcmeMVPPLJwwSfbPysDidJ/xoK
	0rL+9T+dF3lT1bkuVsJt7VxOVnr2m3+rrJmX8QB2yRI3QCQVAkCSPJkc=
X-Received: by 2002:a05:6000:4817:b0:484:40b0:ef30 with SMTP id
 ffacd0b85a97d-48488deded3mr13204952f8f.6.1788369035314; Wed, 02 Sep 2026
 10:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com> <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
 <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com> <aphSYUS7xGJjj2gT@SMW015318>
In-Reply-To: <aphSYUS7xGJjj2gT@SMW015318>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Sep 2026 10:10:23 -0700
X-Gm-Features: AcwNN1XAESqNH6wBokuk-x9G05tfeqXIGUNdG4bw9ZYytsqReJ2H5J3a05HeJ1A
Message-ID: <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260902_101038_135026_9F23A796 
X-CRM114-Status: GOOD (  10.58  )
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

On Wed, Sep 2, 2026 at 9:44=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> Nick Desaulniers:
>
>         Is this patch good to pickup?

Yes.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

It does depend on
https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-b2=
7015390901@kernel.org/
though, so you might need to coordinate your PRs to Linus with Nathan.
Nathan, is https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-er=
ror-v1-1-b27015390901@kernel.org/
going via kbuild tree or what?

--=20
Thanks,
~Nick Desaulniers

