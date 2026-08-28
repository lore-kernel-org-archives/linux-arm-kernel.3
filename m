Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4265FC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=; b=Np4IdSVllxnBQIWqH8VcyyUn7x
	49mQSDW3oNsa3XayHuZSQ9ACoTkRqCcnRIVoLJCLILkw2xYu3XIn0Q76DTFsSixi8/EnlcZRaqT6e
	dyZvsOOuBoOX77ncyaXdrV+ruMyl0fr/57xddAwbtFtMliVtaf7aPty21CcUtKN1kbInzsfTtyC1g
	nErt4b9It1kRWojZdnHk8N1gJZ4gMFDplOCyd1w6OyCd6t3WedNU4sDqckm9/ZBrYAiPiSsIkRIsK
	19mmJV93QbzXKUkQung0TvWFJUUD7zTs2pA7GUsrfzKii54F8Rg1ugvi88w1x7zoC0/fr0xmozZ4q
	gXDdbTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03XN-00000006Q58-0tQK;
	Fri, 28 Aug 2026 20:50:57 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03XK-00000006Q4N-0znP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 20:50:55 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4996e2575dbso13375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 13:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787950252; cv=none;
        d=google.com; s=arc-20260327;
        b=YvvBDFXgrfr3RIzW0QCPFYxvav8Vv84Ew2xamAZr10a3nA19gb3qKleSI+7m4++6WZ
         VwoQGrxUevCCTsnGBwc3CdQ0oYDQ85AwxebZYSq9IGMXuJuPZwgG6AwX+61Ucw/ksmLe
         E1o7dQTAymOZzr9yJ+8JlZPVS06R6CpH5Lr/0wyUrJrfU7u6j7mj2E2+CwnWxRkA3VDZ
         S7dGZEYaspUJuAQxV7t2ZsB0r5LQlSMPT+4u161A5r5gFqSVg2tD9QfIoOUhB18SgLLd
         9JsfNnVEC6ukGjlGb7UojzcuZHyKKec72YnskRVn0beQcxmhwDogR/87JboPKKeV0mUk
         UBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        fh=xJ37ZmA7xNB7dZvk4FDYjuHIWazMOEjSjNew0jQcGHc=;
        b=V9FJC0OiEgL4eRi3qbBVPyMrrVx5g0Qi26zd/5w+Qwen9XKN7+ILAj1iYbiI5oQuGB
         hl6hg4lGR7C4MYlr1GI2bCneDgrllXB6I3rKycSoHSOFcbkNYC1yZD5frjHGrpmc93xo
         sBvEc4xmlGvfQeHVZXcPSpRWHQQ/d74KWFOjU0ZKv9ANoJIij1mM/AwCxE6D5VAtfAfY
         x3Lcy7WsQuATrQcTUsGWO3xaPR/mcminjteHas2EiwK+aoyBPdmIFtmorcEd6wbtXxKX
         IvUhSO+hl41fhj42yKKtE8BtvYVvoDzq2Ptj7e6SDkKizgPCsosSxPU1K0+bST9s8D6+
         uMTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787950252; x=1788555052; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        b=T7tfdmjyT6uE1c6ALeXnek+N3fZ3OkIxcMj6IVAiqRHoVnOS5AE8h4oltbJ1NUxPEQ
         RzjzWInTZu6nW3dLmjJhj320yIX9Ahiej0ukhfhua77lqnDmZlqTOuQoP9OMuZnUFnOc
         mOuQKF22gGcDNsoweVraxpHn56FTA6hyk6gZD6W9Jfnh8nH2kAvoA7CKh1yL+koCF4xV
         zmpIG4xnQ/YUQpvWO4JmrEy1ck0Cr6weUzGgV07xmXZzLFHSSLIPO68N1xzxi98wZK1O
         kFrHGTfUFSObTPttS53LFWX4wE+wcB6qliLCL8rPta5DDNFE70cQij79I6ic/qJ56gJb
         kQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950252; x=1788555052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jz/R80xhYUJ0EJWe3D+HLAqSfz1N+6Poi2/4tJO2Abk=;
        b=rh5hnVdrVH+HN2lL6nZFQ7ENqUCybjZ3mPEJPAuWKuurHp3n8p1p/Hg/xRotIp4E3w
         pA6qCLRz2e68oqBEKpGSH6wtl2XtWPG3vkhrf5f97Z1wqIPJa/DJ5lfjndqWk8xyhunK
         zdYYa3KTK/OCJICamAjZWvvLRKTXl2hwTU0WexvlWByURFk1CX7F/mHzuUpIfFCl0leQ
         zvS3Acn1n5A8p0m+otVVdZMI8Trxmz0+TCh+jLSQ2oVCMcSgHdlAbYPlXNofzwLTefhT
         ocRDyhgvE999Vg1t5AOlz1L9g3oLMntlWMfCOTToedegl6yxuR8YMjRMWPo+5pat3+2l
         YtYg==
X-Forwarded-Encrypted: i=1; AHgh+RpcaGw+maWCp+N6IeSMUza+oBp4Nnf1KWHXqKauQ5XZwaSOkMyYpkOHjG3JKT79fTMDc6F3hXj78vCWP7tzqoE+@lists.infradead.org
X-Gm-Message-State: AFuF++mX2bnGetvjcdGYbVN6T2hWH2ragDBLFeZeFsXSbiBsIfAOmood
	ztgvpM4qpSbjPwngBHWf7QEJtDfMb45/w93D75Dvdoo4yp+1F8J/dssv43UBtV/TWREuY6HHTi5
	AubUeb/tBTO/G/3jNnLPqFlERHeII4ggk6EOnvntA
X-Gm-Gg: AR+sD12fiZX3A1EYn4E+OGUp/1JTTv2QdzguKxSqqod/20d7a7F3P3dhrZ36ARwHcgT
	KtyU7lQ3tr4AisW+zzery7ftLIIoKRRMR8SYvoJcZlDXhKOSy1znsmXZOo4Z8Nz9GiIy4W3WBm9
	f0Lip4Gc2AlHLx54J54wiHkrYYBOr0Xiy9EWulMLTHcQPiNk21MBPyPFYz6koEDRdRhfcVwDBUh
	vlvMJ1EWeECd7g7bJ+7qFtsGj5KLzyWNs7FzXR4iOQfC5hW7pXr5yAonhKDXTeY/1JEDtGxiCej
	qMSC/NZs3kZv4RGx7cp7jJi0SEuN/xfgPk2qJDVwTg==
X-Received: by 2002:a05:600c:21ce:b0:499:c3da:6f40 with SMTP id
 5b1f17b1804b1-49ccbb10d13mr260135e9.4.1787950251892; Fri, 28 Aug 2026
 13:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com> <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
In-Reply-To: <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 28 Aug 2026 13:50:14 -0700
X-Gm-Features: AcwNN1VOtvX9Y95_BvBjuOVh8z76AnKrtJFeJUv6jycw2oA0qmipRhZ22a1HmKs
Message-ID: <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Yo'av Moshe" <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_135054_293245_4970D838 
X-CRM114-Status: GOOD (  13.00  )
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

On Fri, Aug 28, 2026 at 1:19=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> The 8B alignment seems to be a requirement of fncopy() for 32b ARM.
> But functions in ARM can have 4B or even 2B alignment w/ Thumb, I
> think.
>
> Doing such an override would add unnecessary padding for each use of
> SYM_TYPED_FUNC_START where probably none of them have this fncopy()
> constraint.
>
> ```
>     #ifdef CONFIG_CFI
>
>     #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
>         linkage(name) ASM_NL                    \
>         .balign align ASM_NL                    \
>         .fill (align) - 4, 1, 0 ASM_NL                \
>         __CFI_TYPE(name) ASM_NL                    \
>         name:
>
>     #else /* CONFIG_CFI */
>
>     #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
>         SYM_START(name, linkage, .balign align)
>
>     #endif /* CONFIG_CFI */
>     #define SYM_TYPED_FUNC_START_ALIGNED(name, align)        \
>         SYM_TYPED_START_ALIGNED(name, SYM_L_GLOBAL, align)
> ```
> then this driver could do
> ```
> // fncopy needs 8B alignment; see arch/arm/include/asm/fncpy.h.
> SYM_TYPED_FUNC_START_ALIGNED(imx6_suspend, 8)

Looks reasonable, but this still feels ARM-specific to me. How about
adding the macro to arch/arm/include/asm/linkage.h unless you have
other users in mind?

Sami

