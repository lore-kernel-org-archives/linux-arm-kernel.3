Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273A4CA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJBXlHq1OFNpmmLLzqbU2cvZX0LaMTVQsIWc7wm7TlQ=; b=Qw8wBNj4Dv/jz8u42yyHSEFYbi
	rqmeEn7Y0KiyvUnWtCtf5mVjVYnihVgSCc3InATJohviNH0mcGWYZVCtOH6d9y2X75cKMOl0UmDJB
	reC4iY5xMHsUPUaR6636I3z854PiXz3guZf5dQ6QHgdHgTiAIz/Y1O6AELhses7i+TA+XkyCzlYhw
	UmcYzDU0ZN5KmQ5fB+Gpq6ud7yJ6vBsYzK0BxB38vOJWdGD1ewiPGsnOY+iK9FMp3gso4T0THze7+
	SNAateBR9V87htHMsoF/4kdKzpkW0530U2Llq0POBu36qpxBWmerycP7HlmIR5Dx4uAhXY7LaaS81
	phwcKLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuDu-0000000677t-3bgn;
	Wed, 30 Sep 2026 13:19:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuDs-0000000677a-25vx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:19:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0777D43B6A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02081F000FF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774387;
	bh=pJBXlHq1OFNpmmLLzqbU2cvZX0LaMTVQsIWc7wm7TlQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l26yM4sRQVQVntMHkuqhI2xr0vqd4R4Pr0zAYb0anDXgiJVFxusSPk+ojkNNpaFiX
	 rspN8E/axPo9owmQx4kCOdtUzUkEUlk4xY8hI1NxSesvaNSsHpwN7aUw6AIvEgM+lV
	 dpk5sTvWf81N1utrrcQB+h/6Y8OAvZWXffGrCgEW/NT2yC6rlqBVRjQic0zuqW6BSD
	 GPM8FQA01wG2vCU+XmL0PNtV7cKU6MUQ1FYOyiJcGZSzonBawEJOy5yOKXi+WRMHi5
	 dTphPBdY8nsZnoSD5wlBFq0FvztD6DshjDBTaDr8+8WHGhziszo/IhgUKVgLDZvDyd
	 HP2e9qU+Hi+Fg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f80e3f72so4587933e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:19:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrcbC8wTEQVJ0hD6FXKRDLRU3AKDrl5Bi8b4Rent4HMccKG+A9SmhvV0rdynwbOFdnUBi7yR38jUz4A84/aFts@lists.infradead.org
X-Gm-Message-State: AFq9FYIKCls4WE2/rKWqorjALajniIEUQVB0nsCXAsyOFW3sAcesvPTp
	Pu81tgrXbbPY1NXqYAkj6Mv8+nFVrgTF1gt1aiuGycwfms0TwtEMpamN0m1QNpbAcyKmzxhFDKj
	s1sjTlaV0DrblgJ3z9+MSinuL/R8F3TU=
X-Received: by 2002:a05:6512:2343:b0:5b8:da5a:937c with SMTP id
 2adb3069b0e04-5ba405fdf29mr644077e87.17.1790774386711; Wed, 30 Sep 2026
 06:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260917180339.49882-1-sinha.aryan03@gmail.com>
In-Reply-To: <20260917180339.49882-1-sinha.aryan03@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:19:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLm2hMOqjAGq7BCAacCnXKJL_yc6u1nkS5EODENVnT-vpA@mail.gmail.com>
X-Gm-Features: AclHuK8Osm-3e1OZINy-_8-iOwx9Q6Y4zfZjr6XqLptuGmWjVabLOIN-BWaHHyc
Message-ID: <CAD++jLm2hMOqjAGq7BCAacCnXKJL_yc6u1nkS5EODENVnT-vpA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: gemini: fix kernel-doc warnings
To: Aryan Sinha <sinha.aryan03@gmail.com>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 17, 2026 at 8:04=E2=80=AFPM Aryan Sinha <sinha.aryan03@gmail.co=
m> wrote:

> struct gemini_pmx documents a virtbase member that does not exist and
> leaves pctl undocumented. struct gemini_pmx_func is missing num_groups.
>
> Drop the stale entry and add the two missing ones. No functional change.
>
> Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>

Patch applied.

Yours,
Linus Walleij

