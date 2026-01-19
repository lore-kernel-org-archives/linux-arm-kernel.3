Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E3FCCF2D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=; b=mEF8aN/rHlqC8IA1mnU62tSYE4
	HS0N0Y5xaH9JtPQmaDIGNrKXxVOWsLZgH+uekTHIafjb4MEK0X9ymhNZAOt3ZC9COlPNlKYgOPD9F
	u6Pb4ozSGy9gm2xoYB4k0jconvBthW5vC8l08fO05M5Ihowasv1buJIjixeZIxNQldFs6Mw8dex3+
	LpSp30niO6p1XZjGe9hM1JQB365YZb0EOkyjHNfmD0jXHjvB3gxkYdJ7kLOZLuPC3rmYFnV99K3CR
	P3HYK6kQrxKNjWYbiRLnpB7/mqgBaKq0cnTf0d/yz/fev3tHN4kLRBWy4cY684WK2ZnUdgvg33fFz
	h4YYLH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmIx-00000001jpY-36MB;
	Mon, 19 Jan 2026 10:16:15 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmIu-00000001joJ-3s2B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:16:14 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-121bf277922so5535598c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:16:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768817772; cv=none;
        d=google.com; s=arc-20240605;
        b=HPY9nJCqItM2+aaozH64+5lAKEgmUdgdBWv68PkWrGYMhlyT8JjZlv2Wmyk7olpxM+
         dnyokv0N6uksbtfSqBfRRvzOzbapbE4gq0ueI0nCnFaeaL1K3j9Ft4tPhOy7ACoBCc/a
         uUeL4YdQUf0sVMA1YoxdMGgYSWC1WQj3emuEbzXLK92MwvVXt2xONSsHDjYTpJ+uUG5P
         VAWozYHHaE6HlGmk0cCsOFlOxhWU+s4Y2HMn9pXKaagxQ9H2S8rFpDOpF72tFCDAZjTf
         tfNpLk6aQ8PgChe+lMZHfAhSpev4j6pG8j8gK9MmwMjsQba1uzwP2PSkHfDAxRhic1id
         Lxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=;
        fh=tyOPkTyaoZirotuzAPlxKRdu6YHwemvfvW1RlXWa+Do=;
        b=gntmXX2mVocdkqlh5sfPc+owzfDtUztaRDfvSq4/S4TbcpCLXTVDdo5zTlN25oEmK4
         paRY/OQ0K+8Z38fdjs5kS8jLfkHFph/iByUVcGUlJCip9APDJBUoz+5ufU2YmF+YORWw
         tg6hhfwljVlKdne1HVF7T/Kn1hl52oSmHOIeTq3VymHs8NHSIybsgJJa4MCMLzXyhM5u
         PMIJ/pZ6z1/alctXAKdCT4i3N/m6mW5lkeSrV0B+hxVKkFcCfVQfn9DZK0rnKbqy6JVd
         bw2tHDf2GXfcOyPgRiIoFKa/37/aKtZsD/R4+h4bT/Z7m8b8qikB4oDnHS4wpK8FEi6/
         ZgjQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768817772; x=1769422572; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=;
        b=a3SP4x2xDQ/b+mYcF1RusB2EEqQgClfp49qIFZF+j0ZjyFJafabxetAKwWlIxmBpsK
         ysWRaFol8vrbVi/k8r312KfeTUQ5p/bsddROqv1Rk6KhuklSciOoKxB4tfbKESbof1DS
         FjFRy7pc9W3hg4zeB916tuQMgAUQSEIlL3uuNtCJf8duXoEGI3m5NKVXjseCZRLRjn/O
         OWnFkxDeLFhNFgK454pV/RzG+uq/J2zoVcZlUmUgMPEub4Atkh+wV0SQgSX26SXxfTDy
         QizgRbLTSYl4dv4sREWqs8T9ESDUIkV/R7rxxwxOTazSfKXZBROLTr7e2Y5M6H+iCUNL
         24KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817772; x=1769422572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=;
        b=pkucAlz8etYpRR4KGHht7KNlZSnh5a9ypWT0aIIutebZB/oIfzKtso1GNqlOOj9yZl
         3N+mCSvUPIGRk2QRlt8fHa7lak5wooH6bW880Xpa09z78zgt7mxSG8W7lEeYYulUVbZS
         8ajdZyMF+jdvRXJia8YbMLjLk0Jt/0X3jfXFOWNSf88n92BfDazZDJN09yNKcBXFIJgG
         wwEqaa+AxPBUsJzim4M20q/ge9yoq8G4s5VvFpyxp2KGwsOxJIMfLd6o8zGNqYpfGkOR
         +t8fqaynQciiCqc4UNFQElthdL9jgc8qhIE4/nPYY5iUKk7AdTdXGa1X3wW3scnDgJxM
         kmdw==
X-Forwarded-Encrypted: i=1; AJvYcCV3zg7mYUdpjA+Oh/nr4Wqnrr70IslXxljW45fHi1jk8TWNgputydWoJW5F/jZW2biKzf9nXfQxXG8N4sCdQTWA@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt4Fz+b5IHWtC1m3Mwp9fGsrZqPvfqy7jgPLEejxXuyfN6PScL
	etZSLzD89gQ2R9zgtyO+GyMM4Fn7+/llmRaVcbcIPWu99+iR6mSLKGsS2hAU4ffEv8Oh3u4Mjik
	zY7ZMDAmhjf5cIbJAyzgHxsVxUIEeDHo=
X-Gm-Gg: AY/fxX6sZmbOUoOcq7CdOdPBdGWqLX2o9g0+P0qh6Fc7YVOQ6j7fxvIir5On5WMohK/
	GehUaN+aAJcsi81qPXTyoO4u2MYB0GYqxLq1qZ0kQpNQZSBi2yPxWYERlMymKU1/QHFo2UADZqJ
	NLi1t1Od0MeOmYqP0b6TSoswvZwmAe5JClIrgXEigkx8jaI/Cs9uyaMZFBNNq7UQK253KKJM4YL
	GDMx48R+jFtKYDZJKkv/CjTaiBWQK+ni6Kz+8TIgIJNFFTacUyfI+xxVj0ZO8XIKKV+IQ0evwmi
	Vf8IWoLFp3YNgZg4KNwlCw2sYpodI8aDfZ8IETWEkgvZ6tSYnCCJOa2zULSNB9R0SeVCP+UALMl
	Yofvr30ORKg==
X-Received: by 2002:a05:7022:4186:b0:119:e569:f610 with SMTP id
 a92af1059eb24-1244b3050aamr8034972c88.9.1768817772025; Mon, 19 Jan 2026
 02:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com> <20260119095511.3030739-3-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119095511.3030739-3-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 12:18:51 +0200
X-Gm-Features: AZwV_QixVtScRtb2C4OPOYIUU0C3OQvhdNUPWS99N4NE6jCxi1_9ifc9b22NkVs
Message-ID: <CAEnQRZCm+r3TgvnwsYTbiC6K4ODGK=rCCsi-LxXq=EMtMAndaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clocksource/drivers/timer-of: Remove __init markings
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chun-hung.wu@mediatek.com, walter.chang@mediatek.com, jstultz@google.com, 
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com, 
	xuegang.liu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_021612_959741_6E7A12AA 
X-CRM114-Status: UNSURE (   9.24  )
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

On Mon, Jan 19, 2026 at 12:00=E2=80=AFPM Zhipeng Wang <zhipeng.wang_1@nxp.c=
om> wrote:
>
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>
> Remove __init markings to allow timer drivers
> can be compiled as modules.
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Acked-by: John Stultz <jstultz@google.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

