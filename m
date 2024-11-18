Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A94D60CF8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 22:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1MrAjucewY12Q379yzg+ry5RVZKlVViQuKVvFxefR8=; b=AzEooXwRpjnAf9Zo535C083D0I
	aeSwOUmFqUOae1WdoY6pFIpw4aijuJo62GNmnqg+ee3w3tqzaLmL8LWuHlmI4+77m5HMBqsR7tn6f
	27d8M5BncL9Ue6BCCKZUn09qRCvBD38mjtBZAqKucBdlVYz4fqz4kpf+y8RXxp1RB20bT0RoOhX57
	n5/Yn1CcCkmUbFufDn4Am2SI6+XfLFUkxa+eEYID2ka3bDz/oQ6vtRLrni0A/hk0xxSG6ltmodgSa
	l6M4WT7L5mxii2nTH1F9NqUhmxDZb4t7HdShcxeEvVWbEEmZCEroQi0321mzAvc8nUd3AtrXMVTra
	E2zLFj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAiG-0000000AnxN-3j1t;
	Mon, 18 Nov 2024 22:59:20 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAhK-0000000Anp3-0lnU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 22:58:23 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so32871481fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 14:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731970700; x=1732575500; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1MrAjucewY12Q379yzg+ry5RVZKlVViQuKVvFxefR8=;
        b=bDU/r5I9Ed5LWytylSbdan5CrFrK39OYkn5cZ8k3jAgbuHb/hJthvr28Lu4AjYSyGG
         j6/L9y3true0U63s4rQRsP18nTCkWvCsmfhIeP7TTUUMkWp2KCFuAReGLZrnm68Gg4/e
         oA+HimVs9J41J5sbpwL4kDxfZ3z7WnjpIAjP7qTYtTH+jMQtsiJLpfiXzE6EAwM2GPbG
         FJvda4fU5mHbZg3d3PHN24bKe2nvFKfK3uoLHWXDe/lVtjONB7DTdDySRjfyomlPc/Vn
         jLla05Ycy3L0Ov+ulstF7KXQK8pntiu0rY12SiyRPEaTnYfWuAOGD5KTSmEAJGl18rw/
         ctPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970700; x=1732575500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1MrAjucewY12Q379yzg+ry5RVZKlVViQuKVvFxefR8=;
        b=Q4e1ISqmRDOMv7GuSVbn139JXjocLUxII3o9+bNXG5RxdW2mNnTDOIOezMAoUo5//M
         6ZCFfnouROBGQnABoXlqknfOYcQQM5QdqManZqRtiMgcrBAe00bRXhsehQLxCSOodRbQ
         zPcK2S/VL9T3xTpyAZIczHgvdavWlsY/Z8BT2v3qschjDyIh0r6w56PDJX8Mksmk8Yb1
         ZzdJijMuff2oPj3S7QMhPYmy8GY2kfxNkiEOiRJ0kourHh9ZIo0hjyJN58B97iO0jS5G
         UED12pmX03pUYKTW/Vxg9o3q8xrY4DPIVb65f/jvrgR3yRO21XQ9sxotvgOQjR+8E+9Q
         YN9A==
X-Forwarded-Encrypted: i=1; AJvYcCXGAC2MiaSiZNT30d+9e7RCzQQdF2qinoVMuv2Sm5XbLCg5PLMtNNdkElWuX4yTUB/3NeD5GtFDxoUL6eKnMyWL@lists.infradead.org
X-Gm-Message-State: AOJu0YxipuXClBWjrypa1wXC/j1xY+kL4bR6aDEuuh39Jl8+OP00JV52
	li7SfWBRStV9ApmA+3o12MWHc3Wbckcz2Pj43qETTdic3PWQY8nbDLUuK0lNAx7gltBnpZ6FxUm
	fG6IR0cW6iuiB2vg2OYAs988TEIgNiwq8vp5RcA==
X-Google-Smtp-Source: AGHT+IEFiYb4rFpuGVaBbq8epNGwPhP6IH9nm6hyP3jkslxVQLOCjV/16xaXHTQ8qSTvbVzxGCpcSv4sYGDo3Nb1YqM=
X-Received: by 2002:a05:651c:1b05:b0:2ff:4ce0:d268 with SMTP id
 38308e7fff4ca-2ff6064e25fmr63970731fa.2.1731970700292; Mon, 18 Nov 2024
 14:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20241117114534.work.292-kees@kernel.org>
In-Reply-To: <20241117114534.work.292-kees@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Nov 2024 23:58:09 +0100
Message-ID: <CACRpkdaBErgRrFDWu2FSrnX9Hr=PnHvfccLgAzhOOwTdXuRjTg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: Use unsigned long for bit search
To: Kees Cook <kees@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_145822_222544_95BD0D54 
X-CRM114-Status: GOOD (  10.70  )
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

On Sun, Nov 17, 2024 at 12:45=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> Instead of risking alignment problems and causing (false positive) array
> bound warnings when casting a u32 to (64-bit) unsigned long, just use a
> native unsigned long for doing bit searches. Avoids warning with GCC 15's
> -Warray-bounds -fdiagnostics-details:
>
> In file included from ../include/linux/bitmap.h:11,
>                  from ../include/linux/cpumask.h:12,
>                  from ../arch/x86/include/asm/paravirt.h:21,
>                  from ../arch/x86/include/asm/irqflags.h:80,
>                  from ../include/linux/irqflags.h:18,
>                  from ../include/linux/spinlock.h:59,
>                  from ../include/linux/irq.h:14,
>                  from ../include/linux/irqchip/chained_irq.h:10,
>                  from ../include/linux/gpio/driver.h:8,
>                  from ../drivers/pinctrl/mediatek/pinctrl-airoha.c:11:
> In function 'find_next_bit',
>     inlined from 'airoha_irq_handler' at ../drivers/pinctrl/mediatek/pinc=
trl-airoha.c:2394:3:
> ../include/linux/find.h:65:23: error: array subscript 'long unsigned int[=
0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-We=
rror=3Darray-bounds=3D]
>    65 |                 val =3D *addr & GENMASK(size - 1, offset);
>       |                       ^~~~~
> ../drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_irq_han=
dler':
> ../drivers/pinctrl/mediatek/pinctrl-airoha.c:2387:21: note: object 'statu=
s' of size 4
>  2387 |                 u32 status;
>       |                     ^~~~~~
>
> Signed-off-by: Kees Cook <kees@kernel.org>

Patch applied, thanks Kees!

Yours,
Linus Walleij

