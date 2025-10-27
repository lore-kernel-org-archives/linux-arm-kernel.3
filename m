Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4C5CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXGvcp0mAGNWE9aZLpOmWkJL3jKzf6jiVNyhGirW+KQ=; b=jdfs+GcdC9IGhmxHzrDjh9jAFb
	eY67gO2llUMXQaDdLatTFqD2Awz+vmlSnt3yrCXXveYeChUdEt/Ad8Dx+J1Ao4rVTRoZOs6KBWBek
	xtxBc1vn8mA2HczMGMJemIrJFgEPSKPdJokHFkZbaX+7dO7kxOtk7rkic6rwQJQ9fMXXMxTJu23Qk
	iwMI2HV3Wd7az27kfplBAfBII0ZM0nwCHFqQ0SPucEFrWzQPiIx1h+Q81N3ALb9+Gaa/XFw8k4xz1
	VusSyY1PrnXewXtuO7UOb3SQvQdvm5NnSzwd8OzA8jO4kBmFFMPhGyeQqbjJnxTo0ZaI2CiATWniC
	ST0y6eqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVc1-0000000ErGO-2VXJ;
	Mon, 27 Oct 2025 22:22:49 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVby-0000000ErEj-3nwi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:22:48 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-36a448c8aa2so41779901fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603765; x=1762208565; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXGvcp0mAGNWE9aZLpOmWkJL3jKzf6jiVNyhGirW+KQ=;
        b=vla8Ar+KYIju7X51Jl5OyjxwyZsbgwY5seF+zbx+LWrTFA6I2sk0BxETZrJc7V3AJP
         tyw56kttd9oX9/kcAReIK4OGPmlYN265kTg/Mg9elnHSlWIDmWQqOHZaX/rghASbGIjf
         k++X5all6Bv9QcK2P8B1IZHIIpEG5tvxFKS2BroLCpJUvnv+n54N+aSFwUiRT+EFq5Px
         g0cg8WxpAIz1aBEpae+7EihwkMYQI+yJ3ytjcmI8ZihKiBTbwwRuFqXCidol/hoh6maA
         tlyaUZxLiB/vhHvOUn/1kVlUpsUYLKWync/acrG//sihVJEoeF/c9urndPke83wBLQdZ
         e16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603765; x=1762208565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXGvcp0mAGNWE9aZLpOmWkJL3jKzf6jiVNyhGirW+KQ=;
        b=OMq18c/5YAkDTnvGUly5jHHRXQCdm+tKGneR6GFpdKnMDeqnOEQOlkmSliOHh5WtN3
         y5TpwA8u8vFBvb8v+oL9+WgzNoUBf7ZtIOnbGVMmu68FUicoGGZmtj5ZdL0HW/8voG3M
         MztaYVOjwhFflaPZR9QqXMN+CJZSRWiKLBj2vUDSLAD4HCqSWeZdb8rdkU3HQF47wARG
         QqsaRbjsx9lCj/8ZrjsQ8A9Ptj7QqX2x7tZ/ZbOovnimIq4CmFVnHBXvszboxUtocX/m
         6fghhqgOnuA8nVI2GbEGGBwxNTzIZo8RDcdvXbctflRB8+b3LYcEQPC/859La28ovo1g
         eN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWg8+geto0FlLrW2rrZJTr34IAO6ZPB4slp3zhh56qdW7agIK25oW1nTys3k3cJ2p8pIcVxUNBp00aQe1jDw9u4@lists.infradead.org
X-Gm-Message-State: AOJu0YzLavdp3p0F1nEhtjvz2+dHp6b5gJQ02uRHwRnyahlsLvW/sdYR
	T2ec1SWn8udI/dxm9OAyfHuB1uPIUU0SbYQUF1nm3XLlgjPGWHvC2gvRtGXDBBUqOQ9mPQswqCc
	zEOv0/O6dUMi51EQUxaixbKksPRYsUoZGOBTBkK8UyA==
X-Gm-Gg: ASbGncuESgQO1UbokfqL/aNXs8hs59mP6gwbV6++Lr9NN7eNRhEBfazLR7GSgLoZVhH
	3349MTfuSexo7OUe69AseSchoJcjihr3TjBFd8g/iyH4kosaJxwGcOH2xwVZ+ze+KjcCQQeDrHT
	gebYidvHXZfRGhfuYM6kEXkJUMB3PfvjO0bYieWu8Zio0rCWv7UQ2o8nfuvD/tcFMSNrIza6vwe
	JlvfxgK6LEmbt+JAPMtSZRiI4+DlhyLl4ooTEjlzXdbtMDr2oVWBmpYSvH+iSgIhxkBJaM=
X-Google-Smtp-Source: AGHT+IENAbbZLs2cyhX1NG2TDFVr4DwoM7AOuX8MbllL6Bct/y5S8yxPyMTw8+JJ+2TJ6jnQOkcpn7hnhHqJSRfElWE=
X-Received: by 2002:a2e:87d4:0:b0:376:4c71:75 with SMTP id 38308e7fff4ca-379077ddc2cmr2613171fa.46.1761603764869;
 Mon, 27 Oct 2025 15:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251025162858.305236-1-yury.norov@gmail.com> <20251025163305.306787-3-yury.norov@gmail.com>
In-Reply-To: <20251025163305.306787-3-yury.norov@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:22:33 +0100
X-Gm-Features: AWmQ_bmkn6Wyph29A9p5imLlQFIsc9_UvxXx9DMK2tf4nubU3-p4iTlVFjOP3js
Message-ID: <CACRpkdZZdBL4ii-ZR5ATOx-GCw7Un8vEd8koqWK7cbgTXNPmBA@mail.gmail.com>
Subject: Re: [PATCH 10/21] i2c: nomadik: don't use GENMASK()
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_152246_951526_12868309 
X-CRM114-Status: UNSURE (   7.69  )
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

On Sat, Oct 25, 2025 at 6:33=E2=80=AFPM Yury Norov (NVIDIA)
<yury.norov@gmail.com> wrote:

> GENMASK(high, low) notation is confusing. Switch to BITS() or FIRST_BITS(=
)
> where appropriate.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Link: https://lore.kernel.org/all/CAHk-=3DwhoOUsqPKb7OQwhQf9H_3=3D5sXGPJr=
DbfQfwLB3Bi13tcQ@mail.gmail.com/
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

