Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33880C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=; b=PiCz2MxooLnzq5G8syzyMvAAxT
	zJt6R9yvVHiG3/R5h632Cf0wmyrnoJgIqqlMI/TOQgY1XdjXsQdGKsiyi+k/SI7qcGRm9dliBo94f
	LQCkqG6pzOpln+HVagfnw8eREg7MEntIqq7LB9BnJuYGW9f2+f3U2pQ8g20/hWD8ppKrAgPYFg+Q3
	GxbEj2Ytw4MoPN/0Qxp5mfzCDCU+dgq68y9nKNgMu7HkUmYuO0KDO/fm1pxXRdM1FKRLn2kN6FtXn
	ETnMQeDU7cfjMCP4KyjK099ay1IkuZqzL/urSWNQeksezbVmLdfbjI4SAMQzAMeVdfrBPESW7czSJ
	vJZ7j2Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gYy-00000008yu0-3iRV;
	Tue, 29 Apr 2025 08:43:36 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gUY-00000008yB0-1lyH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:39:03 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30bfed67e08so59859781fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915941; x=1746520741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
        b=oBLNERm7HA/vgrdybXbBDHev4+NTSfs4I7/gS1tABSLqPu8UKRHAMJUXoox9u2cnyM
         lDZpcb16ojGpceoy+eWhc7aZnQ9w/H2/D0kLLZmOME6Wa8Mbbb4GsQiN5oUaDeLGEOnt
         WLnLSEiYopo/qf1v+3jRqK1zCZj9m+esOuXp+2+PLYUNjIfzjmanVWiNhL6mehhd3Gd+
         tpHqR6UxYVQHZB56a5gTSiqePDqe89NaHGbRsHoC96wlwyUFI03qZ9RaFCO/Kx3d3Rws
         LQJZOdj6oSO6wwD1YbUcpwntPx6xDwcYJA+2zxXeUva9hsg7HRfZCykbcnJnpLmrB1l+
         SF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915941; x=1746520741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
        b=N3aNti4WyuIasqIL5ZZuQtAr4GZ9IX5Ed3Mk249o2Qd3qHAfJdvFX0YzzeFfBNVmHu
         gswFsTbn+5F7jxQCz8i2bsJg7j3U10NXQy5gx0KMswZtQ829B1K7kaClpFTCEH/cEAaF
         gI6uQmm1VhWLiavamCfoU+gQHbdVoBDipj2BO7Pg6t0GwU7Ko/6GfySPp04YHaP6Jpjs
         VaYPeYASc4QXvzHUOXUq3VfzU9107Td8r2MVBSIFQY6zB1JGQchgN9mzrn15KKf15p+1
         7tpkESQhDYgeLT1ljpkE8XHMCCUljk7xlsb2wKJxFv7JMBZNZgi+ZeE49fH4p3JRV06V
         i9bA==
X-Forwarded-Encrypted: i=1; AJvYcCX9Ae/58FLZDpBvQUNZvJ+DJzqRJxK8Mz/MnhayQaOueWeYWjpVmR1qi2kB9MloNO+F8S9fyry768y7joZ9MPLd@lists.infradead.org
X-Gm-Message-State: AOJu0YwYj/Inc+h3cKOaPvKr3IjzUChydH9zFzoSk7H16rwycokUbp2l
	pkaG2Lv6duxExPcn+SJIP5itzYEuN1OwlJ1m+UcZZWa0uJORc8LpyeXdY7tm0FAhgBXMr1nwyIl
	3cryBmHo2ZmgD2nwFsTr63bg8/HINjvy8fwi/ww==
X-Gm-Gg: ASbGncvq/fzTdda6jE49/H9agta++mx20wcs28d4eDPP2KfyN+KQbk3Ws9vF6HWYHYC
	Fc+c5hZkbscmnKQZ8MGZjugy8ThHJUKniqc9FSfKG5XtVtWwFcxDq6kuzW782MxyXC82I5Mp+Zx
	o4ctAVs1BdDhtowNra8gCWWw==
X-Google-Smtp-Source: AGHT+IHkuz+Fr/AzkwRns1/8PwMuipfYmUnKsBB7y+2XYRW44rUzmChg+OFPShozfJlNPd9b1oQDGXqsThys/IDroaE=
X-Received: by 2002:a2e:be88:0:b0:30b:c569:4665 with SMTP id
 38308e7fff4ca-319dd7960aemr40874831fa.29.1745915940769; Tue, 29 Apr 2025
 01:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250424131201.157601-1-colin.i.king@gmail.com>
In-Reply-To: <20250424131201.157601-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:38:49 +0200
X-Gm-Features: ATxdqUGYIHeg8-bt7mFBhXIoGyjQbbgQkhokYrl1ZFztjgdxtKATBXtQXvjtsjU
Message-ID: <CACRpkdZf1KgnYKXbCWEWZA4Cd748HBHDh6Y6f2OD3Oyshoe6YA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix sizeof argument pctl->eint->base
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_013902_465630_AE30DE52 
X-CRM114-Status: GOOD (  11.37  )
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

On Thu, Apr 24, 2025 at 3:12=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:

> The sizeof argument is incorrect when allocating pctl->eint->base, it
> should be *pctl->eint->base. (Generally, the size of void * is the same
> as void ** so nothing is breaking in this specific case). Fix this.
>
> Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on =
older controllers")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

The mtk eint handling has been refactored fixing this issue in the
process (AFAICT) so the patch does not apply to my devel branch.

Yours,
Linus Walleij

