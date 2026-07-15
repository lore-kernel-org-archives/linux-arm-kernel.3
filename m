Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B46C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1i7b3l9rJpq4HTYvS3RcBvBfTdofsIZ1RrmCSl+AOlc=; b=CGbZSCMLWyxG3V
	pxz0Hv+V0nKM/RiMB1lUXCJ5NVGLe0kHi9g3q3n/JHS0xbQPqH+W+ebBIf15MOE9aipiwQv9WOdQC
	735rbXKxHIe0Q4KGlDz8y8VWvQ0Oh8m7KjlBNa3acnhG39Dkult5O5crIRzqWU4Jteyz9jaBdTnRt
	LPR+YayZFQf5DdKJfChfMbLKxaZZcLJhElH8BucjWTDs4cJgAeOG8aMI+r7PmOKsY9jJtIjjX5j5w
	EFQykJC2DqsxJ+wDzK3Bl79jRA6wg3Pv9qdyyAjcRGUJ55VyYrTRt7BzubduGajrKH5LVfzLNN9RR
	zHow8jpVfebjPAw/iPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1Ae-0000000FFcV-1Kjt;
	Wed, 15 Jul 2026 15:05:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1Ac-0000000FFbc-0t9u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:05:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5DE1423C5
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 15:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F161F01558
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127909;
	bh=1i7b3l9rJpq4HTYvS3RcBvBfTdofsIZ1RrmCSl+AOlc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=NeR+IabXQW17kUJfwecht8YQ/HkK/kLqSIGyZ08BtCEClA+DyIw7EhtiazEb72jUZ
	 DQpRGCli7gqQwUnCVvuYa+FNmzEeJFJnRS5b0U0+jDv0ZnespLIDF+0uvb26hhvdAG
	 YVvyMeplBbKRTNHL6qh6udg33CiElN8xT/5Cy7JYSFlTDpqOT+Aqv7HPeImw2SHyK8
	 2kbtEqX3dYnpRxWHksZuikPpWeMEJtn9buY4GFU9FODT0ljKFabsiBz64G97U8d+UA
	 j+YYL27lNaZqz79nVTunJS9Q9px22wYROhZ2K0jyITz9p+M3S3briPWmy1rSSu5nQx
	 rswOxbLKqXKEQ==
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4896ae35be9so2296925b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:05:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoaEcuWmwhzA0Bo0QfXtXyB3Cm2XNCrs25QuOh/XwWViyzqZl7qHjS5h0lNpw8xTQewVySOQM7QYxO073FgsCgE@lists.infradead.org
X-Gm-Message-State: AOJu0YyxI/2aMoCzYXgD9qW2tx4DIJvw2coGS88qHxjdMyhNwpofHynX
	azYmJ18asz0Toqr+ZDZVBsEsRbBhK8qBMfZ6Eb0+brf57cthJEwz9REtwkCCN3Q5LxmHEvAJkbg
	axFxKCv6+3Jk51A8eXaPSLR1tyWsilkM=
X-Received: by 2002:a05:6808:1b26:b0:495:f67c:d96a with SMTP id
 5614622812f47-4a495eab032mr1747679b6e.12.1784127908616; Wed, 15 Jul 2026
 08:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-7-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-7-phucduc.bui@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 23:04:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v66EfrZLMB3fhpMtHJ=p6+JKr8xo4YoNcUZFbufT-Q7k-A@mail.gmail.com>
X-Gm-Features: AUfX_myL8GPNUfHP8VLcNCxbPlwWk_yA0cgJ1EGx2St68obk-BOfwKmsXMj10Vw
Message-ID: <CAGb2v66EfrZLMB3fhpMtHJ=p6+JKr8xo4YoNcUZFbufT-Q7k-A@mail.gmail.com>
Subject: Re: [PATCH 6/6] ASoC: sunxi: sun8i-codec-analog: Improve probe error handling
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 15, 2026 at 5:56=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Drop the redundant error message after devm_platform_ioremap_resource(),
> which already reports failures, and use dev_err_probe() for regmap
> initialization errors.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

