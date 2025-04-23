Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFFEC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 12:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=; b=Zn0lrYRCiLnBkpqJtz4/szcUB1
	Vl8jTzbR/jLtsHuajtnJB2WCjnb1wzx4065AgTjOGAflvO4dX1H6mTwQwdccFZlsivVQUDkZNHf0j
	TxJmvm4Q/pbSv7uvzOeFFOWDDgWqPp2R2A6XcGF77uz2bSa5kAaBUIcemuIDqvVuElFAbaN1fH/7Q
	i2vwcXVJgksj8EIfR0EdAdxUnS+W9SdazRwwOmINAV+eeGVo8jDhEkDQZDsPWxVMTnfsEkCn9MrAe
	ZXqQqMK4HrQ/TUpBXyoOOYw6Ub5AYN5XSruQqA/sSR0gd+wqdk90nPBynNw9h5FPrwF5cjs070m3F
	t8Ecfsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Yoc-0000000AQ35-05iN;
	Wed, 23 Apr 2025 12:02:58 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Xpd-0000000AFRi-1YFe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 10:59:58 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso8139672e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405996; x=1746010796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=;
        b=QCqu/1h7DwMJjUnfHk549TkimxeqW6SNV5xdW6dxmDB/QL1Vz6WSC5U1ybzWe4Fl2P
         dux2rq610cqVUe33i33tlOV3lbGJ6Z8SdIe+exGMebwvTrh03kFUmAtW4Cy7kCxaNr9p
         aIIcVaovxU1yzIgAIBgq1fFuTYqjC+oWS6WD7XUzmt/NNAq9bKz+eRCEptZGVHPHEK4q
         IqdWMZwF18k7accfwS3SQy9eqd+L2DQVRA7pKFgKNBJKdH3dHWQCM8uYDQvOPBYmqp62
         RXhpCwLB3RZcWLQCx1DQ4zQ+/dXla7n3Yz0cepQDiiBBhqX2ibNKdsS4XNfnvqn9usCP
         RF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405996; x=1746010796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=;
        b=AYOC5Roh1bJBK0dmTQ79PeyrqKP+w9I8FTOzgH9mMJKb3nUoCadcYcc5yKxR9a7qt/
         t6lDT5nGMhJlWO1KvYeJfatArCRHb9vUDI+1q6ImNY1YIrRYjUpBR4cjPxZ2Yo//0r2L
         eTugMprgbPrCl0lQTrYQruPQZ1GahaRF8aUds6yChFJUJU6uIpxzle+VQhMt3almce6/
         bQ/Uublhu++DGjUbJDd8/HLS5ErcvOacO4jiXqePZ7P02PfwpfWKUsIRLS5PpPun6e/f
         iv+sgvkJVyqDIXgGKa5ctbRSOwi59X9Ulj4k021LvxZ4EJHWBe5zGFwCd/JC0ng20pdo
         CtGw==
X-Forwarded-Encrypted: i=1; AJvYcCW2DUPBDCvV62rjZOUBmsspsPxyzee6GpANhp0LjPVwsweKH6nwDmWbfLhdEI9Gzz07TK0OrJgHWLRYafc+n8Wk@lists.infradead.org
X-Gm-Message-State: AOJu0YzOFnWYGfHMy4mm3weItvjdcEMiwG+0zZwqBTxcgqOlBQe5BZyZ
	KzTi8g61TPFvIqZJUYYYAdK5fxzPrvOHjkliby8l0dTXzqcVZgyhjvHBLMzg0iFtturRPJttupe
	QV0BnvmoNBpwLTLz3ukif5WXlVabZDAqr3WbiYw==
X-Gm-Gg: ASbGnctGq36tV8YZwU0BMv1nba5NDQ+ZYhZiwvIMbXNNPFmOGtHdW2P6EK3uBjEsxw2
	gXRMI8f2TUTAwYA/uGkCoHbDT7tHiFzYAQuon6S7X9+hVFp+ilR2/vuoEqx/Mi4NiQ4hQcFpBnE
	oIvn83I/7yZZZ+OpOHvkegtQ==
X-Google-Smtp-Source: AGHT+IFtzLtF0BmAxKelCLV2/wocCla2vyxucaLxjvgEw30Sch51eBsux5LzRyNp/HGiwEeiD7kURWUr//rXX69Cxn0=
X-Received: by 2002:a05:6512:318c:b0:54b:117b:952e with SMTP id
 2adb3069b0e04-54d6e66cbefmr4418385e87.55.1745405995686; Wed, 23 Apr 2025
 03:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <aAijc10fHka1WAMX@stanley.mountain>
In-Reply-To: <aAijc10fHka1WAMX@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:59:44 +0200
X-Gm-Features: ATxdqUGhq-8Df0lmzkXAKLmMqiEIc6uB0ArJmTsIwn6uONHy8hOiVyiU37DBzSI
Message-ID: <CACRpkdbLwZuFKqLvdkuCodQrNb5h-W9567eA4CLOP1FrV+PbZA@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: mediatek: common-v1: Fix error checking in mtk_eint_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_035957_410794_4DAC67F9 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

On Wed, Apr 23, 2025 at 10:23=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The devm_kzalloc() function doesn't return error pointers, it returns
> NULL on error.  Then on the next line it checks the same pointer again
> by mistake, "->base" instead of "->base[0]".
>
> Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on =
older controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied for fixes as a fix on fix.

Yours,
Linus Walleij

