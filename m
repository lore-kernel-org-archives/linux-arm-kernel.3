Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5954BCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=; b=o1n5o+9TSnwnVJ5zf60HRsYD+x
	8sZ38uFReXYTSw+D5kZTsOLZeDfl5dEmCidurPyOEo2nO0y3rICffeQhTxgV/Pxd6OHgF7tXY/o7r
	a/sb2xWtlpsOJPRT06W2u97yC7tTh9eRJ+C0dp6ZQabGXLKHQ2Zuce+D25aQV5KWbTk6nnvNaIRLf
	MdOCC3Bph9EZ+40GC1VjpwlJJv4QfIyz07QtMktzmI/J47bS12xYb5Xdv4zSo+dYw11WQNYoAQ7Y0
	UDhCRndx8SSK0W2fUjmhVFIvmKGk2Ne6tWAtUa87PuYjDi/FeD1SaBsvo8NNIcmhlfVU9yfqyWq+W
	SLoBNweA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFGZ-0000000CYuN-1wDG;
	Wed, 10 Sep 2025 07:29:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFGY-0000000CYsh-1S4M
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=; b=UCWYOpO55pvcSWDdwz+B9pVs2F
	BmR2+8bAz3nfV/5YhoF66Yc20Wu0jqiBOhPFuIwXxTNh1F0trvMjfImMQgk7HQTrZpMq3fQZjkxt+
	SvssjoNELHWt8KmQYemCGPlKTFoCdKuLJkK2Evu5XjSLin7QBBCOgxTzgjFWCVUcBPCu4xJnyawpB
	6wWFhqNdwpg/kYmxZ0fDkt6/+YgS/mIuyvsh0rOutAqjTNBNagM1W8iHlgR+VLMs7iHSPlgGdNWTl
	zfn6SAhDstE6XSE2BoDuiBC8RkTXBTAxANBFA0ReMtE+ESOP0U6ohqTKtExJxZxbc8TQnsS/Ej6cC
	2GYVA2oQ==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFGU-00000005lGZ-0Yi7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:29:17 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f98e7782bso483182e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489352; x=1758094152; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
        b=cN8QsvhKILhBU7aDpexJCtKHBnzhf3ViXym34VfmTNzXZNmDkInQ4Y0Us3b8Nr8LLD
         4Suh69d3kMCBcQ+EB9+EBDuFAZLIQOqRDjAOHskyj+Rqt5U9xWdvRsdwkRiceaZyg1Oe
         84LYJnhoRAOINpDanAaEg7rPstx4GxgkRkWgFsduIt0C+04SEoBNg2yVAYL/8RzO4Fg6
         ZOuvzbq4uQAgwuCgNPyKR6/oPdeNGcvKAm1Lp0MH4DRzkWKdNv9/cEz5nQHJLzPMIqsm
         E4Gtw7Zld+PWCqnVolxKTfrJk7IAk2kzTp82NrFcGjrey8V9adE+yvkQMMtvebqoaR3e
         9unA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489352; x=1758094152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
        b=bYoggD6YSqXwYin4bMKBqOEFHan277MDbuGjNlm05qELUoLyjLS73rvjCfZuWjtFCo
         ng2Hx7nncjwbEbKtvNCJjR01B4CiYtKSbt3ddUUPGTwySAdyvx9ZUuNIgU9rYfWhBm9x
         DWY6fB2b+0VjY+zkIrD9CnYA6V+7EbX19Lr+h0KfSOwW0q2dmCRHX0buCGiYH/ReMtFL
         aI/OHXEBbYt+649wM8B7xVe4huBuQEnbJ1nI1HznMzj0pF+eZYswLbIv2yjQ1hiVbxfO
         OUbZhyGsjRfc4zVIEt9zXQYTLMzqsYRkiNGTeE5e2HwijulOTpvw2XF324cONA78Otye
         a54g==
X-Forwarded-Encrypted: i=1; AJvYcCVXNMfOE5DdrjBM8i1Lei7slRw3ZvQ9Fs2mPduNxPU2GQkfOJ3H7WBxwt8J/F1O/M7rzzZPI9IvaY3RfsRZTSOh@lists.infradead.org
X-Gm-Message-State: AOJu0YyEi28ECaMX6lZyH4OxIxdneiPHgz1SdSCBEfjy1l6XXNXHqZKT
	SFG4K+94rf06BHa0lFg1Yd1Vyxj1ectOTmTvq0I+v+l2oZ6ecIlbqVPzpigkYvST8Hrxi+swa20
	gGS7TU6qca+EKK+UYX7hZ75LnWbk39rRMFdsSqeJ4SQ==
X-Gm-Gg: ASbGncvbtze+pcCn0XxDsWtVvA8vOgfBBJEqSHPe5WhbK4GclD3UqIb8gG/aw3Bv3Jb
	CFpNGMYLkVGDT7tiSC+e9+4GQot1kWuBq7dMkI4uFsTLkv4jV7/EHno5coNcG3SFaeXun88XfXG
	nAItNVOc5zOgiAy/DZ4hZyx1enabpdJ7X/oMCK1E5LeRKj04cWqd9JLQWlahKA387NUDRV7PzAF
	/ikufakWjowCosMJyVyPHEWW2Tm3wiwB3yfPJ8=
X-Google-Smtp-Source: AGHT+IEqPJ9kigcz2GLj3mP+JOGINamypRE0PiCaaHlUwxbs7HlrGNQFZsWt9jHWryRE9N3BOTU+Nqgodo1ymFIXUx4=
X-Received: by 2002:a05:6512:3c93:b0:55f:552c:f731 with SMTP id
 2adb3069b0e04-56099453ef8mr6704484e87.7.1757489351780; Wed, 10 Sep 2025
 00:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org> <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
In-Reply-To: <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:28:59 +0200
X-Gm-Features: Ac12FXylJ9GUUlvsjAHDZW0ZjH7_XucWxGNpk3CSzJ659744jxYcf8C0LoVlvQM
Message-ID: <CAMRc=Md1kLjELc48-fvjsgpZH+t+kE00v0uMDztubooM_AJ2oQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_082914_358345_7088E5BB 
X-CRM114-Status: GOOD (  13.86  )
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

On Wed, Sep 10, 2025 at 9:19=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Sep 10, 2025 at 10:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
>
> In case you want to take it
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Otherwise I can take it via my tree and then PR to you.
>

I would prefer to apply the whole series directly, this way the
conversion will be done in one go.

Bart

