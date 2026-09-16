Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BBDC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ubbqQ2iB10rGBdoO3Svw7T5tJwvgFmsSmZq/yCqK/Q=; b=MiIrlipqX0+MJ3B0o233hgoS0P
	RQDQBenzA8jb9ZfLHDIjve+0FtfU5qUmuH2p/UnJk2YK0ayYMiLkMwFYQzPlayatFz0W0hmnkqDPP
	1bHJnu3tn7oYsaV6iW1M4eGXngNDD9TeMmsT9HdMLBveX+psEEINgAuBny1f/XQAUjp6vl/g7lMpN
	nOzzn+IIeh6WsvpKGi1OmCF9K+RjHbLpZxvMERIdnKhVzR4plpx6FRYBtvdHhXc/O6+hYb6nvevV8
	nm8iGQCWiCr5MLKWjaCaUIGuANjwVgO+8NHbieg9XgTlpj5MEhcnS7XRsFAR1CKOEiypAHbCC1Uye
	IoMvp7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6paC-00000009Fhz-35dX;
	Wed, 16 Sep 2026 13:21:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6paA-00000009Fhs-2swI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:21:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AAFD44068E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 13:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB691F00893
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 13:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564909;
	bh=9ubbqQ2iB10rGBdoO3Svw7T5tJwvgFmsSmZq/yCqK/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=km321WLzzHyls9sxQEghrtdim+/Y/mD/Cbc1rMcn9s5lw9yHfBVNNFFGKDwxsu4pP
	 0l4YhHqLSkr6CRviA0/nRJlSpAIz65UIwt3hy6iVUnSAbCmUNgU3Xo7th4MzA6FOxP
	 6B0yXahgMgJn7DhVzsrzv16m5NUvB+EHa4aNMaeNI2G7Y0gKBzcobi3XUnwU5G1IiO
	 xxgktVnShsU6CnFDn1d86WQhgZSsCuKP9pA1mGmDeJ2uMbO6rkMcwXrzQdTWQGjYqh
	 FSQbFNcDT7B1IE4f2/b/W69rtWZdFlE0w/z7c/yvm24YVZGvxjQ4aUpLibS5f8+s3b
	 x9xoX9OOJL5fw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso944582e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 06:21:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw2C5nXY97cexY5OV3vI0aCen7kHzPwPdLppBrc6GTZsSjxiYwwBpawpwNcFkCodWYIo1mpo39l/7fnvstUO8yc@lists.infradead.org
X-Gm-Message-State: AFuF++nM4FIAnL7XeeVZvuSQvFJsgDIMMYJh1KoeC07sKPk/ws9sDg/L
	JwX/hCwm1cvRzxibIV+G8dgX61e+cDUa5qK2C0kz9WyPea91Y7vMCySvjSFJ2rcv5dD0ikUbKOP
	5OIS4atAwV+sKWjQlEbz04KPv5Gek80c=
X-Received: by 2002:a05:6512:3b2a:b0:5b7:6568:3039 with SMTP id
 2adb3069b0e04-5b8b665e8cemr751267e87.60.1789564908290; Wed, 16 Sep 2026
 06:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260904123300.36778-1-hemanth.selam@gmail.com> <20260904123300.36778-2-hemanth.selam@gmail.com>
In-Reply-To: <20260904123300.36778-2-hemanth.selam@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:21:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLnaygOq04Nq=GVEoeQUBmODxteKzeQb7Zy910Jkf2c5Tg@mail.gmail.com>
X-Gm-Features: AcwNN1V9RDrjA4DEzm9jSbGNXjjK-Vlq7xZKmf757u08wUHaWSwZ2dAMEx9qn0I
Message-ID: <CAD++jLnaygOq04Nq=GVEoeQUBmODxteKzeQb7Zy910Jkf2c5Tg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, Sep 4, 2026 at 2:33=E2=80=AFPM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:

> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Patches applied. Assisted tags changed to LLM.

Yours,
Linus Walleij

