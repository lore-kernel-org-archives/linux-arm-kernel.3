Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23C1CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg18/DzPAz6n2EUKFraCzWPc1dvLgfrdplVOvzpq5g0=; b=ywNhjsUFuiyCKcW0Ny1FBqL1f0
	kJIQb0UNDPEkz2YEuh9AB2HJexsbyG696/BtO9stTeycvfstrvoA6SU3AOoKD+kRG2SZ7pyeqECMa
	R/zV4Wir76JW+OSv69JvXpc8VIPeKmflPkxccUf1+R7S/RsmJLKMzmY0mp07BhsljMMz0M0zGNbQD
	umhK8FXauRFu7r/NdMO71ivPpJtNwmPkz+JzrcmiQVb15dJpIP23PAvDSkf1tgHKP96mT9syZMbXR
	cm7dx9igSyX0DnQ3n9CIUzPrj6RrQ7OS2Gw9C11HOiri48AihzvIHY9ZKwtX14RLBmd0tyTjwAggf
	cHHoVotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKv83-00000003MSy-0Jr1;
	Thu, 07 May 2026 09:34:47 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKv80-00000003MSK-3qde
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:34:45 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso214160e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146483; x=1778751283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg18/DzPAz6n2EUKFraCzWPc1dvLgfrdplVOvzpq5g0=;
        b=DmspCZukBalVeqd+CtJja6teR460LDS2unzcmUMnmldePRYQJqHNavMs70eAXXSpt6
         +pwzOxBgl7Y4kHr85qvoCF+nBz/4w8yC/Y0o3R9tfV+QVgQfMlV5ry1Q3NSSdbKEJfI1
         GeT5syXJDhV80qpdfBF3CgRALzQG0OgYn+KbQOlpOQ4Nufduk1aGfZn5sJISX1bmoPia
         DMB7WyLbO8VyzRaZzF4wXdaXqvdKE8Rkr4afKkEPUha93KPEyYhNYf6bULcpfcAV5qf3
         ZucmmAnp1RcyXQSWE8bT/bscG9yQq4X5JqH8cYipPgI5GPWz4wzFSl22Uw+HG1NQ9yt7
         RLWw==
X-Gm-Message-State: AOJu0YwLEBLUyqlfLQZMLXrLbtLZmyLcscrRthxGmWPADo9BR3Tl48Uh
	mMMzhBM/g4hGPy+FQ0EpHbvSKQnkjWDqdRv38nMCsiarjgj67UiTGApAGPD7CUWFfUs=
X-Gm-Gg: AeBDiesd/TZw0ooKyJuItRDze2SR14sZlZJSYDfCnXIAdX+JWkWhQwsebawJUqonmJi
	759UKMjnQ0uWSa93ODCcyNKPfyWK4pmV3MHTbkYXi4vm/HTtMxiJA83GFPXG8NKbCCH7BzQTBKe
	mmwQtTRXfsl0k8qk+/i93ioULcV/b65NrsGBZ1SFKBlpfSXV8U+ZdcxZBuU48U71nzsIpRApp2H
	gIZK6m/DexridpKS64OBA6YpxzIToLNO+quufegKILR/0x2f3yd5n+RGaCckG8/V69+Vt3BSn5p
	ScquLrqrHcvlALeziL3t3nIjnMycQLxY2eTM4S1pTIrFJ2zikRzOCzLFpbwnchMlnN4lP6GT/Bk
	1ONvoN2S5cyvV8hWR5zsw+63Qn8M4/+H8oy6iswaCK2Ha9E3PRS3zD8ZzuQqvFkjhAleFOT+6qo
	nnDyt0m6ba04GW49vQ9Z6NXyZR38vnnglSjBAOYDDoMzRMwL3RhQM7A7Zi0S9m2PU6xNgCpFry7
	rvPRWXLu/ZYHCQAvRVt
X-Received: by 2002:a05:6122:1da5:b0:575:29ef:7df8 with SMTP id 71dfb90a1353d-57559571a5cmr3739356e0c.2.1778146483620;
        Thu, 07 May 2026 02:34:43 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95d338eefe9sm4238690241.7.2026.05.07.02.34.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:34:42 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-956849ae1efso171446241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:34:42 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:606:49d:183f with SMTP id
 ada2fe7eead31-630f9060df1mr2849018137.26.1778146482430; Thu, 07 May 2026
 02:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org> <20260504225515.114986-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225515.114986-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:34:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxjMbbnU0DE5VZ_trgpOmykZtMogX=ENoU+fnP9r6j=g@mail.gmail.com>
X-Gm-Features: AVHnY4JrmA0rqCd6_oyesdTMolRy2oBM0JSfiD2aIIZPeGwPtc5XxCSK-5XF7ko
Message-ID: <CAMuHMdXxjMbbnU0DE5VZ_trgpOmykZtMogX=ENoU+fnP9r6j=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: salvator-common: Sort sound node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_023444_955917_F1204EAA 
X-CRM114-Status: GOOD (  16.75  )
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

