Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B09C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 20:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygh97KJaOA8UtdYnzEXDM6A1/XKMAz6u/wAlktP8kHw=; b=nIBsv8Sd+HFU3hMl24vr50ydlY
	E55DOdNsE46fN/6JR9IXu47JIuaBL9p7uytVjD+H0T9D8VVZeK0yO3hJlRsprZrYi7NFvioT5TmLT
	yqaWTP8DxHE6dwHUpxXIP4ZEHbU35YYxUGAYSBxEzWTPgIZgxabYtLSNmOlovwAK+/h1g9dLK1rnK
	4yb8bCvmoV8rTgot6t5ggVxKrpcY35YMSpHjoFUeBRMMzs4QZD5NfTdraC2zGWbovqcwfIiuREMf+
	0ggC7gMz/lnRAd6qcfJHyILiDlkluPjd0/Y4E+nEhCB9s8TmQVx3RDjspvvz9ILj7baUkwqNHLLxu
	xgLWR+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZmu-00000000xtD-2jOb;
	Sun, 18 Jan 2026 20:54:20 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZmr-00000000xsL-42u1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 20:54:19 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-45c9fdf2a06so1498098b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 12:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769657; x=1769374457; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygh97KJaOA8UtdYnzEXDM6A1/XKMAz6u/wAlktP8kHw=;
        b=F+GTjNwTBJSm4ZNHiOyeXn8QyRhmu0AUmdw4S9fWaCBKMRF79vu4YOEWYyKwCdbOLw
         4VJFqXRthSJVou61Q5+aLnZNJl91NG+TMXzQ+7vG4RVPlEoa0i0WJOphSvUBCaxDzYXK
         vSxiMgwk8Xf3hIEH5g/C0XbQ/BDnC7WBa0AsfTzhUSwyiSWkkeZKOJQCQqnVULFVIHkV
         4+74GpQk5N745tFYSRhKSf+kSsyMOjtrHXJcmJ9TstkdyPJbH9oqJng0yPsx6KT32lsc
         OQ0mm3T2OM4Xpz0/gO+1gyaTddCUhMUjSSYV9P2dZVi9DegV1vhDAAWr83WwUL09tYBp
         2skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769657; x=1769374457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ygh97KJaOA8UtdYnzEXDM6A1/XKMAz6u/wAlktP8kHw=;
        b=pz7ebN/2m+vSMzp3EmCbkbIStpJ0Ezw7jHNKt+TjLdeEGaymaoQGGSdI2lZRi4GdVO
         NYQmH3cfioKkudgcw1Z0TgEFY5a6Jii7BDLy+Hkt0yXrb2IkR1MJrVTboBMVz16YDTSu
         fI9vkKxQTgTvY9xnSZcF4ncJWkppEDgmri9u9J4ru8xlrUk+weffCT2bjjuJDLYON7su
         Wcvka8aXHvW/SkHsDG0cBMxbxfDEueqQn8QtyE5oeVYbhfu0K0bICv4ZYPfqo+A+Yk46
         DRFGUoCE+ZZoyJSRSeMzb7c6p4nrz/9fav08Fb9TMDsOfJW+vRPiLn54W4LD+Am+07+4
         c9Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWG21XHrseqJch0nyEmca3ECjPlaEQS92zYW9AG3Im2LgvpJOMFefIs16aaulSX+k/+VtYd0apVUcO7pOl/lvfG@lists.infradead.org
X-Gm-Message-State: AOJu0YwfI7hvsDir5/FO1S10dc3ZsIIKRqLuaOsay8f7yeViC91P9Wse
	VcbgEcZ7HJ/mVT2NMtIsbCKF54nb13DV1G/TbQnaMpFM6/7kI5jWTyWggfZX3sYp6hfHMKhfO7b
	krmb/msw/RJ8UJI8CoVWGsEORj75WiPA=
X-Gm-Gg: AY/fxX63Z71SF6HZupaWp237jwGimosiLweGTJv5+j73aOBZNn6CXRfADgllUznkq4I
	ht8LJAvlzrkF8VaWverA/IJhqZGVa1HKh/VA80aRAy0bSOKn9/rzDehRMt9AZf3tp2FVdBtdc77
	ZQudDKihJskkxUxq7XCULWNs2uglYvvVUYE0MedB9p7fpxnetVOGUiI57Gy9fX1Jq2nWAmvAZh5
	WSXCl1O/oM79v12WXQH2HSDFST9wb0qW0iIgAbeznBh5pQLVP38xATMaAiLcpCi3Ih6k0Qx
X-Received: by 2002:a05:6808:1207:b0:450:bb92:7faf with SMTP id
 5614622812f47-45c9bc0a2bcmr4748942b6e.0.1768769656918; Sun, 18 Jan 2026
 12:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20251223120622.4316-1-lakshmicar.2023@gmail.com>
In-Reply-To: <20251223120622.4316-1-lakshmicar.2023@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:54:05 -0600
X-Gm-Features: AZwV_QiuVKs-lRc7NnS1VBN3NacVFSuck_o7LDKz0h9ZZasYOZRFJix3gwKAb4s
Message-ID: <CABb+yY0DO-e_c5Lf0T2-xP0WJYQEX2AcMgjOefbkEcuSXu1mYw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: cix: fix typo in error message
To: Lakshmi S <lakshmicar.2023@gmail.com>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, 
	cix-kernel-upstream@cixtech.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_125418_001982_948667E5 
X-CRM114-Status: GOOD (  14.69  )
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

On Tue, Dec 23, 2025 at 6:06=E2=80=AFAM Lakshmi S <lakshmicar.2023@gmail.co=
m> wrote:
>
> Fix typo "overlow" -> "overflow" in FIFO overflow error message.
>
> Signed-off-by: Lakshmi S <lakshmicar.2023@gmail.com>
> ---
>  drivers/mailbox/cix-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.=
c
> index 5bb1416c26a5..443620e8ae37 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -346,7 +346,7 @@ static void cix_mbox_isr_fifo(struct mbox_chan *chan)
>                 /* FIFO overflow is generated */
>                 if (int_status & CIX_FIFO_OFLOW_INT) {
>                         status =3D cix_mbox_read(priv, CIX_FIFO_STAS);
> -                       dev_err(priv->dev, "fifo overlow: int_stats %d\n"=
, status);
> +                       dev_err(priv->dev, "fifo overflow: int_stats %d\n=
", status);
>                         cix_mbox_write(priv, CIX_FIFO_OFLOW_INT, CIX_INT_=
CLEAR);
>                 }
>         }
> --
> 2.25.1
>
Applied to mailbox/for-next.
Thanks.

