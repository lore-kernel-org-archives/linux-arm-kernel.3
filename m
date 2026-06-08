Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC3BCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTtvSs/e4atXwoKhD09E3lWjpJ5mSO88VMWBPo2Qa+Q=; b=lUhJW3bOeQwxHd9FrGs5KqLD43
	BBrBoNi3USdaeogR77ifHkdNYcB0Faw0IdBpo1mAtDsAqCYO1D8PCX9JU/f+eDbVMV8LHYbhfg/L3
	zCaFY/dqiX9GAfJ/bTfWphyE6P5R+F2iIVSvy4zHyMJSykQeBFTmvIsBWCI2GGUkuJLS4qK/M3rbv
	PHqY8Z328M1EE+orJkbodmVFff6WzNRB11vKlyrQnBH/XNRzPzyjBXaSqM73J66cyDjSGk1nIZ4Dr
	PmiY8tsar8eLBV3geqd24goVKOyI8SQ9QcU+1AMT3daNAchRBA1uaQtp1SMTC/rnocFvS8s/94wvb
	WLwQyG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcf7-0000000430x-1vIC;
	Mon, 08 Jun 2026 16:17:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcf6-0000000430a-2aNI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:17:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AD4E4445D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 16:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E231F008A5
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780935434;
	bh=WTtvSs/e4atXwoKhD09E3lWjpJ5mSO88VMWBPo2Qa+Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LyueLEj7jp8yMu1AEQixDI8q4B3w+XWSiIw6WEYpDkY3cuAaHkVs+Gkv4r3oFQ+nE
	 j2kEitMrOypDilGIkywdHYwTiG54nerTMKRg+wFacTquoygRP9xid7cpz+jTJSKgyW
	 +abDJZazjpsyZjStWHiiW/goTyCBX6IkYG8xY8+2fwLgB6kacNDSnOUhIlgELABJ8H
	 xljLDTpbnIBYx/FiATjwXyRPT3p9YhztzfUvwTF4kqjYUueHxZKf/ysMkp7zxVHY++
	 dIwlZTpl2ALCGozXK+SRCdBONQkltTbaUrMFKqfaNg83xgGZ4OGeu5bHwlG5KZMyCF
	 GonMhW5EFkO4g==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa5e9a64b4so4734447e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+M/7xXtIWu/umiRc2alUtlTak14rf08r6TMG+5S47uzc7vBOYwFEl+HyGLCWi5pcOsYyck7Qae61VLyvP2LOSh@lists.infradead.org
X-Gm-Message-State: AOJu0YxdPLLcTgwtBN+6g+XH60RFclsDH+7YZEyZQ4FKb4dPxy6cpDX0
	2ngw9NB8GZhCPz5Xany7DMyp7BDKUs+nNg8C7FsJ5yxxitdwmsbEYWMU2GJvrB9LefHgmncEzgp
	xAhX3jEW8ZSsNsrRWh8nnxjHUKLXLyjaRzkpmBofRxQ==
X-Received: by 2002:a05:6512:135a:b0:5aa:74f8:72f4 with SMTP id
 2adb3069b0e04-5aa87beffabmr3825436e87.32.1780935432883; Mon, 08 Jun 2026
 09:17:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:17:09 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:17:09 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-17-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-17-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:17:09 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdWhfR0gQz+cJsks_-L0+fKKXGPg1FKDqt8dSSGr1EA9Q@mail.gmail.com>
X-Gm-Features: AVVi8CdSgzI-OCu4SAMZh4v6VzPB8Cgbp2XhrMRq6YuwW3nSlK1BMg5J-5Z-maM
Message-ID: <CAMRc=MdWhfR0gQz+cJsks_-L0+fKKXGPg1FKDqt8dSSGr1EA9Q@mail.gmail.com>
Subject: Re: [PATCH 16/18] pinctrl: airoha: an7583: remove an7583 prefix from
 variable names
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 7 Jun 2026 02:16:52 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> We have only an7583 specific code in the pinctrl-an7583 kernel module,
> so 'an75831_' prefix is not necessary anymore. Remove it.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

