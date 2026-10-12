Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C00CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=; b=Ar9W+7xgikYtFqujt0w6bY01ny
	daNmb3xwW3tH1jOFOceQ28GOYrXaqt2/nW65IxjkEe9JNsWx9sfKpuWASbV3vA8pC5IcAe84C/4V6
	zrSmSgNzp+9n1D/hyFK7JmwiL0CpPvs16qSwR0AjRS6JUrNVw9ee19SpveHHzjrlejFevYVNd5GyW
	UXeJGad78C+3Yv6ZZlnrX+3TMbohNc7s4S29KFWb3nIeK88x/3OCHkQJYSeNvif1Lmnfo4CkjzIuc
	goxwWkDK9rBU5CK8xodYecPes6eTJHGJ+CixiK8fjIzjrflxerd4KqHvy0H7WjZ9ZXk3nHEXdHsNu
	CZBphBqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCV5-0000000A55V-3mz4;
	Mon, 12 Oct 2026 09:39:19 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCV3-0000000A542-2M15
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:39:18 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso12108371fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797955; cv=none;
        d=google.com; s=arc-20260327;
        b=bUqw8IBtwiycwXNdewhcohjIbNc+A4pw9HozydLkM7XRwhd91S8XCGyBo0gnBsBxR0
         tUGbSFxgDd0JWxrbQaSU4ssUtvDjG74HqX1I3OUckaQvPLnYJW4yQetxi/FIqi0NyFRG
         p3CDzQacw4Tun/qB1HtH4Bw0AN94eOstNFqKb+6/jx1m4nPiU7ECYL8wqFpPffc+JoNF
         jpG3jt3ph8/TAdIUUy6HwjQI8Gbu46Xd364s4FtF4L0c9wwLLPH6huFmKbQ5XAC3pR2F
         1lh7IG5Qwiy1CtbmUI4Pz2H1cO6tRDo5rVWCeVk653JjYQ0wZkO9kPIc1mf4ICvHRElI
         utdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        fh=lTvaX0OIluFzPhZc7ip0aa7gpSD49/r7EUkQqil+Hlk=;
        b=Vunw+2SLvLpYHnrunXeOF/hV4vc5qdve6WuopMGIInC2CtFoedYu6wNP/+H/I7VjGf
         TAKXwQUnwviDS12HaLuDVxc3/h+zy/SluwyGsl8Up41EpudIzK/bAkoLZNy0xvbkQ9YD
         PRQq9clcIPJ5sQ4S7ORXYNXsPaGbgLESUrft590vubiS5lUOG/DMVFyEhGYdDYEmXd0s
         9rzKmYuZxk/JSsdBbcfkj3CV62B4CqpMMEB5idxIYI5zDgXsHgcWIFMMCf6VO0gDxfZM
         9d38Yp0rQllNb4xqoiZTyfIlKtZbIuFFC7fHrPgI9hRUqfeZHLkPqziwxvDkAisCaSjJ
         8OtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797955; x=1792402755; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        b=Ao2Vb+cFw7TUJUxAgh0v6oPb6xsAdlxg/gtaDg41/lY+iSTFUR7DJDQx6gO2olPdQ5
         KFWMuO8rLPB3tvOPQG4nqxPHEKlQ/0NsM7oDPGWXDJwIDbH3Q7+k7IxFJKFZyYeDOLCr
         +DXXwEfIkzbcuBg288gS7rCyyz/E+FWR3UH2dIRqzO8kow7D5WVyan2hNuSsURdJt2o3
         qXaXOPJnxSuIQS1s4xsIJEDjwJhUma+BBMjD3nDUsKnDrDdbl5RAYQBgLXuW9xVm9Z4+
         8YUpIF1n7hXTr5P0raEsEe8Ze2nK/bZNgu9ld1z/9V9zwfTNio2aHf3ErSsExewLJGz9
         Oigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797955; x=1792402755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        b=1sMDIvHFi4rSjPPHhU7pKww0apN3jIcA1YwbLC4DMGSqrq0vN5em9iG6anGBNcRULV
         NKU6nAhOFlC6vYp16ENoQaVWhGoOQeKrKn70dXfZ6t+uCNVD1ggEU1VX9vPRgPwMMbxv
         +as3pqFyz2L+BenR3prxylB+eZmVmqRbPhNCE26D7HeH/ODE4NNYic3DD5vY/EMRaToD
         TPGJXw9jAAgwFDMzWZ1IvS00PubJs/X7LeyOZMqHeq6J73C+IBwm0eErGzi0herAAzpI
         q2QrEcrdTGgWuoAaCll+CeH2FzN3WHok000dy7j0Xdc2ghvvnDN/hYbj2eqWKc26mfai
         l+MA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ/EVQmZ0yFxqoEJlyOVftXwzslLvqOEceDIaWEJUa16U5iJowjX9sFPTAFek8NQd3Jf3JDkAge42P0v9y7R23@lists.infradead.org
X-Gm-Message-State: AFq9FYLEO/Dw2hcl5CrjsQo5u1kwn26pLjR/i7R3S+SCvKoCH0WfdIkt
	Aam8zdJZlQHeW6jF1FVHBoM9YKACGESVER8G/95PjvznZe8qPiTIeDFT4i9We3mUT1vJkUASB6m
	jKehTP0hxr/+WRcd0BH9PTPF+0LgiPIA=
X-Gm-Gg: AYBFou0+gGipxVdTkxVm06FZCzU+rz1iC1iClqtMkfLGRO4pA6MMyyEmA3FIHb9DWeP
	6XIL7X9PsxW3BROUuygU3GmgY4YR4rzTcBMoIsxphmQWrJq/rtlzf0N+4gBKRC5HSvYkBC2E4Hy
	Cq/mna6s5+NXKUx2ejw9Z3vD/tplgTVGkHz8tcIawm2iQcCmkIghvT+Sm868PcPKXxMsOGgcwUd
	tJHAsnhArxuBADw+pXu8YpcElVOMNCfosjW/HtTd9u1gOIEOTNE44pCsVbZFxN6K3/rPqnUNTSO
	sUHo5z+Af+kjXnsouUBRkn3fvgYV2pExRCYY5y1PR3EIfYTMk6t798Hi2g3hxD+dZjgH8/zOCkU
	CP2b0P8ICfoJS/nJCRxWdkdcvdRPsM9RgkJqLa/p4fiQxFD15tdZu/ecehtxfXrs1iizae57ihw
	Tua+YYeFjpvc0XGncF7Czj2q0gNDp5yTBHqbVH9xsa
X-Received: by 2002:a2e:a58b:0:b0:3a3:7681:6d5b with SMTP id
 38308e7fff4ca-3a9c53852a5mr24148381fa.19.1791797955285; Mon, 12 Oct 2026
 02:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:38:37 +0300
X-Gm-Features: AclHuK-Z5wvwMJRFMQw1kYvrinOCHaZjgXVZjShRyJvcSKeeEwPjXo7VOTJgmQg
Message-ID: <CAHp75VcktnQVpqLADs5AccUj6U7KLjAatPaSzMX8SXDrbbs6Ng@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_023917_649431_410EC276 
X-CRM114-Status: GOOD (  11.02  )
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

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> pm_runtime_get_noresume() in probe must be balanced by
> pm_runtime_put_noidle() on error paths, or pm_runtime_put_autosuspend()
> on success. devm_pm_runtime_get_noresume() cannot be used here because
> its devres action (pm_runtime_put_noidle()) would fire on unbind in
> addition to the success-path pm_runtime_put_autosuspend(), causing a
> usage counter underflow.
>
> Use a __free guard to automatically call pm_runtime_put_noidle() on
> error paths, and disarm it with no_free_ptr() before the success-path
> pm_runtime_put_autosuspend().

...

> +DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtime_p=
ut_noidle(_T))

Please, split this to a separate patch and move it directly to pm_runtime.h=
.

--=20
With Best Regards,
Andy Shevchenko

