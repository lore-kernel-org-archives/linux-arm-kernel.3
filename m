Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA966CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2NiokGN/wizVGUGbdWYAqnmeeSP+HB1QCep5aAksHU=; b=cBhRt4MeU0R14gyMWnIg6W1aIa
	BE5Pi8Fp32sMqqGXZpB2F/XWf0MZNzL9fOLt6HmMsREWNkC4Ve60SesG4UpAECd9BPTlPz+t8++Oa
	Ig48jvAkJDA2wVzmvQJyP1Fho+bSOhdA9XZMf/9ggyFPmRxffFbpYMuNIBBxuWaMAkBvw0stgS1Co
	KVGXvBsgBeHAMRGI3xJzWH5GnOJSrBCCldxRCovuDfpVXJNzNN7YTKKj2H/cjrPmCkQl3IdRrI8u4
	Re3Ln2Us8Vy5DoyF0zeuBDD7Veptjhz1SBZNhpyG5M1XtlttJYAZ2zmilPBOC0WsCSh1sn0e7MqSs
	aR6eTKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaGQ-00000008v22-1OKG;
	Thu, 11 Jun 2026 07:55:46 +0000
Received: from mail-vs1-f49.google.com ([209.85.217.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaGL-00000008v0B-3XKS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 07:55:44 +0000
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6c4db0bf752so4822799137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 00:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164540; x=1781769340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2NiokGN/wizVGUGbdWYAqnmeeSP+HB1QCep5aAksHU=;
        b=q4E6wJe4uG7oY0cgvZg1BYB6mjDSWk3uCfXf/ZN5L1Z4LWVOWkLWFHxtFSK+5KbsHE
         tSsi/zHez3cKSqoGm2v0zBiFpUN/6sRGzBDpZDhCOwXlpfeRRR39LizJ2dPy4VtU5sgP
         mIB3RX+P471zLeBP2C3ccj1xU90v4a3QXiAqwSPerkWXITY8XrsIS/3adFJKw7GYxY+l
         lymucmDFotvn6egVIv7OZH0+W4xC5ogQsY82DHoPE3pU4RTftRyyu8+1LLh9kcWrCI3W
         FffjPI21kbVbJn0onQ6HQwxKxlHAfjqy32FB6tT2LKJe4vJxBIA8CPDcYi9CxkrycBux
         unTw==
X-Gm-Message-State: AOJu0Ywdc3ExoAO5qzzcoHbv2zzz+XPfkWGSL5VaahuOPgWCkOpFgO8C
	GmQhm2Xh2OyFEkYlY8cxI9S6kTfAIOTEq5t9ACU1pjYg5EeJbPa6dc0bWFcKL143NjQ=
X-Gm-Gg: Acq92OGYEzELcFygHS+KKUQa8wGOc+inJ0qMn+iVD84W8Gc6ENEl8pYcuXkfXkDPWzg
	O/pu/9B2ifzRNTys7dEM5xZeWkrslAOqaXFvSPQSl/k49yUtiQZzkGuY1oAhGempbXKmw4E75bG
	1HpUkEq0sR+TxzNFa3mAwVXfRifByeUfH5Za7ICq+ljDA4eBaWfNHJsMVEcdjs0FD6VSd0rjEEw
	7EjCoBUWKpumLqkulE/6cucbki/YJqyJUuRMJwn7/87d+T8jjRFfFJGBOZFt0Iy++WDA536fXU8
	3PQHkdapuQ5Fw9/0UMlmQfs5t64xRxNAkM+5X4G2Qlcs/mEE+bpyyzIPZ/PSQj91EXfzpGRnAVS
	xjdkP1C8svTuEab4fqFcrMeWasqRPv8fKFzOydBf1jgrOtbPbSoiydW+GyRcWa705GcbIvpppWl
	fDN44d5ffBQCce/Ze6Pvjs7e3KjVOw4LTB43B4aLf0E0wYbjoKgdeAjnuwhACN9WdwAGe+OCk=
X-Received: by 2002:a05:6102:3309:b0:643:80f1:350a with SMTP id ada2fe7eead31-71d5a3f21acmr552280137.2.1781164540639;
        Thu, 11 Jun 2026 00:55:40 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9666314e0e3sm424686241.12.2026.06.11.00.55.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:55:38 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-963a7e48493so4868465241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 00:55:37 -0700 (PDT)
X-Received: by 2002:a05:6102:419e:b0:639:1e8b:ecd9 with SMTP id
 ada2fe7eead31-71d5ca6f14emr533723137.20.1781164537632; Thu, 11 Jun 2026
 00:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org> <20260611005952.146825-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260611005952.146825-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 09:55:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVU=msc6f3KpW1PeC1mB4dLKhAdqRaFx2i7GMRNDv+4vg@mail.gmail.com>
X-Gm-Features: AVVi8CctB5g3lahw0kyIeWwLgXx3I55B4rJDSwSay_Z70zWBy3E0yh5vjNFIWN4
Message-ID: <CAMuHMdVU=msc6f3KpW1PeC1mB4dLKhAdqRaFx2i7GMRNDv+4vg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77965-salvator-xs: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_005541_884435_F4446601 
X-CRM114-Status: GOOD (  16.73  )
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

On Thu, 11 Jun 2026 at 03:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on Salvator-X 2nd version with R-Car M3-N.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

