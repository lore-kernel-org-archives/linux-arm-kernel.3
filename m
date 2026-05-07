Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E85CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg18/DzPAz6n2EUKFraCzWPc1dvLgfrdplVOvzpq5g0=; b=IH5bQQpr5CnEpksA91uNPqjLWS
	Az/tVjSAKIPEAtQktF77h/dfHhuMfbAo72/8UMhQINJhrB0MEsSnwCow5CofjgWK4rBYuq5SnHqJX
	gkFu/0CH2BpUq9jc2lc2bMVWOWYbjxdfDeCIcH88b2JCIe9bxK5vi34UzUdyUdOgavyYJsFje6XCa
	jjOcssiyIokLy2nGiHmtC4hYEaFgaB6IJuKeoB5wbCR46h2dFSxH6eywIuS4s23S1u/PoPqLKF1EY
	LA/PWz2jNCeP1YXrZv6gBTEBRHlCQnzCzDkshVXSff7Yz/0v65eUe2OGmAwMj7yEU7mtTMs76TJFc
	TlC91QHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKv6P-00000003M5S-2qa8;
	Thu, 07 May 2026 09:33:05 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKv6N-00000003M4e-21Gs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:33:04 +0000
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-62f534f7036so494906137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146382; x=1778751182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg18/DzPAz6n2EUKFraCzWPc1dvLgfrdplVOvzpq5g0=;
        b=p3MvpofDxPr5OltOGq8V8XN0f7CTlsBIMC/f4176vWy2R/Kp9SwYE6qLormqPYRYd3
         WlNaXDxQI8f2ynTcsY7YXFVKYI+FCJamcLxE0aCdPWrqTtLl5aN1Ge9pMn1XuqYmFbvv
         hFkMnk4svzJn7QwphnL2zeIbtMduarLenetlht8vUhqEkoUkGHvBNHz4B/aPNULjlKjO
         Mr/GK4hH7JY4gX2MYe8Wi5hHoHEA3i7dJ/EKJPVMU05WB4UCAia4xb4Fs7GwjNI5UUOC
         GeDhze7Sn4fzg8OrOc5v3wBK6HYgVw4sV8COJNEYr5glc+0DevTYkFDAuXpIHD1emA8+
         8pCQ==
X-Gm-Message-State: AOJu0YxTX3CkpaXueAF+fXAsmXf4SU6oRKEnWqGZ7X8Gb2UXks4jeJBb
	/+kBYDKWL1xm3LpDaUj2SVULpt5ds4mxL/S95w3mnChtCuD6LK+gLbQiouixXO5ksxI=
X-Gm-Gg: AeBDietp7tSKcE+CLW3KpwzLNfuJ1huXCyCgv27RZFCeKbMhwFG4xKKIuaWYO9FkPmh
	XTkwAUk3QkBwUkHMSvmusHTt9ZlLJjZAgeKGH9aYFXHnLTBrmdlIqJ2ZzNjj0IBi3rZt34XJTrT
	wUfyopR5WfxJj8BnIPe4K2n53S1vZUpQ9HJxCDWLx3qQoFqH07v47XlcQ2sGQ8ubLPQRIxEo/Jm
	aXNemwKQELM1168skucIYJ5TKY04m/YFG/MOZutc5n08si3WQBdE11lT87nUegJHjsH3bSpb4GW
	uLylg9BmLylZBxariLPNPqp07Pfq/LMMia2c9hCDqL45e2ai8xYBCRatIN91bFNmslStkt8ERfF
	eGpJrsn2ZuWbOWTNfV/HuRH9RbCx9AIHWx0VICCXby2X/6fvE3F+quUiEQMk/ULNwwgGyR+7bCh
	KVvRr4O1XDfo4Qy9BzIdrMrIZn0Qi2889CzViVKIYcWgK2xvxTs6NOdfSWxlqjt+QNvkS3+Ng09
	SI=
X-Received: by 2002:a05:6102:688d:b0:62e:aa08:e367 with SMTP id ada2fe7eead31-630f8fd9a8fmr3291558137.19.1778146382105;
        Thu, 07 May 2026 02:33:02 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0894dc8sm10469697241.2.2026.05.07.02.33.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:33:01 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-57524e52a3dso438348e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:33:01 -0700 (PDT)
X-Received: by 2002:a05:6122:da3:b0:56f:b0bd:2276 with SMTP id
 71dfb90a1353d-575591f7b22mr4356016e0c.0.1778146381121; Thu, 07 May 2026
 02:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:32:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAdnYVDiMFURqU9G5yuZ+spWcYwDXrawQ_NrL2-djW2Q@mail.gmail.com>
X-Gm-Features: AVHnY4I81FuHD6OzqE5oUv509FsnV6J3hu2KKPzKBtXEztsz99ISGa-m61fGNHM
Message-ID: <CAMuHMdWAdnYVDiMFURqU9G5yuZ+spWcYwDXrawQ_NrL2-djW2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: ebisu: Sort sound node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_023303_524917_B385C930 
X-CRM114-Status: GOOD (  17.15  )
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

On Tue, 5 May 2026 at 00:55, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Sort /sound {} node in the correct order alphabetically.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

