Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C9ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypTR+U6CbcsupTqnlW9WC9v+pxZ9wGorAvOqUL63jvE=; b=AQFoJ8bK2Mwyj0bsr0YOxPeKa7
	8TvVkGCRpI7zSq8KflHPnU93dufbi7UYb/s8GmyfzP/EaaoYX3Hx+y+VkePc6pqyPLvLaV1jxp1wI
	6SchEd8uy4dG18GwnANnjjkThkBncVtZlJ66XF+YNBQ4ln+LvJP9RxCDKAToP0XchMwuVe1TGtYqi
	poT3JY3CANXw4GUbjez+DccuXMHpM/GX2kouYXSndq8Zlb3wq2W82ILCcrFJjUaNAN59qGy4JrkBk
	YKaQEQmhKnhY76gVCBVZ42TxRAgwNDXu2d9Pc9290MMvoRKw7LP5nmSLTG/p30CEfQMnGRbPsKEY7
	BmBOkucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GPh-0000000CyxJ-2aUr;
	Mon, 13 Oct 2025 11:08:25 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GPe-0000000Cywh-2yJo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 11:08:24 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-367874aeeacso43311751fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760353700; x=1760958500; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypTR+U6CbcsupTqnlW9WC9v+pxZ9wGorAvOqUL63jvE=;
        b=Vc0NXzqtyK35G3NRnETv/xKg4KuQVbCA6593BbP3rqhP95EiKyWOVUazfUN0N//MCP
         0Klox/fbdVpMjbfLKcaCIIDKPWzzXTR6L2taN97dnlCacDgYrgYSNQukqTqmOdPJ35zA
         dcnrzYs8OT5nTIhrad+gOFfrUqv1iFxENLdz/oYfKTX3eY34+30xSszv6MQVSCXagZpT
         2ccq0WOAbdnt3yybG7AT7lg/mOv9kYLP+H8KBNbqCHMgKYFBe2oS495ecRtehOhK1ITP
         KqRZ1uGKvskKX2lsBfpmE1FAg0d2DDLWHrLbMbiXlWQkBM5QOjoPygfVvF5k755GAo6t
         PdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353700; x=1760958500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypTR+U6CbcsupTqnlW9WC9v+pxZ9wGorAvOqUL63jvE=;
        b=ZxoXl8pkpZnHq4s9FCjELtVT/dPufV40Ed6Q/PKOOdKlLI4v3nPzHiyr+bXu/fQhsq
         XRjzdwKAqxmy+dq9fhfHNotWZtlL4Q7La4VQ33IBCEKvlrh2/ljSY8TA+N/Rkv0+Hg9t
         IzHk17m0b1cB/60vN56KxW4qG9zV/amxgbr+aj8xffvC4P05LUjnFwIBMDBScDXfcDJL
         7bXRswKCoChwSQlpZ/WhljzDjBrvGV598NNk3POw+gYLcTj0PEEDDM7z9Gi1dmC3bK6F
         uh2SYrgvs2C2jHsD5P6jtQwKDl+B71BVX1525Bth9a4qFSfBzfRjr5mS3V8xSpi71/De
         TK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvhXLiIJJkV1bLGdIyOkYSzX4b0eWy/IGU0inzp/hX/K6ZaopckNJCM6LJZqMGEqhCe1BH3ZJVO3LJ6II1xaaY@lists.infradead.org
X-Gm-Message-State: AOJu0YywgicYNfTCpBRF5dp9a2GWW4fTQ2brpcCzpfRaeZK7LaSFIcbf
	v5nPKMabk5IQJtTWb2AGKGeGGlGzhQYHWLAjQonkWmAF3zqphPLDgk6yL+IFqBnUguG/anmS7ak
	4zQZh7lT8CnvzSJQIrRX4osLNyW1Hqoe3jK9ZKMb8TA==
X-Gm-Gg: ASbGncsXivNbRyyxLDDr0djvs0LdTBREs2a52UtagwlEnzB0tisTZssfMs37U14LPee
	ntQo+jPpCCmAwWiDikPONeynbeLF/Nv2PgsT1wW0eGaH/0nLT1dcRzkXkqRVeP9Te8/635ivNDZ
	X0vfX4mfXgjnGLYp/Mgu67tzulpIPVCfwOlpn+YKGg/kp+8x4w3UJifSvo7F8vcAXQaiv2aYjhH
	nkA97TIz3gvfHpVFl7SSgFm7l2T1Q==
X-Google-Smtp-Source: AGHT+IHtdCLd+4uJh0pbUlnFA7Qzu/sxrXL4iOF6wbwTfZv7XTlOSlg+VqyDSfbt690MZKi6vF6Z3aq6/nvgRVaOgQc=
X-Received: by 2002:a05:651c:546:b0:372:9f0c:2158 with SMTP id
 38308e7fff4ca-37609d927d0mr46661901fa.16.1760353700507; Mon, 13 Oct 2025
 04:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
In-Reply-To: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 13:08:09 +0200
X-Gm-Features: AS18NWCm49dSzl3HawLMJssUJLSTrG4CpecVW6MUgTtkI6_u-J70Cy8bMmd9g7s
Message-ID: <CACRpkdZvJ3jvoxi4H-PL307up1nrvL5hNAtWTrwZGwNW+i8Lyg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8196: align register base names to
 dt-bindings ones
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cathy Xu <ot_cathy.xu@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>, 
	kernel@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_040822_755269_D623ED45 
X-CRM114-Status: GOOD (  10.24  )
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

On Fri, Oct 3, 2025 at 4:01=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:

> The mt8196-pinctrl driver requires to probe that a device tree uses
> in the device node the same names than mt8196_pinctrl_register_base_names
> array. But they are not matching the required ones in the
> "mediatek,mt8196-pinctrl" dt-bindings, leading to possible dtbs check
> issues.
> So, align all mt8196_pinctrl_register_base_names entries on dt-bindings
> ones.
>
> Fixes: f7a29377c253 ("pinctrl: mediatek: Add pinctrl driver on mt8196")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Patch applied for fixes.

Yours,
Linus Walleij

