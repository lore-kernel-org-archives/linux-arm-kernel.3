Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0670CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpT6hXn4aVzifNN3nBALGbtn4EidYShjvQJLlFyRGLc=; b=T8np7IEf+XWBJF38nA1MJskyPW
	ddxxlt5QGCbicKX/aZZxBPOW63HCbjb3U1fdcrV5DPaWcmwQ0rhvdcjHtgAl0Xpw6am7S/ARRP4u4
	3zINewRczt91Yw67l3V8TuYiuVHYoCzSBmYFWEeWBoOY1LIZI0QRyGYJ6b8/rAK6lXJThupIgnnYm
	0VkzHoYxkQdWAnvo/YQ+QEL04fielVjfGNBhG7TpfxGPXzQLcYW89npMyYIaLoTVV0dVF62Ab+vSd
	rm7BKMszjqx8ArZfyDFmHjj/KRX7m/uMvJEE84dRBI7rqwon20Lpm9heAlrysDOKhfLRsVDPRGwTw
	VXUliBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GQg-0000000CzFF-3hb3;
	Mon, 13 Oct 2025 11:09:26 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GQe-0000000CzDq-3rrr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 11:09:26 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-376466f1280so15794511fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 04:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760353763; x=1760958563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpT6hXn4aVzifNN3nBALGbtn4EidYShjvQJLlFyRGLc=;
        b=Rig0csyuw1I09u69cqb/DyHm+LfPce0w3j0gYLQr6g8wk6vkXEfe1Ct3Po49IdEwd2
         qMxnyMuTdLRAWkuLeP46rlh3WYF8JLl2IwSTu1/nW94nqIo6iMhj1R8Sg+OijEaDBTTM
         jKq8pY76m/7l38I5/dYWtKk8zyLzlNQBYPGJ+qcIsLTxZEiGCQe0lGS/IhemrDoQo718
         iDDegpCQITmjNZq/jzijHWr11TeQzBeNqBLLVdvBJ7sjO7fsZChU6Uo+uisNEoL7vZCz
         Hn+/1B5zt8eqWpICfNv17DQuEGsQtaRwHqx92CkWHJrkQ+rU33XWpbVA8Jg5prAeAiD5
         qBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353763; x=1760958563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpT6hXn4aVzifNN3nBALGbtn4EidYShjvQJLlFyRGLc=;
        b=hgnYewj+YA3MRaEKzzjp9SJrMN5bNcWGKx/2q0ALaiNzPwYQzOADaX2x1QSgiKIQYO
         wqAY3MyA34+Rjz8bh9+IX1FAlM42sx26aifZt1J+IFMvBiHLxZdICM9ZiWyj/6w+9Lgn
         +iBFyuNpfDCp42z8vqRYA8peXRDeHCO0lI51wAFgN7dE4lecReoVhdVCxcsgAnnI1xF8
         50F9KVBrvnog8YIIrNClUK3z01+X0IVIpRcyha/ILxuYJbd0+sNCQE96LAeNQJ47QnjL
         iCILjqYb8IVzN8swCUt+iz0wdK5RlFU1yP0z0QVGGInJlKKEhM8yIGpJ4IikWoH1l0BT
         pl6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVKw9MGF0bF7zGyE3HCwuNhfgwYM/kadsfUGvAfviMaXJE4ltDegR5KDQ+PzZLj3cx2fXXkJyt4WgTKki/7bxC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9nyl5SOscYWNVQVANijh9Fb2xybYnk8Ato9tJvdNNsEs15IZK
	f5Ts8DW8oZKLpt9N8rmkqsB0jbipLRmu+9Ub5Hgvdz4Uqk4Q47Xfx2LJc+Yd5eDfV1UVU1ka4hA
	4YXl4T651cj12lWKavroTZ5/9Nl+dQLrJYknQ0lQ93wQnEFBAkx0D
X-Gm-Gg: ASbGncsRahr4ucHKR775pxoG4hxWsP0pAFvYO2B6C00+KO/gWWEZs71+m87I1kYF0SP
	7q+QhzrIefHStXTZjlMopJrG45NWZgZAcZpwSEhyX7psJwyWVA5BtxMKbYGw39L66DpJnP1e833
	bv7xT/o0q9fGlSOkeSfFo2tuW1B/2G3zTgrnbM3c01kWEGAFNhh9rYYFB3KlV0K9wLkGE/9Mou4
	QIKVsb/VBuQrV/AfLSPdlGZVkcwlg==
X-Google-Smtp-Source: AGHT+IHyxiqyIG1018vg7vc+mtcW6A59E8yUiwGYRJGG9KxCKw5fvAqslGiUqpn1l8NdSfenK2sicsLNKavqouk3DRw=
X-Received: by 2002:a2e:b8c1:0:b0:365:6b40:8656 with SMTP id
 38308e7fff4ca-37609eb8857mr54723711fa.35.1760353762857; Mon, 13 Oct 2025
 04:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
In-Reply-To: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 13:09:11 +0200
X-Gm-Features: AS18NWCBPX6jrMPcN6UDT2y68ZZSKL5gcB8CFxgIkLczrmPbcNs-ikNBr_vqb3g
Message-ID: <CACRpkda_BUvjBsrjG33mg-xV2_X6UACUPKRQMF0k8c76fSoS3w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8189: align register base names to
 dt-bindings ones
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cathy Xu <ot_cathy.xu@mediatek.com>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_040924_963941_3A775C5D 
X-CRM114-Status: GOOD (  11.06  )
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

On Fri, Oct 3, 2025 at 3:50=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:

> The mt8189-pinctrl driver requires to probe that a device tree uses
> in the device node the same names than mt8189_pinctrl_register_base_names
> array. But they are not matching the required ones in the
> "mediatek,mt8189-pinctrl" dt-bindings, leading to possible dtbs check
> issues. The mt8189_pinctrl_register_base_names entry order is also
> different.
> So, align all mt8189_pinctrl_register_base_names entry names and order
> on dt-bindings.
>
> Fixes: a3fe1324c3c5 ("pinctrl: mediatek: Add pinctrl driver for mt8189")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Patch applied for fixes!

Yours,
Linus Walleij

