Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E6ACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FLpuySnjEqiS9qmBmDDye9ClI7f1GY+eT111Ebu1EY=; b=pA/o5RIaXAk9xfAhA4rKykJfGU
	3Q9SYmZ/UpmeToR12GyxN35d12c+/sqDMxDNzagBVzSRn1B5eMyoU4MfXiVNYu5/4VYrlKcLu2WCN
	LpNmiGnqiBarsUqPkSRhRXRQAg8MS42b27eqx3DOizEx+iXXPXgHcrghwu0oEn7/nvJr3gxLyFnBh
	TbTlX5Bx/A58rgTBHe8Nb+ZTVZwUUs1F/merhhVoI70oTTPActXZIiwj7v618ODG1NPy80Rur5LD8
	Wmn1MGtrksiZciWfNHm/e4DZM2fCaW1fbYwZbF1TLYJRpjPHCcJBls464/Bl+1iipayOGP8fhL0lF
	fLMRcSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7XL-00000001fMV-2jkj;
	Wed, 29 Oct 2025 14:52:31 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7XJ-00000001fLL-33pK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:52:30 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5563c36f6d4so1132996e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749548; x=1762354348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FLpuySnjEqiS9qmBmDDye9ClI7f1GY+eT111Ebu1EY=;
        b=KIDoNBtv+dqY1UIfV+A4Y9B6SbgmyKk3NcRT/MvYGbu9iWjf1NOKlh3eXn1Fj0UttL
         8u4X6OzpNwoAIJVIso/bE0Jj9vg3LuePgYEgz2fg1c/zxEh35sUSjhCGNrRzJPw+WW4m
         6a6eL48F86G0kh2ExLJM7ntzNJUlmKMJ02URwD/pcFfyY8WdZ0eLCiD61iv5YBMkCCu+
         tkGREbbeQhagFCrqbfHuEOkbsYVIt+xzyrvA93jhGp0GioZozfK6bZsl1A4iGU9FV22H
         dP4pC9ZNU3CW6Ev5JEJHi/3gNKdqCT8K0Eo2Gg+J6Oc/F+cIaw085rtHn4IiV4rPkSZF
         bANQ==
X-Gm-Message-State: AOJu0Ywc6USzvfDO1St2yHXix8skzxMZ2VT3d0m3iPgjVm5aVNHDvW3s
	B/xcyp5Ni7E2mpDWxSE0bWaBMc8F99adzOLeYK2V52mnx0MfB3Ow3GHfcdGRkJsO
X-Gm-Gg: ASbGncvxE5IJ/CZFqQRICUXr/mn3C+7sv3F3sVBh+NvHhBQQaG4o3EPZHAslKDk2wF5
	2u1dRZjE296jNH6zx+gI+u6Rksjjli3d1+PwHJBfccPlf4x0AuWf2rC2IgDLY9PzS7SIGkBEOd8
	CcuNe35n+gHXZUz/gaYgdp2cQn62E40VDFIUgphFHAd+f3ort2S1/Dx0XtxMWHUfibljVSjqNy5
	5ZqHu+tnhtUs3kS899QTZPd7WbzP/ZQXGm1k2wXpZN1XHSgtP/KOomiCsrICBz6Bs9NA71lRPTt
	8cbJYBEQDquqK5S/4eUEkHrXkMDocPNq5VHZmrd3UbINu9+nCGSFNstlsRcwMMtWEChUYmO5Lqt
	WTejWglmV/lq9k80FHH1JmwRJX6bnTQMWnSv68Q+wQzzcic1AXphhDh7OzDB/FX+9yJ0cSWUpxM
	OUtlyz8m6fcWwMNe9/ZKOm7WEhP6bbaQLP6NypLgEolQ==
X-Google-Smtp-Source: AGHT+IHjW1VZIG4UYk+mLG7rQrwt2p/v4utzJmnCPkaK5vbKuuts3VkPaAjRMjHc0d4Oen+7j49sJw==
X-Received: by 2002:a05:6122:6d16:b0:554:e069:d7b with SMTP id 71dfb90a1353d-55803a89531mr2589846e0c.0.1761749547904;
        Wed, 29 Oct 2025 07:52:27 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddac10f4sm5423518e0c.1.2025.10.29.07.52.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:52:26 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5db24071011so1184691137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:52:26 -0700 (PDT)
X-Received: by 2002:a05:6102:2c06:b0:5ca:714b:2dcd with SMTP id
 ada2fe7eead31-5db7e20592fmr2373437137.10.1761749546310; Wed, 29 Oct 2025
 07:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org> <20251027211249.95826-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:52:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2Kr4WcYRERHCYR1zGAh0n2N3D=LYbRSYLJnRTYDB4+w@mail.gmail.com>
X-Gm-Features: AWmQ_bkKsdjAWwO1kVg5eGvvrllD1NL0DkP6oF9YOfmHIHPrQOIMjaePzAGpSiU
Message-ID: <CAMuHMdV2Kr4WcYRERHCYR1zGAh0n2N3D=LYbRSYLJnRTYDB4+w@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r8a77960-salvator-x: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_075229_790532_F2749DD4 
X-CRM114-Status: GOOD (  16.20  )
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

On Mon, 27 Oct 2025 at 22:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on Salvator-X with R-Car M3-W.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

